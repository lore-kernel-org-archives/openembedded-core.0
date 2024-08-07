Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABCEC52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 04:27:16 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.25711.1723004830273015260
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 21:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b4fI5mN+;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fd66cddd07so13361025ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 21:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723004829; x=1723609629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vRNwV4rBCjwFZ/1CZoye0vkLjiC2mGG7Q9EUGHSUCEg=;
        b=b4fI5mN+PThkXIfJLdrLIQD2bQw4j96+Wv5PULoIuMZ2o7xN9AeIVZFtOnTIvInBWm
         a0KXcbN9T5vbvbn8cSpmmCanJ19xCD76rmhmxTyESsaJGjRB56FUilOixqp3auDVV0OO
         7cSG1enifGZFDyh6x5IZifDr9UGoV0/NmZoP71e2zk+c3gCKsMnGBRLiy/XjopRPOFJq
         sEoMinRSq/JN4rgqb39lYiv+Vx1nTFg8Z7n1mMjJC3fFuNtf9Jv83zkxxor5Mf/UUzB8
         avtKllkcABTVdoO7fL01NH8YVdQq6pxNBbeJq0+ZX0uSEqQL3XrO0kGHDbINlVjPa1Cd
         Tm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723004829; x=1723609629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRNwV4rBCjwFZ/1CZoye0vkLjiC2mGG7Q9EUGHSUCEg=;
        b=bTOEYVGveacweJp0PZZ8baF4wJft9QA+ws3j3EKOJ6sbhzL91m1pvvz80FlDJ4Rc3F
         Fne4P/1gPcKu6GoMxUlKW5iNVU/SXpYXNlP4KYzBcGO8bY8MCfi28gUea+dJEVAq6uMm
         lpvjiLnp4OtADh3nJDYmV9z3liAk05PcVl44WF80/ZdSLka1ERWfYinq4/9rCM0s4DBn
         ZL1yspMvmz/aOjSJJbkkeMCuo8HcajxFY1bHBAJRnMmJ+X01QfsGMgPkUk3y2KSsfA4i
         9qQoTLecPkV7/kUqkqDia2ss/973vh+pjIDUiTOX1VO4K+NmMJtnHBl6sjdZ+Y7j7J8c
         jjiw==
X-Gm-Message-State: AOJu0YwDi3gBSBHfJ7hQiVBTPFLl/kJ8GGIkwm4k51H03GodNGSxUkLw
	g1Wo8iun2YHEehCNqsCK2C2bsiTWxkQdriM2obNVDeAqCN5XeLHqaV3OhqXB
X-Google-Smtp-Source: AGHT+IEqfdks27yhO5JwpMMX+tz9UU9sOk8pmniEUjCYytGAJ/SUYtN7SBZ6V9b5ok6F6yhk8BwtSw==
X-Received: by 2002:a17:903:228b:b0:1fc:71fb:10d6 with SMTP id d9443c01a7336-1ff5723e5c6mr166905195ad.6.1723004829034;
        Tue, 06 Aug 2024 21:27:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e55d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff592ac867sm95501845ad.277.2024.08.06.21.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 21:27:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc: Upgrade to GCC 14.2
Date: Tue,  6 Aug 2024 21:27:06 -0700
Message-ID: <20240807042706.3596605-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 04:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203056

This is first bugfix release in GCC14 release series
100+ bugfixes [1]

