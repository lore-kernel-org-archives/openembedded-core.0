Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8E-0004vG-1C
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:50 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2012 03:31:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497170"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:25 +0100
Message-Id: <ca01e74da870df0c787b9a041c399771d1bf26d1.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 05/28] packagegroup-base: remove some useless items
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
X-List-Received-Date: Mon, 03 Sep 2012 10:43:50 -0000

* Bootloader selection (u-boot, redboot, etc.) is not handled using
  feature selection anymore, so remove these packages
* Realistically there are no packages we can always know that need to
  be installed for a screen/touchscreen these days, so remove these
* Similarly, all RAID configurations can't be supported just using
  one package or list of packages, so remove the raid package.
* Remove default settings of MACHINE_ESSENTIAL_*, these variables
  aren't referred to in this recipe.
* Remove some outdated comments
* Fix indenting

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../packagegroups/packagegroup-base.bb             |   39 ++------------------
 1 file changed, 3 insertions(+), 36 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index ea894b2..85acd1f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -23,16 +23,10 @@ PACKAGES = ' \
             ${@base_contains("MACHINE_FEATURES", "pci", "packagegroup-base-pci", "",d)} \
             ${@base_contains("MACHINE_FEATURES", "pcmcia", "packagegroup-base-pcmcia", "", d)} \
             ${@base_contains("MACHINE_FEATURES", "phone", "packagegroup-base-phone", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "screen", "packagegroup-base-screen", "", d)} \
             ${@base_contains("MACHINE_FEATURES", "serial", "packagegroup-base-serial", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "touchscreen", "packagegroup-base-touchscreen", "", d)} \
             ${@base_contains("MACHINE_FEATURES", "usbgadget", "packagegroup-base-usbgadget", "", d)} \
             ${@base_contains("MACHINE_FEATURES", "usbhost", "packagegroup-base-usbhost", "", d)} \
             \
-            ${@base_contains("MACHINE_FEATURES", "uboot", "packagegroup-base-uboot", "",d)} \
-            ${@base_contains("MACHINE_FEATURES", "redboot", "packagegroup-base-redboot", "",d)} \
-            ${@base_contains("MACHINE_FEATURES", "apex", "packagegroup-base-apex", "",d)} \
-	    \
             ${@base_contains("DISTRO_FEATURES", "bluetooth", "packagegroup-base-bluetooth", "", d)} \
             ${@base_contains("DISTRO_FEATURES", "wifi", "packagegroup-base-wifi", "", d)} \
             ${@base_contains("DISTRO_FEATURES", "3g", "packagegroup-base-3g", "", d)} \
@@ -42,7 +36,6 @@ PACKAGES = ' \
             ${@base_contains("DISTRO_FEATURES", "nfs", "packagegroup-base-nfs", "", d)} \
             ${@base_contains("DISTRO_FEATURES", "ppp", "packagegroup-base-ppp", "", d)} \
             ${@base_contains("DISTRO_FEATURES", "smbfs", "packagegroup-base-smbfs", "", d)} \
-            ${@base_contains("DISTRO_FEATURES", "raid", "packagegroup-base-raid", "",d)} \
             ${@base_contains("DISTRO_FEATURES", "zeroconf", "packagegroup-base-zeroconf", "", d)} \
             \
             '
@@ -55,12 +48,6 @@ ALLOW_EMPTY = "1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 #
-# those ones can be set in machine config to supply packages needed to get machine booting
-#
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
-
-#
 # packagegroup-base contain stuff needed for base system (machine related)
 #
 RDEPENDS_packagegroup-base = "\
@@ -85,9 +72,6 @@ RDEPENDS_packagegroup-base = "\
     ${@base_contains('COMBINED_FEATURES', 'bluetooth', 'packagegroup-base-bluetooth', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'wifi', 'packagegroup-base-wifi', '',d)} \
     ${@base_contains('COMBINED_FEATURES', '3g', 'packagegroup-base-3g', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'uboot', 'packagegroup-base-uboot', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'redboot', 'packagegroup-base-redboot', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'apex', 'packagegroup-base-apex', '',d)} \
     \
     ${@base_contains('DISTRO_FEATURES', 'nfs', 'packagegroup-base-nfs', '',d)} \
     ${@base_contains('DISTRO_FEATURES', 'cramfs', 'packagegroup-base-cramfs', '',d)} \
