Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rvlyc-0001XB-U9
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 09:37:08 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2012 00:28:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116213859"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.208])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2012 00:28:58 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 00:28:47 -0800
Message-Id: <bc0cb5cc65054c8f802753ad326a7cb27991c705.1328862318.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/20] zlib: Upgrade 1.2.5 -> 1.2.6
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
X-List-Received-Date: Fri, 10 Feb 2012 08:37:08 -0000

From: Khem Raj <raj.khem@gmail.com>

Dont use autotools, it really not so autoconf like.
the configure script gets updated with every release of zlib
and we overwrite that. Instead use the upstream provided
configure

copyright year was changed in zlib.h which caused change in
LIC_FILE_CHECKSUM

fix.inverted.LFS.logic.patch is already applied upstream so drop it

Drop the configure.ac and Makefile.am scripts since we do not
autoreconf anymore and do not inherit autotools anymore

Bump PR for depending recipes so a rebuild it ensues so that
they dont depend on .la anymore
and add missing dependencies discovered during incremental
build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/eggdbus/eggdbus_0.6.bb           |    2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb      |    2 +-
 meta/recipes-core/libxml/libxml2_2.7.8.bb          |    2 +-
 meta/recipes-core/zlib/files/Makefile.am           |    9 ----
 meta/recipes-core/zlib/files/configure.ac          |   48 --------------------
 .../zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch   |   20 --------
 meta/recipes-core/zlib/zlib_1.2.5.bb               |   41 -----------------
 meta/recipes-core/zlib/zlib_1.2.6.bb               |   26 +++++++++++
 meta/recipes-devtools/binutils/binutils_2.22.bb    |    2 +-
 meta/recipes-extended/cracklib/cracklib_2.8.18.bb  |    4 +-
 meta/recipes-extended/pam/libpam_1.1.5.bb          |    2 +-
 meta/recipes-extended/polkit/polkit-gnome_0.102.bb |    2 +-
 meta/recipes-extended/polkit/polkit_0.104.bb       |    2 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb |    2 +-
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |    2 +-
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.24.8.bb             |    2 +-
 meta/recipes-gnome/libglade/libglade_2.6.4.bb      |    4 +-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |    2 +-
 meta/recipes-gnome/libunique/libunique_1.1.6.bb    |    2 +-
 meta/recipes-graphics/cairo/cairo_1.10.2.bb        |    2 +-
 .../libmatchbox/libmatchbox_1.9.bb                 |    2 +-
 .../menu-cache/menu-cache_0.3.2.bb                 |    4 +-
 meta/recipes-graphics/pango/pango_1.28.4.bb        |    2 +-
 meta/recipes-graphics/xorg-lib/libfontenc_1.1.0.bb |    2 +-
 meta/recipes-graphics/xorg-lib/libxfont_1.4.4.bb   |    4 +-
 .../xorg-lib/libxfontcache_1.0.5.bb                |    4 +-
 meta/recipes-graphics/xorg-lib/pixman_0.24.2.bb    |    3 +-
 meta/recipes-multimedia/gstreamer/gst-plugins.inc  |    2 +
 .../gstreamer/gstreamer_0.10.35.bb                 |    2 +-
 .../libid3tag/libid3tag_0.15.1b.bb                 |    2 +-
 meta/recipes-multimedia/libpng/libpng_1.2.46.bb    |    2 +-
 meta/recipes-multimedia/libtiff/tiff_3.9.5.bb      |    2 +-
 meta/recipes-sato/eds/eds-dbus_2.20.0.bb           |    2 +-
 meta/recipes-sato/eds/eds-dbus_git.bb              |    2 +-
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    2 +-
 .../recipes-sato/owl-video-widget/libowl-av_git.bb |    2 +-
 meta/recipes-support/gnutls/gnutls.inc             |    2 +-
 meta/recipes-support/libcroco/libcroco_0.6.3.bb    |    2 +-
 meta/recipes-support/libfm/libfm_0.1.17.bb         |    2 +-
 meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb |    2 +-
 meta/recipes-support/libsoup/libsoup_2.2.105.bb    |    2 +-
 meta/recipes-support/libxslt/libxslt_1.1.26.bb     |    2 +-
 meta/recipes-support/neon/neon_0.29.6.bb           |    2 +-
 meta/recipes-support/vte/vte_0.28.2.bb             |    2 +-
 45 files changed, 73 insertions(+), 162 deletions(-)
 delete mode 100644 meta/recipes-core/zlib/files/Makefile.am
 delete mode 100644 meta/recipes-core/zlib/files/configure.ac
 delete mode 100644 meta/recipes-core/zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch
 delete mode 100644 meta/recipes-core/zlib/zlib_1.2.5.bb
 create mode 100644 meta/recipes-core/zlib/zlib_1.2.6.bb

