Return-Path: <bruno.bottazzini@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5B46676F33
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 19:22:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Sep 2015 12:22:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,450,1437462000"; d="scan'208";a="760229992"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
	by orsmga001.jf.intel.com with ESMTP; 01 Sep 2015 12:22:49 -0700
Received: from orsmsx111.amr.corp.intel.com (10.22.240.12) by
	ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 1 Sep 2015 12:22:48 -0700
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX111.amr.corp.intel.com (10.22.240.12) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 1 Sep 2015 12:22:48 -0700
Received: from bottazzini-ThinkPad-T430.bz.intel.com (10.218.99.154) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 1 Sep 2015 12:22:47 -0700
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Sep 2015 16:22:21 -0300
Message-ID: <1441135341-2048-1-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>
MIME-Version: 1.0
X-Originating-IP: [10.218.99.154]
Subject: [PATCH] scripts: Create interactive menu for mkefidisk script
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
X-List-Received-Date: Tue, 01 Sep 2015 19:22:56 -0000
Content-Type: text/plain

If it is passed only the image parameter, it will show some interactive
options to help to conclude the script.

With this patch it will detect devices available in the machine, asking
to choose what it is wanted to be flashed.

it will suggest the target device. If it is a SD card the suggestion
is /dev/mmcblk0. If it is a pendrive it will suggest to use /dev/sda.

Signed-off-by: Bruno Bottazzini <bruno.bottazzini@intel.com>
---
 scripts/contrib/mkefidisk.sh | 60 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 55 insertions(+), 5 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 55f72b0..7628de7 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -152,8 +152,52 @@ unmount() {
 # Parse and validate arguments
 #
 if [ $# -lt 3 ] || [ $# -gt 4 ]; then
-	usage
-	exit 1
+    if [ $# -eq 1 ]; then
+        AVAILABLE_DISK=`fdisk -l | grep "Disk /" | cut -f 1 -d ':' | cut -f 2 -d ' '`
+        if [ -z "$AVAILABLE_DISK" ]; then
+            die "Starting mkefidisk.sh as root is required"
+        fi
+        echo "Available disks are"
+        X=0
+        for line in `echo $AVAILABLE_DISK`; do
+            info "$X - $line"
+            X=`expr $X + 1`
+        done
+        read -p "Choose flashable device number: " DISK_NUMBER
+        X=0
+        for line in `echo $AVAILABLE_DISK`; do
+            if [ $DISK_NUMBER -eq $X ]; then
+                DISK_TO_BE_FLASHED=$line
+                break
+            else
+                X=`expr $X + 1`
+            fi
+        done
+        if [ -z "$DISK_TO_BE_FLASHED" ]; then
+            die "Option \"$DISK_NUMBER\" is invalid. Choose a valid option"
+        else
+            if [ -z `echo $DISK_TO_BE_FLASHED | grep "mmc"` ]; then
+                TARGET_TO_BE_BOOT="/dev/sda"
+            else
+                TARGET_TO_BE_BOOT="/dev/mmcblk0"
+            fi
+        fi
+        echo ""
+        echo "Choose a name of the device that will be boot from"
+        echo -n "Recommended name is: "
+        info "$TARGET_TO_BE_BOOT\n"
+        read -p "Is target device okay? [y/N]: " RESPONSE
+        if [ "$RESPONSE" != "y" ]; then
+            read -p "Choose target device name: " TARGET_TO_BE_BOOT
+        fi
+        echo ""
+        if [ -z "$TARGET_TO_BE_BOOT" ]; then
+            die "Error: choose a valid target name"
+        fi
+    else
+        usage
+	    exit 1
+    fi
 fi
 
 if [ "$1" = "-v" ]; then
@@ -162,9 +206,15 @@ if [ "$1" = "-v" ]; then
 	shift
 fi
 
-DEVICE=$1
-HDDIMG=$2
-TARGET_DEVICE=$3
+if [ -z "$AVAILABLE_DISK" ]; then
+    DEVICE=$1
+    HDDIMG=$2
+    TARGET_DEVICE=$3
+else
+    DEVICE=$DISK_TO_BE_FLASHED
+    HDDIMG=$1
+    TARGET_DEVICE=$TARGET_TO_BE_BOOT
+fi
 
 LINK=$(readlink $DEVICE)
 if [ $? -eq 0 ]; then
-- 
2.5.0


