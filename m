Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72ED7D3A697
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 19:37:54 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.web11.3003.1730230668195193453
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 12:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=r59xETIn;
 spf=pass (domain: baylibre.com, ip: 209.85.221.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-50d4780a24eso1853604e0c.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730230667; x=1730835467; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=j3NG/7phOju+VQRGw+METHZah0yzRGEPG2B2+TRxbzI=;
        b=r59xETInpHCZLkTiaWL5EllZeGreNdo2fyKC9LUZEYyFeGrHbIFrF+SLaRdj1KEPDT
         M/qHUdqvoSB4B+nNiliSGjKseXuTipWG4LLhch8eg5cxXYvnBw6pYb2fHjOqY9a/dL54
         71J1nUbE+l0yCA6KXJ2H44bYmVUxlxexQpZZDoiQHPhg8gjuZwrgXcwoxAe4tPE+GC9D
         No6tfxEpC3FGQZgPwII1gvjZnjFFojslRrn+lv8QskA5zzZDp/7D4RuucKSOPSoMyKWa
         241rUaLsLIPKiuksQqgTg38NTdGBFdPIFHYMLDyPLes3VaEA+Han8uzgf8uFC82znwU7
         58+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730230667; x=1730835467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j3NG/7phOju+VQRGw+METHZah0yzRGEPG2B2+TRxbzI=;
        b=gdds987qhzrsYfUHaFiOAEizbKWKmDmmKd5OvvTLN2bok+hgvsSZ9MuTRDhLHM1/lB
         i4EZ70wEommcqes0yORoH/j5tPXK4br+DG8NDEfEw9Muf7FMlfOQqJqwi9TWyvJIorJW
         MdTWfGbuT8L2DRmCfbVmWxy0PifMfXZiEV4zOpqTIX8Ae3rbuNzWD/x2z7l85bVyY1c7
         fOx6eNVE+pZfLs2V5JSabzpYSwn8jiFpfod4YFayJ21dXwosbNkAzc1Fz5BFS9iFT96E
         S9AE9l4nLdM4ofrMr2WZyF7mhpPHSrORp6p1ccf2rgP1/Vl26JDbxAGqqS3dhFceYTyr
         MEew==
X-Gm-Message-State: AOJu0YyvG8LW8PXNzL+u+pTZrhsceTL+g2AN4L+Wt0njPsUWistVhEaJ
	D8qxWzXP+zZkZJAwlDxA9QZ91mJY50IKb/zWBcZsg3dvrHxrZuupSOz37UZxZ7+jXtIuIvPWuAn
	t
X-Google-Smtp-Source: AGHT+IGhCngjV3MDmJiERzhdqJl3cJgemchlzHLLSLM/4/o7JVr8dGIuzXQY1wtqM4G7Ux+USSlu2g==
X-Received: by 2002:a05:6122:2512:b0:50c:4eb7:90fa with SMTP id 71dfb90a1353d-51015021ec5mr10158860e0c.5.1730230666758;
        Tue, 29 Oct 2024 12:37:46 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b18d27911asm451058685a.26.2024.10.29.12.37.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:37:46 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-numpy: upgrade 1.26.4 -> 2.1.2
Date: Tue, 29 Oct 2024 15:37:45 -0400
Message-Id: <20241029193745.2919129-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 19:37:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206532

- This release contains numerous API changes and bug fixes.
  Changelog: https://github.com/numpy/numpy/releases

- Notably, the build backend has switched to mesonpy since 1.26.4.

- Patch 0001-numpy-core-Define-RISCV-32-support.patch had to be updated
  to change the paths for the target files. It has now been merged
  upstream, but isn't included in any release yet. PR for reference:

  https://github.com/numpy/numpy/pull/17780

- Builds OK and seems to be compatible with current piglit and pandas
  (meta-python), which was not the case for the previous upgrade attempt
  to numpy 2.0.1.

- For numpy, add 'pkgconfig' to inherit to avoid errors like this at
  do_compile:

  | Found Pkg-config: NO
  | Run-time dependency python found: YES 3.12
  | Has header "Python.h" with dependency python: NO
  |
  | ../numpy-2.0.0/meson.build:44:2: ERROR: Problem encountered: Cannot compile `Python.h`. Perhaps you need to install python-dev|python-devel
  |
  | A full log can be found at /home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.0/build/meson-logs/meson-log.txt

- Also modify the FILES:${PN}-staticdev line to fix a QA issue.

License-Update: Change copyright year to 2024

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...1-numpy-core-Define-RISCV-32-support.patch | 28 +++++++++++--------
 ...numpy_1.26.4.bb => python3-numpy_2.1.2.bb} | 10 ++++---
 2 files changed, 22 insertions(+), 16 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.26.4.bb => python3-numpy_2.1.2.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
index 676bdbb3afd..8dfb20edbb9 100644
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
 
diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/meta/recipes-devtools/python/python3-numpy_2.1.2.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-numpy_1.26.4.bb
rename to meta/recipes-devtools/python/python3-numpy_2.1.2.bb
index 914245507c7..83e921f753c 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.1.2.bb
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
+SRC_URI[sha256sum] = "13532a088217fa624c99b843eeb54640de23b3414b14aa66d023805eb731066c"
 
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
2.39.5