diff --git a/meta/recipes-core/eggdbus/eggdbus_0.6.bb b/meta/recipes-core/eggdbus/eggdbus_0.6.bb
index 99915f0..0b958f7 100644
--- a/meta/recipes-core/eggdbus/eggdbus_0.6.bb
+++ b/meta/recipes-core/eggdbus/eggdbus_0.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://cgit.freedesktop.org/~david/eggdbus"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
                     file://src/eggdbus/eggdbus.h;md5=6b312aef57ed8d738b3f131ad037d6c2"
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "dbus glib-2.0 dbus-glib eggdbus-native"
 DEPENDS_virtclass-native = "dbus-native glib-2.0-native dbus-glib-native"
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
index bdf92aa..4bb38a7 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r2"
+PR = "r3"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
diff --git a/meta/recipes-core/libxml/libxml2_2.7.8.bb b/meta/recipes-core/libxml/libxml2_2.7.8.bb
index 0b6ce02..8ec69fb 100644
--- a/meta/recipes-core/libxml/libxml2_2.7.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.7.8.bb
@@ -1,6 +1,6 @@
 require libxml2.inc
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI += "file://fix_version_info.patch"
 
diff --git a/meta/recipes-core/zlib/files/Makefile.am b/meta/recipes-core/zlib/files/Makefile.am
deleted file mode 100644
index b66d299..0000000
--- a/meta/recipes-core/zlib/files/Makefile.am
+++ /dev/null
@@ -1,9 +0,0 @@
-lib_LTLIBRARIES = libz.la
-
-libz_la_SOURCES = adler32.c compress.c crc32.c gzlib.c gzclose.c gzread.c \
-                  gzwrite.c uncompr.c deflate.c trees.c zutil.c inflate.c \
-                  infback.c inftrees.c inffast.c
-
-libz_la_LDFLAGS = -version-number 1:2:5 --version-script zlib.map
-
-include_HEADERS = zconf.h zlib.h zlibdefs.h
diff --git a/meta/recipes-core/zlib/files/configure.ac b/meta/recipes-core/zlib/files/configure.ac
deleted file mode 100644
index 4761b7e..0000000
--- a/meta/recipes-core/zlib/files/configure.ac
+++ /dev/null
@@ -1,48 +0,0 @@
-AC_INIT(zlib,1.2.5)
-AC_CONFIG_SRCDIR(adler32.c)
-AM_INIT_AUTOMAKE(zlibs,1.2.5)
-
-AC_PREREQ([2.59])
-
-AC_PROG_CC([gcc])
-AC_PROG_LIBTOOL
-
-AC_HEADER_STDC
-
-zlib_save_CPPFLAGS=$CPPFLAGS
-CPPFLAGS="$CPPFLAGS -D_LARGEFILE64_SOURCE"
-AC_CHECK_TYPES(off64_t)
-CPPFLAGS=$zlib_save_CPPFLAGS
-
-AC_CACHE_CHECK([whether to enable -D_LARGEFILE64_SOURCE], [zlib_cv_use_lfs64], [
-    zlib_cv_use_lfs64=no
-    if test "$ac_cv_type_off64_t" = "yes"; then
-        zlib_cv_use_lfs64=yes
-    fi
-])
-
-if test "$zlib_cv_use_lfs64" = "yes"; then
-    CPPFLAGS="$CPPFLAGS -D_LARGEFILE64_SOURCE"
-
-    #APR_ADDTO(CPPFLAGS, [-D_LARGEFILE64_SOURCE])
-fi
-
-cat > zlibdefs.h << EOF
-/* zlibdefs.h -- compile-time definitions for the zlib compression library
- * Copyright (C) 1995-2006 Jean-loup Gailly.
- * For conditions of distribution and use, see copyright notice in zlib.h
- */
-
-#include <sys/types.h>	/* for off_t */
-#include <unistd.h>	/* for SEEK_* and off_t */
-#ifdef VMS
-#  include <unixio.h>	/* for off_t */
-#endif
-#ifndef z_off_t
-#  define z_off_t off_t
-#endif
-EOF
-
-AC_CONFIG_FILES([Makefile])
-
-AC_OUTPUT
diff --git a/meta/recipes-core/zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch b/meta/recipes-core/zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch
deleted file mode 100644
index 038c1a2..0000000
--- a/meta/recipes-core/zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Pending
-
-see
-https://bugs.gentoo.org/316377?id=316377
-https://bugs.freedesktop.org/show_bug.cgi?id=33710
-http://lists.freedesktop.org/archives/poppler-bugs/2011-January/006014.html
-for details
-
-diff -up zlib-1.2.5/zlib.h.pom zlib-1.2.5/zlib.h
---- zlib-1.2.5/zlib.h.pom	2010-04-20 06:12:48.000000000 +0200
-+++ zlib-1.2.5/zlib.h	2010-06-16 13:08:59.000000000 +0200
-@@ -1578,7 +1578,7 @@ ZEXTERN int ZEXPORT inflateBackInit_ OF(
- #  define gzoffset gzoffset64
- #  define adler32_combine adler32_combine64
- #  define crc32_combine crc32_combine64
--#  ifdef _LARGEFILE64_SOURCE
-+#  ifndef _LARGEFILE64_SOURCE
-      ZEXTERN gzFile ZEXPORT gzopen64 OF((const char *, const char *));
-      ZEXTERN z_off_t ZEXPORT gzseek64 OF((gzFile, z_off_t, int));
-      ZEXTERN z_off_t ZEXPORT gztell64 OF((gzFile));
diff --git a/meta/recipes-core/zlib/zlib_1.2.5.bb b/meta/recipes-core/zlib/zlib_1.2.5.bb
deleted file mode 100644
index b5756d9..0000000
--- a/meta/recipes-core/zlib/zlib_1.2.5.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "Zlib Compression Library"
-DESCRIPTION = "Zlib is a general-purpose, patent-free, lossless data compression \
-library which is used by many different programs."
-HOMEPAGE = "http://zlib.net/"
-SECTION = "libs"
-LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=084e9c30e4e6272c3b057b13c6467f3d"
-
-DEPENDS = "libtool-cross"
-PR = "r3"
-
-SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
-           file://configure.ac \
-           file://Makefile.am \
-           file://fix.inverted.LFS.logic.patch"
-
-SRC_URI[md5sum] = "be1e89810e66150f5b0327984d8625a0"
-SRC_URI[sha256sum] = "239aead2f22f16bfcfa6a6a5150dcbd6d6f2e4d1eaa8727b5769ea014120b307"
-
-inherit autotools
-
-do_configure_prepend () {
-	cp ${WORKDIR}/configure.ac ${S}/
-	cp ${WORKDIR}/Makefile.am ${S}/
-}
-
-do_install_append () {
-	sed \
-		-e 's:@prefix@:${prefix}:' \
-		-e 's:@exec_prefix@:${exec_prefix}:' \
-		-e 's:@libdir@:${libdir}:' \
-		-e 's:@sharedlibdir@:${libdir}:' \
-		-e 's:@includedir@:${includedir}:' \
-		-e 's:@VERSION@:${PV}:' \
-		zlib.pc.in > zlib.pc
-
-	install -d ${D}${libdir}/pkgconfig
-	install -m 0644 zlib.pc ${D}${libdir}/pkgconfig/
-}
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-core/zlib/zlib_1.2.6.bb b/meta/recipes-core/zlib/zlib_1.2.6.bb
new file mode 100644
index 0000000..a220773
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib_1.2.6.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Zlib Compression Library"
+DESCRIPTION = "Zlib is a general-purpose, patent-free, lossless data compression \
+library which is used by many different programs."
+HOMEPAGE = "http://zlib.net/"
+SECTION = "libs"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=94d1b5a40dadd127f3351471727e66a9"
+
+SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
+           "
+SRC_URI[md5sum] = "dc2cfa0d2313ca77224b4d932b2911e9"
+SRC_URI[sha256sum] = "fa3e3e4881fa5810b8903f2c7e0dcd5a0a673535f0438021c4bbb5db1b918c8e"
+
+do_configure (){
+	./configure --prefix=${prefix} --shared --libdir=${libdir}
+}
+
+do_compile (){
+	oe_runmake
+}
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
+}
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/binutils/binutils_2.22.bb b/meta/recipes-devtools/binutils/binutils_2.22.bb
index 86c6dba..f9827d3 100644
--- a/meta/recipes-devtools/binutils/binutils_2.22.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.22.bb
@@ -1,6 +1,6 @@
 require binutils.inc
 
