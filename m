Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8H-0004vj-Qf
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Sep 2012 03:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497235"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:41 +0100
Message-Id: <c78de732119eba20308fd4f19fb057d6b2905eb3.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 21/28] packagegroup-core-console: remove
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
X-List-Received-Date: Mon, 03 Sep 2012 10:43:54 -0000

This provides one package group, packagegroup-core-apps-console, which
is usually brought in by adding "apps-console-core" to IMAGE_FEATURES.
Aside from the naming inconsistencies, this is a group of mostly
unrelated packages, none of which are actually "apps". Handling each
one:

* dbus: should mostly be brought in by package runtime dependencies
* avahi-daemon: if you are using packagegroup-base (as all images that
  inherit from core-image do) this is brought in by having "zeroconf" in
  DISTRO_FEATURES.
* portmap: not very useful by itself; should be brought in by selecting
  NFS server/client through other means.
* psplash (or whatever SPLASH is set to): this has been changed to be
  an explicit item "splash" in IMAGE_FEATURES. Since this is a fairly
  fundamental feature, a piece of code has been added to automatically
  handle this for images still using apps-console-core (and show a
  warning).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/core-image.bbclass                    |   10 ++++++++--
 meta/classes/image.bbclass                         |    4 ++++
 meta/recipes-core/images/core-image-base.bb        |    2 +-
 .../packagegroups/packagegroup-core-console.bb     |   20 --------------------
 .../packagegroups/packagegroup-core-sdk.bb         |    1 -
 meta/recipes-extended/images/core-image-basic.bb   |    2 +-
 meta/recipes-extended/images/core-image-lsb-dev.bb |    2 +-
 meta/recipes-extended/images/core-image-lsb-sdk.bb |    2 +-
 meta/recipes-extended/images/core-image-lsb.bb     |    2 +-
 meta/recipes-graphics/images/core-image-clutter.bb |    2 +-
 meta/recipes-graphics/images/core-image-x11.bb     |    2 +-
 meta/recipes-sato/images/core-image-sato.bb        |    2 +-
 12 files changed, 20 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-core/packagegroups/packagegroup-core-console.bb

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 6a391d5..2bfadb4 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -12,7 +12,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 #
 # Available IMAGE_FEATURES:
 #
-# - apps-console-core
 # - x11                 - X server
 # - x11-base            - X server with minimal environment
 # - x11-sato            - OpenedHand Sato environment
@@ -25,7 +24,6 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 # - ssh-server-openssh  - SSH server (openssh)
 # - debug-tweaks        - makes an image suitable for development
 #
-PACKAGE_GROUP_apps-console-core = "packagegroup-core-apps-console"
 PACKAGE_GROUP_x11 = "packagegroup-core-x11"
 PACKAGE_GROUP_x11-base = "packagegroup-core-x11-base"
 PACKAGE_GROUP_x11-sato = "packagegroup-core-x11-sato"
@@ -47,6 +45,14 @@ IMAGE_FEATURES_REPLACES_ssh-server-openssh = "ssh-server-dropbear"
 # IMAGE_FEATURES_CONFLICTS_foo = 'bar1 bar2'
 # An error exception would be raised if both image features foo and bar1(or bar2) are included
 
+python __anonymous() {
+    # Ensure we still have a splash screen for existing images
+    if base_contains("IMAGE_FEATURES", "apps-console-core", "1", "", d) == "1":
+        bb.warn("%s: apps-console-core in IMAGE_FEATURES is no longer supported; adding \"splash\" to enable splash screen" % d.getVar("PN", True))
+        d.appendVar("IMAGE_FEATURES", " splash")
+}
+
+
 CORE_IMAGE_BASE_INSTALL = '\
     packagegroup-core-boot \
     packagegroup-base-extended \
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 0f6ab38..2e95556 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -39,6 +39,10 @@ def normal_groups(d):
     features = set(oe.data.typed_value('IMAGE_FEATURES', d))
     return features.difference(extras)
 
+# Define some very basic feature package groups
+SPLASH ?= "psplash"
+PACKAGE_GROUP_splash = "${SPLASH}"
+
 # Wildcards specifying complementary packages to install for every package that has been explicitly
 # installed into the rootfs
 def complementary_globs(featurevar, d):
diff --git a/meta/recipes-core/images/core-image-base.bb b/meta/recipes-core/images/core-image-base.bb
index 30c8dd1..8ef3376 100644
--- a/meta/recipes-core/images/core-image-base.bb
+++ b/meta/recipes-core/images/core-image-base.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A console-only image that fully supports the target device \
 hardware."
 
-IMAGE_FEATURES += "apps-console-core"
+IMAGE_FEATURES += "splash"
 
 LICENSE = "MIT"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-console.bb b/meta/recipes-core/packagegroups/packagegroup-core-console.bb
