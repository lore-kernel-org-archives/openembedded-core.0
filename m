Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id E3C0E62235
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 15:08:52 +0000 (UTC)
Received: from i7-990x.r-finger.com
	(host86-137-102-112.range86-137.btcentralplus.com [86.137.102.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id BA1A49530
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 16:08:53 +0100 (BST)
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 16:08:41 +0100
Message-Id: <1369148923-20676-3-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369148923-20676-1-git-send-email-tf+lists.yocto@r-finger.com>
References: <1369148923-20676-1-git-send-email-tf+lists.yocto@r-finger.com>
Subject: [PATCH 2/4] cogl: further improvements
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
X-List-Received-Date: Tue, 21 May 2013 15:08:53 -0000

From: Tomas Frydrych <tomas@sleepfive.com>

 * Removed unnecessary gtk-doc related depends/configure options (handled in
   gtk-doc class)
 * Moved more configure options into PACKAGECONFIG
 * Fixed typo in RDEPENDS of PACKAGECONFIG[gl] setup
 * Removed no longer needed DOLT-related configure fragment

Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc |   24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 17d8629..3a6de28 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -4,7 +4,7 @@ LICENSE = "LGPLv2.1+"
 
 inherit clutter
 
-DEPENDS = "gtk-doc-native pango glib-2.0 gdk-pixbuf"
+DEPENDS = "pango glib-2.0 gdk-pixbuf"
 PACKAGES =+ "${PN}-examples"
 AUTOTOOLS_AUXDIR = "${S}/build"
 
@@ -21,38 +21,30 @@ ERDEPENDS_GL    = "libgl"
 ERDEPENDS_GLES2 = "libgles2"
 
 EXTRA_OECONF += "--disable-introspection	\
-	       	 --disable-gtk-doc		\
-	       	 ${@get_fpu_setting(bb, d)}	\
 	       	 --enable-examples-install	\
 	       	 --enable-debug		 	\
-	       	 --disable-gl			\
 	       	 --disable-gles1		\
-	       	 --disable-gles2		\
-	       	 --disable-glx			\
 	    	"
 
 # GL flavours
-PACKAGECONFIG[gl] = "--enable-gl,,${EDEPENDS_GL},${ERDPENDS_GL}"
-PACKAGECONFIG[gles2] = "--enable-gles2,,${EDEPENDS_GLES2}, ${ERDEPENDS_GLES2}"
+PACKAGECONFIG[gl] = "--enable-gl,--disable-gl,${EDEPENDS_GL},${ERDEPENDS_GL}"
+PACKAGECONFIG[gles2] = "--enable-gles2,--disable-gles2,${EDEPENDS_GLES2}, ${ERDEPENDS_GLES2}"
 
 # egl backends
-PACKAGECONFIG[egl-kms] = "--enable-kms-egl-platform,,${EDEPENDS_KMS}"
-PACKAGECONFIG[egl-null] = "--enable-null-egl-platform"
-PACKAGECONFIG[egl-x11] = "--enable-xlib-egl-platform,,${EDEPENDS_X11}"
+PACKAGECONFIG[egl-kms] = "--enable-kms-egl-platform,--disable-kms-egl-platform,${EDEPENDS_KMS}"
+PACKAGECONFIG[egl-null] = "--enable-null-egl-platform,--disable-null-egl-platform"
+PACKAGECONFIG[egl-x11] = "--enable-xlib-egl-platform,--disable-xlib-egl-platform,${EDEPENDS_X11}"
 
 # glx
-PACKAGECONFIG[glx] = "--enable-gl --enable-glx, ${EDEPENDS_GL} ${EDEPENDS_X11}"
+PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,${EDEPENDS_GL} ${EDEPENDS_X11}"
 
 # Default to GLX
-PACKAGECONFIG ??= "glx"
+PACKAGECONFIG ??= "gl glx"
 
 #Fix up some weirdness in the docs
 do_configure_prepend() {
         sed -i s:doc/reference/Makefile::g ${S}/configure.ac
         sed -i s:doc::g ${S}/Makefile.am
-
-	# Disable DOLT
-	sed -i -e 's/^DOLT//' ${S}/configure.ac
 }
 
 FILES_${PN}-examples = "${bindir}/* ${datadir}/cogl/examples-data/*"
-- 
1.7.10.4


