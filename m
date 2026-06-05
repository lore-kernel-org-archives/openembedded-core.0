Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF62CD6E5D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 07:03:39 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2306.1780639854007783718
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 23:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VUVsEVra;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: adityags2004@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0b944f6edso16119355ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 23:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780639853; x=1781244653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OdguyOdkx56IuRiXI6grAHH0+vA7vqdn50nZ+O5uLmc=;
        b=VUVsEVrayFqJiNNvSWAsx9TZ/oKozmY0x8eYiVySreozvQDx9xIz2DPHNsoP9Xy4yN
         2e3yEOpW+MtMca3Rdq8k52fqKbxXV9w1Q3/D5+Bult6qJGQHn/jxsQEjpXCpaTLpK08a
         3vnsGEeJStf5kxQRyGH2pXVUPHaeJZ+/h6rvbKkvmj5CqFiLu3oh/YQMt1wIE1W9MrDQ
         dSR97hVkcrhhMB7wmpS+ZynlYdNXSY008A2aLWV2ptNGddfPLT3n++f5y7kAZpwtM/DJ
         ECMVwCk9C1Partgan+VlKpEMJgYu54srUot5g/LoPfoiQixwEveq1t6lTgl7E5irm2am
         K/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780639853; x=1781244653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdguyOdkx56IuRiXI6grAHH0+vA7vqdn50nZ+O5uLmc=;
        b=q2Z5/3J7QmfBy0OYm/YTPLrCPZbRGhLG4ECf0yhrKxXsS+7G9xeCpGAQhOuvmR8TMF
         +DsWup26f7UTNLpVOkgECGUEjTd7X1KbvsmvLrTm7TsZPHm+p0JyM5eppHCiLYpuUo2w
         WZN3/n71H5zBj2+OSFGoOxs6PQUA4NWDEqIBYe5z6MOgjHHcEb4TaruxLZDZJFAhSy+o
         +JbJ5aLS/QrwwDEheh3oWldaTpmu531fjL+0KtkhEtxdZyddSr2+pjoI0YC1Nn0i0xrL
         BoFNX3g0JzrRhZIYTxwAUa6HM8rtRxGKHQ0Y+fzXiI9UShSckmdxUQyeYB0nmdL7dFPQ
         gSLA==
X-Gm-Message-State: AOJu0YxFgB+ec2+wtSFIzwoZ5iqqUN2MhPtHEtQe7BsoUl8EnftODp75
	v17vS4qoy7wuN+RVIhwIIJuGti4jCd8QT22Qo3zCz9Q0uxAbVprDpd+eE9uySQ==
X-Gm-Gg: Acq92OF1/CXFNIuTqqkYH0sHVSKjhaqxRfL5tpfgwp8M/HnZ0/VoOgIDU273PJ+dLKk
	cjlQ6BEjJLo9aPInNVSm/fLCVDSrWN2LwPJcqYEVu1InKYFnTrm8kIpNpiOkaI2woMdFTGXpRsS
	VPugGHUoLzVx5wQpiIcNx4fLC9G3jhLCbh7kLsqVerPacAx7YcJolZHR3Sxw4O5fmcDY5IeTQIU
	e2dNYgUMResbYBgT6v7SiLytVlbWdsHp8cIfa7Em6un0ELS8llOPiNa1QtmbueKVtv6OqsJD8qI
	4qrMSnEcbDnz++vFbTPgn5NHJuqjXiN/GfVS49KvICGmLI2faS7SF1z8Yk7Zrp9NcbNYY7aGbTy
	ezzpsE0Qdy5dm7k7zSUnuEpAX/gVSrCTcOiVYJAyCG0iEpWDdWyLcpyKWYDf7h6JfPzIbXRj1Np
	yu8LBS6mBqgShyygMTiYyl1qkHEdacxMirIl/o45nld11NRntr7BZ6MOXOZrl2nEsZOzZO33zWr
	vAZMb184h2mzE/5aszESshOSKlBMQ==
X-Received: by 2002:a17:903:1a06:b0:2bf:379b:53d2 with SMTP id d9443c01a7336-2c1e7e866dcmr22858005ad.15.1780639853104;
        Thu, 04 Jun 2026 23:10:53 -0700 (PDT)
