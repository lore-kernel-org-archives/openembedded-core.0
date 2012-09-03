Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8F-0004vF-LJ
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:52 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2012 03:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497194"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:30 +0100
Message-Id: <827f2898a551aa53ec9e5dfb3f2eaeacb59305e0.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/28] packagegroup-core-x11: move out Sato applications
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 10:43:52 -0000

Move Sato applications to packagegroup-core-x11-sato.

Note that this eliminates both the apps-x11-core and apps-x11-games
IMAGE_FEATURES; in practice it is unlikely these were useful to anyone
outside of the Sato images however.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/core-image.bbclass                    |    4 --
 meta/recipes-core/images/core-image-core.bb        |    5 +--
 meta/recipes-graphics/images/core-image-clutter.bb |    2 +-
 meta/recipes-sato/images/core-image-sato.bb        |    2 +-
 .../packagegroups/packagegroup-core-x11-sato.bb    |   40 ++++++++++++++++----
 .../packagegroups/packagegroup-core-x11.bb         |   17 ---------
 6 files changed, 37 insertions(+), 33 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index a85a9ea..f748552 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -16,8 +16,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 # - x11-mini            - minimal environment for X11 server 
 # - x11-base            - X11 server + minimal desktop	
 # - x11-sato            - OpenedHand Sato environment
-# - apps-x11-core       - X Terminal, file manager, file editor
-# - apps-x11-games
 # - tools-sdk           - SDK
 # - tools-debug         - debugging tools
 # - tools-profile       - profiling tools
@@ -31,8 +29,6 @@ PACKAGE_GROUP_apps-console-core = "packagegroup-core-apps-console"
 PACKAGE_GROUP_x11-mini = "packagegroup-core-x11-mini"
 PACKAGE_GROUP_x11-base = "packagegroup-core-x11-base"
 PACKAGE_GROUP_x11-sato = "packagegroup-core-x11-sato"
-PACKAGE_GROUP_apps-x11-core = "packagegroup-core-apps-x11-core"
-PACKAGE_GROUP_apps-x11-games = "packagegroup-core-apps-x11-games"
 PACKAGE_GROUP_tools-debug = "packagegroup-core-tools-debug"
 PACKAGE_GROUP_tools-profile = "packagegroup-core-tools-profile"
 PACKAGE_GROUP_tools-testapps = "packagegroup-core-tools-testapps"
diff --git a/meta/recipes-core/images/core-image-core.bb b/meta/recipes-core/images/core-image-core.bb
index ea6ba7e..73a707d 100644
--- a/meta/recipes-core/images/core-image-core.bb
+++ b/meta/recipes-core/images/core-image-core.bb
@@ -1,7 +1,6 @@
-DESCRIPTION = "An X11 image with simple applications such as terminal, editor, \
-and file manager."
+DESCRIPTION = "A very basic X11 image with a terminal"
 
-IMAGE_FEATURES += "apps-console-core package-management x11-base apps-x11-core"
+IMAGE_FEATURES += "apps-console-core package-management x11-base"
 
 LICENSE = "MIT"
 
diff --git a/meta/recipes-graphics/images/core-image-clutter.bb b/meta/recipes-graphics/images/core-image-clutter.bb
index 4c5adee..84ceb27 100644
--- a/meta/recipes-graphics/images/core-image-clutter.bb
+++ b/meta/recipes-graphics/images/core-image-clutter.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "An image with support for the Open GL-based toolkit Clutter, \
 which enables development of rich and animated graphical user interfaces."
 
-IMAGE_FEATURES += "apps-console-core package-management x11-base apps-x11-core apps-x11-games x11-sato ssh-server-dropbear"
+IMAGE_FEATURES += "apps-console-core package-management x11-base x11-sato ssh-server-dropbear"
 
 LICENSE = "MIT"
 
diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index 4bbf099..76f9081 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Image with Sato, a mobile environment and visual style for \
 mobile devices. The image supports X11 with a Sato theme, Pimlico \
 applications, and contains terminal, editor, and file manager."
 
-IMAGE_FEATURES += "apps-console-core package-management x11-base apps-x11-core apps-x11-games x11-sato ssh-server-dropbear"
+IMAGE_FEATURES += "apps-console-core package-management x11-base x11-sato ssh-server-dropbear"
 
 LICENSE = "MIT"
 
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index f38e0d2..b31eaba 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -12,25 +12,51 @@ inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+PACKAGES = "${PN} ${PN}-base ${PN}-apps ${PN}-games"
+
+RDEPENDS_${PN} = "\
+    ${PN}-base \
+    ${PN}-apps \
+    ${PN}-games \
+    "
+
 NETWORK_MANAGER ?= "connman-gnome"
 NETWORK_MANAGER_libc-uclibc = ""
 
-WEB ?= ""
-#WEB = "web-webkit"
-
-RDEPENDS_packagegroup-core-x11-sato = "\
+RDEPENDS_${PN}-base = "\
     matchbox-desktop \
     matchbox-session-sato \
     matchbox-keyboard \
+    matchbox-keyboard-applet \
+    matchbox-keyboard-im \
     matchbox-stroke \
     matchbox-config-gtk \
     xcursor-transparent-theme \
     sato-icon-theme \
     settings-daemon \
     gtk-sato-engine \
-    gthumb \
-    x11vnc \
     libsdl \
+    ${NETWORK_MANAGER} \
+    "
+
+# pcmanfm doesn't work on mips
+FILEMANAGER ?= "pcmanfm"
+FILEMANAGER_mips ?= ""
+
+WEB ?= ""
+#WEB = "web-webkit"
+
+RDEPENDS_${PN}-apps = "\
+    gthumb \
+    leafpad \
     gaku \
+    x11vnc \
+    matchbox-terminal \
+    sato-screenshot \
+    ${FILEMANAGER} \
     ${WEB} \
-    ${NETWORK_MANAGER}"
+    "
+
+RDEPENDS_${PN}-games = "\
+    oh-puzzles \
+    "
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11.bb
index 3fe5cae..b69cc50 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11.bb
@@ -11,8 +11,6 @@ PR = "r36"
 inherit packagegroup
 
 PACKAGES = "\
-    packagegroup-core-apps-x11-core \
-    packagegroup-core-apps-x11-games \
     packagegroup-core-x11-base \
     "
 
@@ -20,10 +18,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 XSERVER ?= "xserver-xorg xf86-video-fbdev xf86-input-evdev"
 
-# pcmanfm doesn't work on mips/powerpc
-FILEMANAGER ?= "pcmanfm"
-FILEMANAGER_mips ?= ""
-
 # xserver-common, x11-common
 VIRTUAL-RUNTIME_xserver_common ?= "x11-common"
 
@@ -49,14 +43,3 @@ RDEPENDS_packagegroup-core-x11-base = "\
     xhost \
     xset \
     xrandr"
-
-
-RDEPENDS_packagegroup-core-apps-x11-core = "\
-    leafpad \
-    ${FILEMANAGER} \
-    matchbox-terminal \
-    sato-screenshot"
-
-
-RDEPENDS_packagegroup-core-apps-x11-games = "\
-    oh-puzzles"
-- 
1.7.9.5



