Return-Path: <california.l.sullivan@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9D36473D27
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 17:39:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 09 Aug 2016 10:39:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,495,1464678000"; d="scan'208";a="1032573297"
Received: from clsulliv.jf.intel.com ([10.7.201.156])
	by orsmga002.jf.intel.com with ESMTP; 09 Aug 2016 10:39:12 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2016 13:35:52 -0700
Message-Id: <1470774952-29320-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 1/1] initrdscripts/init-install*: Add rootwait when installing to USB devices
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
X-List-Received-Date: Tue, 09 Aug 2016 17:39:15 -0000

It can take a bit for USB devices to be detected, so if a USB device is
your rootfs and you don't set rootwait you will most likely get a kernel
panic. Fix this by adding rootwait to the kernel command line on
installation.

Fixes [YOCTO #9462].

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 6 ++++++
 meta/recipes-core/initrdscripts/files/init-install.sh     | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index f564f4e..bf8a76b 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -144,6 +144,12 @@ if [ ! "${device#/dev/mmcblk}" = "${device}" ]; then
     part_prefix="p"
     rootwait="rootwait"
 fi
+
+# USB devices also require rootwait
+if [ -n `readlink /dev/disk/by-id/usb* | grep $TARGET_DEVICE_NAME` ]; then
+    rootwait="rootwait"
+fi
+
 bootfs=${device}${part_prefix}1
 rootfs=${device}${part_prefix}2
 swap=${device}${part_prefix}3
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 72ce92b..5f2599e 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -152,6 +152,11 @@ if [ ! "${device#/dev/mmcblk}" = "${device}" ]; then
     rootwait="rootwait"
 fi
 
+# USB devices also require rootwait
+if [ -n `readlink /dev/disk/by-id/usb* | grep $TARGET_DEVICE_NAME` ]; then
+    rootwait="rootwait"
+fi
+
 if [ $grub_version -eq 0 ] ; then
     bios_boot=''
     bootfs=${device}${part_prefix}1
-- 
2.5.5


