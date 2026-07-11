Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A00C44501
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 12:36:40 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4108.1783773391537064604
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 05:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=csZI8/xS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so8808315e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783773390; x=1784378190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KnXqZnfBgBCQdg2O9tfokxCe2Jd2GvYSSTEByoI3QUc=;
        b=csZI8/xSV52cPBnHPK3PnSJBKDbk4gkBRju7Iwl904lWt003fWWaxqzzWGA+FP9doP
         RT4oprht2i5j/lAjozzyXCJLok0K7G3MyF/VAXyds+bBs50UShIVfDo1GQuyw0JS4msD
         Fw+McKtVMKJqLGp8h8tMQG7+1Xclnb2ui2cQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783773390; x=1784378190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KnXqZnfBgBCQdg2O9tfokxCe2Jd2GvYSSTEByoI3QUc=;
        b=icN+bBaWgEUfv1ZwU4ytYAVWSYOvUCnvWdDp71BhlE1Qcr/vs4PcmCFVyB9zvaVxBS
         qRWOxy2h8XhyHp3V9wgEahoA/miRwTfJhsy57dIzpKbo/ZS5gHpZnJnZbNFbB3rK4UkS
         YTC2vg1pDzaLDUJbCvPLX5tUp+iWbulnWnN02bN/Vk8gLm745bbomwGR3cMyXdYTFG4i
         DiJPNH4n8cwHysHZmOsTB47df1tHNku06Z6Hul8YnuHOKzAkVpGi/3S328Fe+zrEF6L8
         34BjTvzPOw10gRioX/qVmpTaiWvI1tBD8tDvjIUW0OR9N2sUX3GuSEdxlsz7ZJe7/Ha5
         uCJg==
X-Gm-Message-State: AOJu0Yxe8kgZiQTtVlmhlKYOpGHKZVeC707REPNVgUX2mp4oEkKwL2oV
	MRStSofPU5d6TMEpmENAuAuzjyYnvfBeV/IJ719/+o6eDgXp3rKVgp7cHCx0ncnGUHBywiaBsYj
	54g/kpRc=
X-Gm-Gg: AfdE7ckx0id+DjMcqbYn2KMGx24ql7/tPjKhmRpYZtad/0l+M+Pg9CHAfSzZkNXaeB4
	Dme4dhtbACOERILrk8KDPSCyVa80LDjCqiZzfeRbZOGDbcNUwBD8luHGPxdXUmhDIZTh2zpgXlK
	TzYeAYGXPN2gFTmrRV1ktxSZbb2zNGMI4Doj9r+pQG4XV13LtLDPyybBJ6KAWC5Nk3ECmOUCg5M
	DJPpld5Ha4wV9svlkk2YkSSDP09PEbhS8x6BUC6AC95kv1BExgteEO4dV2XLvo6drgZHuztn7iL
	ylG0at6F7eQlDA1NPMHLdAj62hQ0PsPCK0rk8GC9UznABSbxraZLvPgFu5V8n0bRq1S1TUF2C0p
	8/5pY0VgoKY5GAfBfnDDityd620bwOmz8/V+JO+R6sTrfb52O/qzHnKVSqQ2/5GD/n4RRcf/9Wm
	Kkl0CS0gD2y5jXwib0j/RIuJeaGAzRvpzM+nZZml40QA==
X-Received: by 2002:a05:600c:45d4:b0:493:e49e:f58 with SMTP id 5b1f17b1804b1-493f87db387mr23668765e9.4.1783773389398;
        Sat, 11 Jul 2026 05:36:29 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2004:2e5c:aef2:b707])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm77172097f8f.17.2026.07.11.05.36.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 05:36:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] gawk: upgrade 5.4.0 -> 5.4.1
Date: Sat, 11 Jul 2026 13:36:20 +0100
Message-ID: <20260711123626.1583730-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711123626.1583730-1-richard.purdie@linuxfoundation.org>
References: <20260711123626.1583730-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 12:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240711

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gawk/files/randtest-fix.patch             | 140 ------------------
 ...c-re-enable-disabled-printf-features.patch |   8 +-
 .../gawk/{gawk_5.4.0.bb => gawk_5.4.1.bb}     |   3 +-
 3 files changed, 5 insertions(+), 146 deletions(-)
 delete mode 100644 meta/recipes-extended/gawk/files/randtest-fix.patch
 rename meta/recipes-extended/gawk/{gawk_5.4.0.bb => gawk_5.4.1.bb} (96%)