@@ -95,7 +79,6 @@ RDEPENDS_packagegroup-base = "\
     ${@base_contains('DISTRO_FEATURES', 'ipv6', 'packagegroup-base-ipv6', '',d)} \
     ${@base_contains('DISTRO_FEATURES', 'ipsec', 'packagegroup-base-ipsec', '',d)} \
     ${@base_contains('DISTRO_FEATURES', 'ppp', 'packagegroup-base-ppp', '',d)} \
-    ${@base_contains('DISTRO_FEATURES', 'raid', 'packagegroup-base-raid', '',d)} \
     ${@base_contains('DISTRO_FEATURES', 'zeroconf', 'packagegroup-base-zeroconf', '',d)} \
     "
 
@@ -128,13 +111,13 @@ python __anonymous () {
     machine_features= set(d.getVar("MACHINE_FEATURES", True).split())
 
     if "bluetooth" in distro_features and not "bluetooth" in machine_features and ("pcmcia" in machine_features or "pci" in machine_features or "usbhost" in machine_features):
-	d.setVar("ADD_BT", "packagegroup-base-bluetooth")
+        d.setVar("ADD_BT", "packagegroup-base-bluetooth")
 
     if "wifi" in distro_features and not "wifi" in machine_features and ("pcmcia" in machine_features or "pci" in machine_features or "usbhost" in machine_features):
-	d.setVar("ADD_WIFI", "packagegroup-base-wifi")
+        d.setVar("ADD_WIFI", "packagegroup-base-wifi")
 
     if "3g" in distro_features and not "3g" in machine_features and ("pcmcia" in machine_features or "pci" in machine_features or "usbhost" in machine_features):
-	d.setVar("ADD_3G", "packagegroup-base-3g")
+        d.setVar("ADD_3G", "packagegroup-base-3g")
 }
 
 #
@@ -188,8 +171,6 @@ RRECOMMENDS_packagegroup-base-alsa = "\
 RDEPENDS_packagegroup-base-pcmcia = "\
     pcmciautils \
     "
-#${@base_contains('DISTRO_FEATURES', 'wifi', 'prism-firmware', '',d)}
-#${@base_contains('DISTRO_FEATURES', 'wifi', 'spectrum-fw', '',d)}
 
 
 RRECOMMENDS_packagegroup-base-pcmcia = "\
@@ -203,8 +184,6 @@ RRECOMMENDS_packagegroup-base-pcmcia = "\
     ${@base_contains('DISTRO_FEATURES', 'wifi', 'kernel-module-orinoco-cs', '',d)} \
     ${@base_contains('DISTRO_FEATURES', 'wifi', 'kernel-module-spectrum-cs', '',d)}"
 
-# Provide bluez-utils-compat utils for the time being, the binaries in that package will vanish soon from upstream releases, so beware! 
-
 RDEPENDS_packagegroup-base-bluetooth = "\
     bluez4 \
     ${@base_contains('COMBINED_FEATURES', 'alsa', 'libasound-module-bluez', '',d)} \
@@ -333,18 +312,6 @@ RRECOMMENDS_packagegroup-base-nfs = "\
 RDEPENDS_packagegroup-base-zeroconf = "\
     avahi-daemon"
 
-RDEPENDS_packagegroup-base-raid = "\
-	"
-
-RDEPENDS_packagegroup-base-screen = "\
-	"
-
-#
-# GPE/OPIE/OpenMoko provide own touchscreen calibration utils
-#
-RDEPENDS_packagegroup-base-touchscreen = "\
-    "
-
 RDEPENDS_packagegroup-base-ipv6 = "\
     "
 
-- 
1.7.9.5



