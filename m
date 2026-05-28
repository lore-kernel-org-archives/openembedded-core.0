Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103DACD5BD5
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 21:17:56 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18119.1779994669282802278
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 11:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PEr1BopT;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: adityags2004@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36ba3ea5c46so356470a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 11:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779994669; x=1780599469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aCrx1dIJczPVSSzXBYjbyrFH9dAHQJts4mOC0KGKAO4=;
        b=PEr1BopTXWVAtcYD2Dj9I1cIjkVXtsLIwiAs4DIYBtterMMIgMhQTK5oxnNIGzvnf8
         3EHsknbe0AKgeJANb3IwlJSf/7w+MmYxcz+0V9G0TsmVK51Yg3dGjn7lIu1uRX6FbADb
         bUilR8fZiYpOalyUh5wM841CNKsNtv7Bg1Vt4hmsDOEmS8nKWlmVA/R2qXGefPQLHp8V
         QhwVW0Tsr/7Sd3SZIUHFkmkgOptv2lPFpY5rvpm3PpEBZlrR+2UcY0F15umfFJqJbrOc
         KPSGoD920tsHqDkHYofZZVEvoEQ41M6zPjQ74ei/JedFIywoiuLYgW43y4GLCZMLz4yz
         /kow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994669; x=1780599469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCrx1dIJczPVSSzXBYjbyrFH9dAHQJts4mOC0KGKAO4=;
        b=A3A5dX8fQcoiFz+tdnp5Oi57Hm7soMkPDBi4IwGiBeVwg1WEZyWWomAEDxS3fmK1x3
         I1fbCAZD3kuE1UTFY8sjmgDl6z57J2e+NB7gX6Q7t8BqlV0EVbP56Te+b0ARROPuBMwX
         nHuD7lCdf1pTPkrFwkBasgshOvXIcPxXrZyOtxcG0IknbgcE+bqXW5VY34Cm0rmUHVx5
         PYpCbyiG4ItrxG6MHCr/3L/61hP24KLEKT/pH+a3TXWdEJO4piooFIOeGQ2JUCsKz/Wo
         MsNk6BjQ8lO8QcXUSXU0S4RhOYSYyOoc9MkpK4VLm1X8+lPbqT+YulPzUO0r/oVVe/kH
         GAnQ==
X-Gm-Message-State: AOJu0YzPVBMY4Rwv2FUpW6JCFuE5jH3vkJ/Baby/F98SmHw9FHVCYPYn
	sdyLxZcbF+T12PPRTpirHwv0aJoXPC1VwLVN2vJA++84eTFD1oOAhWDYeuVd4g4A
X-Gm-Gg: Acq92OFatR5Ggc1TMiZHy1DALkTy+d+R/aOvWynT5b/KS1f0JFD6B6a85MgSHpbwtc/
	2Sj9bCguF9nev4af2iQPWCxASd0JIuZDjmDsBzFKTo7GUSltHTMzBvOJ7V2e4vudv7dh3C5XJRl
	p+VMSgzHOnOOji9tMdw+p/qTBpypNM0gXcrHlp8ABimlmH7zeYjRgXCZRB2vQRVrGtQfRyO1fB7
	F72GAaTYgKQmFtMnYJQLCCxO6Hogd5UrzxWdj3OJt9SrF1l8X73eaF5HVhp3U1QX3gqFyG2NUJF
	7bepBDrqM9vHXi6rozgcBn7/fvVh/vT8JD96gwlljLPHM23To3SHBJCVvwhMU4TsOOwj7BcErei
	MrQlKJYqtjHbeCLrluH+rgHUZzrCOZHM5OCS3KQ1jM7FCCOMltfjfVX6UExBJaax0BqYKrq5t9y
	/RHdsSScuD6K0FOAmWDGPORT6epkjTDs8utzSdGFxfHPNEqf4vVdAA58DZ
X-Received: by 2002:a17:90b:5784:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-36bba6a9a0cmr339311a91.0.1779994668521;
        Thu, 28 May 2026 11:57:48 -0700 (PDT)
Received: from BLR1RLPT00005.localdomain ([103.213.211.203])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b908f8f80sm2220474a91.5.2026.05.28.11.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:57:47 -0700 (PDT)
From: Aditya GS <adityags2004@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	joaomarcos.costa@bootlin.com,
	ross.burton@arm.com,
	randy.macleod@windriver.com,
	Aditya GS <adityags2004@gmail.com>
Subject: [PATCH] gawk: backport randtest stability fix
Date: Fri, 29 May 2026 00:27:22 +0530
Message-Id: <20260528185722.671-1-adityags2004@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 21:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237728

Backport upstream fix to improve stability of randtest.sh by
retrying when sigma is too small, avoiding intermittent failures.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=16254

Signed-off-by: Aditya GS <adityags2004@gmail.com>
---
 .../gawk/files/randtest-fix.patch             | 139 ++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.3.0.bb      |   1 +
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/files/randtest-fix.patch

diff --git a/meta/recipes-extended/gawk/files/randtest-fix.patch b/meta/recipes-extended/gawk/files/randtest-fix.patch
new file mode 100644
index 0000000000..0b813e667e
--- /dev/null
+++ b/meta/recipes-extended/gawk/files/randtest-fix.patch
@@ -0,0 +1,139 @@
+From f2250f4bc864913437619af7a9834a1c24915acd Mon Sep 17 00:00:00 2001
+From: "Arnold D. Robbins" <arnold@skeeve.com>
+Date: Thu, 28 May 2026 09:52:41 -0400
+Subject: [PATCH] Improve test/randtest.sh.
+
+Backport upstream fix to improve stability of randtest.sh by retrying
+when sigma is too small, avoiding intermittent failures.
+
+Upstream-Status: Backport
+[https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=f2250f4bc864913437619af7a983
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
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.0.bb
index ac9d8500d6..06184a4b48 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
@@ -18,6 +18,7 @@ PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://0001-m4-readline-add-missing-includes.patch \
            file://run-ptest \
+	   file://randtest-fix.patch \
            "
 
 SRC_URI[sha256sum] = "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"
-- 
2.34.1


