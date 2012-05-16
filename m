Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUkVj-0005IT-Dh
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 22:07:52 +0200
Received: by wibhn14 with SMTP id hn14so5517826wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 12:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=hGmHr461Q2QrE55bqNqyz+vtCmiglQyn1hwlZdB/z/E=;
	b=h/Rtk1pRUodKY6go1pMwv1ZDMfI2ZiNikAfKKuDQoSJyALBffhe5cqkUU9tuEvtzW/
	jwc2cUtNojg6Nzu3Vj62IbY4L/wOhBmG+olZyB93yfBW0JWcp5bHwqlDeji+AMqO5bRO
	DMRV0zqb4j0CLLmczf9B7XzHAeaWhXevFDcvQY2t/Bhc7Uj7mtqhLcIUdGQwyoOlPYYY
	6J9Ds2MZ97grDaqc/lFdnVMOn9JsAS1uCMNhOsFkfF1mRltM83CrZ8ODj3KYFXmybRiA
	F8C5BmEtThntSavMOf2dFQUOiVgca0xKbM490k3fcu7iIMb5mpYeWW2PiGduy4NqZajU
	pItg==
Received: by 10.180.93.38 with SMTP id cr6mr11091355wib.16.1337198269737;
	Wed, 16 May 2012 12:57:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eb8sm15659211wib.11.2012.05.16.12.57.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 May 2012 12:57:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 May 2012 21:57:45 +0200
Message-Id: <1337198265-2910-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [RFC] glib-2.0: upgrade to 2.32.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 May 2012 20:07:53 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch |   56 ++++++++++----------
 meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb      |   53 ------------------
 meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb      |   55 +++++++++++++++++++
 3 files changed, 83 insertions(+), 81 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch b/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
index e9b3b26..0149767 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
@@ -1,37 +1,37 @@
-Ideally there would be configureation option for this but there is not. We
-can't allow this code since it could detect the host system's libelf with
-disasterous effects when cross compiling.
+From 0040842024725c0e74f84c1719ead6c79ba94aba Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 16 May 2012 20:03:34 +0200
+Subject: [PATCH] configure: add option to disable libelf support
 
-RP 2012/5/7
+Upstream-Status: Pending
 
-Upstream-Status: Pending (would need to be made a configure option to disabe)
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
 
-Index: glib-2.32.2/configure.ac
-===================================================================
---- glib-2.32.2.orig/configure.ac	2012-05-07 08:30:04.481149925 +0000
-+++ glib-2.32.2/configure.ac	2012-05-07 08:31:02.185148588 +0000
-@@ -1816,23 +1816,7 @@
+diff --git a/configure.ac b/configure.ac
+index aa65648..1bb49bf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1815,6 +1815,9 @@ AC_SUBST(XATTR_LIBS)
+ dnl ************************
  dnl *** check for libelf ***
  dnl ************************
++AC_ARG_ENABLE(libelf,
++              AC_HELP_STRING([--disable-libelf], [build without libelf support]))
++if test "x$enable_libelf" != "xno"; then
+ 
+ PKG_CHECK_MODULES([LIBELF], [libelf], [have_libelf=yes], [have_libelf=maybe])
  
--PKG_CHECK_MODULES([LIBELF], [libelf], [have_libelf=yes], [have_libelf=maybe])
--
--if test $have_libelf = maybe; then
--  AC_CHECK_LIB([elf], [elf_begin], , [have_libelf=no])
--  AC_CHECK_LIB([elf], [elf_getshdrstrndx], , [have_libelf=no])
--  AC_CHECK_LIB([elf], [elf_getshdrnum], , [have_libelf=no])
--  AC_CHECK_HEADER([libelf.h], , [have_libelf=no])
--
--  if test $have_libelf != no; then
--    LIBELF_LIBS=-lelf
--    have_libelf = yes
--  fi
--fi
--
--if test $have_libelf = yes; then
--  AC_DEFINE(HAVE_LIBELF, 1, [Define if libelf is available])
--fi
-+have_libelf=no
+@@ -1835,6 +1838,7 @@ fi
+ if test $have_libelf = yes; then
+   AC_DEFINE(HAVE_LIBELF, 1, [Define if libelf is available])
+ fi
++fi
  
  dnl ****************************************
  dnl *** platform dependent source checks ***