[1] https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=14.2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  2 +-
 .../gcc/{gcc-14.1.inc => gcc-14.2.inc}        |  7 +-
 ...ian_14.1.bb => gcc-cross-canadian_14.2.bb} |  0
 .../{gcc-cross_14.1.bb => gcc-cross_14.2.bb}  |  0
 ...-crosssdk_14.1.bb => gcc-crosssdk_14.2.bb} |  0
 ...cc-runtime_14.1.bb => gcc-runtime_14.2.bb} |  0
 ...itizers_14.1.bb => gcc-sanitizers_14.2.bb} |  0
 ...{gcc-source_14.1.bb => gcc-source_14.2.bb} |  0
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch | 10 +--
 .../0002-gcc-poison-system-directories.patch  | 14 ++--
 .../gcc/gcc/0003-64-bit-multilib-hack.patch   |  2 +-
 ...R_BUILD-in-a-couple-of-places-to-avo.patch |  2 +-
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch | 10 +--
 .../gcc/gcc/0006-cpp-honor-sysroot.patch      |  2 +-
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  6 +-
 .../gcc/gcc/0008-libtool.patch                |  2 +-
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |  2 +-
 ...-config-files-from-B-instead-of-usin.patch | 14 ++--
 ...1-aarch64-Fix-include-paths-when-S-B.patch |  4 +-
 ...ir-from-.la-which-usually-points-to-.patch |  2 +-
 ...e-target-gcc-headers-can-be-included.patch |  2 +-
 ...t-directory-during-relink-if-inst_pr.patch |  2 +-
 ...-fix-libcc1-s-install-path-and-rpath.patch |  2 +-
 ...le-sysroot-support-for-nativesdk-gcc.patch |  4 +-
 ...sroot-gcc-version-specific-dirs-with.patch |  2 +-
 ...d-to-link-commandline-for-musl-targe.patch |  2 +-
 ...Re-introduce-spe-commandline-options.patch |  4 +-
 ...as-for-__cpu_indicator_init-instead-.patch |  4 +-
 ...s-Do-not-use-__LINE__-for-maintainin.patch |  2 +-
 ...omic-Do-not-enforce-march-on-aarch64.patch |  2 +-
 .../0023-Fix-install-path-of-linux64.h.patch  |  2 +-
 ...ardcoded-build-paths-into-ppc-libgcc.patch |  2 +-
 ...025-gcc-testsuite-tweaks-for-mips-OE.patch | 26 +++----
 ...-in-_Grapheme_cluster_view-_Iterator.patch | 76 -------------------
 .../gcc/{gcc_14.1.bb => gcc_14.2.bb}          |  0
 ...initial_14.1.bb => libgcc-initial_14.2.bb} |  0
 .../gcc/{libgcc_14.1.bb => libgcc_14.2.bb}    |  0
 ...ibgfortran_14.1.bb => libgfortran_14.2.bb} |  0
 38 files changed, 67 insertions(+), 144 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-14.1.inc => gcc-14.2.inc} (95%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_14.1.bb => gcc-cross-canadian_14.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_14.1.bb => gcc-cross_14.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_14.1.bb => gcc-crosssdk_14.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_14.1.bb => gcc-runtime_14.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_14.1.bb => gcc-sanitizers_14.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_14.1.bb => gcc-source_14.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0026-libstdc-Fix-typo-in-_Grapheme_cluster_view-_Iterator.patch
 rename meta/recipes-devtools/gcc/{gcc_14.1.bb => gcc_14.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_14.1.bb => libgcc-initial_14.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_14.1.bb => libgcc_14.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_14.1.bb => libgfortran_14.2.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index cf9fda812f7..e2bca21d49d 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -191,7 +191,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gcc-source-14.1.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gcc-source-14.2.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-gdb = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-devtools/gcc/gcc-14.1.inc b/meta/recipes-devtools/gcc/gcc-14.2.inc
similarity index 95%
rename from meta/recipes-devtools/gcc/gcc-14.1.inc
rename to meta/recipes-devtools/gcc/gcc-14.2.inc
index 23a03725c40..f05484cfc04 100644
--- a/meta/recipes-devtools/gcc/gcc-14.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-14.2.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "14.1.0"
+PV = "14.2.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "14.1.0"
+BINV = "14.2.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -40,7 +40,7 @@ LIC_FILES_CHKSUM = "\
 RELEASE ?= "${PV}"
 BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
 SOURCEDIR ?= "gcc-${PV}"
-SRC_URI[sha256sum] = "e283c654987afe3de9d8080bc0bd79534b5ca0d681a73a11ff2b5d3767426840"
+SRC_URI[sha256sum] = "a7b39bc69cbf9e25826c5a60ab26477001f7c08d85cec04bc0e29cabed6f3cc9"
 
 SRC_URI = "${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
@@ -68,7 +68,6 @@ SRC_URI = "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
-           file://0026-libstdc-Fix-typo-in-_Grapheme_cluster_view-_Iterator.patch \
 "
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_14.1.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_14.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_14.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_14.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_14.1.bb b/meta/recipes-devtools/gcc/gcc-cross_14.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_14.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross_14.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_14.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_14.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_14.1.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_14.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_14.1.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_14.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_14.1.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_14.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_14.1.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_14.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_14.1.bb b/meta/recipes-devtools/gcc/gcc-source_14.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_14.1.bb
rename to meta/recipes-devtools/gcc/gcc-source_14.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
index 0b7c0af86fc..4693e948e8b 100644
--- a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -1,4 +1,4 @@
-From 76ef337260aadeb475fd380ff9aca31ea1731345 Mon Sep 17 00:00:00 2001
+From 5f2881333e6ba6eb055f590982c2a2eb3fcbee2c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:37:11 +0400
 Subject: [PATCH] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
@@ -12,10 +12,10 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 02b435c1163..85a82fad302 100755
+index 3b0abeb8b2e..2590471a021 100755
 --- a/configure
 +++ b/configure
-@@ -10387,7 +10387,7 @@ fi
+@@ -10467,7 +10467,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
@@ -25,10 +25,10 @@ index 02b435c1163..85a82fad302 100755
   *" newlib "*)
    case " $target_configargs " in
 diff --git a/configure.ac b/configure.ac
-index 1a19c07a27b..bc8e1b8c4ef 100644
+index 042681c27be..0d9b39c541a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3509,7 +3509,7 @@ fi
+@@ -3539,7 +3539,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
diff --git a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
index 76aa69c26e0..ca75d08f599 100644
--- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
@@ -1,4 +1,4 @@
-From 05be69910c99d739ce9246a3bb9426fa6d9f19d4 Mon Sep 17 00:00:00 2001
+From 838daab44918ef738402a2dd069537c6ac519305 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 8 Mar 2021 16:04:20 -0800
 Subject: [PATCH] gcc: poison-system-directories
@@ -61,7 +61,7 @@ index f3de4ba6776..3ce3113510b 100644
     optimizer and back end) to be checked for dynamic type safety at runtime.
     This is quite expensive. */
 diff --git a/gcc/configure b/gcc/configure
