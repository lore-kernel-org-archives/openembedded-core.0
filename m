Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D6AC77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 18:53:03 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.248.1682621579264847270
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 11:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Qmjm2/7o;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-64115e652eeso7159635b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 11:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682621578; x=1685213578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jE0zA9S8EZNQIgkHqi49OW/PSY9/F8pbZyMAZkHT4pY=;
        b=Qmjm2/7olnMOxirUK+KxHjdzriwQqqGsS5nMeH79+eiYBIblFXf4hE1rtcrKgwyjiG
         EYyGlP7goz7QVxeIph1SKCNMCrE1cBhSJETxMUv59eRPlkxtMWVvYnrOctSuJrFc4//k
         A72ERzJOhpZ+0TJpMaIeEt6otAViDbnmjE+rs9peyjoEkKQVfXlvzHw01FIpbjfz2+YN
         qxO6TgHmvvwbIh1cFB3G7x1POOHJfxejcW5G3IFSouOMBggQlO7j9pFiB3AL334rQwg6
         shO1Akv4+j/NJEyp1H4RbzBLOBy/eKgjxBtT9zwUuhKyBTuz/T6B409+TieV7DLuvg+b
         t8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682621578; x=1685213578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jE0zA9S8EZNQIgkHqi49OW/PSY9/F8pbZyMAZkHT4pY=;
        b=g+J2j0cSPSVgZHY7qYjOpQ+cwKLXmNff9ujCRz5z5DOxyDiL+5f47dLhkmKTCE4xPH
         VzbZUGf9YzSYrAcVj/EQJSNJ1iwOoBq/9eVPVQlJfLBXbtwnKkjY39DemG1bQ80XFQPV
         GL90q3gxSHg8rMrYCxKISvGrPAAq62mlbjDEdv7x0y8H0nrOJPjaOeM+EusDASVm40xx
         yJKoJOtsuQX1UGobaSJrb0SVwVQ/e4JudtE0ck6YzTFkYPyE3ypIBMkYXiB+xMbOP6vB
         Y8Ak4WhneUxI2f+BwU6dkOq22U4FskOCpuDjDfyD3XlAjO8HJ5AMaq9NYacCiHA3p2P7
         8XIg==
X-Gm-Message-State: AC+VfDz/Rc1CxwgIv3zb+lERuq8ARYIeXXU8cqRdzrFVrhS1vDqEZTj0
	Pr+oHmyXxwcDP78wK8D96kjlkcY4GcTkZA==
X-Google-Smtp-Source: ACHHUZ5tUHah69OWUnDmYgSbJLtHeiBEGhjX49SZgSrkkJ+6C4eynGECdc8bGift34BVtbbji6USIw==
X-Received: by 2002:a17:90a:e646:b0:246:57ba:ab28 with SMTP id ep6-20020a17090ae64600b0024657baab28mr3427774pjb.2.1682621577242;
        Thu, 27 Apr 2023 11:52:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::5002])
        by smtp.gmail.com with ESMTPSA id y22-20020a17090abd1600b00246b7b8b43asm94974pjr.49.2023.04.27.11.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 11:52:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc: Upgrade to GCC 13.1 release
Date: Thu, 27 Apr 2023 11:52:53 -0700
Message-Id: <20230427185253.1519194-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 18:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180498

- Package libhwasan_preinit.o, its available on some arches e.g. x86_64 on
  gcc13+
- GCC 13 Porting guide [1] and major changes [2] and detailed documentation=
 [3]
- Fix aarch64 cross build when S !=3D B

[1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
[2] https://www.gnu.org/software/gcc/gcc-13/changes.html
[3] https://gcc.gnu.org/onlinedocs/13.1.0/

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  2 +-
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../gcc/{gcc-12.2.inc =3D> gcc-13.1.inc}        | 25 ++---
 ...ian_12.2.bb =3D> gcc-cross-canadian_13.1.bb} |  0
 .../{gcc-cross_12.2.bb =3D> gcc-cross_13.1.bb}  |  0
 ...-crosssdk_12.2.bb =3D> gcc-crosssdk_13.1.bb} |  0
 ...cc-runtime_12.2.bb =3D> gcc-runtime_13.1.bb} |  0
 meta/recipes-devtools/gcc/gcc-sanitizers.inc  |  1 +
 ...itizers_12.2.bb =3D> gcc-sanitizers_13.1.bb} |  0
 ...{gcc-source_12.2.bb =3D> gcc-source_13.1.bb} |  0
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch | 10 +-
 .../0002-gcc-poison-system-directories.patch  | 96 ++++++++-----------
 .../gcc/gcc/0003-64-bit-multilib-hack.patch   | 51 ++++++----
 ...R_BUILD-in-a-couple-of-places-to-avo.patch | 14 +--
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch | 24 ++---
 .../gcc/gcc/0006-cpp-honor-sysroot.patch      | 14 +--
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 54 +++++------
 .../gcc/gcc/0008-libtool.patch                |  5 +-
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |  9 +-
 ...-config-files-from-B-instead-of-usin.patch | 14 +--
 ...1-aarch64-Fix-include-paths-when-S-B.patch | 55 +++++++++++
 ...r-from-.la-which-usually-points-to-.patch} |  2 +-
 ...e-target-gcc-headers-can-be-included.patch | 22 ++---
 ...t-directory-during-relink-if-inst_pr.patch |  2 +-
 ...-fix-libcc1-s-install-path-and-rpath.patch |  4 +-
 ...le-sysroot-support-for-nativesdk-gcc.patch | 56 ++++++-----
 ...sroot-gcc-version-specific-dirs-with.patch | 11 ++-
 ...d-to-link-commandline-for-musl-targe.patch | 10 +-
 ...Re-introduce-spe-commandline-options.patch |  6 +-
 ...as-for-__cpu_indicator_init-instead-.patch |  8 +-
 ...s-Do-not-use-__LINE__-for-maintainin.patch | 38 ++++----
 ...mic-Do-not-enforce-march-on-aarch64.patch} | 16 ++--
 ... 0023-Fix-install-path-of-linux64.h.patch} |  6 +-
 ...ardcoded-build-paths-into-ppc-libgcc.patch | 28 ++++++
 .../gcc/gcc/0026-rust-recursion-limit.patch   | 92 ------------------
 .../gcc/gcc/hardcoded-paths.patch             | 19 ----
 .../gcc/gcc/prefix-map-realpath.patch         | 64 -------------
 .../gcc/{gcc_12.2.bb =3D> gcc_13.1.bb}          |  0
 ...initial_12.2.bb =3D> libgcc-initial_13.1.bb} |  0
 .../gcc/{libgcc_12.2.bb =3D> libgcc_13.1.bb}    |  0
 ...ibgfortran_12.2.bb =3D> libgfortran_13.1.bb} |  0
 41 files changed, 337 insertions(+), 423 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-12.2.inc =3D> gcc-13.1.inc} (84%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_12.2.bb =3D> gcc-cros=
s-canadian_13.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_12.2.bb =3D> gcc-cross_13.1.bb=
} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_12.2.bb =3D> gcc-crosssdk_1=
3.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_12.2.bb =3D> gcc-runtime_13.=
1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_12.2.bb =3D> gcc-sanitize=
rs_13.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_12.2.bb =3D> gcc-source_13.1.=
bb} (100%)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0011-aarch64-Fix-include-=
paths-when-S-B.patch
 rename meta/recipes-devtools/gcc/gcc/{0011-Avoid-using-libdir-from-.la-whi=
ch-usually-points-to-.patch =3D> 0012-Avoid-using-libdir-from-.la-which-usu=
ally-points-to-.patch} (92%)
 rename meta/recipes-devtools/gcc/gcc/{0023-libatomic-Do-not-enforce-march-=
on-aarch64.patch =3D> 0022-libatomic-Do-not-enforce-march-on-aarch64.patch}=
 (81%)
 rename meta/recipes-devtools/gcc/gcc/{0024-Fix-install-path-of-linux64.h.p=
atch =3D> 0023-Fix-install-path-of-linux64.h.patch} (85%)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0024-Avoid-hardcoded-buil=
d-paths-into-ppc-libgcc.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0026-rust-recursion-limit=
.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/hardcoded-paths.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch
 rename meta/recipes-devtools/gcc/{gcc_12.2.bb =3D> gcc_13.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_12.2.bb =3D> libgcc-initi=
al_13.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_12.2.bb =3D> libgcc_13.1.bb} (100=
%)
 rename meta/recipes-devtools/gcc/{libgfortran_12.2.bb =3D> libgfortran_13.=
1.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index 66f8eb6af3..a523148e2f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -189,7 +189,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TA=
RGET_ARCH} =3D "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} =3D "Khem Raj <raj.khem@gmail=
.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers =3D "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gcc-source-12.2.0 =3D "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gcc-source-13.1.0 =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr3 =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-gcr =3D "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc
index dc4cd470e7..7c182eacf4 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -16,7 +16,7 @@ PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs =3D =
"nativesdk-gcc-runtime"
 # Default libc config
 PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
=20
-GCCVERSION ?=3D "12.%"
+GCCVERSION ?=3D "13.%"
 SDKGCCVERSION ?=3D "${GCCVERSION}"
 BINUVERSION ?=3D "2.40%"
 GDBVERSION ?=3D "13.%"
diff --git a/meta/recipes-devtools/gcc/gcc-12.2.inc b/meta/recipes-devtools=
/gcc/gcc-13.1.inc
similarity index 84%
rename from meta/recipes-devtools/gcc/gcc-12.2.inc
rename to meta/recipes-devtools/gcc/gcc-13.1.inc
index 0dbbecad4a..d361b680f4 100644
--- a/meta/recipes-devtools/gcc/gcc-12.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-13.1.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
=20
 # Third digit in PV should be incremented after a minor release
=20
-PV =3D "12.2.0"
+PV =3D "13.1.0"
=20
 # BINV should be incremented to a revision after a minor gcc release
=20
-BINV =3D "12.2.0"
+BINV =3D "13.1.0"
=20
 FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
=20
@@ -22,13 +22,15 @@ LIC_FILES_CHKSUM =3D "\
     file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1 \
     file://COPYING.RUNTIME;md5=3Dfe60d87048567d4fe8c8a0ed2448bcc8 \
 "
-# from git
-#RELEASE ?=3D "7092b7aea122a91824d048aeb23834cf1d19b1a1"
+# snapshot from git
+#RELEASE ?=3D "9b6bf076c11cba0f9ccdace63e8b4044b1a858ea"
+#BASEURI ?=3D "https://git.linaro.org/toolchain/gcc.git/snapshot/gcc-${REL=
EASE}.tar.gz"
+#SOURCEDIR =3D "gcc-${RELEASE}"
 #BASEURI ?=3D "https://repo.or.cz/official-gcc.git/snapshot/${RELEASE}.tar=
.gz;downloadfilename=3Dgcc-${PV}-${RELEASE}.tar.gz"
 #SOURCEDIR ?=3D "official-gcc-${@'${RELEASE}'[0:7]}"
=20
 # from snapshot
-#RELEASE ?=3D "12.1.0-RC-20220429"
+#RELEASE ?=3D "13.1.0-RC-20230421"
 #SOURCEDIR ?=3D "gcc-${RELEASE}"
 #BASEURI ?=3D "https://gcc.gnu.org/pub/gcc/snapshots/${RELEASE}/gcc-${RELE=
ASE}.tar.xz"
=20
@@ -48,7 +50,8 @@ SRC_URI =3D "${BASEURI} \
            file://0008-libtool.patch \
            file://0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.p=
atch \
            file://0010-Use-the-multilib-config-files-from-B-instead-of-usi=
n.patch \
-           file://0011-Avoid-using-libdir-from-.la-which-usually-points-to=
-.patch \
+           file://0011-aarch64-Fix-include-paths-when-S-B.patch \
+           file://0012-Avoid-using-libdir-from-.la-which-usually-points-to=
-.patch \
            file://0013-Ensure-target-gcc-headers-can-be-included.patch \
            file://0014-Don-t-search-host-directory-during-relink-if-inst_p=
r.patch \
            file://0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
@@ -58,13 +61,11 @@ SRC_URI =3D "${BASEURI} \
            file://0019-Re-introduce-spe-commandline-options.patch \
            file://0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead=
-.patch \
            file://0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintaini=
n.patch \
-           file://0023-libatomic-Do-not-enforce-march-on-aarch64.patch \
-           file://0024-Fix-install-path-of-linux64.h.patch \
-           file://0026-rust-recursion-limit.patch \
-           file://prefix-map-realpath.patch \
-           file://hardcoded-paths.patch \
+           file://0022-libatomic-Do-not-enforce-march-on-aarch64.patch \
+           file://0023-Fix-install-path-of-linux64.h.patch \
+           file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
 "
-SRC_URI[sha256sum] =3D "e549cf9cf3594a00e27b6589d4322d70e0720cdd213f39beb4=
181e06926230ff"
+SRC_URI[sha256sum] =3D "61d684f0aa5e76ac6585ad8898a2427aade8979ed5e7f85492=
286c4dfc13ee86"
=20
 S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
 B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_12.2.bb b/meta/re=
cipes-devtools/gcc/gcc-cross-canadian_13.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_13.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_12.2.bb b/meta/recipes-dev=
tools/gcc/gcc-cross_13.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-cross_13.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_12.2.bb b/meta/recipes-=
devtools/gcc/gcc-crosssdk_13.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_13.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb b/meta/recipes-d=
evtools/gcc/gcc-runtime_13.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_13.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-de=
vtools/gcc/gcc-sanitizers.inc
index 9881afa837..9016f7f937 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -86,6 +86,7 @@ COMPATIBLE_HOST:libc-musl =3D 'null'
 FILES:libasan +=3D "${libdir}/libasan.so.* ${libdir}/libhwasan.so.*"
 FILES:libasan-dev +=3D "\
     ${libdir}/libasan_preinit.o \
+    ${libdir}/libhwasan_preinit.o \
     ${libdir}/libasan.so \
     ${libdir}/libhwasan.so \
     ${libdir}/libasan.la \
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb b/meta/recipe=
s-devtools/gcc/gcc-sanitizers_13.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_13.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_12.2.bb b/meta/recipes-de=
vtools/gcc/gcc-source_13.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_12.2.bb
rename to meta/recipes-devtools/gcc/gcc-source_13.1.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TA=
RGET.patch b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TA=
RGET.patch
index 66e582ca98..0f1340491f 100644
--- a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.pa=
tch
+++ b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.pa=
tch
@@ -1,4 +1,4 @@
-From 31f94ef5b43a984a98f0eebd2dcf1b53aa1d7bce Mon Sep 17 00:00:00 2001
+From 3875ab692a7d7ee796a6d5d2ece6daa3db81d5c4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:37:11 +0400
 Subject: [PATCH] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
