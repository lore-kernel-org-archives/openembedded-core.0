Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UVTyg-0004J9-CQ
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 23:45:20 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Apr 2013 14:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,553,1363158000"; d="scan'208";a="325622407"
Received: from envy2.jf.intel.com (HELO localhost) ([10.7.199.70])
	by orsmga002.jf.intel.com with ESMTP; 25 Apr 2013 14:27:33 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 14:27:29 -0700
Message-Id: <8f406a3b7d0effba9c2cf67191453b6662d6e0b3.1366925249.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH] mkefidisk: Unmount after partitioning
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
X-List-Received-Date: Thu, 25 Apr 2013 21:45:23 -0000

Some automounters are rather overzealous and like to mount things
immediately after partitioning. This can happen if the disk is being
reused and the partitions align exactly with the existing partitions
which have already been formatted. Move the unmount code into a function
and call it before and after partitioning.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 741c3ab..0c15104 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -71,6 +71,20 @@ function device_details() {
 	echo ""
 }
 
+function unmount_device() {
+	grep -q $DEVICE /proc/mounts
+	if [ $? -eq 0 ]; then
+		echo -n "$DEVICE listed in /proc/mounts, attempting to unmount..."
+		umount $DEVICE* 2>/dev/null
+		grep -q $DEVICE /proc/mounts
+		if [ $? -eq 0 ]; then
+			echo "FAILED"
+			exit 1
+		fi
+		echo "OK"
+	fi
+}
+
 
 #
 # Parse and validate arguments
@@ -100,17 +114,7 @@ fi
 #
 # Check if any $DEVICE partitions are mounted
 #
-grep -q $DEVICE /proc/mounts
-if [ $? -eq 0 ]; then
-	echo -n "$DEVICE listed in /proc/mounts, attempting to unmount..."
-	umount $DEVICE* 2>/dev/null
-	grep -q $DEVICE /proc/mounts
-	if [ $? -eq 0 ]; then
-		echo "FAILED"
-		exit 1
-	fi
-	echo "OK"
-fi
+unmount_device
 
 
 #
@@ -183,6 +187,12 @@ parted $DEVICE print
 
 
 #
+# Check if any $DEVICE partitions are mounted after partitioning
+#
+unmount_device
+
+
+#
 # Format $DEVICE partitions
 #
 echo ""
-- 
1.8.1.2



