Return-Path: <tgamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8C5A86BCA9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Oct 2019 15:52:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9JFqhFA023501
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Oct 2019 08:52:43 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Sat, 19 Oct 2019 08:52:43 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 20958)	id 17334C60151;
	Sat, 19 Oct 2019 08:52:43 -0700 (PDT)
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 19 Oct 2019 08:52:42 -0700
Message-ID: <20191019155242.100169-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] libgcrypt: upgrade 1.8.4 -> 1.8.5
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
X-List-Received-Date: Sat, 19 Oct 2019 15:52:42 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Note that the patch 0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch
was removed as its intent was to provide a pkg-config option, but
libgcrypt upstream added one in commit 813b002eaf.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...config-for-libgcrypt-instead-of-conf.patch | 183 ------------------
 ...{libgcrypt_1.8.4.bb => libgcrypt_1.8.5.bb} |   5 +-
 2 files changed, 2 insertions(+), 186 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/files/0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.8.4.bb => libgcrypt_1.8.5.bb} (88%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch b/meta/recipes-support/libgcrypt/files/0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch
deleted file mode 100644
index d41c3de3b6..0000000000
--- a/meta/recipes-support/libgcrypt/files/0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch
+++ /dev/null
@@ -1,183 +0,0 @@
-From 72b9e9040d58c15f0302bd8abda28179f04e1c5f Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Wed, 16 Aug 2017 10:43:18 +0800
-Subject: [PATCH 1/4] Add and use pkg-config for libgcrypt instead of -config
- scripts.
-
-Upstream-Status: Denied [upstream have indicated they don't want a
-pkg-config dependency]
-
-RP 2014/5/22
-
-Rebase to 1.8.0
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- configure.ac        |  1 +
- src/libgcrypt.m4    | 71 +++--------------------------------------------------
- src/libgcrypt.pc.in | 33 +++++++++++++++++++++++++
- 3 files changed, 38 insertions(+), 67 deletions(-)
- create mode 100644 src/libgcrypt.pc.in
-
-diff --git a/configure.ac b/configure.ac
-index bbe8104..3d2de73 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2607,6 +2607,7 @@ random/Makefile
- doc/Makefile
- src/Makefile
- src/gcrypt.h
-+src/libgcrypt.pc
- src/libgcrypt-config
- src/versioninfo.rc
- tests/Makefile
-diff --git a/src/libgcrypt.m4 b/src/libgcrypt.m4
-index c67cfec..4ea5f2c 100644
---- a/src/libgcrypt.m4
-+++ b/src/libgcrypt.m4
-@@ -29,30 +29,6 @@ dnl is added to the gpg_config_script_warn variable.
- dnl
- AC_DEFUN([AM_PATH_LIBGCRYPT],
- [ AC_REQUIRE([AC_CANONICAL_HOST])
--  AC_ARG_WITH(libgcrypt-prefix,
--            AC_HELP_STRING([--with-libgcrypt-prefix=PFX],
--                           [prefix where LIBGCRYPT is installed (optional)]),
--     libgcrypt_config_prefix="$withval", libgcrypt_config_prefix="")
--  if test x"${LIBGCRYPT_CONFIG}" = x ; then
--     if test x"${libgcrypt_config_prefix}" != x ; then
--        LIBGCRYPT_CONFIG="${libgcrypt_config_prefix}/bin/libgcrypt-config"
--     else
--       case "${SYSROOT}" in
--         /*)
--           if test -x "${SYSROOT}/bin/libgcrypt-config" ; then
--             LIBGCRYPT_CONFIG="${SYSROOT}/bin/libgcrypt-config"
--           fi
--           ;;
--         '')
--           ;;
--          *)
--           AC_MSG_WARN([Ignoring \$SYSROOT as it is not an absolute path.])
--           ;;
--       esac
--     fi
--  fi
--
--  AC_PATH_PROG(LIBGCRYPT_CONFIG, libgcrypt-config, no)
-   tmp=ifelse([$1], ,1:1.2.0,$1)
-   if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
-      req_libgcrypt_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
-@@ -62,48 +38,13 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
-      min_libgcrypt_version="$tmp"
-   fi
- 
--  AC_MSG_CHECKING(for LIBGCRYPT - version >= $min_libgcrypt_version)
--  ok=no
--  if test "$LIBGCRYPT_CONFIG" != "no" ; then
--    req_major=`echo $min_libgcrypt_version | \
--               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
--    req_minor=`echo $min_libgcrypt_version | \
--               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
--    req_micro=`echo $min_libgcrypt_version | \
--               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
--    libgcrypt_config_version=`$LIBGCRYPT_CONFIG --version`
--    major=`echo $libgcrypt_config_version | \
--               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
--    minor=`echo $libgcrypt_config_version | \
--               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\2/'`
--    micro=`echo $libgcrypt_config_version | \
--               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\3/'`
--    if test "$major" -gt "$req_major"; then
--        ok=yes
--    else
--        if test "$major" -eq "$req_major"; then
--            if test "$minor" -gt "$req_minor"; then
--               ok=yes
--            else
--               if test "$minor" -eq "$req_minor"; then
--                   if test "$micro" -ge "$req_micro"; then
--                     ok=yes
--                   fi
--               fi
--            fi
--        fi
--    fi
--  fi
--  if test $ok = yes; then
--    AC_MSG_RESULT([yes ($libgcrypt_config_version)])
--  else
--    AC_MSG_RESULT(no)
--  fi
-+  PKG_CHECK_MODULES(LIBGCRYPT, [libgcrypt >= $min_libgcrypt_version], [ok=yes], [ok=no])
-+
-   if test $ok = yes; then
-      # If we have a recent libgcrypt, we should also check that the
-      # API is compatible
-      if test "$req_libgcrypt_api" -gt 0 ; then
--        tmp=`$LIBGCRYPT_CONFIG --api-version 2>/dev/null || echo 0`
-+        tmp=`$PKG_CONFIG --variable=api_version libgcrypt`
-         if test "$tmp" -gt 0 ; then
-            AC_MSG_CHECKING([LIBGCRYPT API version])
-            if test "$req_libgcrypt_api" -eq "$tmp" ; then
-@@ -116,10 +57,8 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
-      fi
-   fi
-   if test $ok = yes; then
--    LIBGCRYPT_CFLAGS=`$LIBGCRYPT_CONFIG --cflags`
--    LIBGCRYPT_LIBS=`$LIBGCRYPT_CONFIG --libs`
-     ifelse([$2], , :, [$2])
--    libgcrypt_config_host=`$LIBGCRYPT_CONFIG --host 2>/dev/null || echo none`
-+    libgcrypt_config_host=`$PKG_CONFIG --variable=host libgcrypt`
-     if test x"$libgcrypt_config_host" != xnone ; then
-       if test x"$libgcrypt_config_host" != x"$host" ; then
-   AC_MSG_WARN([[
-@@ -134,8 +73,6 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
-       fi
-     fi
-   else
--    LIBGCRYPT_CFLAGS=""
--    LIBGCRYPT_LIBS=""
-     ifelse([$3], , :, [$3])
-   fi
-   AC_SUBST(LIBGCRYPT_CFLAGS)
-diff --git a/src/libgcrypt.pc.in b/src/libgcrypt.pc.in
-new file mode 100644
-index 0000000..2fc8f53
---- /dev/null
-+++ b/src/libgcrypt.pc.in
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
--- 
-1.8.3.1
-
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
similarity index 88%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
index fda68a2938..e879458806 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
@@ -17,13 +17,12 @@ DEPENDS = "libgpg-error"
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
-           file://0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch \
            file://0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch \
            file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
 "
-SRC_URI[md5sum] = "fbfdaebbbc6d7e5fbbf6ffdb3e139573"
-SRC_URI[sha256sum] = "f638143a0672628fde0cad745e9b14deb85dffb175709cacc1f4fe24b93f2227"
+SRC_URI[md5sum] = "348cc4601ca34307fc6cd6c945467743"
+SRC_URI[sha256sum] = "3b4a2a94cb637eff5bdebbcaf46f4d95c4f25206f459809339cdada0eb577ac3"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.23.0


