Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED5FC77B6E
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 21:41:15 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.2425.1681335667519001032
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Apr 2023 14:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HAtSj7Sb;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-246f9a87b82so175656a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 14:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681335667; x=1683927667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dn5qYyAx1c5dWoprU6Q+6e6aWH1VsPjAkDT3KRFp13s=;
        b=HAtSj7SbGDe4D6OLVZQKJx56VIPjCz2sSaZSxEVJIlUdNxGwkEHvUD5V4fqg1MUK+H
         6qHexdNRLWTiroGQyaGnQ/+wse83tqnd/lvDMk0Icbxnlyuwu7Z1n74KWZOWrk7e0kFL
         Pcy5tktx+pGL7TmpvalkEII73JI3PrEnSyW1X+4/YLtKWFnzcYF7ZJQSM3r4+hUKOW1h
         lvxYZj1EY8cIqgJZ+ytB0jlwvp/Gxae8BAhOENpnJtdyL9B8DFPatFun3Lexha/wwpFe
         wt/B6RDij3eUsq7FsCtMNiNPHR3iz7Jpa1MP7KfE1MrzwDla7EbE5NT4Oq6WG2CjPKiT
         lhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681335667; x=1683927667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dn5qYyAx1c5dWoprU6Q+6e6aWH1VsPjAkDT3KRFp13s=;
        b=Cta4kiRgCtmhykpAxxmg6RUaw00pV0wlQX946kVtxhhlvMqpFDGBpQ6GYWL8ZiuwQ9
         NSVQkyMCZQdAAXDNM6Xlgo4g7sE5ouEDQqqe2P/MmVFXwiuqxOdudD5ou0lBpWMBkLqq
         1NiJwhKq8p4EOqQjcO72qdZWSaiZJyfrasNKWCyLSNguvW3bnXL+7Rb0CX4uQEKaYX53
         EeDILj+uGVPe4xhjhYGAA0+hPGSu3FaQyhb3zEDy9Kd6v4LoWoyGrbRS5D8JbnIGDaC5
         Ig10pWymXmQpbidm1MMSiNLWpUP4v9YY0R12VCaeFTljoDHctnolNaxwPkXZv653Sw0a
         ctPg==
X-Gm-Message-State: AAQBX9cdAGi0pWEnBD6cpTSQPBX1opJs9EN8Hppe7Z2M+lj5RiOr18Or
	Ym5NhFs0xqpeq6OaVr6SvhjAy2AaKbo=
X-Google-Smtp-Source: AKy350bsLxsjiylrKCHMohVaLkhOoS6h4ULt5uUFDZi6kdbgcFALwTn03GWsNd5dXtc7S+P6tzEm4w==
X-Received: by 2002:a05:6a00:189f:b0:5a8:ad9d:83f with SMTP id x31-20020a056a00189f00b005a8ad9d083fmr373057pfh.24.1681335666130;
        Wed, 12 Apr 2023 14:41:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::8193])
        by smtp.gmail.com with ESMTPSA id l8-20020a62be08000000b0062d945e416esm12095322pff.160.2023.04.12.14.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 14:41:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: [RFT][PATCH 1/3] autoconf: Test 2.72c