Received: from BLR1RLPT00005.localdomain ([152.57.135.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d69csm79751165ad.2.2026.06.04.23.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:10:52 -0700 (PDT)
From: Aditya GS <adityags2004@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	joaomarcos.costa@bootlin.com,
	ross.burton@arm.com,
	randy.macleod@windriver.com,
	Aditya GS <adityags2004@gmail.com>
Subject: [PATCH] gawk: improve randtest stability
Date: Fri,  5 Jun 2026 11:40:30 +0530
Message-Id: <20260605061030.1182-1-adityags2004@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 07:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238145

Backport upstream fix to improve stability of randtest.sh by
retrying when sigma is too small, avoiding intermittent failures.

[YOCTO #16254]

Signed-off-by: Aditya GS <adityags2004@gmail.com>
---
 .../gawk/files/randtest-fix.patch             | 136 ++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.4.0.bb      |   1 +
 2 files changed, 137 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/files/randtest-fix.patch

diff --git a/meta/recipes-extended/gawk/files/randtest-fix.patch b/meta/recipes-extended/gawk/files/randtest-fix.patch
new file mode 100644
index 0000000000..ee1950e8bc
--- /dev/null
+++ b/meta/recipes-extended/gawk/files/randtest-fix.patch
@@ -0,0 +1,136 @@
+From f2250f4bc864913437619af7a9834a1c24915acd Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Thu, 28 May 2026 09:52:41 -0400
+Subject: Improve test/randtest.sh.
+
+Upstream-Status: Backport
+https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=f2250f4bc864913437619af7a9834a1c24915acd
+
+---
+
+diff --git a/test/randtest.sh b/test/randtest.sh
+index 597376a8..6ae6f830 100755
+--- a/test/randtest.sh
++++ b/test/randtest.sh
+@@ -45,68 +45,77 @@ $AWK 'BEGIN{
+     nsamples=('$NSAMPLES');
+     max_allowed_sigma=('$MAX_ALLOWED_SIGMA');
+     nruns=('$NRUNS');
+-    for(tau=0;tau<nsamples/2;tau++) corr[tau]=0;
++    max_retries=5
+ 
+-    for(run=0;run<nruns;run++) {
+-	sum=0;
++    for (retry=0; retry<max_retries; retry++) {
++        for(tau=0; tau<nsamples/2; tau++) corr[tau]=0;
+ 
+-	# Fill an array with a sequence of samples that are a
+-	# function of pairs of rand() values.
++        for(run=0; run<nruns; run++) {
++            sum=0;
+ 
+-	for(i=0;i<nsamples;i++) {
+-	   samp[i]=((rand()-0.5)*(rand()-0.5))^2;
+-	   sum=sum+samp[i];
+-	   }
++	    # Fill an array with a sequence of samples that are a
++	    # function of pairs of rand() values.
+ 
+-	# Subtract off the mean of the sequence:
++            for(i=0; i<nsamples; i++) {
++                samp[i]=((rand()-0.5)*(rand()-0.5))^2;
++	        sum=sum+samp[i];
++            }
+ 
+-	mean=sum/nsamples;
+-	for(i=0;i<nsamples;i++) samp[i]=samp[i]-mean;
++	    # Subtract off the mean of the sequence:
+ 
+-	# Calculate an autocorrelation function on the sequence.
+-	# Because the values of rand() should be independent, there
+-	# should be no peaks in the autocorrelation.
++	    mean=sum/nsamples;
++	    for(i=0;i<nsamples;i++) samp[i]=samp[i]-mean;
+ 
+-	for(tau=0;tau<nsamples/2;tau++) {
+-	    sum=0;
+-	    for(i=0;i<nsamples/2;i++) sum=sum+samp[i]*samp[i+tau];
+-	    corr[tau]=corr[tau]+sum;
+-	    }
++	    # Calculate an autocorrelation function on the sequence.
++	    # Because the values of rand() should be independent, there
++	    # should be no peaks in the autocorrelation.
+ 
+-	}
+-    # Normalize the autocorrelation to the tau=0 value.
++            for(tau=0; tau<nsamples/2; tau++) {
++	        sum=0;
++	        for(i=0;i<nsamples/2;i++) sum=sum+samp[i]*samp[i+tau];
++	        corr[tau]=corr[tau]+sum;
++            }
+ 
+-    max_corr=corr[0];
+-    for(tau=0;tau<nsamples/2;tau++) corr[tau]=corr[tau]/max_corr;
++        }
++        # Normalize the autocorrelation to the tau=0 value.
+ 
+-    # OPTIONALLY Print out the autocorrelation values:
++        max_corr=corr[0];
++        for(tau=0;tau<nsamples/2;tau++) corr[tau]=corr[tau]/max_corr;
+ 
+-    # for(tau=0;tau<nsamples/2;tau++) print tau, corr[tau] > "pairpower_corr.data";
++        # OPTIONALLY Print out the autocorrelation values:
+ 
+-    # Calculate the sigma for the non-zero tau values: 
++        # for(tau=0;tau<nsamples/2;tau++) print tau, corr[tau] > "pairpower_corr.data";
+ 
+-    power_sum=0;
++        # Calculate the sigma for the non-zero tau values: 
+ 
+-    for(tau=1;tau<nsamples/2;tau++) power_sum=power_sum+(corr[tau])^2;
++        power_sum=0;
+ 
+-    sigma=sqrt(power_sum/(nsamples/2-1));
++        for(tau=1;tau<nsamples/2;tau++) power_sum=power_sum+(corr[tau])^2;
+ 
+-    # See if any of the correlations exceed a reasonable number of sigma:
++        sigma=sqrt(power_sum/(nsamples/2-1));
+ 
+-    passed=1;
+-    for(tau=1;tau<nsamples/2;tau++) {
+-	if ( abs(corr[tau])/sigma > max_allowed_sigma ) {
+-	    print "Tau=", tau ", Autocorr=", corr[tau]/sigma, "sigma";
+-	    passed=0;
+-	    }
++        if (sigma < 1e-6) {
++            print "Sigma too small, retrying run", retry
++            continue
+         }
+-    if(!passed) {
+-	print "Test failed."
+-	exit(1);
++
++        # See if any of the correlations exceed a reasonable number of sigma:
++
++        for(tau=1;tau<nsamples/2;tau++) {
++            if (abs(corr[tau])/sigma > max_allowed_sigma) {
++                print "Tau=", tau ", Autocorr=", corr[tau]/sigma, "sigma";
++                print "Test failed."
++                exit 1
++            }
+         }
+-    else exit (0);
++
++        exit 0
+     }
+ 
++    print "Test failed after retries due to unstable sigma"
++    exit 1
++}
++
+ function abs(abs_input) { return(sqrt(abs_input^2)) ; }
+ '
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extended/gawk/gawk_5.4.0.bb
index d7211f28f3..71e7ddb31f 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.0.bb
@@ -28,6 +28,7 @@ PACKAGECONFIG[pma-if-64bit] = "--enable-pma,--disable-pma, "
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \
            file://run-ptest \
            file://0001-configure.ac-re-enable-disabled-printf-features.patch \
+	   file://randtest-fix.patch \
            "
 
 SRC_URI[sha256sum] = "3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc268ca428a90b4ac1"
-- 
2.34.1


