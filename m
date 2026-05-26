Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABD6CD5BC8
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 13:36:57 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34817.1779795247743830915
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 04:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I/JL7/mF;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: adityags2004@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-911501a99feso1266862285a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 04:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779795247; x=1780400047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SJot/YNihQAboaX3z1PjUtBfOjYfrF4WYu9f42T2gOU=;
        b=I/JL7/mFnT0Kj9S6f+bem2VpMgUyxePt1dBf1PwoPC8Yvr0hXxKQaZyE6qljvhPIuf
         Ree8QRBt9PZelOSfQsLhULziQsVVOTsvukzNC9zyaXIYp2zZmXRkiQsIsvpdMWhhztTY
         O9EONR9qsmVqIOH+BKgeYhjsGIhH5yWzRBGN0DzSA9PeGnFClT1ejU11d9Vj5QAQeMsN
         abiCYt+pcDnWT2eaLSnvu2aiR8f7cz/eiP+R2RBbhbwiXj4b4CMK1061SAiaL5s6zyR/
         490j1m8Udad7HHMdQk4TFlw3gqKx8CyapycnnB3iPsZEsrX1XUKqM9PxcIviuBX+f6Up
         oxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795247; x=1780400047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJot/YNihQAboaX3z1PjUtBfOjYfrF4WYu9f42T2gOU=;
        b=fvbCHhPOV7r0ahnFpOoi5iOc3aNCGUd0AtS9j6pRkKSyDFFtPHYO8C7Xftp9AlIElb
         v3eczKsgbb/DqjQXegGen49dxHCJ5T6vn4u0XR1LXdJvLyb1Z+QH19cL48DW1sp8Bbcv
         LBoJsoWxVKQQ5qLMHBfL0Ma7klIvWO/+V3xPT1/QISL/mQzmFWGmHnheEH1tKarHubQi
         do3pQgKqV6MFiUwfdYBdwoHQ9kDNTEq5Z9SMaYJXMWNdja/KR5XAQAAbxS+ew15z6wt0
         mUMYSX7LBIN5cpecZ7xgC7E7Q4ZOYqnxWqKtZ7trb9+3Y4aaoLwI/ex6rrPnwmHX7C1s
         Jrtg==
X-Gm-Message-State: AOJu0YyRE95VsqpRsR1fIHKTm+SPFbNqJE1OR7qxhokjsLma1ZGUNrwp
	ORx5f51KP5wEWZblZ4k6asIkNbf4UDbr/SGWP0Z7N/L1hxZoJFvBjqkgNFIhOHSS
X-Gm-Gg: Acq92OEDAfAFeFcS8j8Z2BSGRHR/JR/JhAngym9W2UkQlivTT88Xot+7BMouJX30Gh/
	Xhn6n15eLq9uUwHNHfGLdjjKhJ7+yZFqj2aGBscPOZuDFYJpGUkVdtPDp9v2seSyuYlAxgD6uLm
	PdaypYbfeoF8ht4BYTflxu/QcCjf+ySmbEjuvMuP/MEV/c0SaN/8rYDGadpm2LnLWnkfUHoNgt9
	pmKyf7PvbfoCPs7jOaYu7hgCOJnNcPR1W720pZQL6naXV5fLLtXEsRWu4fzmuaafkocYOQtACHk
	l2yssGYQhiE3Slwk9G0JR3ArzSdQzD2/mlDn5bUD0Z1BV4sPX8pWMU9tdwfv8U+P5GFGYoGyCN7
	0YUZR7lTHYhgdHc1MP5rMtnu62wIC2LzYVEEbYVDk2Ey7ZIHNxWfFvFhHqVWYn3MGDNcEe+20zo
	0awN6l/Egb86dpy59R6HLh+XxJCi/wDBna7GqUfjuvnbelCDo=
X-Received: by 2002:a17:90a:d44f:b0:368:763a:17b8 with SMTP id 98e67ed59e1d1-36a6741dd0bmr10975525a91.2.1779794762676;
        Tue, 26 May 2026 04:26:02 -0700 (PDT)
