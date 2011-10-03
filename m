Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAihV-0005Ww-Ac
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:36:59 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356887bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qnIPuNcYMzfRaHJFtk0QTfPbgPadh4n13KynZ5XZI20=;
	b=Wcdg+dSZy6zXqohvmUt+ea874AGQ6At76TYlwcq8a6KXbUHlQuEbyVja5o2qtXYTOU
	Of9JGruURWl4z2KOrtwDoAlyMP4FiznueVeEv1WoJB2QE4t0oZVIZGGUqIOGu4msO1lf
	H4z8bDZw3hWay04ASOIiGXgRVrA6EjkeGUjI8=
Received: by 10.204.135.90 with SMTP id m26mr9709947bkt.217.1317648686888;
	Mon, 03 Oct 2011 06:31:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w3sm13221341bkp.10.2011.10.03.06.31.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:31:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:49 +0200
Message-Id: <f317e28edf5b2df35704f6716ac6b52f6045f941.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 18/30] libx11: package xcb, merge few changes from meta-oe
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
X-List-Received-Date: Mon, 03 Oct 2011 13:36:59 -0000

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
index 487e796..018a141 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
@@ -19,5 +19,5 @@ DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
 
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
index 1469bc1..18cd10a 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb
@@ -14,4 +14,4 @@ SRC_URI += "file://../libx11-${PV}/x11_disable_makekeys.patch \
             file://../libx11-${PV}/nodolt.patch \
             file://../libx11-${PV}/makekeys_crosscompile.patch"
 
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