deleted file mode 100644
index 0c5e7f1..0000000
--- a/meta/recipes-core/packagegroups/packagegroup-core-console.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-#
-# Copyright (C) 2011 Intel Corporation
-#
-
-DESCRIPTION = "Tasks for core console applications"
-LICENSE = "MIT"
-PR = "r35"
-
-inherit packagegroup
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SPLASH ?= "psplash"
-
-RDEPENDS_packagegroup-core-apps-console = "\
-    avahi-daemon \
-    dbus \
-    portmap \
-    ${SPLASH}"
-
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index 8d7bbac..e944ec5 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -4,7 +4,6 @@
 
 DESCRIPTION = "Software Development Tasks for OpenedHand Poky"
 LICENSE = "MIT"
-DEPENDS = "packagegroup-core-console"
 PR = "r8"
 
 inherit packagegroup
diff --git a/meta/recipes-extended/images/core-image-basic.bb b/meta/recipes-extended/images/core-image-basic.bb
index 9aa880e..06f15a8 100644
--- a/meta/recipes-extended/images/core-image-basic.bb
+++ b/meta/recipes-extended/images/core-image-basic.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A foundational basic image without support for X that can be \
 reasonably used for customization."
 
-IMAGE_FEATURES += "apps-console-core ssh-server-openssh"
+IMAGE_FEATURES += "splash ssh-server-openssh"
 
 IMAGE_INSTALL = "\
     packagegroup-core-boot \
diff --git a/meta/recipes-extended/images/core-image-lsb-dev.bb b/meta/recipes-extended/images/core-image-lsb-dev.bb
index 557259b..013efb9 100644
--- a/meta/recipes-extended/images/core-image-lsb-dev.bb
+++ b/meta/recipes-extended/images/core-image-lsb-dev.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Basic image without X support suitable for development work. It \
 can be used for customization and implementations that conform to Linux \
 Standard Base (LSB)."
 
-IMAGE_FEATURES += "apps-console-core dev-pkgs ssh-server-openssh"
+IMAGE_FEATURES += "splash dev-pkgs ssh-server-openssh"
 
 IMAGE_INSTALL = "\
     ${CORE_IMAGE_BASE_INSTALL} \
diff --git a/meta/recipes-extended/images/core-image-lsb-sdk.bb b/meta/recipes-extended/images/core-image-lsb-sdk.bb
index d07f90d..abddb76 100644
--- a/meta/recipes-extended/images/core-image-lsb-sdk.bb
+++ b/meta/recipes-extended/images/core-image-lsb-sdk.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Basic image without X support suitable for Linux Standard Base \
 (LSB) implementations. It includes the full meta-toolchain, plus development \
 headers and libraries to form a standalone SDK."
 
-IMAGE_FEATURES += "apps-console-core tools-sdk dev-pkgs ssh-server-openssh \
+IMAGE_FEATURES += "splash tools-sdk dev-pkgs ssh-server-openssh \
 	tools-debug tools-profile tools-testapps debug-tweaks"
 
 
diff --git a/meta/recipes-extended/images/core-image-lsb.bb b/meta/recipes-extended/images/core-image-lsb.bb
index 8435596..2c47dc6 100644
--- a/meta/recipes-extended/images/core-image-lsb.bb
+++ b/meta/recipes-extended/images/core-image-lsb.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A foundational basic image without support for X that can be \
 reasonably used for customization and is suitable for implementations that \
 conform to Linux Standard Base (LSB)."
 
-IMAGE_FEATURES += "apps-console-core ssh-server-openssh"
+IMAGE_FEATURES += "splash ssh-server-openssh"
 
 IMAGE_INSTALL = "\
     ${CORE_IMAGE_BASE_INSTALL} \
diff --git a/meta/recipes-graphics/images/core-image-clutter.bb b/meta/recipes-graphics/images/core-image-clutter.bb
index 496246e..b0f25cf 100644
--- a/meta/recipes-graphics/images/core-image-clutter.bb
+++ b/meta/recipes-graphics/images/core-image-clutter.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "An image with support for the Open GL-based toolkit Clutter, \
 which enables development of rich and animated graphical user interfaces."
 
-IMAGE_FEATURES += "apps-console-core package-management x11-base x11-sato ssh-server-dropbear"
+IMAGE_FEATURES += "splash package-management x11-base x11-sato ssh-server-dropbear"
 
 LICENSE = "MIT"
 
diff --git a/meta/recipes-graphics/images/core-image-x11.bb b/meta/recipes-graphics/images/core-image-x11.bb
index 73a707d..64dc053 100644
--- a/meta/recipes-graphics/images/core-image-x11.bb
+++ b/meta/recipes-graphics/images/core-image-x11.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "A very basic X11 image with a terminal"
 
-IMAGE_FEATURES += "apps-console-core package-management x11-base"
+IMAGE_FEATURES += "splash package-management x11-base"
 
 LICENSE = "MIT"
 
diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index 6b6c761..f52a1a5 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Image with Sato, a mobile environment and visual style for \
 mobile devices. The image supports X11 with a Sato theme, Pimlico \
 applications, and contains terminal, editor, and file manager."
 
-IMAGE_FEATURES += "apps-console-core package-management x11-base x11-sato ssh-server-dropbear"
+IMAGE_FEATURES += "splash package-management x11-base x11-sato ssh-server-dropbear"
 
 LICENSE = "MIT"
 
-- 
1.7.9.5



