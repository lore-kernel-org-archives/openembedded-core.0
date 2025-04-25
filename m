Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7D0C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 17:37:12 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.12268.1745602629580850593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 10:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=c2DsjVgp;
 spf=pass (domain: baylibre.com, ip: 209.85.219.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e8f6970326so28212416d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 10:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745602627; x=1746207427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nEXCoHJllDlfN1ZXyCQN4s0q2j69gKHTPO90fPLpkNA=;
        b=c2DsjVgpuqvOs15xvhE/zvsDvudhIT1yOCw5q/shRa+BbNFNwhLKrAnQQ8+/KzpWiu
         9M3ctWo6V0f+uEgNkF8UpV4Hc6MkoNf80x5CLoo+W93wIkiPTVtTqoPlUCntzE6PIcw4
         CBfIauhHCMwUSDFwBtBu1rxH0ubTLKShkGGo1ViMhauFLPQM8vMJ6V0PRf1nx6Kd7Wf3
         DjFRN/bqv3tTp8JQH/S2xk8arsfos6XuIOZ59wlZjll6nIGsyCPUlz+6u9f7VK8lhJtG
         k5AtZQ+VLMnA6Sf1esSs2PktSvvRbQMp6yPYMbevRj7Y+rwPM25PTmPlWgoo2no70Hpq
         Zpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602627; x=1746207427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEXCoHJllDlfN1ZXyCQN4s0q2j69gKHTPO90fPLpkNA=;
        b=nMdRnjqFNXm7X+156ubjAcU4BdCQ1ejsVaYF1gdr89zEEACGT7KugaY6+KlXeKFMV7
         R5c5gHnLkH+ymmmAOPH9ew9BgXLvkfya65T5lwr0CO++h7qFlghyUf5hbSjNsTcqFgq9
         yd/nitTCY67eApSywY4MvLx8mhRqR2zliUZzscuwdagI2Uk5YPbQWNHpv0BbN5LZ7IZQ
         QJHA6hBaPZdzVT3HIfoRAH4x9ZCZmr1913rwOxeyxX7gcq58xaBZcd3if3mNsJTTBPRM
         oLTTORBx3fEhaetRF4e4vWFH/XWDWxQHA6cx+uZN+LrK0ovgBvKS2p57bX/pnPRK+KGh
         4PpA==
X-Gm-Message-State: AOJu0Yxpkbh5tfn3TIRPNgFgrRgrV5QRFFVgt3QVNZ4XPMahRHsFDDSF
	TpO6CDTZgwkd3NN4V5qozzJwvCsH+gjEztacoZSPKOYTqg5Y/0BaVRjSR3c0c79OZyn1DML3XRS
	YQi8=
X-Gm-Gg: ASbGnct4MaiXvT+4kHkfwK9eskM5BNrezRB8lQ+46hQOaGb5JiGVKFHQFFmgGxPmX7k
	FQO7xi2bil6vtwRqJlF7/ifSy9eE9sNWwaFjC5NsNSBqigBP04fQ85PbsZsKL/ZDbt1drVFkaFJ
	mC+UlrTbXeJHhAPvx0zpkXmlsbA0PG2k1b+/7TqVTE8jn0cZDbUlDITByjlsfSXlIWoQ9sZvgFO
	ddylho8vQ82Bqy4teyOe/F0Az5ZCYfBP3JZKjBeMy41IkehXow2/JL3osYVOO4cbcP8n2k1m+5k
	KeYjsasYB12C1r7IAwBqeSu7Tq6vWLBXDPLzICXztMcb87pnHLhiZ1kGlUWQtyyKH0RcQMLPo0H
	R
X-Google-Smtp-Source: AGHT+IES4FuqLs4kda+uNi33CLsahr0vaF57q6XZFM33ctlF08DVwkmwLPWiSAPUKxCvlNUIKgeigQ==
X-Received: by 2002:a05:6214:d03:b0:6f2:a457:19a with SMTP id 6a1803df08f44-6f4cb9edb20mr57104366d6.25.1745602627501;
        Fri, 25 Apr 2025 10:37:07 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0a74048sm24348836d6.85.2025.04.25.10.37.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:37:06 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2 v3] python3-numpy: fix ptests
Date: Fri, 25 Apr 2025 13:37:01 -0400
Message-Id: <20250425173701.3216403-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425173701.3216403-1-tgamblin@baylibre.com>
References: <20250425173701.3216403-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 17:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215492

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
v3 includes the 0001-lib-tests-test_io-skip-test_big_arrays.patch file, which
was mentioned in the recipe in v2 but not committed before sending.

