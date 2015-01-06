Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9E081728C3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 15:42:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 06 Jan 2015 07:39:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="508183812"
Received: from unknown (HELO localhost.intel.com) ([10.252.252.96])
	by orsmga003.jf.intel.com with ESMTP; 06 Jan 2015 07:36:50 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jan 2015 07:42:12 -0800
Message-Id: <40d49cebfa03fec4f06f7821bf3386a8e2a0781d.1420558836.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
In-Reply-To: <cover.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
Subject: [PATCH 02/12] gnupg: Upgrade to 2.1.0
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
X-List-Received-Date: Tue, 06 Jan 2015 15:42:30 -0000

Add patch to use pkg-config instead of npth-config and remove
--without-curl as it's not used anymore.

Also needed a patch to add libgpg-error to correctly build dirmngr

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gnupg/gnupg/dirmngr-uses-libgpg-error.patch    | 16 +++++
 meta/recipes-support/gnupg/gnupg/pkgconfig.patch   | 24 +++++---
 .../use-pkgconfig-instead-of-npth-config.patch     | 72 ++++++++++++++++++++++
 .../gnupg/{gnupg_2.0.26.bb => gnupg_2.1.0.bb}      | 16 ++---
 4 files changed, 111 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg/dirmngr-uses-libgpg-error.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/use-pkgconfig-instead-of-npth-config.patch
 rename meta/recipes-support/gnupg/{gnupg_2.0.26.bb => gnupg_2.1.0.bb} (70%)

diff --git a/meta/recipes-support/gnupg/gnupg/dirmngr-uses-libgpg-error.patch b/meta/recipes-support/gnupg/gnupg/dirmngr-uses-libgpg-error.patch
new file mode 100644
index 0000000..3dc506c
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/dirmngr-uses-libgpg-error.patch
@@ -0,0 +1,16 @@
+Upstream-Status: Pending
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+Index: gnupg-2.1.0/dirmngr/Makefile.am
+===================================================================
+--- gnupg-2.1.0.orig/dirmngr/Makefile.am
++++ gnupg-2.1.0/dirmngr/Makefile.am
+@@ -71,7 +71,8 @@ endif
+ dirmngr_LDADD = $(libcommontlsnpth) $(libcommonpth) \
+         ../gl/libgnu.a $(DNSLIBS) $(LIBASSUAN_LIBS) \
+ 	$(LIBGCRYPT_LIBS) $(KSBA_LIBS) $(NPTH_LIBS) \
+-	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV)
++	$(NTBTLS_LIBS) $(LIBGNUTLS_LIBS) $(LIBINTL) $(LIBICONV) \
++        $(GPG_ERROR_LIBS)
+ if !USE_LDAPWRAPPER
+ dirmngr_LDADD += $(ldaplibs)
+ endif
diff --git a/meta/recipes-support/gnupg/gnupg/pkgconfig.patch b/meta/recipes-support/gnupg/gnupg/pkgconfig.patch
index ae92392..5e036ba 100644
--- a/meta/recipes-support/gnupg/gnupg/pkgconfig.patch
+++ b/meta/recipes-support/gnupg/gnupg/pkgconfig.patch
@@ -5,11 +5,11 @@ Upstream-Status: Rejected
 
 RP 2014/5/22
 
-Index: gnupg-2.0.22/m4/gnupg-pth.m4
+Index: gnupg-2.1.0/m4/gnupg-pth.m4
 ===================================================================
---- gnupg-2.0.22.orig/m4/gnupg-pth.m4	2013-10-04 12:32:53.000000000 +0000
-+++ gnupg-2.0.22/m4/gnupg-pth.m4	2014-05-13 21:33:21.000000000 +0000
-@@ -17,33 +17,9 @@
+--- gnupg-2.1.0.orig/m4/gnupg-pth.m4
++++ gnupg-2.1.0/m4/gnupg-pth.m4
+@@ -17,33 +17,9 @@ dnl implied warranty of MERCHANTABILITY
  # Taken and modified from the m4 macros which come with Pth.
  AC_DEFUN([GNUPG_PTH_VERSION_CHECK],
    [
@@ -44,7 +44,7 @@ Index: gnupg-2.0.22/m4/gnupg-pth.m4
      if test $have_pth = yes; then
         AC_MSG_RESULT(yes)
         AC_MSG_CHECKING([whether PTH installation is sane])
-@@ -51,9 +29,9 @@
+@@ -51,9 +27,9 @@ AC_DEFUN([GNUPG_PTH_VERSION_CHECK],
           _gnupg_pth_save_cflags=$CFLAGS
           _gnupg_pth_save_ldflags=$LDFLAGS
           _gnupg_pth_save_libs=$LIBS
@@ -57,30 +57,34 @@ Index: gnupg-2.0.22/m4/gnupg-pth.m4
           AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <pth.h>
                                           ],
                                           [[ pth_init ();]])],
