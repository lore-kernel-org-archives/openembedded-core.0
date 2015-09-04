Return-Path: <bruno.bottazzini@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1343F7704D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 22:19:38 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 04 Sep 2015 15:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,470,1437462000"; d="scan'208";a="555553180"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Sep 2015 15:19:37 -0700
Received: from orsmsx158.amr.corp.intel.com (10.22.240.20) by
	ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Fri, 4 Sep 2015 15:19:37 -0700
Received: from fmsmsx104.amr.corp.intel.com (10.18.124.202) by
	ORSMSX158.amr.corp.intel.com (10.22.240.20) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Fri, 4 Sep 2015 15:19:36 -0700
Received: from bottazzini-ThinkPad-T430.bz.intel.com (10.218.99.154) by
	fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Fri, 4 Sep 2015 15:19:36 -0700
From: Bruno Bottazzini <bruno.bottazzini@intel.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Sep 2015 19:19:02 -0300
Message-ID: <1441405142-7497-2-git-send-email-bruno.bottazzini@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1441405142-7497-1-git-send-email-bruno.bottazzini@intel.com>
References: <bruno.bottazzini@intel.com>
	<1441405142-7497-1-git-send-email-bruno.bottazzini@intel.com>
MIME-Version: 1.0
X-Originating-IP: [10.218.99.154]
Subject: [PATCH] mkefidisk: Create interactive menu for the script
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
X-List-Received-Date: Fri, 04 Sep 2015 22:19:39 -0000
Content-Type: text/plain

If it is passed only the image parameter, it will show some interactive
options to help to conclude the script.

With this patch it will detect devices available in the machine, asking
to choose what it is wanted to be flashed.

it will suggest the target device. If it is a SD card the suggestion
is /dev/mmcblk0. If it is a pendrive it will suggest to use /dev/sda.

Signed-off-by: Bruno Bottazzini <bruno.bottazzini@intel.com>
---
 scripts/contrib/mkefidisk.sh | 63 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 58 insertions(+), 5 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 55f72b0..66e0e58 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -152,8 +152,55 @@ unmount() {
 # Parse and validate arguments
 #
 if [ $# -lt 3 ] || [ $# -gt 4 ]; then
-	usage
-	exit 1
+    if [ $# -eq 1 ]; then
+        AVAILABLE_DISK=`lsblk | grep "disk" | cut -f 1 -d " "`
+        X=0
+        for disk in `echo $AVAILABLE_DISK`; do
+            mounted=`blkid -o list | grep "/dev/$disk" | grep "not mounted"`
+            if [ -n "$mounted" ]; then
+                UNMOUNTED_AVAILABLES="$UNMOUNTED_AVAILABLES /dev/$disk\n"
+                info "$X - /dev/$disk"
+                X=`expr $X + 1`
+            fi
+        done
+        if [ $X -eq 0 ]; then
+            die "No unmounted device found."
+        fi
+        read -p "Choose unmounted device number: " DISK_NUMBER
+        X=0
+        for line in `echo $UNMOUNTED_AVAILABLES`; do
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
@@ -162,9 +209,15 @@ if [ "$1" = "-v" ]; then
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


