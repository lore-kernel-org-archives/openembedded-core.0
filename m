Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id DD6E961A80
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 11:04:23 +0000 (UTC)
Received: from i7-990x.r-finger.com
	(host86-137-102-112.range86-137.btcentralplus.com [86.137.102.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id AC7FE952B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 12:04:24 +0100 (BST)
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 12:04:15 +0100
Message-Id: <1369134259-12091-5-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369134259-12091-1-git-send-email-tf+lists.yocto@r-finger.com>
References: <1368789942-7476-1-git-send-email-tf+lists.yocto@r-finger.com>
	<1369134259-12091-1-git-send-email-tf+lists.yocto@r-finger.com>
Subject: [PATCH v3 4/8] fix clutter
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
X-List-Received-Date: Tue, 21 May 2013 11:04:24 -0000

From: Tomas Frydrych <tomas@sleepfive.com>


Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
---
 meta/recipes-graphics/clutter/clutter-1.0.inc |   22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
index 6710776..9b4b169 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -17,29 +17,24 @@ EDEPENDS_EGL = "virtual/egl"
 EDEPENDS_EVDEV = "libxkbcommon"
 ERDEPENDS_EVDEV = "xkeyboard-config"
 
-# Disable pretty much everything, override in platform specific set up
-EXTRA_OECONF += "--disable-gtk-doc		\
-	     	 ${@get_fpu_setting(bb, d)}	\
-             	 --disable-introspection	\
-	     	 --disable-egl-backend		\
+# Disable backends we do not currently support building
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