-index 266ab8f84b2..3c346acbce0 100755
+index abc8bfdc244..d3fa80408f4 100755
 --- a/gcc/configure
 +++ b/gcc/configure
 @@ -1050,6 +1050,7 @@ enable_maintainer_mode
@@ -81,7 +81,7 @@ index 266ab8f84b2..3c346acbce0 100755
    --enable-plugin         enable plugin support
    --enable-host-shared    build host code as shared libraries
    --enable-host-pie       build host code as PIE
-@@ -34020,6 +34023,22 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
+@@ -34028,6 +34031,22 @@ if test "${enable_version_specific_runtime_libs+set}" = set; then :
  fi
  
  
@@ -105,10 +105,10 @@ index 266ab8f84b2..3c346acbce0 100755
  
  
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index a5aec1bc967..4d8123085b8 100644
+index 1d2cefa3f6a..2760b6c540c 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -7518,6 +7518,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
+@@ -7527,6 +7527,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
                  [specify that runtime libraries should be
                   installed in a compiler-specific directory])])
  
@@ -132,7 +132,7 @@ index a5aec1bc967..4d8123085b8 100644
  AC_SUBST(subdirs)
  AC_SUBST(srcdir)
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 1006510fc6a..389155f8ed5 100644
+index f82f7d2817b..1da91813b0e 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
 @@ -391,6 +391,7 @@ Objective-C and Objective-C++ Dialects}.
@@ -143,7 +143,7 @@ index 1006510fc6a..389155f8ed5 100644
  -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls
  -Wrestrict  -Wno-return-local-addr  -Wreturn-type
  -Wno-scalar-storage-order  -Wsequence-point
-@@ -8860,6 +8861,14 @@ made up of data only and thus requires no special treatment.  But, for
+@@ -8861,6 +8862,14 @@ made up of data only and thus requires no special treatment.  But, for
  most targets, it is made up of code and thus requires the stack to be
  made executable in order for the program to work properly.
  
diff --git a/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
index dfd370aba9a..55471b37cd9 100644
--- a/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
@@ -1,4 +1,4 @@
-From 25bc008191c9b518f30e3ed87e204e25bdafb854 Mon Sep 17 00:00:00 2001
+From 33f9c4e4f0a5c2af8ab12612c28ba218ae491587 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:10:06 +0400
 Subject: [PATCH] 64-bit multilib hack
diff --git a/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch b/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
index 35e92a6a9ea..2dc6b13bfb7 100644
--- a/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
+++ b/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
@@ -1,4 +1,4 @@
-From 5bef09b829ab8042acc045474cf10f4c4fb15dd5 Mon Sep 17 00:00:00 2001
+From 40c537352e085df2157cf907da6d694266ab74fe Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 28 Oct 2021 11:33:40 +0100
 Subject: [PATCH] Pass CXXFLAGS_FOR_BUILD in a couple of places to avoid these
diff --git a/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
index 8c6ae38e95d..c386b502aa3 100644
--- a/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
+++ b/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
@@ -1,4 +1,4 @@
-From fd3f513fa7e4f63a2b28b31ed5a4ddf8f5c543c0 Mon Sep 17 00:00:00 2001
+From d145dd6dec6863aa303503643b2d3ed470936dd0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:17:25 +0400
 Subject: [PATCH] Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}
@@ -39,10 +39,10 @@ index a74761b7ab3..956437df95b 100644
  TM_MULTILIB_CONFIG=@TM_MULTILIB_CONFIG@
  TM_MULTILIB_EXCEPTIONS_CONFIG=@TM_MULTILIB_EXCEPTIONS_CONFIG@
 diff --git a/gcc/configure b/gcc/configure
-index 3c346acbce0..3870d6e9b6d 100755
+index d3fa80408f4..f2706f94062 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -15155,8 +15155,8 @@ for f in $tm_file; do
+@@ -15161,8 +15161,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
@@ -54,10 +54,10 @@ index 3c346acbce0..3870d6e9b6d 100755
      * )
         tm_file_list="${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 4d8123085b8..15670de1706 100644
+index 2760b6c540c..3f972dea24f 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -2383,8 +2383,8 @@ for f in $tm_file; do
+@@ -2390,8 +2390,8 @@ for f in $tm_file; do
         tm_include_list="${tm_include_list} $f"
         ;;
      defaults.h )
