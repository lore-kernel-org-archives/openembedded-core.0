Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77129C369CB
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 23:22:44 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.18177.1745709757548997785
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 16:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YPnrAx/c;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7376dd56f60so2653111b3a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 16:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745709757; x=1746314557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=epdUBMN3T1QyZeoBWiJgN3Q4oKz+QjkbgE2a/2SIkBQ=;
        b=YPnrAx/cV7/RmFIxBwt1veIfQRzDxIUigmR+F+H2ikddaRI5bgbfVNR70pMwK/SbIk
         YFEqmHVE9QUkPSfLr++DmMzyY8821c+A1PK7zkCQ2aroPCMZ3nSQ8r6lv7mqaPI5wB/x
         0/HVQHXJOaFn1w1O7eRw2oWDJ5xdhYQ+w+lAfpybFGKmpbmqV7onvXM6H6wyh4mtkAEB
         HSnbq1JLiRiIFT2pNpllL51RK+6SdAtv2Ts2YyEZkSlHLQ4MbQz82XQKdCfjxkXtZwzi
         D9NgcOhq9Hya4NSni/7aRJkZS9lbj0V975v5N7YayrNmmP0/0O+st+83+zI15U0TwdyH
         EKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745709757; x=1746314557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epdUBMN3T1QyZeoBWiJgN3Q4oKz+QjkbgE2a/2SIkBQ=;
        b=odqH0gaqIiuoyYtBKhlCTZG3KbmJSykPegJt1c/Rnek6GNHl4NcgNIeYJNGVzv4p4V
         ykrCsufApox1IuQeUuLIlpK7vP5DJl0mVfqiHYM3GrApqhkBkygQaXR0grLNMS1U3cbJ
         kSYZlBe9j20MdNiUlIB29WrpROtGUOi6THk6AUYj8Vib73u5vYtzU8mM0/cXqDJV2JM0
         MxkwGtwtRcWm1nOYkPtnD+kUbE7cPvn9W1oM7Zyq1pBbe8cm+A9T6VQcKA6O8WF2w0J4
         jM/IqWM5OS4CZeLl6STqlw3Rf7GK7zn8eCAEZ67KdA1z5ZU6CkHrc/G27L+aN74x0YFX
         PN8A==
X-Gm-Message-State: AOJu0Yw7EjtvzkNUbCuz4biRhTMdoAGzGOMyfYeJMgMCS1wzZQk2p8Nz
	eXeVodIHW2v7rvWOWNpkScWndAM7I8DY/TaXF5MJwJP1WpUZSzpe+FG6X0JV
X-Gm-Gg: ASbGncs2hJTiJHuSHz4IrTZN90Dymg6ppAIDfyX6RGGvssT2XL5QQP1EvHqiUNW4CBs
	bTBHafZuEiLKBjfXhxbJNGV00r6D55lncjD+vmrYxeE46aKu+dYhGbXgtuVej6YOoQFGen7VxAz
	DOVdbXPUcoGPA9oRJgZOi/UprKZmaaqB/M090PjhauRFfslxyVLAlBFZy8UNxkbzty7DlRLKCId
	C3wlwRKDremQIVYQjTucBjXlIsk+6dwkViw/JO53BlKmCH+KcBiA3/tpreRefkfLbwntkZxxYxR
	9NeJy2IA7z2hIEpD9dB0Iu6HB2xVM6cy
X-Google-Smtp-Source: AGHT+IG+Q72rNZ0JG9OtRfV3SxSFHQDMlxLjTCmIhT9FSTgU5atrjD1SUlDJg3BNlWiMPoCjljs17Q==
X-Received: by 2002:a05:6a00:2402:b0:736:2a73:675b with SMTP id d2e1a72fcca58-73fd876d982mr10495732b3a.19.1745709755719;
        Sat, 26 Apr 2025 16:22:35 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25941bbbsm5556503b3a.65.2025.04.26.16.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 16:22:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] gcc: Upgrade GCC to 15 release
Date: Sat, 26 Apr 2025 16:22:32 -0700
Message-ID: <20250426232232.4047475-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 23:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215526

* Nios2 has been removed and aarch64/ilp32 is deprecated
* Default C dialect is switched to C23
* {0} initializer in C or C++ for unions no longer guarantees clearing of the whole union
* Compile speed improvements with LTO
* Vectorizer can support loops with early exists but it is limited to loops
  with fixed vector lengths

This is major release of gcc, the changes are noted [1]

[1] https://gcc.gnu.org/gcc-15/changes.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Drop musl headers ordering patch

 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../gcc/{gcc-14.2.inc => gcc-15.1.inc}        |  15 +-
 ...ian_14.2.bb => gcc-cross-canadian_15.1.bb} |   0
 .../{gcc-cross_14.2.bb => gcc-cross_15.1.bb}  |   0
 ...-crosssdk_14.2.bb => gcc-crosssdk_15.1.bb} |   0
 ...cc-runtime_14.2.bb => gcc-runtime_15.1.bb} |   0
 ...itizers_14.2.bb => gcc-sanitizers_15.1.bb} |   0
 ...{gcc-source_14.2.bb => gcc-source_15.1.bb} |   0
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  39 --
 .../0002-gcc-poison-system-directories.patch  |  80 ++-
 .../gcc/gcc/0003-64-bit-multilib-hack.patch   |  12 +-
 ...R_BUILD-in-a-couple-of-places-to-avo.patch |  10 +-
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  16 +-
 .../gcc/gcc/0006-cpp-honor-sysroot.patch      |  10 +-
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  62 +-
 .../gcc/gcc/0008-libtool.patch                |   6 +-
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |   6 +-
 ...-config-files-from-B-instead-of-usin.patch |  14 +-
 ...1-aarch64-Fix-include-paths-when-S-B.patch |  20 +-
 ...ir-from-.la-which-usually-points-to-.patch |   6 +-
 ...e-target-gcc-headers-can-be-included.patch |  18 +-
 ...t-directory-during-relink-if-inst_pr.patch |   6 +-
 ...-fix-libcc1-s-install-path-and-rpath.patch |   6 +-
 ...le-sysroot-support-for-nativesdk-gcc.patch |  34 +-
 ...sroot-gcc-version-specific-dirs-with.patch |   8 +-
 ...d-to-link-commandline-for-musl-targe.patch |   8 +-
 ...Re-introduce-spe-commandline-options.patch |   6 +-
 ...as-for-__cpu_indicator_init-instead-.patch |   8 +-
 ...s-Do-not-use-__LINE__-for-maintainin.patch |   8 +-
 ...omic-Do-not-enforce-march-on-aarch64.patch |   8 +-
 .../0023-Fix-install-path-of-linux64.h.patch  |   6 +-
 ...ardcoded-build-paths-into-ppc-libgcc.patch |   2 +-
 ...025-gcc-testsuite-tweaks-for-mips-OE.patch | 118 ++--
 ...te-include-paths-on-musl-instead-of-.patch |  36 ++
 ...ix-c-tweak-for-Wrange-loop-construct.patch | 114 ----
 ...ch-to-fix-data-relocation-to-ENDBR-s.patch | 447 --------------
 ...undef-_TIME_BITS-in-solaris-procmaps.patch |  62 --
 ...4fffe3fc82a710bea66ad651720d71c938b8.patch | 549 ------------------
 .../gcc/{gcc_14.2.bb => gcc_15.1.bb}          |   0
 ...initial_14.2.bb => libgcc-initial_15.1.bb} |   0
 .../gcc/{libgcc_14.2.bb => libgcc_15.1.bb}    |   0
 ...ibgfortran_14.2.bb => libgfortran_15.1.bb} |   0
 43 files changed, 269 insertions(+), 1475 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-14.2.inc => gcc-15.1.inc} (88%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_14.2.bb => gcc-cross-canadian_15.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_14.2.bb => gcc-cross_15.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_14.2.bb => gcc-crosssdk_15.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_14.2.bb => gcc-runtime_15.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_14.2.bb => gcc-sanitizers_15.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_14.2.bb => gcc-source_15.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-Append-GCC-private-include-paths-on-musl-instead-of-.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0027-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0028-libsanitizer-undef-_TIME_BITS-in-solaris-procmaps.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch
 rename meta/recipes-devtools/gcc/{gcc_14.2.bb => gcc_15.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_14.2.bb => libgcc-initial_15.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_14.2.bb => libgcc_15.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_14.2.bb => libgfortran_15.1.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8f480c768ec..52043e2eb75 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -201,7 +201,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gcc-source-14.2.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gcc-source-15.1.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-gdb = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index a3b3df2afad..f0443fbdc60 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -9,7 +9,7 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?= "binutils-crosssdk-${SDK_
 # Default libc config
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
-GCCVERSION ?= "14.%"
+GCCVERSION ?= "15.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 GLIBCVERSION ?= "2.41%"
 RUSTVERSION ?= "1.85.1%"
diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-devtools/gcc/gcc-15.1.inc
similarity index 88%
rename from meta/recipes-devtools/gcc/gcc-14.2.inc
rename to meta/recipes-devtools/gcc/gcc-15.1.inc
index ae2f8c06380..864c6091a6b 100644
--- a/meta/recipes-devtools/gcc/gcc-14.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.1.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "14.2.0"
+PV = "15.1.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "14.2.0"
+BINV = "15.1.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -31,16 +31,17 @@ LIC_FILES_CHKSUM = "\
 #SRC_URI[sha256sum] = "41bf7be5dc029112a9df625266e7de030ffc36ff3638f270b180ae8c91fe6449"
 
 # from snapshot
-#RELEASE ?= "14-20240504"
+#RELEASE ?= "15-20250420"
+#RELEASE ?= "15.1.0-RC-20250418"
 #BASEURI ?= "https://gcc.gnu.org/pub/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.xz"
 #SOURCEDIR ?= "gcc-${RELEASE}"
-#SRC_URI[sha256sum] = "34ac232bbf31e0cd5752fd344c2cf55719aaaad2ca0096593e01c97a3d5e274e"
+#SRC_URI[sha256sum] = "fe18624317c6c662977eea8b5a506ec6c132fc11c7a8d53e2f6d21b139b0af3c"
 
 # official release
 RELEASE ?= "${PV}"
 BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
 SOURCEDIR ?= "gcc-${PV}"
-SRC_URI[sha256sum] = "a7b39bc69cbf9e25826c5a60ab26477001f7c08d85cec04bc0e29cabed6f3cc9"
+SRC_URI[sha256sum] = "e2b09ec21660f01fecffb715e0120265216943f038d0e48a9868713e54f06cea"
 
 SRC_URI = "${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
@@ -68,10 +69,6 @@ SRC_URI = "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
-	   file://0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch \
-           file://0027-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch \
-           file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch \
-           file://0028-libsanitizer-undef-_TIME_BITS-in-solaris-procmaps.patch \
 "
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_14.2.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_15.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_14.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_15.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_14.2.bb b/meta/recipes-devtools/gcc/gcc-cross_15.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_14.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_15.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_14.2.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_15.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_14.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_15.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb b/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_14.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_15.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_14.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_15.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_14.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_15.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_14.2.bb b/meta/recipes-devtools/gcc/gcc-source_15.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_14.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_15.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
deleted file mode 100644
index 4693e948e8b..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5f2881333e6ba6eb055f590982c2a2eb3fcbee2c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 08:37:11 +0400
-Subject: [PATCH] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Inappropriate [embedded specific]
----
- configure    | 2 +-
- configure.ac | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 3b0abeb8b2e..2590471a021 100755
---- a/configure
-+++ b/configure
-@@ -10467,7 +10467,7 @@ fi
- # for target_alias and gcc doesn't manage it consistently.
- target_configargs="--cache-file=./config.cache ${target_configargs}"
- 
--FLAGS_FOR_TARGET=
-+FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
- case " $target_configdirs " in
-  *" newlib "*)
-   case " $target_configargs " in
-diff --git a/configure.ac b/configure.ac
-index 042681c27be..0d9b39c541a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3539,7 +3539,7 @@ fi
- # for target_alias and gcc doesn't manage it consistently.
- target_configargs="--cache-file=./config.cache ${target_configargs}"
- 
--FLAGS_FOR_TARGET=
-+FLAGS_FOR_TARGET="$ARCH_FLAGS_FOR_TARGET"
- case " $target_configdirs " in
-  *" newlib "*)
-   case " $target_configargs " in
diff --git a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
index 8523af1281f..9a7c0cbbde7 100644
--- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
@@ -1,6 +1,6 @@
-From 838daab44918ef738402a2dd069537c6ac519305 Mon Sep 17 00:00:00 2001
+From e96bf5b5f7df517012bc05a00910cbff4455b62f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 8 Mar 2021 16:04:20 -0800
+Date: Thu, 23 Jan 2025 17:12:51 -0800
 Subject: [PATCH] gcc: poison-system-directories
 
 Add /sw/include and /opt/include based on the original
@@ -13,23 +13,23 @@ wants this to be a failure, they can add "-Werror=poison-system-directories".
 
 Upstream-Status: Inappropriate [OE configuration]
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: sunil dora <sunilkumar.dora@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  gcc/common.opt      |  4 ++++
  gcc/config.in       | 10 ++++++++++
  gcc/configure       | 19 +++++++++++++++++++
  gcc/configure.ac    | 16 ++++++++++++++++
  gcc/doc/invoke.texi |  9 +++++++++
- gcc/gcc.cc          |  9 +++++++--
+ gcc/gcc.cc          | 12 ++++++++++--
  gcc/incpath.cc      | 25 +++++++++++++++++++++++++
- 7 files changed, 90 insertions(+), 2 deletions(-)
+ 7 files changed, 93 insertions(+), 2 deletions(-)
 
 diff --git a/gcc/common.opt b/gcc/common.opt
-index ad348844775..df3992b420d 100644
+index 88d987e6ab1..3ab512da994 100644
 --- a/gcc/common.opt
 +++ b/gcc/common.opt
-@@ -715,6 +715,10 @@ Wreturn-local-addr
+@@ -729,6 +729,10 @@ Wreturn-local-addr
  Common Var(warn_return_local_addr) Init(1) Warning
  Warn about returning a pointer/reference to a local or temporary variable.
  
@@ -41,7 +41,7 @@ index ad348844775..df3992b420d 100644
  Common Var(warn_shadow) Warning
  Warn when one variable shadows another.  Same as -Wshadow=global.
 diff --git a/gcc/config.in b/gcc/config.in
-index f3de4ba6776..3ce3113510b 100644
+index a79c51adb2b..8a531ed591c 100644
 --- a/gcc/config.in
 +++ b/gcc/config.in
 @@ -249,6 +249,16 @@
@@ -62,10 +62,10 @@ index f3de4ba6776..3ce3113510b 100644
     optimizer and back end) to be checked for dynamic type safety at runtime.
     This is quite expensive. */
 diff --git a/gcc/configure b/gcc/configure
-index abc8bfdc244..d3fa80408f4 100755
+index 16965953f05..0f4a5d52c30 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -1050,6 +1050,7 @@ enable_maintainer_mode
+@@ -1051,6 +1051,7 @@ enable_maintainer_mode
  enable_link_mutex
  enable_link_serialization
  enable_version_specific_runtime_libs
@@ -73,7 +73,7 @@ index abc8bfdc244..d3fa80408f4 100755
  enable_plugin
  enable_host_shared
  enable_host_pie
-@@ -1823,6 +1824,8 @@ Optional Features:
+@@ -1828,6 +1829,8 @@ Optional Features:
    --enable-version-specific-runtime-libs
                            specify that runtime libraries should be installed
                            in a compiler-specific directory
@@ -82,7 +82,7 @@ index abc8bfdc244..d3fa80408f4 100755
    --enable-plugin         enable plugin support
    --enable-host-shared    build host code as shared libraries
    --enable-host-pie       build host code as PIE
-@@ -34028,6 +34031,22 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
+@@ -34027,6 +34030,22 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
  fi
  
  
@@ -106,10 +106,10 @@ index abc8bfdc244..d3fa80408f4 100755
  
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 1d2cefa3f6a..2760b6c540c 100644
+index 9f67e62950a..b0e3615e5aa 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -7527,6 +7527,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
+@@ -7502,6 +7502,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
                  [specify that runtime libraries should be
                   installed in a compiler-specific directory])])
  
