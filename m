Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 402097226D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 13:02:27 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 21 Apr 2015 06:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,616,1422950400"; d="scan'208";a="559403101"
Received: from ppiorkow-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.9.218])
	by orsmga003.jf.intel.com with ESMTP; 21 Apr 2015 06:02:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 14:01:54 +0100
Message-Id: <de1b3fd1b31aaf60dccb7c81ecfa548bbd349efe.1429621253.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429621253.git.paul.eggleton@linux.intel.com>
References: <cover.1429621253.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1429621253.git.paul.eggleton@linux.intel.com>
References: <cover.1429621253.git.paul.eggleton@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/3] mkefidisk.sh: use script mode when running parted
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
X-List-Received-Date: Tue, 21 Apr 2015 13:02:27 -0000

This avoids parted showing prompts and thus effectively hanging the
script in in the case of initially malformed disks.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index b96b7d4..74cf40d 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -218,11 +218,11 @@ mkdir $BOOTFS_MNT || die "Failed to create $BOOTFS_MNT"
 #
 # Partition $DEVICE
 #
-DEVICE_SIZE=$(parted $DEVICE unit mb print | grep ^Disk | cut -d" " -f 3 | sed -e "s/MB//")
+DEVICE_SIZE=$(parted -s $DEVICE unit mb print | grep ^Disk | cut -d" " -f 3 | sed -e "s/MB//")
 # If the device size is not reported there may not be a valid label
 if [ "$DEVICE_SIZE" = "" ] ; then
-	parted $DEVICE mklabel msdos || die "Failed to create MSDOS partition table"
-	DEVICE_SIZE=$(parted $DEVICE unit mb print | grep ^Disk | cut -d" " -f 3 | sed -e "s/MB//")
+	parted -s $DEVICE mklabel msdos || die "Failed to create MSDOS partition table"
+	DEVICE_SIZE=$(parted -s $DEVICE unit mb print | grep ^Disk | cut -d" " -f 3 | sed -e "s/MB//")
 fi
 SWAP_SIZE=$((DEVICE_SIZE*SWAP_RATIO/100))
 ROOTFS_SIZE=$((DEVICE_SIZE-BOOT_SIZE-SWAP_SIZE))
@@ -262,22 +262,22 @@ debug "Deleting partition table on $DEVICE"
 dd if=/dev/zero of=$DEVICE bs=512 count=2 >$OUT 2>&1 || die "Failed to zero beginning of $DEVICE"
 
 debug "Creating new partition table (MSDOS) on $DEVICE"
-parted $DEVICE mklabel msdos >$OUT 2>&1 || die "Failed to create MSDOS partition table"
+parted -s $DEVICE mklabel msdos >$OUT 2>&1 || die "Failed to create MSDOS partition table"
 
 debug "Creating boot partition on $BOOTFS"
-parted $DEVICE mkpart primary 0% $BOOT_SIZE >$OUT 2>&1 || die "Failed to create BOOT partition"
+parted -s $DEVICE mkpart primary 0% $BOOT_SIZE >$OUT 2>&1 || die "Failed to create BOOT partition"
 
 debug "Enabling boot flag on $BOOTFS"
-parted $DEVICE set 1 boot on >$OUT 2>&1 || die "Failed to enable boot flag"
+parted -s $DEVICE set 1 boot on >$OUT 2>&1 || die "Failed to enable boot flag"
 
 debug "Creating ROOTFS partition on $ROOTFS"
-parted $DEVICE mkpart primary $ROOTFS_START $ROOTFS_END >$OUT 2>&1 || die "Failed to create ROOTFS partition"
+parted -s $DEVICE mkpart primary $ROOTFS_START $ROOTFS_END >$OUT 2>&1 || die "Failed to create ROOTFS partition"
 
 debug "Creating swap partition on $SWAP"
-parted $DEVICE mkpart primary $SWAP_START 100% >$OUT 2>&1 || die "Failed to create SWAP partition"
+parted -s $DEVICE mkpart primary $SWAP_START 100% >$OUT 2>&1 || die "Failed to create SWAP partition"
 
 if [ $DEBUG -eq 1 ]; then
-	parted $DEVICE print
+	parted -s $DEVICE print
 fi
 
 
-- 
2.1.0