diff --git a/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch
index e0d6aea46ba..ca1158ee27b 100644
--- a/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch
+++ b/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch
@@ -1,4 +1,4 @@
-From 970960876045c99011658836f385c6f4d6d78fa6 Mon Sep 17 00:00:00 2001
+From 429711e243bbda4d662d687c1a6fea24fcb34827 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:22:00 +0400
 Subject: [PATCH] cpp: honor sysroot.
diff --git a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index eacdbd1dbed..6ff16e38e19 100644
--- a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,4 +1,4 @@
-From bce0b7e2e130a069a93c839b856aa19b64d5ca54 Mon Sep 17 00:00:00 2001
+From b597a2bc85ffdcf780731a44de02799ebc3d8f61 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
 Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
@@ -266,7 +266,7 @@ index 06c442e85f4..b21a3c076c9 100644
  #undef LINK_SPEC
  #define LINK_SPEC LINK_SPEC_ENDIAN \
 diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
-index 15851f653bc..d8aaab9631f 100644
+index 3c356227134..4d16bae86db 100644
 --- a/gcc/config/riscv/linux.h
 +++ b/gcc/config/riscv/linux.h
 @@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -391,7 +391,7 @@ index 9646fa9c41e..396fb047fac 100644
  #undef  LINK_SPEC
  #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
 diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
-index 1e2e4aef2ad..25fcc37eca2 100644
+index 83e0d6874d9..9a32d2cfff5 100644
 --- a/gcc/config/sparc/linux64.h
 +++ b/gcc/config/sparc/linux64.h
 @@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.  If not see
diff --git a/meta/recipes-devtools/gcc/gcc/0008-libtool.patch b/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
index 9b78377493d..b8081d46144 100644
--- a/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
+++ b/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
@@ -1,4 +1,4 @@
-From 869295f6f1095b6334c1ea34f8d11a676c67e256 Mon Sep 17 00:00:00 2001
+From 462e2111804490fcdbb9fd87a86b1e7ac1805803 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:29:11 +0400
 Subject: [PATCH] libtool
diff --git a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
index 3e24e53d7b2..015777c35b3 100644
--- a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -1,4 +1,4 @@
-From 19279e08417124b4567fafdf9300b779ce1a1e1c Mon Sep 17 00:00:00 2001
+From 702550757997de7013c96047dbc07791e5ff1d32 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:30:32 +0400
 Subject: [PATCH] gcc: armv4: pass fix-v4bx to linker to support EABI.
diff --git a/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
index c3484360ee3..9920e61a7f0 100644
--- a/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
+++ b/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
@@ -1,4 +1,4 @@
-From 7e5706e74643d8bf78b117620849e546a31295c5 Mon Sep 17 00:00:00 2001
+From 818edee70eb8c5471a9d2924dd50f7cdd9774c12 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:33:04 +0400
 Subject: [PATCH] Use the multilib config files from ${B} instead of using the
@@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [configuration]
  2 files changed, 36 insertions(+), 8 deletions(-)
 
 diff --git a/gcc/configure b/gcc/configure
-index 3870d6e9b6d..07a0b8571d2 100755
+index f2706f94062..135c557b595 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -15135,10 +15135,20 @@ done
+@@ -15141,10 +15141,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -46,7 +46,7 @@ index 3870d6e9b6d..07a0b8571d2 100755
  done
  tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
  
-@@ -15149,6 +15159,10 @@ tm_file_list="options.h"
+@@ -15155,6 +15165,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
@@ -58,10 +58,10 @@ index 3870d6e9b6d..07a0b8571d2 100755
         f=`echo $f | sed 's/^..//'`
         tm_file_list="${tm_file_list} $f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 15670de1706..fd96dd7ba49 100644
+index 3f972dea24f..cbf8fea3ca1 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -2363,10 +2363,20 @@ done
+@@ -2370,10 +2370,20 @@ done
  tmake_file_=
  for f in ${tmake_file}
  do
@@ -86,7 +86,7 @@ index 15670de1706..fd96dd7ba49 100644
  done
  tmake_file="${tmake_file_}${omp_device_property_tmake_file}"
  
-@@ -2377,6 +2387,10 @@ tm_file_list="options.h"
+@@ -2384,6 +2394,10 @@ tm_file_list="options.h"
  tm_include_list="options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
diff --git a/meta/recipes-devtools/gcc/gcc/0011-aarch64-Fix-include-paths-when-S-B.patch b/meta/recipes-devtools/gcc/gcc/0011-aarch64-Fix-include-paths-when-S-B.patch
index 8633f7c4366..0b19de57c04 100644
--- a/meta/recipes-devtools/gcc/gcc/0011-aarch64-Fix-include-paths-when-S-B.patch
+++ b/meta/recipes-devtools/gcc/gcc/0011-aarch64-Fix-include-paths-when-S-B.patch
@@ -1,4 +1,4 @@
-From 0671715ae6d411b5d2d4c53fee42a6e9fe2562c2 Mon Sep 17 00:00:00 2001
+From 875975598d5a1000b8c8ad7596178d0a64f9e0cb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 31 Jan 2023 22:03:38 -0800
 Subject: [PATCH] aarch64: Fix include paths when S != B