-PR = "r3"
+PR = "r4"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
diff --git a/meta/recipes-extended/cracklib/cracklib_2.8.18.bb b/meta/recipes-extended/cracklib/cracklib_2.8.18.bb
index 53ed739..05eda85 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.8.18.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.8.18.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://sourceforge.net/projects/cracklib"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
-DEPENDS = ""
-PR ="r1"
+DEPENDS = "zlib"
+PR ="r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz"
 
diff --git a/meta/recipes-extended/pam/libpam_1.1.5.bb b/meta/recipes-extended/pam/libpam_1.1.5.bb
index 1ab3a99..c2c101b 100644
--- a/meta/recipes-extended/pam/libpam_1.1.5.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.5.bb
@@ -9,7 +9,7 @@ SECTION = "base"
 LICENSE = "GPLv2+ | BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ca0395de9a86191a078b8b79302e3083"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "https://fedorahosted.org/releases/l/i/linux-pam/Linux-PAM-${PV}.tar.bz2 \
            file://99_pam \
diff --git a/meta/recipes-extended/polkit/polkit-gnome_0.102.bb b/meta/recipes-extended/polkit/polkit-gnome_0.102.bb
index 487e745..bba917c 100644
--- a/meta/recipes-extended/polkit/polkit-gnome_0.102.bb
+++ b/meta/recipes-extended/polkit/polkit-gnome_0.102.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74579fab173e4c5e12aac0cd83ee98ec \
 SRC_URI = "http://hal.freedesktop.org/releases/polkit-gnome-${PV}.tar.bz2 \
           "
 
