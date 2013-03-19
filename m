Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UI552-0003AX-Q2
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 23:32:30 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Mar 2013 15:15:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,874,1355126400"; d="scan'208";a="304767353"
Received: from envy.jf.intel.com (HELO localhost) ([10.7.199.65])
	by orsmga002.jf.intel.com with ESMTP; 19 Mar 2013 15:15:22 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2013 15:15:06 -0700
Message-Id: <4937a2369946171db2f84833e997702f820d37bc.1363731212.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1363731212.git.dvhart@linux.intel.com>
References: <cover.1363731212.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1363731212.git.dvhart@linux.intel.com>
References: <cover.1363731212.git.dvhart@linux.intel.com>
Subject: [PATCH 6/6] mkefidisk: Use msdos partition tables
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
X-List-Received-Date: Tue, 19 Mar 2013 22:32:33 -0000

While GPT works fine when writing to actual media, it cannot be reliably
used for distributing disk images as it requires the backup table to be
on the last block on the device, which of course varies from device to
device. Use MSDOS tables instead.

Use mkfs to label the filesystems as msdos tables do not support
partition labeling.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 6ff12af..acadd49 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -156,20 +156,18 @@ echo "*****************"
 echo "Deleting partition table on $DEVICE ..."
 dd if=/dev/zero of=$DEVICE bs=512 count=2
 
-echo "Creating new partition table (GPT) on $DEVICE ..."
-parted $DEVICE mklabel gpt
+# Use MSDOS by default as GPT cannot be reliably distributed in disk image form
+# as it requires the backup table to be on the last block of the device, which
+# of course varies from device to device.
+echo "Creating new partition table (MSDOS) on $DEVICE ..."
+parted $DEVICE mklabel msdos
 
 echo "Creating boot partition on $BOOTFS"
 parted $DEVICE mkpart primary 0% $BOOT_SIZE
 
-# GPT doesn't have a real boot flag, parted will change the GUID to EFI System
-# Partition, which is what we want
 echo "Enabling boot flag on $BOOTFS"
 parted $DEVICE set 1 boot on
 
-echo "Labeling $BOOTFS as EFI System Partition"
-parted $DEVICE name 1 "EFI System Partition"
-
 echo "Creating ROOTFS partition on $ROOTFS"
 parted $DEVICE mkpart primary $ROOTFS_START $ROOTFS_END
 
@@ -184,10 +182,10 @@ parted $DEVICE print
 #
 echo ""
 echo "Formatting $BOOTFS as vfat..."
-mkfs.vfat $BOOTFS
+mkfs.vfat $BOOTFS -n "efi"
 
 echo "Formatting $ROOTFS as ext3..."
-mkfs.ext3 $ROOTFS
+mkfs.ext3 $ROOTFS -L "root"
 
 echo "Formatting swap partition...($SWAP)"
 mkswap $SWAP
-- 
1.8.1.2



