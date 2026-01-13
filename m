Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928F2D2F35D
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 18:45:44 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66366.1768329936306411883
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 10:45:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=p6hsEdya;
 spf=pass (domain: baylibre.com, ip: 209.85.219.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88a2b99d8c5so68907516d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768329935; x=1768934735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5zLRyYbXu4Iy4TncsE8qvzy4R7fmcCVLEI9iGSZRMcE=;
        b=p6hsEdya0Qz/CQJKven7VQtD4nANUJ0zgkrlkbgP3qOLdCkZ/t1dJbTaKbNBUbgwh+
         jFVec7XHlkdPFRz1ypUmq6BABS9IswG4QOxGlyO5czRuV+4PXdi2qSy4DnZlBtFuYj8F
         sCjO9KoduXkZSH9iP/eD2r3rrbY2Te7hurn5kRX4RPq1qUMeW5b/Ov5WnRxnqKb/vJnO
         r9/XN3a4G/t9MgSQPYU4pNY8/rYB2xAvrUMVJEhBkMczvlJz1lCFW+37F30XEEME2OFx
         d75NMkZWKOYpeCNUXZF6fKL6ZvtG5woWSNv7F0VsrnOLUlSgORRHctx5bEPX1YPNnsxH
         JRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768329935; x=1768934735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zLRyYbXu4Iy4TncsE8qvzy4R7fmcCVLEI9iGSZRMcE=;
        b=Se6jO13JD/8ourQxn4WFQNh3pky0QmZAIeQZkQz7qx9IB7/32qfHE10UlyrAppIvGO
         3UXyWkOBm0d4AD6+3M9Bv0wAjBkyrnbSMbL354jZiv7wG1d0gcrynuonooT8oFBIw9ZV
         0xS+20wSj2vKC/cnFh7DO/S2K49cZC7TbMIeJkbZJxZiv2VpZXnt/bmzyJgXW+PzaGYn
         kEF4vYikISK7GM9ybx8g4Vxt1yAZPMJkuRjWJimn9p98Nt08Td4T0pgGfRkjfkkf18wT
         prV54U+4F7gyPV9LtSGpq3ymN9UTGf+TxuRsSYneeP02EiTxdG87c+qdj164wbl3cIpe
         b3Uw==
X-Gm-Message-State: AOJu0Yy1h5tSRT+/GROB+KQbS0mpubPnuSeUUVbz4T68fu3hLa0gn+3P
	jZ6EF4Az2ZZdZqQmw0DBbBwUxXeBRoA2y1zGAj+h1PT2TPBog1ndAGz8OyzIcxVaxbwJAFnmOGr
	lLVJ8SBM=
X-Gm-Gg: AY/fxX7Vt5Pd8kyqklTiOz07m+JG/HC+iKhRFkj/avhec+d1wn5CRacktkG4b2eeige
	7vwxnhr3yv8s5b1IA3wr/3zg5QTSwSHumW4Y4UfPJhIGLnDKMiMyrz4bKRtJ0goUBQSlyE97Sxp
	JDNkBFuFdlhPMVFMr9c/oYAoSMVml2WIUFE8rccoWzToAVDr/YeiNfl8jDML8xHDYcO45WlMOKP
	QaB3YjTDk0B3vHwK9euK8XmYAdaZdDpZ4rJVv54brkURhHnVJShws4450WhCrVcgDWUnkLGj7fj
	VUzvmFITe7w/gxGrfZCSk1/8SROHhNCh/KBxhT5g5KgNuhBx0KAuh1WSD3JP8v9aVJOFN19RJRX
	0vs5fAam9091/QEgcX1K+MZ44qJxdZ0U99SVUKnzh31TVPNvCJay8qCkdTF0motJTDwKmZYOuZb
	UgrsWBSbxFXDaHjAs=
X-Google-Smtp-Source: AGHT+IGoV58RC0DkrW4PVkGCDsYXl2DwlTn9QKgdsnOZ22Ckl5G3sZBJtCA1jLjTzh9WtzFe/7fT7g==
X-Received: by 2002:ad4:5d6f:0:b0:87b:cbf7:5eae with SMTP id 6a1803df08f44-890842d17f7mr321327456d6.59.1768329934495;
        Tue, 13 Jan 2026 10:45:34 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc7b1sm159819866d6.5.2026.01.13.10.45.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 10:45:33 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] libxml2: backport -timeout flag for testlimits
Date: Tue, 13 Jan 2026 13:45:32 -0500
Message-ID: <20260113184532.3389502-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 18:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229290

