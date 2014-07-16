Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8AB6B705E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 21:16:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2014 14:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,673,1400050800"; d="scan'208";a="544425853"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga001.jf.intel.com with ESMTP; 16 Jul 2014 14:16:13 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 14:16:03 +0000
Message-Id: <d3dadd84743514183e2e41764e41cdc3209adeb2.1405520111.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1405520111.git.dvhart@linux.intel.com>
References: <cover.1405520111.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1405520111.git.dvhart@linux.intel.com>
References: <cover.1405520111.git.dvhart@linux.intel.com>
Subject: [PATCH 7/8] mkefidisk.sh: Make the rootfs copy the last step
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
X-List-Received-Date: Wed, 16 Jul 2014 21:16:17 -0000

Copying the rootfs is the most time intensive task. Move it last so if
we are to encounter other errors, we do so quickly and error out.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 6cc6b78..85e58ef 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -294,16 +294,6 @@ mount -o loop $HDDIMG_MNT/rootfs.img $HDDIMG_ROOTFS_MNT || error "Failed to moun
 mount $ROOTFS $ROOTFS_MNT || error "Failed to mount $ROOTFS on $ROOTFS_MNT"
 mount $BOOTFS $BOOTFS_MNT || error "Failed to mount $BOOTFS on $BOOTFS_MNT"
 
-echo "Copying ROOTFS files..."
-cp -a $HDDIMG_ROOTFS_MNT/* $ROOTFS_MNT || error "Root FS copy failed"
-
-echo "$TARGET_SWAP     swap             swap       defaults              0 0" >> $ROOTFS_MNT/etc/fstab
-
-# We dont want udev to mount our root device while we're booting...
-if [ -d $ROOTFS_MNT/etc/udev/ ] ; then
-	echo "$TARGET_DEVICE" >> $ROOTFS_MNT/etc/udev/mount.blacklist
-fi
-
 echo "Preparing boot partition..."
 EFIDIR="$BOOTFS_MNT/EFI/BOOT"
 cp $HDDIMG_MNT/vmlinuz $BOOTFS_MNT || error "Failed to copy vmlinuz"
@@ -356,6 +346,18 @@ if [ ! -e $GRUB_CFG ] && [ ! -e $GUMMI_CFG ]; then
 	die "No EFI bootloader configuration found"
 fi
 
+
+info "Copying ROOTFS files (this may take a while)"
+cp -a $HDDIMG_ROOTFS_MNT/* $ROOTFS_MNT || die "Root FS copy failed"
+
+echo "$TARGET_SWAP     swap             swap       defaults              0 0" >> $ROOTFS_MNT/etc/fstab
+
+# We dont want udev to mount our root device while we're booting...
+if [ -d $ROOTFS_MNT/etc/udev/ ] ; then
+	echo "$TARGET_DEVICE" >> $ROOTFS_MNT/etc/udev/mount.blacklist
+fi
+
+
 # Call cleanup to unmount devices and images and remove the TMPDIR
 cleanup
 
-- 
2.0.0


