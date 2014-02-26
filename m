Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BB2806DB40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 15:34:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Feb 2014 07:34:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,548,1389772800"; d="scan'208";a="462640710"
Received: from unknown (HELO localhost.localdomain) ([10.255.12.179])
	by orsmga001.jf.intel.com with ESMTP; 26 Feb 2014 07:34:24 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2014 17:34:20 +0200
Message-Id: <1393428860-11433-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] core-image-minimal-initramfs: cause the IMAGE_INSTALL variable to be a limited set
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
X-List-Received-Date: Wed, 26 Feb 2014 15:34:24 -0000

This change causes the IMAGE_INSTALL to be a fixed set of packages
that are know to work and wil not be affected by changes to the
IMAGE_INSTALL variable from the user's local setting.

Since IMAGE_INSTALL is used for all images, but the initramfs needs
to be a well-known sub-set use teh RecipeParsed to finalize it to that
well-known subset.

[YOCTO #5791]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-core/images/core-image-minimal-initramfs.bb | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 46a9dc4..68549f7 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Small image capable of booting a device. The kernel includes \
 the Minimal RAM-based Initial Root Filesystem (initramfs), which finds the \
 first 'init' program more efficiently."
 
-IMAGE_INSTALL = "initramfs-live-boot initramfs-live-install initramfs-live-install-efi busybox udev base-passwd"
+FIXED_IMAGE_INSTALL = "initramfs-live-boot initramfs-live-install initramfs-live-install-efi busybox udev base-passwd"
 
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
@@ -19,3 +19,18 @@ inherit core-image
 IMAGE_ROOTFS_SIZE = "8192"
 
 BAD_RECOMMENDATIONS += "busybox-syslog"
+
+python finalize_image_install_handler () {
+    import bb.event
+    if not e.data:
+        return
+
+    if isinstance(e, bb.event.RecipeParsed):
+        image_install = e.data.getVar('FIXED_IMAGE_INSTALL', True)
+        e.data.setVar('IMAGE_INSTALL', image_install)
+
+}
+
+addhandler finalize_image_install_handler
+finalize_image_install_handler[eventmask] = "bb.event.RecipeParsed"
+
-- 
1.8.3.1


