Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4BCC2BA1A
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 15:09:51 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.75652.1718982588918663257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 08:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Kr4Q1qwZ;
 spf=pass (domain: baylibre.com, ip: 209.85.210.45, mailfrom: tgamblin@baylibre.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6f9ca219760so1089840a34.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 08:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718982588; x=1719587388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UBZtNpGfArKrIkVCkz6znLuuJwfkl0N4qdak2ifu2cs=;
        b=Kr4Q1qwZ5wSeODIIsjhL+fkq63skdX3dLNmOTegMfLYwqKc3VuDe8RRQWaaY7pDvMY
         Eh3m41BXojSh811Kx97f4VwVL+yH+t1WVnwVaEbp6b/DpSZruTTiKnsd2LDBmYTkuT0N
         m/NgD2nPRbq+TdPlSefoDpyaOzNCouEkZucK2/sENfOUo/OgBLeKPiK1xoEPmUshxHz+
         LLDdlz9kTYKdyj6ehlKP2kfvP7nx1xHoauyeyRlFfpIK2HhOU8FtcMkfuWTZGaAwXkaY
         UXYY/Y3FULa8n9YzxPmy3K9WHqK6Kp6HaMN5RgsJuDvyzEVjtrCs6C4ALFPQaR3fP+KD
         mJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718982588; x=1719587388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBZtNpGfArKrIkVCkz6znLuuJwfkl0N4qdak2ifu2cs=;
        b=oxsuuGDji8V+QuCD5gMiuelLykqFcG88J/6aHPtpWo0szw7lr+LK9AIXRNfr2A5Syh
         ZzoS/+ZYDxjmeezBOYZv/D7Ws4eTDZD9wArh+WR78Ikv2F5dyiHouAN/tUPEAA1/VWnx
         WYIFsP1oH4IjCRXNk/MmmUytGB0qox357TQs6hfNtZeKOM2UI+YiohBP+PwzG6LdqrpJ
         HtsIpPVsKbsVONZ/JUXCQnfF9sO+FSf1kHdsV7QIm4GVsKQ5RosxRQzITsMYsnWnqnyy
         4NzGOPA6/1Lm1DHq/NoS1BB1Mxdn7KipzCN3379kmQtUBwTNpuu+4Ra+LwIzoLEfhNl5
         mueg==
X-Gm-Message-State: AOJu0Yyq1fq1yBqfSjVt8pqCrTyx+lrQAdpu7rOncL8+2iG5pkqVnJ+q
	tu6dZ5rsBhAhIpKNfiddwhKcng4Pku7TW1Gj4jQgdlOuK+MBlWJdXLOTut242S0OHFaiAih5Ur+
	P
X-Google-Smtp-Source: AGHT+IG6LlYceh5RP5voII+VEXeeI+/5xMiwwAl8SE/teeAWA1/psGFVPeuncpOIsMDMdHw0FD2ykA==
X-Received: by 2002:a05:6830:14d6:b0:6fa:1312:49ed with SMTP id 46e09a7af769-7007420c129mr9136417a34.20.1718982587840;
        Fri, 21 Jun 2024 08:09:47 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b51ef498b3sm9332696d6.107.2024.06.21.08.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 08:09:47 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH] python3-numpy: upgrade 1.26.4 -> 2.0.0
Date: Fri, 21 Jun 2024 11:09:43 -0400
Message-ID: <20240621150943.479535-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 15:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201028

- This release contains numerous API changes and bug fixes.
  Changelog: https://github.com/numpy/numpy/releases/tag/v2.0.0

- Notably, the build backend has switched to mesonpy.

- Patch 0001-numpy-core-Define-RISCV-32-support.patch had to be updated to
  change the paths for the target files. It's still waiting to be merged
  upstream and will need a rebase, so I've added a comment on the PR:

  https://github.com/numpy/numpy/pull/17780

  Note that the riscv32 test build didn't complete because openssl failed
  on do_compile, but the patch applies cleanly now.

- For numpy, add 'pkgconfig' to inherit to avoid the following error at
  do_compile:

  | Found Pkg-config: NO
  | Run-time dependency python found: YES 3.12
  | Has header "Python.h" with dependency python: NO
  |
  | ../numpy-2.0.0/meson.build:44:2: ERROR: Problem encountered: Cannot compile `Python.h`. Perhaps you need to install python-dev|python-devel
  |
  | A full log can be found at /home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.0/build/meson-logs/meson-log.txt

- Also modify the FILES:${PN}-staticdev line to fix a QA issue at the end.