[YOCTO #15912]

A commit was recently merged upstream to make the testlimits test's
timeout configurable. This test fails intermittently on the AB under
heavy load (particularly on qemuriscv64), so backport the change and
adjust the timeout from two seconds to five.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...mits-optionally-accept-timeout-input.patch | 92 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2/run-ptest    |  5 +-
 meta/recipes-core/libxml/libxml2_2.15.1.bb    |  1 +
 3 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-testlimits-optionally-accept-timeout-input.patch

diff --git a/meta/recipes-core/libxml/libxml2/0001-testlimits-optionally-accept-timeout-input.patch b/meta/recipes-core/libxml/libxml2/0001-testlimits-optionally-accept-timeout-input.patch
new file mode 100644
index 0000000000..2f0899a0be
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/0001-testlimits-optionally-accept-timeout-input.patch
@@ -0,0 +1,92 @@
+From b45e38edab72e4f09b24a5c9672df818f8df020c Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Thu, 8 Jan 2026 15:30:47 -0500
+Subject: [PATCH] testlimits: optionally accept '-timeout' input
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/b45e38edab72e4f09b24a5c9672df818f8df020c]
+Fixes: #1032
+
+The testlimits tests can use a lot of system resources, and thus they
+may fail when run on systems under heavy load, given that the default
+parsing timeout is set to two seconds. Retain this default value, but
+make the timeout length configurable with a new '-timeout' flag.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ testlimits.c | 33 ++++++++++++++++++++++++++-------
+ 1 file changed, 26 insertions(+), 7 deletions(-)
+
+diff --git a/testlimits.c b/testlimits.c
+index 695cbf48..87fcd1a1 100644
+--- a/testlimits.c
++++ b/testlimits.c
+@@ -35,9 +35,10 @@ static int tests_quiet = 0;
+  *									*
+  ************************************************************************/
+ 
+-/* maximum time for one parsing before declaring a timeout */
+-#define MAX_TIME 2 /* seconds */
++/* default maximum time for one parsing before declaring a timeout */
++#define DEFAULT_MAX_TIME 2 /* seconds */
+ 
++static int max_time = DEFAULT_MAX_TIME;
+ static clock_t t0;
+ static int timeout = 0;
+ 
+@@ -48,7 +49,7 @@ static void reset_timout(void) {
+ 
+ static int check_time(void) {
+     clock_t tnow = clock();
+-    if (((tnow - t0) / CLOCKS_PER_SEC) > MAX_TIME) {
++    if (((tnow - t0) / CLOCKS_PER_SEC) > max_time) {
+         timeout = 1;
+         return(0);
+     }
+@@ -1228,22 +1229,40 @@ runcrazy(void) {
+     return(ret);
+ }
+ 
+-
+ int
+ main(int argc ATTRIBUTE_UNUSED, char **argv ATTRIBUTE_UNUSED) {
+     int i, a, ret = 0;
+     int subset = 0;
++    char *endptr;
++    long val;
+ 
+     fillFilling();
+     initializeLibxml2();
+ 
+     for (a = 1; a < argc;a++) {
+         if (!strcmp(argv[a], "-v"))
+-	    verbose = 1;
++            verbose = 1;
+         else if (!strcmp(argv[a], "-quiet"))
+-	    tests_quiet = 1;
++            tests_quiet = 1;
+         else if (!strcmp(argv[a], "-crazy"))
+-	    subset = 1;
++            subset = 1;
++        else if (!strcmp(argv[a], "-timeout")) {
++            if (a + 1 >= argc) {
++                fprintf(stderr, "Error: -timeout requires a value in seconds\n");
++                return 1;
++            }
++            val = strtol(argv[a + 1], &endptr, 10);
++            if (endptr == argv[a + 1] || *endptr != '\0') {
++                fprintf(stderr, "Error: -timeout value '%s' is not a valid number\n", argv[a + 1]);
++                return 1;
++            }
++            if (val <= 0 || val > INT_MAX) {
++                fprintf(stderr, "Error: -timeout must be a positive integer (got %s)\n", argv[a + 1]);
++                return 1;
++            }
++            max_time = (int)val;
++            a++;
++        }
+     }
+     if (subset == 0) {
+ 	for (i = 0; testDescriptions[i].func != NULL; i++) {
+-- 
+2.52.0
+
diff --git a/meta/recipes-core/libxml/libxml2/run-ptest b/meta/recipes-core/libxml/libxml2/run-ptest
index 868649240b..becf61398e 100755
--- a/meta/recipes-core/libxml/libxml2/run-ptest
+++ b/meta/recipes-core/libxml/libxml2/run-ptest
@@ -5,9 +5,12 @@ set -e
 export LC_ALL=en_US.UTF-8
 
 # testModule isn't that useful and hard-codes buildtree, so we don't run that
-TESTS="runtest runsuite testrecurse testchar testdict runxmlconf testapi testlimits testparser"
+TESTS="runtest runsuite testrecurse testchar testdict runxmlconf testapi testparser"
 
 for T in $TESTS; do
     echo Running $T
     ./$T && echo PASS: $T || echo FAIL: $T
 done
+
+echo Running testlimits with -timeout 5
+./testlimits -timeout 5 && echo PASS: testlimits || echo FAIL: testlimits
diff --git a/meta/recipes-core/libxml/libxml2_2.15.1.bb b/meta/recipes-core/libxml/libxml2_2.15.1.bb
index 905688e834..736aaea00e 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.1.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.1.bb
@@ -18,6 +18,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://run-ptest \
            file://install-tests.patch \
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
+           file://0001-testlimits-optionally-accept-timeout-input.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c008bac08fd5c7b4a87f7b8a71f283fa581d80d80ff8d2efd3b26224c39bc54c"
-- 
2.52.0