Date: Wed, 12 Apr 2023 14:41:00 -0700
Message-Id: <20230412214102.551761-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 21:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179952

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../coreutils/coreutils/autoconf-2.73.patch   |  15 ++
 meta/recipes-core/coreutils/coreutils_9.1.bb  |   1 +
 .../gettext-0.21.1/autoconf-2.73.patch        |  41 ++++++
 meta/recipes-core/gettext/gettext_0.21.1.bb   |   1 +
 ...ilers-that-moan-about-K-R-func-decls.patch | 138 ------------------
 .../{autoconf_2.71.bb => autoconf_2.72c.bb}   |   6 +-
 .../bison/bison/autoconf-2.73.patch           |  15 ++
 meta/recipes-devtools/bison/bison_3.8.2.bb    |   1 +
 meta/recipes-extended/findutils/findutils.inc |   1 +
 .../findutils/findutils/autoconf-2.73.patch   |  15 ++
 .../gzip/gzip-1.12/autoconf-2.73.patch        |  15 ++
 meta/recipes-extended/gzip/gzip_1.12.bb       |   1 +
 .../libarchive/libarchive/configurehack.patch |  45 ++++++
 .../libarchive/libarchive_3.6.2.bb            |   1 +
 .../libpipeline/autoconf-2.73.patch           |  15 ++
 .../libpipeline/libpipeline_1.5.7.bb          |   1 +
 .../man-db/files/autoconf-2.73.patch          |  15 ++
 meta/recipes-extended/man-db/man-db_2.11.2.bb |   1 +
 .../parted/files/autoconf-2.73.patch          |  15 ++
 meta/recipes-extended/parted/parted_3.5.bb    |   1 +
 .../wget/wget/autoconf-2.73.patch             |  15 ++
 meta/recipes-extended/wget/wget_1.21.3.bb     |   1 +
 .../apr/apr/autoconf-2.73.patch               |  23 +++
 meta/recipes-support/apr/apr_1.7.3.bb         |   1 +
 24 files changed, 243 insertions(+), 141 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils/autoconf-2.73.patch
 create mode 100644 meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/0001-Port-to-compilers-that-moan-about-K-R-func-decls.patch
 rename meta/recipes-devtools/autoconf/{autoconf_2.71.bb => autoconf_2.72c.bb} (92%)
 create mode 100644 meta/recipes-devtools/bison/bison/autoconf-2.73.patch
 create mode 100644 meta/recipes-extended/findutils/findutils/autoconf-2.73.patch
 create mode 100644 meta/recipes-extended/gzip/gzip-1.12/autoconf-2.73.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/configurehack.patch
 create mode 100644 meta/recipes-extended/libpipeline/libpipeline/autoconf-2.73.patch
 create mode 100644 meta/recipes-extended/man-db/files/autoconf-2.73.patch
 create mode 100644 meta/recipes-extended/parted/files/autoconf-2.73.patch
 create mode 100644 meta/recipes-extended/wget/wget/autoconf-2.73.patch
 create mode 100644 meta/recipes-support/apr/apr/autoconf-2.73.patch

