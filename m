Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20B4C369C2
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 14:29:24 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.16663.1745504964380244235
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 07:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=rp88ylTY;
 spf=pass (domain: baylibre.com, ip: 209.85.160.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-47677b77725so13399881cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 07:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745504963; x=1746109763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NutvQx6VTMd+7Jo722X4FTF5T34OD4laCE1/Bjs4ZFc=;
        b=rp88ylTYhuO/Kr3iSM2zh2R2Xv1HupKMr71HvnIATouAon3JIWYMzsYiPTWWxb45aQ
         0HF4YKzU4GNczuEzssqympJH/Lyf535/DyhyfpO7SBLKYySTPosJBMSCskaS4iBjZ91n
         DhpOsJlabjiMzMAnOJTBMNbvd8vEaxuugJBheAxnOJKI878USRgFKUsUgsi7gIZY07KP
         VvUQFrF6e4CWz7r9PT4KrF+jAZfVfSqAnYmh9e9bT8tJxlTtivPefQQVVfMNveqcDXuv
         MBTwMI6h6R/wMrDN21f29xny49XZ5pzi8EVNU9VO/5xRQ8aTqlOdRdSKus+xdyDOTthv
         7o+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504963; x=1746109763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NutvQx6VTMd+7Jo722X4FTF5T34OD4laCE1/Bjs4ZFc=;
        b=um1ZrqhIxp/YNQsv+NjneWweBkzRMGbkxVA+9x7LBHcHRag2f8SIRXdrqRbQ3PlljW
         fg1W0g5zEdmDEhflMV/Kvk/eKW5ky/knnsd6UUOveIPv9/A/quG5MF6JnDnKljFCE/vS
         Gtec4R1Hxd4tEG3pkKECmYvLtz9XTveA6kQ0twzAgyqjO74sgZvqKNJbfSOxc1m6UcS8
         bidRt1J6EDnc6B+EF2fDXroib9SQIVoFi0KCVY2FjSg3Nv0cwMuiVyayTkQREQPyvw98
         I2GOJIeIlfBrR0kLTYtapoGw//CJ/fwH7L3z7OcmimIS3SyPzbmg6JEM103iU1bdN9oE
         4gVg==
X-Gm-Message-State: AOJu0YzpXxEx0cIQqQR1Pkrgdeg4J3ZoF1CNslDPpyyJDoM54yWUgXb9
	OtJau7VuTwUs4T6yyil2G0VjucPD8T72Wjy1/Fxdw/1nB8v0ZEKvvWqvyUieh7w6qudgyx/NiWL
	J/Fs=
X-Gm-Gg: ASbGncty96mU8b30D2bzMHd8jruE77QXnRp0yF2QBts7/VAnG5fldd3o+wahcJNDfSJ
	nbpCL9Bz9XKJ7O2oONDvIWXHJW8RXALY9FYRwsu0Tw79Zo3PDA1NEhDFWBHAkLlWvslu+vL5Fyg
	EKFoBl3OkkACWtBYQpiZ0pFJPdJipVo1DUUm0Rw0v45HUaOyHgXrECo9FIULWMYacnXFjeh7dAW
	Y0QiznvwYhG8jVShz/CrU1Srq1LEzLWFOlfzAWOBAusck4an77fzuyF6/Rq1a4yOaYTddwsE43A
	GAF6B+jEQe8ar5lCfwUfFlYxp6edXrZwqUumSB/gwt/TxLB3exVqULVIq38p+wZTQuMQaMSICYQ
	j
X-Google-Smtp-Source: AGHT+IHXn1BvAFQyVxp3GZ3pQiF7eSriKtXbNj68wnFRpHRsRnuYlroV4htcdy4m4lYSsCJ2Qzh6aQ==
X-Received: by 2002:ac8:7fd4:0:b0:477:13b5:f25d with SMTP id d75a77b69052e-47eb2d98e6cmr32170391cf.15.1745504962833;
        Thu, 24 Apr 2025 07:29:22 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ea1ba34f8sm12118681cf.77.2025.04.24.07.29.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:29:22 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] python3-numpy: fix ptests
Date: Thu, 24 Apr 2025 10:29:18 -0400
Message-Id: <20250424142918.3811330-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424142918.3811330-1-tgamblin@baylibre.com>
References: <20250424142918.3811330-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 14:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215379

