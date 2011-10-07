Received: from mail-dy0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCDzo-00063d-8A
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:14:04 +0200
Received: by mail-dy0-f47.google.com with SMTP id 17so236438dyk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=UqDnBOhfsDejz5OyrOg4F1nhuCxRCpY1Xsq5Jed1njI=;
	b=b74EuFIXksx1tmgj3O/4IEgvHy073aRGQWgL4cpm+5GxKv42IDRjVn8HuLn703kv5T
	Pv/YozFK6dyCgrhRw6W2UOQaKs1n0dZxxQXXapanZC0Okhgq98EnwJ7evL9s5FFLUcln
	rzFWceUEGkB/A4tDaglnLCdxzFQUuYIXuhRrk=
Received: by 10.223.15.25 with SMTP id i25mr11886760faa.31.1318007309349;
	Fri, 07 Oct 2011 10:08:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x22sm13633668faa.5.2011.10.07.10.08.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:08:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:17 +0200
Message-Id: <a906afccda836001ac5a8a4b4e211133fca86335.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 22/31] libx11: package xcb, merge few changes from meta-oe
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
X-List-Received-Date: Fri, 07 Oct 2011 17:14:04 -0000

* move --with-keysymdef/--with-keysymdefdir setting to recipes (newer
  versions are using keysymdefdir instead keysymdef
* fix MIN_REHASH in makekeys by sed call

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb  |    2 +-
 meta/recipes-graphics/xorg-lib/libx11-diet_git.bb  |    2 +-
 .../recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb |    2 +-
 meta/recipes-graphics/xorg-lib/libx11-trim_git.bb  |    2 +-
 meta/recipes-graphics/xorg-lib/libx11.inc          |   25 ++++++++++++-------
 meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb     |    2 +-
 meta/recipes-graphics/xorg-lib/libx11_git.bb       |    2 +
 7 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
index e7ad2d8..d97a5b8 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
@@ -22,5 +22,5 @@ DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libx11"
 
-EXTRA_OECONF += "--without-xcb --disable-udc --disable-xcms --disable-xlocale"
+EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h --without-xcb --disable-udc --disable-xcms --disable-xlocale"
 CFLAGS += "-D_GNU_SOURCE"
diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_git.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_git.bb
index dea7faf..4cda779 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_git.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_git.bb
@@ -13,5 +13,5 @@ DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
 
 SRCREV = "d23aad31338e7d869d878d5aa1b6b91d20287005"
 
-EXTRA_OECONF += "--without-xcb --disable-udc --disable-xcms --disable-xlocale"
+EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h --without-xcb --disable-udc --disable-xcms --disable-xlocale"
 CFLAGS += "-D_GNU_SOURCE"
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb
index 5a63c53..3c33de9 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb
@@ -17,4 +17,4 @@ SRC_URI += "file://../libx11-${PV}/x11_disable_makekeys.patch \
 SRC_URI[md5sum] = "f65c9c7ecbfb64c19dbd7927160d63fd"
 SRC_URI[sha256sum] = "88d7238ce5f7cd123450567de7a3b56a43556e4ccc45df38b8324147c889a844"
 
-EXTRA_OECONF += "--disable-xcms --with-xcb"
+EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h --disable-xcms --with-xcb"
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_git.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_git.bb
index 730efe1..d1bf67b 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_git.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim_git.bb
@@ -8,6 +8,6 @@ SRCREV = "d23aad31338e7d869d878d5aa1b6b91d20287005"
 
 DEPENDS += "libxcb xproto xextproto xtrans libxau kbproto inputproto xf86bigfontproto xproto-native"
 
-EXTRA_OECONF += "--disable-xcms --with-xcb"
+EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h --disable-xcms --with-xcb"
 CFLAGS += "-D_GNU_SOURCE"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
index 455753f..748a48c 100644
--- a/meta/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta/recipes-graphics/xorg-lib/libx11.inc
@@ -11,32 +11,39 @@ inherit siteinfo
 PROVIDES = "virtual/libx11"
 
 XORG_PN = "libX11"
-LEAD_SONAME = "libX11.so"
+LICENSE = "MIT & MIT-style & BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
-EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h --disable-specs"
+EXTRA_OECONF += "--with-groff=no --with-ps2pdf=no --with-fop=no --disable-specs"
+
+PACKAGES =+ "${PN}-xcb"
 
 FILES_${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${libdir}/X11/Xcms.txt"
+FILES_${PN}-xcb += "${libdir}/libX11-xcb.so.*"
 FILES_${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
 
-do_compile() {
+do_compile_prepend() {
 	cd ${S}/src/util
 	mv makekeys.c.orig makekeys.c || true
 	touch makekeys-makekeys.o
 	(
 		unset CC LD CXX CCLD CFLAGS CPPFLAGS LDFLAGS CXXFLAGS
+		# MIN_REHASH 10 is only in 1.0.1
+		sed -i -e 's:MIN_REHASH 10:MIN_REHASH 16:g' makekeys.c
+		sed -i -e 's:MIN_REHASH 15:MIN_REHASH 16:g' makekeys.c
+		touch makekeys-makekeys.o;
 		if [ "${SITEINFO_BITS}" == "64" ]; then
-                        ${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} makekeys.c -o makekeys
-                else
-                        ${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} -DUSE32 makekeys.c -o makekeys
-                fi
+			${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} makekeys.c -o makekeys
+		else
+			${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} -DUSE32 makekeys.c -o makekeys
+		fi
 	)
 	if [ "$?" != "0" ]; then
 		exit 1
 	fi
 	# mv to stop it getting rebuilt
 	mv makekeys.c makekeys.c.orig
-	cd ${S}
-	oe_runmake
+	cd ../../
 }
 
 # Multiple libx11 derivatives from from this file and are selected by virtual/libx11
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
index f98bbe8..ffec7d1 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
@@ -30,6 +30,6 @@ DEPENDS_virtclass-nativesdk += "bigreqsproto xproto xextproto \
 XCB = "--with-xcb"
 XCB_virtclass-native = "--without-xcb"
 XCB_virtclass-nativesdk = "--without-xcb"
-EXTRA_OECONF += "${XCB}"
+EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h ${XCB}"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/libx11_git.bb b/meta/recipes-graphics/xorg-lib/libx11_git.bb
index 4da80bd..afa1560 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_git.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_git.bb
@@ -11,4 +11,6 @@ DEPENDS = "xproto xextproto xcmiscproto xf86bigfontproto kbproto inputproto \
 
 DEFAULT_PREFERENCE = "-1"
 
+EXTRA_OECONF += "--with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h"
+
 BBCLASSEXTEND = "nativesdk"
-- 
1.7.7