diff --git a/meta/recipes-core/coreutils/coreutils/autoconf-2.73.patch b/meta/recipes-core/coreutils/coreutils/autoconf-2.73.patch
new file mode 100644
index 0000000000..8c77d50e0a
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/autoconf-2.73.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Inappropriate
+
+Index: findutils-4.9.0/gl/m4/largefile.m4
+===================================================================
+--- findutils-4.9.0.orig/m4/largefile.m4
++++ findutils-4.9.0/m4/largefile.m4
+@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
+ # with _TIME_BITS.  Also, work around a problem in autoconf <= 2.69:
+ # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
+ # or configures them incorrectly in some cases.
+-m4_version_prereq([2.70], [], [
++m4_version_prereq([2.73], [], [
+ 
+ # _AC_SYS_LARGEFILE_TEST_INCLUDES
+ # -------------------------------
diff --git a/meta/recipes-core/coreutils/coreutils_9.1.bb b/meta/recipes-core/coreutils/coreutils_9.1.bb
index 4807eefd04..84269e8957 100644
--- a/meta/recipes-core/coreutils/coreutils_9.1.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.1.bb
@@ -16,6 +16,7 @@ inherit autotools gettext texinfo
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
+           file://autoconf-2.73.patch \
            file://run-ptest \
            "
 
diff --git a/meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch b/meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch
new file mode 100644
index 0000000000..9b3ed336a4
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Inappropriate
+
+Index: gettext-0.21.1/gettext-runtime/gnulib-m4/largefile.m4
+===================================================================
+--- gettext-0.21.1.orig/gettext-runtime/gnulib-m4/largefile.m4
++++ gettext-0.21.1/gettext-runtime/gnulib-m4/largefile.m4
+@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
+ # with _TIME_BITS.  Also, work around a problem in autoconf <= 2.69:
+ # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
+ # or configures them incorrectly in some cases.
+-m4_version_prereq([2.70], [], [
++m4_version_prereq([2.73], [], [
+ 
+ # _AC_SYS_LARGEFILE_TEST_INCLUDES
+ # -------------------------------
+Index: gettext-0.21.1/gettext-tools/gnulib-m4/largefile.m4
+===================================================================
+--- gettext-0.21.1.orig/gettext-tools/gnulib-m4/largefile.m4
++++ gettext-0.21.1/gettext-tools/gnulib-m4/largefile.m4
+@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
+ # with _TIME_BITS.  Also, work around a problem in autoconf <= 2.69:
+ # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
+ # or configures them incorrectly in some cases.
+-m4_version_prereq([2.70], [], [
++m4_version_prereq([2.73], [], [
+ 
+ # _AC_SYS_LARGEFILE_TEST_INCLUDES
+ # -------------------------------
+Index: gettext-0.21.1/libtextstyle/gnulib-m4/largefile.m4
+===================================================================
+--- gettext-0.21.1.orig/libtextstyle/gnulib-m4/largefile.m4
++++ gettext-0.21.1/libtextstyle/gnulib-m4/largefile.m4
+@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
+ # with _TIME_BITS.  Also, work around a problem in autoconf <= 2.69:
+ # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
+ # or configures them incorrectly in some cases.
+-m4_version_prereq([2.70], [], [
++m4_version_prereq([2.73], [], [
+ 
+ # _AC_SYS_LARGEFILE_TEST_INCLUDES
+ # -------------------------------
diff --git a/meta/recipes-core/gettext/gettext_0.21.1.bb b/meta/recipes-core/gettext/gettext_0.21.1.bb
index b80ea9276e..2f030a2df9 100644
--- a/meta/recipes-core/gettext/gettext_0.21.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.21.1.bb
@@ -29,6 +29,7 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://serial-tests-config.patch \
            file://0001-tests-autopoint-3-unset-MAKEFLAGS.patch \
            file://0001-init-env.in-do-not-add-C-CXX-parameters.patch \
+           file://autoconf-2.73.patch \
            "
 SRC_URI[sha256sum] = "e8c3650e1d8cee875c4f355642382c1df83058bd5a11ee8555c0cf276d646d45"
 
diff --git a/meta/recipes-devtools/autoconf/autoconf/0001-Port-to-compilers-that-moan-about-K-R-func-decls.patch b/meta/recipes-devtools/autoconf/autoconf/0001-Port-to-compilers-that-moan-about-K-R-func-decls.patch
deleted file mode 100644
index 4f15bf96c3..0000000000
--- a/meta/recipes-devtools/autoconf/autoconf/0001-Port-to-compilers-that-moan-about-K-R-func-decls.patch
+++ /dev/null
@@ -1,138 +0,0 @@
-From 7a3bbca81b803ba116b83c82de378e840cc35f81 Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Thu, 1 Sep 2022 16:19:50 -0500
-Subject: [PATCH] Port to compilers that moan about K&R func decls
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-* lib/autoconf/c.m4 (AC_LANG_CALL, AC_LANG_FUNC_LINK_TRY):
-Use '(void)' rather than '()' in function prototypes, as the latter
-provokes fatal errors in some compilers nowadays.
-* lib/autoconf/functions.m4 (AC_FUNC_STRTOD):
-* tests/fortran.at (AC_F77_DUMMY_MAIN usage):
-* tests/semantics.at (AC_CHECK_DECLS):
-Don’t use () in a function decl.
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/autoconf.git/commit/?id=8b5e2016c7ed2d67f31b03a3d2e361858ff5299b]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- doc/autoconf.texi         | 7 +++----
- lib/autoconf/c.m4         | 6 +++---
- lib/autoconf/functions.m4 | 3 ---
- tests/fortran.at          | 8 ++++----
- tests/semantics.at        | 2 +-
- 5 files changed, 11 insertions(+), 15 deletions(-)
-
---- a/doc/autoconf.texi
-+++ b/doc/autoconf.texi
-@@ -5465,9 +5465,7 @@ the @samp{#undef malloc}):
- #include <config.h>
- #undef malloc
- 
--#include <sys/types.h>
--
--void *malloc ();
-+#include <stdlib.h>
- 
- /* Allocate an N-byte block of memory from the heap.
-    If N is zero, allocate a 1-byte block.  */
-@@ -8295,7 +8293,7 @@ needed:
- #  ifdef __cplusplus
-      extern "C"
- #  endif
--   int F77_DUMMY_MAIN () @{ return 1; @}
-+   int F77_DUMMY_MAIN (void) @{ return 1; @}
- #endif
- @end example
- 
---- a/lib/autoconf/c.m4
-+++ b/lib/autoconf/c.m4
-@@ -127,7 +127,7 @@ m4_if([$2], [main], ,
- [/* Override any GCC internal prototype to avoid an error.
-    Use char because int might match the return type of a GCC
-    builtin and then its argument prototype would still apply.  */
--char $2 ();])], [return $2 ();])])
-+char $2 (void);])], [return $2 ();])])
- 
- 
- # AC_LANG_FUNC_LINK_TRY(C)(FUNCTION)
-@@ -151,7 +151,7 @@ m4_define([AC_LANG_FUNC_LINK_TRY(C)],
- #define $1 innocuous_$1
- 
- /* System header to define __stub macros and hopefully few prototypes,
--   which can conflict with char $1 (); below.  */
-+   which can conflict with char $1 (void); below.  */
- 
- #include <limits.h>
- #undef $1
-@@ -162,7 +162,7 @@ m4_define([AC_LANG_FUNC_LINK_TRY(C)],
- #ifdef __cplusplus
- extern "C"
- #endif
--char $1 ();
-+char $1 (void);
- /* The GNU C library defines this for functions which it implements
-     to always fail with ENOSYS.  Some functions are actually named
-     something starting with __ and the normal name is an alias.  */
---- a/lib/autoconf/functions.m4
-+++ b/lib/autoconf/functions.m4
-@@ -1601,9 +1601,6 @@ AC_DEFUN([AC_FUNC_STRTOD],
- AC_CACHE_CHECK(for working strtod, ac_cv_func_strtod,
- [AC_RUN_IFELSE([AC_LANG_SOURCE([[
- ]AC_INCLUDES_DEFAULT[
--#ifndef strtod
--double strtod ();
--#endif
- int
- main (void)
- {
---- a/tests/fortran.at
-+++ b/tests/fortran.at
-@@ -233,7 +233,7 @@ void FOOBAR_F77 (double *x, double *y);
- #  ifdef __cplusplus
-      extern "C"
- #  endif
--   int F77_DUMMY_MAIN () { return 1; }
-+   int F77_DUMMY_MAIN (void) { return 1; }
- #endif
- 
- int main(int argc, char *argv[])
-@@ -315,7 +315,7 @@ void FOOBAR_FC(double *x, double *y);
- #  ifdef __cplusplus
-      extern "C"
- #  endif
--   int FC_DUMMY_MAIN () { return 1; }
-+   int FC_DUMMY_MAIN (void) { return 1; }
- #endif
- 
- int main (int argc, char *argv[])
-@@ -561,7 +561,7 @@ void @foobar@ (int *x);
- #  ifdef __cplusplus
-      extern "C"
- #  endif
--   int F77_DUMMY_MAIN () { return 1; }
-+   int F77_DUMMY_MAIN (void) { return 1; }
- #endif
- 
- int main(int argc, char *argv[])
-@@ -637,7 +637,7 @@ void @foobar@ (int *x);
- #  ifdef __cplusplus
-      extern "C"
- #  endif
--   int FC_DUMMY_MAIN () { return 1; }
-+   int FC_DUMMY_MAIN (void) { return 1; }
- #endif
- 
- int main(int argc, char *argv[])
---- a/tests/semantics.at
-+++ b/tests/semantics.at
-@@ -207,7 +207,7 @@ AT_CHECK_MACRO([AC_CHECK_DECLS],
- 		 [[extern int yes;
- 		   enum { myenum };
- 		   extern struct mystruct_s { int x[20]; } mystruct;
--		   extern int myfunc();
-+		   extern int myfunc (int);
- 		   #define mymacro1(arg) arg
- 		   #define mymacro2]])
-   # Ensure we can detect missing declarations of functions whose
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.71.bb b/meta/recipes-devtools/autoconf/autoconf_2.72c.bb
similarity index 92%
rename from meta/recipes-devtools/autoconf/autoconf_2.71.bb
rename to meta/recipes-devtools/autoconf/autoconf_2.72c.bb
index 97c241a3f5..fe9779e4dd 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.71.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.72c.bb
@@ -11,18 +11,18 @@ DEPENDS:remove:class-native = "autoconf-native automake-native help2man-native"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cc3f3a7596cb558bbd9eb7fbaa3ef16c \
 		    file://COPYINGv3;md5=1ebbd3e34237af26da5dc08a4e440464"
 
-SRC_URI = "${GNU_MIRROR}/autoconf/${BP}.tar.gz \
+SRC_URI = " \
+           https://alpha.gnu.org/gnu/autoconf/autoconf-2.72c.tar.gz \
            file://program_prefix.patch \
            file://autoreconf-exclude.patch \
            file://remove-usr-local-lib-from-m4.patch \
            file://preferbash.patch \
            file://autotest-automake-result-format.patch \
            file://man-host-perl.patch \
-           file://0001-Port-to-compilers-that-moan-about-K-R-func-decls.patch \
            "
 SRC_URI:append:class-native = " file://no-man.patch"
 
-SRC_URI[sha256sum] = "431075ad0bf529ef13cb41e9042c542381103e80015686222b8a9d4abef42a1c"
+SRC_URI[sha256sum] = "21b64169c820c6cdf27fc981ca9c2fb615546e5dead92bccf8d92d0784cdd364"
 
 RDEPENDS:${PN} = "m4 gnu-config \
 		  perl \
diff --git a/meta/recipes-devtools/bison/bison/autoconf-2.73.patch b/meta/recipes-devtools/bison/bison/autoconf-2.73.patch
new file mode 100644
index 0000000000..8c77d50e0a
--- /dev/null
+++ b/meta/recipes-devtools/bison/bison/autoconf-2.73.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Inappropriate
+
+Index: findutils-4.9.0/gl/m4/largefile.m4
+===================================================================
+--- findutils-4.9.0.orig/m4/largefile.m4
++++ findutils-4.9.0/m4/largefile.m4
+@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
+ # with _TIME_BITS.  Also, work around a problem in autoconf <= 2.69:
+ # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
+ # or configures them incorrectly in some cases.
+-m4_version_prereq([2.70], [], [
++m4_version_prereq([2.73], [], [
+ 
+ # _AC_SYS_LARGEFILE_TEST_INCLUDES
+ # -------------------------------
diff --git a/meta/recipes-devtools/bison/bison_3.8.2.bb b/meta/recipes-devtools/bison/bison_3.8.2.bb
index c95f321244..da138e3587 100644
--- a/meta/recipes-devtools/bison/bison_3.8.2.bb
+++ b/meta/recipes-devtools/bison/bison_3.8.2.bb
@@ -10,6 +10,7 @@ SECTION = "devel"
 DEPENDS = "bison-native flex-native"
 
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
+           file://autoconf-2.73.patch \
            file://add-with-bisonlocaledir.patch \
            "
 SRC_URI[sha256sum] = "9bba0214ccf7f1079c5d59210045227bcf619519840ebfa80cd3849cff5a5bf2"
diff --git a/meta/recipes-extended/findutils/findutils.inc b/meta/recipes-extended/findutils/findutils.inc
index ddcc05750b..03cf2a8d72 100644
--- a/meta/recipes-extended/findutils/findutils.inc
+++ b/meta/recipes-extended/findutils/findutils.inc
@@ -7,6 +7,7 @@ BUGTRACKER = "http://savannah.gnu.org/bugs/?group=findutils"
 SECTION = "console/utils"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.xz \
+          file://autoconf-2.73.patch \
           file://run-ptest \
           "
 
diff --git a/meta/recipes-extended/findutils/findutils/autoconf-2.73.patch b/meta/recipes-extended/findutils/findutils/autoconf-2.73.patch
new file mode 100644
index 0000000000..2247ebe5b2
--- /dev/null
+++ b/meta/recipes-extended/findutils/findutils/autoconf-2.73.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Inappropriate
+
+Index: findutils-4.9.0/gl/m4/largefile.m4
+===================================================================
+--- findutils-4.9.0.orig/gl/m4/largefile.m4
++++ findutils-4.9.0/gl/m4/largefile.m4
+@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
+ # with _TIME_BITS.  Also, work around a problem in autoconf <= 2.69:
+ # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
+ # or configures them incorrectly in some cases.
+-m4_version_prereq([2.70], [], [
++m4_version_prereq([2.73], [], [
+ 
+ # _AC_SYS_LARGEFILE_TEST_INCLUDES
+ # -------------------------------
diff --git a/meta/recipes-extended/gzip/gzip-1.12/autoconf-2.73.patch b/meta/recipes-extended/gzip/gzip-1.12/autoconf-2.73.patch
new file mode 100644
index 0000000000..8c77d50e0a
--- /dev/null
+++ b/meta/recipes-extended/gzip/gzip-1.12/autoconf-2.73.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Inappropriate
+
+Index: findutils-4.9.0/gl/m4/largefile.m4
+===================================================================
+--- findutils-4.9.0.orig/m4/largefile.m4
++++ findutils-4.9.0/m4/largefile.m4
+@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
+ # with _TIME_BITS.  Also, work around a problem in autoconf <= 2.69:
+ # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
+ # or configures them incorrectly in some cases.
+-m4_version_prereq([2.70], [], [
++m4_version_prereq([2.73], [], [
+ 
+ # _AC_SYS_LARGEFILE_TEST_INCLUDES
+ # -------------------------------
diff --git a/meta/recipes-extended/gzip/gzip_1.12.bb b/meta/recipes-extended/gzip/gzip_1.12.bb
index 14de50b230..35eb7c4da2 100644
--- a/meta/recipes-extended/gzip/gzip_1.12.bb
+++ b/meta/recipes-extended/gzip/gzip_1.12.bb
@@ -5,6 +5,7 @@ require gzip.inc
 LICENSE = "GPL-3.0-or-later"
 
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
+           file://autoconf-2.73.patch \
            file://run-ptest \
           "
 SRC_URI:append:class-target = " file://wrong-path-fix.patch"
diff --git a/meta/recipes-extended/libarchive/libarchive/configurehack.patch b/meta/recipes-extended/libarchive/libarchive/configurehack.patch
new file mode 100644
index 0000000000..991ec92f05
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/configurehack.patch
@@ -0,0 +1,45 @@
+Upstream-Status: Pending
+Index: libarchive-3.6.2/configure.ac
+===================================================================
+--- libarchive-3.6.2.orig/configure.ac
++++ libarchive-3.6.2/configure.ac
+@@ -357,6 +357,19 @@ if test "x$with_bz2lib" != "xno"; then
+   esac
+ fi
+ 
++# Checks for typedefs, structures, and compiler characteristics.
++AC_C_CONST
++# la_TYPE_UID_T defaults to "int", which is incorrect for MinGW
++# and MSVC. Use a customized version.
++la_TYPE_UID_T
++AC_TYPE_MODE_T
++# AC_TYPE_OFF_T defaults to "long", which limits us to 4GB files on
++# most systems... default to "long long" instead.
++AC_CHECK_TYPE(off_t, [long long])
++AC_TYPE_SIZE_T
++AC_CHECK_TYPE(id_t, [unsigned long])
++AC_CHECK_TYPE(uintptr_t, [unsigned int])
++
+ AC_ARG_WITH([libb2],
+   AS_HELP_STRING([--without-libb2], [Don't build support for BLAKE2 through libb2]))
+ 
+@@ -558,19 +571,6 @@ LDFLAGS=$save_LDFLAGS
+ 
+ AC_SUBST(GC_SECTIONS)
+ 
+-# Checks for typedefs, structures, and compiler characteristics.
+-AC_C_CONST
+-# la_TYPE_UID_T defaults to "int", which is incorrect for MinGW
+-# and MSVC. Use a customized version.
+-la_TYPE_UID_T
+-AC_TYPE_MODE_T
+-# AC_TYPE_OFF_T defaults to "long", which limits us to 4GB files on
+-# most systems... default to "long long" instead.
+-AC_CHECK_TYPE(off_t, [long long])
+-AC_TYPE_SIZE_T
+-AC_CHECK_TYPE(id_t, [unsigned long])
+-AC_CHECK_TYPE(uintptr_t, [unsigned int])
+-
+ # Check for tm_gmtoff in struct tm
+ AC_CHECK_MEMBERS([struct tm.tm_gmtoff, struct tm.__tm_gmtoff],,,
+ [
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index e98558a486..b3ba29135b 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -33,6 +33,7 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
+SRC_URI += "file://configurehack.patch"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
 SRC_URI[sha256sum] = "ba6d02f15ba04aba9c23fd5f236bb234eab9d5209e95d1c4df85c44d5f19b9b3"
diff --git a/meta/recipes-extended/libpipeline/libpipeline/autoconf-2.73.patch b/meta/recipes-extended/libpipeline/libpipeline/autoconf-2.73.patch
new file mode 100644
index 0000000000..2247ebe5b2
--- /dev/null
+++ b/meta/recipes-extended/libpipeline/libpipeline/autoconf-2.73.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Inappropriate
+
+Index: findutils-4.9.0/gl/m4/largefile.m4
+===================================================================
+--- findutils-4.9.0.orig/gl/m4/largefile.m4
++++ findutils-4.9.0/gl/m4/largefile.m4
+@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
+ # with _TIME_BITS.  Also, work around a problem in autoconf <= 2.69:
+ # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
+ # or configures them incorrectly in some cases.
+-m4_version_prereq([2.70], [], [
++m4_version_prereq([2.73], [], [
+ 
+ # _AC_SYS_LARGEFILE_TEST_INCLUDES
+ # -------------------------------
diff --git a/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb b/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb
index 73c7aaaa91..7e3f13ebde 100644
--- a/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb
+++ b/meta/recipes-extended/libpipeline/libpipeline_1.5.7.bb
@@ -7,6 +7,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/libpipeline/libpipeline-${PV}.tar.gz"
+SRC_URI += "file://autoconf-2.73.patch"
 SRC_URI[sha256sum] = "b8b45194989022a79ec1317f64a2a75b1551b2a55bea06f67704cb2a2e4690b0"
 
 inherit pkgconfig autotools
diff --git a/meta/recipes-extended/man-db/files/autoconf-2.73.patch b/meta/recipes-extended/man-db/files/autoconf-2.73.patch
new file mode 100644
index 0000000000..2247ebe5b2
--- /dev/null
+++ b/meta/recipes-extended/man-db/files/autoconf-2.73.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Inappropriate
+
+Index: findutils-4.9.0/gl/m4/largefile.m4
+===================================================================
+--- findutils-4.9.0.orig/gl/m4/largefile.m4
++++ findutils-4.9.0/gl/m4/largefile.m4
+@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
+ # with _TIME_BITS.  Also, work around a problem in autoconf <= 2.69:
+ # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
+ # or configures them incorrectly in some cases.
+-m4_version_prereq([2.70], [], [
++m4_version_prereq([2.73], [], [
+ 
+ # _AC_SYS_LARGEFILE_TEST_INCLUDES
+ # -------------------------------
diff --git a/meta/recipes-extended/man-db/man-db_2.11.2.bb b/meta/recipes-extended/man-db/man-db_2.11.2.bb
index ca0cb1a0e1..3884a531a6 100644
--- a/meta/recipes-extended/man-db/man-db_2.11.2.bb
+++ b/meta/recipes-extended/man-db/man-db_2.11.2.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
            file://0001-man-Move-local-variable-declaration-to-function-scop.patch \
+           file://autoconf-2.73.patch \
            file://man_db.conf-avoid-multilib-install-file-conflict.patch"
 SRC_URI[sha256sum] = "cffa1ee4e974be78646c46508e6dd2f37e7c589aaab2938cc1064f058fef9f8d"
 
diff --git a/meta/recipes-extended/parted/files/autoconf-2.73.patch b/meta/recipes-extended/parted/files/autoconf-2.73.patch
new file mode 100644
index 0000000000..8c77d50e0a
--- /dev/null
+++ b/meta/recipes-extended/parted/files/autoconf-2.73.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Inappropriate
+
+Index: findutils-4.9.0/gl/m4/largefile.m4
+===================================================================
+--- findutils-4.9.0.orig/m4/largefile.m4
++++ findutils-4.9.0/m4/largefile.m4
+@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
+ # with _TIME_BITS.  Also, work around a problem in autoconf <= 2.69:
+ # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
+ # or configures them incorrectly in some cases.
+-m4_version_prereq([2.70], [], [
++m4_version_prereq([2.73], [], [
+ 
+ # _AC_SYS_LARGEFILE_TEST_INCLUDES
+ # -------------------------------
diff --git a/meta/recipes-extended/parted/parted_3.5.bb b/meta/recipes-extended/parted/parted_3.5.bb
index ea2b68bbd8..f403840d3c 100644
--- a/meta/recipes-extended/parted/parted_3.5.bb
+++ b/meta/recipes-extended/parted/parted_3.5.bb
@@ -8,6 +8,7 @@ DEPENDS = "ncurses util-linux virtual/libiconv"
 
 SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://fix-doc-mandir.patch \
+           file://autoconf-2.73.patch \
            file://run-ptest \
            "
 
diff --git a/meta/recipes-extended/wget/wget/autoconf-2.73.patch b/meta/recipes-extended/wget/wget/autoconf-2.73.patch
new file mode 100644
index 0000000000..8c77d50e0a
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/autoconf-2.73.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Inappropriate
+
+Index: findutils-4.9.0/gl/m4/largefile.m4
+===================================================================
+--- findutils-4.9.0.orig/m4/largefile.m4
++++ findutils-4.9.0/m4/largefile.m4
+@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
+ # with _TIME_BITS.  Also, work around a problem in autoconf <= 2.69:
+ # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
+ # or configures them incorrectly in some cases.
+-m4_version_prereq([2.70], [], [
++m4_version_prereq([2.73], [], [
+ 
+ # _AC_SYS_LARGEFILE_TEST_INCLUDES
+ # -------------------------------
diff --git a/meta/recipes-extended/wget/wget_1.21.3.bb b/meta/recipes-extended/wget/wget_1.21.3.bb
index f176a1546c..f55cf69060 100644
--- a/meta/recipes-extended/wget/wget_1.21.3.bb
+++ b/meta/recipes-extended/wget/wget_1.21.3.bb
@@ -1,4 +1,5 @@
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
+           file://autoconf-2.73.patch \
            file://0002-improve-reproducibility.patch \
           "
 
diff --git a/meta/recipes-support/apr/apr/autoconf-2.73.patch b/meta/recipes-support/apr/apr/autoconf-2.73.patch
new file mode 100644
index 0000000000..7ddb7668bd
--- /dev/null
+++ b/meta/recipes-support/apr/apr/autoconf-2.73.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Pending
+
+Index: apr-1.7.2/configure.in
+===================================================================
+--- apr-1.7.2.orig/configure.in
++++ apr-1.7.2/configure.in
+@@ -430,6 +430,8 @@ if test "$host" = "i586-pc-beos"; then
+   ) dnl
+ fi
+ 
++APR_CHECK_DEFINE(LOCK_EX, sys/file.h)
++
+ # this is the place to put specific options for platform/compiler
+ # combinations
+ case "$host:$CC" in
+@@ -2384,7 +2386,6 @@ AC_MSG_RESULT([$msg])
+ AC_SUBST(have_union_semun)
+ 
+ dnl Checks for libraries.
+-APR_CHECK_DEFINE(LOCK_EX, sys/file.h)
+ APR_CHECK_DEFINE(F_SETLK, fcntl.h)
+ APR_CHECK_DEFINE(SEM_UNDO, sys/sem.h)
+ 
diff --git a/meta/recipes-support/apr/apr_1.7.3.bb b/meta/recipes-support/apr/apr_1.7.3.bb
index 9a93fe0967..d0a9225920 100644
--- a/meta/recipes-support/apr/apr_1.7.3.bb
+++ b/meta/recipes-support/apr/apr_1.7.3.bb
@@ -22,6 +22,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://libtoolize_check.patch \
            file://0001-Add-option-to-disable-timed-dependant-tests.patch \
            file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch \
+           file://autoconf-2.73.patch \
            "
 
 SRC_URI[sha256sum] = "455e218c060c474f2c834816873f6ed69c0cf0e4cfee54282cc93e8e989ee59e"
-- 
2.40.0