License-Update: Change copyright year to 2024

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...1-numpy-core-Define-RISCV-32-support.patch | 28 +++++++++++--------
 ...numpy_1.26.4.bb => python3-numpy_2.0.0.bb} | 10 ++++---
 2 files changed, 22 insertions(+), 16 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.26.4.bb => python3-numpy_2.0.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
index 676bdbb3af..8dfb20edbb 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
@@ -1,4 +1,4 @@
-From eb6d6579150bf4684603ce377c51e90ad3bb8109 Mon Sep 17 00:00:00 2001
+From df38843aaa7184115d262f14eae23ff38a20372a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 15 Nov 2020 15:32:39 -0800
 Subject: [PATCH] numpy/core: Define RISCV-32 support
@@ -7,15 +7,19 @@ Helps compile on riscv32
 
 Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/17780]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Update the patch with the new paths for numpy release 2.0.0.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- numpy/core/include/numpy/npy_cpu.h    | 3 +++
- numpy/core/include/numpy/npy_endian.h | 1 +
+ numpy/_core/include/numpy/npy_cpu.h    | 3 +++
+ numpy/_core/include/numpy/npy_endian.h | 1 +
  2 files changed, 4 insertions(+)
 
-diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/numpy/npy_cpu.h
-index 78d229e..04be511 100644
---- a/numpy/core/include/numpy/npy_cpu.h
-+++ b/numpy/core/include/numpy/npy_cpu.h
+diff --git a/numpy/_core/include/numpy/npy_cpu.h b/numpy/_core/include/numpy/npy_cpu.h
+index a19f8e6bbd..d824d4efb6 100644
+--- a/numpy/_core/include/numpy/npy_cpu.h
++++ b/numpy/_core/include/numpy/npy_cpu.h
 @@ -19,6 +19,7 @@
   *              NPY_CPU_ARCEB
   *              NPY_CPU_RISCV64
@@ -33,10 +37,10 @@ index 78d229e..04be511 100644
  #elif defined(__loongarch__)
      #define NPY_CPU_LOONGARCH
  #elif defined(__EMSCRIPTEN__)
-diff --git a/numpy/core/include/numpy/npy_endian.h b/numpy/core/include/numpy/npy_endian.h
-index 5e58a7f..0926212 100644
---- a/numpy/core/include/numpy/npy_endian.h
-+++ b/numpy/core/include/numpy/npy_endian.h
+diff --git a/numpy/_core/include/numpy/npy_endian.h b/numpy/_core/include/numpy/npy_endian.h
+index 5e58a7f52c..09262120bf 100644
+--- a/numpy/_core/include/numpy/npy_endian.h
++++ b/numpy/_core/include/numpy/npy_endian.h
 @@ -49,6 +49,7 @@
              || defined(NPY_CPU_PPC64LE)       \
              || defined(NPY_CPU_ARCEL)         \
@@ -46,5 +50,5 @@ index 5e58a7f..0926212 100644
              || defined(NPY_CPU_WASM)
          #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
 -- 
-2.20.1
+2.45.2
 
diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/meta/recipes-devtools/python/python3-numpy_2.0.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-numpy_1.26.4.bb
rename to meta/recipes-devtools/python/python3-numpy_2.0.0.bb
index ccd08147af..38aebdbce0 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://numpy.org/"
 DESCRIPTION = "NumPy is the fundamental package needed for scientific computing with Python."
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF-2.0 & Apache-2.0 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a752eb20459cf74a9d84ee4825e8317c"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1de863c37a83e71b1e97b64d036ea78b"
 
 SRCNAME = "numpy"
 
@@ -13,14 +13,14 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "2a02aba9ed12e4ac4eb3ea9421c420301a0c6460d9830d74a9df87efa4912010"
+SRC_URI[sha256sum] = "cf5d1c9e6837f8af9f92b6bd3e86d513cdc11f60fd62185cc49ec7d1aba34864"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 DEPENDS += "python3-cython-native"
 
-inherit ptest setuptools3 github-releases
+inherit ptest python_mesonpy pkgconfig github-releases
 
 S = "${WORKDIR}/numpy-${PV}"
 
@@ -30,7 +30,9 @@ do_compile:prepend() {
     export NPY_DISABLE_SVML=1
 }
 
-FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a"
+FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/_core/lib/*.a \
+                          ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a \
+"
 
 # install what is needed for numpy.test()
 RDEPENDS:${PN} = "python3-unittest \
-- 
2.45.2


