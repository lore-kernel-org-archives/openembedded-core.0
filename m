Return-Path: <florian.boor@kernelconcepts.de>
Received: from mail.kernelconcepts.de (mail.kernelconcepts.de [212.60.202.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9EABC7372E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 10:15:27 +0000 (UTC)
Received: from [192.168.2.78] (helo=serenity.kc.loc)
	by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1YSNNU-00057y-NG; Mon, 02 Mar 2015 11:15:08 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Mar 2015 11:15:13 +0100
Message-Id: <1425291313-9669-1-git-send-email-florian.boor@kernelconcepts.de>
X-Mailer: git-send-email 1.7.10.4
Cc: Florian Boor <florian@kernelconcepts.de>
Subject: [meta-oe][PATCH] fltk: Replace use of freetype-config with pkg-config Drop blacklist entry
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
X-List-Received-Date: Mon, 02 Mar 2015 10:15:32 -0000

From: Florian Boor <florian@kernelconcepts.de>

Tested building for MIPS 32bit QEMU

Signed-off-by: Florian Boor <florian@kernelconcepts.de>
---
 .../fltk/fltk-1.1.10/fltk-no-freetype-config.patch   |   18 ++++++++++++++++++
 meta-oe/recipes-support/fltk/fltk_1.1.10.bb          |    7 +++----
 2 files changed, 21 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/fltk/fltk-1.1.10/fltk-no-freetype-config.patch

diff --git a/meta-oe/recipes-support/fltk/fltk-1.1.10/fltk-no-freetype-config.patch b/meta-oe/recipes-support/fltk/fltk-1.1.10/fltk-no-freetype-config.patch
new file mode 100644
index 0000000..5dbb054
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk-1.1.10/fltk-no-freetype-config.patch
@@ -0,0 +1,18 @@
+--- a/configure.in.orig	2015-03-01 16:00:35.956432907 +0100
++++ b/configure.in	2015-03-01 16:04:23.269580093 +0100
+@@ -865,11 +865,11 @@
+         AC_ARG_ENABLE(xft, [  --enable-xft            turn on Xft support [default=no]])
+ 
+ 	if test x$enable_xft = xyes; then
+-            AC_PATH_PROG(FTCONFIG,freetype-config)
++            AC_PATH_PROG(PKGCONFIG,pkg-config)
+ 
+-	    if test "x$FTCONFIG" != x; then
+-	        CPPFLAGS="`$FTCONFIG --cflags` $CPPFLAGS"
+-	        CXXFLAGS="`$FTCONFIG --cflags` $CXXFLAGS"
++	    if test "x$PKGCONFIG" != x; then
++	        CPPFLAGS="`$PKGCONFIG --cflags xft` $CPPFLAGS"
++	        CXXFLAGS="`$PKGCONFIG --cflags xft` $CXXFLAGS"
+ 
+ 		AC_CHECK_HEADER(X11/Xft/Xft.h,
+ 		    AC_CHECK_LIB(Xft, XftDrawCreate,
diff --git a/meta-oe/recipes-support/fltk/fltk_1.1.10.bb b/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
index 4fd3645..3229ed0 100644
--- a/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
+++ b/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
@@ -6,19 +6,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1c0b73db66884b6a925e727400315130"
 
 DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft"
 
-PR = "r1"
-
-PNBLACKLIST[fltk] ?= "broken: still uses /usr/bin/freetype-config"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/fltk/${PV}/fltk-${PV}-source.tar.bz2 \
            file://disable_test.patch \
            file://dso-fix.patch \
            file://libpng15.patch \
+           file://fltk-no-freetype-config.patch \
 "
 
 S = "${WORKDIR}/fltk-${PV}"
 
-inherit lib_package autotools-brokensep binconfig
+inherit lib_package autotools-brokensep binconfig pkgconfig
 
 TARGET_CC_ARCH += "${LDFLAGS} -DXFT_MAJOR=2"
 
-- 
1.7.10.4