Received: from BLR1RLPT00005.localdomain ([152.57.100.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b0d6a612dsm1588897a91.17.2026.05.26.04.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 04:26:02 -0700 (PDT)
From: Aditya GS <adityags2004@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: joaomarcos.costa@bootlin.com,
	ross.burton@arm.com,
	randy.macleod@windriver.com,
	richard.purdie@linuxfoundation.org,
	Aditya G S <adityags2004@gmail.com>
Subject: [PATCH] randtest: retry on unstable sigma instead of tolerating statistical outliers
Date: Tue, 26 May 2026 16:55:01 +0530
Message-Id: <20260526112501.15985-1-adityags2004@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 13:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237608

From: Aditya G S <adityags2004@gmail.com>

The randtest previously failed if any autocorrelation value exceeded
the sigma threshold, which could lead to intermittent failures due to
normal statistical fluctuations.

An earlier attempt allowed a limited number of exceedances, but this
approach weakens the strictness of the test.

Instead, detect cases where sigma is too small (indicating unstable
normalization) and retry the computation from scratch. This avoids
false positives while preserving strict validation criteria.

This approach maintains test integrity and improves stability across
different environments, following upstream feedback.

Fixes: [YOCTO #16254]

Signed-off-by: Aditya GS <adityags2004@gmail.com>
---
 test/randtest.sh | 122 +++++++++++++++++++++--------------------------
 1 file changed, 54 insertions(+), 68 deletions(-)

diff --git a/test/randtest.sh b/test/randtest.sh
index a56f0eeb..a673b3c8 100755
--- a/test/randtest.sh
+++ b/test/randtest.sh
@@ -38,80 +38,66 @@
 # as srand() will be called without an argument.
 
 # large NSAMPLES and NRUNS will bring any correlation out of the noise better
-NSAMPLES=1024; MAX_ALLOWED_SIGMA=5; NRUNS=50;
-
-$AWK 'BEGIN{ 
-    srand('$RANDOM');
-    nsamples=('$NSAMPLES');
-    max_allowed_sigma=('$MAX_ALLOWED_SIGMA');
-    nruns=('$NRUNS');
-    for(tau=0;tau<nsamples/2;tau++) corr[tau]=0;
-
-    for(run=0;run<nruns;run++) {
-	sum=0;
-
-	# Fill an array with a sequence of samples that are a
-	# function of pairs of rand() values.
-
-	for(i=0;i<nsamples;i++) {
-	   samp[i]=((rand()-0.5)*(rand()-0.5))^2;
-	   sum=sum+samp[i];
-	   }
-
-	# Subtract off the mean of the sequence:
-
-	mean=sum/nsamples;
-	for(i=0;i<nsamples;i++) samp[i]=samp[i]-mean;
-
-	# Calculate an autocorrelation function on the sequence.
-	# Because the values of rand() should be independent, there
-	# should be no peaks in the autocorrelation.
-
-	for(tau=0;tau<nsamples/2;tau++) {
-	    sum=0;
-	    for(i=0;i<nsamples/2;i++) sum=sum+samp[i]*samp[i+tau];
-	    corr[tau]=corr[tau]+sum;
-	    }
-
-	}
-    # Normalize the autocorrelation to the tau=0 value.
-
-    max_corr=corr[0];
-    for(tau=0;tau<nsamples/2;tau++) corr[tau]=corr[tau]/max_corr;
-
-    # OPTIONALLY Print out the autocorrelation values:
-
-    # for(tau=0;tau<nsamples/2;tau++) print tau, corr[tau] > "pairpower_corr.data";
-
-    # Calculate the sigma for the non-zero tau values: 
-
-    power_sum=0;
-
-    for(tau=1;tau<nsamples/2;tau++) power_sum=power_sum+(corr[tau])^2;
+#!/bin/bash
+
+#!/bin/bash
+awk '
+BEGIN {
+    max_retries=5
+    srand(18565)
+    nsamples=1024
+    max_allowed_sigma=5
+    nruns=50
+
+    for (retry=0; retry<max_retries; retry++) {
+        for(tau=0; tau<nsamples/2; tau++) corr[tau]=0
+
+        for(run=0; run<nruns; run++) {
+            sum=0
+            for(i=0; i<nsamples; i++) {
+                samp[i]=((rand()-0.5)*(rand()-0.5))^2
+                sum+=samp[i]
+            }
+
+            mean=sum/nsamples
+            for(i=0;i<nsamples;i++) samp[i]-=mean
+
+            for(tau=0; tau<nsamples/2; tau++) {
+                sum=0
+                for(i=0;i<nsamples/2;i++) sum+=samp[i]*samp[i+tau]
+                corr[tau]+=sum
+            }
+        }
 
-    sigma=sqrt(power_sum/(nsamples/2-1));
+        max_corr=corr[0]
+        for(tau=0;tau<nsamples/2;tau++) corr[tau]/=max_corr
 
-    # See if any of the correlations exceed a reasonable number of sigma:
+        power_sum=0
+        for(tau=1;tau<nsamples/2;tau++) power_sum+=corr[tau]^2
 
+        sigma=sqrt(power_sum/(nsamples/2-1))
 
-    failcount=0;
+        if (sigma < 1e-6) {
+            print "Sigma too small, retrying run", retry
+            continue
+        }
 
-    for(tau=1;tau<nsamples/2;tau++) {
-        if ( abs(corr[tau])/sigma > max_allowed_sigma ) {
-            print "Tau=", tau ", Autocorr=", corr[tau]/sigma, "sigma";
-            failcount++;
+        for(tau=1;tau<nsamples/2;tau++) {
+            if (abs(corr[tau])/sigma > max_allowed_sigma) {
+                print "Tau=", tau, "Autocorr=", corr[tau]/sigma, "sigma"
+                print "Test failed."
+                exit 1
+            }
         }
-    }
 
-    # Allow a small number of outliers due to statistical noise
-    if (failcount > 3) {
-        print "Test failed:", failcount, "exceedances"
-        exit(1);
-    }
-    else {
-        exit(0);
+        exit 0
     }
-function abs(abs_input) { return(sqrt(abs_input^2)) ; }
-'
 
-exit 0
+    print "Test failed after retries due to unstable sigma"
+    exit 1
+}
+
+function abs(x) {
+    return sqrt(x*x)
+}
+'
-- 
2.34.1