-@@ -81,23 +59,11 @@
+@@ -80,26 +56,13 @@ AC_DEFUN([GNUPG_PTH_VERSION_CHECK],
+ # PTH_CLFAGS and PTH_LIBS are AS_SUBST.
  #
  AC_DEFUN([GNUPG_PATH_PTH],
-+[
 -[ AC_ARG_WITH(pth-prefix,
 -             AC_HELP_STRING([--with-pth-prefix=PFX],
--                           [prefix where GNU Pth is installed]),
+-                           [prefix where GNU Pth is installed (optional)]),
 -     pth_config_prefix="$withval", pth_config_prefix="")
 -  if test x$pth_config_prefix != x ; then
 -     PTH_CONFIG="$pth_config_prefix/bin/pth-config"
 -  fi
 -  AC_PATH_PROG(PTH_CONFIG, pth-config, no)
++[
    tmp=ifelse([$1], ,1.3.7,$1)
 -  if test "$PTH_CONFIG" != "no"; then
 -    GNUPG_PTH_VERSION_CHECK($tmp)
--    if test $have_pth = yes; then
+-    if test $have_pth = yes; then      
 -       PTH_CFLAGS=`$PTH_CONFIG --cflags`
 -       PTH_LIBS=`$PTH_CONFIG --ldflags`
 -       PTH_LIBS="$PTH_LIBS `$PTH_CONFIG --libs --all`"
+-       AC_DEFINE(HAVE_PTH, 1,
 +  GNUPG_PTH_VERSION_CHECK($tmp)
 +  if test $have_pth = yes; then
-        AC_DEFINE(HAVE_PTH, 1,
++      AC_DEFINE(HAVE_PTH, 1,
                  [Defined if the GNU Pth is available])
 -    fi
    fi
    AC_SUBST(PTH_CFLAGS)
    AC_SUBST(PTH_LIBS)
+ ])
+-
diff --git a/meta/recipes-support/gnupg/gnupg/use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/use-pkgconfig-instead-of-npth-config.patch
new file mode 100644
index 0000000..c6dbf1b
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/use-pkgconfig-instead-of-npth-config.patch
@@ -0,0 +1,72 @@
+Upstream-Status: Inappropriate [openembedded specific]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+
+Index: gnupg-2.1.0/m4/npth.m4
+===================================================================
+--- gnupg-2.1.0.orig/m4/npth.m4
++++ gnupg-2.1.0/m4/npth.m4
+@@ -17,10 +17,10 @@ AC_DEFUN([_AM_PATH_NPTH_CONFIG],
+   if test "x$npth_config_prefix" != x ; then
+       NPTH_CONFIG="$npth_config_prefix/bin/npth-config"
+   fi
+-  AC_PATH_PROG(NPTH_CONFIG, npth-config, no)
++  AC_PATH_PROG(PKGCONFIG, pkg-config, no)
+ 
+-  if test "$NPTH_CONFIG" != "no" ; then
+-    npth_version=`$NPTH_CONFIG --version`
++  if test "$PKGCONFIG" != "no" ; then
++    npth_version=`$PKGCONFIG --modversion npth`
+   fi
+   npth_version_major=`echo $npth_version | \
+                sed 's/\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
+@@ -45,7 +45,7 @@ AC_DEFUN([AM_PATH_NPTH],
+ 
+   AC_MSG_CHECKING(for NPTH - version >= $min_npth_version)
+   ok=no
+-  if test "$NPTH_CONFIG" != "no" ; then
++  if test "$PKGCONFIG" != "no" ; then
+     req_major=`echo $min_npth_version | \
+                sed 's/\([[0-9]]*\)\.\([[0-9]]*\)/\1/'`
+     req_minor=`echo $min_npth_version | \
+@@ -66,28 +66,9 @@ AC_DEFUN([AM_PATH_NPTH],
+   fi
+   if test $ok = yes; then
+     AC_MSG_RESULT([yes ($npth_version)])
+-  else
+-    AC_MSG_RESULT(no)
+-  fi
+-  if test $ok = yes; then
+-     # If we have a recent NPTH, we should also check that the
+-     # API is compatible.
+-     if test "$req_npth_api" -gt 0 ; then
+-        tmp=`$NPTH_CONFIG --api-version 2>/dev/null || echo 0`
+-        if test "$tmp" -gt 0 ; then
+-           AC_MSG_CHECKING([NPTH API version])
+-           if test "$req_npth_api" -eq "$tmp" ; then
+-             AC_MSG_RESULT([okay])
+-           else
+-             ok=no
+-             AC_MSG_RESULT([does not match. want=$req_npth_api got=$tmp])
+-           fi
+-        fi
+-     fi
+-  fi
+-  if test $ok = yes; then
+-    NPTH_CFLAGS=`$NPTH_CONFIG --cflags`
+-    NPTH_LIBS=`$NPTH_CONFIG --libs`
++    NPTH_CFLAGS=`$PKGCONFIG --cflags npth`
++    NPTH_LIBS=`$PKGCONFIG --libs npth`
++    AC_MSG_WARN([[GOT HERE - $NPTH_LIBS ]])
+     ifelse([$2], , :, [$2])
+     npth_config_host=`$NPTH_CONFIG --host 2>/dev/null || echo none`
+     if test x"$npth_config_host" != xnone ; then
+@@ -103,6 +84,7 @@ AC_DEFUN([AM_PATH_NPTH],
+       fi
+     fi
+   else
++    AC_MSG_RESULT(no)
+     NPTH_CFLAGS=""
+     NPTH_LIBS=""
+     ifelse([$3], , :, [$3])
diff --git a/meta/recipes-support/gnupg/gnupg_2.0.26.bb b/meta/recipes-support/gnupg/gnupg_2.1.0.bb
similarity index 70%
rename from meta/recipes-support/gnupg/gnupg_2.0.26.bb
rename to meta/recipes-support/gnupg/gnupg_2.1.0.bb
index 92dd3bd..e9ade3b 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.26.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.1.0.bb
@@ -4,21 +4,21 @@ LICENSE = "GPLv3 & LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
 
-DEPENDS = "${PTH} libassuan libksba zlib bzip2 readline libgcrypt"
-PTH = "pth"
-PTH_libc-uclibc = "npth"
+DEPENDS = "npth libassuan libksba zlib bzip2 readline libgcrypt"
 
 inherit autotools gettext texinfo pkgconfig
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://pkgconfig.patch"
+           file://pkgconfig.patch \
+           file://use-pkgconfig-instead-of-npth-config.patch \
+           file://dirmngr-uses-libgpg-error.patch \
+          "
 
-SRC_URI[md5sum] = "fa7e704aad33eb114d1840164455aec1"
-SRC_URI[sha256sum] = "7758e30dc382ae7a7167ed41b7f936aa50af5ea2d6fccdef663b5b750b65b8e0"
+SRC_URI[md5sum] = "43a809789a1d897f4386680be0b09d02"
+SRC_URI[sha256sum] = "16a8c3f50a15bf37d2dfb1c5e4bb3ec533e1d0b6a4043ff3680a376a3ad4058b"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-                --without-libcurl \
 		--with-zlib=${STAGING_LIBDIR}/.. \
 		--with-bzip2=${STAGING_LIBDIR}/.. \
                 --with-readline=${STAGING_LIBDIR}/.. \
@@ -37,3 +37,5 @@ do_install_append() {
 	ln -sf gpg2 ${D}${bindir}/gpg
 	ln -sf gpgv2 ${D}${bindir}/gpgv
 }
+
+RDEPENDS_${PN} = "gnutls"
-- 
2.1.0


