Return-Path: <dvhart@linux.intel.com>
X-Greylist: delayed 593 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 May 2014 04:37:34 UTC
Received: from mga01.intel.com (unknown [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 525F666004
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 04:37:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 May 2014 21:27:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,891,1392192000"; d="scan'208";a="536411908"
Received: from msegurah-mobl4.amr.corp.intel.com (HELO localhost)
	([10.254.42.19])
	by fmsmga001.fm.intel.com with ESMTP; 22 May 2014 21:27:42 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 May 2014 21:28:34 -0700
Message-Id: <113fcfb0c3c5533605e87538cd873c4ff90abcfc.1400815619.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1400815619.git.dvhart@linux.intel.com>
References: <cover.1400815619.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1400815619.git.dvhart@linux.intel.com>
References: <cover.1400815619.git.dvhart@linux.intel.com>
Subject: [PATCH 1/1] ddimage: Support Mac OS
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
X-List-Received-Date: Fri, 23 May 2014 04:37:35 -0000

Update the ddimage script to allow it to work on Mac OS too. The biggest
difference is sysfs vs diskutil and in the syntax of the stat command
between Mac OS and Linux, unfortunately. Workarounds using ls, cut, and
columns got really fragile really quickly. Relying on stat and switching
on uname seemed the more robust solution.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/contrib/ddimage | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/scripts/contrib/ddimage b/scripts/contrib/ddimage
index 93ebeaf..b66d0dd 100755
--- a/scripts/contrib/ddimage
+++ b/scripts/contrib/ddimage
@@ -1,7 +1,8 @@
 #!/bin/sh
 
-#BLACKLIST_DEVICES="/dev/sda /dev/sdb /dev/sdc /dev/sdd /dev/sde"
-BLACKLIST_DEVICES="/dev/sda"
+# Default to avoiding the first two disks on typical Linux and Mac OS installs
+# Better safe than sorry :-)
+BLACKLIST_DEVICES="/dev/sda /dev/sdb /dev/disk1 /dev/disk3"
 
 # 1MB blocksize
 BLOCKSIZE=1048576
@@ -14,9 +15,15 @@ image_details() {
 	IMG=$1
 	echo "Image details"
 	echo "============="
-	echo "    image: $(stat --printf '%N\n' $IMG)"
-	echo "     size: $(stat -L --printf '%s bytes\n' $IMG)"
-	echo " modified: $(stat -L --printf '%y\n' $IMG)"
+	echo "    image: $(basename $IMG)"
+	# stat format is different on Mac OS and Linux
+	if [ "$(uname)" = "Darwin" ]; then
+		echo "     size: $(stat -L -f '%z bytes' $IMG)"
+		echo " modified: $(stat -L -f '%Sm' $IMG)"
+	else
+		echo "     size: $(stat -L -c '%s bytes' $IMG)"
+		echo " modified: $(stat -L -c '%y' $IMG)"
+	fi
 	echo "     type: $(file -L -b $IMG)"
 	echo ""
 }
@@ -27,6 +34,14 @@ device_details() {
 
 	echo "Device details"
 	echo "=============="
+
+	# Collect disk info using diskutil on Mac OS
+	if [ "$(uname)" = "Darwin" ]; then
+		diskutil info $DEVICE | egrep "(Device Node|Media Name|Total Size)"
+		return
+	fi
+
+	# Default / Linux information collection
 	echo "  device: $DEVICE"
 	if [ -f "/sys/class/block/$DEV/device/vendor" ]; then
 		echo "  vendor: $(cat /sys/class/block/$DEV/device/vendor)"
-- 
1.9.1