v2 cleans up the RDEPENDS lists in the recipe (after we added gcc and meson),
and also tweaks run-ptest to remove the temporary directory after the tests are
done to save space.
 .../distro/include/ptest-packagelists.inc     |  2 +-
 meta/recipes-core/images/core-image-ptest.bb  |  4 +++
 ...b-tests-test_io-skip-test_big_arrays.patch | 34 +++++++++++++++++++
 .../python/python3-numpy/run-ptest            | 15 +++++---
 .../python/python3-numpy_2.2.5.bb             | 33 ++++++++++--------
 5 files changed, 69 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-numpy/0001-lib-tests-test_io-skip-test_big_arrays.patch

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
index a0ff8d9528e..73270d10676 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -27,11 +27,15 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
 # tar-ptest in particular needs more space
 IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-tar = "1524288"
 
+# python3-numpy-ptest requires a lot of extra space
+IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-python3-numpy = "3048576"
+
 # ptests need more memory than standard to avoid the OOM killer
 QB_MEM = "-m 1024"
 QB_MEM:virtclass-mcextend-lttng-tools = "-m 4096"
 QB_MEM:virtclass-mcextend-python3 = "-m 2048"
 QB_MEM:virtclass-mcextend-python3-cryptography = "-m 5100"
+QB_MEM:virtclass-mcextend-python3-numpy = "-m 4096"
 QB_MEM:virtclass-mcextend-tcl = "-m 5100"
 
 TEST_SUITES = "ping ssh parselogs ptest"
diff --git a/meta/recipes-devtools/python/python3-numpy/0001-lib-tests-test_io-skip-test_big_arrays.patch b/meta/recipes-devtools/python/python3-numpy/0001-lib-tests-test_io-skip-test_big_arrays.patch
new file mode 100644
index 00000000000..0732f6ef6ab
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-numpy/0001-lib-tests-test_io-skip-test_big_arrays.patch
@@ -0,0 +1,34 @@
+From 9ab82e22a02a17754bcd45b6b4de6bfd16c6db51 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Thu, 24 Apr 2025 09:10:34 -0400
+Subject: [PATCH] lib/tests/test_io: skip test_big_arrays
+
+This test consistently fails with the following error in our ptest
+images:
+
+|OSError: [Errno 28] No space left on device
+
+So skip this test.
+
+Upstream-Status: Inappropriate [embedded-specific]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ numpy/lib/tests/test_io.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/numpy/lib/tests/test_io.py b/numpy/lib/tests/test_io.py
+index 742915e22e..97ae18d7f8 100644
+--- a/numpy/lib/tests/test_io.py
++++ b/numpy/lib/tests/test_io.py
+@@ -205,6 +205,7 @@ def roundtrip(self, *args, **kwargs):
+                 self.arr_reloaded.fid.close()
+                 os.remove(self.arr_reloaded.fid.name)
+ 
++    @pytest.mark.skip(reason="Requires a large amount of space")
+     @pytest.mark.skipif(IS_PYPY, reason="Hangs on PyPy")
+     @pytest.mark.skipif(not IS_64BIT, reason="Needs 64bit platform")
+     @pytest.mark.slow
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/python/python3-numpy/run-ptest b/meta/recipes-devtools/python/python3-numpy/run-ptest
index 9a1c72aeb10..10dfb1246d3 100644
--- a/meta/recipes-devtools/python/python3-numpy/run-ptest
+++ b/meta/recipes-devtools/python/python3-numpy/run-ptest
@@ -1,5 +1,12 @@
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
+TEMPROOT="/usr/lib/python3-numpy/ptest/tmp"
+export PYTEST_DEBUG_TEMPROOT="$TEMPROOT"
+mkdir -p "$TEMPROOT"
+python3 -c "import numpy; numpy.test(label='full', verbose=2)"
+rm -rf "$TEMPROOT"
diff --git a/meta/recipes-devtools/python/python3-numpy_2.2.5.bb b/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
index c6a37c0a85f..05d2b1a1f2c 100644
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
@@ -41,32 +42,36 @@ FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/_core/lib/*.a \
 "
 
 # install what is needed for numpy.test()
-RDEPENDS:${PN} = "python3-unittest \
+RDEPENDS:${PN} = "\
+                  python3-compression \
+                  python3-ctypes \
+                  python3-datetime \
                   python3-difflib \
-                  python3-pprint \
-                  python3-pickle \
-                  python3-shell \
                   python3-doctest \
-                  python3-datetime \
+                  python3-email \
+                  python3-json \
                   python3-misc \
                   python3-mmap \
+                  python3-multiprocessing \
                   python3-netclient \
                   python3-numbers \
-                  python3-pydoc \
+                  python3-pickle \
                   python3-pkgutil \
-                  python3-email \
-                  python3-compression \
-                  python3-ctypes \
+                  python3-pprint \
+                  python3-pydoc \
+                  python3-shell \
                   python3-threading \
-                  python3-multiprocessing \
-                  python3-json \
+                  python3-unittest \
 "
-RDEPENDS:${PN}-ptest += "python3-pytest \
+RDEPENDS:${PN}-ptest += "\
+                         gcc \
+                         ldd \
+                         meson \
                          python3-hypothesis \
-                         python3-sortedcontainers \
+                         python3-pytest \
                          python3-resource \
+                         python3-sortedcontainers \
                          python3-typing-extensions \
-                         ldd \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