@@ -12,10 +12,10 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/configure b/configure
-index 5dcaab14ae9..f76310a36bb 100755
+index 85883099410..044315af1da 100755
 --- a/configure
 +++ b/configure
-@@ -10165,7 +10165,7 @@ fi
+@@ -10183,7 +10183,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs=3D"--cache-file=3D./config.cache ${target_configargs}"
=20=20
@@ -25,10 +25,10 @@ index 5dcaab14ae9..f76310a36bb 100755
   *" newlib "*)
    case " $target_configargs " in
 diff --git a/configure.ac b/configure.ac
-index 85977482aee..8b9097c7a45 100644
+index 2b612dce6e9..f26fffd4f62 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3346,7 +3346,7 @@ fi
+@@ -3339,7 +3339,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs=3D"--cache-file=3D./config.cache ${target_configargs}"
=20=20
diff --git a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directori=
es.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories=
.patch
index 02135b7324..147f5bfd46 100644
--- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
@@ -1,4 +1,4 @@
-From 99f1e61b2957226254a116fde7fd73bf07034012 Mon Sep 17 00:00:00 2001
+From e09aa9c3565585390328dd514cc286c20b74e76a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 8 Mar 2021 16:04:20 -0800
 Subject: [PATCH] gcc: poison-system-directories
@@ -12,7 +12,6 @@ Instead, we add the two missing items to the current scan=
.  If the user
 wants this to be a failure, they can add "-Werror=3Dpoison-system-director=
ies".
=20
 Upstream-Status: Inappropriate [OE configuration]
-
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
@@ -21,15 +20,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gcc/configure       | 19 +++++++++++++++++++
  gcc/configure.ac    | 16 ++++++++++++++++
  gcc/doc/invoke.texi |  9 +++++++++
- gcc/gcc.cc          | 15 ++++++++++++---
+ gcc/gcc.cc          |  9 +++++++--
  gcc/incpath.cc      | 21 +++++++++++++++++++++
- 7 files changed, 91 insertions(+), 3 deletions(-)
+ 7 files changed, 86 insertions(+), 2 deletions(-)
=20
 diff --git a/gcc/common.opt b/gcc/common.opt
-index 8a0dafc52..0357868e2 100644
+index 862c474d3c8..64c4277c991 100644
 --- a/gcc/common.opt
 +++ b/gcc/common.opt
-@@ -710,6 +710,10 @@ Wreturn-local-addr
+@@ -711,6 +711,10 @@ Wreturn-local-addr
  Common Var(warn_return_local_addr) Init(1) Warning
  Warn about returning a pointer/reference to a local or temporary variable.
=20=20
@@ -41,10 +40,10 @@ index 8a0dafc52..0357868e2 100644
  Common Var(warn_shadow) Warning
  Warn when one variable shadows another.  Same as -Wshadow=3Dglobal.
 diff --git a/gcc/config.in b/gcc/config.in
-index 64c27c9cf..a693cb8a8 100644
+index 4cad077bfbe..80e832fdb84 100644
 --- a/gcc/config.in
 +++ b/gcc/config.in
-@@ -230,6 +230,16 @@
+@@ -236,6 +236,16 @@
  #endif
=20=20
=20=20
@@ -62,10 +61,10 @@ index 64c27c9cf..a693cb8a8 100644
     optimizer and back end) to be checked for dynamic type safety at runti=
me.
     This is quite expensive. */
 diff --git a/gcc/configure b/gcc/configure
-index 2b83acfb0..8bb97578c 100755
+index c7b26d1927d..3508be7b439 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -1023,6 +1023,7 @@ enable_maintainer_mode
+@@ -1026,6 +1026,7 @@ enable_maintainer_mode
  enable_link_mutex
  enable_link_serialization
  enable_version_specific_runtime_libs
@@ -73,7 +72,7 @@ index 2b83acfb0..8bb97578c 100755
  enable_plugin
  enable_host_shared
  enable_libquadmath_support
-@@ -1785,6 +1786,8 @@ Optional Features:
+@@ -1788,6 +1789,8 @@ Optional Features:
    --enable-version-specific-runtime-libs
                            specify that runtime libraries should be instal=
led
                            in a compiler-specific directory
@@ -82,7 +81,7 @@ index 2b83acfb0..8bb97578c 100755
    --enable-plugin         enable plugin support
    --enable-host-shared    build host code as shared libraries
    --disable-libquadmath-support
-@@ -31996,6 +31999,22 @@ if test "${enable_version_specific_runtime_libs+s=
et}" =3D set; then :
+@@ -31753,6 +31756,22 @@ if test "${enable_version_specific_runtime_libs+s=
et}" =3D set; then :
  fi
=20=20
=20=20
@@ -106,10 +105,10 @@ index 2b83acfb0..8bb97578c 100755
=20=20
=20=20
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index daf2a708c..6155b83a7 100644
+index 09082e8ccae..6cd01a8966b 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -7435,6 +7435,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
+@@ -7292,6 +7292,22 @@ AC_ARG_ENABLE(version-specific-runtime-libs,
                  [specify that runtime libraries should be
                   installed in a compiler-specific directory])])
=20=20
@@ -133,37 +132,37 @@ index daf2a708c..6155b83a7 100644
  AC_SUBST(subdirs)
  AC_SUBST(srcdir)
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index ff6c338be..a8ebfa59a 100644
+index c9482886c5a..f302c637908 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
-@@ -379,6 +379,7 @@ Objective-C and Objective-C++ Dialects}.
- -Wpacked  -Wno-packed-bitfield-compat  -Wpacked-not-aligned  -Wpadded @gol
- -Wparentheses  -Wno-pedantic-ms-format @gol
- -Wpointer-arith  -Wno-pointer-compare  -Wno-pointer-to-int-cast @gol
-+-Wno-poison-system-directories @gol
- -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls @gol
- -Wrestrict  -Wno-return-local-addr  -Wreturn-type @gol
- -Wno-scalar-storage-order  -Wsequence-point @gol
-@@ -8029,6 +8030,14 @@ made up of data only and thus requires no special t=
reatment.  But, for
+@@ -384,6 +384,7 @@ Objective-C and Objective-C++ Dialects}.
+ -Wpacked  -Wno-packed-bitfield-compat  -Wpacked-not-aligned  -Wpadded
+ -Wparentheses  -Wno-pedantic-ms-format
+ -Wpointer-arith  -Wno-pointer-compare  -Wno-pointer-to-int-cast
++-Wno-poison-system-directories
+ -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls
+ -Wrestrict  -Wno-return-local-addr  -Wreturn-type
+ -Wno-scalar-storage-order  -Wsequence-point
+@@ -8422,6 +8423,14 @@ made up of data only and thus requires no special t=
reatment.  But, for
  most targets, it is made up of code and thus requires the stack to be
  made executable in order for the program to work properly.
=20=20
-+@item -Wno-poison-system-directories
 +@opindex Wno-poison-system-directories
++@item -Wno-poison-system-directories
 +Do not warn for @option{-I} or @option{-L} options using system
 +directories such as @file{/usr/include} when cross compiling.  This
 +option is intended for use in chroot environments when such
 +directories contain the correct headers and libraries for the target
 +system rather than the host.
 +
- @item -Wfloat-equal
  @opindex Wfloat-equal
  @opindex Wno-float-equal
+ @item -Wfloat-equal
 diff --git a/gcc/gcc.cc b/gcc/gcc.cc
-index beefde7f6..4e6557b3c 100644
+index 16bb07f2cdc..5feae021545 100644
 --- a/gcc/gcc.cc
 +++ b/gcc/gcc.cc
-@@ -1162,6 +1162,8 @@ proper position among the other output files.  */
+@@ -1146,6 +1146,8 @@ proper position among the other output files.  */
     "%{fuse-ld=3D*:-fuse-ld=3D%*} " LINK_COMPRESS_DEBUG_SPEC \
     "%X %{o*} %{e*} %{N} %{n} %{r}\
      %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!r:%{!nostartfiles:%S}}} \
@@ -172,7 +171,7 @@ index beefde7f6..4e6557b3c 100644
      %{static|no-pie|static-pie:} %@{L*} %(mfwrap) %(link_libgcc) " \
      VTABLE_VERIFICATION_SPEC " " SANITIZER_EARLY_SPEC " %o "" \
      %{fopenacc|fopenmp|%:gt(%{ftree-parallelize-loops=3D*:%*} 1):\
-@@ -1257,8 +1259,11 @@ static const char *cpp_unique_options =3D
+@@ -1241,8 +1243,11 @@ static const char *cpp_unique_options =3D
  static const char *cpp_options =3D
  "%(cpp_unique_options) %1 %{m*} %{std*&ansi&trigraphs} %{W*&pedantic*} %{=
w}\
   %{f*} %{g*:%{%:debug-level-gt(0):%{g*}\
@@ -180,27 +179,14 @@ index beefde7f6..4e6557b3c 100644
 - %{undef} %{save-temps*:-fpch-preprocess}";
 + %{!fno-working-directory:-fworking-directory}}} %{O*}"
 +#ifdef POISON_BY_DEFAULT
-+ " %{!Wno-error=3Dpoison-system-directories:-Werror=3Dpoison-system-direc=
tories}"
++ " -Werror=3Dpoison-system-directories"
 +#endif
 + " %{undef} %{save-temps*:-fpch-preprocess}";
