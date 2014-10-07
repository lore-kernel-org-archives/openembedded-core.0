Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F195D6B7CA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Oct 2014 21:30:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Oct 2014 14:30:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,673,1406617200"; d="scan'208";a="611020692"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 07 Oct 2014 14:30:03 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Oct 2014 00:30:01 +0300
Message-Id: <1412717401-26740-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] runqemu: switch touchscreen emulation to HID tablet
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
X-List-Received-Date: Tue, 07 Oct 2014 21:30:07 -0000

The Wacom tablet as emulated by qemu is no longer
supported in the current form in linux 3.17.
Switching to USB HID tablet qemu emulation in runqemu.
Proper mouse integration is provided.

Partial fix for issue [YOCTO #6810].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 scripts/runqemu-internal | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 38745dd..38b9908 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -116,7 +116,7 @@ ORIG_STTY=$(stty -g)
 if [ "$SLIRP_ENABLED" = "yes" ]; then
     KERNEL_NETWORK_CMD="ip=dhcp"
     QEMU_TAP_CMD=""
-    QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
+    QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice tablet"
     if [ "$KVM_ACTIVE" = "yes" ]; then
         QEMU_NETWORK_CMD=""
         DROOT="/dev/vda"
@@ -261,7 +261,7 @@ else
             ROOTFS_OPTIONS="-hda $ROOTFS"
         fi
         KERNCMDLINE="mem=$QEMU_MEMORY"
-        QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice wacom-tablet"
+        QEMU_UI_OPTIONS="-show-cursor -usb -usbdevice tablet"
 
         NFS_INSTANCE=`echo $TAP | sed 's/tap//'`
         export NFS_INSTANCE
-- 
1.9.1