@@ -133,20 +133,20 @@ index 1d2cefa3f6a..2760b6c540c 100644
  AC_SUBST(subdirs)
  AC_SUBST(srcdir)
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index f82f7d2817b..1da91813b0e 100644
+index 020442aa032..480acada30a 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
-@@ -391,6 +391,7 @@ Objective-C and Objective-C++ Dialects}.
+@@ -405,6 +405,7 @@ Objective-C and Objective-C++ Dialects}.
  -Wpacked  -Wno-packed-bitfield-compat  -Wpacked-not-aligned  -Wpadded
  -Wparentheses  -Wno-pedantic-ms-format
  -Wpointer-arith  -Wno-pointer-compare  -Wno-pointer-to-int-cast
 +-Wno-poison-system-directories
- -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls
- -Wrestrict  -Wno-return-local-addr  -Wreturn-type
- -Wno-scalar-storage-order  -Wsequence-point
-@@ -8861,6 +8862,14 @@ made up of data only and thus requires no special treatment.  But, for
- most targets, it is made up of code and thus requires the stack to be
- made executable in order for the program to work properly.
+ -Wno-pragmas  -Wno-pragma-once-outside-header  -Wno-prio-ctor-dtor
+ -Wno-psabi
+ -Wredundant-decls  -Wrestrict
+@@ -10727,6 +10728,14 @@ an error. @option{Wint-to-pointer-cast} is enabled by default.
+ Suppress warnings from casts from a pointer to an integer type of a
+ different size.
  
 +@opindex Wno-poison-system-directories
 +@item -Wno-poison-system-directories
@@ -156,14 +156,14 @@ index f82f7d2817b..1da91813b0e 100644
 +directories contain the correct headers and libraries for the target
 +system rather than the host.
 +
- @opindex Wfloat-equal
- @opindex Wno-float-equal
- @item -Wfloat-equal
+ @opindex Winvalid-pch
+ @opindex Wno-invalid-pch
+ @item -Winvalid-pch
 diff --git a/gcc/gcc.cc b/gcc/gcc.cc
-index 728332b8153..a63f128cb95 100644
+index 4fd87f2c4a1..79d4920a047 100644
 --- a/gcc/gcc.cc
 +++ b/gcc/gcc.cc
-@@ -902,6 +902,12 @@ proper position among the other output files.  */
+@@ -909,6 +909,12 @@ proper position among the other output files.  */
  #define ASM_MAP ""
  #endif
  
@@ -176,7 +176,7 @@ index 728332b8153..a63f128cb95 100644
  /* Assembler options for compressed debug sections.  */
  #if HAVE_LD_COMPRESS_DEBUG == 0
  /* Reject if the linker cannot write compressed debug sections.  */
-@@ -1159,6 +1163,8 @@ proper position among the other output files.  */
+@@ -1166,6 +1172,8 @@ proper position among the other output files.  */
     "%{fuse-ld=*:-fuse-ld=%*} " LINK_COMPRESS_DEBUG_SPEC \
     "%X %{o*} %{e*} %{N} %{n} %{r}\
      %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!r:%{!nostartfiles:%S}}} \
@@ -185,7 +185,7 @@ index 728332b8153..a63f128cb95 100644
      %{static|no-pie|static-pie:} %@{L*} %(link_libgcc) " \
      VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o "" \
      %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=*:%*} 1):\
-@@ -1261,7 +1267,7 @@ static const char *cpp_options =
+@@ -1268,7 +1276,7 @@ static const char *cpp_options =
  "%(cpp_unique_options) %1 %{m*} %{std*&ansi&trigraphs} %{W*&pedantic*} %{w}\
   %{f*} %{g*:%{%:debug-level-gt(0):%{g*}\
   %{!fno-working-directory:-fworking-directory}}} %{O*}\
@@ -194,9 +194,9 @@ index 728332b8153..a63f128cb95 100644
  
  /* Pass -d* flags, possibly modifying -dumpdir, -dumpbase et al.
  
-@@ -1290,7 +1296,7 @@ static const char *cc1_options =
+@@ -1297,7 +1305,7 @@ static const char *cc1_options =
   %{coverage:-fprofile-arcs -ftest-coverage}\
-  %{fprofile-arcs|fcondition-coverage|fprofile-generate*|coverage:\
+  %{fprofile-arcs|fcondition-coverage|fpath-coverage|fprofile-generate*|coverage:\
     %{!fprofile-update=single:\
 -     %{pthread:-fprofile-update=prefer-atomic}}}";
 +     %{pthread:-fprofile-update=prefer-atomic}}}" POISON_IS_ERROR;
@@ -204,7 +204,7 @@ index 728332b8153..a63f128cb95 100644
  static const char *asm_options =
  "%{-target-help:%:print-asm-header()} "
 diff --git a/gcc/incpath.cc b/gcc/incpath.cc
-index 64cdd2f4a..89f42900d 100644
+index c1bbfd3872a..2cdbebc4c50 100644
 --- a/gcc/incpath.cc
 +++ b/gcc/incpath.cc
 @@ -26,6 +26,7 @@
@@ -216,19 +216,19 @@ index 64cdd2f4a..89f42900d 100644
  /* Microsoft Windows does not natively support inodes.
     VMS has non-numeric inodes.  */
 @@ -273,6 +274,10 @@ remove_duplicates (cpp_reader *pfile, struct cpp_dir *head,
-			     cur->name, xstrerror (errno));
-	      reason = REASON_NOENT;
-	    }
+ 			     cur->name, xstrerror (errno));
+ 	      reason = REASON_NOENT;
+ 	    }
 +#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
 +	  pcur = &cur->next;
 +	  continue;
 +#endif
-	}
+ 	}
        else if (!S_ISDIR (st.st_mode))
-	cpp_error_with_line (pfile, CPP_DL_WARNING, 0, 0,
-@@ -399,6 +404,26 @@ merge_include_chains (const char *sysroot, cpp_reader *pfile, int verbose)
+ 	cpp_error_with_line (pfile, CPP_DL_WARNING, 0, 0,
+@@ -411,6 +416,26 @@ merge_include_chains (const char *sysroot, cpp_reader *pfile, int verbose)
+ 	  fprintf (stderr, _("End of #embed search list.\n"));
  	}
-       fprintf (stderr, _("End of search list.\n"));
      }
 +
 +#ifdef ENABLE_POISON_SYSTEM_DIRECTORIES
@@ -253,5 +253,3 @@ index 64cdd2f4a..89f42900d 100644
  }
  
  /* Use given -I paths for #include "..." but not #include <...>, and
---
-2.34.1
diff --git a/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
index 55471b37cd9..7e771434673 100644
--- a/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
@@ -1,4 +1,4 @@
-From 33f9c4e4f0a5c2af8ab12612c28ba218ae491587 Mon Sep 17 00:00:00 2001
+From becb6f733f6e1f97f0ec42c11345ccbcf41103d0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:10:06 +0400
 Subject: [PATCH] 64-bit multilib hack
@@ -38,7 +38,7 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  6 files changed, 15 insertions(+), 42 deletions(-)
 
 diff --git a/gcc/config/aarch64/t-aarch64-linux b/gcc/config/aarch64/t-aarch64-linux
-index 3f7b786ecbb..a6c1c92fc7f 100644
+index 70e36b3299e..4267c32763c 100644
 --- a/gcc/config/aarch64/t-aarch64-linux
 +++ b/gcc/config/aarch64/t-aarch64-linux
 @@ -21,8 +21,8 @@
@@ -55,7 +55,7 @@ index 3f7b786ecbb..a6c1c92fc7f 100644
 -MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
 +#MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
 diff --git a/gcc/config/arc/t-multilib-linux b/gcc/config/arc/t-multilib-linux
-index 07bc77ba34a..f7e2e3919cf 100644
+index e72687260eb..f701fa9e201 100644
 --- a/gcc/config/arc/t-multilib-linux
 +++ b/gcc/config/arc/t-multilib-linux
 @@ -16,9 +16,9 @@
@@ -71,7 +71,7 @@ index 07bc77ba34a..f7e2e3919cf 100644
  # Aliases:
  MULTILIB_MATCHES += mcpu?arc700=mA7
 diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
-index f9edc289e57..047d8e4aff9 100644
+index 64a4a20e64f..2666e731dd6 100644
 --- a/gcc/config/i386/t-linux64
 +++ b/gcc/config/i386/t-linux64
 @@ -32,7 +32,5 @@
@@ -85,7 +85,7 @@ index f9edc289e57..047d8e4aff9 100644
 +MULTILIB_DIRNAMES = . .
 +MULTILIB_OSDIRNAMES = ../$(shell basename $(base_libdir)) ../$(shell basename $(base_libdir))
 diff --git a/gcc/config/mips/t-linux64 b/gcc/config/mips/t-linux64
-index e4e2f5eaedb..c503974de37 100644
+index 34a84461ebb..431a6b5183f 100644
 --- a/gcc/config/mips/t-linux64
 +++ b/gcc/config/mips/t-linux64
 @@ -17,29 +17,5 @@
@@ -134,7 +134,7 @@ index a6f64f88d25..0e21db58f7d 100644
 -MULTIARCH_DIRNAME := $(call if_multiarch,$(firstword $(subst -, ,$(target)))-linux-gnu)
 +#MULTIARCH_DIRNAME := $(call if_multiarch,$(firstword $(subst -, ,$(target)))-linux-gnu)
 diff --git a/gcc/config/rs6000/t-linux64 b/gcc/config/rs6000/t-linux64
-index 248b5891e36..379689561a7 100644
+index f56b47c268e..c408c32d8f4 100644
 --- a/gcc/config/rs6000/t-linux64
 +++ b/gcc/config/rs6000/t-linux64
 @@ -26,10 +26,9 @@
diff --git a/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch b/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
index 2dc6b13bfb7..ae720dcc79e 100644
--- a/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
+++ b/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
@@ -1,4 +1,4 @@
-From 40c537352e085df2157cf907da6d694266ab74fe Mon Sep 17 00:00:00 2001
+From fde5f38cfe95dbcf07c23627a176e85a3774c319 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 28 Oct 2021 11:33:40 +0100
 Subject: [PATCH] Pass CXXFLAGS_FOR_BUILD in a couple of places to avoid these
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 4 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index db4fa6c6260..dee862be8a5 100644
+index b1ed67d3d4f..4d7f45455a3 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -179,6 +179,7 @@ BUILD_EXPORTS = \
@@ -34,7 +34,7 @@ index db4fa6c6260..dee862be8a5 100644
  	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
  
  # This is the list of directories to built for the host system.
-@@ -211,6 +212,7 @@ HOST_EXPORTS = \
+@@ -212,6 +213,7 @@ HOST_EXPORTS = \
  	CPP_FOR_BUILD="$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
  	CPPFLAGS_FOR_BUILD="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUILD; \
  	CXX_FOR_BUILD="$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
@@ -43,7 +43,7 @@ index db4fa6c6260..dee862be8a5 100644
  	DSYMUTIL="$(DSYMUTIL)"; export DSYMUTIL; \
  	LD="$(LD)"; export LD; \
 diff --git a/Makefile.tpl b/Makefile.tpl
-index 1d5813cd569..ff0fae53b0c 100644
+index 7dccf91ed8e..7cb61bf63ea 100644
 --- a/Makefile.tpl
 +++ b/Makefile.tpl
 @@ -182,6 +182,7 @@ BUILD_EXPORTS = \
@@ -54,7 +54,7 @@ index 1d5813cd569..ff0fae53b0c 100644
  	LDFLAGS="$(LDFLAGS_FOR_BUILD)"
  
  # This is the list of directories to built for the host system.
-@@ -214,6 +215,7 @@ HOST_EXPORTS = \
+@@ -215,6 +216,7 @@ HOST_EXPORTS = \
  	CPP_FOR_BUILD="$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
  	CPPFLAGS_FOR_BUILD="$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUILD; \
  	CXX_FOR_BUILD="$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
diff --git a/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
index c386b502aa3..e809e13c734 100644
--- a/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
+++ b/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
@@ -1,4 +1,4 @@
-From d145dd6dec6863aa303503643b2d3ed470936dd0 Mon Sep 17 00:00:00 2001
+From 6c0bda3eb2f446a1cc484560e9f2ffd50632f5c2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:17:25 +0400
 Subject: [PATCH] Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}
@@ -26,10 +26,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  4 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index a74761b7ab3..956437df95b 100644
+index 55b4cd7dbed..5546e259a20 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -590,7 +590,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
+@@ -596,7 +596,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
  TARGET_SYSTEM_ROOT_DEFINE = @TARGET_SYSTEM_ROOT_DEFINE@
  
  xmake_file=@xmake_file@
@@ -39,10 +39,10 @@ index a74761b7ab3..956437df95b 100644
  TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
  TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
 diff --git a/gcc/configure b/gcc/configure
-index d3fa80408f4..f2706f94062 100755
+index 0f4a5d52c30..a2a8761055c 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -15161,8 +15161,8 @@ for f in $tm_file; do
+@@ -15106,8 +15106,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
@@ -54,10 +54,10 @@ index d3fa80408f4..f2706f94062 100755
      * )
         tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 2760b6c540c..3f972dea24f 100644
+index b0e3615e5aa..58ad9dc01fe 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -2390,8 +2390,8 @@ for f in $tm_file; do
+@@ -2426,8 +2426,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
@@ -69,7 +69,7 @@ index 2760b6c540c..3f972dea24f 100644
      * )
         tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
-index 1b015b70b38..145af56745e 100644
+index e02466b4416..0ea1a0c9ca6 100644
 --- a/gcc/mkconfig.sh
 +++ b/gcc/mkconfig.sh
 @@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
diff --git a/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch
index ca1158ee27b..f98ffca586e 100644
--- a/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch
+++ b/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch
@@ -1,4 +1,4 @@
-From 429711e243bbda4d662d687c1a6fea24fcb34827 Mon Sep 17 00:00:00 2001
+From 466af3c3ea187047bcb07d482d94fa15a1d29072 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:22:00 +0400
 Subject: [PATCH] cpp: honor sysroot.
@@ -26,10 +26,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
-index 7a7f5ff0ab5..fb3d88cdb11 100644
+index a67ce4c22a5..ce07a1c4b1d 100644
 --- a/gcc/cp/lang-specs.h
 +++ b/gcc/cp/lang-specs.h
-@@ -116,7 +116,7 @@ along with GCC; see the file COPYING3.  If not see
+@@ -122,7 +122,7 @@ along with GCC; see the file COPYING3.  If not see
    {".ii", "@c++-cpp-output", 0, 0, 0},
    {"@c++-cpp-output",
        "%{!E:%{!M:%{!MM:"
@@ -39,10 +39,10 @@ index 7a7f5ff0ab5..fb3d88cdb11 100644
        "    %{fmodule-only:%{!S:-o %g.s%V}}"
        "    %{!fmodule-only:%{!fmodule-header*:%(invoke_as)}}}"
 diff --git a/gcc/gcc.cc b/gcc/gcc.cc
-index 343e4915097..e3e9374d1cc 100644
+index 79d4920a047..c1488865b8b 100644
 --- a/gcc/gcc.cc
 +++ b/gcc/gcc.cc
-@@ -1487,7 +1487,7 @@ static const struct compiler default_compilers[] =
+@@ -1497,7 +1497,7 @@ static const struct compiler default_compilers[] =
  					   %W{o*:--output-pch %w%*}}%{!S:%V}}}}}}}}", 0, 0, 0},
    {".i", "@cpp-output", 0, 0, 0},
    {"@cpp-output",
diff --git a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index 4ed55015519..df4404204fb 100644
--- a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,4 +1,4 @@
-From 4067ae345f0ff1fbf37c0348f2af09257513b817 Mon Sep 17 00:00:00 2001
+From 385fb66c3179ec5f9d56f963dc51ffdc090ebebe Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
 Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
@@ -25,7 +25,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gcc/config/loongarch/gnu-user.h    |  4 ++--
  gcc/config/microblaze/linux.h      |  4 ++--
  gcc/config/mips/linux.h            | 18 +++++++++---------
- gcc/config/nios2/linux.h           |  4 ++--
  gcc/config/riscv/linux.h           |  4 ++--
  gcc/config/rs6000/linux64.h        | 15 +++++----------
  gcc/config/rs6000/sysv4.h          |  4 ++--
@@ -33,10 +32,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gcc/config/sh/linux.h              |  4 ++--
  gcc/config/sparc/linux.h           |  2 +-
  gcc/config/sparc/linux64.h         |  4 ++--
- 18 files changed, 53 insertions(+), 58 deletions(-)
+ 17 files changed, 51 insertions(+), 56 deletions(-)
 
 diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
-index 8e51c8202cc..732e4f4a477 100644
+index 116bb4e69f3..c0de4900dc2 100644
 --- a/gcc/config/aarch64/aarch64-linux.h
 +++ b/gcc/config/aarch64/aarch64-linux.h
 @@ -21,10 +21,10 @@
@@ -53,7 +52,7 @@ index 8e51c8202cc..732e4f4a477 100644
  #undef  ASAN_CC1_SPEC
  #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
 diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
-index 40ccf0bd9b4..ab5c59655fc 100644
+index 3fd3b831166..6471fa32b0b 100644
 --- a/gcc/config/alpha/linux-elf.h
 +++ b/gcc/config/alpha/linux-elf.h
 @@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
@@ -68,10 +67,10 @@ index 40ccf0bd9b4..ab5c59655fc 100644
  #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
  #elif DEFAULT_LIBC == LIBC_GLIBC
 diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
-index eef791f6a02..335cb4c3607 100644
+index 8ef5643b5d6..76893197773 100644
 --- a/gcc/config/arm/linux-eabi.h
 +++ b/gcc/config/arm/linux-eabi.h
-@@ -62,8 +62,8 @@
+@@ -65,8 +65,8 @@
     GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
  
  #undef  GLIBC_DYNAMIC_LINKER
@@ -82,7 +81,7 @@ index eef791f6a02..335cb4c3607 100644
  #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
  
  #define GLIBC_DYNAMIC_LINKER \
-@@ -86,7 +86,7 @@
+@@ -89,7 +89,7 @@
  #define MUSL_DYNAMIC_LINKER_E "%{mbig-endian:eb}"
  #endif
  #define MUSL_DYNAMIC_LINKER \
@@ -92,7 +91,7 @@ index eef791f6a02..335cb4c3607 100644
  /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
     use the GNU/Linux version, not the generic BPABI version.  */
 diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