=20=20
  /* Pass -d* flags, possibly modifying -dumpdir, -dumpbase et al.
=20=20
-@@ -1287,7 +1292,11 @@ static const char *cc1_options =3D
-  %{coverage:-fprofile-arcs -ftest-coverage}\
-  %{fprofile-arcs|fprofile-generate*|coverage:\
-    %{!fprofile-update=3Dsingle:\
--     %{pthread:-fprofile-update=3Dprefer-atomic}}}";
-+     %{pthread:-fprofile-update=3Dprefer-atomic}}}"
-+#ifdef POISON_BY_DEFAULT
-+ " %{!Wno-error=3Dpoison-system-directories:-Werror=3Dpoison-system-direc=
tories}"
-+#endif
-+  ;
-=20
- static const char *asm_options =3D
- "%{-target-help:%:print-asm-header()} "
 diff --git a/gcc/incpath.cc b/gcc/incpath.cc
-index 622204a38..5ac03c086 100644
+index 4d44321183f..46c0d543205 100644
 --- a/gcc/incpath.cc
 +++ b/gcc/incpath.cc
 @@ -26,6 +26,7 @@
@@ -222,17 +208,17 @@ index 622204a38..5ac03c086 100644
 +       struct cpp_dir *p;
 +
 +       for (p =3D heads[INC_QUOTE]; p; p =3D p->next)
-+         {
-+          if ((!strncmp (p->name, "/usr/include", 12))
-+              || (!strncmp (p->name, "/usr/local/include", 18))
-+              || (!strncmp (p->name, "/usr/X11R6/include", 18))
-+              || (!strncmp (p->name, "/sw/include", 11))
-+              || (!strncmp (p->name, "/opt/include", 12)))
-+            warning (OPT_Wpoison_system_directories,
-+                     "include location \"%s\" is unsafe for "
-+                     "cross-compilation",
-+                     p->name);
-+         }
++	 {
++	  if ((!strncmp (p->name, "/usr/include", 12))
++	      || (!strncmp (p->name, "/usr/local/include", 18))
++	      || (!strncmp (p->name, "/usr/X11R6/include", 18))
++	      || (!strncmp (p->name, "/sw/include", 11))
++	      || (!strncmp (p->name, "/opt/include", 12)))
++	    warning (OPT_Wpoison_system_directories,
++		     "include location \"%s\" is unsafe for "
++		     "cross-compilation",
++		     p->name);
++	 }
 +    }
 +#endif
  }
diff --git a/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch =
b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
index e83f05b8aa..d547d7e48a 100644
--- a/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
@@ -1,7 +1,7 @@
-From 34b861e7a4cfd7b1f0d2c0f8cf9bb0b0b81eb61a Mon Sep 17 00:00:00 2001
+From 86664e09670efa5a8662ef59590e01707f8e0cc3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:10:06 +0400
-Subject: [PATCH] 64-bit multilib hack.
+Subject: [PATCH] 64-bit multilib hack
=20
 GCC has internal multilib handling code but it assumes a very specific rig=
id directory
 layout. The build system implementation of multilib layout is very generic=
 and allows
@@ -28,18 +28,17 @@ Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  gcc/config/aarch64/t-aarch64-linux |  8 ++++----
  gcc/config/arc/t-multilib-linux    |  4 ++--
  gcc/config/i386/t-linux64          |  6 ++----
- gcc/config/mips/t-linux64          | 10 +++-------
- gcc/config/riscv/t-linux           |  6 ++++--
+ gcc/config/mips/t-linux64          | 28 ++--------------------------
+ gcc/config/riscv/t-linux           |  4 ++--
  gcc/config/rs6000/t-linux64        |  5 ++---
- 6 files changed, 17 insertions(+), 22 deletions(-)
+ 6 files changed, 14 insertions(+), 41 deletions(-)
=20
 diff --git a/gcc/config/aarch64/t-aarch64-linux b/gcc/config/aarch64/t-aar=
ch64-linux
-index d0cd546002a..f4056d68372 100644
+index 57bf4100fcd..aaef5da8059 100644
 --- a/gcc/config/aarch64/t-aarch64-linux
 +++ b/gcc/config/aarch64/t-aarch64-linux
 @@ -21,8 +21,8 @@
@@ -56,7 +55,7 @@ index d0cd546002a..f4056d68372 100644
 -MULTILIB_OSDIRNAMES +=3D mabi.ilp32=3D../libilp32$(call if_multiarch,:aar=
ch64$(AARCH_BE)-linux-gnu_ilp32)
 +#MULTILIB_OSDIRNAMES +=3D mabi.ilp32=3D../libilp32$(call if_multiarch,:aa=
rch64$(AARCH_BE)-linux-gnu_ilp32)
 diff --git a/gcc/config/arc/t-multilib-linux b/gcc/config/arc/t-multilib-l=
inux
-index ecb9ae6859f..12a164028d4 100644
+index a839e4ea67c..f92664573a9 100644
 --- a/gcc/config/arc/t-multilib-linux
 +++ b/gcc/config/arc/t-multilib-linux
 @@ -16,9 +16,9 @@
@@ -72,7 +71,7 @@ index ecb9ae6859f..12a164028d4 100644
  # Aliases:
  MULTILIB_MATCHES +=3D mcpu?arc700=3DmA7
 diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
-index 5526ad0e6cc..fa51c88912b 100644
+index 138956b0962..d6e0cdc4342 100644
 --- a/gcc/config/i386/t-linux64
 +++ b/gcc/config/i386/t-linux64
 @@ -32,7 +32,5 @@
@@ -86,37 +85,53 @@ index 5526ad0e6cc..fa51c88912b 100644
 +MULTILIB_DIRNAMES =3D . .
 +MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) ../$(shell ba=
sename $(base_libdir))
 diff --git a/gcc/config/mips/t-linux64 b/gcc/config/mips/t-linux64
-index 2fdd8e00407..04f2099250f 100644
+index 176091cabb6..8258ef40559 100644
 --- a/gcc/config/mips/t-linux64
 +++ b/gcc/config/mips/t-linux64
-@@ -17,10 +17,6 @@
+@@ -17,29 +17,5 @@
  # <http://www.gnu.org/licenses/>.
=20=20
  MULTILIB_OPTIONS =3D mabi=3Dn32/mabi=3D32/mabi=3D64
 -MULTILIB_DIRNAMES =3D n32 32 64
 -MIPS_EL =3D $(if $(filter %el, $(firstword $(subst -, ,$(target)))),el)
 -MIPS_SOFT =3D $(if $(strip $(filter MASK_SOFT_FLOAT_ABI, $(target_cpu_def=
ault)) $(filter soft, $(with_float))),soft)
--MULTILIB_OSDIRNAMES =3D \
+-ifeq (yes,$(enable_multiarch))
+-  ifneq (,$(findstring gnuabi64,$(target)))
+-    MULTILIB_OSDIRNAMES =3D \
+-	../lib32$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabin32$(MIPS_SOFT=
)) \
+-	../libo32$(call if_multiarch,:mips$(MIPS_EL)-linux-gnu$(MIPS_SOFT)) \
+-	../lib$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabi64$(MIPS_SOFT))
+-  else ifneq (,$(findstring gnuabin32,$(target)))
+-    MULTILIB_OSDIRNAMES =3D \
+-	../lib$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabin32$(MIPS_SOFT))=
 \
+-	../libo32$(call if_multiarch,:mips$(MIPS_EL)-linux-gnu$(MIPS_SOFT)) \
+-	../lib64$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabi64$(MIPS_SOFT))
+-  else
+-    MULTILIB_OSDIRNAMES =3D \
 -	../lib32$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabin32$(MIPS_SOFT=
)) \
 -	../lib$(call if_multiarch,:mips$(MIPS_EL)-linux-gnu$(MIPS_SOFT)) \
 -	../lib64$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabi64$(MIPS_SOFT))
+-  endif
+-else
+-  MULTILIB_OSDIRNAMES =3D \
+-	../lib32$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabin32$(MIPS_SOFT=
)) \
+-	../lib$(call if_multiarch,:mips$(MIPS_EL)-linux-gnu$(MIPS_SOFT)) \
+-	../lib64$(call if_multiarch,:mips64$(MIPS_EL)-linux-gnuabi64$(MIPS_SOFT))
+-endif
 +MULTILIB_DIRNAMES =3D . . .
 +MULTILIB_OSDIRNAMES =3D ../$(shell basename $(base_libdir)) ../$(shell ba=
sename $(base_libdir)) ../$(shell basename $(base_libdir))
-+
 diff --git a/gcc/config/riscv/t-linux b/gcc/config/riscv/t-linux
-index 216d2776a18..e4d817621fc 100644
+index 216d2776a18..e3c520f4bf6 100644
 --- a/gcc/config/riscv/t-linux
 +++ b/gcc/config/riscv/t-linux
-@@ -1,3 +1,5 @@
+@@ -1,3 +1,3 @@
  # Only XLEN and ABI affect Linux multilib dir names, e.g. /lib32/ilp32d/
 -MULTILIB_DIRNAMES :=3D $(patsubst rv32%,lib32,$(patsubst rv64%,lib64,$(MU=
LTILIB_DIRNAMES)))
 -MULTILIB_OSDIRNAMES :=3D $(patsubst lib%,../lib%,$(MULTILIB_DIRNAMES))
 +#MULTILIB_DIRNAMES :=3D $(patsubst rv32%,lib32,$(patsubst rv64%,lib64,$(M=
ULTILIB_DIRNAMES)))
-+MULTILIB_DIRNAMES :=3D . .
 +#MULTILIB_OSDIRNAMES :=3D $(patsubst lib%,../lib%,$(MULTILIB_DIRNAMES))
-+MULTILIB_OSDIRNAMES :=3D ../$(shell basename $(base_libdir)) ../$(shell b=
asename $(base_libdir))
 diff --git a/gcc/config/rs6000/t-linux64 b/gcc/config/rs6000/t-linux64
-index 47e0efd5764..05f5a3f188e 100644
+index 01a94242308..1429eceaebf 100644
 --- a/gcc/config/rs6000/t-linux64
 +++ b/gcc/config/rs6000/t-linux64
 @@ -26,10 +26,9 @@
diff --git a/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-=
a-couple-of-places-to-avo.patch b/meta/recipes-devtools/gcc/gcc/0004-Pass-C=
XXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
index 026f946b4d..955b68bd40 100644
--- a/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-coupl=
e-of-places-to-avo.patch
+++ b/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-coupl=
e-of-places-to-avo.patch
@@ -1,4 +1,4 @@
-From 7f40f8321fb999e9b34d948724517d3fb0d26820 Mon Sep 17 00:00:00 2001
+From 2a1336d2e2ba08747acd7368264fc5813a37b049 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 28 Oct 2021 11:33:40 +0100
 Subject: [PATCH] Pass CXXFLAGS_FOR_BUILD in a couple of places to avoid th=
ese
@@ -23,10 +23,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 4 insertions(+)
=20
 diff --git a/Makefile.in b/Makefile.in
-index 593495e1650..1d9c83cc566 100644
+index 06a9398e172..4b0069b257c 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -176,6 +176,7 @@ BUILD_EXPORTS =3D \
+@@ -178,6 +178,7 @@ BUILD_EXPORTS =3D \
  # built for the build system to override those in BASE_FLAGS_TO_PASS.
  EXTRA_BUILD_FLAGS =3D \
  	CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
@@ -34,7 +34,7 @@ index 593495e1650..1d9c83cc566 100644
  	LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
=20=20
  # This is the list of directories to built for the host system.
-@@ -207,6 +208,7 @@ HOST_EXPORTS =3D \
+@@ -210,6 +211,7 @@ HOST_EXPORTS =3D \
  	CPP_FOR_BUILD=3D"$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
  	CPPFLAGS_FOR_BUILD=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUILD;=
 \
  	CXX_FOR_BUILD=3D"$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
@@ -43,10 +43,10 @@ index 593495e1650..1d9c83cc566 100644
  	DSYMUTIL=3D"$(DSYMUTIL)"; export DSYMUTIL; \
  	LD=3D"$(LD)"; export LD; \
 diff --git a/Makefile.tpl b/Makefile.tpl
-index ef58fac2b9a..bab04f335c2 100644
+index dfbd74b68f8..419b332953b 100644
 --- a/Makefile.tpl
 +++ b/Makefile.tpl
-@@ -179,6 +179,7 @@ BUILD_EXPORTS =3D \
+@@ -181,6 +181,7 @@ BUILD_EXPORTS =3D \
  # built for the build system to override those in BASE_FLAGS_TO_PASS.
  EXTRA_BUILD_FLAGS =3D \
  	CFLAGS=3D"$(CFLAGS_FOR_BUILD)" \
@@ -54,7 +54,7 @@ index ef58fac2b9a..bab04f335c2 100644
  	LDFLAGS=3D"$(LDFLAGS_FOR_BUILD)"
=20=20
  # This is the list of directories to built for the host system.
-@@ -210,6 +211,7 @@ HOST_EXPORTS =3D \
+@@ -213,6 +214,7 @@ HOST_EXPORTS =3D \
  	CPP_FOR_BUILD=3D"$(CPP_FOR_BUILD)"; export CPP_FOR_BUILD; \
  	CPPFLAGS_FOR_BUILD=3D"$(CPPFLAGS_FOR_BUILD)"; export CPPFLAGS_FOR_BUILD;=
 \
  	CXX_FOR_BUILD=3D"$(CXX_FOR_BUILD)"; export CXX_FOR_BUILD; \
diff --git a/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-ins=
tead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc/0005-Use-the-=
defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
index 8a3f0ffa6a..2eba38e375 100644
--- a/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of=
-S-and-t-oe-in-B.patch
+++ b/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of=
-S-and-t-oe-in-B.patch
@@ -1,4 +1,4 @@
-From 5455fc1de74897a27c1199dc5611ec02243e24af Mon Sep 17 00:00:00 2001
+From 6cce395992a1b573e6795fdad2f9086db921e924 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:17:25 +0400
 Subject: [PATCH] Use the defaults.h in ${B} instead of ${S}, and t-oe in $=
{B}
@@ -7,16 +7,16 @@ Use the defaults.h in ${B} instead of ${S}, and t-oe in $=
{B}, so that
 the source can be shared between gcc-cross-initial,
 gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk build.
=20
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Inappropriate [embedded specific]
-
 While compiling gcc-crosssdk-initial-x86_64 on some host, there is
 occasionally failure that test the existance of default.h doesn't
 work, the reason is tm_include_list=3D'** defaults.h' rather than
 tm_include_list=3D'** ./defaults.h'
=20
 So we add the test condition for this situation.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  gcc/Makefile.in  | 2 +-
@@ -26,10 +26,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  4 files changed, 7 insertions(+), 7 deletions(-)
=20
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 31ff95500c9..a8277254696 100644
+index ad9a5d94cd0..fe636af3f63 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -553,7 +553,7 @@ TARGET_SYSTEM_ROOT =3D @TARGET_SYSTEM_ROOT@
+@@ -561,7 +561,7 @@ TARGET_SYSTEM_ROOT =3D @TARGET_SYSTEM_ROOT@
  TARGET_SYSTEM_ROOT_DEFINE =3D @TARGET_SYSTEM_ROOT_DEFINE@
=20=20
  xmake_file=3D@xmake_file@
@@ -39,10 +39,10 @@ index 31ff95500c9..a8277254696 100644
  TM_MULTILIB_CONFIG=3D@TM_MULTILIB_CONFIG@
  TM_MULTILIB_EXCEPTIONS_CONFIG=3D@TM_MULTILIB_EXCEPTIONS_CONFIG@
 diff --git a/gcc/configure b/gcc/configure
-index dc2d59701ad..3fc0e2f5813 100755
+index 3508be7b439..cf773a8b854 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -13381,8 +13381,8 @@ for f in $tm_file; do
+@@ -13507,8 +13507,8 @@ for f in $tm_file; do
         tm_include_list=3D"${tm_include_list} $f"
         ;;
      defaults.h )
@@ -54,10 +54,10 @@ index dc2d59701ad..3fc0e2f5813 100755
      * )
         tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 36ce78924de..46de496b256 100644
+index 6cd01a8966b..22591478b72 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -2332,8 +2332,8 @@ for f in $tm_file; do
+@@ -2357,8 +2357,8 @@ for f in $tm_file; do
         tm_include_list=3D"${tm_include_list} $f"
         ;;
      defaults.h )
@@ -69,7 +69,7 @@ index 36ce78924de..46de496b256 100644
      * )
         tm_file_list=3D"${tm_file_list} \$(srcdir)/config/$f"
 diff --git a/gcc/mkconfig.sh b/gcc/mkconfig.sh
-index 91cc43f69ff..8de33713cd8 100644
+index 054ede89647..3b2c2b9df37 100644
 --- a/gcc/mkconfig.sh
 +++ b/gcc/mkconfig.sh
 @@ -77,7 +77,7 @@ if [ -n "$HEADERS" ]; then
diff --git a/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch b/m=
eta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch
index 9af82abaae..7130856645 100644
--- a/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch
+++ b/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch
@@ -1,4 +1,4 @@
-From abc3b82ab24169277f2090e9df1ceac3573142be Mon Sep 17 00:00:00 2001
+From 223ff12852a8c8974f6e542ee3a8b276639d2452 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:22:00 +0400
 Subject: [PATCH] cpp: honor sysroot.
@@ -17,16 +17,16 @@ The fix below adds %I to the cpp-output spec macro so t=
he default substitutions
=20
 RP 2012/04/13
=20
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  gcc/cp/lang-specs.h | 2 +-
  gcc/gcc.cc          | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/gcc/cp/lang-specs.h b/gcc/cp/lang-specs.h
-index f35c9fab76b..19ddc98ce7f 100644
+index c591d155cc1..61927869fe1 100644
 --- a/gcc/cp/lang-specs.h
 +++ b/gcc/cp/lang-specs.h
 @@ -116,7 +116,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -39,11 +39,11 @@ index f35c9fab76b..19ddc98ce7f 100644
        "    %{fmodule-only:%{!S:-o %g.s%V}}"
        "    %{!fmodule-only:%{!fmodule-header*:%(invoke_as)}}}"
 diff --git a/gcc/gcc.cc b/gcc/gcc.cc
-index ce161d3c853..aa4cf92fb78 100644
+index 5feae021545..8af0c814c33 100644
 --- a/gcc/gcc.cc
 +++ b/gcc/gcc.cc
-@@ -1476,7 +1476,7 @@ static const struct compiler default_compilers[] =3D
- 					   %W{o*:--output-pch=3D%*}}%V}}}}}}}", 0, 0, 0},
+@@ -1468,7 +1468,7 @@ static const struct compiler default_compilers[] =3D
+ 					   %W{o*:--output-pch %*}}%V}}}}}}}", 0, 0, 0},
    {".i", "@cpp-output", 0, 0, 0},
    {"@cpp-output",
 -   "%{!M:%{!MM:%{!E:cc1 -fpreprocessed %i %(cc1_options) %{!fsyntax-only:=
%(invoke_as)}}}}", 0, 0, 0},
diff --git a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER=
-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-Define=
-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index b59eed57e9..a42a044142 100644
--- a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UC=
LIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UC=
LIBC_DYNAMIC_LINKE.patch
@@ -1,4 +1,4 @@
-From 4de00af67b57b5440bdf61ab364ad959ad0aeee7 Mon Sep 17 00:00:00 2001
+From ba2e308f7993099708ef3d8cbf2db5f134f08941 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
 Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
@@ -12,8 +12,6 @@ SH, sparc, alpha for possible future support (if any)
=20
 Removes the do_headerfix task in metadata
=20
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 Upstream-Status: Inappropriate [OE configuration]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
@@ -38,7 +36,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  18 files changed, 53 insertions(+), 58 deletions(-)
=20
 diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch=
64-linux.h
-index 5e4553d79f5..877e8841eb2 100644
+index 4277f03da2a..e4c92c03291 100644
 --- a/gcc/config/aarch64/aarch64-linux.h
 +++ b/gcc/config/aarch64/aarch64-linux.h
 @@ -21,10 +21,10 @@
@@ -55,7 +53,7 @@ index 5e4553d79f5..877e8841eb2 100644
  #undef  ASAN_CC1_SPEC
  #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
 diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
-index 17f16a55910..0a7be38fa63 100644
+index 03f783f2ad1..4fa02668aa7 100644
 --- a/gcc/config/alpha/linux-elf.h
 +++ b/gcc/config/alpha/linux-elf.h
 @@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
@@ -70,10 +68,10 @@ index 17f16a55910..0a7be38fa63 100644
  #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
  #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC
 diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
-index 50cc0bc6d08..17c18b27145 100644
+index a119875599d..dce7f59eeea 100644
 --- a/gcc/config/arm/linux-eabi.h
 +++ b/gcc/config/arm/linux-eabi.h
-@@ -65,8 +65,8 @@
+@@ -62,8 +62,8 @@
     GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
=20=20
  #undef  GLIBC_DYNAMIC_LINKER
@@ -84,7 +82,7 @@ index 50cc0bc6d08..17c18b27145 100644
  #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
=20=20
  #define GLIBC_DYNAMIC_LINKER \
-@@ -89,7 +89,7 @@
+@@ -86,7 +86,7 @@
  #define MUSL_DYNAMIC_LINKER_E "%{mbig-endian:eb}"
  #endif
  #define MUSL_DYNAMIC_LINKER \
@@ -94,7 +92,7 @@ index 50cc0bc6d08..17c18b27145 100644
  /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
     use the GNU/Linux version, not the generic BPABI version.  */
 diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
