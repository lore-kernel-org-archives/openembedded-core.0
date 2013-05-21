Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id 30D2162235
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 15:08:53 +0000 (UTC)
Received: from i7-990x.r-finger.com
	(host86-137-102-112.range86-137.btcentralplus.com [86.137.102.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 08F779531
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 16:08:53 +0100 (BST)
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 16:08:42 +0100
Message-Id: <1369148923-20676-4-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369148923-20676-1-git-send-email-tf+lists.yocto@r-finger.com>
References: <1369148923-20676-1-git-send-email-tf+lists.yocto@r-finger.com>
Subject: [PATCH 3/4] clutter: further improvements
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
   gtk-doc class),
 * Moved more configure options into PACKAGECONFIG,
 * Fixed missing comma in PACKAGECONFIG[glx] setup,
 * Removed no longer required DOLT-related config fragment.

Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
---
 meta/recipes-graphics/clutter/clutter-1.0.inc |   22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
index 6710776..e1d3cf4 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -6,7 +6,7 @@ inherit clutter
 
 SRC_URI += "file://enable_tests.patch"
 
-DEPENDS = "gtk-doc-native pango glib-2.0 json-glib atk udev cogl-1.0"
+DEPENDS = "pango glib-2.0 json-glib atk udev cogl-1.0"
 PACKAGES =+ "${PN}-examples"
 AUTOTOOLS_AUXDIR = "${S}/build"
 
@@ -18,28 +18,23 @@ EDEPENDS_EVDEV = "libxkbcommon"
 ERDEPENDS_EVDEV = "xkeyboard-config"
 
 # Disable pretty much everything, override in platform specific set up
-EXTRA_OECONF += "--disable-gtk-doc		\
-	     	 ${@get_fpu_setting(bb, d)}	\
-             	 --disable-introspection	\
-	     	 --disable-egl-backend		\
+EXTRA_OECONF += "--disable-introspection	\
 	     	 --disable-quartz-backend	\
 	     	 --disable-win32-backend	\
-	     	 --disable-x11-backend		\
 	     	 --disable-gdk-backend		\
 	     	 --disable-wayland-backend	\
 	     	 --disable-wayland-compositor	\
 	     	 --disable-cex100-backend	\
 	     	 --disable-tslib-input		\
-	     	 --disable-evdev-input		\
 	    	"
 
-PACKAGECONFIG[x11] = "--enable-x11-backend,,${EDEPENDS_X11}"
-PACKAGECONFIG[glx] = "--enable-x11-backend,,${EDEPENDS_X11} ${EDEPENDS_GLX}"
-PACKAGECONFIG[egl] = "--enable-egl-backend,,${EDEPENDS_EGL}"
-PACKAGECONFIG[evdev] = "--enable-evdev-input,,${EDEPENDS_EVDEV},${ERDEPENDS_EVDEV}"
+PACKAGECONFIG[x11] = "--enable-x11-backend,--disable-x11-backend,${EDEPENDS_X11}"
+PACKAGECONFIG[glx] = ",,${EDEPENDS_X11} ${EDEPENDS_GLX}"
+PACKAGECONFIG[egl] = "--enable-egl-backend,--disable-egl-backend,${EDEPENDS_EGL}"
+PACKAGECONFIG[evdev] = "--enable-evdev-input,--disable-evdev-input,${EDEPENDS_EVDEV},${ERDEPENDS_EVDEV}"
 
 # Default configuration, distros might want to override
-PACKAGECONFIG ??= "glx"
+PACKAGECONFIG ??= "x11 glx"
 
 FILES_${PN}-examples = "${bindir}/test-* ${pkgdatadir}/redhand.png"
 
@@ -50,7 +45,4 @@ do_configure_prepend() {
 
 	# see https://bugzilla.gnome.org/show_bug.cgi?id=661128 for this
 	touch -t 200001010000 po/clutter-1.0.pot
-
-	# Disable DOLT
-	sed -i -e 's/^DOLT//' ${S}/configure.ac
 }
-- 
1.7.10.4


