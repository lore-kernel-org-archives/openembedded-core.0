Return-Path: <tgamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 46FA97FA2B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 16:42:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9TGgPHR022752
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Oct 2019 09:42:25 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 29 Oct 2019 09:42:24 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 20958)	id B018DC610ED;
	Tue, 29 Oct 2019 09:42:24 -0700 (PDT)
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Oct 2019 09:42:21 -0700
Message-ID: <20191029164221.104684-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH v2] libgcrypt: upgrade 1.8.4 -> 1.8.5
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
X-List-Received-Date: Tue, 29 Oct 2019 16:42:28 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Upgrade libgcrypt. Upstream repo now has a pkg-config
feature. The new patch for compatibility with oe-core
is a replacement for a patch that added pkg-config as
a feature when upstream did not have it.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...gcrypt-modify-pkgconfig-for-oe-core.patch} | 110 +++++++++---------
 ...{libgcrypt_1.8.4.bb => libgcrypt_1.8.5.bb} |   6 +-
 2 files changed, 60 insertions(+), 56 deletions(-)
 rename meta/recipes-support/libgcrypt/files/{0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch => 0001-libgcrypt-modify-pkgconfig-for-oe-core.patch} (67%)
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.8.4.bb => libgcrypt_1.8.5.bb} (90%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-modify-pkgconfig-for-oe-core.patch
similarity index 67%
rename from meta/recipes-support/libgcrypt/files/0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch
rename to meta/recipes-support/libgcrypt/files/0001-libgcrypt-modify-pkgconfig-for-oe-core.patch
index d41c3de3b6..516d85e138 100644
--- a/meta/recipes-support/libgcrypt/files/0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-libgcrypt-modify-pkgconfig-for-oe-core.patch
@@ -1,41 +1,23 @@
-From 72b9e9040d58c15f0302bd8abda28179f04e1c5f Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Wed, 16 Aug 2017 10:43:18 +0800
-Subject: [PATCH 1/4] Add and use pkg-config for libgcrypt instead of -config
- scripts.
+From b8be2c0d782886a7305fff8af50542d6c92dbb74 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Tue, 29 Oct 2019 08:31:41 -0400
+Subject: [PATCH] libgcrypt-fix-pkgconfig-for-oe-core
 
-Upstream-Status: Denied [upstream have indicated they don't want a
-pkg-config dependency]
+Modify libgcrypt pkgconfig specifically for oe-core. Changes
+are based on a previous patch from RP, using wiggle to 
+incorporate the parts that aren't in the upstream pkgconfig
+settings.
 
-RP 2014/5/22
-
-Rebase to 1.8.0
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- configure.ac        |  1 +
- src/libgcrypt.m4    | 71 +++--------------------------------------------------
- src/libgcrypt.pc.in | 33 +++++++++++++++++++++++++
- 3 files changed, 38 insertions(+), 67 deletions(-)
- create mode 100644 src/libgcrypt.pc.in
+ src/libgcrypt.m4    | 90 ++-------------------------------------------
+ src/libgcrypt.pc.in | 33 +++++++++++++++++
+ 2 files changed, 37 insertions(+), 86 deletions(-)
 
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
 diff --git a/src/libgcrypt.m4 b/src/libgcrypt.m4
-index c67cfec..4ea5f2c 100644
+index 37dfbea2..3d2e90a8 100644
 --- a/src/libgcrypt.m4
 +++ b/src/libgcrypt.m4
-@@ -29,30 +29,6 @@ dnl is added to the gpg_config_script_warn variable.
+@@ -29,41 +29,6 @@ dnl is added to the gpg_config_script_warn variable.
  dnl
  AC_DEFUN([AM_PATH_LIBGCRYPT],
  [ AC_REQUIRE([AC_CANONICAL_HOST])
@@ -46,8 +28,20 @@ index c67cfec..4ea5f2c 100644
 -  if test x"${LIBGCRYPT_CONFIG}" = x ; then
 -     if test x"${libgcrypt_config_prefix}" != x ; then
 -        LIBGCRYPT_CONFIG="${libgcrypt_config_prefix}/bin/libgcrypt-config"
--     else
--       case "${SYSROOT}" in
+-     fi
+-  fi
+-
+-  use_gpgrt_config=""
+-  if test x"${LIBGCRYPT_CONFIG}" = x -a x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-    if $GPGRT_CONFIG libgcrypt --exists; then
+-      LIBGCRYPT_CONFIG="$GPGRT_CONFIG libgcrypt"
+-      AC_MSG_NOTICE([Use gpgrt-config as libgcrypt-config])
+-      use_gpgrt_config=yes
+-    fi
+-  fi
+-  if test -z "$use_gpgrt_config"; then
+-    if test x"${LIBGCRYPT_CONFIG}" = x ; then
+-      case "${SYSROOT}" in
 -         /*)
 -           if test -x "${SYSROOT}/bin/libgcrypt-config" ; then
 -             LIBGCRYPT_CONFIG="${SYSROOT}/bin/libgcrypt-config"
@@ -58,15 +52,14 @@ index c67cfec..4ea5f2c 100644
 -          *)
 -           AC_MSG_WARN([Ignoring \$SYSROOT as it is not an absolute path.])
 -           ;;
--       esac
--     fi
+-      esac
+-    fi
+-    AC_PATH_PROG(LIBGCRYPT_CONFIG, libgcrypt-config, no)
 -  fi
--
--  AC_PATH_PROG(LIBGCRYPT_CONFIG, libgcrypt-config, no)
+ 
    tmp=ifelse([$1], ,1:1.2.0,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
-      req_libgcrypt_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
-@@ -62,48 +38,13 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
+@@ -74,56 +39,13 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
       min_libgcrypt_version="$tmp"
    fi
  
@@ -79,7 +72,11 @@ index c67cfec..4ea5f2c 100644
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\2/'`
 -    req_micro=`echo $min_libgcrypt_version | \
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
--    libgcrypt_config_version=`$LIBGCRYPT_CONFIG --version`
+-    if test -z "$use_gpgrt_config"; then
+-      libgcrypt_config_version=`$LIBGCRYPT_CONFIG --version`
+-    else
+-      libgcrypt_config_version=`$LIBGCRYPT_CONFIG --modversion`
+-    fi
 -    major=`echo $libgcrypt_config_version | \
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
 -    minor=`echo $libgcrypt_config_version | \
@@ -113,24 +110,29 @@ index c67cfec..4ea5f2c 100644
       # If we have a recent libgcrypt, we should also check that the
       # API is compatible
       if test "$req_libgcrypt_api" -gt 0 ; then
--        tmp=`$LIBGCRYPT_CONFIG --api-version 2>/dev/null || echo 0`
+-        if test -z "$use_gpgrt_config"; then
+-           tmp=`$LIBGCRYPT_CONFIG --api-version 2>/dev/null || echo 0`
+-	else
+-           tmp=`$LIBGCRYPT_CONFIG --variable=api_version 2>/dev/null || echo 0`
+-	fi
 +        tmp=`$PKG_CONFIG --variable=api_version libgcrypt`
          if test "$tmp" -gt 0 ; then
             AC_MSG_CHECKING([LIBGCRYPT API version])
             if test "$req_libgcrypt_api" -eq "$tmp" ; then
-@@ -116,10 +57,8 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
+@@ -136,11 +58,9 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
       fi
    fi
    if test $ok = yes; then
 -    LIBGCRYPT_CFLAGS=`$LIBGCRYPT_CONFIG --cflags`
 -    LIBGCRYPT_LIBS=`$LIBGCRYPT_CONFIG --libs`
      ifelse([$2], , :, [$2])
--    libgcrypt_config_host=`$LIBGCRYPT_CONFIG --host 2>/dev/null || echo none`
-+    libgcrypt_config_host=`$PKG_CONFIG --variable=host libgcrypt`
-     if test x"$libgcrypt_config_host" != xnone ; then
-       if test x"$libgcrypt_config_host" != x"$host" ; then
-   AC_MSG_WARN([[
-@@ -134,8 +73,6 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
+     if test -z "$use_gpgrt_config"; then
+-      libgcrypt_config_host=`$LIBGCRYPT_CONFIG --host 2>/dev/null || echo none`
++      libgcrypt_config_host=`$PKG_CONFIG --variable=host libgcrypt`
+     else
+       libgcrypt_config_host=`$LIBGCRYPT_CONFIG --variable=host 2>/dev/null || echo none`
+     fi
+@@ -158,8 +78,6 @@ AC_DEFUN([AM_PATH_LIBGCRYPT],
        fi
      fi
    else
@@ -140,11 +142,13 @@ index c67cfec..4ea5f2c 100644
    fi
    AC_SUBST(LIBGCRYPT_CFLAGS)
 diff --git a/src/libgcrypt.pc.in b/src/libgcrypt.pc.in
-new file mode 100644
-index 0000000..2fc8f53
---- /dev/null
+index ec68fa2d..2895382a 100644
+--- a/src/libgcrypt.pc.in
 +++ b/src/libgcrypt.pc.in
-@@ -0,0 +1,33 @@
+@@ -15,3 +15,36 @@ Version: @PACKAGE_VERSION@
+ Cflags: @LIBGCRYPT_CONFIG_CFLAGS@
+ Libs: @LIBGCRYPT_CONFIG_LIBS@
+ URL: https://www.gnupg.org/software/libgcrypt/index.html
 +# Process this file with autoconf to produce a pkg-config metadata file.
 +# Copyright (C) 2002, 2003, 2004, 2005, 2006 Free Software Foundation
 +# Author: Simon Josefsson
@@ -179,5 +183,5 @@ index 0000000..2fc8f53
 +Libs.private: -L${libdir} -lgpg-error
 +Cflags: -I${includedir} 
 -- 
-1.8.3.1
+2.17.1
 
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
similarity index 90%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
index 11d078d44a..5a1a0c2201 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.4.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
@@ -17,7 +17,7 @@ DEPENDS = "libgpg-error"
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
-           file://0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch \
+           file://0001-libgcrypt-modify-pkgconfig-for-oe-core.patch \
            file://0003-tests-bench-slope.c-workaround-ICE-failure-on-mips-w.patch \
            file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://0004-tests-Makefile.am-fix-undefined-reference-to-pthread.patch \
@@ -25,8 +25,8 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://0002-AES-move-look-up-tables-to-.data-section-and-unshare.patch \
            file://0003-GCM-move-look-up-table-to-.data-section-and-unshare-.patch \
 "
-SRC_URI[md5sum] = "fbfdaebbbc6d7e5fbbf6ffdb3e139573"
-SRC_URI[sha256sum] = "f638143a0672628fde0cad745e9b14deb85dffb175709cacc1f4fe24b93f2227"
+SRC_URI[md5sum] = "348cc4601ca34307fc6cd6c945467743"
+SRC_URI[sha256sum] = "3b4a2a94cb637eff5bdebbcaf46f4d95c4f25206f459809339cdada0eb577ac3"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.23.0


