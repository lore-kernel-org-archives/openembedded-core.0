Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1635D7E9FF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 04:20:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jul 2019 21:13:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,442,1557212400"; d="scan'208";a="166050097"
Received: from aradinsa-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.181.235])
	by orsmga003.jf.intel.com with ESMTP; 01 Jul 2019 21:13:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2019 16:12:45 +1200
Message-Id: <24303f66435b1e8a5b58948ce97530b055631ecd.1562040724.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1562040724.git.paul.eggleton@linux.intel.com>
References: <cover.1562040724.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] scripts/contrib/ddimage: replace blacklist with mount check
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
X-List-Received-Date: Tue, 02 Jul 2019 04:20:09 -0000
Content-Transfer-Encoding: 8bit

The blacklist, whilst previously useful for safety, is now becoming
obsolete - on my current system, the main storage is at /dev/nvme* and
if I plug in a USB stick it shows up as /dev/sdb which was previously
blacklisted. To make this more flexible, remove the blacklist and
instead check if the specified device is mounted, has a partition
that is mounted, or is otherwise in use according to the kernel, and
show an appropriate error and quit if so.

To make this robust, also ensure we handle where the specified device is
a symlink to another device.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/ddimage | 80 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 67 insertions(+), 13 deletions(-)

diff --git a/scripts/contrib/ddimage b/scripts/contrib/ddimage
index 01ff4318514..a7dc5f7487b 100755
--- a/scripts/contrib/ddimage
+++ b/scripts/contrib/ddimage
@@ -3,10 +3,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
-# Default to avoiding the first two disks on typical Linux and Mac OS installs
-# Better safe than sorry :-)
-BLACKLIST_DEVICES="/dev/sda /dev/sdb /dev/disk1 /dev/disk2"
-
 # 1MB blocksize
 BLOCKSIZE=1048576
 
@@ -32,7 +28,6 @@ image_details() {
 }
 
 device_details() {
-	DEV=$1
 	BLOCK_SIZE=512
 
 	echo "Device details"
@@ -45,7 +40,13 @@ device_details() {
 	fi
 
 	# Default / Linux information collection
-	echo "  device: $DEVICE"
+	ACTUAL_DEVICE=`readlink -f $DEVICE`
+	DEV=`basename $ACTUAL_DEVICE`
+	if [ "$ACTUAL_DEVICE" != "$DEVICE" ] ; then
+		echo "  device: $DEVICE -> $ACTUAL_DEVICE"
+	else
+		echo "  device: $DEVICE"
+	fi
 	if [ -f "/sys/class/block/$DEV/device/vendor" ]; then
 		echo "  vendor: $(cat /sys/class/block/$DEV/device/vendor)"
 	else
@@ -64,6 +65,49 @@ device_details() {
 	echo ""
 }
 
+check_mount_device() {
+	if cat /proc/self/mounts | awk '{ print $1 }' | grep /dev/ | grep -q -E "^$1$" ; then
+		return 0
+	fi
+	return 1
+}
+
+is_mounted() {
+	if [ "$(uname)" = "Darwin" ]; then
+		if df | awk '{ print $1 }' | grep /dev/ | grep -q -E "^$1(s[0-9]+)?$" ; then
+			return 0
+		fi
+	else
+		if check_mount_device $1 ; then
+			return 0
+		fi
+		DEV=`basename $1`
+		if [ -d /sys/class/block/$DEV/ ] ; then
+			PARENT_BLKDEV=`basename $(readlink -f "/sys/class/block/$DEV/..")`
+			if [ "$PARENT_BLKDEV" != "block" ] ; then
+				if check_mount_device $PARENT_BLKDEV ; then
+					return 0
+				fi
+			fi
+			for CHILD_BLKDEV in `find /sys/class/block/$DEV/ -mindepth  1 -maxdepth 1 -name "$DEV*" -type d`
+			do
+				if check_mount_device /dev/`basename $CHILD_BLKDEV` ; then
+					return 0
+				fi
+			done
+		fi
+	fi
+	return 1
+}
+
+is_inuse() {
+	HOLDERS_DIR="/sys/class/block/`basename $1`/holders"
+	if [ -d $HOLDERS_DIR ] && [ `ls -A $HOLDERS_DIR` ] ; then
+		return 0
+	fi
+	return 1
+}
+
 if [ $# -ne 2 ]; then
 	usage
 	exit 1
@@ -78,13 +122,23 @@ if [ ! -e "$IMAGE" ]; then
 	exit 1
 fi
 
+if [ "$(uname)" = "Darwin" ]; then
+	# readlink doesn't support -f on MacOS, just assume it isn't a symlink
+	ACTUAL_DEVICE=$DEVICE
+else
+	ACTUAL_DEVICE=`readlink -f $DEVICE`
+fi
+if is_mounted $ACTUAL_DEVICE ; then
+	echo "ERROR: Device $DEVICE is currently mounted - check if this is the right device, and unmount it first if so"
+	device_details
+	exit 1
+fi
+if is_inuse $ACTUAL_DEVICE ; then
+	echo "ERROR: Device $DEVICE is currently in use (possibly part of LVM) - check if this is the right device!"
+	device_details
+	exit 1
+fi
 
-for i in ${BLACKLIST_DEVICES}; do
-	if [ "$i" = "$DEVICE" ]; then
-		echo "ERROR: Device $DEVICE is blacklisted"
-		exit 1
-	fi
-done
 
 if [ ! -w "$DEVICE" ]; then
 	echo "ERROR: Device $DEVICE does not exist or is not writable"
@@ -93,7 +147,7 @@ if [ ! -w "$DEVICE" ]; then
 fi
 
 image_details $IMAGE
-device_details $(basename $DEVICE)
+device_details
 
 printf "Write $IMAGE to $DEVICE [y/N]? "
 read RESPONSE
-- 
2.20.1