@@ -28,7 +28,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
-index 45e901cda64..591062d4b39 100644
+index 4fa1dfc7906..63c9a832d1c 100644
 --- a/gcc/config/aarch64/aarch64.h
 +++ b/gcc/config/aarch64/aarch64.h
 @@ -170,9 +170,9 @@ enum class aarch64_feature : unsigned char {
diff --git a/meta/recipes-devtools/gcc/gcc/0012-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc/0012-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
index 2f6ecd53bb2..6eb5bceebdb 100644
--- a/meta/recipes-devtools/gcc/gcc/0012-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
+++ b/meta/recipes-devtools/gcc/gcc/0012-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
@@ -1,4 +1,4 @@
-From a40108180f552788bb321a853ed4d5f034866a48 Mon Sep 17 00:00:00 2001
+From b38add903c7f701e5b79dd7d93fb7dc61d8252c7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:39:38 +0000
 Subject: [PATCH] Avoid using libdir from .la which usually points to a host
diff --git a/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch
index eb4f0b3045b..32a126ac8a1 100644
--- a/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch
@@ -1,4 +1,4 @@
-From 6ad8db533c7d53a85e6280da1ad88ed4077258fb Mon Sep 17 00:00:00 2001
+From 304299aef8b1ae1f89a0fabbceed0d48091b569b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:25:11 +0000
 Subject: [PATCH] Ensure target gcc headers can be included
diff --git a/meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch
index a9cbc08f1ae..5f48dccc0a2 100644
--- a/meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch
+++ b/meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch
@@ -1,4 +1,4 @@
-From e0d53bf9d59438a1dce0774163fa8c41cf32f306 Mon Sep 17 00:00:00 2001
+From a32cbf0d1c036e6435469898829f96a02c5993a8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Mar 2015 08:21:19 +0000
 Subject: [PATCH] Don't search host directory during "relink" if $inst_prefix
diff --git a/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch
index 8eb00287fc8..e34e65e4799 100644
--- a/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch
+++ b/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch
@@ -1,4 +1,4 @@
-From c2ea8aaa7b00c519c9c269c23ff840138ae491ac Mon Sep 17 00:00:00 2001
+From 6721497a3b4b575e5f9eae785dd4eca0f87b4a5b Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Sun, 5 Jul 2015 20:25:18 -0700
 Subject: [PATCH] libcc1: fix libcc1's install path and rpath
diff --git a/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch
index 82342b0532f..edd100ee465 100644
--- a/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -1,4 +1,4 @@
-From 82da570396a6835e7208c8bb508220524b3a07c7 Mon Sep 17 00:00:00 2001
+From 3f5ac862051e1c77dcca3e63a912f43d66ccdb6f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:39:54 +0000
 Subject: [PATCH] handle sysroot support for nativesdk-gcc
@@ -46,7 +46,7 @@ Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
  8 files changed, 95 insertions(+), 73 deletions(-)
 
 diff --git a/gcc/c-family/c-opts.cc b/gcc/c-family/c-opts.cc
-index be3058dca63..0be85374760 100644
+index f4dced8d826..911aeb68d2d 100644
 --- a/gcc/c-family/c-opts.cc
 +++ b/gcc/c-family/c-opts.cc
 @@ -1542,8 +1542,8 @@ add_prefixed_path (const char *suffix, incpath_kind chain)
diff --git a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
index f87461bcafc..39c3bab9cc1 100644
--- a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
+++ b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -1,4 +1,4 @@
-From cafcdfea0526dda5377a999dd9b1b8c805eafe0a Mon Sep 17 00:00:00 2001
+From b2d95de58356c242abfe35467c2366d4e4b842ce Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:41:45 +0000
 Subject: [PATCH] Search target sysroot gcc version specific dirs with
diff --git a/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
index 71e43e556dd..76da0f79bff 100644
--- a/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+++ b/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -1,4 +1,4 @@
-From f2ad66276fd197cc088d7316662b1d792357ef6c Mon Sep 17 00:00:00 2001
+From e420858f23a1fe58e840bd5ae21cb5a964b27f0b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 27 Jun 2017 18:10:54 -0700
 Subject: [PATCH] Add ssp_nonshared to link commandline for musl targets
diff --git a/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandline-options.patch b/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandline-options.patch
index 7f92dea0c60..05f2e969470 100644
--- a/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandline-options.patch
+++ b/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandline-options.patch
@@ -1,4 +1,4 @@
-From 65baa3804819fbcd540be48f4c4611be5cba43c4 Mon Sep 17 00:00:00 2001
+From edc8f1cee2c9c4a441032fa22d0272b41b829dc6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 6 Jun 2018 12:10:22 -0700
 Subject: [PATCH] Re-introduce spe commandline options
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 13 insertions(+)
 
 diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs6000.opt
-index 83197681b66..04bea50b894 100644
+index e8ca70340df..5c8545d4f1b 100644
 --- a/gcc/config/rs6000/rs6000.opt
 +++ b/gcc/config/rs6000/rs6000.opt
 @@ -344,6 +344,19 @@ mdebug=
diff --git a/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
index c5f43f5ba4a..30868410217 100644
--- a/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
+++ b/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
@@ -1,4 +1,4 @@
-From 18b0057e4e2c5cf6fc6541670418f43f0381db3e Mon Sep 17 00:00:00 2001
+From 83a61604293c6f7a131bccaf7454e69eeed301fd Mon Sep 17 00:00:00 2001
 From: Szabolcs Nagy <nsz@port70.net>
 Date: Sat, 24 Oct 2015 20:09:53 +0000
 Subject: [PATCH] libgcc_s: Use alias for __cpu_indicator_init instead of
@@ -39,7 +39,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/gcc/config/i386/i386-expand.cc b/gcc/config/i386/i386-expand.cc
-index 8bb8f21e686..bcf976aa1b9 100644
+index 51efe6fdd7d..a8ee883a74d 100644
 --- a/gcc/config/i386/i386-expand.cc
 +++ b/gcc/config/i386/i386-expand.cc
 @@ -13087,10 +13087,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
diff --git a/meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch b/meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
index dce2c047d07..f459a542da1 100644
--- a/meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
+++ b/meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
@@ -1,4 +1,4 @@
-From a9bb04b7cf02b2f2d16f68733488f9e48fc7e7a9 Mon Sep 17 00:00:00 2001
+From 33eb17881ca90cff733070c5b630501fb0a8bd58 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 10 Mar 2020 08:26:53 -0700
 Subject: [PATCH] gentypes/genmodes: Do not use __LINE__ for maintaining
diff --git a/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch
index d710b505942..169db188dff 100644
--- a/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch
+++ b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch
@@ -1,4 +1,4 @@
-From db4380eac3cd9baa2f31bcd2fb936ed51f27b415 Mon Sep 17 00:00:00 2001
+From 6ebeb70ce2e78a84295f4e392602ae3c4026783a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 May 2020 15:10:38 -0700
 Subject: [PATCH] libatomic: Do not enforce march on aarch64
diff --git a/meta/recipes-devtools/gcc/gcc/0023-Fix-install-path-of-linux64.h.patch b/meta/recipes-devtools/gcc/gcc/0023-Fix-install-path-of-linux64.h.patch
index 7f1cd0b3d80..300ad393e35 100644
--- a/meta/recipes-devtools/gcc/gcc/0023-Fix-install-path-of-linux64.h.patch
+++ b/meta/recipes-devtools/gcc/gcc/0023-Fix-install-path-of-linux64.h.patch
@@ -1,4 +1,4 @@
-From 92a77026cc64f5eab4cb6b35e4a7c59e6ab8aa20 Mon Sep 17 00:00:00 2001
+From aecde58d433123e8fb76ca2c56a0632d7b104b83 Mon Sep 17 00:00:00 2001
 From: Andrei Gherzan <andrei.gherzan@huawei.com>
 Date: Wed, 22 Dec 2021 12:49:25 +0100
 Subject: [PATCH] Fix install path of linux64.h
diff --git a/meta/recipes-devtools/gcc/gcc/0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch b/meta/recipes-devtools/gcc/gcc/0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch
index a34e6afdb40..4f3b722bcfb 100644
--- a/meta/recipes-devtools/gcc/gcc/0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch
@@ -1,4 +1,4 @@
-From c6fc577e9e89dc16d3e971aa165602746232de4c Mon Sep 17 00:00:00 2001
+From 483baf290597eed2ac01c7974f1b567c95503da5 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sat, 20 Aug 2022 09:04:14 -0700
 Subject: [PATCH] Avoid hardcoded build paths into ppc libgcc
diff --git a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
index 454d05d4734..09d6c7fffd4 100644
--- a/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0025-gcc-testsuite-tweaks-for-mips-OE.patch
@@ -1,4 +1,4 @@
-From 8845248c81c0695ccc65311017deef824fa538fa Mon Sep 17 00:00:00 2001
+From 46987c9092d52ee47071be563f48ee80a3c4f71f Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 17 Aug 2023 09:01:40 -0700
 Subject: [PATCH] gcc testsuite tweaks for mips/OE
@@ -92,7 +92,7 @@ index 228c21d1207..d3b88e0419e 100644
  	"preprocess" {
  	    set compile_type "preprocess"
 diff --git a/gcc/testsuite/lib/target-supports.exp b/gcc/testsuite/lib/target-supports.exp
-index 45435586de2..04942540d8b 100644
+index d8b5a06a422..f66f5fea58e 100644
 --- a/gcc/testsuite/lib/target-supports.exp
 +++ b/gcc/testsuite/lib/target-supports.exp
 @@ -2483,14 +2483,7 @@ proc check_mips_loongson_mmi_hw_available { } {
@@ -142,7 +142,7 @@ index 45435586de2..04942540d8b 100644
      }
    }]
  }