-index df3da67c4f0..37456e9d5a4 100644
+index 7b7b7cbbe14..98ef2267117 100644
 --- a/gcc/config/arm/linux-elf.h
 +++ b/gcc/config/arm/linux-elf.h
 @@ -60,7 +60,7 @@
@@ -107,7 +105,7 @@ index df3da67c4f0..37456e9d5a4 100644
  #define LINUX_TARGET_LINK_SPEC  "%{h*} \
     %{static:-Bstatic} \
 diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
-index 5d99ee56d5b..a76022c9ccc 100644
+index bbb7cc7115e..7d9272040ee 100644
 --- a/gcc/config/i386/linux.h
 +++ b/gcc/config/i386/linux.h
 @@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -121,7 +119,7 @@ index 5d99ee56d5b..a76022c9ccc 100644
 -#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
 +#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-i386.so.1"
 diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
-index 8681e36f10d..ddce49b6b60 100644
+index 2bd9f48e271..dbbe7ca5440 100644
 --- a/gcc/config/i386/linux64.h
 +++ b/gcc/config/i386/linux64.h
 @@ -27,13 +27,13 @@ see the files COPYING3 and COPYING.RUNTIME respectivel=
y.  If not, see
@@ -145,10 +143,10 @@ index 8681e36f10d..ddce49b6b60 100644
 -#define MUSL_DYNAMIC_LINKERX32 "/lib/ld-musl-x32.so.1"
 +#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-musl-x32.so.1"
 diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index 74f70793d90..4ce173384ef 100644
+index e3aca79cccc..6491c6b84f5 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
-@@ -99,10 +99,10 @@ see the files COPYING3 and COPYING.RUNTIME respectivel=
y.  If not, see
+@@ -86,10 +86,10 @@ see the files COPYING3 and COPYING.RUNTIME respectivel=
y.  If not, see
     GLIBC_DYNAMIC_LINKER must be defined for each target using them, or
     GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
     supporting both 32-bit and 64-bit compilation.  */
@@ -164,7 +162,7 @@ index 74f70793d90..4ce173384ef 100644
  #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
  #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
 diff --git a/gcc/config/loongarch/gnu-user.h b/gcc/config/loongarch/gnu-us=
er.h
-index 664dc9206ad..082bd7cfc6f 100644
+index aecaa02a199..62f88f7f9a2 100644
 --- a/gcc/config/loongarch/gnu-user.h
 +++ b/gcc/config/loongarch/gnu-user.h
 @@ -31,11 +31,11 @@ along with GCC; see the file COPYING3.  If not see
@@ -182,7 +180,7 @@ index 664dc9206ad..082bd7cfc6f 100644
  #undef GNU_USER_TARGET_LINK_SPEC
  #define GNU_USER_TARGET_LINK_SPEC \
 diff --git a/gcc/config/microblaze/linux.h b/gcc/config/microblaze/linux.h
-index 5b1a365eda4..2e63df1ae9c 100644
+index e2e2c421c52..6f26480e3b5 100644
 --- a/gcc/config/microblaze/linux.h
 +++ b/gcc/config/microblaze/linux.h
 @@ -28,7 +28,7 @@
@@ -204,7 +202,7 @@ index 5b1a365eda4..2e63df1ae9c 100644
  #undef  SUBTARGET_EXTRA_SPECS
  #define SUBTARGET_EXTRA_SPECS \
 diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
-index 230b7789bb8..d96d134bfcf 100644
+index 5add34ea134..34692b433b8 100644
 --- a/gcc/config/mips/linux.h
 +++ b/gcc/config/mips/linux.h
 @@ -22,29 +22,29 @@ along with GCC; see the file COPYING3.  If not see
@@ -247,22 +245,24 @@ index 230b7789bb8..d96d134bfcf 100644
  #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
  #define GNU_USER_DYNAMIC_LINKERN32 \
 diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
-index f5dd813acad..7a13e1c9799 100644
+index 2ce097ebbce..1d45d7b4962 100644
 --- a/gcc/config/nios2/linux.h
 +++ b/gcc/config/nios2/linux.h
-@@ -29,8 +29,8 @@
+@@ -29,10 +29,10 @@
  #undef CPP_SPEC
  #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
=20=20
 -#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
--#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
 +#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux-nios2.so.1"
+=20
+ #undef MUSL_DYNAMIC_LINKER
+-#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
 +#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-nios2.so.1"
=20=20
  #undef LINK_SPEC
  #define LINK_SPEC LINK_SPEC_ENDIAN \
 diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
-index 38803723ba9..d5ef8a96a19 100644
+index b9557a75dc7..e10ca1f97e7 100644
 --- a/gcc/config/riscv/linux.h
 +++ b/gcc/config/riscv/linux.h
 @@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
@@ -284,7 +284,7 @@ index 38803723ba9..d5ef8a96a19 100644
  /* Because RISC-V only has word-sized atomics, it requries libatomic where
     others do not.  So link libatomic by default, as needed.  */
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index b2a7afabc73..364c1a5b155 100644
+index 9e457033d11..2ddab7c99c1 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
 @@ -339,24 +339,19 @@ extern int dot_symbols;
@@ -318,10 +318,10 @@ index b2a7afabc73..364c1a5b155 100644
  #undef  DEFAULT_ASM_ENDIAN
  #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
 diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
-index 7e2519de5d4..a73954d9de5 100644
+index ae932fc22f0..26db003cb3a 100644
 --- a/gcc/config/rs6000/sysv4.h
 +++ b/gcc/config/rs6000/sysv4.h
-@@ -779,10 +779,10 @@ GNU_USER_TARGET_CC1_SPEC
+@@ -771,10 +771,10 @@ GNU_USER_TARGET_CC1_SPEC
=20=20
  #define MUSL_DYNAMIC_LINKER_E ENDIAN_SELECT("","le","")
=20=20
@@ -335,7 +335,7 @@ index 7e2519de5d4..a73954d9de5 100644
  #ifndef GNU_USER_DYNAMIC_LINKER
  #define GNU_USER_DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER
 diff --git a/gcc/config/s390/linux.h b/gcc/config/s390/linux.h
-index d7b7e7a7b02..0139b4d06ca 100644
+index 02aa1edaff8..fab268d61f4 100644
 --- a/gcc/config/s390/linux.h
 +++ b/gcc/config/s390/linux.h
 @@ -72,13 +72,13 @@ along with GCC; see the file COPYING3.  If not see
@@ -357,7 +357,7 @@ index d7b7e7a7b02..0139b4d06ca 100644
  #undef  LINK_SPEC
  #define LINK_SPEC \
 diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
-index d96d077c99e..7d27f9893ee 100644
+index 29f5902b98b..83d1e53e6e2 100644
 --- a/gcc/config/sh/linux.h
 +++ b/gcc/config/sh/linux.h
 @@ -61,10 +61,10 @@ along with GCC; see the file COPYING3.  If not see
@@ -374,7 +374,7 @@ index d96d077c99e..7d27f9893ee 100644
  #undef SUBTARGET_LINK_EMUL_SUFFIX
  #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
 diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
-index 6a809e9092d..60603765ad6 100644
+index 0e33b3cac2c..84f29adbb35 100644
 --- a/gcc/config/sparc/linux.h
 +++ b/gcc/config/sparc/linux.h
 @@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int argc, cons=
t char **argv);
@@ -387,7 +387,7 @@ index 6a809e9092d..60603765ad6 100644
  #undef  LINK_SPEC
  #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
 diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
-index d08a2ef96fe..e6955da0a5b 100644
+index f1cc0a19e49..94bc2032803 100644
 --- a/gcc/config/sparc/linux64.h
 +++ b/gcc/config/sparc/linux64.h
 @@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.  If not see
diff --git a/meta/recipes-devtools/gcc/gcc/0008-libtool.patch b/meta/recipe=
s-devtools/gcc/gcc/0008-libtool.patch
index 9e1d6dd0a3..72248e64b1 100644
--- a/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
+++ b/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
@@ -1,4 +1,4 @@
-From 5117519c1897a49b09fe7fff213b9c2ea15d37f5 Mon Sep 17 00:00:00 2001
+From 5ce9e36a87974ce5c1c1adb6e4390350233d8770 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:29:11 +0400
 Subject: [PATCH] libtool
@@ -15,9 +15,8 @@ to filter the zero case.
=20
 RP 2012/8/24
=20
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-pat=
ches/2023-04/msg00000.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  ltmain.sh | 4 ++++
  1 file changed, 4 insertions(+)
diff --git a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-=
linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4=
-pass-fix-v4bx-to-linker-to-support-EABI.patch
index d2d6c8f289..871a634d14 100644
--- a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-=
to-support-EABI.patch
+++ b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-=
to-support-EABI.patch
@@ -1,4 +1,4 @@
-From 32129f9682d0d27fc67af10f077ad2768935cbe6 Mon Sep 17 00:00:00 2001
+From 37c7471aa476dfc591a7123e39e38ef8b049f5c0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:30:32 +0400
 Subject: [PATCH] gcc: armv4: pass fix-v4bx to linker to support EABI.
@@ -11,18 +11,17 @@ for eabi defaulting toolchains.
=20
 We might want to send it upstream.
=20
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2023=
-April/615319.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  gcc/config/arm/linux-eabi.h | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)
=20
 diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
-index 17c18b27145..8eacb099317 100644
+index dce7f59eeea..27402c629c6 100644
 --- a/gcc/config/arm/linux-eabi.h
 +++ b/gcc/config/arm/linux-eabi.h
-@@ -91,10 +91,14 @@
+@@ -88,10 +88,14 @@
  #define MUSL_DYNAMIC_LINKER \
    SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=3Dhard=
:hf}%{mfdpic:-fdpic}.so.1"
=20=20
diff --git a/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-fil=
es-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc/0010-Use-th=
e-multilib-config-files-from-B-instead-of-usin.patch
index 45edc62eb5..a88abc2fad 100644
--- a/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from=
-B-instead-of-usin.patch
+++ b/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from=
-B-instead-of-usin.patch
@@ -1,4 +1,4 @@
-From bf85b8bbcb4b77725d4c22c1bb25a29f6ff21038 Mon Sep 17 00:00:00 2001
+From 2be15956b4051680aa8da9df97ef032ac8616fb1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:33:04 +0400
 Subject: [PATCH] Use the multilib config files from ${B} instead of using =
the
@@ -18,10 +18,10 @@ Upstream-Status: Inappropriate [configuration]
  2 files changed, 36 insertions(+), 8 deletions(-)
=20
 diff --git a/gcc/configure b/gcc/configure
-index 3fc0e2f5813..2f0f0e057a9 100755
+index cf773a8b854..448a1ec093e 100755
 --- a/gcc/configure
 +++ b/gcc/configure
-@@ -13361,10 +13361,20 @@ done
+@@ -13487,10 +13487,20 @@ done
  tmake_file_=3D
  for f in ${tmake_file}
  do
@@ -46,7 +46,7 @@ index 3fc0e2f5813..2f0f0e057a9 100755
  done
  tmake_file=3D"${tmake_file_}${omp_device_property_tmake_file}"
=20=20
-@@ -13375,6 +13385,10 @@ tm_file_list=3D"options.h"
+@@ -13501,6 +13511,10 @@ tm_file_list=3D"options.h"
  tm_include_list=3D"options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
@@ -58,10 +58,10 @@ index 3fc0e2f5813..2f0f0e057a9 100755
         f=3D`echo $f | sed 's/^..//'`
         tm_file_list=3D"${tm_file_list} $f"
 diff --git a/gcc/configure.ac b/gcc/configure.ac
