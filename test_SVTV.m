

clc
clear all
close all

%=================================================================
%data loading
I = double(imread('10.png'))./255;%load the original image
load 10n05%load the degraded image
%=================================================================

%=================================================================
%parameter setting
[m,n,c] = size(I);
N = m*n*c;
sigma = 0.02;%noise level
parameter.deblur = 0;%0 for denoising problem
parameter.blurkernal = fspecial('gaussian',[15,15],1);%blur kernal
parameter.mu = 0.1;%parameter for the value correction term
parameter.beta = 0.01;%parameter for ADMM penalty
tau = 0.05;
parameter.alpha = tau*sqrt((sigma^2)*N);%regularization parameter
parameter.iters = 200;%iteration numbers
parameter.epsilon = 1*1e-6;%stopping criteria
%=================================================================

%=================================================================
%SVTV restoration
IR = SVTV_ADMM(ID, parameter);
%=================================================================