-index ccae8abf6f6..ea421d03891 100644
+index d4d389e2aa8..6c4b1e13463 100644
 --- a/gcc/config/arm/linux-elf.h
 +++ b/gcc/config/arm/linux-elf.h
 @@ -60,7 +60,7 @@
@@ -105,7 +104,7 @@ index ccae8abf6f6..ea421d03891 100644
  #define LINUX_TARGET_LINK_SPEC  "%{h*} \
     %{static:-Bstatic} \
 diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
-index 20a96d56e65..7a7a4f873e4 100644
+index efbd978c610..9ea0261b0fc 100644
 --- a/gcc/config/i386/linux.h
 +++ b/gcc/config/i386/linux.h
 @@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -119,7 +118,7 @@ index 20a96d56e65..7a7a4f873e4 100644
 -#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
 +#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-i386.so.1"
 diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
-index 3dd23eef5e5..960cd7c0450 100644
+index 24170ee2845..733e3e4945a 100644
 --- a/gcc/config/i386/linux64.h
 +++ b/gcc/config/i386/linux64.h
 @@ -27,13 +27,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
@@ -143,7 +142,7 @@ index 3dd23eef5e5..960cd7c0450 100644
 -#define MUSL_DYNAMIC_LINKERX32 "/lib/ld-musl-x32.so.1"
 +#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-musl-x32.so.1"
 diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index a7248ac90d0..e36f32bf59e 100644
+index d6280a4d4dd..c79d4902f85 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
 @@ -86,10 +86,10 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
@@ -162,7 +161,7 @@ index a7248ac90d0..e36f32bf59e 100644
  #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
  #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
 diff --git a/gcc/config/loongarch/gnu-user.h b/gcc/config/loongarch/gnu-user.h
-index e5d84e180e3..98cb49c189f 100644
+index fbc75a90ad5..38c239940bd 100644
 --- a/gcc/config/loongarch/gnu-user.h
 +++ b/gcc/config/loongarch/gnu-user.h
 @@ -31,7 +31,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -184,7 +183,7 @@ index e5d84e180e3..98cb49c189f 100644
  #undef GNU_USER_TARGET_LINK_SPEC
  #define GNU_USER_TARGET_LINK_SPEC \
 diff --git a/gcc/config/microblaze/linux.h b/gcc/config/microblaze/linux.h
-index 5ed8ee518be..299d1a62c81 100644
+index 7b09cde7693..8bfafaf87f7 100644
 --- a/gcc/config/microblaze/linux.h
 +++ b/gcc/config/microblaze/linux.h
 @@ -28,7 +28,7 @@
@@ -206,7 +205,7 @@ index 5ed8ee518be..299d1a62c81 100644
  #undef  SUBTARGET_EXTRA_SPECS
  #define SUBTARGET_EXTRA_SPECS \
 diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
-index 8d098dd2f44..1c5ebbd26d5 100644
+index ae15d490108..0281650009d 100644
 --- a/gcc/config/mips/linux.h
 +++ b/gcc/config/mips/linux.h
 @@ -22,29 +22,29 @@ along with GCC; see the file COPYING3.  If not see
@@ -248,25 +247,8 @@ index 8d098dd2f44..1c5ebbd26d5 100644
  
  #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
  #define GNU_USER_DYNAMIC_LINKERN32 \
-diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
-index 06c442e85f4..b21a3c076c9 100644
---- a/gcc/config/nios2/linux.h
-+++ b/gcc/config/nios2/linux.h
-@@ -29,10 +29,10 @@
- #undef CPP_SPEC
- #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
- 
--#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
-+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux-nios2.so.1"
- 
- #undef MUSL_DYNAMIC_LINKER
--#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
-+#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-nios2.so.1"
- 
- #undef LINK_SPEC
- #define LINK_SPEC LINK_SPEC_ENDIAN \
 diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
-index 3c356227134..4d16bae86db 100644
+index 9060c940a44..c7712db194a 100644
 --- a/gcc/config/riscv/linux.h
 +++ b/gcc/config/riscv/linux.h
 @@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -288,7 +270,7 @@ index 3c356227134..4d16bae86db 100644
  #define ICACHE_FLUSH_FUNC "__riscv_flush_icache"
  
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index 655d1054d76..a11ae7643b7 100644
+index 0316d8cb65d..8de5eb8bb49 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
 @@ -340,24 +340,19 @@ extern int dot_symbols;
@@ -322,10 +304,10 @@ index 655d1054d76..a11ae7643b7 100644
  #undef  DEFAULT_ASM_ENDIAN
  #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
 diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
-index bcafa9d0cf4..8fda952e69c 100644
+index afb5c6ad867..3eb6c814ced 100644
 --- a/gcc/config/rs6000/sysv4.h
 +++ b/gcc/config/rs6000/sysv4.h
-@@ -771,10 +771,10 @@ GNU_USER_TARGET_CC1_SPEC
+@@ -772,10 +772,10 @@ GNU_USER_TARGET_CC1_SPEC
  
  #define MUSL_DYNAMIC_LINKER_E ENDIAN_SELECT("","le","")
  
@@ -339,7 +321,7 @@ index bcafa9d0cf4..8fda952e69c 100644
  #ifndef GNU_USER_DYNAMIC_LINKER
  #define GNU_USER_DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER
 diff --git a/gcc/config/s390/linux.h b/gcc/config/s390/linux.h
-index 83ea2f669a0..bc7cffbad3f 100644
+index 2c3bca5dfcb..1332624abad 100644
 --- a/gcc/config/s390/linux.h
 +++ b/gcc/config/s390/linux.h
 @@ -72,13 +72,13 @@ along with GCC; see the file COPYING3.  If not see
@@ -361,7 +343,7 @@ index 83ea2f669a0..bc7cffbad3f 100644
  #undef  LINK_SPEC
  #define LINK_SPEC \
 diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
-index 34cbbed633f..14000d3394c 100644
+index 78a7905a919..28493851982 100644
 --- a/gcc/config/sh/linux.h
 +++ b/gcc/config/sh/linux.h
 @@ -61,10 +61,10 @@ along with GCC; see the file COPYING3.  If not see
@@ -378,7 +360,7 @@ index 34cbbed633f..14000d3394c 100644
  #undef SUBTARGET_LINK_EMUL_SUFFIX
  #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
 diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
-index 9646fa9c41e..396fb047fac 100644
+index 6d928846895..cd35dc8fa30 100644
 --- a/gcc/config/sparc/linux.h
 +++ b/gcc/config/sparc/linux.h
 @@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
@@ -391,7 +373,7 @@ index 9646fa9c41e..396fb047fac 100644
  #undef  LINK_SPEC
  #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
 diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
-index 83e0d6874d9..9a32d2cfff5 100644
+index 97d5012f43f..65162c7c300 100644
 --- a/gcc/config/sparc/linux64.h
 +++ b/gcc/config/sparc/linux64.h
 @@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.  If not see
diff --git a/meta/recipes-devtools/gcc/gcc/0008-libtool.patch b/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
index b8081d46144..3e56a3dacfc 100644
--- a/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
+++ b/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
@@ -1,4 +1,4 @@
-From 462e2111804490fcdbb9fd87a86b1e7ac1805803 Mon Sep 17 00:00:00 2001
+From 195aa5c28f0c1557e3f7db80d5d13f36085b2e8d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:29:11 +0400
 Subject: [PATCH] libtool
@@ -22,10 +22,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/ltmain.sh b/ltmain.sh
-index 70990740b6c..ee938056bef 100644
+index 1a710177fb2..e8474602b0b 100644
 --- a/ltmain.sh
 +++ b/ltmain.sh
-@@ -6359,6 +6359,10 @@ func_mode_link ()
+@@ -6381,6 +6381,10 @@ func_mode_link ()
  	func_warning "ignoring multiple \`-rpath's for a libtool library"
  
        install_libdir="$1"
diff --git a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
index 015777c35b3..96af45f3727 100644
--- a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -1,4 +1,4 @@
-From 702550757997de7013c96047dbc07791e5ff1d32 Mon Sep 17 00:00:00 2001
+From 186c8e5e90a640fd525fd29496f95b9127d81a83 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:30:32 +0400
 Subject: [PATCH] gcc: armv4: pass fix-v4bx to linker to support EABI.
@@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
-index 335cb4c3607..1d5235075cb 100644
+index 76893197773..12c334463c6 100644
 --- a/gcc/config/arm/linux-eabi.h
 +++ b/gcc/config/arm/linux-eabi.h
-@@ -88,10 +88,14 @@
+@@ -91,10 +91,14 @@
  #define MUSL_DYNAMIC_LINKER \
    SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
  
diff --git a/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
index 9920e61a7f0..69017040e74 100644
--- a/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
+++ b/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
@@ -1,4 +1,4 @@
-From 818edee70eb8c5471a9d2924dd50f7cdd9774c12 Mon Sep 17 00:00:00 2001
+From 7f016af1a83d594d4410dbe5d89687116f1381ca Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:33:04 +0400
 Subject: [PATCH] Use the multilib config files from ${B} instead of using the
@@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [configuration]
  2 files changed, 36 insertions(+), 8 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index f2706f94062..135c557b595 100755
+index a2a8761055c..a5a028f39c3 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -15141,10 +15141,20 @@ done
+@@ -15086,10 +15086,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -46,7 +46,7 @@ index f2706f94062..135c557b595 100755
  done
  tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
  
-@@ -15155,6 +15165,10 @@ tm_file_list="options.h"
+@@ -15100,6 +15110,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
@@ -58,10 +58,10 @@ index f2706f94062..135c557b595 100755
         f=`echo $f | sed 's/^..//'`
         tm_file_list="${tm_file_list} $f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 3f972dea24f..cbf8fea3ca1 100644
+index 58ad9dc01fe..36ed7153398 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -2370,10 +2370,20 @@ done
+@@ -2406,10 +2406,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -86,7 +86,7 @@ index 3f972dea24f..cbf8fea3ca1 100644
  done
  tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
  
-@@ -2384,6 +2394,10 @@ tm_file_list="options.h"
+@@ -2420,6 +2430,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
diff --git a/meta/recipes-devtools/gcc/gcc/0011-aarch64-Fix-include-paths-when-S-B.patch b/meta/recipes-devtools/gcc/gcc/0011-aarch64-Fix-include-paths-when-S-B.patch
index 0b19de57c04..f4fb3aa3a49 100644
--- a/meta/recipes-devtools/gcc/gcc/0011-aarch64-Fix-include-paths-when-S-B.patch
+++ b/meta/recipes-devtools/gcc/gcc/0011-aarch64-Fix-include-paths-when-S-B.patch
@@ -1,4 +1,4 @@
-From 875975598d5a1000b8c8ad7596178d0a64f9e0cb Mon Sep 17 00:00:00 2001
+From 14aaaf080c5814bf3945b784cdd6ef6c88b31ab4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 31 Jan 2023 22:03:38 -0800
 Subject: [PATCH] aarch64: Fix include paths when S != B
@@ -28,10 +28,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
-index 4fa1dfc7906..63c9a832d1c 100644
+index e8bd8c73c12..6ea05b64601 100644
 --- a/gcc/config/aarch64/aarch64.h
 +++ b/gcc/config/aarch64/aarch64.h
