rm(list=ls())
graphics.off()

# for reproducibility
set.seed(777)

# hBayesDM lib
library('hBayesDM')

# TRAINING
lba_model = choiceRT_lba('choose', niter=5000, nwarmup=2000, nchain=4, ncore=4, saveDir = './')  # For fitting data
lba_model = modelData # Load .RData from folder

# Extracting hBayesDM variables
parVels = lba_model$parVals
individual_param = lba_model$allIndPars
fit = lba_model$fit

# Simple plot
plot(lba_model, type='trace',fontSize=11)
plot(lba_model, type='trace',inc_warmup=T)
plot(lba_model, type='dist')
plot(lba_model, type='simple')

rh = rhat(fit = lba_model)
# names of parameters
indpar.Names = row.names(rh)  # All row name list
mu_names = grep('mu', indpar.Names, value=T)
sigma_names = grep('sigma_v', indpar.Names, value=T)
A_names = grep('^A', indpar.Names, value=T)
d_names = grep('^d', indpar.Names, value=T)
tau_names = grep('^tau', indpar.Names, value=T)
v11_names = grep('1,1]$', indpar.Names, value=T)[c(3:26)]
v12_names = grep('1,2]$', indpar.Names, value=T)[c(3:26)]
v21_names = grep('2,1]$', indpar.Names, value=T)[c(3:26)]
v22_names = grep('2,2]$', indpar.Names, value=T)[c(3:26)]
v31_names = grep('3,1]$', indpar.Names, value=T)[c(3:26)]
v32_names = grep('3,2]$', indpar.Names, value=T)[c(3:26)]
v41_names = grep('4,1]$', indpar.Names, value=T)[c(3:26)]
v42_names = grep('4,2]$', indpar.Names, value=T)[c(3:26)]

# Plot individual parameters; 24 subjects
plotInd(lba_model, mu_names, show_density = TRUE)
plotInd(lba_model, sigma_names, show_density = TRUE)
plotInd(lba_model, A_names, show_density = TRUE)
plotInd(lba_model, d_names, show_density = TRUE)
plotInd(lba_model, tau_names, show_density = TRUE)
plotInd(lba_model, v11_names, show_density = TRUE)
plotInd(lba_model, v12_names, show_density = TRUE)
plotInd(lba_model, v21_names, show_density = TRUE)
plotInd(lba_model, v22_names, show_density = TRUE)
plotInd(lba_model, v31_names, show_density = TRUE)
plotInd(lba_model, v32_names, show_density = TRUE)
plotInd(lba_model, v41_names, show_density = TRUE)
plotInd(lba_model, v42_names, show_density = TRUE)
