Return-Path: <alejandro.joya.cruz@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 085F076F8C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 23:31:37 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 20 Oct 2015 16:31:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,709,1437462000"; d="scan'208";a="668381681"
Received: from afjoyacr-mobl2.zpn.intel.com ([10.219.128.70])
	by orsmga003.jf.intel.com with ESMTP; 20 Oct 2015 16:31:37 -0700
From: Alejandro Joya <alejandro.joya.cruz@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 18:31:16 -0500
Message-Id: <1445383876-15185-1-git-send-email-alejandro.joya.cruz@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCH v2] busybox: add virtual reference instead
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
X-List-Received-Date: Tue, 20 Oct 2015 23:31:38 -0000

These recipes have a hardcoded dependency to busybox,
in order to be able to have a flexible selection,
instead of the hardcoded dependency, now it is point to  virtual reference
base-utils.

Signed-off-by: Alejandro Joya <alejandro.joya.cruz@intel.com>
---
 meta/conf/distro/include/default-providers.inc             | 3 +++
 meta/recipes-core/images/core-image-minimal-initramfs.bb   | 2 +-
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 +-
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb  | 4 ++--
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 9f84d5c..bb382bd 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -13,6 +13,7 @@ PREFERRED_PROVIDER_virtual/mesa ?= "mesa"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg-utils"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-utils-native"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
+PREFERRED_PROVIDER_virtual/base-utils ?= "busybox"
 PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
 
 #
@@ -23,6 +24,8 @@ VIRTUAL-RUNTIME_apm ?= "apm"
 VIRTUAL-RUNTIME_alsa-state ?= "alsa-state"
 VIRTUAL-RUNTIME_getopt ?= "util-linux-getopt"
 VIRTUAL-RUNTIME_wireless-tools ?= "iw wireless-tools"
+VIRTUAL-RUNTIME_base-utils ?= "busybox"
+VIRTUAL-RUNTIME_base-utils-hwclock ?= "busybox-hwclock"
 
 #
 # Default recipe providers
diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 1f0fa95..a26286e 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Small image capable of booting a device. The kernel includes \
 the Minimal RAM-based Initial Root Filesystem (initramfs), which finds the \
 first 'init' program more efficiently."
 
-PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install initramfs-live-install-efi busybox udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
+PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install initramfs-live-install-efi ${VIRTUAL-RUNTIME_base-utils} udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
 
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 6c37b9a..0664a95 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Modular initramfs system"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-RDEPENDS_${PN} += "busybox"
+RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_base-utils}"
 
 PR = "r2"
 
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 09f5373..7e40445 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -24,7 +24,7 @@ VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
 VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 
-SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 'busybox-hwclock', '', d)} \
+SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc','${VIRTUAL-RUNTIME_base-utils-hwclock}', '', d)} \
                     modutils-initscripts \
                     init-ifupdown \
                     ${VIRTUAL-RUNTIME_initscripts} \
@@ -33,7 +33,7 @@ SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 'busybox-hwc
 RDEPENDS_${PN} = "\
     base-files \
     base-passwd \
-    busybox \
+    ${VIRTUAL-RUNTIME_base-utils} \
     ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "${SYSVINIT_SCRIPTS}", "", d)} \
     ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
     netbase \
-- 
2.1.0