-PR = "r0"
+PR = "r1"
 
 EXTRA_OECONF = " --disable-scrollkeeper \
                  --disable-man-pages \
diff --git a/meta/recipes-extended/polkit/polkit_0.104.bb b/meta/recipes-extended/polkit/polkit_0.104.bb
index e51e017..d53dda8 100644
--- a/meta/recipes-extended/polkit/polkit_0.104.bb
+++ b/meta/recipes-extended/polkit/polkit_0.104.bb
@@ -14,7 +14,7 @@ SRC_URI[md5sum] = "e380b4c6fb1e7bccf854e92edc0a8ce1"
 SRC_URI[sha256sum] = "6b0a13d8381e4a7b7e37c18a54595191b50757e0fcd186cd9918e9ad0f18c7f9"
 
 PAM_SRC_URI = "file://polkit-1_pam.patch"
-PR = "r0"
+PR = "r1"
 DEPENDS = "libpam expat dbus-glib eggdbus intltool-native"
 RDEPENDS_${PN} = "libpam"
 EXTRA_OECONF = "--with-authfw=pam --with-os-type=moblin --disable-man-pages --disable-gtk-doc --disable-introspection"
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
index e71c448..458b0fc 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.24/gdk-pixbuf-${
 SRC_URI[md5sum] = "d8ece3a4ade4a91c768328620e473ab8"
 SRC_URI[sha256sum] = "38d2630314e6d91976bffd833236f84fefa440a9038f86dc422820a39f2e3700"
 
-PR = "r2"
+PR = "r3"
 
 inherit autotools pkgconfig gettext
 
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
index a0b8d0c..a12cb9b 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
@@ -9,7 +9,7 @@ POLKIT_libc-uclibc = ""
 DEPENDS = "glib-2.0 gtk+ dbus dbus-glib libxml2 intltool-native ${POLKIT}"
 DEPENDS_virtclass-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-native intltool-native gnome-common-native"
 
-PR = "r6"
+PR = "r7"
 
 inherit gnomebase
 
diff --git a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
index c40044f..8fb7c7a 100644
--- a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
+++ b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "x11/gnome"
 
-PR = "r4"
+PR = "r5"
 
 inherit autotools gnome pkgconfig
 
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
index ec827a7..8dfcc32 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
@@ -27,7 +27,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
 #        file://combo-arrow-size.patch;striplevel=0
 #            file://configurefix.patch
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "0413187f7e596aef00ccd1b54776ff03"
 SRC_URI[sha256sum] = "ac2325a65312922a6722a7c02a389f3f4072d79e13131485cc7b7226e2537043"
diff --git a/meta/recipes-gnome/libglade/libglade_2.6.4.bb b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
index 90a7b33..632d7f7 100644
--- a/meta/recipes-gnome/libglade/libglade_2.6.4.bb
+++ b/meta/recipes-gnome/libglade/libglade_2.6.4.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://glade/glade-gtk.c;endline=22;md5=766f993433e2642fec87936d319990ff"
 
 SECTION = "libs"
-PR = "r1"
-DEPENDS = "gdk-pixbuf gtk+ gtk-doc-native"
+PR = "r2"
+DEPENDS = "zlib gdk-pixbuf gtk+ gtk-doc-native"
 
 inherit autotools pkgconfig gnome
 
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index 6744932..c1d5e3b 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SECTION = "x11/utils"
 DEPENDS = "gtk+ libcroco cairo libxml2 popt"
 
-PR = "r4"
+PR = "r1"
 
 inherit autotools pkgconfig gnome
 
diff --git a/meta/recipes-gnome/libunique/libunique_1.1.6.bb b/meta/recipes-gnome/libunique/libunique_1.1.6.bb
index 9435e97..71b4551 100644
--- a/meta/recipes-gnome/libunique/libunique_1.1.6.bb
+++ b/meta/recipes-gnome/libunique/libunique_1.1.6.bb
@@ -9,7 +9,7 @@ SRC_URI = "${GNOME_MIRROR}/libunique/1.1/libunique-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "7955769ef31f1bc4f83446dbb3625e6d"
 SRC_URI[sha256sum] = "e5c8041cef8e33c55732f06a292381cb345db946cf792a4ae18aa5c66cdd4fbb"
 
-PR = "r4"
+PR = "r5"
 
 DEPENDS = "glib-2.0 gtk+ dbus"
 
diff --git a/meta/recipes-graphics/cairo/cairo_1.10.2.bb b/meta/recipes-graphics/cairo/cairo_1.10.2.bb
index 826681f..a74a2cc 100644
--- a/meta/recipes-graphics/cairo/cairo_1.10.2.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.10.2.bb
@@ -2,7 +2,7 @@ require cairo.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz"
 
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb
index 6083d98..2ce5952 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.9.bb
@@ -1,6 +1,6 @@
 require libmatchbox.inc
 
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
            file://16bppfixes.patch \
diff --git a/meta/recipes-graphics/menu-cache/menu-cache_0.3.2.bb b/meta/recipes-graphics/menu-cache/menu-cache_0.3.2.bb
index 3d21256..87f9826 100644
--- a/meta/recipes-graphics/menu-cache/menu-cache_0.3.2.bb
+++ b/meta/recipes-graphics/menu-cache/menu-cache_0.3.2.bb
@@ -9,13 +9,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://menu-cache-daemon/menu-cached.c;endline=22;md5=fcecb7d315c57ef804103fa9cdab7111"
 
 SECTION = "x11/libs"
-DEPENDS = "glib-2.0"
+DEPENDS = "glib-2.0 zlib"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/menu-cache-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "ac4a9ea77db68d3db3f9f53cc75af66a"
 SRC_URI[sha256sum] = "6b7c1627b5102d8301a8a3e845f673a7181a71dde32f6455abf22d03e392b89f"
 
-PR = "r0"
+PR = "r1"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-graphics/pango/pango_1.28.4.bb b/meta/recipes-graphics/pango/pango_1.28.4.bb
index 9681f9e..8d71de0 100644
--- a/meta/recipes-graphics/pango/pango_1.28.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.28.4.bb
@@ -2,7 +2,7 @@ require pango.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI += "file://no-tests.patch"
 SRC_URI += "file://noconst.patch"
diff --git a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.0.bb b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.0.bb
index 3d90042..c489f39 100644
--- a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.0.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=96254c20ab81c63e65b26f0dbcd4a1c1"
 
 DEPENDS += "zlib xproto font-util"
-PR = "r1"
+PR = "r2"
 PE = "1"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.4.4.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.4.4.bb
index 8af0ac9..3e44fc8 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.4.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.4.4.bb
@@ -9,10 +9,10 @@ require xorg-lib-common.inc
 LICENSE= "MIT & MIT-style & BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a46c8040f2f737bcd0c435feb2ab1c2c"
 
-DEPENDS += "freetype fontcacheproto xtrans fontsproto libfontenc"
+DEPENDS += "freetype fontcacheproto xtrans fontsproto libfontenc zlib"
 PROVIDES = "xfont"
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 XORG_PN = "libXfont"
diff --git a/meta/recipes-graphics/xorg-lib/libxfontcache_1.0.5.bb b/meta/recipes-graphics/xorg-lib/libxfontcache_1.0.5.bb
index b254eb9..065daf1 100644
--- a/meta/recipes-graphics/xorg-lib/libxfontcache_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfontcache_1.0.5.bb
@@ -5,9 +5,9 @@ SUMMARY = "XFontCache: X Font Cache extension library"
 DESCRIPTION = "FontCache is an extension that is used by X-TrueType to cache \
 information about fonts."
 
-DEPENDS += "libxext fontcacheproto"
+DEPENDS += "libxext fontcacheproto zlib"
 LIC_FILES_CHKSUM = "file://COPYING;md5=62a75d5d3da40f1f6eb1cbe3bcc0a5d0"
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 XORG_PN = "libXfontcache"
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.24.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.24.2.bb
index b55e547..c710b42 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.24.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.24.2.bb
@@ -12,9 +12,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
                     file://pixman/pixman-matrix.c;endline=25;md5=ba6e8769bfaaee2c41698755af04c4be \
                     file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
                    "
+DEPENDS += "zlib libpng"
 
 PE = "1"
-PR = "r0"
+PR = "r1"
 
 EXTRA_OECONF="--disable-gtk"
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
index b23d399..a71a868 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
@@ -6,6 +6,8 @@ DEPENDS = "gstreamer"
 
 inherit autotools pkgconfig
 
+PR = "r1"
+
 FILESPATH =. "${FILE_DIRNAME}/gst-plugins:"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.35.bb b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.35.bb
index 650c708..b58f34d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.35.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.35.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/gst.h;beginline=1;endline=21;md5=8e5fe5e87d33a04479fde862e238eaa4"
 DEPENDS = "glib-2.0 libxml2 bison-native flex-native"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.bz2 \
            file://check_fix.patch \
diff --git a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
index 05e566e..c5d53e6 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
+++ b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 			file://version.h;beginline=1;endline=8;md5=86ac68b67f054b7afde9e149bbc3fe63"
 SECTION = "libs"
 DEPENDS = "zlib gperf-native"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libid3tag-${PV}.tar.gz \
            file://addpkgconfig.patch"
diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.46.bb b/meta/recipes-multimedia/libpng/libpng_1.2.46.bb
index dc93132..a917691 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.2.46.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.2.46.bb
@@ -6,7 +6,7 @@ LICENSE = "Libpng"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=21b4b6e3523afa9f03f00b43b991dad0 \
                     file://png.h;startline=172;endline=261;md5=996460063a9bf2de35b2d61d2776dabc"
 DEPENDS = "zlib"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.bz2"
 
diff --git a/meta/recipes-multimedia/libtiff/tiff_3.9.5.bb b/meta/recipes-multimedia/libtiff/tiff_3.9.5.bb
index 78a4859..ae8df15 100644
--- a/meta/recipes-multimedia/libtiff/tiff_3.9.5.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_3.9.5.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 HOMEPAGE = "http://www.remotesensing.org/libtiff/"
 DEPENDS = "zlib jpeg lzo"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch"
diff --git a/meta/recipes-sato/eds/eds-dbus_2.20.0.bb b/meta/recipes-sato/eds/eds-dbus_2.20.0.bb
index d13476b..067346a 100644
--- a/meta/recipes-sato/eds/eds-dbus_2.20.0.bb
+++ b/meta/recipes-sato/eds/eds-dbus_2.20.0.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2 & LGPLv2+"
 
 DEPENDS = "intltool-native glib-2.0 gtk+ gconf dbus db gnome-common virtual/libiconv zlib libsoup libglade"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/mobile/2.23/2.23.92/sources/evolution-data-server-dbus-${PV}.tar.gz  \
            file://oh-contact.patch;striplevel=0 \
diff --git a/meta/recipes-sato/eds/eds-dbus_git.bb b/meta/recipes-sato/eds/eds-dbus_git.bb
index 6a8436c..0405a02 100644
--- a/meta/recipes-sato/eds/eds-dbus_git.bb
+++ b/meta/recipes-sato/eds/eds-dbus_git.bb
@@ -12,7 +12,7 @@ DEPENDS = "intltool-native glib-2.0 gtk+ gconf dbus db gnome-common virtual/libi
 
 SRCREV = "7337d11aed576e7caaa12b4e881ad8d33668799f"
 PV = "2.30+git${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
            file://oh-contact.patch;striplevel=0 \
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index 78111f7..0514164 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -13,7 +13,7 @@ DEPENDS += " ${@base_contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
 
 SRCREV = "cdf7a22716b87468f10573f622d5c7a58a684e35"
 PV = "0.0+git${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 RPROVIDES_${PN} = "matchbox-panel"
 RREPLACES_${PN} = "matchbox-panel"
diff --git a/meta/recipes-sato/owl-video-widget/libowl-av_git.bb b/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
index 176b61f..f1a4f88 100644
--- a/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
+++ b/meta/recipes-sato/owl-video-widget/libowl-av_git.bb
@@ -14,7 +14,7 @@ RRECOMMENDS_${PN} = "gst-meta-audio gst-meta-video"
 
 SRCREV = "1379fd230a32509e94971961183f1031f469737a"
 PV = "0.1+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 
 SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index c639b11..157612e 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap readline"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.3.bb b/meta/recipes-support/libcroco/libcroco_0.6.3.bb
index e886e62..0addd64 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.3.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
 
 SECTION = "x11/utils"
 DEPENDS = "glib-2.0 libxml2 zlib"
-PR = "r0"
+PR = "r1"
 
 inherit autotools pkgconfig gnome
 
diff --git a/meta/recipes-support/libfm/libfm_0.1.17.bb b/meta/recipes-support/libfm/libfm_0.1.17.bb
index efb54d0..efc1024 100644
--- a/meta/recipes-support/libfm/libfm_0.1.17.bb
+++ b/meta/recipes-support/libfm/libfm_0.1.17.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 SECTION = "x11/libs"
 DEPENDS = "gtk+ menu-cache intltool-native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.gz"
 
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
index d8ee8d5..8e6ef26 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 SECTION = "x11/gnome/libs"
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 libgnome-keyring"
 
diff --git a/meta/recipes-support/libsoup/libsoup_2.2.105.bb b/meta/recipes-support/libsoup/libsoup_2.2.105.bb
index cd0f552..d251e94 100644
--- a/meta/recipes-support/libsoup/libsoup_2.2.105.bb
+++ b/meta/recipes-support/libsoup/libsoup_2.2.105.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "An HTTP library implementation in C"
 SECTION = "x11/gnome/libs"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "glib-2.0 gnutls libxml2"
 
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.26.bb b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
index addc863..09e90dc 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.26.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
 
 SECTION = "libs"
 DEPENDS = "libxml2"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
            file://pkgconfig_fix.patch"
diff --git a/meta/recipes-support/neon/neon_0.29.6.bb b/meta/recipes-support/neon/neon_0.29.6.bb
index e739f31..ed62181 100644
--- a/meta/recipes-support/neon/neon_0.29.6.bb
+++ b/meta/recipes-support/neon/neon_0.29.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://src/COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a
 DEPENDS = "zlib libxml2 expat time gnutls libproxy"
 DEPENDS_virtclass-native = "zlib-native libxml2-native expat-native gnutls-native"
 
-PR = "r0"
+PR = "r1"
 
 BBCLASSEXTEND = "native"
 
diff --git a/meta/recipes-support/vte/vte_0.28.2.bb b/meta/recipes-support/vte/vte_0.28.2.bb
index c74419a..33f71b5 100644
--- a/meta/recipes-support/vte/vte_0.28.2.bb
+++ b/meta/recipes-support/vte/vte_0.28.2.bb
@@ -2,7 +2,7 @@ require vte.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[archive.md5sum] = "f07a4bf943194f94b7f142db8f7f36dc"
 SRC_URI[archive.sha256sum] = "8d04e202b617373dfb47689e5e628febe2c58840b34cccc4af4feb88c48df903"
-- 
1.7.6.5



