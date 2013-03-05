Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UCtGl-0001jV-5y
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 15:55:13 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Mar 2013 06:38:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,787,1355126400"; d="scan'208";a="209063726"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Mar 2013 06:38:27 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Mar 2013 16:38:23 +0200
Message-Id: <1362494304-10179-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1362494304-10179-1-git-send-email-laurentiu.palcu@intel.com>
References: <1362494304-10179-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 1/2] mesa: rename mesa-dri recipe to just mesa
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
X-List-Received-Date: Tue, 05 Mar 2013 14:55:15 -0000

[YOCTO #3385]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-graphics/mesa/libglu_9.0.0.bb         |    2 +-
 meta/recipes-graphics/mesa/mesa-common.inc         |    4 ++--
 .../mesa/{mesa-dri.inc => mesa.inc}                |   11 ++++++++---
 .../mesa/{mesa-dri_9.0.2.bb => mesa_9.0.2.bb}      |    2 +-
 .../mesa/{mesa-dri_git.bb => mesa_git.bb}          |    4 ++--
 5 files changed, 14 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-dri.inc => mesa.inc} (65%)
 rename meta/recipes-graphics/mesa/{mesa-dri_9.0.2.bb => mesa_9.0.2.bb} (75%)
 rename meta/recipes-graphics/mesa/{mesa-dri_git.bb => mesa_git.bb} (39%)

diff --git a/meta/recipes-graphics/mesa/libglu_9.0.0.bb b/meta/recipes-graphics/mesa/libglu_9.0.0.bb
index 7980749..06d30f9 100644
--- a/meta/recipes-graphics/mesa/libglu_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/libglu_9.0.0.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://include/GL/glu.h;endline=29;md5=6b79c570f644363b356456e7d44471d9 \
                     file://src/libtess/tess.c;endline=29;md5=6b79c570f644363b356456e7d44471d9"
 
-# Epoch as this used to be part of mesa-dri
+# Epoch as this used to be part of mesa
 PE = "2"
 PR = "0"
 
diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 1ff08fb..bedaafb 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -18,7 +18,7 @@ DEPENDS = "expat makedepend-native flex-native bison-native"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
 
-# for mesa-dri and mesa-xlib
+# for mesa and mesa-xlib
 FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
 
 inherit autotools pkgconfig pythonnative
@@ -41,7 +41,7 @@ PACKAGECONFIG[wayland] = ",,wayland"
 # Multiple virtual/gl providers being built breaks staging
 EXCLUDE_FROM_WORLD = "1"
 
-# Remove the mesa-dri dependency on mesa-dri-dev, as mesa-dri is empty
+# Remove the mesa dependency on mesa-dev, as mesa is empty
 RDEPENDS_${PN}-dev = ""
 
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa.inc
similarity index 65%
rename from meta/recipes-graphics/mesa/mesa-dri.inc
rename to meta/recipes-graphics/mesa/mesa.inc
index e43150b..a692bb7 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,11 +18,16 @@ PACKAGECONFIG[egl] = "--enable-egl --with-egl-platforms=${EGL_PLATFORMS}, --disa
 
 python populate_packages_prepend() {
     dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
-
-    do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-dri-driver-%s', 'Mesa %s DRI driver', extra_depends='')
+    
+    pkgs = ['mesa', 'mesa-dev', 'mesa-dbg']
+    pkgs += do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-driver-%s', 'Mesa %s DRI driver', extra_depends='')
+    for pkg in pkgs:
+        d.setVar("RPROVIDES_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
+        d.setVar("RCONFLICTS_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
+        d.setVar("RREPLACES_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
 }
 
-PACKAGES_DYNAMIC += "^mesa-dri-driver-.*"
+PACKAGES_DYNAMIC += "^mesa-driver-.*"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
 
diff --git a/meta/recipes-graphics/mesa/mesa-dri_9.0.2.bb b/meta/recipes-graphics/mesa/mesa_9.0.2.bb
similarity index 75%
rename from meta/recipes-graphics/mesa/mesa-dri_9.0.2.bb
rename to meta/recipes-graphics/mesa/mesa_9.0.2.bb
index 26b56e4..1a1bf24 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_9.0.2.bb
+++ b/meta/recipes-graphics/mesa/mesa_9.0.2.bb
@@ -1,4 +1,4 @@
 require mesa-common.inc
 require mesa-${PV}.inc
-require mesa-dri.inc
+require mesa.inc
 PR = "${INC_PR}.0"
diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
similarity index 39%
rename from meta/recipes-graphics/mesa/mesa-dri_git.bb
rename to meta/recipes-graphics/mesa/mesa_git.bb
index 69a433e..aca4df8 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -1,8 +1,8 @@
 require mesa-common.inc
 require mesa-git.inc
-require mesa-dri.inc
+require mesa.inc
 
-# this needs to be lower than -1 because all mesa-dri have -1 and git version has highest PV, but shouldn't be default
+# this needs to be lower than -1 because all mesa have -1 and git version has highest PV, but shouldn't be default
 DEFAULT_PREFERENCE = "-2"
 
 PR = "${INC_PR}.0"
-- 
1.7.9.5



