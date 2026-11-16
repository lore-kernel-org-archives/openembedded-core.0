Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5830.1794869423212683359
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 14:50:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=fapK9gin;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202611162250216430af03e30002078b-_lhhz3@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202611162250216430af03e30002078b
        for <openembedded-core@lists.openembedded.org>;
        Mon, 16 Nov 2026 23:50:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=uiVaz1++DV0Ye6DAeZmbhF4vlVJSHkuFB7pFLSa03Y8=;
 b=fapK9ginBsjTM05oX8xD8ggi0J3j6vAKw5gS22029YcLdWHLnTnt6qFe4z3Arqrt2Q2DUu
 YwDPvFPDMY7ZMMo/02iyoAmHNSVfHon1V47LLNlsFZAyQCPSq7hbCa0ElXn2N76ojv0ic3ap
 Ut/9EO7SYfijaFyjPKBFIGTP0JLPDc9kDngalO6eKM6LWerMosM5ophoZDaJU+tkFH5WEnaB
 CQQM4RpvXoA/3er0FzNis6IA7y4LWdPiem+PMSdQoDTqQ1jIZzIVYkPN8IFL9FSh522NuLRh
 ordHUlLv1qpBMZuinJoux8BtFsqy7WmRSIaiQHnFwZooOk+UmCpH/aDw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/2] grub: upgrade 2.14 -> 2.16
Date: Mon, 16 Nov 2026 23:49:59 +0100
Message-ID: <20261116224959.197150-2-peter.marko@siemens.com>
In-Reply-To: <20261116224959.197150-1-peter.marko@siemens.com>
References: <20261116224959.197150-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 22:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250397
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2026-97876.
Release information: [1]
Changes: [2]

* update SRC_URI to new location and switch from tag.gz to tar.xz
* remove commits included in this release: [3] and [4]
* refresh remaining commits via devtool
* remove obsolete CVE_STATUS entries

[1] https://gitlab.freedesktop.org/gnu-grub/grub/-/releases/grub-2.16
[2] https://gitlab.freedesktop.org/gnu-grub/grub/-/blob/grub-2.16/NEWS?ref_type=tags
[3] https://gitlab.freedesktop.org/gnu-grub/grub/-/commit/1dc2986c7e8480d955f87d276d31400116a21fac
[4] https://gitlab.freedesktop.org/gnu-grub/grub/-/commit/7b72d6cbd548f714a0122c3cd1dd9a70db10894a

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...-Check-linker-for-image-base-support.patch | 73 -------------------
 ...-Print-a-more-helpful-error-if-autoc.patch | 34 ---------
 ...b.d-10_linux.in-add-oe-s-kernel-name.patch |  4 +-
 .../{grub-efi_2.14.bb => grub-efi_2.16.bb}    |  0
 meta/recipes-bsp/grub/grub2.inc               | 12 +--
 .../grub/{grub_2.14.bb => grub_2.16.bb}       |  0
 6 files changed, 4 insertions(+), 119 deletions(-)
 delete mode 100644 meta/recipes-bsp/grub/files/0001-Revert-configure-Check-linker-for-image-base-support.patch
 delete mode 100644 meta/recipes-bsp/grub/files/0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch
 rename meta/recipes-bsp/grub/{grub-efi_2.14.bb => grub-efi_2.16.bb} (100%)
 rename meta/recipes-bsp/grub/{grub_2.14.bb => grub_2.16.bb} (100%)

