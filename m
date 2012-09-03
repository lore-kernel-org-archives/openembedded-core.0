Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8I-0004vF-Gp
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:55 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2012 03:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497202"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:32 +0100
Message-Id: <e4beecdc940391bfb20d08787ddc8c3617095c74.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 12/28] packagegroup-core-x11*: adjust X11 package groups
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
X-List-Received-Date: Mon, 03 Sep 2012 10:43:55 -0000

Now the Sato pieces have been moved out, rebase packagegroup-core-x11 on
packagegroup-x11-mini but using the structure/contents of meta-oe's
task-x11 so that it can replace that; rename packagegroup-core-x11-mini
to packagegroup-core-x11-base and pull in the xserver/utils packages via
packagegroup-core-x11, and move both of these recipes under
recipes-graphics.

x11-mini is renamed to x11-base as it's what people should build on top
of and since x11-mini is newer, the corresponding IMAGE_FEATURES item is
less likely to be used in existing user recipes.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/core-image.bbclass                    |    6 +--
 meta/recipes-core/images/build-appliance-image.bb  |    2 +-
 .../packagegroups/packagegroup-core-x11-base.bb    |   18 ++++++++
 .../packagegroups/packagegroup-core-x11.bb}        |   24 ++++++-----
 meta/recipes-sato/images/core-image-sato.bb        |    2 +
 .../packagegroups/packagegroup-core-x11.bb         |   45 --------------------
 6 files changed, 37 insertions(+), 60 deletions(-)
 create mode 100644 meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
 rename meta/{recipes-sato/packagegroups/packagegroup-core-x11-mini.bb => recipes-graphics/packagegroups/packagegroup-core-x11.bb} (78%)
 delete mode 100644 meta/recipes-sato/packagegroups/packagegroup-core-x11.bb

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index f748552..a23d3c8 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -13,8 +13,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 # Available IMAGE_FEATURES:
 #
 # - apps-console-core
-# - x11-mini            - minimal environment for X11 server 
-# - x11-base            - X11 server + minimal desktop	
+# - x11                 - X server
+# - x11-base            - X server with minimal environment
 # - x11-sato            - OpenedHand Sato environment
 # - tools-sdk           - SDK
 # - tools-debug         - debugging tools
@@ -26,7 +26,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 # - debug-tweaks        - makes an image suitable for development
 #
 PACKAGE_GROUP_apps-console-core = "packagegroup-core-apps-console"
-PACKAGE_GROUP_x11-mini = "packagegroup-core-x11-mini"
+PACKAGE_GROUP_x11 = "packagegroup-core-x11"
 PACKAGE_GROUP_x11-base = "packagegroup-core-x11-base"
 PACKAGE_GROUP_x11-sato = "packagegroup-core-x11-sato"
 PACKAGE_GROUP_tools-debug = "packagegroup-core-tools-debug"
diff --git a/meta/recipes-core/images/build-appliance-image.bb b/meta/recipes-core/images/build-appliance-image.bb
index a86daa5..09b0361 100644
--- a/meta/recipes-core/images/build-appliance-image.bb
+++ b/meta/recipes-core/images/build-appliance-image.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 PR = "r15"
 
-IMAGE_FEATURES += "x11-mini package-management"
+IMAGE_FEATURES += "x11-base package-management"
 
 # Ensure there's enough space to do a core-image-sato build, with rm_work enabled
 IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
new file mode 100644
index 0000000..eb4b27d
--- /dev/null
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11-base.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Tasks for core X11 applications"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit packagegroup
+
+RDEPENDS_${PN} = "\
+    packagegroup-core-x11-xserver \
+    packagegroup-core-x11-utils \
+    dbus \
+    pointercal \
+    matchbox-terminal \
+    matchbox-wm \
+    mini-x-session \
+    liberation-fonts \
+    "
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-mini.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
similarity index 78%
rename from meta/recipes-sato/packagegroups/packagegroup-core-x11-mini.bb
rename to meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index 432d99d..9563de0 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-mini.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -6,15 +6,15 @@ DESCRIPTION = "Tasks for core X11 applications"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r1"
+PR = "r36"
 
 inherit packagegroup
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-XSERVER ?= "xserver-xorg xf86-video-fbdev xf86-input-evdev"
+PACKAGES = "${PN} ${PN}-xserver ${PN}-utils"
 
-ROOTLESS_X = "1"
+XSERVER ?= "xserver-xorg xf86-video-fbdev xf86-input-evdev"
 
 # xserver-common, x11-common
 VIRTUAL-RUNTIME_xserver_common ?= "x11-common"
@@ -22,18 +22,20 @@ VIRTUAL-RUNTIME_xserver_common ?= "x11-common"
 # elsa, xserver-nodm-init
 VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
 
+RDEPENDS_${PN} = "\
+    ${PN}-xserver \
+    ${PN}-utils \
+    "
 
-RDEPENDS_packagegroup-core-x11-mini = "\
-    dbus \
-    pointercal \
-    matchbox-terminal \
-    matchbox-wm \
-    mini-x-session \
+RDEPENDS_${PN}-xserver = "\
     ${XSERVER} \
+    "
+
+RDEPENDS_${PN}-utils = "\
     ${VIRTUAL-RUNTIME_xserver_common} \
     ${VIRTUAL-RUNTIME_graphical_init_manager} \
-    liberation-fonts \
     xauth \
     xhost \
     xset \
-    xrandr"
+    xrandr \
+    "
diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index 76f9081..6b6c761 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -7,3 +7,5 @@ IMAGE_FEATURES += "apps-console-core package-management x11-base x11-sato ssh-se
 LICENSE = "MIT"
 
 inherit core-image
+
+IMAGE_INSTALL += "packagegroup-core-x11-sato-games"
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11.bb
deleted file mode 100644
index b69cc50..0000000
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-#
-# Copyright (C) 2011 Intel Corporation
-#
-
-DESCRIPTION = "Tasks for core X11 applications"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r36"
-
-inherit packagegroup
-
-PACKAGES = "\
-    packagegroup-core-x11-base \
-    "
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-XSERVER ?= "xserver-xorg xf86-video-fbdev xf86-input-evdev"
-
-# xserver-common, x11-common
-VIRTUAL-RUNTIME_xserver_common ?= "x11-common"
-
-# elsa, xserver-nodm-init
-VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
-
-
-RDEPENDS_packagegroup-core-x11-base = "\
-    dbus \
-    pointercal \
-    matchbox-wm \
-    matchbox-keyboard \
-    matchbox-keyboard-applet \
-    matchbox-keyboard-im \
-    matchbox-panel-2 \
-    matchbox-desktop \
-    matchbox-session \
-    ${XSERVER} \
-    ${VIRTUAL-RUNTIME_xserver_common} \
-    ${VIRTUAL-RUNTIME_graphical_init_manager} \
-    liberation-fonts \
-    xauth \
-    xhost \
-    xset \
-    xrandr"
-- 
1.7.9.5



