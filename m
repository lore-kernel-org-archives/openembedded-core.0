Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtEls-0000tT-5A
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 09:45:28 +0100
Received: by mail-pz0-f47.google.com with SMTP id n34so83755dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 00:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=FUqVSaQaaOU73abY/aIBteAiULNz3t+4EDpoKxbM6f8=;
	b=RdrkjV4WJBIjOB1wMUjuqanLH1FZKdixuspJ8YmYMe4VriGvoaI7QUphUtSzoJrRem
	ZsgQ2/+SBlYzGo3nA0ObUhqeagWwvS5ZIRIv2X/lw89kBlV8HBKbNfr3a9Wx/lJsJfv5
	tdS2T8ZCVgOzvY6G7/Eui2qYFhHrhZA+7EuXU=
Received: by 10.68.130.40 with SMTP id ob8mr15650482pbb.106.1328258252881;
	Fri, 03 Feb 2012 00:37:32 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id z5sm11478262pbc.5.2012.02.03.00.37.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 00:37:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2012 00:36:17 -0800
Message-Id: <4702c9ae4b2a3e63da7daa75553ffedcfc392536.1328257913.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <a6d38499fa7010e3e96d9a36d9b88231d911a3c8.1328257913.git.raj.khem@gmail.com>
References: <a6d38499fa7010e3e96d9a36d9b88231d911a3c8.1328257913.git.raj.khem@gmail.com>
In-Reply-To: <cover.1328257913.git.raj.khem@gmail.com>
References: <cover.1328257913.git.raj.khem@gmail.com>
Subject: [PATCH 12/14] zlib: Upgrade 1.2.5 -> 1.2.6
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
X-List-Received-Date: Fri, 03 Feb 2012 08:45:28 -0000

Dont use autotools, it really not so autoconf like.
the configure script gets updated with every release of zlib
and we overwrite that. Instead use the upstream provided
configure

copyright year was changed in zlib.h which caused change in
LIC_FILE_CHECKSUM

fix.inverted.LFS.logic.patch is already applied upstream so drop it

Drop the configure.ac and Makefile.am scripts since we do not
autoreconf anymore and do not inherit autotools anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/zlib/files/Makefile.am           |    9 ----
 meta/recipes-core/zlib/files/configure.ac          |   48 --------------------
 .../zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch   |   20 --------
 meta/recipes-core/zlib/zlib_1.2.5.bb               |   41 -----------------
 meta/recipes-core/zlib/zlib_1.2.6.bb               |   26 +++++++++++
 5 files changed, 26 insertions(+), 118 deletions(-)
 delete mode 100644 meta/recipes-core/zlib/files/Makefile.am
 delete mode 100644 meta/recipes-core/zlib/files/configure.ac
 delete mode 100644 meta/recipes-core/zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch
 delete mode 100644 meta/recipes-core/zlib/zlib_1.2.5.bb
 create mode 100644 meta/recipes-core/zlib/zlib_1.2.6.bb

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
-- 
1.7.5.4