+-- 
+1.7.8.6
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb
deleted file mode 100644
index b9b3356..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-require glib.inc
-
-PE = "1"
-PR = "r1"
-
-DEPENDS += "libffi python-argparse-native zlib"
-DEPENDS_virtclass-native += "libffi-native python-argparse-native"
-DEPENDS_virtclass-nativesdk += "libffi-nativesdk python-argparse-native zlib-nativesdk"
-
-SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
-
-SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
-           file://configure-libtool.patch \
-           file://60_wait-longer-for-threads-to-die.patch \
-           file://glib-2.0_fix_for_x32.patch \
-           file://nodbus.patch \
-           file://nolibelf.patch \
-          "
-SRC_URI[md5sum] = "5bfdb6197afb90e4dbc7b1bb98f0eae0"
-SRC_URI[sha256sum] = "b1764abf00bac96e0e93e29fb9715ce75f3583579acac40648e18771d43d6136"
-
-SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
-BBCLASSEXTEND = "native nativesdk"
-
-PERLPATH = "${bindir}/env perl"
-PERLPATH_virtclass-native = "/usr/bin/env perl"
-PERLPATH_virtclass-nativesdk = "/usr/bin/env perl"
-
-do_configure_prepend() {
-  # missing ${topdir}/gtk-doc.make and --disable-gtk-doc* is not enough, because it calls gtkdocize (not provided by gtk-doc-native)
-  sed -i '/^docs/d' ${S}/configure.ac
-  sed -i 's/SUBDIRS = . m4macros glib gmodule gthread gobject gio tests po docs/SUBDIRS = . m4macros glib gmodule gthread gobject gio tests po/g' ${S}/Makefile.am
-  sed -i -e "s:TEST_PROGS += gdbus-serialization::g"  ${S}/gio/tests/Makefile.am
-}
-
-do_install_append() {
-  # remove some unpackaged files
-  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyc
-  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyo
-  # and empty dirs
-  rmdir ${D}${libdir}/gio/modules/
-  rmdir ${D}${libdir}/gio/
-
-  # Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
-  # for target as /usr/bin/perl, so fix it to /usr/bin/perl.
-  if [ -f ${D}${bindir}/glib-mkenums ]; then
-    sed -i -e '1s,#!.*perl,#! ${PERLPATH},' ${D}${bindir}/glib-mkenums
-  fi
-}
-
-PACKAGES += "${PN}-codegen"
-FILES_${PN}-codegen = "${libdir}/gdbus-2.0/codegen/*.py"
-FILES_${PN} += "${datadir}/glib-2.0/gettext/mkinstalldirs ${datadir}/glib-2.0/gettext/po/Makefile.in.in"
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
new file mode 100644
index 0000000..72db2ef
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
@@ -0,0 +1,55 @@
+require glib.inc
+
+PE = "1"
+PR = "r1"
+
+DEPENDS += "libffi python-argparse-native zlib"
+DEPENDS_virtclass-native += "libffi-native python-argparse-native"
+DEPENDS_virtclass-nativesdk += "libffi-nativesdk python-argparse-native zlib-nativesdk"
+
+SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+
+SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
+           file://configure-libtool.patch \
+           file://60_wait-longer-for-threads-to-die.patch \
+           file://glib-2.0_fix_for_x32.patch \
+           file://nodbus.patch \
+           file://nolibelf.patch \
+          "
+SRC_URI[md5sum] = "9bd3ac535c24b6c162be13b2c43c5adc"
+SRC_URI[sha256sum] = "b65ceb462807e4a2f91c95e4293ce6bbefca308cb44a1407bcfdd9e40363ff4d"
+
+SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
+BBCLASSEXTEND = "native nativesdk"
+
+EXTRA_OECONF = "--disable-libelf"
+
+PERLPATH = "${bindir}/env perl"
+PERLPATH_virtclass-native = "/usr/bin/env perl"
+PERLPATH_virtclass-nativesdk = "/usr/bin/env perl"
+
+do_configure_prepend() {
+  # missing ${topdir}/gtk-doc.make and --disable-gtk-doc* is not enough, because it calls gtkdocize (not provided by gtk-doc-native)
+  sed -i '/^docs/d' ${S}/configure.ac
+  sed -i 's/SUBDIRS = . m4macros glib gmodule gthread gobject gio tests po docs/SUBDIRS = . m4macros glib gmodule gthread gobject gio tests po/g' ${S}/Makefile.am
+  sed -i -e "s:TEST_PROGS += gdbus-serialization::g"  ${S}/gio/tests/Makefile.am
+}
+
+do_install_append() {
+  # remove some unpackaged files
+  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyc
+  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyo
+  # and empty dirs
+  rmdir ${D}${libdir}/gio/modules/
+  rmdir ${D}${libdir}/gio/
+
+  # Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
+  # for target as /usr/bin/perl, so fix it to /usr/bin/perl.
+  if [ -f ${D}${bindir}/glib-mkenums ]; then
+    sed -i -e '1s,#!.*perl,#! ${PERLPATH},' ${D}${bindir}/glib-mkenums
+  fi
+}
+
+PACKAGES += "${PN}-codegen"
+FILES_${PN}-codegen = "${libdir}/gdbus-2.0/codegen/*.py"
+FILES_${PN} += "${datadir}/glib-2.0/gettext/mkinstalldirs ${datadir}/glib-2.0/gettext/po/Makefile.in.in"
-- 
1.7.8.6



