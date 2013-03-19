Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UI555-0003Ai-AD
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 23:32:32 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Mar 2013 15:15:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,874,1355126400"; d="scan'208";a="304767352"
Received: from envy.jf.intel.com (HELO localhost) ([10.7.199.65])
	by orsmga002.jf.intel.com with ESMTP; 19 Mar 2013 15:15:22 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2013 15:15:04 -0700
Message-Id: <94a9904b812ca1491d88458758a7700112548dbc.1363731212.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1363731212.git.dvhart@linux.intel.com>
References: <cover.1363731212.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1363731212.git.dvhart@linux.intel.com>
References: <cover.1363731212.git.dvhart@linux.intel.com>
Subject: [PATCH 4/6] mkefidisk: Always use rootwait and document kernel parameters used
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
X-List-Received-Date: Tue, 19 Mar 2013 22:32:36 -0000

Without a reliable way of knowing if the target device with be an
asyncronous block device on the target (MMC or USB), err on the side of
caution of always specifcy "rootwait", ensuring the kernel will wait for
the device to appear and not abort if it hasn't appeared in time for
mount.

Document the remaining kernel parameters added by this script on the
same line as rootwait.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 9275ecf..f8c08dd 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -132,9 +132,7 @@ ROOTFS_START=$((BOOT_SIZE))
 ROOTFS_END=$((ROOTFS_START+ROOTFS_SIZE))
 SWAP_START=$((ROOTFS_END))
 
-# MMC devices are special in a couple of ways
-# 1) they use a partition prefix character 'p'
-# 2) they are detected asynchronously (need ROOTWAIT)
+# MMC devices use a partition prefix character 'p'
 PART_PREFIX=""
 if [ ! "${DEVICE#/dev/mmcblk}" = "${DEVICE}" ]; then
 	PART_PREFIX="p"
@@ -143,11 +141,9 @@ BOOTFS=$DEVICE${PART_PREFIX}1
 ROOTFS=$DEVICE${PART_PREFIX}2
 SWAP=$DEVICE${PART_PREFIX}3
 
-ROOTWAIT=""
 TARGET_PART_PREFIX=""
 if [ ! "${TARGET_DEVICE#/dev/mmcblk}" = "${TARGET_DEVICE}" ]; then
 	TARGET_PART_PREFIX="p"
-	ROOTWAIT="rootwait"
 fi
 TARGET_ROOTFS=$TARGET_DEVICE${TARGET_PART_PREFIX}2
 TARGET_SWAP=$TARGET_DEVICE${TARGET_PART_PREFIX}3
@@ -250,10 +246,14 @@ sed -i "/menuentry 'install'/,/^}/d" $GRUBCFG
 sed -i "/initrd /d" $GRUBCFG
 # Delete any LABEL= strings
 sed -i "s/ LABEL=[^ ]*/ /" $GRUBCFG
-# Replace the ramdisk root (if any) with the install device and include other
-# kernel parameters
+# Remove any existing root= kernel parameters and:
+# o Add a root= parameter with the target rootfs
+# o Specify ro so fsck can be run during boot
+# o Specify rootwait in case the target media is an asyncronous block device
+#   such as MMC or USB disks
+# o Specify "quiet" to minimize boot time when using slow serial consoles
 sed -i "s@ root=[^ ]*@ @" $GRUBCFG
-sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS ro $ROOTWAIT quiet @" $GRUBCFG
+sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS ro rootwait quiet @" $GRUBCFG
 
 # Provide a startup.nsh script for older firmware with non-standard boot
 # directories and paths.
-- 
1.8.1.2