-index 46de496b256..6155b83a732 100644
+index 22591478b72..b6e7f5149a7 100644
 --- a/gcc/configure.ac
 +++ b/gcc/configure.ac
-@@ -2312,10 +2312,20 @@ done
+@@ -2337,10 +2337,20 @@ done
  tmake_file_=3D
  for f in ${tmake_file}
  do
@@ -86,7 +86,7 @@ index 46de496b256..6155b83a732 100644
  done
  tmake_file=3D"${tmake_file_}${omp_device_property_tmake_file}"
=20=20
-@@ -2326,6 +2336,10 @@ tm_file_list=3D"options.h"
+@@ -2351,6 +2361,10 @@ tm_file_list=3D"options.h"
  tm_include_list=3D"options.h insn-constants.h"
  for f in $tm_file; do
    case $f in
diff --git a/meta/recipes-devtools/gcc/gcc/0011-aarch64-Fix-include-paths-w=
hen-S-B.patch b/meta/recipes-devtools/gcc/gcc/0011-aarch64-Fix-include-path=
s-when-S-B.patch
new file mode 100644
index 0000000000..f52e21edc2
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0011-aarch64-Fix-include-paths-when-S-B=
.patch
@@ -0,0 +1,55 @@
+From 710d1325474e708e6b34eebe09f3f130420af293 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 31 Jan 2023 22:03:38 -0800
+Subject: [PATCH] aarch64: Fix include paths when S !=3D B
+
+aarch64.h gets copied into build directory when built out of tree, in
+this case build uses this file but does not find the includes inside it
+since they are not found in any of include paths specified in compiler
+cmdline.
+
+Fixes build errors like
+
+% g++ -c   -isystem/mnt/b/yoe/master/build/tmp/work/x86_64-linux/gcc-cross=
-aarch64/13.0.1-r0/recipe-sysroot-native/usr/include -O2 -pipe   -DIN_GCC  =
-DCROSS_DIRECTORY_STRUCTURE   -fno-exceptions -fno-rtti -fasynchronous-unwi=
nd-tables -W -Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wmissing-for=
mat-attribute -Wconditionally-supported -Woverloaded-virtual -pedantic -Wno=
-long-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H  =
-DGENERATOR_FILE -I. -Ibuild -I../../../../../../../work-shared/gcc-13.0.1-=
r0/gcc-b2ec2504af77b35e748067eeb846821d12a6b6b4/gcc -I../../../../../../../=
work-shared/gcc-13.0.1-r0/gcc-b2ec2504af77b35e748067eeb846821d12a6b6b4/gcc/=
build -I../../../../../../../work-shared/gcc-13.0.1-r0/gcc-b2ec2504af77b35e=
748067eeb846821d12a6b6b4/gcc/../include  -I../../../../../../../work-shared=
/gcc-13.0.1-r0/gcc-b2ec2504af77b35e748067eeb846821d12a6b6b4/gcc/../libcpp/i=
nclude -o build/gencheck.o ../../../../../../../work-shared/gcc-13.0.1-r0/g=
cc-b2ec2504af77b35e748067eeb846821d12a6b6b4/gcc/gencheck.cc
+In file included from ./tm.h:34,
+                 from ../../../../../../../work-shared/gcc-13.0.1-r0/gcc-b=
2ec2504af77b35e748067eeb846821d12a6b6b4/gcc/gencheck.cc:23:
+./config/aarch64/aarch64.h:164:10: fatal error: aarch64-option-extensions.=
def: No such file or directory
+  164 | #include "aarch64-option-extensions.def"
+      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+compilation terminated.
+
+See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D105144
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gcc/config/aarch64/aarch64.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
+index 155cace6afe..07d68958908 100644
+--- a/gcc/config/aarch64/aarch64.h
++++ b/gcc/config/aarch64/aarch64.h
+@@ -161,8 +161,8 @@
+ enum class aarch64_feature : unsigned char {
+ #define AARCH64_OPT_EXTENSION(A, IDENT, C, D, E, F) IDENT,
+ #define AARCH64_ARCH(A, B, IDENT, D, E) IDENT,
+-#include "aarch64-option-extensions.def"
+-#include "aarch64-arches.def"
++#include "config/aarch64/aarch64-option-extensions.def"
++#include "config/aarch64/aarch64-arches.def"
+ };
+=20
+ /* Define unique flags for each of the above.  */
+@@ -171,8 +171,8 @@ enum class aarch64_feature : unsigned char {
+     =3D aarch64_feature_flags (1) << int (aarch64_feature::IDENT);
+ #define AARCH64_OPT_EXTENSION(A, IDENT, C, D, E, F) HANDLE (IDENT)
+ #define AARCH64_ARCH(A, B, IDENT, D, E) HANDLE (IDENT)
+-#include "aarch64-option-extensions.def"
+-#include "aarch64-arches.def"
++#include "config/aarch64/aarch64-option-extensions.def"
++#include "config/aarch64/aarch64-arches.def"
+ #undef HANDLE
+=20
+ #endif
diff --git a/meta/recipes-devtools/gcc/gcc/0011-Avoid-using-libdir-from-.la=
-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc/0012-Avoid-=
using-libdir-from-.la-which-usually-points-to-.patch
similarity index 92%
rename from meta/recipes-devtools/gcc/gcc/0011-Avoid-using-libdir-from-.la-=
which-usually-points-to-.patch
rename to meta/recipes-devtools/gcc/gcc/0012-Avoid-using-libdir-from-.la-wh=
ich-usually-points-to-.patch
index 352c6eec29..b05be59c72 100644
--- a/meta/recipes-devtools/gcc/gcc/0011-Avoid-using-libdir-from-.la-which-=
usually-points-to-.patch
+++ b/meta/recipes-devtools/gcc/gcc/0012-Avoid-using-libdir-from-.la-which-=
usually-points-to-.patch
@@ -1,4 +1,4 @@
-From e5463727ff028cee5e452da38f5b4c44d52e412e Mon Sep 17 00:00:00 2001
+From e8e8a0ab572cfceb9758f99599c0db4c962e49c0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:39:38 +0000
 Subject: [PATCH] Avoid using libdir from .la which usually points to a host
diff --git a/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-c=
an-be-included.patch b/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc=
-headers-can-be-included.patch
index cee447b310..10788d9234 100644
--- a/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-i=
ncluded.patch
+++ b/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-i=
ncluded.patch
@@ -1,4 +1,4 @@
-From 612801d426e75ff997cfabda380dbe52c2cbc532 Mon Sep 17 00:00:00 2001
+From 93ad7cf3ff92771451c2994cab45e34a0c8574a0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:25:11 +0000
 Subject: [PATCH] Ensure target gcc headers can be included
@@ -25,10 +25,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 22 insertions(+)
=20
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index a8277254696..07fa63b6640 100644
+index fe636af3f63..065ce7e9a5b 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -632,6 +632,7 @@ libexecdir =3D @libexecdir@
+@@ -640,6 +640,7 @@ libexecdir =3D @libexecdir@
=20=20
  # Directory in which the compiler finds libraries etc.
  libsubdir =3D $(libdir)/gcc/$(real_target_noncanonical)/$(version)$(accel=
_dir_suffix)
@@ -36,7 +36,7 @@ index a8277254696..07fa63b6640 100644
  # Directory in which the compiler finds executables
  libexecsubdir =3D $(libexecdir)/gcc/$(real_target_noncanonical)/$(version=
)$(accel_dir_suffix)
  # Directory in which all plugin resources are installed
-@@ -3024,6 +3025,7 @@ CFLAGS-intl.o +=3D -DLOCALEDIR=3D\"$(localedir)\"
+@@ -3059,6 +3060,7 @@ CFLAGS-intl.o +=3D -DLOCALEDIR=3D\"$(localedir)\"
=20=20
  PREPROCESSOR_DEFINES =3D \
    -DGCC_INCLUDE_DIR=3D\"$(libsubdir)/include\" \
@@ -45,10 +45,10 @@ index a8277254696..07fa63b6640 100644
    -DGPLUSPLUS_INCLUDE_DIR=3D\"$(gcc_gxx_include_dir)\" \
    -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=3D$(gcc_gxx_include_dir_add_sysroot=
) \
 diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index 4ce173384ef..8a3cd4f2d34 100644
+index 6491c6b84f5..57496ff1f2f 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
-@@ -170,6 +170,13 @@ see the files COPYING3 and COPYING.RUNTIME respective=
ly.  If not, see
+@@ -157,6 +157,13 @@ see the files COPYING3 and COPYING.RUNTIME respective=
ly.  If not, see
  #define INCLUDE_DEFAULTS_MUSL_TOOL
  #endif
=20=20
@@ -62,7 +62,7 @@ index 4ce173384ef..8a3cd4f2d34 100644
  #ifdef NATIVE_SYSTEM_HEADER_DIR
  #define INCLUDE_DEFAULTS_MUSL_NATIVE			\
      { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },	\
-@@ -196,6 +203,7 @@ see the files COPYING3 and COPYING.RUNTIME respectivel=
y.  If not, see
+@@ -183,6 +190,7 @@ see the files COPYING3 and COPYING.RUNTIME respectivel=
y.  If not, see
      INCLUDE_DEFAULTS_MUSL_PREFIX			\
      INCLUDE_DEFAULTS_MUSL_CROSS				\
      INCLUDE_DEFAULTS_MUSL_TOOL				\