diff --git a/meta/recipes-bsp/grub/files/0001-Revert-configure-Check-linker-for-image-base-support.patch b/meta/recipes-bsp/grub/files/0001-Revert-configure-Check-linker-for-image-base-support.patch
deleted file mode 100644
index 123909cdf8f..00000000000
--- a/meta/recipes-bsp/grub/files/0001-Revert-configure-Check-linker-for-image-base-support.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 3a9d2dd2f5fb07b75a74c307d61b9b9fc5d20a62 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Fri, 27 Feb 2026 11:46:54 +0800
-Subject: [PATCH] Revert "configure: Check linker for --image-base support"
-
-This reverts commit 1a5417f39a0ccefcdd5440f2a67f84d2d2e26960.
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- acinclude.m4 |  5 -----
- configure.ac | 14 ++------------
- 2 files changed, 2 insertions(+), 17 deletions(-)
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index 70c1912f8..fa7840f09 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -79,11 +79,6 @@ AC_DEFUN([grub_PROG_OBJCOPY_ABSOLUTE],
- [AC_MSG_CHECKING([whether ${TARGET_OBJCOPY} works for absolute addresses])
- AC_CACHE_VAL(grub_cv_prog_objcopy_absolute,
- [cat > conftest.c <<\EOF
--asm (
--    ".globl start, _start, __start\n"
--    ".ifdef cmain; .set start = _start = __start = cmain\n.endif\n"
--    ".ifdef _cmain; .set start = _start = __start = _cmain\n.endif\n"
--);
- void cmain (void);
- void
- cmain (void)
-diff --git a/configure.ac b/configure.ac
-index d8ca1b7c1..041cfbab4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1461,6 +1461,7 @@ elif test x$grub_cv_target_cc_link_format = x-mi386pe || test x$grub_cv_target_c
-   TARGET_IMG_LDSCRIPT='$(top_srcdir)'"/conf/i386-cygwin-img-ld.sc"
-   TARGET_IMG_LDFLAGS="-Wl,-T${TARGET_IMG_LDSCRIPT}"
-   TARGET_IMG_LDFLAGS_AC="-Wl,-T${srcdir}/conf/i386-cygwin-img-ld.sc"
-+  TARGET_IMG_BASE_LDOPT="-Wl,-Ttext"
-   TARGET_IMG_CFLAGS=
- else
-   TARGET_APPLE_LINKER=0
-@@ -1468,6 +1469,7 @@ else
-   TARGET_IMG_LDSCRIPT=
-   TARGET_IMG_LDFLAGS='-Wl,-N'
-   TARGET_IMG_LDFLAGS_AC='-Wl,-N'
-+  TARGET_IMG_BASE_LDOPT="-Wl,-Ttext"
-   TARGET_IMG_CFLAGS=
- fi
- 
-@@ -1798,18 +1800,6 @@ grub_PROG_TARGET_CC
- m4_ifndef([AX_CHECK_LINK_FLAG], [m4_fatal([autoconf-archive is missing. You must install it to generate the configure script.])])
- 
- if test "x$TARGET_APPLE_LINKER" != x1 ; then
--AX_CHECK_LINK_FLAG([-Wl,--image-base,0x400000],
--    [TARGET_IMG_BASE_LDOPT="-Wl,--image-base"],
--    [TARGET_IMG_BASE_LDOPT="-Wl,-Ttext"],
--    [],
--    [AC_LANG_SOURCE([
--asm (".globl start; start:");
--asm (".globl _start; _start:");
--asm (".globl __start; __start:");
--void __main (void);
--void __main (void) {}
--int main (void);
--    ])])
- grub_PROG_OBJCOPY_ABSOLUTE
- fi
- grub_PROG_LD_BUILD_ID_NONE
--- 
-2.43.0
-
diff --git a/meta/recipes-bsp/grub/files/0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch b/meta/recipes-bsp/grub/files/0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch
deleted file mode 100644
index bf6375246ed..00000000000
--- a/meta/recipes-bsp/grub/files/0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d0f516385dc73e8dd92b78ce08c1df100434fe67 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Fri, 27 Feb 2026 13:58:44 +0800
-Subject: [PATCH] Revert "configure: Print a more helpful error if
- autoconf-archive is not installed"
-
-This reverts commit ac042f3f58d33ce9cd5ff61750f06da1a1d7b0eb.
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- configure.ac | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 041cfbab4..209c0fb11 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1794,11 +1794,6 @@ LIBS=""
- # Defined in acinclude.m4.
- grub_ASM_USCORE
- grub_PROG_TARGET_CC
--
--# The error message produced by autoconf if autoconf-archive is not installed is
--# quite misleading and not very helpful. So, try point people in the right direction.
--m4_ifndef([AX_CHECK_LINK_FLAG], [m4_fatal([autoconf-archive is missing. You must install it to generate the configure script.])])
--
- if test "x$TARGET_APPLE_LINKER" != x1 ; then
- grub_PROG_OBJCOPY_ABSOLUTE
- fi
--- 
-2.43.0
-
diff --git a/meta/recipes-bsp/grub/files/0003-grub.d-10_linux.in-add-oe-s-kernel-name.patch b/meta/recipes-bsp/grub/files/0003-grub.d-10_linux.in-add-oe-s-kernel-name.patch
index 2bb0aca5cfe..146c2deca30 100644
--- a/meta/recipes-bsp/grub/files/0003-grub.d-10_linux.in-add-oe-s-kernel-name.patch
+++ b/meta/recipes-bsp/grub/files/0003-grub.d-10_linux.in-add-oe-s-kernel-name.patch
@@ -22,7 +22,7 @@ diff --git a/util/grub.d/10_linux.in b/util/grub.d/10_linux.in
 index 07649cd..d5ec745 100644
 --- a/util/grub.d/10_linux.in
 +++ b/util/grub.d/10_linux.in
-@@ -166,12 +166,12 @@ machine=`uname -m`
+@@ -179,12 +179,12 @@ machine=`uname -m`
  case "x$machine" in
      xi?86 | xx86_64)
  	list=
@@ -42,7 +42,7 @@ diff --git a/util/grub.d/20_linux_xen.in b/util/grub.d/20_linux_xen.in
 index 27bff00..6cc7bfc 100644
 --- a/util/grub.d/20_linux_xen.in
 +++ b/util/grub.d/20_linux_xen.in
-@@ -181,7 +181,7 @@ EOF
+@@ -184,7 +184,7 @@ EOF
  }
  
  linux_list=
diff --git a/meta/recipes-bsp/grub/grub-efi_2.14.bb b/meta/recipes-bsp/grub/grub-efi_2.16.bb
similarity index 100%
rename from meta/recipes-bsp/grub/grub-efi_2.14.bb
rename to meta/recipes-bsp/grub/grub-efi_2.16.bb
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index d0f737164f7..4ead0a3b6a8 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -13,15 +13,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 CVE_PRODUCT = "grub2"
 
-SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
+SRC_URI = "https://gitlab.freedesktop.org/api/v4/projects/26558/packages/generic/source-assets/grub-${PV}/grub-${PV}.tar.xz \
            file://0001-autogen.sh-exclude-.pc-from-po-POTFILES.in.patch \
            file://0002-grub-module-explicitly-keeps-symbole-.module_license.patch \
            file://0003-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
-           file://0001-Revert-configure-Check-linker-for-image-base-support.patch \
-           file://0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch \
 "
 
-SRC_URI[sha256sum] = "d0415fbb3e739237064e173743a6e5f60c33a81ec02a069cc9152d80efff4967"
+SRC_URI[sha256sum] = "f0db0104927df0b9a48bc41b735c702936190d17eb2d73d3018fa77474a0cabe"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/gnu-grub/grub/-/tags"
 UPSTREAM_CHECK_REGEX = "grub-(?P<pver>\d+(\.\d+)+)"
@@ -31,12 +29,6 @@ CVE_STATUS[CVE-2023-4001]  = "not-applicable-platform: Applies only to RHEL/Fedo
 CVE_STATUS[CVE-2024-1048]  = "not-applicable-platform: Applies only to RHEL/Fedora"
 CVE_STATUS[CVE-2024-2312]  = "not-applicable-platform: Applies only to Ubuntu"
 CVE_STATUS[CVE-2024-49504] = "not-applicable-platform: Applies only to SUSE"
-CVE_STATUS[CVE-2025-54770] = "fixed-version: fixed since 2.14"
-CVE_STATUS[CVE-2025-54771] = "fixed-version: fixed since 2.14"
-CVE_STATUS[CVE-2025-61661] = "fixed-version: fixed since 2.14"
-CVE_STATUS[CVE-2025-61662] = "fixed-version: fixed since 2.14"
-CVE_STATUS[CVE-2025-61663] = "fixed-version: fixed since 2.14"
-CVE_STATUS[CVE-2025-61664] = "fixed-version: fixed since 2.14"
 
 DEPENDS = "flex-native bison-native gettext-native gawk-replacement-native"
 
diff --git a/meta/recipes-bsp/grub/grub_2.14.bb b/meta/recipes-bsp/grub/grub_2.16.bb
similarity index 100%
rename from meta/recipes-bsp/grub/grub_2.14.bb
rename to meta/recipes-bsp/grub/grub_2.16.bb
