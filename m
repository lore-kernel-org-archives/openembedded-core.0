Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E52C369D9
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 17:44:31 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.54572.1745862265069543900
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 10:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=adz9MWKp;
 spf=pass (domain: baylibre.com, ip: 209.85.219.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f4cd4c07c3so32255896d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 10:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745862263; x=1746467063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eHpVgYsd8IMp0RVQCLfjxrGXo+o7dWsBKswGQ4+2E3A=;
        b=adz9MWKph5WU8PuG3FCjMTBpLcOoikbjGD0ECayHNyitMuEsGAOyuAFJqO0OplpMjh
         Mr5ijvracMAZyXn9f77+kDIrxAM9P3JRigkkU3OeEPWbNPJSnySYR8xWHzw6LFP9Yhxx
         KZ0i2BWKtk8HWlnZyJyhqj4lq5JYY+08wT7nijlKkE5Tt5fWaVl01nglTeb8wILqOcOr
         b3MvmSRijEFvIfFcTe4/u55H71qx/oYg3xbhurfel5+ZSxopSWTthh7/IVpmkIy211cZ
         9wJmSXq6ezrqafVzLHEiz+4WNPBdNWditpbW0inc10404AgT5zanunM3aC81mNDv7MRB
         rfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862263; x=1746467063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHpVgYsd8IMp0RVQCLfjxrGXo+o7dWsBKswGQ4+2E3A=;
        b=wEEcQR8di5KNT9WH0Bqyu7SzB9MlUJ9oqYDjt2pAYHXlY9lCI7ceXU7kOcQlxNje5h
         wAyjqf/pc1TbbjxoiFd//ILPc+eYBZVAG6azkpe33flUpIW90zQosx+y/PHFCbGdLyyc
         8yn83jfDohK6bMY35/C+rsLugUKK1cpgID/OlPj7Gfu+RjqqesJRGZYzmBCAbTrlBd5t
         D4VDAQcyvROqIIadL+LriTUqkL1kQ9yXZozQVXgiNHxknlTKPBiNskyOkqn0qQLTGAER
         RBDu1EGCVX8NJXSfu3AslBUyvx9eu3s/H6XqS1espax3SM7wqVCbW234ZFI0cXBI0bjO
         4sBw==
X-Gm-Message-State: AOJu0YwCNFzYBdk+BzbSi0g3wkh2DYG6oVgUdsJTQPpmD8i4EyhiHbEz
	fKdYjKZuf3K39oTXKH1FWT3WokU7+igH5sWMroSb+gDJeUzbl4i7T3TeeQsqy9DFhZZ76SG0trX
	dl7c=
X-Gm-Gg: ASbGncs6JT0kpva2BM+XU6CrtgbQDfWKHD0iL/SK/Z9QS3qmxffYe5YCYIIRwlfCnI0
	5ivedlFkfqcZv8pLWxxxgxY84o/o2JIpHpDq9W0SsIGbov2aa06LvXeqJorHEeqjFQSFSFYE0yV
	NeGvjzeGVjgcBs4rDr+7rCiIxg6iovAsrvM2ahqqGs0Rg2dcHceVtHaGQN7bLSQwbS3jCvMS5Q2
	lp3kgu928Mkq5LIStOQtuxmFRijGNG6nvFmQVpZrZfuEzSByKIRiZ5Ih2DFvlVF7ALggx/m65ou
	mtRKB38DNCcFIhYLydM0Uxh5SLuq7JSU0dmeNhE7GZVXk8y+s7RGQX3XfRYvY1KT6CSXSOhWsMR
	JHT6Z37j1Rs8=
X-Google-Smtp-Source: AGHT+IGpfNPMh+VdC72ErJgirGBBsa0g/kmqxjENVR/EPXo8VAkdbdUZ3dFils5fO4F12g4QexA/Cg==
X-Received: by 2002:a05:6214:21a8:b0:6e8:fbb7:6764 with SMTP id 6a1803df08f44-6f4f1c76171mr1247866d6.45.1745862262509;
        Mon, 28 Apr 2025 10:44:22 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0933d85sm64289666d6.26.2025.04.28.10.44.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:44:21 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2 v4] python3-numpy: fix ptests
Date: Mon, 28 Apr 2025 13:44:16 -0400
Message-Id: <20250428174416.379821-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250428174416.379821-1-tgamblin@baylibre.com>
References: <20250428174416.379821-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 17:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215626

Fix the numpy ptests by doing the following:

- Add gcc and meson as ptest RDEPENDS in the recipe;
- Add python3-unittest-automake-output as a ptest RDEPENDS;
- Convert run-ptest to a shell script that sets PYTEST_DEBUG_TEMPROOT to
  a directory inside the same path that contains the script, create that
  directory, and then invoke the tests with `pytest --automake` pointed
  at the numpy path in site-packages (copying the tests into the normal
  PTEST_DIRECTORY seems to cause module import breakages in some tests);
  - Add a patch to skip the test_big_arrays test, which uses a lot of
  space;
- Set 'IMAGE_ROOTFS_EXTRA_SPACE = "3048576"' for python3-numpy in
  core-image-ptest.bb;
- Also set 'QB_MEM:virtclass-mcextend-python3-numpy = "-m 4096"' in
  core-image-ptest.bb;
- Move python3-numpy from the PTESTS_PROBLEMS list to the PTESTS_SLOW
  one.

Results on qemux86-64:

|============================================================================
|Testsuite summary
|# TOTAL: 51510
|# PASS: 47301
|# SKIP: 4171
|# XFAIL: 33
|# FAIL: 0
|# XPASS: 5
|# ERROR: 0
|DURATION: 164
|END: /usr/lib/python3-numpy/ptest
|2025-04-28T17:26
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

Note that fewer tests would be skipped if python3-mypy were present, but
since that's in meta-python I've opted to leave things as-is.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v4 modifies the run-ptest script to use `pytest --automake` for better test
output formatting (matching what we expect from other ptests), and adds
python3-unittest-automake-output to the ptest RDEPENDS list. Also add a note
about mypy in the commit message.

v3 includes the 0001-lib-tests-test_io-skip-test_big_arrays.patch file, which
was mentioned in the recipe in v2 but not committed before sending.

v2 cleans up the RDEPENDS lists in the recipe (after we added gcc and meson),
and also tweaks run-ptest to remove the temporary directory after the tests are
done to save space.

 .../distro/include/ptest-packagelists.inc     |  2 +-
 meta/recipes-core/images/core-image-ptest.bb  |  4 +++
 ...b-tests-test_io-skip-test_big_arrays.patch | 34 +++++++++++++++++++
 .../python/python3-numpy/run-ptest            | 15 +++++---
 .../python/python3-numpy_2.2.5.bb             | 34 +++++++++++--------
 5 files changed, 70 insertions(+), 19 deletions(-)
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
index 9a1c72aeb10..261916d0c12 100644
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
+pytest --automake /usr/lib/python3.*/site-packages/numpy
+rm -rf "$TEMPROOT"
diff --git a/meta/recipes-devtools/python/python3-numpy_2.2.5.bb b/meta/recipes-devtools/python/python3-numpy_2.2.5.bb
index c6a37c0a85f..273e1665e96 100644
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
@@ -41,32 +42,37 @@ FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/_core/lib/*.a \
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
+                         python3-unittest-automake-output \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


