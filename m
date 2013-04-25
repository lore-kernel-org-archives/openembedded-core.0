Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UVQBC-0001bH-2U
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 19:42:03 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Apr 2013 10:23:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,551,1363158000"; d="scan'208";a="325356001"
Received: from envy2.jf.intel.com (HELO localhost) ([10.7.199.70])
	by orsmga002.jf.intel.com with ESMTP; 25 Apr 2013 10:23:58 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 10:23:51 -0700
Message-Id: <8e2bf476da78d8eaef1606eb8516c45520c3f996.1366910631.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH] mkefidisk: Attempt to automatically unmount target device
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
X-List-Received-Date: Thu, 25 Apr 2013 17:42:03 -0000

With automounters abounding it makes more sense to attempt to unmount
the device rather than abort, just like ddimage does.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index acadd49..741c3ab 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -102,10 +102,14 @@ fi
 #
 grep -q $DEVICE /proc/mounts
 if [ $? -eq 0 ]; then
-	echo "ERROR: $DEVICE partitions mounted:"
-	grep $DEVICE /proc/mounts | cut -f 1 -d " "
-	echo "Unmount the partitions listed and try again."
-	exit 1
+	echo -n "$DEVICE listed in /proc/mounts, attempting to unmount..."
+	umount $DEVICE* 2>/dev/null
+	grep -q $DEVICE /proc/mounts
+	if [ $? -eq 0 ]; then
+		echo "FAILED"
+		exit 1
+	fi
+	echo "OK"
 fi
 
 
@@ -153,6 +157,7 @@ echo "Boot partition size:   $BOOT_SIZE MB ($BOOTFS)"
 echo "ROOTFS partition size: $ROOTFS_SIZE MB ($ROOTFS)"
 echo "Swap partition size:   $SWAP_SIZE MB ($SWAP)"
 echo "*****************"
+
 echo "Deleting partition table on $DEVICE ..."
 dd if=/dev/zero of=$DEVICE bs=512 count=2
 
-- 
1.8.1.2



