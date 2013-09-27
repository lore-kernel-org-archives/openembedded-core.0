Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 175F961005
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 01:01:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8R11lsY014487
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 18:01:47 -0700 (PDT)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 26 Sep 2013 18:01:45 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 26 Sep 2013 20:01:20 -0500
Message-ID: <1380243680-13770-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [v2 PATCH] mkefidisk.sh: Allow using a loopback mounted file
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
X-List-Received-Date: Fri, 27 Sep 2013 01:01:44 -0000
Content-Type: text/plain

It should be possible to generate a disk to a file using a loopback
device with mkefidisk.sh, which is useful for booting simulators.  To
make this possible the partitions for the loop back need to work
similarly to the mmc devices.  The mkfs.vfat also requires and
additional argument to force it to write to something other then a
real disk.

Example:
  qemu-img create -f raw bigdisk 4G
  dev=`sudo losetup -f`
  sudo losetup $dev bigdisk
  mkefidisk.sh $dev tmp-eglibc/deploy/images/qemux86/core-image-minimal-qemux86.hddimg /dev/sda
  sudo losetup -d $dev

Note:
  Also a bug was fixed in the mkefidisk.sh where if the disk you are
  writing to initially has an invalid label the size of the first
  partition will be computed incorrectly.  For the simulator disk
  creation this is generally always the case, but this can happen with
  real hardware as well.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 scripts/contrib/mkefidisk.sh |   14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index af06b4b..c86849d 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -134,6 +134,11 @@ fi
 # Partition $DEVICE
 #
 DEVICE_SIZE=$(parted $DEVICE unit mb print | grep ^Disk | cut -d" " -f 3 | sed -e "s/MB//")
+# If the device size is not reported there may not be a valid label
+if [ "$DEVICE_SIZE" = "" ] ; then
+	parted $DEVICE mklabel msdos
+	DEVICE_SIZE=$(parted $DEVICE unit mb print | grep ^Disk | cut -d" " -f 3 | sed -e "s/MB//")
+fi
 SWAP_SIZE=$((DEVICE_SIZE*SWAP_RATIO/100))
 ROOTFS_SIZE=$((DEVICE_SIZE-BOOT_SIZE-SWAP_SIZE))
 ROOTFS_START=$((BOOT_SIZE))
@@ -142,7 +147,7 @@ SWAP_START=$((ROOTFS_END))
 
 # MMC devices use a partition prefix character 'p'
 PART_PREFIX=""
-if [ ! "${DEVICE#/dev/mmcblk}" = "${DEVICE}" ]; then
+if [ ! "${DEVICE#/dev/mmcblk}" = "${DEVICE}" ] || [ ! "${DEVICE#/dev/loop}" = "${DEVICE}" ]; then
 	PART_PREFIX="p"
 fi
 BOOTFS=$DEVICE${PART_PREFIX}1
@@ -197,7 +202,12 @@ unmount_device
 #
 echo ""
 echo "Formatting $BOOTFS as vfat..."
-mkfs.vfat $BOOTFS -n "efi"
+if [ ! "${DEVICE#/dev/loop}" = "${DEVICE}" ]; then
+	mkfs.vfat -I $BOOTFS -n "efi"
+else
+	mkfs.vfat $BOOTFS -n "efi"
+
+fi
 
 echo "Formatting $ROOTFS as ext3..."
 mkfs.ext3 $ROOTFS -L "root"
-- 
1.7.9.5