-@@ -9897,6 +9868,7 @@ proc is-effective-target-keyword { arg } {
+@@ -9900,6 +9871,7 @@ proc is-effective-target-keyword { arg } {
  
  proc et-dg-runtest { runtest testcases flags default-extra-flags } {
      global dg-do-what-default
@@ -150,7 +150,7 @@ index 45435586de2..04942540d8b 100644
      global EFFECTIVE_TARGETS
      global et_index
  
-@@ -9904,6 +9876,7 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
+@@ -9907,6 +9879,7 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
  	foreach target $EFFECTIVE_TARGETS {
  	    set target_flags $flags
  	    set dg-do-what-default compile
@@ -158,7 +158,7 @@ index 45435586de2..04942540d8b 100644
  	    set et_index [lsearch -exact $EFFECTIVE_TARGETS $target]
  	    if { [info procs add_options_for_${target}] != [list] } {
  		set target_flags [add_options_for_${target} "$flags"]
-@@ -9911,8 +9884,10 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
+@@ -9914,8 +9887,10 @@ proc et-dg-runtest { runtest testcases flags default-extra-flags } {
  	    if { [info procs check_effective_target_${target}_runtime]
  		 != [list] && [check_effective_target_${target}_runtime] } {
  		set dg-do-what-default run
@@ -169,7 +169,7 @@ index 45435586de2..04942540d8b 100644
  	}
      } else {
  	set et_index 0
-@@ -11606,6 +11581,7 @@ proc check_effective_target_sigsetjmp {} {
+@@ -11620,6 +11595,7 @@ proc check_effective_target_sigsetjmp {} {
  proc check_vect_support_and_set_flags { } {
      global DEFAULT_VECTCFLAGS
      global dg-do-what-default
@@ -177,7 +177,7 @@ index 45435586de2..04942540d8b 100644
      global EFFECTIVE_TARGETS
  
      if  [istarget powerpc-*paired*]  {
-@@ -11614,6 +11590,7 @@ proc check_vect_support_and_set_flags { } {
+@@ -11628,6 +11604,7 @@ proc check_vect_support_and_set_flags { } {
              set dg-do-what-default run
          } else {
              set dg-do-what-default compile
@@ -185,7 +185,7 @@ index 45435586de2..04942540d8b 100644
          }
      } elseif [istarget powerpc*-*-*] {
          # Skip targets not supporting -maltivec.
-@@ -11644,6 +11621,7 @@ proc check_vect_support_and_set_flags { } {
+@@ -11658,6 +11635,7 @@ proc check_vect_support_and_set_flags { } {
  		set DEFAULT_VECTCFLAGS [linsert $DEFAULT_VECTCFLAGS 0 "-mcpu=970"]
              }
              set dg-do-what-default compile
@@ -193,7 +193,7 @@ index 45435586de2..04942540d8b 100644
          }
      } elseif { [istarget i?86-*-*] || [istarget x86_64-*-*] } {
          lappend DEFAULT_VECTCFLAGS "-msse2"
-@@ -11651,6 +11629,7 @@ proc check_vect_support_and_set_flags { } {
+@@ -11665,6 +11643,7 @@ proc check_vect_support_and_set_flags { } {
              set dg-do-what-default run
          } else {
              set dg-do-what-default compile
@@ -201,7 +201,7 @@ index 45435586de2..04942540d8b 100644
          }
      } elseif { [istarget mips*-*-*]
  	       && [check_effective_target_nomips16] } {
-@@ -11670,6 +11649,7 @@ proc check_vect_support_and_set_flags { } {
+@@ -11684,6 +11663,7 @@ proc check_vect_support_and_set_flags { } {
              set dg-do-what-default run
          } else {
              set dg-do-what-default compile
@@ -209,7 +209,7 @@ index 45435586de2..04942540d8b 100644
          }
      } elseif [istarget alpha*-*-*] {
          # Alpha's vectorization capabilities are extremely limited.
-@@ -11683,6 +11663,7 @@ proc check_vect_support_and_set_flags { } {
+@@ -11697,6 +11677,7 @@ proc check_vect_support_and_set_flags { } {
              set dg-do-what-default run
          } else {
              set dg-do-what-default compile
@@ -217,7 +217,7 @@ index 45435586de2..04942540d8b 100644
          }
      } elseif [istarget ia64-*-*] {
          set dg-do-what-default run
-@@ -11696,6 +11677,7 @@ proc check_vect_support_and_set_flags { } {
+@@ -11710,6 +11691,7 @@ proc check_vect_support_and_set_flags { } {
              set dg-do-what-default run
          } else {
              set dg-do-what-default compile
@@ -225,7 +225,7 @@ index 45435586de2..04942540d8b 100644
          }
      } elseif [istarget aarch64*-*-*] {
          set dg-do-what-default run
-@@ -11720,6 +11702,7 @@ proc check_vect_support_and_set_flags { } {
+@@ -11734,6 +11716,7 @@ proc check_vect_support_and_set_flags { } {
          } else {
  	    lappend DEFAULT_VECTCFLAGS "-march=z14" "-mzarch"
              set dg-do-what-default compile
diff --git a/meta/recipes-devtools/gcc/gcc/0026-libstdc-Fix-typo-in-_Grapheme_cluster_view-_Iterator.patch b/meta/recipes-devtools/gcc/gcc/0026-libstdc-Fix-typo-in-_Grapheme_cluster_view-_Iterator.patch
deleted file mode 100644
index 5a465b8c959..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0026-libstdc-Fix-typo-in-_Grapheme_cluster_view-_Iterator.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From c9e05b03c18e898be604ab90401476e9c473cc52 Mon Sep 17 00:00:00 2001
-From: Jonathan Wakely <jwakely@redhat.com>
-Date: Thu, 16 May 2024 17:15:55 +0100
-Subject: [PATCH] libstdc++: Fix typo in _Grapheme_cluster_view::_Iterator
- [PR115119]
-
-libstdc++-v3/ChangeLog:
-
-	PR libstdc++/115119
-	* include/bits/unicode.h (_Iterator::operator++(int)): Fix typo
-	in increment expression.
-	* testsuite/ext/unicode/grapheme_view.cc: Check post-increment
-	on view's iterator.
-
-Drop it when upgrading to 14.2
-
-Upstream-Status: Backport [https://github.com/gcc-mirror/gcc/commit/c9e05b03c18e898be604ab90401476e9c473cc52]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libstdc++-v3/include/bits/unicode.h                 |  6 ++++--
- libstdc++-v3/testsuite/ext/unicode/grapheme_view.cc | 11 +++++++++++
- 2 files changed, 15 insertions(+), 2 deletions(-)
-
-diff --git a/libstdc++-v3/include/bits/unicode.h b/libstdc++-v3/include/bits/unicode.h
-index 46238143fb6..a14a17c5dfc 100644
---- a/libstdc++-v3/include/bits/unicode.h
-+++ b/libstdc++-v3/include/bits/unicode.h
-@@ -34,10 +34,12 @@
- #include <array>
- #include <bit>      // bit_width
- #include <charconv> // __detail::__from_chars_alnum_to_val_table
-+#include <string_view>
- #include <cstdint>
- #include <bits/stl_algo.h>
- #include <bits/stl_iterator.h>
--#include <bits/ranges_base.h>
-+#include <bits/ranges_base.h> // iterator_t, sentinel_t, input_range, etc.
-+#include <bits/ranges_util.h> // view_interface
- 
- namespace std _GLIBCXX_VISIBILITY(default)
- {
-@@ -802,7 +804,7 @@ inline namespace __v15_1_0
- 	operator++(int)
- 	{
- 	  auto __tmp = *this;
--	  ++this;
-+	  ++*this;
- 	  return __tmp;
- 	}
- 
-diff --git a/libstdc++-v3/testsuite/ext/unicode/grapheme_view.cc b/libstdc++-v3/testsuite/ext/unicode/grapheme_view.cc
-index ac1e8c50b05..a3bb36e14b8 100644
---- a/libstdc++-v3/testsuite/ext/unicode/grapheme_view.cc
-+++ b/libstdc++-v3/testsuite/ext/unicode/grapheme_view.cc
-@@ -83,10 +83,21 @@ test_breaks()
-   VERIFY( iter == gv.end() );
- }
- 
-+constexpr void
-+test_pr115119()
-+{
-+  // PR 115119 Typo in _Grapheme_cluster_view::_Iterator::operator++(int)
-+  uc::_Grapheme_cluster_view gv(" "sv);
-+  auto it = std::ranges::begin(gv);
-+  it++;
-+  VERIFY( it == std::ranges::end(gv) );
-+}
-+
- int main()
- {
-   auto run_tests = []{
-     test_breaks();
-+    test_pr115119();
-     return true;
-   };
- 
diff --git a/meta/recipes-devtools/gcc/gcc_14.1.bb b/meta/recipes-devtools/gcc/gcc_14.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_14.1.bb
rename to meta/recipes-devtools/gcc/gcc_14.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_14.1.bb b/meta/recipes-devtools/gcc/libgcc-initial_14.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_14.1.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_14.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_14.1.bb b/meta/recipes-devtools/gcc/libgcc_14.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_14.1.bb
rename to meta/recipes-devtools/gcc/libgcc_14.2.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_14.1.bb b/meta/recipes-devtools/gcc/libgfortran_14.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_14.1.bb
rename to meta/recipes-devtools/gcc/libgfortran_14.2.bb

