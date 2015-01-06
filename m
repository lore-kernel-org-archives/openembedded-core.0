Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 94803601F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 15:42:42 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jan 2015 07:42:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="508183853"
Received: from unknown (HELO localhost.intel.com) ([10.252.252.96])
	by orsmga003.jf.intel.com with ESMTP; 06 Jan 2015 07:37:01 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jan 2015 07:42:22 -0800
Message-Id: <5149fba599906379ad08516e540c8b3e6f467e2f.1420558836.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
In-Reply-To: <cover.1420558836.git.sgw@linux.intel.com>
References: <cover.1420558836.git.sgw@linux.intel.com>
Subject: [PATCH 12/12] libgpg-error: Update to 1.17
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
X-List-Received-Date: Tue, 06 Jan 2015 15:42:42 -0000

Rebased the pkgconfig.patch

Added do_compile_prepend() copy an architecture specific header file.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../pkgconfig.patch                                | 67 ++++++++++++++--------
 .../{libgpg-error_1.12.bb => libgpg-error_1.17.bb} | 35 +++++++++--
 2 files changed, 72 insertions(+), 30 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error-1.12 => libgpg-error}/pkgconfig.patch (70%)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.12.bb => libgpg-error_1.17.bb} (40%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error-1.12/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
similarity index 70%
rename from meta/recipes-support/libgpg-error/libgpg-error-1.12/pkgconfig.patch
rename to meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index 89c9d22..96476ba 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error-1.12/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -5,11 +5,11 @@
 
 Upstream-Status: Pending
 
-Index: libgpg-error-1.12/configure.ac
+Index: libgpg-error-1.17/configure.ac
 ===================================================================
---- libgpg-error-1.12.orig/configure.ac	2014-05-13 21:14:26.846393236 +0000
-+++ libgpg-error-1.12/configure.ac	2014-05-13 21:14:26.926393236 +0000
-@@ -217,6 +217,7 @@
+--- libgpg-error-1.17.orig/configure.ac
++++ libgpg-error-1.17/configure.ac
+@@ -521,6 +521,7 @@ AC_CONFIG_FILES([src/Makefile tests/Make
  AC_CONFIG_FILES([lang/Makefile lang/cl/Makefile lang/cl/gpg-error.asd])
  AC_CONFIG_FILES([src/versioninfo.rc])
  AC_CONFIG_FILES([src/gpg-error-config], [chmod +x src/gpg-error-config])
@@ -17,11 +17,11 @@ Index: libgpg-error-1.12/configure.ac
  
  AC_OUTPUT
  
-Index: libgpg-error-1.12/src/Makefile.am
+Index: libgpg-error-1.17/src/Makefile.am
 ===================================================================
---- libgpg-error-1.12.orig/src/Makefile.am	2014-05-13 21:14:26.846393236 +0000
-+++ libgpg-error-1.12/src/Makefile.am	2014-05-13 21:14:26.934393236 +0000
-@@ -37,13 +37,15 @@
+--- libgpg-error-1.17.orig/src/Makefile.am
++++ libgpg-error-1.17/src/Makefile.am
+@@ -74,13 +74,15 @@ nodist_include_HEADERS = gpg-error.h
  bin_SCRIPTS = gpg-error-config
  m4datadir = $(datadir)/aclocal
  m4data_DATA = gpg-error.m4
@@ -31,17 +31,17 @@ Index: libgpg-error-1.12/src/Makefile.am
  EXTRA_DIST = mkstrtable.awk err-sources.h.in err-codes.h.in \
  	mkerrnos.awk errnos.in README \
  	mkerrcodes.awk mkerrcodes1.awk mkerrcodes2.awk mkerrcodes.c \
- 	mkheader.awk gpg-error.h.in mkw32errmap.c w32-add.h w32ce-add.h \
+ 	mkheader.c gpg-error.h.in mkw32errmap.c w32-add.h w32ce-add.h \
  	err-sources.h err-codes.h gpg-error-config.in gpg-error.m4 \
--	gpg-error.def.in versioninfo.rc.in
-+	gpg-error.def.in versioninfo.rc.in gpg-error.pc.in
+-	gpg-error.vers gpg-error.def.in versioninfo.rc.in \
++	gpg-error.vers gpg-error.def.in versioninfo.rc.in gpg-error.pc \
+ 	$(lock_obj_pub)
  
  BUILT_SOURCES = err-sources.h err-codes.h code-to-errno.h code-from-errno.h \
- 	err-sources-sym.h err-codes-sym.h errnos-sym.h gpg-error.h \
-Index: libgpg-error-1.12/src/gpg-error.pc.in
+Index: libgpg-error-1.17/src/gpg-error.pc.in
 ===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ libgpg-error-1.12/src/gpg-error.pc.in	2014-05-13 21:48:20.266382916 +0000
+--- /dev/null
++++ libgpg-error-1.17/src/gpg-error.pc.in
 @@ -0,0 +1,11 @@
 +prefix=@prefix@
 +exec_prefix=@exec_prefix@
@@ -54,11 +54,11 @@ Index: libgpg-error-1.12/src/gpg-error.pc.in
 +Version: @VERSION@
 +Libs: -L${libdir} -lgpg-error
 +Cflags: -I${includedir}
-Index: libgpg-error-1.12/src/gpg-error.m4
+Index: libgpg-error-1.17/src/gpg-error.m4
 ===================================================================
---- libgpg-error-1.12.orig/src/gpg-error.m4	2014-05-13 21:45:02.038383922 +0000
-+++ libgpg-error-1.12/src/gpg-error.m4	2014-05-13 21:47:08.362383281 +0000
-@@ -15,58 +15,14 @@
+--- libgpg-error-1.17.orig/src/gpg-error.m4
++++ libgpg-error-1.17/src/gpg-error.m4
+@@ -26,73 +26,13 @@ dnl is added to the gpg_config_script_wa
  dnl
  AC_DEFUN([AM_PATH_GPG_ERROR],
  [ AC_REQUIRE([AC_CANONICAL_HOST])
@@ -70,7 +70,7 @@ Index: libgpg-error-1.12/src/gpg-error.m4
 -              AC_HELP_STRING([--with-libgpg-error-prefix=PFX],
 -                             [prefix where GPG Error is installed (optional)]),
 -              [gpg_error_config_prefix="$withval"])
- 
+-
 -  dnl Accept --with-gpg-error-prefix and make it work the same as
 -  dnl --with-libgpg-error-prefix above, for backwards compatibility,
 -  dnl but do not document this old, inconsistently-named option.
@@ -78,14 +78,27 @@ Index: libgpg-error-1.12/src/gpg-error.m4
 -              [gpg_error_config_prefix="$withval"])
 +  min_gpg_error_version=ifelse([$1], ,0.0,$1)
  
--  if test x$gpg_error_config_prefix != x ; then
--     if test x${GPG_ERROR_CONFIG+set} != xset ; then
--        GPG_ERROR_CONFIG=$gpg_error_config_prefix/bin/gpg-error-config
+-  if test x"${GPG_ERROR_CONFIG}" = x ; then
+-     if test x"${gpg_error_config_prefix}" != x ; then
+-        GPG_ERROR_CONFIG="${gpg_error_config_prefix}/bin/gpg-error-config"
+-     else
+-       case "${SYSROOT}" in
+-         /*)
+-           if test -x "${SYSROOT}/bin/gpg-error-config" ; then
+-             GPG_ERROR_CONFIG="${SYSROOT}/bin/gpg-error-config"
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
 +  PKG_CHECK_MODULES(GPG_ERROR, [gpg-error >= $min_gpg_error_version], [ok=yes], [ok=no])
  
--  AC_PATH_TOOL(GPG_ERROR_CONFIG, gpg-error-config, no)
+-  AC_PATH_PROG(GPG_ERROR_CONFIG, gpg-error-config, no)
 -  min_gpg_error_version=ifelse([$1], ,0.0,$1)
 -  AC_MSG_CHECKING(for GPG Error - version >= $min_gpg_error_version)
 -  ok=no
@@ -113,6 +126,8 @@ Index: libgpg-error-1.12/src/gpg-error.m4
    if test $ok = yes; then
 -    GPG_ERROR_CFLAGS=`$GPG_ERROR_CONFIG $gpg_error_config_args --cflags`
 -    GPG_ERROR_LIBS=`$GPG_ERROR_CONFIG $gpg_error_config_args --libs`
+-    GPG_ERROR_MT_CFLAGS=`$GPG_ERROR_CONFIG $gpg_error_config_args --mt --cflags 2>/dev/null`
+-    GPG_ERROR_MT_LIBS=`$GPG_ERROR_CONFIG $gpg_error_config_args --mt --libs 2>/dev/null`
 -    AC_MSG_RESULT([yes ($gpg_error_config_version)])
      ifelse([$2], , :, [$2])
 -    gpg_error_config_host=`$GPG_ERROR_CONFIG $gpg_error_config_args --host 2>/dev/null || echo none`
@@ -120,12 +135,14 @@ Index: libgpg-error-1.12/src/gpg-error.m4
      if test x"$gpg_error_config_host" != xnone ; then
        if test x"$gpg_error_config_host" != x"$host" ; then
    AC_MSG_WARN([[
-@@ -80,9 +36,6 @@
+@@ -107,11 +47,6 @@ AC_DEFUN([AM_PATH_GPG_ERROR],
        fi
      fi
    else
 -    GPG_ERROR_CFLAGS=""
 -    GPG_ERROR_LIBS=""
+-    GPG_ERROR_MT_CFLAGS=""
+-    GPG_ERROR_MT_LIBS=""
 -    AC_MSG_RESULT(no)
      ifelse([$3], , :, [$3])
    fi
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.12.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.17.bb
similarity index 40%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.12.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.17.bb
index af9574d..c905bd1 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.12.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.17.bb
@@ -5,8 +5,8 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/gpg-error.h.in;endline=23;md5=6ac0378874589a44d53512b3786b4bc0 \
-                    file://src/init.c;endline=20;md5=b69742f2a8827d494c6f6a4b1768416c"
+                    file://src/gpg-error.h.in;endline=23;md5=5dfe776dc8b62af093ddc859de6f494c \
+                    file://src/init.c;endline=20;md5=8f5a9b59634f4aebcd0ec9d3ebd53bfe"
 
 
 SECTION = "libs"
@@ -14,18 +14,43 @@ SECTION = "libs"
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch"
 
-SRC_URI[md5sum] = "8f0eb41a344d19ac2aa9bd101dfb9ce6"
-SRC_URI[sha256sum] = "cafc9ed6a87c53a35175d5a1220a96ca386696eef2fa059cc0306211f246e55f"
+SRC_URI[md5sum] = "b4f8d8b9ff14aed41f279aa844563539"
+SRC_URI[sha256sum] = "3ff4e5a71116eb862cd14185fcd282850927b8608e3b4186834fd940fbef57b5"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
 inherit autotools binconfig-disabled pkgconfig gettext
 
-FILES_${PN}-dev += "${bindir}/gpg-error"
+do_compile_prepend() {
+	TARGET_FILE=linux-gnu
+	if [ ${TARGET_OS} != "linux" ]; then
+		TARGET_FILE=${TARGET_OS}
+	fi
+
+	case ${TARGET_ARCH} in
+	  aarch64)    TUPLE=aarch64-unknown-linux-gnu ;;
+	  arm)	      TUPLE=arm-unknown-linux-gnueabi ;;
+	  armeb)      TUPLE=arm-unknown-linux-gnueabi ;;
+	  i586)       TUPLE=i486-pc-linux-gnu ;;
+	  mipsel)     TUPLE=mipsel-unknown-linux-gnu ;;
+	  mips64el)   TUPLE=mipsel-unknown-linux-gnu ;;
+	  mips64)     TUPLE=mips-unknown-linux-gnu ;;
+	  mips)       TUPLE=mips-unknown-linux-gnu ;;
+	  powerpc64)  TUPLE=powerpc64-unknown-linux-gnu ;;
+	  powerpc)    TUPLE=powerpc-unknown-linux-gnu ;;
+	  sh4)	      TUPLE=sh4-unknown-linux-gnu ;;
+	  x86_64)     TUPLE=x86_64-pc-linux-gnu ;;
+	esac
+
+	cp ${S}/src/syscfg/lock-obj-pub.$TUPLE.h \
+	  ${S}/src/syscfg/lock-obj-pub.$TARGET_FILE.h
+}
 
 do_install_append() {
 	# we don't have common lisp in OE
 	rm -rf "${D}${datadir}/common-lisp/"
 }
 
+FILES_${PN}-dev += "${bindir}/gpg-error"
+
 BBCLASSEXTEND = "native"
-- 
2.1.0


