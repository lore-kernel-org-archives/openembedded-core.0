Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E42D78782
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 15:39:09 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.1265.1732203546349938300
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 07:39:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=IjWhegP2;
 spf=pass (domain: baylibre.com, ip: 209.85.219.43, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d415acf76aso7633166d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 07:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732203545; x=1732808345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3X4ebi10R7YYaClFWCW/1fALXQnSFz7zadP6UV9B59E=;
        b=IjWhegP2HCX1uCovtLpAKgTgZ6tYBpuCI3zPvTZdp+NKPpnN3WJ41zyAd4MIk7Pz9L
         56UtTRbRmr/9y01KBRNtURg+CFr0dfzrMDNvYAtvVMNtCEeJkydXGosYqgT3ideno0zZ
         PI7P3iM78I2nzF4yjF3Fgh6EWCl9+JdaOLzUEpXXScIZQNbatBmpOAnw1odJz62vbmB4
         JKhib1asyOkNIOho1FSZ2fRGKubfoQjFLhj7wfUMyGYNgElQiAkBM1cwStbwWndin3Qr
         R13kdceYSWvsq13habjX53+xp/gyYWsFe/3fWKSIMKgbTcR7NLtJvBFvPaDxMppHHJ5N
         qIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732203545; x=1732808345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3X4ebi10R7YYaClFWCW/1fALXQnSFz7zadP6UV9B59E=;
        b=ciQhMUItMj+Vf7ffgOmRcXCGX8eTxYfnAOGxwt7yola7WdCRhKCtkpyRPjqH+TdGNS
         vOjJx9aZtV/eN2EqxsCIzpMVyWiDKBLS8QmHVIpyNf54HJDmgdba3wCgrreBRmmBNHPB
         6B2wlVwAoWB0MU1qNh5lRAXcbDoM4zHwwYsm86fQgBE4SMOubtYMqgv72MZh4v6d4hPm
         kt9rAyZ+6BFz5jMrdkYmLBcWc2rZ2DqfQo/Hl5Mt6DIbM7XM7/Vx/ezKZTnIC8fLGrMw
         QKLdYwxOUQemSa7MMeyhm8kDVG++pRcYifHzFx6KRpY+lBHriZF1xKUSdbxv5QLGYr4j
         q38w==
X-Gm-Message-State: AOJu0YzRX/QkoJPwFbB05V8FPLy358OeBgL3+aw2NX+tk9QZuz2QtbwE
	RR2eoZDF7S/mNKhLaf4fYLTrisY0HoE/+S6uN72KPix/9riiNLH2Of8axRjCxoYwnxZO+bm0XCT
	x
X-Gm-Gg: ASbGnctmNZV2oerx3aBH9Ia1n1lVF+h1nrRMMhzAZdNnUsVI1jkpVxQ50RzvQJY0Ie6
	QAZDmLtbLFoMnC+pT104ejPpRNTiG37KFRszo1okGtCMYmFAlktz6z66bv4EPUbEwaYsJ1Fc97J
	woKBxzvoa+KjG5mq6gkCWz0FgfWMZQmC8VB93l86pPM28vW5/qHz2FB0VC29Cu9rp6QbZV0wxe3
	4Emm6kRje4WU1BKYOgAgsXf2tonQq4B12DPFKkF/BDMB0n2DkMRubJvggC+Ewk1m6YRqGXYsNK8
	3QOlAuF+GVMQYaF0hfUW8FIJugVICSg=
X-Google-Smtp-Source: AGHT+IGsCb73OFom6hwR9obtktD6EX4OID6MGtQLq6NYNW7EedoNuCa5Y6Q40lKdD5M27tlvJ1Sblg==
X-Received: by 2002:a05:6214:5299:b0:6d3:b636:eccc with SMTP id 6a1803df08f44-6d4377a857fmr91370466d6.21.1732203545277;
        Thu, 21 Nov 2024 07:39:05 -0800 (PST)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d43814e9bdsm24726786d6.126.2024.11.21.07.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 07:39:05 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH 2/2] python3-numpy: upgrade 1.26.4 -> 2.1.3
Date: Thu, 21 Nov 2024 10:38:59 -0500
Message-Id: <20241121153859.2133751-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121153859.2133751-1-tgamblin@baylibre.com>
References: <20241121153859.2133751-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 15:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207543

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

- Mmodify the FILES:${PN}-staticdev line to fix a QA issue.

- This is now reproducible as of oe-core commit: 917df5ed022f

License-Update: Change copyright year to 2024

buildall-qemu log:

BUILDALL-QEMU LOG FOR python3-numpy
START TIME: 2024-11-20_14:02:08
HOSTNAME: megalith
HOST OS: Debian GNU/Linux 12 (bookworm)
HOST KERNEL: 6.1.0-27-amd64
===============
BUILD RESULTS:
[glibc]
FAIL: qemuloongarch64
PASS: qemuriscv32
PASS: qemuarmv5
PASS: qemuppc
PASS: qemumips64
PASS: qemuriscv64
PASS: qemuarm64
PASS: qemuarm
PASS: qemux86-64
PASS: qemuppc64
PASS: qemux86
PASS: qemumips
[musl]
FAIL: qemuloongarch64
FAIL: qemuriscv32
PASS: qemuarmv5
PASS: qemuppc
PASS: qemumips64
PASS: qemuriscv64
PASS: qemuarm64
PASS: qemuarm
PASS: qemux86-64
PASS: qemuppc64
PASS: qemux86
PASS: qemumips
===============
PASSED: 21
FAILED: 3

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...1-numpy-core-Define-RISCV-32-support.patch | 52 +++++++++++--------
 ...numpy_1.26.4.bb => python3-numpy_2.1.3.bb} | 26 ++++++----
 2 files changed, 46 insertions(+), 32 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.26.4.bb => python3-numpy_2.1.3.bb} (68%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
index 676bdbb3afd..6da9047ec57 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
@@ -1,42 +1,50 @@
-From eb6d6579150bf4684603ce377c51e90ad3bb8109 Mon Sep 17 00:00:00 2001
+From 0e2b652a0eff85798584116c905a2d6ad8f25d5f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 15 Nov 2020 15:32:39 -0800
 Subject: [PATCH] numpy/core: Define RISCV-32 support
 
 Helps compile on riscv32
 
-Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/17780]
+Upstream-Status: Backport
+(https://github.com/numpy/numpy/pull/17780/commits/0e2b652a0eff85798584116c905a2d6ad8f25d5f)
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- numpy/core/include/numpy/npy_cpu.h    | 3 +++
- numpy/core/include/numpy/npy_endian.h | 1 +
- 2 files changed, 4 insertions(+)
+ numpy/_core/include/numpy/npy_cpu.h    | 9 +++++++--
+ numpy/_core/include/numpy/npy_endian.h | 1 +
+ 2 files changed, 8 insertions(+), 2 deletions(-)
 
-diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/numpy/npy_cpu.h
-index 78d229e..04be511 100644
---- a/numpy/core/include/numpy/npy_cpu.h
-+++ b/numpy/core/include/numpy/npy_cpu.h
-@@ -19,6 +19,7 @@
+diff --git a/numpy/_core/include/numpy/npy_cpu.h b/numpy/_core/include/numpy/npy_cpu.h
+index a19f8e6bbd..15f9f12931 100644
+--- a/numpy/_core/include/numpy/npy_cpu.h
++++ b/numpy/_core/include/numpy/npy_cpu.h
+@@ -18,6 +18,7 @@
+  *              NPY_CPU_ARCEL
   *              NPY_CPU_ARCEB
   *              NPY_CPU_RISCV64
-  *              NPY_CPU_LOONGARCH
 + *              NPY_CPU_RISCV32
+  *              NPY_CPU_LOONGARCH
   *              NPY_CPU_WASM
   */
- #ifndef NUMPY_CORE_INCLUDE_NUMPY_NPY_CPU_H_
-@@ -104,6 +105,8 @@
+@@ -102,8 +103,12 @@
+     #define NPY_CPU_ARCEL
+ #elif defined(__arc__) && defined(__BIG_ENDIAN__)
      #define NPY_CPU_ARCEB
- #elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen == 64
-     #define NPY_CPU_RISCV64
-+#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen == 32
-+    #define NPY_CPU_RISCV32
+-#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen == 64
+-    #define NPY_CPU_RISCV64
++#elif defined(__riscv)
++    #if __riscv_xlen == 64
++	#define NPY_CPU_RISCV64
++    #elif __riscv_xlen == 32
++	#define NPY_CPU_RISCV32
++    #endif
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
@@ -46,5 +54,5 @@ index 5e58a7f..0926212 100644
              || defined(NPY_CPU_WASM)
          #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
 -- 
-2.20.1
+2.39.5
 
diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/meta/recipes-devtools/python/python3-numpy_2.1.3.bb
similarity index 68%
rename from meta/recipes-devtools/python/python3-numpy_1.26.4.bb
rename to meta/recipes-devtools/python/python3-numpy_2.1.3.bb
index fa78b07f48b..da75dff1e04 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.1.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://numpy.org/"
 DESCRIPTION = "NumPy is the fundamental package needed for scientific computing with Python."
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF-2.0 & Apache-2.0 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a752eb20459cf74a9d84ee4825e8317c"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1de863c37a83e71b1e97b64d036ea78b"
 
 SRCNAME = "numpy"
 
@@ -13,22 +13,31 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "2a02aba9ed12e4ac4eb3ea9421c420301a0c6460d9830d74a9df87efa4912010"
+SRC_URI[sha256sum] = "aa08e04e08aaf974d4458def539dece0d28146d866a39da5639596f4921fd761"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
-inherit ptest setuptools3 github-releases cython
+inherit ptest python_mesonpy github-releases cython
 
 S = "${WORKDIR}/numpy-${PV}"
 
-CLEANBROKEN = "1"
+# Remove references to buildpaths from numpy's __config__.py
+do_install:append() {
+    sed -i \
+        -e 's|${S}=||g' \
+        -e 's|${B}=||g' \
+        -e 's|${RECIPE_SYSROOT_NATIVE}=||g' \
+        -e 's|${RECIPE_SYSROOT_NATIVE}||g' \
+        -e 's|${RECIPE_SYSROOT}=||g' \
+        -e 's|${RECIPE_SYSROOT}||g' ${D}${PYTHON_SITEPACKAGES_DIR}/numpy/__config__.py
 
-do_compile:prepend() {
-    export NPY_DISABLE_SVML=1
+    nativepython3 -mcompileall -s ${D} ${D}${PYTHON_SITEPACKAGES_DIR}/numpy/__config__.py
 }
 
-FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a"
+FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/_core/lib/*.a \
+                          ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a \
+"
 
 # install what is needed for numpy.test()
 RDEPENDS:${PN} = "python3-unittest \
@@ -59,7 +68,4 @@ RDEPENDS:${PN}-ptest += "python3-pytest \
                          ldd \
 "
 
-# Upstream has a pyproject.toml but as of 1.26.4 it's marked as experimental
-INSANE_SKIP = "pep517-backend"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


