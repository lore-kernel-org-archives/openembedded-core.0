Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67DFC3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 18:20:16 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.53504.1723486812698017485
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 11:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=M/8kizIR;
 spf=pass (domain: baylibre.com, ip: 209.85.160.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-44fff73f223so22916221cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 11:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723486811; x=1724091611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ezy3TtV+UGcEgcfisHQuOzMjwZLYXUnqzwJeWS4vMmg=;
        b=M/8kizIRMt2w5lohyS5Mn5qb7XASv8+WvJPtrs0NG3RdwqV3nrmhmO7YuyGPXI6nB7
         PMWwypXbXSrWN5d0fK/gC4QGgtvdvuk/w2Hq+UjEHjcucVFbNS0oUOp2tYjwce5ru4UR
         nYYUwwFcUDX6K0rcY7AcyAdDjjsx5fwNML7Wdv1oNUGfLc75YyQEfHCN9MMOlYYsZWE7
         uAmsF8trty8OsbbdT8PLC4Q07SCa9LCtt3JGPpZ/w0edlHq/72qvKHrKMYJnWgq+Nclw
         JjnO6MZzHVR5WuIcAxUzNWvooeJ79tCOdsKZ4ESw/PQ4+u4Gg1sBn2Gz1I9/WoKYG4Eo
         72OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723486811; x=1724091611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezy3TtV+UGcEgcfisHQuOzMjwZLYXUnqzwJeWS4vMmg=;
        b=hwszjkh4uGRYLyYJYrwsR9iIKudjf8yPHi6+HzafHeTeNsQX7MWrhe2f2VXsd7jeAC
         pxAAaX67nn6EDh80Fcdh9SMz3g1tv02I7NjNCtG+JLtn4dyX9MmzMsmLE4R11Dj+bwGZ
         LD4r7nLthZ4ZIMLvh3txonOyDA2nKyeBi62uy0Qt4I1FxVDBN6s5SL7OAlzUiM0+7zLR
         aO7nJFDLsT1Vqf0yq91ZxsbOT0V1BnlY5GZ12t73Ceqjpt8qF0RCwohh+++zcJd0+Oh0
         0mhXjV3+uAL8dQjT+E3613qbJoWp8V0eiUpYtEwhXcEMFA0elHnxpyG9WxwwhfQC60qT
         rnMw==
X-Gm-Message-State: AOJu0YxzN0W6Y2hF72nC/WvjtBirKgYrEQ+KP5lyiFxOaiUMaHoP6G6t
	jY96AoLkfHv9XEico2J/pi2DZkxlImW2CigsPCHIOP2JSge3SOs6XqPx0zrN+CmnIyjaW2aNVzh
	w
X-Google-Smtp-Source: AGHT+IE589NdrfcIVhbxB+Q4o4CRlBZ5V3mYY7BCKZchOVNl5hxFlGKT1Ht+vbnFF9ar0H/GZG1MuA==
X-Received: by 2002:a05:622a:6097:b0:44f:e2fb:b289 with SMTP id d75a77b69052e-45349b68a25mr8922681cf.61.1723486811162;
        Mon, 12 Aug 2024 11:20:11 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4531c1a7f1dsm25499781cf.3.2024.08.12.11.20.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 11:20:10 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] python3-numpy: upgrade 1.26.4 -> 2.0.1
Date: Mon, 12 Aug 2024 14:20:08 -0400
Message-Id: <20240812182009.1132616-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 18:20:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203231

- This release contains numerous API changes and bug fixes.
  Changelog: https://github.com/numpy/numpy/releases/tag/v2.0.1

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
 ...numpy_1.26.4.bb => python3-numpy_2.0.1.bb} | 10 ++++---
 2 files changed, 22 insertions(+), 16 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.26.4.bb => python3-numpy_2.0.1.bb} (84%)

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
 
diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/meta/recipes-devtools/python/python3-numpy_2.0.1.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-numpy_1.26.4.bb
rename to meta/recipes-devtools/python/python3-numpy_2.0.1.bb
index 914245507c..aa1ceed2ba 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.0.1.bb
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
+SRC_URI[sha256sum] = "485b87235796410c3519a699cfe1faab097e509e90ebb05dcd098db2ae87e7b3"
 
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
2.39.2


