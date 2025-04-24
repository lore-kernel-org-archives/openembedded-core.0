Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 304BEC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 16:28:16 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.2296.1745512086647702666
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 09:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=HGfURnXj;
 spf=pass (domain: baylibre.com, ip: 209.85.222.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c0e135e953so136704585a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745512085; x=1746116885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssgWDx+fJjVlJLVUj1V5NuQapVE7cjCW1//yxiGWCfw=;
        b=HGfURnXjTKBEPjgUQ+XobpyRys/Jsb+EcX3x3pHp8yNwEqzEz6Pa/FX77RHcJkkRFn
         AGedbW4UJ1AltJlivEY5n4w9/JS/+wGsH2EFcNaJ/5mJNbYgQNcOkWN32iiTANATRe9p
         AgcS8e8ZnFiF0xFOcRUp4XWR5qXY6xZb08dZU+pWnw+/djqoLag1HP/KOrbkeVvw3CuQ
         zYrlm0xnXkHS2rFQRdpFsMpMFE4WcfuHkIfq1F4aAfkDcey8z10EI0GZeCMSGyPdjOJF
         7mKrMvV9mwTtnq2RGmp8jj1cc5zScm/+uxrYuB30CVDPMUuCs+ZNSak4uWfFMip7B2ll
         zjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745512085; x=1746116885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssgWDx+fJjVlJLVUj1V5NuQapVE7cjCW1//yxiGWCfw=;
        b=MYpqx6U4qC4SrxbAEPc7BjFqgAqK2jZ8zjIwK63j051oyLtWL/oUIcdviKyKa+yphj
         LCfp4QBQMePND+H/8uPuIxfj2abXkqMnywEsvLw8B0tLcp3RI0qZh48e8B0GdfiTYYVa
         DgVz7CAedvZq9xsT1CpllW4ZaGodYJn8VBkrcmbYLb6zusGoydGuCiSsnyOTghzItxbG
         StFKXqFWfXZVZDqlUDbWvKqhqwajdv0bdVw0vgpMxIWRZRfX58smwbVirYD9vTPF/bk2
         jRYswbXExB0esetwTL7fpsuL7z8mOmQ9i//mJ/90zXZxIPL8mVbSS4Tz/9jqJnYwIK/S
         E4Pw==
X-Gm-Message-State: AOJu0Yy15KDugUGdGAPIQjTPfEU5h7J7hAFqKyCOn0xh/7+GXru7h3fh
	F9yHhqBAtQB1tfUy+KG2huDxo0mQa1QQm1vzZdswbipIgWKDoJIl5NJ+376G1DC8ueJwIjmyPC+
	RGqM=
X-Gm-Gg: ASbGncuWTd67RtPPPwek4vZ0MMmN/Fylf1J1t+hYiJA0I13mOEHl5sIqlaH4/uqEOQR
	lvQ87eZT2j762qjABy3y82P2rRUyZXvS0WV5EK0P6nzrnkuc3q0l4/Rb5iMlEy7cELgyHxWJMJF
	YgmEbajprzb1xNbZAz0IMgyt6YIA2X3LRFy2rYgjNXIdcSICiZIQDRRkNzXnwQ4Hm7KWTELUm3D
	M982JyaoiJllZQHBvxsdCFfiMkDitvUjBwDQ0f0ewF2gu7DpfugOV0GbeYhzP05PuMtCTuayJJi
	JtmVAaYCx9ay2t7xAFSUTAJnbhUSRPU4bnFW26LJBN1IfIvmT1ub+elCel6jCmCrZkX9Ut+Ppp6
	e
X-Google-Smtp-Source: AGHT+IG7kTwVt++QpcvKE5ab7rvnfDj4rNdLLHBjWTFVZb0Yr7KAbXnpi44soqEuLLkB4gta5lXGww==
X-Received: by 2002:a05:620a:4484:b0:7c7:a538:490 with SMTP id af79cd13be357-7c956ea9985mr404591485a.2.1745512084955;
        Thu, 24 Apr 2025 09:28:04 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958e9fbcasm104270085a.99.2025.04.24.09.28.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:28:04 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2 v2] python3-numpy: fix ptests
Date: Thu, 24 Apr 2025 12:27:59 -0400
Message-Id: <20250424162759.3892597-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424162759.3892597-1-tgamblin@baylibre.com>
References: <20250424162759.3892597-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 16:28:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215392

Fix the numpy ptests by doing the following:

- Add gcc and meson as ptest RDEPENDS in the recipe, and clean up the RDEPENDS
  lists (sorting alphabetically) in the process;
- Convert run-ptest to a shell script that sets PYTEST_DEBUG_TEMPROOT
  to a directory inside the same path that contains the script, create
  that directory, and then invoke the tests in the same manner as before
  with 'python3 -c ...', before finally running 'rm -rf' on the directory we
  created (so that the space is freed up);
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
v2 cleans up the RDEPENDS lists in the recipe (after we added gcc and meson),
and also tweaks run-ptest to remove the temporary directory after the tests are
done to save space.

 .../distro/include/ptest-packagelists.inc     |  2 +-
 meta/recipes-core/images/core-image-ptest.bb  |  4 +++
 .../python/python3-numpy/run-ptest            | 15 ++++++---
 .../python/python3-numpy_2.2.5.bb             | 33 +++++++++++--------
 4 files changed, 35 insertions(+), 19 deletions(-)

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


