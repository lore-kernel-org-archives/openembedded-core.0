Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6358B7808D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 21:46:16 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 14:45:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,366,1493708400"; d="scan'208";a="276634031"
Received: from aehernan-mobl1.zpn.intel.com ([10.219.25.105])
	by fmsmga004.fm.intel.com with ESMTP; 20 Jun 2017 14:45:57 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 16:45:51 -0500
Message-Id: <20170620214551.11550-1-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH][krogoth] initrdscripts/init-install*: Add rootwait when installing to USB devices
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
X-List-Received-Date: Tue, 20 Jun 2017 21:46:17 -0000

From: California Sullivan <california.l.sullivan@intel.com>

It can take a bit for USB devices to be detected, so if a USB device is
your rootfs and you don't set rootwait you will most likely get a kernel
panic. Fix this by adding rootwait to the kernel command line on
installation.

Fixes [YOCTO #9462].

(From OE-Core rev: 40e2d36573a7a6bce377b1f9653607065ba5ffb6)

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 6 ++++++
 meta/recipes-core/initrdscripts/files/init-install.sh     | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index f564f4e2d6a..bf8a76b96bb 100644
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
index 72ce92b9640..5f2599e7242 100644
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
2.12.2