diff --git a/meta/recipes-extended/gawk/files/randtest-fix.patch b/meta/recipes-extended/gawk/files/randtest-fix.patch
deleted file mode 100644
index ac26eef8d14..00000000000
--- a/meta/recipes-extended/gawk/files/randtest-fix.patch
+++ /dev/null
@@ -1,140 +0,0 @@
-From f2250f4bc864913437619af7a9834a1c24915acd Mon Sep 17 00:00:00 2001
-From: "Arnold D. Robbins" <arnold@skeeve.com>
-Date: Thu, 28 May 2026 09:52:41 -0400
-Subject: [PATCH] Improve test/randtest.sh.
-
-Backport upstream fix to improve stability of randtest.sh by retrying
-when sigma is too small, avoiding intermittent failures.
-
-Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=f2250f4bc864913437619af7a983]
-
-Signed-off-by: Aditya GS <adityags2004@gmail.com>
-
----
-
-diff --git a/test/randtest.sh b/test/randtest.sh
-index 597376a8..6ae6f830 100755
---- a/test/randtest.sh
-+++ b/test/randtest.sh
-@@ -45,68 +45,77 @@ $AWK 'BEGIN{
-     nsamples=('$NSAMPLES');
-     max_allowed_sigma=('$MAX_ALLOWED_SIGMA');
-     nruns=('$NRUNS');
--    for(tau=0;tau<nsamples/2;tau++) corr[tau]=0;
-+    max_retries=5
- 
--    for(run=0;run<nruns;run++) {
--	sum=0;
-+    for (retry=0; retry<max_retries; retry++) {
-+        for(tau=0; tau<nsamples/2; tau++) corr[tau]=0;
- 
--	# Fill an array with a sequence of samples that are a
--	# function of pairs of rand() values.
-+        for(run=0; run<nruns; run++) {
-+            sum=0;
- 
--	for(i=0;i<nsamples;i++) {
--	   samp[i]=((rand()-0.5)*(rand()-0.5))^2;
--	   sum=sum+samp[i];
--	   }
-+	    # Fill an array with a sequence of samples that are a
-+	    # function of pairs of rand() values.
- 
--	# Subtract off the mean of the sequence:
-+            for(i=0; i<nsamples; i++) {
-+                samp[i]=((rand()-0.5)*(rand()-0.5))^2;
-+	        sum=sum+samp[i];
-+            }
- 
--	mean=sum/nsamples;
--	for(i=0;i<nsamples;i++) samp[i]=samp[i]-mean;
-+	    # Subtract off the mean of the sequence:
- 
--	# Calculate an autocorrelation function on the sequence.
--	# Because the values of rand() should be independent, there
--	# should be no peaks in the autocorrelation.
-+	    mean=sum/nsamples;
-+	    for(i=0;i<nsamples;i++) samp[i]=samp[i]-mean;
- 
--	for(tau=0;tau<nsamples/2;tau++) {
--	    sum=0;
--	    for(i=0;i<nsamples/2;i++) sum=sum+samp[i]*samp[i+tau];
--	    corr[tau]=corr[tau]+sum;
--	    }
-+	    # Calculate an autocorrelation function on the sequence.
-+	    # Because the values of rand() should be independent, there
-+	    # should be no peaks in the autocorrelation.
- 
--	}
--    # Normalize the autocorrelation to the tau=0 value.
-+            for(tau=0; tau<nsamples/2; tau++) {
-+	        sum=0;
-+	        for(i=0;i<nsamples/2;i++) sum=sum+samp[i]*samp[i+tau];
-+	        corr[tau]=corr[tau]+sum;
-+            }
- 
--    max_corr=corr[0];
--    for(tau=0;tau<nsamples/2;tau++) corr[tau]=corr[tau]/max_corr;
-+        }
-+        # Normalize the autocorrelation to the tau=0 value.
- 
--    # OPTIONALLY Print out the autocorrelation values:
-+        max_corr=corr[0];
-+        for(tau=0;tau<nsamples/2;tau++) corr[tau]=corr[tau]/max_corr;
- 
--    # for(tau=0;tau<nsamples/2;tau++) print tau, corr[tau] > "pairpower_corr.data";
-+        # OPTIONALLY Print out the autocorrelation values:
- 
--    # Calculate the sigma for the non-zero tau values: 
-+        # for(tau=0;tau<nsamples/2;tau++) print tau, corr[tau] > "pairpower_corr.data";
- 
--    power_sum=0;
-+        # Calculate the sigma for the non-zero tau values: 
- 
--    for(tau=1;tau<nsamples/2;tau++) power_sum=power_sum+(corr[tau])^2;
-+        power_sum=0;
- 
--    sigma=sqrt(power_sum/(nsamples/2-1));
-+        for(tau=1;tau<nsamples/2;tau++) power_sum=power_sum+(corr[tau])^2;
- 
--    # See if any of the correlations exceed a reasonable number of sigma:
-+        sigma=sqrt(power_sum/(nsamples/2-1));
- 
--    passed=1;
--    for(tau=1;tau<nsamples/2;tau++) {
--	if ( abs(corr[tau])/sigma > max_allowed_sigma ) {
--	    print "Tau=", tau ", Autocorr=", corr[tau]/sigma, "sigma";
--	    passed=0;
--	    }
-+        if (sigma < 1e-6) {
-+            print "Sigma too small, retrying run", retry
-+            continue
-         }
--    if(!passed) {
--	print "Test failed."
--	exit(1);
-+
-+        # See if any of the correlations exceed a reasonable number of sigma:
-+
-+        for(tau=1;tau<nsamples/2;tau++) {
-+            if (abs(corr[tau])/sigma > max_allowed_sigma) {
-+                print "Tau=", tau ", Autocorr=", corr[tau]/sigma, "sigma";
-+                print "Test failed."
-+                exit 1
-+            }
-         }
--    else exit (0);
-+
-+        exit 0
-     }
- 
-+    print "Test failed after retries due to unstable sigma"
-+    exit 1
-+}
-+
- function abs(abs_input) { return(sqrt(abs_input^2)) ; }
- '
- 
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-printf-features.patch b/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-printf-features.patch
index bcbc5695314..882edca1122 100644
--- a/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-printf-features.patch
+++ b/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-printf-features.patch
@@ -1,4 +1,4 @@
-From 9ce3184188e3fa275fde0258a165f4446a6e80f7 Mon Sep 17 00:00:00 2001
+From 53808cbdab1d12c99a4fbadf4ea134b98664e8c7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 12:13:58 +0100
 Subject: [PATCH] configure.ac: re-enable disabled printf features
@@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0ccd460..7df7e5b 100644
+index 471fbc1..d7d173a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -400,7 +400,7 @@ int main()
+@@ -402,7 +402,7 @@ int main()
  ])],
  	has_f_format=yes,
  	has_f_format=no,
