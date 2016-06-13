Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7EC356FF01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 09:16:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5D9GkBW026860
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Jun 2016 02:16:47 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 13 Jun 2016 02:16:46 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 13 Jun 2016 05:16:30 -0400
Message-ID: <1ec45afd4bb40faee1adf369a958c4fe28e997b1.1465808701.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1465808701.git.hongxu.jia@windriver.com>
References: <cover.1465808701.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/10] libgcrypt: upgrade to 1.7.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Jun 2016 09:16:46 -0000
Content-Type: text/plain

- Add fix-undefined-reference-to-pthread.patch to fix undefined
  reference to `pthread_create'

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libgcrypt/files/add-pkgconfig-support.patch    | 140 ++++++++++++---------
 .../files/fix-undefined-reference-to-pthread.patch |  27 ++++
 meta/recipes-support/libgcrypt/libgcrypt.inc       |   1 +
 meta/recipes-support/libgcrypt/libgcrypt_1.6.5.bb  |   4 -
 meta/recipes-support/libgcrypt/libgcrypt_1.7.0.bb  |   4 +
 5 files changed, 115 insertions(+), 61 deletions(-)
 create mode 100644 meta/recipes-support/libgcrypt/files/fix-undefined-reference-to-pthread.patch
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.6.5.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.7.0.bb

diff --git a/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch b/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch
index 67ddfc6..69589f5 100644
--- a/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch
+++ b/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch
@@ -4,61 +4,32 @@ Upstream-Status: Denied [upstream have indicated they don't want a pkg-config de
 
 RP 2014/5/22
 
-Index: libgcrypt-1.2.4/configure.ac
-===================================================================
---- libgcrypt-1.2.4.orig/configure.ac	2008-03-19 22:14:50.000000000 +0000
-+++ libgcrypt-1.2.4/configure.ac	2008-03-19 22:14:58.000000000 +0000
-@@ -807,6 +807,7 @@
+Rebase to 1.7.0
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac        |  1 +
+ src/libgcrypt.m4    | 71 +++--------------------------------------------------
+ src/libgcrypt.pc.in | 33 +++++++++++++++++++++++++
+ 3 files changed, 38 insertions(+), 67 deletions(-)
+ create mode 100644 src/libgcrypt.pc.in
+
+diff --git a/configure.ac b/configure.ac
+index f683e21..566e1c8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2314,6 +2314,7 @@ random/Makefile
  doc/Makefile
  src/Makefile
  src/gcrypt.h
 +src/libgcrypt.pc
  src/libgcrypt-config
+ src/versioninfo.rc
  tests/Makefile
- w32-dll/Makefile
-Index: libgcrypt-1.2.4/src/libgcrypt.pc.in
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ libgcrypt-1.2.4/src/libgcrypt.pc.in	2008-03-19 22:14:58.000000000 +0000
-@@ -0,0 +1,33 @@
-+# Process this file with autoconf to produce a pkg-config metadata file.
-+# Copyright (C) 2002, 2003, 2004, 2005, 2006 Free Software Foundation
-+# Author: Simon Josefsson
-+#
-+# This file is free software; as a special exception the author gives
-+# unlimited permission to copy and/or distribute it, with or without
-+# modifications, as long as this notice is preserved.
-+#
-+# This file is distributed in the hope that it will be useful, but
-+# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
-+# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
-+
-+prefix=@prefix@
-+exec_prefix=@exec_prefix@
-+libdir=@libdir@
-+includedir=@includedir@
-+
-+# API info
-+api_version=@LIBGCRYPT_CONFIG_API_VERSION@
-+host=@LIBGCRYPT_CONFIG_HOST@
-+
-+# Misc information.
-+symmetric_ciphers=@LIBGCRYPT_CIPHERS@
-+asymmetric_ciphers=@LIBGCRYPT_PUBKEY_CIPHERS@
-+digests=@LIBGCRYPT_DIGESTS@
-+
-+Name: libgcrypt
-+Description: GNU crypto library
-+URL: http://www.gnupg.org
-+Version: @VERSION@
-+Libs: -L${libdir} -lgcrypt
-+Libs.private: -L${libdir} -lgpg-error
-+Cflags: -I${includedir} 
-Index: libgcrypt-1.6.1/src/libgcrypt.m4
-===================================================================
---- libgcrypt-1.6.1.orig/src/libgcrypt.m4	2013-12-16 17:44:32.000000000 +0000
-+++ libgcrypt-1.6.1/src/libgcrypt.m4	2014-05-13 21:25:37.478389833 +0000
-@@ -22,17 +22,7 @@
+diff --git a/src/libgcrypt.m4 b/src/libgcrypt.m4
+index c67cfec..4ea5f2c 100644
+--- a/src/libgcrypt.m4
++++ b/src/libgcrypt.m4
+@@ -29,30 +29,6 @@ dnl is added to the gpg_config_script_warn variable.
  dnl
  AC_DEFUN([AM_PATH_LIBGCRYPT],
  [ AC_REQUIRE([AC_CANONICAL_HOST])
@@ -66,17 +37,30 @@ Index: libgcrypt-1.6.1/src/libgcrypt.m4
 -            AC_HELP_STRING([--with-libgcrypt-prefix=PFX],
 -                           [prefix where LIBGCRYPT is installed (optional)]),
 -     libgcrypt_config_prefix="$withval", libgcrypt_config_prefix="")
--  if test x$libgcrypt_config_prefix != x ; then
--     if test x${LIBGCRYPT_CONFIG+set} != xset ; then
--        LIBGCRYPT_CONFIG=$libgcrypt_config_prefix/bin/libgcrypt-config
+-  if test x"${LIBGCRYPT_CONFIG}" = x ; then
+-     if test x"${libgcrypt_config_prefix}" != x ; then
+-        LIBGCRYPT_CONFIG="${libgcrypt_config_prefix}/bin/libgcrypt-config"
+-     else
+-       case "${SYSROOT}" in
+-         /*)
+-           if test -x "${SYSROOT}/bin/libgcrypt-config" ; then
+-             LIBGCRYPT_CONFIG="${SYSROOT}/bin/libgcrypt-config"
+-           fi
+-           ;;
+-         '')
+-           ;;
+-          *)
+-           AC_MSG_WARN([Ignoring \$SYSROOT as it is not an absolute path.])
+-           ;;
+-       esac
 -     fi
 -  fi
- 
--  AC_PATH_TOOL(LIBGCRYPT_CONFIG, libgcrypt-config, no)
+-
+-  AC_PATH_PROG(LIBGCRYPT_CONFIG, libgcrypt-config, no)
    tmp=ifelse([$1], ,1:1.2.0,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
       req_libgcrypt_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
-@@ -42,48 +32,13 @@
+@@ -62,48 +38,13 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
       min_libgcrypt_version="$tmp"
    fi
  
@@ -128,7 +112,7 @@ Index: libgcrypt-1.6.1/src/libgcrypt.m4
          if test "$tmp" -gt 0 ; then
             AC_MSG_CHECKING([LIBGCRYPT API version])
             if test "$req_libgcrypt_api" -eq "$tmp" ; then
-@@ -96,10 +51,8 @@
+@@ -116,10 +57,8 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
       fi
    fi
    if test $ok = yes; then
@@ -140,7 +124,7 @@ Index: libgcrypt-1.6.1/src/libgcrypt.m4
      if test x"$libgcrypt_config_host" != xnone ; then
        if test x"$libgcrypt_config_host" != x"$host" ; then
    AC_MSG_WARN([[
-@@ -113,8 +66,6 @@
+@@ -134,8 +73,6 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
        fi
      fi
    else
@@ -149,3 +133,45 @@ Index: libgcrypt-1.6.1/src/libgcrypt.m4
      ifelse([$3], , :, [$3])
    fi
    AC_SUBST(LIBGCRYPT_CFLAGS)
+diff --git a/src/libgcrypt.pc.in b/src/libgcrypt.pc.in
+new file mode 100644
+index 0000000..2fc8f53
+--- /dev/null
++++ b/src/libgcrypt.pc.in
+@@ -0,0 +1,33 @@
++# Process this file with autoconf to produce a pkg-config metadata file.
++# Copyright (C) 2002, 2003, 2004, 2005, 2006 Free Software Foundation
++# Author: Simon Josefsson
++#
++# This file is free software; as a special exception the author gives
++# unlimited permission to copy and/or distribute it, with or without
++# modifications, as long as this notice is preserved.
++#
++# This file is distributed in the hope that it will be useful, but
++# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
++# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
++
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@
++
++# API info
++api_version=@LIBGCRYPT_CONFIG_API_VERSION@
++host=@LIBGCRYPT_CONFIG_HOST@
++
++# Misc information.
++symmetric_ciphers=@LIBGCRYPT_CIPHERS@
++asymmetric_ciphers=@LIBGCRYPT_PUBKEY_CIPHERS@
++digests=@LIBGCRYPT_DIGESTS@
++
++Name: libgcrypt
++Description: GNU crypto library
++URL: http://www.gnupg.org
++Version: @VERSION@
++Libs: -L${libdir} -lgcrypt
++Libs.private: -L${libdir} -lgpg-error
++Cflags: -I${includedir} 
+-- 
+2.8.1
+
diff --git a/meta/recipes-support/libgcrypt/files/fix-undefined-reference-to-pthread.patch b/meta/recipes-support/libgcrypt/files/fix-undefined-reference-to-pthread.patch
new file mode 100644
index 0000000..e7de8ba
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/fix-undefined-reference-to-pthread.patch
@@ -0,0 +1,27 @@
+From cc0e2b403d33892963513a3ba98e4ae5a05a4d3c Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sun, 12 Jun 2016 04:44:29 -0400
+Subject: [PATCH] tests/Makefile.am: fix undefined reference to `pthread_create'
+
+Add missing '-lpthread' to CFLAGS
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ tests/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index d462f30..bef6dd7 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -62,4 +62,4 @@ EXTRA_DIST = README rsa-16k.key cavs_tests.sh cavs_driver.pl \
+ 
+ LDADD = $(standard_ldadd) $(GPG_ERROR_LIBS)
+ t_lock_LDADD = $(standard_ldadd) $(GPG_ERROR_MT_LIBS)
+-t_lock_CFLAGS = $(GPG_ERROR_MT_CFLAGS)
++t_lock_CFLAGS = $(GPG_ERROR_MT_CFLAGS) -lpthread
+-- 
+2.8.1
+
diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index a4f3cd0..15805cd 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -19,6 +19,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.gz \
            file://add-pkgconfig-support.patch \
            file://libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://fix-ICE-failure-on-mips-with-option-O-and-g.patch \
+           file://fix-undefined-reference-to-pthread.patch \
 "
 
 BINCONFIG = "${bindir}/libgcrypt-config"
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.6.5.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.6.5.bb
deleted file mode 100644
index 717a23f..0000000
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.6.5.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require libgcrypt.inc
-
-SRC_URI[md5sum] = "f24fcb684932d4b5ed85f2f05cb1d9f8"
-SRC_URI[sha256sum] = "202bf109ccf2d614565c849f3e5687b94cde972167b35261e094252367627bc6"
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.7.0.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.7.0.bb
new file mode 100644
index 0000000..37637f6
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.7.0.bb
@@ -0,0 +1,4 @@
+require libgcrypt.inc
+
+SRC_URI[md5sum] = "0a4d2d94b69832c780599f38280b2450"
+SRC_URI[sha256sum] = "07f88053ac9f7cfd35c2d404954b1e370818b757fd202ef2a5d4f398c11b7b06"
-- 
2.8.1