-@@ -170,9 +170,9 @@ enum class aarch64_feature : unsigned char {
+@@ -163,9 +163,9 @@ enum class aarch64_feature : unsigned char {
  #define DEF_AARCH64_ISA_MODE(IDENT) IDENT,
  #define AARCH64_OPT_EXTENSION(A, IDENT, C, D, E, F) IDENT,
  #define AARCH64_ARCH(A, B, IDENT, D, E) IDENT,
@@ -44,7 +44,7 @@ index 4fa1dfc7906..63c9a832d1c 100644
  };
  
  /* Define unique flags for each of the above.  */
-@@ -182,16 +182,16 @@ enum class aarch64_feature : unsigned char {
+@@ -175,16 +175,16 @@ enum class aarch64_feature : unsigned char {
  #define DEF_AARCH64_ISA_MODE(IDENT) HANDLE (IDENT)
  #define AARCH64_OPT_EXTENSION(A, IDENT, C, D, E, F) HANDLE (IDENT)
  #define AARCH64_ARCH(A, B, IDENT, D, E) HANDLE (IDENT)
@@ -56,12 +56,12 @@ index 4fa1dfc7906..63c9a832d1c 100644
 +#include "config/aarch64/aarch64-arches.def"
  #undef HANDLE
  
- constexpr auto AARCH64_FL_SM_STATE = AARCH64_FL_SM_ON | AARCH64_FL_SM_OFF;
- 
- constexpr unsigned int AARCH64_NUM_ISA_MODES = (0
- #define DEF_AARCH64_ISA_MODE(IDENT) + 1
+ /* Define aarch64_isa_mode masks.  */
+ #define DEF_AARCH64_ISA_MODE(IDENT) \
+   constexpr auto AARCH64_ISA_MODE_##IDENT ATTRIBUTE_UNUSED \
+     = aarch64_isa_mode (1) << int (aarch64_feature::IDENT);
 -#include "aarch64-isa-modes.def"
 +#include "config/aarch64/aarch64-isa-modes.def"
- );
+ #undef HANDLE
  
- /* The mask of all ISA modes.  */
+ constexpr auto AARCH64_FL_SM_STATE ATTRIBUTE_UNUSED
diff --git a/meta/recipes-devtools/gcc/gcc/0012-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc/0012-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
index 6eb5bceebdb..cf7c81f84ec 100644
--- a/meta/recipes-devtools/gcc/gcc/0012-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
+++ b/meta/recipes-devtools/gcc/gcc/0012-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
@@ -1,4 +1,4 @@
-From b38add903c7f701e5b79dd7d93fb7dc61d8252c7 Mon Sep 17 00:00:00 2001
+From dec5104517546c0bac5256c0ff6da5304bd5ba7f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:39:38 +0000
 Subject: [PATCH] Avoid using libdir from .la which usually points to a host
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/ltmain.sh b/ltmain.sh
-index ee938056bef..9ebc7e3d1e0 100644
+index e8474602b0b..ef93f977a52 100644
 --- a/ltmain.sh
 +++ b/ltmain.sh
-@@ -5628,6 +5628,9 @@ func_mode_link ()
+@@ -5650,6 +5650,9 @@ func_mode_link ()
  	    absdir="$abs_ladir"
  	    libdir="$abs_ladir"
  	  else
diff --git a/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch
index 32a126ac8a1..db87b16dda2 100644
--- a/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch
@@ -1,4 +1,4 @@
-From 304299aef8b1ae1f89a0fabbceed0d48091b569b Mon Sep 17 00:00:00 2001
+From 611a11294861f6a643c43de02127a4b86f19c1a1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:25:11 +0000
 Subject: [PATCH] Ensure target gcc headers can be included
@@ -25,10 +25,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 22 insertions(+)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 956437df95b..6a009c696e9 100644
+index 5546e259a20..944d0a6680a 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -671,6 +671,7 @@ libexecdir = @libexecdir@
+@@ -680,6 +680,7 @@ libexecdir = @libexecdir@
  
  # Directory in which the compiler finds libraries etc.
  libsubdir = $(libdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
@@ -36,7 +36,7 @@ index 956437df95b..6a009c696e9 100644
  # Directory in which the compiler finds executables
  libexecsubdir = $(libexecdir)/gcc/$(real_target_noncanonical)/$(version)$(accel_dir_suffix)
  # Directory in which all plugin resources are installed
-@@ -3199,6 +3200,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
+@@ -3397,6 +3398,7 @@ CFLAGS-intl.o += -DLOCALEDIR=\"$(localedir)\"
  
  PREPROCESSOR_DEFINES = \
    -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
@@ -45,7 +45,7 @@ index 956437df95b..6a009c696e9 100644
    -DGPLUSPLUS_INCLUDE_DIR=\"$(gcc_gxx_include_dir)\" \
    -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=$(gcc_gxx_include_dir_add_sysroot) \
 diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index e36f32bf59e..c6aada42eb7 100644
+index c79d4902f85..640def63c27 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
 @@ -157,6 +157,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
@@ -71,10 +71,10 @@ index e36f32bf59e..c6aada42eb7 100644
      { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
      { 0, 0, 0, 0, 0, 0 }				\
 diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
-index 8fda952e69c..247acec9d8e 100644
+index 3eb6c814ced..d534b9d2295 100644
 --- a/gcc/config/rs6000/sysv4.h
 +++ b/gcc/config/rs6000/sysv4.h
-@@ -986,6 +986,13 @@ ncrtn.o%s"
+@@ -987,6 +987,13 @@ ncrtn.o%s"
  #define INCLUDE_DEFAULTS_MUSL_TOOL
  #endif
  
@@ -88,7 +88,7 @@ index 8fda952e69c..247acec9d8e 100644
  #ifdef NATIVE_SYSTEM_HEADER_DIR
  #define INCLUDE_DEFAULTS_MUSL_NATIVE			\
      { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },	\
-@@ -1012,6 +1019,7 @@ ncrtn.o%s"
+@@ -1013,6 +1020,7 @@ ncrtn.o%s"
      INCLUDE_DEFAULTS_MUSL_PREFIX			\
      INCLUDE_DEFAULTS_MUSL_CROSS				\
      INCLUDE_DEFAULTS_MUSL_TOOL				\
@@ -97,7 +97,7 @@ index 8fda952e69c..247acec9d8e 100644
      { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
      { 0, 0, 0, 0, 0, 0 }				\
 diff --git a/gcc/cppdefault.cc b/gcc/cppdefault.cc
-index f82b4badad7..98bd66f95c6 100644
+index f98c39c53ec..db1e517fadc 100644
 --- a/gcc/cppdefault.cc
 +++ b/gcc/cppdefault.cc
 @@ -64,6 +64,10 @@ const struct default_include cpp_include_defaults[]
diff --git a/meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch
index 5f48dccc0a2..4b3a8a064c1 100644
--- a/meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch
+++ b/meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch
@@ -1,4 +1,4 @@
-From a32cbf0d1c036e6435469898829f96a02c5993a8 Mon Sep 17 00:00:00 2001
+From e772dabb70136d6465f0c53e1885493a79c1ef06 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Mar 2015 08:21:19 +0000
 Subject: [PATCH] Don't search host directory during "relink" if $inst_prefix
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/ltmain.sh b/ltmain.sh
-index 9ebc7e3d1e0..7ea79fa8be6 100644
+index ef93f977a52..2ae16bf5d63 100644
 --- a/ltmain.sh
 +++ b/ltmain.sh
-@@ -6004,12 +6004,13 @@ func_mode_link ()
+@@ -6026,12 +6026,13 @@ func_mode_link ()
  	      fi
  	    else
  	      # We cannot seem to hardcode it, guess we'll fake it.
diff --git a/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch
index e34e65e4799..ad11f953c53 100644
--- a/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch
+++ b/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch
@@ -1,4 +1,4 @@
-From 6721497a3b4b575e5f9eae785dd4eca0f87b4a5b Mon Sep 17 00:00:00 2001
+From f19001f705006be28e724db5f3d7487afdd09630 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Sun, 5 Jul 2015 20:25:18 -0700
 Subject: [PATCH] libcc1: fix libcc1's install path and rpath
@@ -20,7 +20,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  2 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
-index b592bc8645f..97e2b615fb7 100644
+index f79e48a9aa2..bd8390946a2 100644
 --- a/libcc1/Makefile.am
 +++ b/libcc1/Makefile.am
 @@ -40,8 +40,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
@@ -35,7 +35,7 @@ index b592bc8645f..97e2b615fb7 100644
  if ENABLE_PLUGIN
  plugin_LTLIBRARIES = libcc1plugin.la libcp1plugin.la
 diff --git a/libcc1/Makefile.in b/libcc1/Makefile.in
-index f8f590d71e9..56462492045 100644
+index 9d56a8323b0..4deb08d8b34 100644
 --- a/libcc1/Makefile.in
 +++ b/libcc1/Makefile.in
 @@ -396,8 +396,8 @@ libiberty = $(if $(wildcard $(libiberty_noasan)),$(Wc)$(libiberty_noasan), \
diff --git a/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch
index edd100ee465..b0b59d4be63 100644
--- a/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -1,4 +1,4 @@
-From 3f5ac862051e1c77dcca3e63a912f43d66ccdb6f Mon Sep 17 00:00:00 2001
+From 855fe25ef956429ad03726282516c901526861fc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:39:54 +0000
 Subject: [PATCH] handle sysroot support for nativesdk-gcc
@@ -46,10 +46,10 @@ Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
  8 files changed, 95 insertions(+), 73 deletions(-)
 
 diff --git a/gcc/c-family/c-opts.cc b/gcc/c-family/c-opts.cc
-index f4dced8d826..911aeb68d2d 100644
+index d43b3aef102..b157ad37483 100644
 --- a/gcc/c-family/c-opts.cc
 +++ b/gcc/c-family/c-opts.cc
-@@ -1542,8 +1542,8 @@ add_prefixed_path (const char *suffix, incpath_kind chain)
+@@ -1610,8 +1610,8 @@ add_prefixed_path (const char *suffix, incpath_kind chain)
    size_t prefix_len, suffix_len;
  
    suffix_len = strlen (suffix);
@@ -61,7 +61,7 @@ index f4dced8d826..911aeb68d2d 100644
    path = (char *) xmalloc (prefix_len + suffix_len + 1);
    memcpy (path, prefix, prefix_len);
 diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index c6aada42eb7..79ff13184d3 100644
+index 640def63c27..0f937abe729 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
 @@ -121,53 +121,53 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
@@ -139,10 +139,10 @@ index c6aada42eb7..79ff13184d3 100644
    }
  #endif
 diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
-index 247acec9d8e..5526bf050b8 100644
+index d534b9d2295..c5257425705 100644
 --- a/gcc/config/rs6000/sysv4.h
 +++ b/gcc/config/rs6000/sysv4.h
-@@ -950,53 +950,53 @@ ncrtn.o%s"
+@@ -951,53 +951,53 @@ ncrtn.o%s"
  /* Include order changes for musl, same as in generic linux.h.  */
  #if DEFAULT_LIBC == LIBC_MUSL
  #define INCLUDE_DEFAULTS_MUSL_GPP			\
@@ -207,7 +207,7 @@ index 247acec9d8e..5526bf050b8 100644
  #else
  #define INCLUDE_DEFAULTS_MUSL_NATIVE
  #endif
-@@ -1021,7 +1021,7 @@ ncrtn.o%s"
+@@ -1022,7 +1022,7 @@ ncrtn.o%s"
      INCLUDE_DEFAULTS_MUSL_TOOL				\
      INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET			\
      INCLUDE_DEFAULTS_MUSL_NATIVE			\
@@ -217,7 +217,7 @@ index 247acec9d8e..5526bf050b8 100644
    }
  #endif
 diff --git a/gcc/cppdefault.cc b/gcc/cppdefault.cc
-index 98bd66f95c6..742a4e56d5b 100644
+index db1e517fadc..8867e8bb341 100644
 --- a/gcc/cppdefault.cc
 +++ b/gcc/cppdefault.cc
 @@ -35,6 +35,30 @@
@@ -347,7 +347,7 @@ index 98bd66f95c6..742a4e56d5b 100644
  /* This value is set by cpp_relocated at runtime */
  const char *gcc_exec_prefix;
 diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
-index e9b9264caff..168144b84b8 100644
+index e033af78280..0af197df7b2 100644
 --- a/gcc/cppdefault.h
 +++ b/gcc/cppdefault.h
 @@ -33,7 +33,8 @@
@@ -382,10 +382,10 @@ index e9b9264caff..168144b84b8 100644
     subdirectory of the actual installation.  */
  extern const char *gcc_exec_prefix;
 diff --git a/gcc/gcc.cc b/gcc/gcc.cc
-index e3e9374d1cc..b080609341b 100644
+index c1488865b8b..007c91780f6 100644
 --- a/gcc/gcc.cc
 +++ b/gcc/gcc.cc
-@@ -259,6 +259,8 @@ FILE *report_times_to_file = NULL;
+@@ -265,6 +265,8 @@ FILE *report_times_to_file = NULL;
  #endif
  static const char *target_system_root = DEFAULT_TARGET_SYSTEM_ROOT;
  
@@ -394,7 +394,7 @@ index e3e9374d1cc..b080609341b 100644
  /* Nonzero means pass the updated target_system_root to the compiler.  */
  
  static int target_system_root_changed;
-@@ -591,6 +593,7 @@ or with constant text in a single argument.
+@@ -598,6 +600,7 @@ or with constant text in a single argument.
   %G     process LIBGCC_SPEC as a spec.
   %R     Output the concatenation of target_system_root and
          target_sysroot_suffix.
@@ -402,7 +402,7 @@ index e3e9374d1cc..b080609341b 100644
   %S     process STARTFILE_SPEC as a spec.  A capital S is actually used here.
   %E     process ENDFILE_SPEC as a spec.  A capital E is actually used here.
   %C     process CPP_SPEC as a spec.
-@@ -1638,10 +1641,10 @@ static const char *gcc_libexec_prefix;
+@@ -1648,10 +1651,10 @@ static const char *gcc_libexec_prefix;
     gcc_exec_prefix is set because, in that case, we know where the
     compiler has been installed, and use paths relative to that
     location instead.  */
@@ -417,7 +417,7 @@ index e3e9374d1cc..b080609341b 100644
  
  /* For native compilers, these are well-known paths containing
     components that may be provided by the system.  For cross
-@@ -1649,9 +1652,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
+@@ -1659,9 +1662,9 @@ static const char *const standard_startfile_prefix = STANDARD_STARTFILE_PREFIX;
  static const char *md_exec_prefix = MD_EXEC_PREFIX;
  static const char *md_startfile_prefix = MD_STARTFILE_PREFIX;
  static const char *md_startfile_prefix_1 = MD_STARTFILE_PREFIX_1;
@@ -429,7 +429,7 @@ index e3e9374d1cc..b080609341b 100644
    = STANDARD_STARTFILE_PREFIX_2;
  
  /* A relative path to be used in finding the location of tools
-@@ -6796,6 +6799,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
+@@ -6837,6 +6840,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
  	      }
  	    break;
  
@@ -442,7 +442,7 @@ index e3e9374d1cc..b080609341b 100644
  	    value = do_spec_1 (startfile_spec, 0, NULL);
  	    if (value != 0)
 diff --git a/gcc/incpath.cc b/gcc/incpath.cc
-index e572d98ab17..2cb2b586e4a 100644
+index 2cdbebc4c50..b61a9d1b2fc 100644
 --- a/gcc/incpath.cc
 +++ b/gcc/incpath.cc
 @@ -135,7 +135,7 @@ add_standard_paths (const char *sysroot, const char *iprefix,
@@ -489,7 +489,7 @@ index e572d98ab17..2cb2b586e4a 100644
  	      str = update_path (ostr, p->component);
  	      free (ostr);
 diff --git a/gcc/prefix.cc b/gcc/prefix.cc
-index 6a98e856855..c403b2da7a3 100644
+index 0c79d60a6c8..27c79f09be4 100644
 --- a/gcc/prefix.cc
 +++ b/gcc/prefix.cc
 @@ -73,7 +73,9 @@ License along with GCC; see the file COPYING3.  If not see
diff --git a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
index 39c3bab9cc1..3b8cc90a6c2 100644
--- a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
+++ b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -1,4 +1,4 @@
-From b2d95de58356c242abfe35467c2366d4e4b842ce Mon Sep 17 00:00:00 2001
+From a81407037281db31020f21edf43e42d62dfee565 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:41:45 +0000
 Subject: [PATCH] Search target sysroot gcc version specific dirs with
@@ -52,10 +52,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 28 insertions(+), 1 deletion(-)
 
 diff --git a/gcc/gcc.cc b/gcc/gcc.cc
-index b080609341b..1a1ca05064e 100644
+index 007c91780f6..22eb17bc099 100644
 --- a/gcc/gcc.cc
 +++ b/gcc/gcc.cc
-@@ -2823,7 +2823,7 @@ for_each_path (const struct path_prefix *paths,
+@@ -2837,7 +2837,7 @@ for_each_path (const struct path_prefix *paths,
        if (path == NULL)
  	{
  	  len = paths->max_len + extra_space + 1;
@@ -64,7 +64,7 @@ index b080609341b..1a1ca05064e 100644
  	  path = XNEWVEC (char, len);
  	}
  
-@@ -2835,6 +2835,33 @@ for_each_path (const struct path_prefix *paths,
+@@ -2849,6 +2849,33 @@ for_each_path (const struct path_prefix *paths,
  	  /* Look first in MACHINE/VERSION subdirectory.  */
  	  if (!skip_multi_dir)
  	    {
diff --git a/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
index 76da0f79bff..304383d5f7f 100644
--- a/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+++ b/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -1,4 +1,4 @@
-From e420858f23a1fe58e840bd5ae21cb5a964b27f0b Mon Sep 17 00:00:00 2001
+From 78ae0152bc829d68c1b73e79675c9d2c3593fba7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 27 Jun 2017 18:10:54 -0700
 Subject: [PATCH] Add ssp_nonshared to link commandline for musl targets
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 27 insertions(+)
 
 diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index 79ff13184d3..19f552e8c7d 100644
+index 0f937abe729..88e59d1f78c 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
 @@ -195,6 +195,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
@@ -41,7 +41,7 @@ index 79ff13184d3..19f552e8c7d 100644
  
  #if (DEFAULT_LIBC == LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClinux */
 diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
-index 5f6cede558a..900993b6da4 100644
+index 6c4480b70c4..89ae8267482 100644
 --- a/gcc/config/rs6000/linux.h
 +++ b/gcc/config/rs6000/linux.h
 @@ -102,6 +102,16 @@
@@ -62,7 +62,7 @@ index 5f6cede558a..900993b6da4 100644
  #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static: \
    %{!static-pie: \
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index a11ae7643b7..2abde270813 100644
+index 8de5eb8bb49..4eb5cc2c7cf 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
 @@ -373,6 +373,16 @@ extern int dot_symbols;
diff --git a/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandline-options.patch b/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandline-options.patch
index 05f2e969470..6958508e2b0 100644
--- a/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandline-options.patch
+++ b/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandline-options.patch
@@ -1,4 +1,4 @@
-From edc8f1cee2c9c4a441032fa22d0272b41b829dc6 Mon Sep 17 00:00:00 2001
+From 45fa660da59ac4ec305ff5945881fabd904a5039 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 6 Jun 2018 12:10:22 -0700
 Subject: [PATCH] Re-introduce spe commandline options
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 13 insertions(+)
 
 diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs6000.opt
-index e8ca70340df..5c8545d4f1b 100644
+index 88cf16ca581..fc283ccc934 100644
 --- a/gcc/config/rs6000/rs6000.opt
 +++ b/gcc/config/rs6000/rs6000.opt
-@@ -344,6 +344,19 @@ mdebug=
+@@ -348,6 +348,19 @@ mdebug=
  Target RejectNegative Joined
  -mdebug=	Enable debug output.
  
diff --git a/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
index 30868410217..c67b3791147 100644
--- a/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
+++ b/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
@@ -1,4 +1,4 @@
-From 83a61604293c6f7a131bccaf7454e69eeed301fd Mon Sep 17 00:00:00 2001
+From aa62fafac284ee19434889b733c0d24ca96d75b1 Mon Sep 17 00:00:00 2001
 From: Szabolcs Nagy <nsz@port70.net>
 Date: Sat, 24 Oct 2015 20:09:53 +0000
 Subject: [PATCH] libgcc_s: Use alias for __cpu_indicator_init instead of
@@ -39,10 +39,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/gcc/config/i386/i386-expand.cc b/gcc/config/i386/i386-expand.cc
-index 51efe6fdd7d..a8ee883a74d 100644
+index 36f71eb4a97..53628f7da3d 100644
 --- a/gcc/config/i386/i386-expand.cc
 +++ b/gcc/config/i386/i386-expand.cc
-@@ -13087,10 +13087,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
+@@ -13643,10 +13643,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
      {
      case IX86_BUILTIN_CPU_INIT:
        {
@@ -56,7 +56,7 @@ index 51efe6fdd7d..a8ee883a74d 100644
  	return expand_expr (call_expr, target, mode, EXPAND_NORMAL);
        }
 diff --git a/libgcc/config/i386/cpuinfo.c b/libgcc/config/i386/cpuinfo.c
-index 0bd6dffe17e..ef4acb175a4 100644
+index 2484dc839bf..e980030ef23 100644
 --- a/libgcc/config/i386/cpuinfo.c
 +++ b/libgcc/config/i386/cpuinfo.c
 @@ -63,7 +63,7 @@ __cpu_indicator_init (void)
diff --git a/meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch b/meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
index f459a542da1..2fbf7e07b84 100644
--- a/meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
+++ b/meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
@@ -1,4 +1,4 @@
-From 33eb17881ca90cff733070c5b630501fb0a8bd58 Mon Sep 17 00:00:00 2001
+From 56163decbd4470bd0bc5e96c42280d4dd99a8e6d Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 10 Mar 2020 08:26:53 -0700
 Subject: [PATCH] gentypes/genmodes: Do not use __LINE__ for maintaining
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 19 insertions(+), 19 deletions(-)
 
 diff --git a/gcc/gengtype.cc b/gcc/gengtype.cc
-index c0ecbe8558b..9f8ab7146c0 100644
+index 6a3621c96cd..3f6c36dcff5 100644
 --- a/gcc/gengtype.cc
 +++ b/gcc/gengtype.cc
 @@ -1005,7 +1005,7 @@ create_field_at (pair_p next, type_p type, const char *name, options_p opt,
@@ -38,7 +38,7 @@ index c0ecbe8558b..9f8ab7146c0 100644
  
  /* Reverse a linked list of 'struct pair's in place.  */
  pair_p
-@@ -5232,7 +5232,7 @@ main (int argc, char **argv)
+@@ -5238,7 +5238,7 @@ main (int argc, char **argv)
        /* These types are set up with #define or else outside of where
           we can see them.  We should initialize them before calling
           read_input_list.  */
@@ -48,7 +48,7 @@ index c0ecbe8558b..9f8ab7146c0 100644
        POS_HERE (do_scalar_typedef ("CUMULATIVE_ARGS", &pos));
        POS_HERE (do_scalar_typedef ("REAL_VALUE_TYPE", &pos));
 diff --git a/gcc/genmodes.cc b/gcc/genmodes.cc
-index eb3f9e2f0c1..5425635cb22 100644
+index 7af79720189..3bdb82ef8bf 100644
 --- a/gcc/genmodes.cc
 +++ b/gcc/genmodes.cc
 @@ -441,7 +441,7 @@ complete_all_modes (void)
diff --git a/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch
index 169db188dff..ed57a635d13 100644
--- a/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch
+++ b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch
@@ -1,4 +1,4 @@
-From 6ebeb70ce2e78a84295f4e392602ae3c4026783a Mon Sep 17 00:00:00 2001
+From 61e0fcb278b01bbda61bed3306e36f17f4d48068 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 May 2020 15:10:38 -0700
 Subject: [PATCH] libatomic: Do not enforce march on aarch64
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 deletions(-)
 
 diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
-index 980677f3533..26188917946 100644
+index 0f1a7156084..255fe448e63 100644
 --- a/libatomic/Makefile.am
 +++ b/libatomic/Makefile.am
-@@ -130,7 +130,6 @@ libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix _$(s)_.lo,$(SIZEOBJS)))
+@@ -128,7 +128,6 @@ libatomic_la_LIBADD = $(foreach s,$(SIZES),$(addsuffix _$(s)_.lo,$(SIZEOBJS)))
  ## On a target-specific basis, include alternates to be selected by IFUNC.
  if HAVE_IFUNC
  if ARCH_AARCH64_LINUX
@@ -29,7 +29,7 @@ index 980677f3533..26188917946 100644
  
  endif
 diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
-index d9d529bc502..47dacef9e01 100644
+index 9798e7c09e9..3b3027eb77d 100644
 --- a/libatomic/Makefile.in
 +++ b/libatomic/Makefile.in
 @@ -452,7 +452,6 @@ M_SRC = $(firstword $(filter %/$(M_FILE), $(all_c_files)))
diff --git a/meta/recipes-devtools/gcc/gcc/0023-Fix-install-path-of-linux64.h.patch b/meta/recipes-devtools/gcc/gcc/0023-Fix-install-path-of-linux64.h.patch
index 300ad393e35..f48a39310d2 100644
--- a/meta/recipes-devtools/gcc/gcc/0023-Fix-install-path-of-linux64.h.patch
+++ b/meta/recipes-devtools/gcc/gcc/0023-Fix-install-path-of-linux64.h.patch
@@ -1,4 +1,4 @@
-From aecde58d433123e8fb76ca2c56a0632d7b104b83 Mon Sep 17 00:00:00 2001
+From eb4538ff91a8b0a1c5b228d61e67aaadb4842c01 Mon Sep 17 00:00:00 2001
 From: Andrei Gherzan <andrei.gherzan@huawei.com>
 Date: Wed, 22 Dec 2021 12:49:25 +0100
 Subject: [PATCH] Fix install path of linux64.h
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 6a009c696e9..da54dd42adf 100644
+index 944d0a6680a..4cea9b20af5 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -3900,6 +3900,8 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+@@ -4115,6 +4115,8 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
  	  | "$(srcdir)"/config/* | "$(srcdir)"/common/config/* \
  	  | "$(srcdir)"/c-family/* | "$(srcdir)"/*.def ) \
  	    base=`echo "$$path" | sed -e "s|$$srcdirstrip/||"`;; \
diff --git a/meta/recipes-devtools/gcc/gcc/0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch b/meta/recipes-devtools/gcc/gcc/0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch
index 4f3b722bcfb..eaffed0da38 100644
--- a/meta/recipes-devtools/gcc/gcc/0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch
@@ -1,4 +1,4 @@
-From 483baf290597eed2ac01c7974f1b567c95503da5 Mon Sep 17 00:00:00 2001
+From 496670a1281c2171ec2cdcd74ae2844695000bc9 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sat, 20 Aug 2022 09:04:14 -0700
 Subject: [PATCH] Avoid hardcoded build paths into ppc libgcc
diff --git a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
index 09d6c7fffd4..a783654c99c 100644
--- a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
@@ -1,4 +1,4 @@
-From 46987c9092d52ee47071be563f48ee80a3c4f71f Mon Sep 17 00:00:00 2001
+From f94834e7e0a983b294a328a1b84af77ba48e41ac Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 17 Aug 2023 09:01:40 -0700
 Subject: [PATCH] gcc testsuite tweaks for mips/OE
@@ -33,13 +33,13 @@ discussion. Need to investigate why qemu-user passes the 'bad' instructions']
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gcc/testsuite/gcc.target/mips/mips.exp | 16 +++++++++
+ gcc/testsuite/gcc.target/mips/mips.exp | 16 ++++++++++
  gcc/testsuite/lib/gcc-dg.exp           | 11 +++++++
- gcc/testsuite/lib/target-supports.exp  | 45 ++++++++------------------
- 3 files changed, 41 insertions(+), 31 deletions(-)
+ gcc/testsuite/lib/target-supports.exp  | 44 ++++++++------------------
+ 3 files changed, 40 insertions(+), 31 deletions(-)
 
 diff --git a/gcc/testsuite/gcc.target/mips/mips.exp b/gcc/testsuite/gcc.target/mips/mips.exp
-index e028bc93b40..b54a40d6509 100644
+index 82d418a7cd4..46f7bf4ef92 100644
 --- a/gcc/testsuite/gcc.target/mips/mips.exp
 +++ b/gcc/testsuite/gcc.target/mips/mips.exp
 @@ -711,7 +711,23 @@ proc mips_first_unsupported_option { upstatus } {
@@ -67,10 +67,10 @@ index e028bc93b40..b54a40d6509 100644
  	    regsub -all "\n" $code "\\n\\\n" asm
  	    # Use check_runtime from target-supports.exp, which caches
 diff --git a/gcc/testsuite/lib/gcc-dg.exp b/gcc/testsuite/lib/gcc-dg.exp
-index 228c21d1207..d3b88e0419e 100644
+index 6dd8fa3fce9..95672008219 100644
 --- a/gcc/testsuite/lib/gcc-dg.exp
 +++ b/gcc/testsuite/lib/gcc-dg.exp
-@@ -232,9 +232,20 @@ proc schedule-cleanups { opts } {
+@@ -233,9 +233,20 @@ proc schedule-cleanups { opts } {
  
  proc gcc-dg-test-1 { target_compile prog do_what extra_tool_flags } {
      # Set up the compiler flags, based on what we're going to do.
@@ -92,10 +92,10 @@ index 228c21d1207..d3b88e0419e 100644
  	"preprocess" {
  	    set compile_type "preprocess"
 diff --git a/gcc/testsuite/lib/target-supports.exp b/gcc/testsuite/lib/target-supports.exp
-index d8b5a06a422..f66f5fea58e 100644
+index 869d1501c38..93f9046172b 100644
 --- a/gcc/testsuite/lib/target-supports.exp
 +++ b/gcc/testsuite/lib/target-supports.exp
-@@ -2483,14 +2483,7 @@ proc check_mips_loongson_mmi_hw_available { } {
+@@ -2959,14 +2959,7 @@ proc check_mips_loongson_mmi_hw_available { } {
  	if { !([istarget mips*-*-*]) } {
  	    expr 0
  	} else {
@@ -111,7 +111,7 @@ index d8b5a06a422..f66f5fea58e 100644
  	}
      }]
  }
-@@ -2504,29 +2497,7 @@ proc check_mips_msa_hw_available { } {
+@@ -2980,29 +2973,7 @@ proc check_mips_msa_hw_available { } {
      if { !([istarget mips*-*-*]) } {
        expr 0
      } else {
@@ -142,7 +142,7 @@ index d8b5a06a422..f66f5fea58e 100644
      }
    }]
  }
-@@ -9900,6 +9871,7 @@ proc is-effective-target-keyword { arg } {
+@@ -10364,6 +10335,7 @@ proc is-effective-target-keyword { arg } {
  
  proc et-dg-runtest { runtest testcases flags default-extra-flags } {
      global dg-do-what-default
@@ -150,7 +150,7 @@ index d8b5a06a422..f66f5fea58e 100644
      global EFFECTIVE_TARGETS
      global et_index
  
-@@ -9907,6 +9879,7 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
+@@ -10371,6 +10343,7 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
  	foreach target $EFFECTIVE_TARGETS {
  	    set target_flags $flags
  	    set dg-do-what-default compile
@@ -158,7 +158,7 @@ index d8b5a06a422..f66f5fea58e 100644
  	    set et_index [lsearch -exact $EFFECTIVE_TARGETS $target]
  	    if { [info procs add_options_for_${target}] != [list] } {
  		set target_flags [add_options_for_${target} "$flags"]
-@@ -9914,8 +9887,10 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
+@@ -10378,8 +10351,10 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
  	    if { [info procs check_effective_target_${target}_runtime]
  		 != [list] && [check_effective_target_${target}_runtime] } {
  		set dg-do-what-default run
@@ -169,67 +169,59 @@ index d8b5a06a422..f66f5fea58e 100644
  	}
      } else {
  	set et_index 0
-@@ -11620,6 +11595,7 @@ proc check_effective_target_sigsetjmp {} {
+@@ -12165,6 +12140,7 @@ proc check_effective_target_sigsetjmp {} {
  proc check_vect_support_and_set_flags { } {
      global DEFAULT_VECTCFLAGS
      global dg-do-what-default
 +    global do-what-limit
      global EFFECTIVE_TARGETS
  
-     if  [istarget powerpc-*paired*]  {
-@@ -11628,6 +11604,7 @@ proc check_vect_support_and_set_flags { } {
-             set dg-do-what-default run
-         } else {
-             set dg-do-what-default compile
-+            set do-what-limit link
-         }
-     } elseif [istarget powerpc*-*-*] {
-         # Skip targets not supporting -maltivec.
-@@ -11658,6 +11635,7 @@ proc check_vect_support_and_set_flags { } {
+     if [istarget powerpc*-*-*] {
+@@ -12196,6 +12172,7 @@ proc check_vect_support_and_set_flags { } {
  		set DEFAULT_VECTCFLAGS [linsert $DEFAULT_VECTCFLAGS 0 "-mcpu=970"]
-             }
-             set dg-do-what-default compile
-+            set do-what-limit link
-         }
-     } elseif { [istarget i?86-*-*] || [istarget x86_64-*-*] } {
-         lappend DEFAULT_VECTCFLAGS "-msse2"
-@@ -11665,6 +11643,7 @@ proc check_vect_support_and_set_flags { } {
-             set dg-do-what-default run
-         } else {
-             set dg-do-what-default compile
-+            set do-what-limit link
-         }
+ 	    }
+ 	    set dg-do-what-default compile
++        set do-what-limit link
+ 	}
+     } elseif { [check_effective_target_x86] } {
+ 	lappend DEFAULT_VECTCFLAGS "-msse2"
+@@ -12203,6 +12180,7 @@ proc check_vect_support_and_set_flags { } {
+ 	    set dg-do-what-default run
+ 	} else {
+ 	    set dg-do-what-default compile
++        set do-what-limit link
+ 	}
      } elseif { [istarget mips*-*-*]
  	       && [check_effective_target_nomips16] } {
-@@ -11684,6 +11663,7 @@ proc check_vect_support_and_set_flags { } {
-             set dg-do-what-default run
-         } else {
-             set dg-do-what-default compile
-+            set do-what-limit link
-         }
+@@ -12222,6 +12200,7 @@ proc check_vect_support_and_set_flags { } {
+ 	    set dg-do-what-default run
+ 	} else {
+ 	    set dg-do-what-default compile
++        set do-what-limit link
+ 	}
      } elseif [istarget alpha*-*-*] {
-         # Alpha's vectorization capabilities are extremely limited.
-@@ -11697,6 +11677,7 @@ proc check_vect_support_and_set_flags { } {
-             set dg-do-what-default run
-         } else {
-             set dg-do-what-default compile
-+            set do-what-limit link
-         }
+ 	# Alpha's vectorization capabilities are extremely limited.
+@@ -12235,6 +12214,7 @@ proc check_vect_support_and_set_flags { } {
+ 	    set dg-do-what-default run
+ 	} else {
+ 	    set dg-do-what-default compile
++        set do-what-limit link
+ 	}
      } elseif [istarget ia64-*-*] {
-         set dg-do-what-default run
-@@ -11710,6 +11691,7 @@ proc check_vect_support_and_set_flags { } {
-             set dg-do-what-default run
-         } else {
-             set dg-do-what-default compile
-+            set do-what-limit link
-         }
+ 	set dg-do-what-default run
+@@ -12248,6 +12228,7 @@ proc check_vect_support_and_set_flags { } {
+ 	    set dg-do-what-default run
+ 	} else {
+ 	    set dg-do-what-default compile
++        set do-what-limit link
+ 	}
      } elseif [istarget aarch64*-*-*] {
-         set dg-do-what-default run
-@@ -11734,6 +11716,7 @@ proc check_vect_support_and_set_flags { } {
-         } else {
+ 	set dg-do-what-default run
+@@ -12272,6 +12253,7 @@ proc check_vect_support_and_set_flags { } {
+ 	} else {
  	    lappend DEFAULT_VECTCFLAGS "-march=z14" "-mzarch"
-             set dg-do-what-default compile
-+            set do-what-limit link
-         }
+ 	    set dg-do-what-default compile
++        set do-what-limit link
+ 	}
      } elseif [istarget amdgcn-*-*] {
-         set dg-do-what-default run
+ 	set dg-do-what-default run
diff --git a/meta/recipes-devtools/gcc/gcc/0026-Append-GCC-private-include-paths-on-musl-instead-of-.patch b/meta/recipes-devtools/gcc/gcc/0026-Append-GCC-private-include-paths-on-musl-instead-of-.patch
new file mode 100644
index 00000000000..01c4dca071d
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-Append-GCC-private-include-paths-on-musl-instead-of-.patch
@@ -0,0 +1,36 @@
+From 4119058c917967a159b7d352c9d5863997d60cf3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 5 Jun 2024 22:56:12 -0700
+Subject: [PATCH] Append GCC private include paths on musl instead of
+ prepending
+
+Musl does not need gcc private compiler headers, therefore use them
+after standard system header search paths.
+
+This fixes packages like python builds to detect the musl systems
+correclty, as it looks for musl specific stuff in stdarg.h system
+header, which is wrongly picked from gcc private headers in OE
+
+Upstream-Status: Submitted [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=115368]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/gcc.cc | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/gcc.cc b/gcc/gcc.cc
+index 22eb17bc099..c9369fefc53 100644
+--- a/gcc/gcc.cc
++++ b/gcc/gcc.cc
+@@ -6620,7 +6620,11 @@ do_spec_1 (const char *spec, int inswitch, const char *soft_matched_part)
+ 
+ 	      if (gcc_exec_prefix)
+ 		{
+-		  do_spec_1 ("-iprefix", 1, NULL);
++      if (OPTION_MUSL)
++		    do_spec_1 ("-idirafter", 1, NULL);
++      else
++		    do_spec_1 ("-iprefix", 1, NULL);
++
+ 		  /* Make this a separate argument.  */
+ 		  do_spec_1 (" ", 0, NULL);
+ 		  do_spec_1 (gcc_exec_prefix, 1, NULL);
diff --git a/meta/recipes-devtools/gcc/gcc/0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch b/meta/recipes-devtools/gcc/gcc/0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch
deleted file mode 100644
index c9bc863eead..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 05106fea707f010779369c5d6e89787953d2976f Mon Sep 17 00:00:00 2001
-From: Sunil Dora <sunilkumar.dora@windriver.com>
-Date: Wed, 11 Dec 2024 10:04:56 -0800
-Subject: [PATCH] gcc: Fix c++: tweak for Wrange-loop-construct
-
-This commit updates the warning to use a check for "trivially constructible" instead of
-"trivially copyable." The original check was incorrect, as "trivially copyable" only applies
-to types that can be copied trivially, whereas "trivially constructible" is the correct check
-for types that can be trivially default-constructed.
-
-This change ensures the warning is more accurate and aligns with the proper type traits.
-
-LLVM accepted a similar fix:
-https://github.com/llvm/llvm-project/issues/47355
-
-PR c++/116731 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116731]
-
-Upstream-Status: Backport [https://gcc.gnu.org/g:6ac4e2f4b2ca9980670e7d3815a9140730df1005]
-
-Signed-off-by: Marek Polacek <polacek@redhat.com>
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- gcc/cp/parser.cc                              |  8 ++-
- .../g++.dg/warn/Wrange-loop-construct3.C      | 57 +++++++++++++++++++
- 2 files changed, 62 insertions(+), 3 deletions(-)
- create mode 100644 gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
-
-diff --git a/gcc/cp/parser.cc b/gcc/cp/parser.cc
-index 7e81c1010..8206489a2 100644
---- a/gcc/cp/parser.cc
-+++ b/gcc/cp/parser.cc
-@@ -14301,11 +14301,13 @@ warn_for_range_copy (tree decl, tree expr)
-   else if (!CP_TYPE_CONST_P (type))
-     return;
- 
--  /* Since small trivially copyable types are cheap to copy, we suppress the
--     warning for them.  64B is a common size of a cache line.  */
-+  /* Since small trivially constructible types are cheap to construct, we 
-+     suppress the warning for them.  64B is a common size of a cache line.  */
-+  tree vec = make_tree_vec (1);
-+  TREE_VEC_ELT (vec, 0) = TREE_TYPE (expr);
-   if (TREE_CODE (TYPE_SIZE_UNIT (type)) != INTEGER_CST
-       || (tree_to_uhwi (TYPE_SIZE_UNIT (type)) <= 64
--	  && trivially_copyable_p (type)))
-+	  && is_trivially_xible (INIT_EXPR, type, vec)))
-     return;
- 
-   /* If we can initialize a reference directly, suggest that to avoid the
-diff --git a/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C b/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
-new file mode 100644
-index 000000000..3d9d0c908
---- /dev/null
-+++ b/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
-@@ -0,0 +1,57 @@
-+// PR c++/116731
-+// { dg-do compile { target c++11 } }
-+// { dg-options "-Wrange-loop-construct" }
-+
-+void
-+f0 ()
-+{
-+  struct S {
-+    char a[64];
-+    S& operator=(const S&) { return *this; };
-+  };
-+
-+  S arr[8];
-+  for (const auto r : arr)
-+    (void) r;
-+}
-+
-+void
-+f1 ()
-+{
-+  struct S {
-+    char a[65];
-+    S& operator=(const S&) { return *this; };
-+  };
-+
-+  S arr[8];
-+  for (const auto r : arr) // { dg-warning "creates a copy" }
-+    (void) r;
-+}
-+
-+void
-+f2 ()
-+{
-+  struct S {
-+    char a[64];
-+    S& operator=(const S&) { return *this; };
-+    ~S() { }
-+  };
-+
-+  S arr[8];
-+  for (const auto r : arr) // { dg-warning "creates a copy" }
-+    (void) r;
-+}
-+
-+void
-+f3 ()
-+{
-+  struct S {
-+    char a[65];
-+    S& operator=(const S&) { return *this; };
-+    ~S() { }
-+  };
-+
-+  S arr[8];
-+  for (const auto r : arr) // { dg-warning "creates a copy" }
-+    (void) r;
-+}
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/gcc/gcc/0027-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch b/meta/recipes-devtools/gcc/gcc/0027-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch
deleted file mode 100644
index 5bede608167..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0027-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch
+++ /dev/null
@@ -1,447 +0,0 @@
-From 4e7735a8d87559bbddfe3a985786996e22241f8d Mon Sep 17 00:00:00 2001
-From: liuhongt <hongtao.liu@intel.com>
-Date: Mon, 12 Aug 2024 14:35:31 +0800
-Subject: [PATCH] Move ix86_align_loops into a separate pass and insert the
- pass after pass_endbr_and_patchable_area.
-
-gcc/ChangeLog:
-
-	PR target/116174
-	* config/i386/i386.cc (ix86_align_loops): Move this to ..
-	* config/i386/i386-features.cc (ix86_align_loops): .. here.
-	(class pass_align_tight_loops): New class.
-	(make_pass_align_tight_loops): New function.
-	* config/i386/i386-passes.def: Insert pass_align_tight_loops
-	after pass_insert_endbr_and_patchable_area.
-	* config/i386/i386-protos.h (make_pass_align_tight_loops): New
-	declare.
-
-gcc/testsuite/ChangeLog:
-
-	* gcc.target/i386/pr116174.c: New test.
-
-(cherry picked from commit c3c83d22d212a35cb1bfb8727477819463f0dcd8)
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=patch;h=4e7735a8d87559bbddfe3a985786996e22241f8d]
-
-Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
----
- gcc/config/i386/i386-features.cc         | 191 +++++++++++++++++++++++
- gcc/config/i386/i386-passes.def          |   3 +
- gcc/config/i386/i386-protos.h            |   1 +
- gcc/config/i386/i386.cc                  | 146 -----------------
- gcc/testsuite/gcc.target/i386/pr116174.c |  12 ++
- 5 files changed, 207 insertions(+), 146 deletions(-)
- create mode 100644 gcc/testsuite/gcc.target/i386/pr116174.c
-
-diff --git a/gcc/config/i386/i386-features.cc b/gcc/config/i386/i386-features.cc
-index e3e004d55267..7de19d423637 100644
---- a/gcc/config/i386/i386-features.cc
-+++ b/gcc/config/i386/i386-features.cc
-@@ -3253,6 +3253,197 @@ make_pass_remove_partial_avx_dependency (gcc::context *ctxt)
-   return new pass_remove_partial_avx_dependency (ctxt);
- }
- 
-+/* When a hot loop can be fit into one cacheline,
-+   force align the loop without considering the max skip.  */
-+static void
-+ix86_align_loops ()
-+{
-+  basic_block bb;
-+
-+  /* Don't do this when we don't know cache line size.  */
-+  if (ix86_cost->prefetch_block == 0)
-+    return;
-+
-+  loop_optimizer_init (AVOID_CFG_MODIFICATIONS);
-+  profile_count count_threshold = cfun->cfg->count_max / param_align_threshold;
-+  FOR_EACH_BB_FN (bb, cfun)
-+    {
-+      rtx_insn *label = BB_HEAD (bb);
-+      bool has_fallthru = 0;
-+      edge e;
-+      edge_iterator ei;
-+
-+      if (!LABEL_P (label))
-+	continue;
-+
-+      profile_count fallthru_count = profile_count::zero ();
-+      profile_count branch_count = profile_count::zero ();
-+
-+      FOR_EACH_EDGE (e, ei, bb->preds)
-+	{
-+	  if (e->flags & EDGE_FALLTHRU)
-+	    has_fallthru = 1, fallthru_count += e->count ();
-+	  else
-+	    branch_count += e->count ();
-+	}
-+
-+      if (!fallthru_count.initialized_p () || !branch_count.initialized_p ())
-+	continue;
-+
-+      if (bb->loop_father
-+	  && bb->loop_father->latch != EXIT_BLOCK_PTR_FOR_FN (cfun)
-+	  && (has_fallthru
-+	      ? (!(single_succ_p (bb)
-+		   && single_succ (bb) == EXIT_BLOCK_PTR_FOR_FN (cfun))
-+		 && optimize_bb_for_speed_p (bb)
-+		 && branch_count + fallthru_count > count_threshold
-+		 && (branch_count > fallthru_count * param_align_loop_iterations))
-+	      /* In case there'no fallthru for the loop.
-+		 Nops inserted won't be executed.  */
-+	      : (branch_count > count_threshold
-+		 || (bb->count > bb->prev_bb->count * 10
-+		     && (bb->prev_bb->count
-+			 <= ENTRY_BLOCK_PTR_FOR_FN (cfun)->count / 2)))))
-+	{
-+	  rtx_insn* insn, *end_insn;
-+	  HOST_WIDE_INT size = 0;
-+	  bool padding_p = true;
-+	  basic_block tbb = bb;
-+	  unsigned cond_branch_num = 0;
-+	  bool detect_tight_loop_p = false;
-+
-+	  for (unsigned int i = 0; i != bb->loop_father->num_nodes;
-+	       i++, tbb = tbb->next_bb)
-+	    {
-+	      /* Only handle continuous cfg layout. */
-+	      if (bb->loop_father != tbb->loop_father)
-+		{
-+		  padding_p = false;
-+		  break;
-+		}
-+
-+	      FOR_BB_INSNS (tbb, insn)
-+		{
-+		  if (!NONDEBUG_INSN_P (insn))
-+		    continue;
-+		  size += ix86_min_insn_size (insn);
-+
-+		  /* We don't know size of inline asm.
-+		     Don't align loop for call.  */
-+		  if (asm_noperands (PATTERN (insn)) >= 0
-+		      || CALL_P (insn))
-+		    {
-+		      size = -1;
-+		      break;
-+		    }
-+		}
-+
-+	      if (size == -1 || size > ix86_cost->prefetch_block)
-+		{
-+		  padding_p = false;
-+		  break;
-+		}
-+
-+	      FOR_EACH_EDGE (e, ei, tbb->succs)
-+		{
-+		  /* It could be part of the loop.  */
-+		  if (e->dest == bb)
-+		    {
-+		      detect_tight_loop_p = true;
-+		      break;
-+		    }
-+		}
-+
-+	      if (detect_tight_loop_p)
-+		break;
-+
-+	      end_insn = BB_END (tbb);
-+	      if (JUMP_P (end_insn))
-+		{
-+		  /* For decoded icache:
-+		     1. Up to two branches are allowed per Way.
-+		     2. A non-conditional branch is the last micro-op in a Way.
-+		  */
-+		  if (onlyjump_p (end_insn)
-+		      && (any_uncondjump_p (end_insn)
-+			  || single_succ_p (tbb)))
-+		    {
-+		      padding_p = false;
-+		      break;
-+		    }
-+		  else if (++cond_branch_num >= 2)
-+		    {
-+		      padding_p = false;
-+		      break;
-+		    }
-+		}
-+
-+	    }
-+
-+	  if (padding_p && detect_tight_loop_p)
-+	    {
-+	      emit_insn_before (gen_max_skip_align (GEN_INT (ceil_log2 (size)),
-+						    GEN_INT (0)), label);
-+	      /* End of function.  */
-+	      if (!tbb || tbb == EXIT_BLOCK_PTR_FOR_FN (cfun))
-+		break;
-+	      /* Skip bb which already fits into one cacheline.  */
-+	      bb = tbb;
-+	    }
-+	}
-+    }
-+
-+  loop_optimizer_finalize ();
-+  free_dominance_info (CDI_DOMINATORS);
-+}
-+
-+namespace {
-+
-+const pass_data pass_data_align_tight_loops =
-+{
-+  RTL_PASS, /* type */
-+  "align_tight_loops", /* name */
-+  OPTGROUP_NONE, /* optinfo_flags */
-+  TV_MACH_DEP, /* tv_id */
-+  0, /* properties_required */
-+  0, /* properties_provided */
-+  0, /* properties_destroyed */
-+  0, /* todo_flags_start */
-+  0, /* todo_flags_finish */
-+};
-+
-+class pass_align_tight_loops : public rtl_opt_pass
-+{
-+public:
-+  pass_align_tight_loops (gcc::context *ctxt)
-+    : rtl_opt_pass (pass_data_align_tight_loops, ctxt)
-+  {}
-+
-+  /* opt_pass methods: */
-+  bool gate (function *) final override
-+    {
-+      return optimize && optimize_function_for_speed_p (cfun);
-+    }
-+
-+  unsigned int execute (function *) final override
-+    {
-+      timevar_push (TV_MACH_DEP);
-+#ifdef ASM_OUTPUT_MAX_SKIP_ALIGN
-+      ix86_align_loops ();
-+#endif
-+      timevar_pop (TV_MACH_DEP);
-+      return 0;
-+    }
-+}; // class pass_align_tight_loops
-+
-+} // anon namespace
-+
-+rtl_opt_pass *
-+make_pass_align_tight_loops (gcc::context *ctxt)
-+{
-+  return new pass_align_tight_loops (ctxt);
-+}
-+
- /* This compares the priority of target features in function DECL1
-    and DECL2.  It returns positive value if DECL1 is higher priority,
-    negative value if DECL2 is higher priority and 0 if they are the
-diff --git a/gcc/config/i386/i386-passes.def b/gcc/config/i386/i386-passes.def
-index 7d96766f7b96..e500f15c9971 100644
---- a/gcc/config/i386/i386-passes.def
-+++ b/gcc/config/i386/i386-passes.def
-@@ -31,5 +31,8 @@ along with GCC; see the file COPYING3.  If not see
-   INSERT_PASS_BEFORE (pass_cse2, 1, pass_stv, true /* timode_p */);
- 
-   INSERT_PASS_BEFORE (pass_shorten_branches, 1, pass_insert_endbr_and_patchable_area);
-+  /* pass_align_tight_loops must be after pass_insert_endbr_and_patchable_area.
-+     PR116174.  */
-+  INSERT_PASS_BEFORE (pass_shorten_branches, 1, pass_align_tight_loops);
- 
-   INSERT_PASS_AFTER (pass_combine, 1, pass_remove_partial_avx_dependency);
-diff --git a/gcc/config/i386/i386-protos.h b/gcc/config/i386/i386-protos.h
-index 46214a63974d..36c7b1aed42b 100644
---- a/gcc/config/i386/i386-protos.h
-+++ b/gcc/config/i386/i386-protos.h
-@@ -419,6 +419,7 @@ extern rtl_opt_pass *make_pass_insert_endbr_and_patchable_area
-   (gcc::context *);
- extern rtl_opt_pass *make_pass_remove_partial_avx_dependency
-   (gcc::context *);
-+extern rtl_opt_pass *make_pass_align_tight_loops (gcc::context *);
- 
- extern bool ix86_has_no_direct_extern_access;
- 
-diff --git a/gcc/config/i386/i386.cc b/gcc/config/i386/i386.cc
-index 6f89891d3cb5..288c69467d62 100644
---- a/gcc/config/i386/i386.cc
-+++ b/gcc/config/i386/i386.cc
-@@ -23444,150 +23444,6 @@ ix86_split_stlf_stall_load ()
-     }
- }
- 
--/* When a hot loop can be fit into one cacheline,
--   force align the loop without considering the max skip.  */
--static void
--ix86_align_loops ()
--{
--  basic_block bb;
--
--  /* Don't do this when we don't know cache line size.  */
--  if (ix86_cost->prefetch_block == 0)
--    return;
--
--  loop_optimizer_init (AVOID_CFG_MODIFICATIONS);
--  profile_count count_threshold = cfun->cfg->count_max / param_align_threshold;
--  FOR_EACH_BB_FN (bb, cfun)
--    {
--      rtx_insn *label = BB_HEAD (bb);
--      bool has_fallthru = 0;
--      edge e;
--      edge_iterator ei;
--
--      if (!LABEL_P (label))
--	continue;
--
--      profile_count fallthru_count = profile_count::zero ();
--      profile_count branch_count = profile_count::zero ();
--
--      FOR_EACH_EDGE (e, ei, bb->preds)
--	{
--	  if (e->flags & EDGE_FALLTHRU)
--	    has_fallthru = 1, fallthru_count += e->count ();
--	  else
--	    branch_count += e->count ();
--	}
--
--      if (!fallthru_count.initialized_p () || !branch_count.initialized_p ())
--	continue;
--
--      if (bb->loop_father
--	  && bb->loop_father->latch != EXIT_BLOCK_PTR_FOR_FN (cfun)
--	  && (has_fallthru
--	      ? (!(single_succ_p (bb)
--		   && single_succ (bb) == EXIT_BLOCK_PTR_FOR_FN (cfun))
--		 && optimize_bb_for_speed_p (bb)
--		 && branch_count + fallthru_count > count_threshold
--		 && (branch_count > fallthru_count * param_align_loop_iterations))
--	      /* In case there'no fallthru for the loop.
--		 Nops inserted won't be executed.  */
--	      : (branch_count > count_threshold
--		 || (bb->count > bb->prev_bb->count * 10
--		     && (bb->prev_bb->count
--			 <= ENTRY_BLOCK_PTR_FOR_FN (cfun)->count / 2)))))
--	{
--	  rtx_insn* insn, *end_insn;
--	  HOST_WIDE_INT size = 0;
--	  bool padding_p = true;
--	  basic_block tbb = bb;
--	  unsigned cond_branch_num = 0;
--	  bool detect_tight_loop_p = false;
--
--	  for (unsigned int i = 0; i != bb->loop_father->num_nodes;
--	       i++, tbb = tbb->next_bb)
--	    {
--	      /* Only handle continuous cfg layout. */
--	      if (bb->loop_father != tbb->loop_father)
--		{
--		  padding_p = false;
--		  break;
--		}
--
--	      FOR_BB_INSNS (tbb, insn)
--		{
--		  if (!NONDEBUG_INSN_P (insn))
--		    continue;
--		  size += ix86_min_insn_size (insn);
--
--		  /* We don't know size of inline asm.
--		     Don't align loop for call.  */
--		  if (asm_noperands (PATTERN (insn)) >= 0
--		      || CALL_P (insn))
--		    {
--		      size = -1;
--		      break;
--		    }
--		}
--
--	      if (size == -1 || size > ix86_cost->prefetch_block)
--		{
--		  padding_p = false;
--		  break;
--		}
--
--	      FOR_EACH_EDGE (e, ei, tbb->succs)
--		{
--		  /* It could be part of the loop.  */
--		  if (e->dest == bb)
--		    {
--		      detect_tight_loop_p = true;
--		      break;
--		    }
--		}
--
--	      if (detect_tight_loop_p)
--		break;
--
--	      end_insn = BB_END (tbb);
--	      if (JUMP_P (end_insn))
--		{
--		  /* For decoded icache:
--		     1. Up to two branches are allowed per Way.
--		     2. A non-conditional branch is the last micro-op in a Way.
--		  */
--		  if (onlyjump_p (end_insn)
--		      && (any_uncondjump_p (end_insn)
--			  || single_succ_p (tbb)))
--		    {
--		      padding_p = false;
--		      break;
--		    }
--		  else if (++cond_branch_num >= 2)
--		    {
--		      padding_p = false;
--		      break;
--		    }
--		}
--
--	    }
--
--	  if (padding_p && detect_tight_loop_p)
--	    {
--	      emit_insn_before (gen_max_skip_align (GEN_INT (ceil_log2 (size)),
--						    GEN_INT (0)), label);
--	      /* End of function.  */
--	      if (!tbb || tbb == EXIT_BLOCK_PTR_FOR_FN (cfun))
--		break;
--	      /* Skip bb which already fits into one cacheline.  */
--	      bb = tbb;
--	    }
--	}
--    }
--
--  loop_optimizer_finalize ();
--  free_dominance_info (CDI_DOMINATORS);
--}
--
- /* Implement machine specific optimizations.  We implement padding of returns
-    for K8 CPUs and pass to avoid 4 jumps in the single 16 byte window.  */
- static void
-@@ -23611,8 +23467,6 @@ ix86_reorg (void)
- #ifdef ASM_OUTPUT_MAX_SKIP_ALIGN
-       if (TARGET_FOUR_JUMP_LIMIT)
- 	ix86_avoid_jump_mispredicts ();
--
--      ix86_align_loops ();
- #endif
-     }
- }
-diff --git a/gcc/testsuite/gcc.target/i386/pr116174.c b/gcc/testsuite/gcc.target/i386/pr116174.c
-new file mode 100644
-index 000000000000..8877d0b51af1
---- /dev/null
-+++ b/gcc/testsuite/gcc.target/i386/pr116174.c
-@@ -0,0 +1,12 @@
-+/* { dg-do compile { target *-*-linux* } } */
-+/* { dg-options "-O2 -fcf-protection=branch" } */
-+
-+char *
-+foo (char *dest, const char *src)
-+{
-+  while ((*dest++ = *src++) != '\0')
-+    /* nothing */;
-+  return --dest;
-+}
-+
-+/* { dg-final { scan-assembler "\t\.cfi_startproc\n\tendbr(32|64)\n" } } */
--- 
-2.43.5
diff --git a/meta/recipes-devtools/gcc/gcc/0028-libsanitizer-undef-_TIME_BITS-in-solaris-procmaps.patch b/meta/recipes-devtools/gcc/gcc/0028-libsanitizer-undef-_TIME_BITS-in-solaris-procmaps.patch
deleted file mode 100644
index 9426f5d2214..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0028-libsanitizer-undef-_TIME_BITS-in-solaris-procmaps.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 883d5549dc959b736e3cb61b989272a9e6a42565 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Thu, 3 Apr 2025 17:09:22 +0800
-Subject: [PATCH] libsanitizer: also undef _TIME_BITS in sanitizer_procmaps_solaris.cpp
-
-Upstream commit
-https://github.com/llvm/llvm-project/commit/26800a2c7e7996dc773b4e990dd5cca41c45e1a9
-of LLVM added a #undef _TIME_BITS in
-libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp to
-fix the build on 32-bit Linux platforms that have enabled 64-bit
-time_t using _TIME_BITS=64.
-
-Indeed, _TIME_BITS=64 can only be used when _FILE_OFFSET_BITS=64, but
-sanitizer_platform_limits_posix.cpp undefines _FILE_OFFSET_BITS before
-including any header file. To fix this, the upstream fix was to also
-undef _TIME_BITS.
-
-This commit simply does the same in sanitizer_procmaps_solaris.cpp,
-which also gets compiled under Linux (despite what the file name
-says). In practice on Linux hosts (where _TIME_BITS=64 matters),
-sanitizer_procmaps_solaris.cpp will expand to nothing, as pretty much
-the rest of the file is inside a #ifdef SANITIZER_SOLARIS...#endif. So
-the #undef _FILE_OFFSET_BITS and #undef _TIME_BITS are only here
-before including sanitizer_platform.h, which will set the
-SANITIZER_LINUX/SANITIZER_SOLARIS define depending on the platform.
-
-Fixes
-
-```
-/usr/include/features-time64.h:26:5: error: "_TIME_BITS=64 is allowed
- only with _FILE_OFFSET_BITS=64"
-| #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
-|     ^
-| 1 error generated.
-```
-Upstream-Status: Backport [https://github.com/gcc-mirror/gcc/commit/fa321004f3f6288d3ee2eefa6b02177131882dca]
-
-Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
----
- libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
-index eeb49e2af..f78558bed 100644
---- a/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
-+++ b/libsanitizer/sanitizer_common/sanitizer_procmaps_solaris.cpp
-@@ -10,7 +10,12 @@
- //===----------------------------------------------------------------------===//
- 
- // Before Solaris 11.4, <procfs.h> doesn't work in a largefile environment.
-+
- #undef _FILE_OFFSET_BITS
-+
-+// Avoid conflict between `_TIME_BITS` defined vs. `_FILE_OFFSET_BITS`
-+// undefined in some Linux configurations.
-+#undef _TIME_BITS
- #include "sanitizer_platform.h"
- #if SANITIZER_SOLARIS
- #  include <fcntl.h>
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch b/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch
deleted file mode 100644
index e5abdcc7030..00000000000
--- a/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch
+++ /dev/null
@@ -1,549 +0,0 @@
-From ab884fffe3fc82a710bea66ad651720d71c938b8 Mon Sep 17 00:00:00 2001
-From: Jonathan Wakely <jwakely@redhat.com>
-Date: Tue, 30 Apr 2024 09:52:13 +0100
-Subject: [PATCH] libstdc++: Fix std::chrono::tzdb to work with vanguard format
-
-I found some issues in the std::chrono::tzdb parser by testing the
-tzdata "vanguard" format, which uses new features that aren't enabled in
-the "main" and "rearguard" data formats.
-
-Since 2024a the keyword "minimum" is no longer valid for the FROM and TO
-fields in a Rule line, which means that "m" is now a valid abbreviation
-for "maximum". Previously we expected either "mi" or "ma". For backwards
-compatibility, a FROM field beginning with "mi" is still supported and
-is treated as 1900. The "maximum" keyword is only allowed in TO now,
-because it makes no sense in FROM. To support these changes the
-minmax_year and minmax_year2 classes for parsing FROM and TO are
-replaced with a single years_from_to class that reads both fields.
-
-The vanguard format makes use of %z in Zone FORMAT fields, which caused
-an exception to be thrown from ZoneInfo::set_abbrev because no % or /
-characters were expected when a Zone doesn't use a named Rule. The
-ZoneInfo::to(sys_info&) function now uses format_abbrev_str to replace
-any %z with the current offset. Although format_abbrev_str also checks
-for %s and STD/DST formats, those only make sense when a named Rule is
-in effect, so won't occur when ZoneInfo::to(sys_info&) is used.
-
-Since making this change on trunk, the tzdata-2024b release started
-using %z in the main format, not just vanguard. This makes a backport to
-release branches necessary (see PR 116657).
-
-This change also implements a feature that has always been missing from
-time_zone::_M_get_sys_info: finding the Rule that is active before the
-specified time point, so that we can correctly handle %s in the FORMAT
-for the first new sys_info that gets created. This requires implementing
-a poorly documented feature of zic, to get the LETTERS field from a
-later transition, as described at
-https://mm.icann.org/pipermail/tz/2024-April/058891.html
-In order for this to work we need to be able to distinguish an empty
-letters field (as used by CE%sT where the variable part is either empty
-or "S") from "the letters field is not known for this transition". The
-tzdata file uses "-" for an empty letters field, which libstdc++ was
-previously replacing with "" when the Rule was parsed. Instead, we now
-preserve the "-" in the Rule object, so that "" can be used for the case
-where we don't know the letters (and so need to decide it).
-
-(cherry picked from commit 0ca8d56f2085715f27ee536c6c344bc47af49cdd)
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=5ceea2ac106d6dd1aa8175670b15a801316cf1c9]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- libstdc++-v3/src/c++20/tzdb.cc                | 265 +++++++++++-------
- .../std/time/time_zone/sys_info_abbrev.cc     | 106 +++++++
- libstdc++-v3/testsuite/std/time/tzdb/1.cc     |   6 +-
- 3 files changed, 274 insertions(+), 103 deletions(-)
- create mode 100644 libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc
-
-diff --git a/libstdc++-v3/src/c++20/tzdb.cc b/libstdc++-v3/src/c++20/tzdb.cc
-index c7c7cc9deee6..7e8cce7ce8cf 100644
---- a/libstdc++-v3/src/c++20/tzdb.cc
-+++ b/libstdc++-v3/src/c++20/tzdb.cc
-@@ -342,51 +342,103 @@ namespace std::chrono
-       friend istream& operator>>(istream&, on_day&);
-     };
- 
--    // Wrapper for chrono::year that reads a year, or one of the keywords
--    // "minimum" or "maximum", or an unambiguous prefix of a keyword.
--    struct minmax_year
-+    // Wrapper for two chrono::year values, which reads the FROM and TO
-+    // fields of a Rule line. The FROM field is a year and TO is a year or
-+    // one of the keywords "maximum" or "only" (or an abbreviation of those).
-+    // For backwards compatibility, the keyword "minimum" is recognized
-+    // for FROM and interpreted as 1900.
-+    struct years_from_to
-     {
--      year& y;
-+      year& from;
-+      year& to;
- 
--      friend istream& operator>>(istream& in, minmax_year&& y)
-+      friend istream& operator>>(istream& in, years_from_to&& yy)
-       {
--	if (ws(in).peek() == 'm') // keywords "minimum" or "maximum"
-+	string s;
-+	auto c = ws(in).peek();
-+	if (c == 'm') [[unlikely]] // keyword "minimum"
- 	  {
--	    string s;
--	    in >> s; // extract the rest of the word, but only look at s[1]
--	    if (s[1] == 'a')
--	      y.y = year::max();
--	    else if (s[1] == 'i')
--	      y.y = year::min();
--	    else
--	      in.setstate(ios::failbit);
-+	    in >> s; // extract the rest of the word
-+	    yy.from = year(1900);
-+	  }
-+	else if (int num = 0; in >> num) [[likely]]
-+	  yy.from = year{num};
-+
-+	c = ws(in).peek();
-+	if (c == 'm') // keyword "maximum"
-+	  {
-+	    in >> s; // extract the rest of the word
-+	    yy.to = year::max();
-+	  }
-+	else if (c == 'o') // keyword "only"
-+	  {
-+	    in >> s; // extract the rest of the word
-+	    yy.to = yy.from;
- 	  }
- 	else if (int num = 0; in >> num)
--	  y.y = year{num};
-+	  yy.to = year{num};
-+
- 	return in;
-       }
-     };
- 
--    // As above for minmax_year, but also supports the keyword "only",
--    // meaning that the TO year is the same as the FROM year.
--    struct minmax_year2
-+    bool
-+    select_std_or_dst_abbrev(string& abbrev, minutes save)
-     {
--      minmax_year to;
--      year from;
-+      if (size_t pos = abbrev.find('/'); pos != string::npos)
-+	{
-+	  // Select one of "STD/DST" for standard or daylight.
-+	  if (save == 0min)
-+	    abbrev.erase(pos);
-+	  else
-+	    abbrev.erase(0, pos + 1);
-+	  return true;
-+	}
-+      return false;
-+    }
- 
--      friend istream& operator>>(istream& in, minmax_year2&& y)
--      {
--	if (ws(in).peek() == 'o') // keyword "only"
--	  {
--	    string s;
--	    in >> s; // extract the whole keyword
--	    y.to.y = y.from;
--	  }
--	else
--	  in >> std::move(y.to);
--	return in;
--      }
--    };
-+    // Set the sys_info::abbrev string by expanding any placeholders.
-+    void
-+    format_abbrev_str(sys_info& info, string_view letters = {})
-+    {
-+      if (size_t pos = info.abbrev.find('%'); pos != string::npos)
-+	{
-+	  if (info.abbrev[pos + 1] == 's')
-+	    {
-+	      // Expand "%s" to the variable part, given by Rule::letters.
-+	      if (letters == "-")
-+		info.abbrev.erase(pos, 2);
-+	      else
-+		info.abbrev.replace(pos, 2, letters);
-+	    }
-+	  else if (info.abbrev[pos + 1] == 'z')
-+	    {
-+	      // Expand "%z" to the UT offset as +/-hh, +/-hhmm, or +/-hhmmss.
-+	      hh_mm_ss<seconds> t(info.offset);
-+	      string z(1, "+-"[t.is_negative()]);
-+	      long val = t.hours().count();
-+	      int digits = 2;
-+	      if (int m = t.minutes().count())
-+		{
-+		  digits = 4;
-+		  val *= 100;
-+		  val += m;
-+		  if (int s = t.seconds().count())
-+		    {
-+		      digits = 6;
-+		      val *= 100;
-+		      val += s;
-+		    }
-+		}
-+	      auto sval = std::to_string(val);
-+	      z += string(digits - sval.size(), '0');
-+	      z += sval;
-+	      info.abbrev.replace(pos, 2, z);
-+	    }
-+	}
-+      else
-+	select_std_or_dst_abbrev(info.abbrev, info.save);
-+    }
- 
-     // A time zone information record.
-     // Zone  NAME        STDOFF  RULES   FORMAT  [UNTIL]
-@@ -462,6 +514,7 @@ namespace std::chrono
- 	info.offset = offset();
- 	info.save = minutes(m_save);
- 	info.abbrev = format();
-+	format_abbrev_str(info); // expand %z
- 	return true;
-       }
- 
-@@ -469,12 +522,9 @@ namespace std::chrono
-       friend class time_zone;
- 
-       void
--      set_abbrev(const string& abbrev)
-+      set_abbrev(string abbrev)
-       {
--	// In practice, the FORMAT field never needs expanding here.
--	if (abbrev.find_first_of("/%") != abbrev.npos)
--	  __throw_runtime_error("std::chrono::time_zone: invalid data");
--	m_buf = abbrev;
-+	m_buf = std::move(abbrev);
- 	m_pos = 0;
- 	m_expanded = true;
-       }
-@@ -544,9 +594,7 @@ namespace std::chrono
- 
- 	// Rule  NAME  FROM  TO  TYPE  IN  ON  AT  SAVE  LETTER/S
- 
--	in >> quoted(rule.name)
--	   >> minmax_year{rule.from}
--	   >> minmax_year2{rule.to, rule.from};
-+	in >> quoted(rule.name) >> years_from_to{rule.from, rule.to};
- 
- 	if (char type; in >> type && type != '-')
- 	  in.setstate(ios::failbit);
-@@ -557,7 +605,7 @@ namespace std::chrono
- 	if (save_time.indicator != at_time::Wall)
- 	  {
- 	    // We don't actually store the save_time.indicator, because we
--	    // assume that it's always deducable from the actual offset value.
-+	    // assume that it's always deducible from the offset value.
- 	    auto expected = save_time.time == 0s
- 			      ? at_time::Standard
- 			      : at_time::Daylight;
-@@ -567,8 +615,6 @@ namespace std::chrono
- 	rule.save = save_time.time;
- 
- 	in >> rule.letters;
--	if (rule.letters == "-")
--	  rule.letters.clear();
- 	return in;
-       }
- 
-@@ -719,58 +765,6 @@ namespace std::chrono
- #endif // TZDB_DISABLED
-   };
- 
--#ifndef TZDB_DISABLED
--  namespace
--  {
--    bool
--    select_std_or_dst_abbrev(string& abbrev, minutes save)
--    {
--      if (size_t pos = abbrev.find('/'); pos != string::npos)
--	{
--	  // Select one of "STD/DST" for standard or daylight.
--	  if (save == 0min)
--	    abbrev.erase(pos);
--	  else
--	    abbrev.erase(0, pos + 1);
--	  return true;
--	}
--      return false;
--    }
--
--    // Set the sys_info::abbrev string by expanding any placeholders.
--    void
--    format_abbrev_str(sys_info& info, string_view letters = {})
--    {
--      if (size_t pos = info.abbrev.find("%s"); pos != string::npos)
--	{
--	  // Expand "%s" to the variable part, given by Rule::letters.
--	  info.abbrev.replace(pos, 2, letters);
--	}
--      else if (size_t pos = info.abbrev.find("%z"); pos != string::npos)
--	{
--	  // Expand "%z" to the UT offset as +/-hh, +/-hhmm, or +/-hhmmss.
--	  hh_mm_ss<seconds> t(info.offset);
--	  string z(1, "+-"[t.is_negative()]);
--	  long val = t.hours().count();
--	  if (minutes m = t.minutes(); m != m.zero())
--	    {
--	      val *= 100;
--	      val += m.count();
--	      if (seconds s = t.seconds(); s != s.zero())
--		{
--		  val *= 100;
--		  val += s.count();
--		}
--	    }
--	  z += std::to_string(val);
--	  info.abbrev.replace(pos, 2, z);
--	}
--      else
--	select_std_or_dst_abbrev(info.abbrev, info.save);
--    }
--  }
--#endif // TZDB_DISABLED
--
-   // Implementation of std::chrono::time_zone::get_info(const sys_time<D>&)
-   sys_info
-   time_zone::_M_get_sys_info(sys_seconds tp) const
-@@ -839,12 +833,72 @@ namespace std::chrono
-     info.abbrev = ri.format();
- 
-     string_view letters;
--    if (i != infos.begin())
-+    if (i != infos.begin() && i[-1].expanded())
-+      letters = i[-1].next_letters();
-+
-+    if (letters.empty())
-       {
--	if (i[-1].expanded())
--	  letters = i[-1].next_letters();
--	// XXX else need to find Rule active before this time and use it
--	// to know the initial offset, save, and letters.
-+	sys_seconds t = info.begin - seconds(1);
-+	const year_month_day date(chrono::floor<days>(t));
-+
-+	// Try to find a Rule active before this time, to get initial
-+	// SAVE and LETTERS values. There may not be a Rule for the period
-+	// before the first DST transition, so find the earliest DST->STD
-+	// transition and use the LETTERS from that.
-+	const Rule* active_rule = nullptr;
-+	sys_seconds active_rule_start = sys_seconds::min();
-+	const Rule* first_std = nullptr;
-+	for (const auto& rule : rules)
-+	  {
-+	    if (rule.save == minutes(0))
-+	      {
-+		if (!first_std)
-+		  first_std = &rule;
-+		else if (rule.from < first_std->from)
-+		  first_std = &rule;
-+		else if (rule.from == first_std->from)
-+		  {
-+		    if (rule.start_time(rule.from, {})
-+			  < first_std->start_time(first_std->from, {}))
-+		      first_std = &rule;
-+		  }
-+	      }
-+
-+	    year y = date.year();
-+
-+	    if (y > rule.to) // rule no longer applies at time t
-+	      continue;
-+	    if (y < rule.from) // rule doesn't apply yet at time t
-+	      continue;
-+
-+	    sys_seconds rule_start;
-+
-+	    seconds offset{}; // appropriate for at_time::Universal
-+	    if (rule.when.indicator == at_time::Wall)
-+	      offset = info.offset;
-+	    else if (rule.when.indicator == at_time::Standard)
-+	      offset = ri.offset();
-+
-+	    // Time the rule takes effect this year:
-+	    rule_start = rule.start_time(y, offset);
-+
-+	    if (rule_start >= t && rule.from < y)
-+	      {
-+		// Try this rule in the previous year.
-+		rule_start = rule.start_time(--y, offset);
-+	      }
-+
-+	    if (active_rule_start < rule_start && rule_start < t)
-+	      {
-+		active_rule_start = rule_start;
-+		active_rule = &rule;
-+	      }
-+	  }
-+
-+	if (active_rule)
-+	  letters = active_rule->letters;
-+	else if (first_std)
-+	  letters = first_std->letters;
-       }
- 
-     const Rule* curr_rule = nullptr;
-@@ -2069,9 +2123,11 @@ namespace std::chrono
- 	      istringstream in2(std::move(rules));
- 	      in2 >> rules_time;
- 	      inf.m_save = duration_cast<minutes>(rules_time.time);
-+	      // If the FORMAT is "STD/DST" then we can choose the right one
-+	      // now, so that we store a shorter string.
- 	      select_std_or_dst_abbrev(fmt, inf.m_save);
- 	    }
--	  inf.set_abbrev(fmt);
-+	  inf.set_abbrev(std::move(fmt));
- 	}
- 
-       // YEAR [MONTH [DAY [TIME]]]
-@@ -2082,7 +2138,12 @@ namespace std::chrono
- 	  abbrev_month m{January};
- 	  int d = 1;
- 	  at_time t{};
-+	  // XXX DAY should support ON format, e.g. lastSun or Sun>=8
- 	  in >> m >> d >> t;
-+	  // XXX UNTIL field should be interpreted
-+	  // "using the rules in effect just before the transition"
-+	  // so might need to store as year_month_day and hh_mm_ss and only
-+	  // convert to a sys_time once we know the offset in effect.
- 	  inf.m_until = sys_days(year(y)/m.m/day(d)) + seconds(t.time);
- 	}
-       else
-diff --git a/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc b/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc
-new file mode 100644
-index 000000000000..f1a8fff02f58
---- /dev/null
-+++ b/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc
-@@ -0,0 +1,106 @@
-+// { dg-do run { target c++20 } }
-+// { dg-require-effective-target tzdb }
-+// { dg-require-effective-target cxx11_abi }
-+// { dg-xfail-run-if "no weak override on AIX" { powerpc-ibm-aix* } }
-+
-+#include <chrono>
-+#include <fstream>
-+#include <testsuite_hooks.h>
-+
-+static bool override_used = false;
-+
-+namespace __gnu_cxx
-+{
-+  const char* zoneinfo_dir_override() {
-+    override_used = true;
-+    return "./";
-+  }
-+}
-+
-+using namespace std::chrono;
-+
-+void
-+test_format()
-+{
-+  std::ofstream("tzdata.zi") << R"(# version test_1
-+Zone Africa/Bissau -1:2:20 - LMT 1912 Ja 1 1u
-+                   -1      - %z  1975
-+                   0       - GMT
-+Zon Some/Zone 1:2:3   - %z 1900
-+              1:23:45 - %z 1950
-+Zo Another/Zone 1:2:3 -     AZ0     1901
-+                1     Roolz A%sZ    2000
-+                1     Roolz SAZ/DAZ 2005
-+                1     Roolz %z
-+Rule Roolz 1950 max - April 1 2 1 D
-+Rul  Roolz 1950 max - Oct   1 1 0 S
-+Z Strange/Zone 1       - X%sX    1980
-+               1       - FOO/BAR 1990
-+               2:00    - %zzz    1995
-+               0:9     - %zzz    1996
-+               0:8:7   - %zzz    1997
-+               0:6:5.5 - %zzz    1998
-+)";
-+
-+  const auto& db = reload_tzdb();
-+  VERIFY( override_used ); // If this fails then XFAIL for the target.
-+  VERIFY( db.version == "test_1" );
-+
-+  // Test formatting %z as
-+  auto tz = locate_zone("Africa/Bissau");
-+  auto inf = tz->get_info(sys_days(1974y/1/1));
-+  VERIFY( inf.abbrev == "-01" );
-+
-+  tz = locate_zone("Some/Zone");
-+  inf = tz->get_info(sys_days(1899y/1/1));
-+  VERIFY( inf.abbrev == "+010203" );
-+  inf = tz->get_info(sys_days(1955y/1/1));
-+  VERIFY( inf.abbrev == "+012345" );
-+
-+  tz = locate_zone("Another/Zone");
-+  // Test formatting %s as the LETTER/S field from the active Rule.
-+  inf = tz->get_info(sys_days(1910y/January/1));
-+  VERIFY( inf.abbrev == "ASZ" );
-+  inf = tz->get_info(sys_days(1950y/January/1));
-+  VERIFY( inf.abbrev == "ASZ" );
-+  inf = tz->get_info(sys_days(1950y/June/1));
-+  VERIFY( inf.abbrev == "ADZ" );
-+  inf = tz->get_info(sys_days(1999y/January/1));
-+  VERIFY( inf.abbrev == "ASZ" );
-+  inf = tz->get_info(sys_days(1999y/July/1));
-+  VERIFY( inf.abbrev == "ADZ" );
-+  // Test formatting STD/DST according to the active Rule.
-+  inf = tz->get_info(sys_days(2000y/January/2));
-+  VERIFY( inf.abbrev == "SAZ" );
-+  inf = tz->get_info(sys_days(2001y/January/1));
-+  VERIFY( inf.abbrev == "SAZ" );
-+  inf = tz->get_info(sys_days(2001y/July/1));
-+  VERIFY( inf.abbrev == "DAZ" );
-+  // Test formatting %z as the offset determined by the active Rule.
-+  inf = tz->get_info(sys_days(2005y/January/2));
-+  VERIFY( inf.abbrev == "+01" );
-+  inf = tz->get_info(sys_days(2006y/January/1));
-+  VERIFY( inf.abbrev == "+01" );
-+  inf = tz->get_info(sys_days(2006y/July/1));
-+  VERIFY( inf.abbrev == "+02" );
-+
-+  // Test formatting %z, %s and S/D for a Zone with no associated Rules.
-+  tz = locate_zone("Strange/Zone");
-+  inf = tz->get_info(sys_days(1979y/January/1));
-+  VERIFY( inf.abbrev == "XX" ); // No Rule means nothing to use for %s.
-+  inf = tz->get_info(sys_days(1981y/July/1));
-+  VERIFY( inf.abbrev == "FOO" ); // Always standard time means first string.
-+  inf = tz->get_info(sys_days(1994y/July/1));
-+  VERIFY( inf.abbrev == "+02zz" );
-+  inf = tz->get_info(sys_days(1995y/July/1));
-+  VERIFY( inf.abbrev == "+0009zz" );
-+  inf = tz->get_info(sys_days(1996y/July/1));
-+  VERIFY( inf.abbrev == "+000807zz" );
-+  inf = tz->get_info(sys_days(1997y/July/1));
-+  VERIFY( inf.abbrev == "+000606zz" );
-+}
-+
-+int main()
-+{
-+  test_format();
-+}
-diff --git a/libstdc++-v3/testsuite/std/time/tzdb/1.cc b/libstdc++-v3/testsuite/std/time/tzdb/1.cc
-index 796f3a8b4256..7a31c1c20ba7 100644
---- a/libstdc++-v3/testsuite/std/time/tzdb/1.cc
-+++ b/libstdc++-v3/testsuite/std/time/tzdb/1.cc
-@@ -39,11 +39,15 @@ test_locate()
-   const tzdb& db = get_tzdb();
-   const time_zone* tz = db.locate_zone("GMT");
-   VERIFY( tz != nullptr );
--  VERIFY( tz->name() == "Etc/GMT" );
-   VERIFY( tz == std::chrono::locate_zone("GMT") );
-   VERIFY( tz == db.locate_zone("Etc/GMT") );
-   VERIFY( tz == db.locate_zone("Etc/GMT+0") );
- 
-+  // Since 2022f GMT is now a Zone and Etc/GMT a link instead of vice versa,
-+  // but only when using the vanguard format. As of 2024a, the main and
-+  // rearguard formats still have Etc/GMT as a Zone and GMT as a link.
-+  VERIFY( tz->name() == "GMT" || tz->name() == "Etc/GMT" );
-+
-   VERIFY( db.locate_zone(db.current_zone()->name()) == db.current_zone() );
- }
- 
--- 
-2.43.5
-
diff --git a/meta/recipes-devtools/gcc/gcc_14.2.bb b/meta/recipes-devtools/gcc/gcc_15.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_14.2.bb
rename to meta/recipes-devtools/gcc/gcc_15.1.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb b/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_14.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_15.1.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_14.2.bb b/meta/recipes-devtools/gcc/libgcc_15.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_14.2.bb
rename to meta/recipes-devtools/gcc/libgcc_15.1.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_14.2.bb b/meta/recipes-devtools/gcc/libgfortran_15.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_14.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_15.1.bb