@@ -24,7 +24,7 @@ index 0ccd460..7df7e5b 100644
  )
  if test "$has_f_format" = yes
  then
-@@ -429,7 +429,7 @@ int main()
+@@ -431,7 +431,7 @@ int main()
  ])],
  	has_a_format=yes,
  	has_a_format=no,
diff --git a/meta/recipes-extended/gawk/gawk_5.4.0.bb b/meta/recipes-extended/gawk/gawk_5.4.1.bb
similarity index 96%
rename from meta/recipes-extended/gawk/gawk_5.4.0.bb
rename to meta/recipes-extended/gawk/gawk_5.4.1.bb
index 4193456c14f..8e8bc34152f 100644
--- a/meta/recipes-extended/gawk/gawk_5.4.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.4.1.bb
@@ -28,10 +28,9 @@ PACKAGECONFIG[pma-if-64bit] = "--enable-pma,--disable-pma, "
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.xz \
            file://run-ptest \
            file://0001-configure.ac-re-enable-disabled-printf-features.patch \
-           file://randtest-fix.patch \
            "
 
-SRC_URI[sha256sum] = "3dd430f0cd3b4428c6c3f6afc021b9cd3c1f8c93f7a688dc268ca428a90b4ac1"
+SRC_URI[sha256sum] = "07f6f7342b7febe4313fc2c2542ad93d64fe20ad8717200109f105a826f5fd37"
 
 inherit autotools gettext texinfo update-alternatives
 