@@ -71,10 +71,10 @@ index 4ce173384ef..8a3cd4f2d34 100644
      { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
      { 0, 0, 0, 0, 0, 0 }				\
 diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
-index a73954d9de5..e5dd6538358 100644
+index 26db003cb3a..3a443abcf6b 100644
 --- a/gcc/config/rs6000/sysv4.h
 +++ b/gcc/config/rs6000/sysv4.h
-@@ -994,6 +994,13 @@ ncrtn.o%s"
+@@ -986,6 +986,13 @@ ncrtn.o%s"
  #define INCLUDE_DEFAULTS_MUSL_TOOL
  #endif
=20=20
@@ -88,7 +88,7 @@ index a73954d9de5..e5dd6538358 100644
  #ifdef NATIVE_SYSTEM_HEADER_DIR
  #define INCLUDE_DEFAULTS_MUSL_NATIVE			\
      { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },	\
-@@ -1020,6 +1027,7 @@ ncrtn.o%s"
+@@ -1012,6 +1019,7 @@ ncrtn.o%s"
      INCLUDE_DEFAULTS_MUSL_PREFIX			\
      INCLUDE_DEFAULTS_MUSL_CROSS				\
      INCLUDE_DEFAULTS_MUSL_TOOL				\
@@ -97,7 +97,7 @@ index a73954d9de5..e5dd6538358 100644
      { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
      { 0, 0, 0, 0, 0, 0 }				\
 diff --git a/gcc/cppdefault.cc b/gcc/cppdefault.cc
-index 7888300f277..52cf14e92f8 100644
+index 141bb4d25f6..734590a7059 100644
 --- a/gcc/cppdefault.cc
 +++ b/gcc/cppdefault.cc
 @@ -64,6 +64,10 @@ const struct default_include cpp_include_defaults[]
diff --git a/meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory=
-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc/0014-Don-t-=
search-host-directory-during-relink-if-inst_pr.patch
index 94308b2aca..5de0e3e982 100644
--- a/meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory-during=
-relink-if-inst_pr.patch
+++ b/meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory-during=
-relink-if-inst_pr.patch
@@ -1,4 +1,4 @@
-From 9ae49e7b88c208ab79ec9c2fc4a2fa8a3f1e85bb Mon Sep 17 00:00:00 2001
+From e0775b77b8d10066e27ab89d15441b39024a29fd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Mar 2015 08:21:19 +0000
 Subject: [PATCH] Don't search host directory during "relink" if $inst_pref=
ix
diff --git a/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install=
-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc=
1-s-install-path-and-rpath.patch
index ce9635ce4d..f1eee4a833 100644
--- a/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install-path-a=
nd-rpath.patch
+++ b/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install-path-a=
nd-rpath.patch
@@ -1,4 +1,4 @@
-From bf918db7117f41d3c04162095641165ca241707d Mon Sep 17 00:00:00 2001
+From 7776c630e2560bacff7d1e9b04e7916ed4c05d00 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Sun, 5 Jul 2015 20:25:18 -0700
 Subject: [PATCH] libcc1: fix libcc1's install path and rpath
@@ -20,7 +20,7 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  2 files changed, 4 insertions(+), 4 deletions(-)
=20
 diff --git a/libcc1/Makefile.am b/libcc1/Makefile.am
-index 6e3a34ff7e2..3f3f6391aba 100644
+index 921a33fe236..938e6f964cd 100644
 --- a/libcc1/Makefile.am
 +++ b/libcc1/Makefile.am
 @@ -40,8 +40,8 @@ libiberty =3D $(if $(wildcard $(libiberty_noasan)),$(Wc)=
$(libiberty_noasan), \
diff --git a/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-=
nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-sup=
port-for-nativesdk-gcc.patch
index 3b54719536..e05fd4e6a2 100644
--- a/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-natives=
dk-gcc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-natives=
dk-gcc.patch
@@ -1,4 +1,4 @@
-From 4fbbd40d7db89cdbeaf93df1e1da692b1f80a5bc Mon Sep 17 00:00:00 2001
+From 4f9c952ad5fa68260d6a40570b0fdb7359c85057 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:39:54 +0000
 Subject: [PATCH] handle sysroot support for nativesdk-gcc
@@ -38,15 +38,15 @@ Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.o=
rg>
  gcc/c-family/c-opts.cc    |  4 +--
  gcc/config/linux.h        | 24 +++++++--------
  gcc/config/rs6000/sysv4.h | 24 +++++++--------
- gcc/cppdefault.cc         | 63 ++++++++++++++++++++++++---------------
- gcc/cppdefault.h          | 13 ++++----
- gcc/gcc.cc                | 20 +++++++++----
+ gcc/cppdefault.cc         | 65 ++++++++++++++++++++++++---------------
+ gcc/cppdefault.h          | 13 +++-----
+ gcc/gcc.cc                | 20 ++++++++----
  gcc/incpath.cc            | 12 ++++----
  gcc/prefix.cc             |  6 ++--
- 8 files changed, 94 insertions(+), 72 deletions(-)
+ 8 files changed, 95 insertions(+), 73 deletions(-)
=20
 diff --git a/gcc/c-family/c-opts.cc b/gcc/c-family/c-opts.cc
-index a341a061758..83b0bef4dbb 100644
+index c68a2a27469..77e9b5eceaa 100644
 --- a/gcc/c-family/c-opts.cc
 +++ b/gcc/c-family/c-opts.cc
 @@ -1458,8 +1458,8 @@ add_prefixed_path (const char *suffix, incpath_kind =
chain)
@@ -61,10 +61,10 @@ index a341a061758..83b0bef4dbb 100644
    path =3D (char *) xmalloc (prefix_len + suffix_len + 1);
    memcpy (path, prefix, prefix_len);
 diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index 8a3cd4f2d34..58143dff731 100644
+index 57496ff1f2f..c921cf6ef63 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
-@@ -134,53 +134,53 @@ see the files COPYING3 and COPYING.RUNTIME respectiv=
ely.  If not, see
+@@ -121,53 +121,53 @@ see the files COPYING3 and COPYING.RUNTIME respectiv=
ely.  If not, see
   * Unfortunately, this is mostly duplicated from cppdefault.cc */
  #if DEFAULT_LIBC =3D=3D LIBC_MUSL
  #define INCLUDE_DEFAULTS_MUSL_GPP			\
@@ -129,7 +129,7 @@ index 8a3cd4f2d34..58143dff731 100644
  #else
  #define INCLUDE_DEFAULTS_MUSL_NATIVE
  #endif
-@@ -205,7 +205,7 @@ see the files COPYING3 and COPYING.RUNTIME respectivel=
y.  If not, see
+@@ -192,7 +192,7 @@ see the files COPYING3 and COPYING.RUNTIME respectivel=
y.  If not, see
      INCLUDE_DEFAULTS_MUSL_TOOL				\
      INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET			\
      INCLUDE_DEFAULTS_MUSL_NATIVE			\
@@ -139,10 +139,10 @@ index 8a3cd4f2d34..58143dff731 100644
    }
  #endif
 diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
-index e5dd6538358..b496849b792 100644
+index 3a443abcf6b..ef83a5a432e 100644
 --- a/gcc/config/rs6000/sysv4.h
 +++ b/gcc/config/rs6000/sysv4.h
-@@ -958,53 +958,53 @@ ncrtn.o%s"
+@@ -950,53 +950,53 @@ ncrtn.o%s"
  /* Include order changes for musl, same as in generic linux.h.  */
  #if DEFAULT_LIBC =3D=3D LIBC_MUSL
  #define INCLUDE_DEFAULTS_MUSL_GPP			\
@@ -207,7 +207,7 @@ index e5dd6538358..b496849b792 100644
  #else
  #define INCLUDE_DEFAULTS_MUSL_NATIVE
  #endif
-@@ -1029,7 +1029,7 @@ ncrtn.o%s"
+@@ -1021,7 +1021,7 @@ ncrtn.o%s"
      INCLUDE_DEFAULTS_MUSL_TOOL				\
      INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET			\
      INCLUDE_DEFAULTS_MUSL_NATIVE			\
@@ -217,7 +217,7 @@ index e5dd6538358..b496849b792 100644
    }
  #endif
 diff --git a/gcc/cppdefault.cc b/gcc/cppdefault.cc
-index 52cf14e92f8..d8977afc05e 100644
+index 734590a7059..b4a8fc29e4a 100644
 --- a/gcc/cppdefault.cc
 +++ b/gcc/cppdefault.cc
 @@ -35,6 +35,30 @@
@@ -272,7 +272,7 @@ index 52cf14e92f8..d8977afc05e 100644
        GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
  #endif
  #ifdef GPLUSPLUS_LIBCXX_INCLUDE_DIR
-@@ -62,23 +86,23 @@ const struct default_include cpp_include_defaults[]
+@@ -62,26 +86,26 @@ const struct default_include cpp_include_defaults[]
  #endif
  #ifdef GCC_INCLUDE_DIR
      /* This is the dir for gcc's private headers.  */
@@ -297,12 +297,16 @@ index 52cf14e92f8..d8977afc05e 100644
  #endif
  #ifdef FIXED_INCLUDE_DIR
      /* This is the dir for fixincludes.  */
+ #ifndef SYSROOT_HEADERS_SUFFIX_SPEC
+-    { FIXED_INCLUDE_DIR, "GCC", 0, 0, 0, 2 },
++    { FIXED_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 2 },
+ #endif
 -    { FIXED_INCLUDE_DIR, "GCC", 0, 0, 0,
 +    { FIXED_INCLUDE_DIRVAR, "GCC", 0, 0, 0,
        /* A multilib suffix needs adding if different multilibs use
  	 different headers.  */
  #ifdef SYSROOT_HEADERS_SUFFIX_SPEC
-@@ -90,33 +114,24 @@ const struct default_include cpp_include_defaults[]
+@@ -93,33 +117,24 @@ const struct default_include cpp_include_defaults[]
  #endif
  #ifdef CROSS_INCLUDE_DIR
      /* One place the target system's headers might be.  */
@@ -343,7 +347,7 @@ index 52cf14e92f8..d8977afc05e 100644
  /* This value is set by cpp_relocated at runtime */
  const char *gcc_exec_prefix;
 diff --git a/gcc/cppdefault.h b/gcc/cppdefault.h
-index fb97c0b5814..6267150facc 100644
+index e26b424e99c..c9abb090dcd 100644
 --- a/gcc/cppdefault.h
 +++ b/gcc/cppdefault.h
 @@ -33,7 +33,8 @@
@@ -378,10 +382,10 @@ index fb97c0b5814..6267150facc 100644
     subdirectory of the actual installation.  */
  extern const char *gcc_exec_prefix;
 diff --git a/gcc/gcc.cc b/gcc/gcc.cc
-index aa4cf92fb78..5569a39a14a 100644
+index 8af0c814c33..605fe3b8c0d 100644
 --- a/gcc/gcc.cc
 +++ b/gcc/gcc.cc
-@@ -252,6 +252,8 @@ FILE *report_times_to_file =3D NULL;
+@@ -255,6 +255,8 @@ FILE *report_times_to_file =3D NULL;
  #endif
  static const char *target_system_root =3D DEFAULT_TARGET_SYSTEM_ROOT;
=20=20
@@ -390,7 +394,7 @@ index aa4cf92fb78..5569a39a14a 100644
  /* Nonzero means pass the updated target_system_root to the compiler.  */
=20=20
  static int target_system_root_changed;
-@@ -575,6 +577,7 @@ or with constant text in a single argument.
+@@ -578,6 +580,7 @@ or with constant text in a single argument.
   %G     process LIBGCC_SPEC as a spec.
   %R     Output the concatenation of target_system_root and
          target_sysroot_suffix.
@@ -398,7 +402,7 @@ index aa4cf92fb78..5569a39a14a 100644
   %S     process STARTFILE_SPEC as a spec.  A capital S is actually used h=
ere.
   %E     process ENDFILE_SPEC as a spec.  A capital E is actually used her=
e.
   %C     process CPP_SPEC as a spec.
-@@ -1627,10 +1630,10 @@ static const char *gcc_libexec_prefix;
+@@ -1619,10 +1622,10 @@ static const char *gcc_libexec_prefix;
     gcc_exec_prefix is set because, in that case, we know where the
     compiler has been installed, and use paths relative to that
     location instead.  */
@@ -413,7 +417,7 @@ index aa4cf92fb78..5569a39a14a 100644
=20=20
  /* For native compilers, these are well-known paths containing
     components that may be provided by the system.  For cross
-@@ -1638,9 +1641,9 @@ static const char *const standard_startfile_prefix =
=3D STANDARD_STARTFILE_PREFIX;
+@@ -1630,9 +1633,9 @@ static const char *const standard_startfile_prefix =
=3D STANDARD_STARTFILE_PREFIX;
  static const char *md_exec_prefix =3D MD_EXEC_PREFIX;
  static const char *md_startfile_prefix =3D MD_STARTFILE_PREFIX;
  static const char *md_startfile_prefix_1 =3D MD_STARTFILE_PREFIX_1;
@@ -425,7 +429,7 @@ index aa4cf92fb78..5569a39a14a 100644
    =3D STANDARD_STARTFILE_PREFIX_2;
=20=20
  /* A relative path to be used in finding the location of tools
-@@ -6676,6 +6679,11 @@ do_spec_1 (const char *spec, int inswitch, const ch=
ar *soft_matched_part)
+@@ -6652,6 +6655,11 @@ do_spec_1 (const char *spec, int inswitch, const ch=
ar *soft_matched_part)
  	      }
  	    break;
=20=20
@@ -438,7 +442,7 @@ index aa4cf92fb78..5569a39a14a 100644
  	    value =3D do_spec_1 (startfile_spec, 0, NULL);
  	    if (value !=3D 0)
 diff --git a/gcc/incpath.cc b/gcc/incpath.cc
-index c80f100f476..5ac03c08693 100644
+index 46c0d543205..d088dae7b04 100644
 --- a/gcc/incpath.cc
 +++ b/gcc/incpath.cc
 @@ -135,7 +135,7 @@ add_standard_paths (const char *sysroot, const char *i=
prefix,
@@ -485,10 +489,10 @@ index c80f100f476..5ac03c08693 100644
  	      str =3D update_path (ostr, p->component);
  	      free (ostr);
 diff --git a/gcc/prefix.cc b/gcc/prefix.cc
-index 096ed5afa3d..2526f0ecc39 100644
+index c2a37bde5ea..33944701ced 100644
 --- a/gcc/prefix.cc
 +++ b/gcc/prefix.cc
-@@ -72,7 +72,9 @@ License along with GCC; see the file COPYING3.  If not s=
ee
+@@ -73,7 +73,9 @@ License along with GCC; see the file COPYING3.  If not s=
ee
  #include "prefix.h"
  #include "common/common-target.h"
=20=20
@@ -499,7 +503,7 @@ index 096ed5afa3d..2526f0ecc39 100644
=20=20
  static const char *get_key_value (char *);
  static char *translate_name (char *);
-@@ -212,7 +214,7 @@ translate_name (char *name)
+@@ -213,7 +215,7 @@ translate_name (char *name)
  	prefix =3D getenv (key);
=20=20
        if (prefix =3D=3D 0)
diff --git a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-v=
ersion-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc/0017-Search=
-target-sysroot-gcc-version-specific-dirs-with.patch
index 6fca63a494..635a42e4f5 100644
--- a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-=
specific-dirs-with.patch
+++ b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-=
specific-dirs-with.patch
@@ -1,4 +1,4 @@
-From 33a1f07a4417247dc24819d4e583ca09f56d5a7b Mon Sep 17 00:00:00 2001
+From 0058f8a2233d9e96e39d09f4d994da3c96f9e030 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:41:45 +0000
 Subject: [PATCH] Search target sysroot gcc version specific dirs with
@@ -42,19 +42,20 @@ binaries can be found first. With this change the searc=
h path becomes:
 <sysroot>/lib32/
 <sysroot>/usr/lib32/
=20
-Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2023=
-April/615320.html]
 RP 2015/7/31
=20
+Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2023=
-April/615320.html]
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  gcc/gcc.cc | 29 ++++++++++++++++++++++++++++-
  1 file changed, 28 insertions(+), 1 deletion(-)
=20
 diff --git a/gcc/gcc.cc b/gcc/gcc.cc
-index 5569a39a14a..4598f6cd7c9 100644
+index 605fe3b8c0d..c3a1dab38c4 100644
 --- a/gcc/gcc.cc
 +++ b/gcc/gcc.cc
-@@ -2817,7 +2817,7 @@ for_each_path (const struct path_prefix *paths,
+@@ -2809,7 +2809,7 @@ for_each_path (const struct path_prefix *paths,
        if (path =3D=3D NULL)
  	{
  	  len =3D paths->max_len + extra_space + 1;
@@ -63,7 +64,7 @@ index 5569a39a14a..4598f6cd7c9 100644
  	  path =3D XNEWVEC (char, len);
  	}
=20=20
-@@ -2829,6 +2829,33 @@ for_each_path (const struct path_prefix *paths,
+@@ -2821,6 +2821,33 @@ for_each_path (const struct path_prefix *paths,
  	  /* Look first in MACHINE/VERSION subdirectory.  */
  	  if (!skip_multi_dir)
  	    {
diff --git a/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-c=
ommandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc/0018-Add-ss=
p_nonshared-to-link-commandline-for-musl-targe.patch
index b4b820b22c..06eb230509 100644
--- a/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandl=
ine-for-musl-targe.patch
+++ b/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandl=
ine-for-musl-targe.patch
@@ -1,4 +1,4 @@
-From d7dc2861840e88a4592817a398a054a886c3f3ee Mon Sep 17 00:00:00 2001
+From 0a194b74f0f171b46527ff447c27fbf32406333d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 27 Jun 2017 18:10:54 -0700
 Subject: [PATCH] Add ssp_nonshared to link commandline for musl targets
@@ -23,10 +23,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 27 insertions(+)
=20
 diff --git a/gcc/config/linux.h b/gcc/config/linux.h
-index 58143dff731..d2409ccac26 100644
+index c921cf6ef63..32e1bc1ae2d 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
-@@ -208,6 +208,13 @@ see the files COPYING3 and COPYING.RUNTIME respective=
ly.  If not, see
+@@ -195,6 +195,13 @@ see the files COPYING3 and COPYING.RUNTIME respective=
ly.  If not, see
      { GCC_INCLUDE_DIRVAR, "GCC", 0, 1, 0, 0 },		\
      { 0, 0, 0, 0, 0, 0 }				\
    }
@@ -41,7 +41,7 @@ index 58143dff731..d2409ccac26 100644
=20=20
  #if (DEFAULT_LIBC =3D=3D LIBC_UCLIBC) && defined (SINGLE_LIBC) /* uClinux=
 */
 diff --git a/gcc/config/rs6000/linux.h b/gcc/config/rs6000/linux.h
-index 8c9039ac1e5..259cd485973 100644
+index 5d21befe8e4..1248a68e4ca 100644
 --- a/gcc/config/rs6000/linux.h
 +++ b/gcc/config/rs6000/linux.h
 @@ -99,6 +99,16 @@
@@ -62,7 +62,7 @@ index 8c9039ac1e5..259cd485973 100644
  #define LINK_OS_LINUX_SPEC LINK_OS_LINUX_EMUL " %{!shared: %{!static: \
    %{!static-pie: \
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
-index 364c1a5b155..e33d9ae98e0 100644
+index 2ddab7c99c1..9641580fc83 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
 @@ -372,6 +372,16 @@ extern int dot_symbols;
diff --git a/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandlin=
e-options.patch b/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-comma=
ndline-options.patch
index bb1699be25..409dff3b7e 100644
--- a/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandline-optio=
ns.patch
+++ b/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandline-optio=
ns.patch
@@ -1,4 +1,4 @@
-From bf0d7c463e1fab62804556099b56319fe94be1eb Mon Sep 17 00:00:00 2001
+From 0b83874fd8e767248adffd616bcd07aa438b6905 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 6 Jun 2018 12:10:22 -0700
 Subject: [PATCH] Re-introduce spe commandline options
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 13 insertions(+)
=20
 diff --git a/gcc/config/rs6000/rs6000.opt b/gcc/config/rs6000/rs6000.opt
-index 4931d781c4e..3fb87b6f7d5 100644
+index bde6d3ff664..5af9640825c 100644
 --- a/gcc/config/rs6000/rs6000.opt
 +++ b/gcc/config/rs6000/rs6000.opt
-@@ -348,6 +348,19 @@ mdebug=3D
+@@ -344,6 +344,19 @@ mdebug=3D
  Target RejectNegative Joined
  -mdebug=3D	Enable debug output.
=20=20
diff --git a/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cp=
u_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc/0020-libgcc=
_s-Use-alias-for-__cpu_indicator_init-instead-.patch
index 7ee0342d87..25bcb86685 100644
--- a/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indic=
ator_init-instead-.patch
+++ b/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indic=
ator_init-instead-.patch
@@ -1,4 +1,4 @@
-From a32c75b37209d6836eaaa943dc6b1207acba5d27 Mon Sep 17 00:00:00 2001
+From d8b6f60d1206a67c640096bac3b348828914163c Mon Sep 17 00:00:00 2001
 From: Szabolcs Nagy <nsz@port70.net>
 Date: Sat, 24 Oct 2015 20:09:53 +0000
 Subject: [PATCH] libgcc_s: Use alias for __cpu_indicator_init instead of
@@ -39,10 +39,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 6 insertions(+), 6 deletions(-)
=20
 diff --git a/gcc/config/i386/i386-expand.cc b/gcc/config/i386/i386-expand.=
cc
-index 68978ef8dc2..0c71f36b572 100644
+index 0d817fc3f3b..8d34d19d3f9 100644
 --- a/gcc/config/i386/i386-expand.cc
 +++ b/gcc/config/i386/i386-expand.cc
-@@ -12321,10 +12321,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx s=
ubtarget,
+@@ -12691,10 +12691,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx s=
ubtarget,
      {
      case IX86_BUILTIN_CPU_INIT:
        {
@@ -56,7 +56,7 @@ index 68978ef8dc2..0c71f36b572 100644
  	return expand_expr (call_expr, target, mode, EXPAND_NORMAL);
        }
 diff --git a/libgcc/config/i386/cpuinfo.c b/libgcc/config/i386/cpuinfo.c
-index dab1d98060f..cf824b4114a 100644
+index 50b6d8248a2..724ced402a1 100644
 --- a/libgcc/config/i386/cpuinfo.c
 +++ b/libgcc/config/i386/cpuinfo.c
 @@ -63,7 +63,7 @@ __cpu_indicator_init (void)
diff --git a/meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-us=
e-__LINE__-for-maintainin.patch b/meta/recipes-devtools/gcc/gcc/0021-gentyp=
es-genmodes-Do-not-use-__LINE__-for-maintainin.patch
index f5f04ae314..43df7fcb71 100644
--- a/meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-use-__LIN=
E__-for-maintainin.patch
+++ b/meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-use-__LIN=
E__-for-maintainin.patch
@@ -1,4 +1,4 @@
-From 4efc42b99c96b026f560b0918de7e237ac3dc8d1 Mon Sep 17 00:00:00 2001
+From 18f400d6c91b800361af633b6b93a9e5881bbb0f Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 10 Mar 2020 08:26:53 -0700
 Subject: [PATCH] gentypes/genmodes: Do not use __LINE__ for maintaining
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 19 insertions(+), 19 deletions(-)
=20
 diff --git a/gcc/gengtype.cc b/gcc/gengtype.cc
-index 386ae1b0506..9762e914296 100644
+index 7763f40e9ab..4f0c1eb1508 100644
 --- a/gcc/gengtype.cc
 +++ b/gcc/gengtype.cc
-@@ -1006,7 +1006,7 @@ create_field_at (pair_p next, type_p type, const cha=
r *name, options_p opt,
+@@ -1005,7 +1005,7 @@ create_field_at (pair_p next, type_p type, const cha=
r *name, options_p opt,
  /* Create a fake field with the given type and name.  NEXT is the next
     field in the chain.  */
  #define create_field(next,type,name) \
@@ -29,7 +29,7 @@ index 386ae1b0506..9762e914296 100644
=20=20
  /* Like create_field, but the field is only valid when condition COND
     is true.  */
-@@ -1039,7 +1039,7 @@ create_optional_field_ (pair_p next, type_p type, co=
nst char *name,
+@@ -1038,7 +1038,7 @@ create_optional_field_ (pair_p next, type_p type, co=
nst char *name,
  }
=20=20
  #define create_optional_field(next,type,name,cond)	\
@@ -38,7 +38,7 @@ index 386ae1b0506..9762e914296 100644
=20=20
  /* Reverse a linked list of 'struct pair's in place.  */
  pair_p
-@@ -5238,7 +5238,7 @@ main (int argc, char **argv)
+@@ -5223,7 +5223,7 @@ main (int argc, char **argv)
        /* These types are set up with #define or else outside of where
           we can see them.  We should initialize them before calling
           read_input_list.  */
@@ -48,10 +48,10 @@ index 386ae1b0506..9762e914296 100644
        POS_HERE (do_scalar_typedef ("CUMULATIVE_ARGS", &pos));
        POS_HERE (do_scalar_typedef ("REAL_VALUE_TYPE", &pos));
 diff --git a/gcc/genmodes.cc b/gcc/genmodes.cc
-index 59850bb070a..e187f8542a1 100644
+index 715787b8f48..302adff28d5 100644
 --- a/gcc/genmodes.cc
 +++ b/gcc/genmodes.cc
-@@ -440,7 +440,7 @@ complete_all_modes (void)
+@@ -441,7 +441,7 @@ complete_all_modes (void)
  }
=20=20
  /* For each mode in class CLASS, construct a corresponding complex mode. =
 */
@@ -60,7 +60,7 @@ index 59850bb070a..e187f8542a1 100644
  static void
  make_complex_modes (enum mode_class cl,
  		    const char *file, unsigned int line)
-@@ -499,7 +499,7 @@ make_complex_modes (enum mode_class cl,
+@@ -500,7 +500,7 @@ make_complex_modes (enum mode_class cl,
     having as many components as necessary.  ORDER is the sorting order
     of the mode, with smaller numbers indicating a higher priority.  */
  #define VECTOR_MODES_WITH_PREFIX(PREFIX, C, W, ORDER) \
@@ -69,7 +69,7 @@ index 59850bb070a..e187f8542a1 100644
  #define VECTOR_MODES(C, W) VECTOR_MODES_WITH_PREFIX (V, C, W, 0)
  static void ATTRIBUTE_UNUSED
  make_vector_modes (enum mode_class cl, const char *prefix, unsigned int w=
idth,
-@@ -552,7 +552,7 @@ make_vector_modes (enum mode_class cl, const char *pre=
fix, unsigned int width,
+@@ -553,7 +553,7 @@ make_vector_modes (enum mode_class cl, const char *pre=
fix, unsigned int width,
     BYTESIZE bytes in total.  */
  #define VECTOR_BOOL_MODE(NAME, COUNT, COMPONENT, BYTESIZE)		\
    make_vector_bool_mode (#NAME, COUNT, #COMPONENT, BYTESIZE,		\
@@ -78,7 +78,7 @@ index 59850bb070a..e187f8542a1 100644
  static void ATTRIBUTE_UNUSED
  make_vector_bool_mode (const char *name, unsigned int count,
  		       const char *component, unsigned int bytesize,
-@@ -574,7 +574,7 @@ make_vector_bool_mode (const char *name, unsigned int =
count,
+@@ -575,7 +575,7 @@ make_vector_bool_mode (const char *name, unsigned int =
count,
  /* Input.  */
=20=20
  #define _SPECIAL_MODE(C, N) \
@@ -87,7 +87,7 @@ index 59850bb070a..e187f8542a1 100644
  #define RANDOM_MODE(N) _SPECIAL_MODE (RANDOM, N)
  #define CC_MODE(N) _SPECIAL_MODE (CC, N)
=20=20
-@@ -587,7 +587,7 @@ make_special_mode (enum mode_class cl, const char *nam=
e,
+@@ -588,7 +588,7 @@ make_special_mode (enum mode_class cl, const char *nam=
e,
=20=20
  #define INT_MODE(N, Y) FRACTIONAL_INT_MODE (N, -1U, Y)
  #define FRACTIONAL_INT_MODE(N, B, Y) \
@@ -96,7 +96,7 @@ index 59850bb070a..e187f8542a1 100644
=20=20
  static void
  make_int_mode (const char *name,
-@@ -628,16 +628,16 @@ make_opaque_mode (const char *name,
+@@ -629,16 +629,16 @@ make_opaque_mode (const char *name,
  }
=20=20
  #define FRACT_MODE(N, Y, F) \
@@ -117,7 +117,7 @@ index 59850bb070a..e187f8542a1 100644
=20=20
  /* Create a fixed-point mode by setting CL, NAME, BYTESIZE, IBIT, FBIT,
     FILE, and LINE.  */
-@@ -658,7 +658,7 @@ make_fixed_point_mode (enum mode_class cl,
+@@ -659,7 +659,7 @@ make_fixed_point_mode (enum mode_class cl,
=20=20
  #define FLOAT_MODE(N, Y, F)             FRACTIONAL_FLOAT_MODE (N, -1U, Y,=
 F)
  #define FRACTIONAL_FLOAT_MODE(N, B, Y, F) \
@@ -126,7 +126,7 @@ index 59850bb070a..e187f8542a1 100644
=20=20
  static void
  make_float_mode (const char *name,
-@@ -675,7 +675,7 @@ make_float_mode (const char *name,
+@@ -676,7 +676,7 @@ make_float_mode (const char *name,
  #define DECIMAL_FLOAT_MODE(N, Y, F)	\
  	FRACTIONAL_DECIMAL_FLOAT_MODE (N, -1U, Y, F)
  #define FRACTIONAL_DECIMAL_FLOAT_MODE(N, B, Y, F)	\
@@ -135,7 +135,7 @@ index 59850bb070a..e187f8542a1 100644
=20=20
  static void
  make_decimal_float_mode (const char *name,
-@@ -690,7 +690,7 @@ make_decimal_float_mode (const char *name,
+@@ -691,7 +691,7 @@ make_decimal_float_mode (const char *name,
  }
=20=20
  #define RESET_FLOAT_FORMAT(N, F) \
@@ -144,7 +144,7 @@ index 59850bb070a..e187f8542a1 100644
  static void ATTRIBUTE_UNUSED
  reset_float_format (const char *name, const char *format,
  		    const char *file, unsigned int line)
-@@ -711,7 +711,7 @@ reset_float_format (const char *name, const char *form=
at,
+@@ -712,7 +712,7 @@ reset_float_format (const char *name, const char *form=
at,
=20=20
  /* __intN support.  */
  #define INT_N(M,PREC)				\
@@ -153,7 +153,7 @@ index 59850bb070a..e187f8542a1 100644
  static void ATTRIBUTE_UNUSED
  make_int_n (const char *m, int bitsize,
              const char *file, unsigned int line)
-@@ -740,7 +740,7 @@ make_int_n (const char *m, int bitsize,
+@@ -741,7 +741,7 @@ make_int_n (const char *m, int bitsize,
  /* Partial integer modes are specified by relation to a full integer
     mode.  */
  #define PARTIAL_INT_MODE(M,PREC,NAME)				\
@@ -162,7 +162,7 @@ index 59850bb070a..e187f8542a1 100644
  static void ATTRIBUTE_UNUSED
  make_partial_integer_mode (const char *base, const char *name,
  			   unsigned int precision,
-@@ -767,7 +767,7 @@ make_partial_integer_mode (const char *base, const cha=
r *name,
+@@ -768,7 +768,7 @@ make_partial_integer_mode (const char *base, const cha=
r *name,
  /* A single vector mode can be specified by naming its component
     mode and the number of components.  */
  #define VECTOR_MODE_WITH_PREFIX(PREFIX, C, M, N, ORDER) \
@@ -171,7 +171,7 @@ index 59850bb070a..e187f8542a1 100644
  #define VECTOR_MODE(C, M, N) VECTOR_MODE_WITH_PREFIX(V, C, M, N, 0);
  static void ATTRIBUTE_UNUSED
  make_vector_mode (enum mode_class bclass,
-@@ -814,7 +814,7 @@ make_vector_mode (enum mode_class bclass,
+@@ -815,7 +815,7 @@ make_vector_mode (enum mode_class bclass,
=20=20
  /* Adjustability.  */
  #define _ADD_ADJUST(A, M, X, C1, C2) \
diff --git a/meta/recipes-devtools/gcc/gcc/0023-libatomic-Do-not-enforce-ma=
rch-on-aarch64.patch b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-=
enforce-march-on-aarch64.patch
similarity index 81%
rename from meta/recipes-devtools/gcc/gcc/0023-libatomic-Do-not-enforce-mar=
ch-on-aarch64.patch
rename to meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march=
-on-aarch64.patch
index 2f01659847..cb8969b193 100644
--- a/meta/recipes-devtools/gcc/gcc/0023-libatomic-Do-not-enforce-march-on-=
aarch64.patch
+++ b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-=
aarch64.patch
@@ -1,4 +1,4 @@
-From 52931ec7a708b58d68e69ce9eb99001ae9f099dd Mon Sep 17 00:00:00 2001
+From c3870d073eb9e5d82f9d3067d0fa15038b69713a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 May 2020 15:10:38 -0700
 Subject: [PATCH] libatomic: Do not enforce march on aarch64
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 deletions(-)
=20
 diff --git a/libatomic/Makefile.am b/libatomic/Makefile.am
-index d88515e4a03..e0e2f8b442a 100644
+index c6c8d81c56a..d959a5d040e 100644
 --- a/libatomic/Makefile.am
 +++ b/libatomic/Makefile.am
 @@ -125,7 +125,6 @@ libatomic_la_LIBADD =3D $(foreach s,$(SIZES),$(addsuff=
ix _$(s)_.lo,$(SIZEOBJS)))
@@ -26,16 +26,16 @@ index d88515e4a03..e0e2f8b442a 100644
  if ARCH_AARCH64_LINUX
 -IFUNC_OPTIONS	     =3D -march=3Darmv8-a+lse
  libatomic_la_LIBADD +=3D $(foreach s,$(SIZES),$(addsuffix _$(s)_1_.lo,$(S=
IZEOBJS)))
- endif
- if ARCH_ARM_LINUX
+ libatomic_la_SOURCES +=3D atomic_16.S
+=20
 diff --git a/libatomic/Makefile.in b/libatomic/Makefile.in
-index 80d25653dc7..7377689ab34 100644
+index a0fa3dfc8cc..e70d389874a 100644
 --- a/libatomic/Makefile.in
 +++ b/libatomic/Makefile.in
-@@ -434,7 +434,6 @@ M_SRC =3D $(firstword $(filter %/$(M_FILE), $(all_c_fi=
les)))
+@@ -447,7 +447,6 @@ M_SRC =3D $(firstword $(filter %/$(M_FILE), $(all_c_fi=
les)))
  libatomic_la_LIBADD =3D $(foreach s,$(SIZES),$(addsuffix \
- 	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_2) \
- 	$(am__append_3) $(am__append_4)
+ 	_$(s)_.lo,$(SIZEOBJS))) $(am__append_1) $(am__append_3) \
+ 	$(am__append_4) $(am__append_5)
 -@ARCH_AARCH64_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -march=3Darmv=
8-a+lse
  @ARCH_ARM_LINUX_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -march=3Darmv7-a+=
fp -DHAVE_KERNEL64
  @ARCH_I386_TRUE@@HAVE_IFUNC_TRUE@IFUNC_OPTIONS =3D -march=3Di586
diff --git a/meta/recipes-devtools/gcc/gcc/0024-Fix-install-path-of-linux64=
.h.patch b/meta/recipes-devtools/gcc/gcc/0023-Fix-install-path-of-linux64.h=
.patch
similarity index 85%
rename from meta/recipes-devtools/gcc/gcc/0024-Fix-install-path-of-linux64.=
h.patch
rename to meta/recipes-devtools/gcc/gcc/0023-Fix-install-path-of-linux64.h.=
patch
index 555be62328..11f42c59c4 100644
--- a/meta/recipes-devtools/gcc/gcc/0024-Fix-install-path-of-linux64.h.patch
+++ b/meta/recipes-devtools/gcc/gcc/0023-Fix-install-path-of-linux64.h.patch
@@ -1,4 +1,4 @@
-From 3e67c9c77e46132c252911bf1e5e4222dfd3aa34 Mon Sep 17 00:00:00 2001
+From 7bd6e631e4a5273f5ecc41a5a48830a1342e5926 Mon Sep 17 00:00:00 2001
 From: Andrei Gherzan <andrei.gherzan@huawei.com>
 Date: Wed, 22 Dec 2021 12:49:25 +0100
 Subject: [PATCH] Fix install path of linux64.h
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
=20
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 07fa63b6640..0def7394454 100644
+index 065ce7e9a5b..d4c723968aa 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -3706,6 +3706,8 @@ install-plugin: installdirs lang.install-plugin s-he=
ader-vars install-gengtype
+@@ -3738,6 +3738,8 @@ install-plugin: installdirs lang.install-plugin s-he=
ader-vars install-gengtype
  	  "$(srcdir)"/config/* | "$(srcdir)"/common/config/* \
  	  | "$(srcdir)"/c-family/* | "$(srcdir)"/*.def ) \
  	    base=3D`echo "$$path" | sed -e "s|$$srcdirstrip/||"`;; \
diff --git a/meta/recipes-devtools/gcc/gcc/0024-Avoid-hardcoded-build-paths=
-into-ppc-libgcc.patch b/meta/recipes-devtools/gcc/gcc/0024-Avoid-hardcoded=
-build-paths-into-ppc-libgcc.patch
new file mode 100644
index 0000000000..ad8269016f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0024-Avoid-hardcoded-build-paths-into-p=
pc-libgcc.patch
@@ -0,0 +1,28 @@
+From 4623d87d779853a2862ee92a15a41fded81eddb8 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Sat, 20 Aug 2022 09:04:14 -0700
+Subject: [PATCH] Avoid hardcoded build paths into ppc libgcc
+
+Avoid encoding build paths into sources used for floating point on powerpc.
+(MACHINE=3Dqemuppc bitbake libgcc).
+
+Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2022=
-August/599882.html]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libgcc/config/rs6000/t-float128 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libgcc/config/rs6000/t-float128 b/libgcc/config/rs6000/t-floa=
t128
+index b09b5664af0..513e63748f1 100644
+--- a/libgcc/config/rs6000/t-float128
++++ b/libgcc/config/rs6000/t-float128
+@@ -103,7 +103,7 @@ $(ibm128_dec_objs)	: INTERNAL_CFLAGS +=3D $(IBM128_CFL=
AGS_DECIMAL)
+ $(fp128_softfp_src) : $(srcdir)/soft-fp/$(subst -sw,,$(subst kf,tf,$@)) $=
(fp128_dep)
+ 	@src=3D"$(srcdir)/soft-fp/$(subst -sw,,$(subst kf,tf,$@))"; \
+ 	echo "Create $@"; \
+-	(echo "/* file created from $$src */"; \
++	(echo "/* file created from `basename $$src` */"; \
+ 	 echo; \
+ 	 sed -f $(fp128_sed) < $$src) > $@
+=20
diff --git a/meta/recipes-devtools/gcc/gcc/0026-rust-recursion-limit.patch =
b/meta/recipes-devtools/gcc/gcc/0026-rust-recursion-limit.patch
deleted file mode 100644
index bbe2f18f6f..0000000000
--- a/meta/recipes-devtools/gcc/gcc/0026-rust-recursion-limit.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 9234cdca6ee88badfc00297e72f13dac4e540c79 Mon Sep 17 00:00:00 2001
-From: Nick Clifton <nickc@redhat.com>
-Date: Fri, 1 Jul 2022 15:58:52 +0100
-Subject: [PATCH] Add a recursion limit to the demangle_const function in t=
he
- Rust demangler.
-
-libiberty/
-	PR demangler/105039
-	* rust-demangle.c (demangle_const): Add recursion limit.
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git;=
h=3D9234cdca6ee88badfc00297e72f13dac4e540c79]
----
- libiberty/rust-demangle.c | 29 ++++++++++++++++++++---------
- 1 file changed, 20 insertions(+), 9 deletions(-)
-
-diff --git a/libiberty/rust-demangle.c b/libiberty/rust-demangle.c
-index bb58d900e27..36afcfae278 100644
---- a/libiberty/rust-demangle.c
-+++ b/libiberty/rust-demangle.c
-@@ -126,7 +126,7 @@ parse_integer_62 (struct rust_demangler *rdm)
-     return 0;
-=20
-   x =3D 0;
--  while (!eat (rdm, '_'))
-+  while (!eat (rdm, '_') && !rdm->errored)
-     {
-       c =3D next (rdm);
-       x *=3D 62;
-@@ -1148,6 +1148,15 @@ demangle_const (struct rust_demangler *rdm)
-   if (rdm->errored)
-     return;
-=20
-+  if (rdm->recursion !=3D RUST_NO_RECURSION_LIMIT)
-+    {
-+      ++ rdm->recursion;
-+      if (rdm->recursion > RUST_MAX_RECURSION_COUNT)
-+	/* FIXME: There ought to be a way to report
-+	   that the recursion limit has been reached.  */
-+	goto fail_return;
-+    }
-+
-   if (eat (rdm, 'B'))
-     {
-       backref =3D parse_integer_62 (rdm);
-@@ -1158,7 +1167,7 @@ demangle_const (struct rust_demangler *rdm)
-           demangle_const (rdm);
-           rdm->next =3D old_next;
-         }
--      return;
-+      goto pass_return;
-     }
-=20
-   ty_tag =3D next (rdm);
-@@ -1167,7 +1176,7 @@ demangle_const (struct rust_demangler *rdm)
-     /* Placeholder. */
-     case 'p':
-       PRINT ("_");
--      return;
-+      goto pass_return;
-=20
-     /* Unsigned integer types. */
-     case 'h':
-@@ -1200,18 +1209,20 @@ demangle_const (struct rust_demangler *rdm)
-       break;
-=20
-     default:
--      rdm->errored =3D 1;
--      return;
-+      goto fail_return;
-     }
-=20
--  if (rdm->errored)
--    return;
--
--  if (rdm->verbose)
-+  if (!rdm->errored && rdm->verbose)
-     {
-       PRINT (": ");
-       PRINT (basic_type (ty_tag));
-     }
-+
-+ fail_return:
-+  rdm->errored =3D 1;
-+ pass_return:
-+  if (rdm->recursion !=3D RUST_NO_RECURSION_LIMIT)
-+    -- rdm->recursion;
- }
-=20
- static void
---=20
-2.31.1
-
diff --git a/meta/recipes-devtools/gcc/gcc/hardcoded-paths.patch b/meta/rec=
ipes-devtools/gcc/gcc/hardcoded-paths.patch
deleted file mode 100644
index f3485858f4..0000000000
--- a/meta/recipes-devtools/gcc/gcc/hardcoded-paths.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Avoid encoding build paths into sources used for floating point on powerpc.
-(MACHINE=3Dqemuppc bitbake libgcc).
-
-Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2022=
-August/599882.html]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: gcc-12.1.0/libgcc/config/rs6000/t-float128
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-12.1.0.orig/libgcc/config/rs6000/t-float128
-+++ gcc-12.1.0/libgcc/config/rs6000/t-float128
-@@ -103,7 +103,7 @@ $(ibm128_dec_objs)	: INTERNAL_CFLAGS +=3D
- $(fp128_softfp_src) : $(srcdir)/soft-fp/$(subst -sw,,$(subst kf,tf,$@)) $=
(fp128_dep)
- 	@src=3D"$(srcdir)/soft-fp/$(subst -sw,,$(subst kf,tf,$@))"; \
- 	echo "Create $@"; \
--	(echo "/* file created from $$src */"; \
-+	(echo "/* file created from `basename $$src` */"; \
- 	 echo; \
- 	 sed -f $(fp128_sed) < $$src) > $@
-=20
diff --git a/meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch b/meta=
/recipes-devtools/gcc/gcc/prefix-map-realpath.patch
deleted file mode 100644
index 23ae00ce40..0000000000
--- a/meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-Relative paths don't work with -fdebug-prefix-map and friends. This
-can lead to paths which the user wanted to be remapped being missed.
-Setting -fdebug-prefix-map to work with a relative path isn't practical
-either.
-
-Instead, call gcc's realpath function on the incomming path name before
-comparing it with the remapping. This means other issues like symlinks
-are also accounted for and leads to a more consistent remapping experience.
-
-Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit=
diff;h=3D11543b27fe16d81ca5483ecb98ec7a5b2426e0c0]
-                          [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit=
diff;h=3De5c15eb183f17e806ad6b58c9497321ded87866f]
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-
-Index: gcc-12.1.0/gcc/file-prefix-map.cc
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-12.1.0.orig/gcc/file-prefix-map.cc
-+++ gcc-12.1.0/gcc/file-prefix-map.cc
-@@ -70,19 +70,28 @@ remap_filename (file_prefix_map *maps, c
-   file_prefix_map *map;
-   char *s;
-   const char *name;
-+  char *realname;
-   size_t name_len;
-=20
-+  if (lbasename (filename) =3D=3D filename)
-+    return filename;
-+
-+  realname =3D lrealpath (filename);
-+
-   for (map =3D maps; map; map =3D map->next)
--    if (filename_ncmp (filename, map->old_prefix, map->old_len) =3D=3D 0)
-+    if (filename_ncmp (realname, map->old_prefix, map->old_len) =3D=3D 0)
-       break;
--  if (!map)
-+  if (!map) {
-+    free (realname);
-     return filename;
--  name =3D filename + map->old_len;
-+  }
-+  name =3D realname + map->old_len;
-   name_len =3D strlen (name) + 1;
-=20
-   s =3D (char *) ggc_alloc_atomic (name_len + map->new_len);
-   memcpy (s, map->new_prefix, map->new_len);
-   memcpy (s + map->new_len, name, name_len);
-+  free (realname);
-   return s;
- }
-=20
-Index: gcc-12.1.0/libcpp/macro.cc
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- gcc-12.1.0.orig/libcpp/macro.cc
-+++ gcc-12.1.0/libcpp/macro.cc
-@@ -563,7 +563,7 @@ _cpp_builtin_macro_text (cpp_reader *pfi
- 	    if (!name)
- 	      abort ();
- 	  }
--	if (pfile->cb.remap_filename)
-+	if (pfile->cb.remap_filename && !pfile->state.in_directive)
- 	  name =3D pfile->cb.remap_filename (name);
- 	len =3D strlen (name);
- 	buf =3D _cpp_unaligned_alloc (pfile, len * 2 + 3);
diff --git a/meta/recipes-devtools/gcc/gcc_12.2.bb b/meta/recipes-devtools/=
gcc/gcc_13.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_12.2.bb
rename to meta/recipes-devtools/gcc/gcc_13.1.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_12.2.bb b/meta/recipe=
s-devtools/gcc/libgcc-initial_13.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_12.2.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_13.1.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_12.2.bb b/meta/recipes-devtoo=
ls/gcc/libgcc_13.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_12.2.bb
rename to meta/recipes-devtools/gcc/libgcc_13.1.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_12.2.bb b/meta/recipes-d=
evtools/gcc/libgfortran_13.1.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_12.2.bb
rename to meta/recipes-devtools/gcc/libgfortran_13.1.bb
--=20
2.40.1