Fix the numpy ptests by doing the following:

- Add gcc and meson as ptest RDEPENDS in the recipe;
- Convert run-ptest to a shell script that sets PYTEST_DEBUG_TEMPROOT
  to a directory inside the same path that contains the script, create
  that directory, and then invoke the tests in the same manner as before
  with 'python3 -c ...';
- Add a patch to skip the test_big_arrays test, which uses a lot of
  space;
- Set 'IMAGE_ROOTFS_EXTRA_SPACE = "3048576"' for python3-numpy in
  core-image-ptest.bb;
- Also set 'QB_MEM:virtclass-mcextend-python3-numpy = "-m 4096"' in
  core-image-ptest.bb;
- Move python3-numpy from the PTESTS_PROBLEMS list to the PTESTS_SLOW
  one.

Results on qemux86-64:

|==== 47301 passed, 4171 skipped, 33 xfailed, 5 xpassed in 148.64s (0:02:28) ====
|DURATION: 152
|END: /usr/lib/python3-numpy/ptest
|2025-04-24T14:02
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/distro/include/ptest-packagelists.inc     |  2 +-
 meta/recipes-core/images/core-image-ptest.bb        |  4 ++++
 .../recipes-devtools/python/python3-numpy/run-ptest | 13 +++++++++----
 meta/recipes-devtools/python/python3-numpy_2.2.5.bb |  3 +++
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index f3fdededf66..2a27c0c5d41 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -120,6 +120,7 @@ PTESTS_SLOW = "\
     python3-cffi \
     python3-click \
     python3-cryptography \
+    python3-numpy \
     python3-xmltodict \
     strace \
     tar \
@@ -155,5 +156,4 @@ PTESTS_PROBLEMS = "\
     mdadm \
     numactl \
     python3-license-expression \
-    python3-numpy \
 "
diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index a0ff8d9528e..e703e852123 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -27,10 +27,14 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
 # tar-ptest in particular needs more space
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-tar = "1524288"
 
+# python3-numpy-ptest requires a lot of extra space
+IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-python3-numpy = "3048576"
+
 # ptests need more memory than standard to avoid the OOM killer
 QB_MEM = "-m 1024"
 QB_MEM:virtclass-mcextend-lttng-tools = "-m 4096"
 QB_MEM:virtclass-mcextend-python3 = "-m 2048"
+QB_MEM:virtclass-mcextend-python3-numpy = "-m 4096"
 QB_MEM:virtclass-mcextend-python3-cryptography = "-m 5100"
 QB_MEM:virtclass-mcextend-tcl = "-m 5100"
 
diff --git a/meta/recipes-devtools/python/python3-numpy/run-ptest b/meta/recipes-devtools/python/python3-numpy/run-ptest
index 9a1c72aeb10..47a647a8ea2 100644
--- a/meta/recipes-devtools/python/python3-numpy/run-ptest
+++ b/meta/recipes-devtools/python/python3-numpy/run-ptest
@@ -1,5 +1,10 @@
-#!/usr/bin/env python3
-
-import numpy
-numpy.test(label='full', verbose=2)
+#!/bin/sh
 
+# By default, numpy will use /tmp as the root path for temporary files used
+# during tests, but if this is a tmpfs it may fill up quickly and cause many of
+# the tests to report "no space left on device" errors. Create a custom
+# directory for these and point pytest at it so we can take advantage of the
+# storage provided in the rootfs.
+export PYTEST_DEBUG_TEMPROOT="/usr/lib/python3-numpy/ptest/tmp"
+mkdir -p /usr/lib/python3-numpy/ptest/tmp
+python3 -c "import numpy; numpy.test(label='full', verbose=2)"
diff --git a/meta/recipes-devtools/python/python3-numpy_2.2.5.bb b/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
index c6a37c0a85f..b29c7c5b79d 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
@@ -10,6 +10,7 @@ SRCNAME = "numpy"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://fix_reproducibility.patch \
+           file://0001-lib-tests-test_io-skip-test_big_arrays.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "a9c0d994680cd991b1cb772e8b297340085466a6fe964bc9d4e80f5e2f43c291"
@@ -67,6 +68,8 @@ RDEPENDS:${PN}-ptest += "python3-pytest \
                          python3-resource \
                          python3-typing-extensions \
                          ldd \
+                         meson \
+                         gcc \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


