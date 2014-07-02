Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B3D4D65CD8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 22:09:35 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1X2Sie-0004Ew-IW from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Jul 2014 15:09:36 -0700
Received: from SVR-ORW-FEM-06.mgc.mentorg.com ([147.34.97.120]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 2 Jul 2014 15:09:36 -0700
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	SVR-ORW-FEM-06.mgc.mentorg.com (147.34.97.120) with Microsoft SMTP
	Server id 14.2.247.3; Wed, 2 Jul 2014 15:09:35 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Jul 2014 18:09:28 -0400
Message-ID: <1404338969-30935-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-OriginalArrivalTime: 02 Jul 2014 22:09:36.0403 (UTC)
	FILETIME=[4F924E30:01CF9642]
Subject: [PATCH 1/2] init-install-efi.sh: improve hard drive searching process
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
X-List-Received-Date: Wed, 02 Jul 2014 22:09:36 -0000
Content-Type: text/plain

(This patch was originally done against init-install.sh in
OE-Core rev 358f0584d779825307eec08c023b5ff14e72cf9e)

Previously, only unremovable hard drives are searched and are treated
as candidates of target disks to intall into.

However, it's possible that we're going to install the live image into
a removable media such as an USB. This patch enables this possibility.

In addition, this patch presents more information about the hard drives
so that user may have more knowledge about which hard drive they are
going to install their image into.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 .../initrdscripts/files/init-install-efi.sh        | 85 ++++++++++++++--------
 1 file changed, 53 insertions(+), 32 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 8bd7025..da3e33c 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -14,46 +14,67 @@ boot_size=20
 # 5% for swap
 swap_ratio=5
 
-found="no"
-
-echo "Searching for a hard drive..."
-for device in 'hda' 'hdb' 'sda' 'sdb' 'mmcblk0' 'mmcblk1'
-do
-    if [ -e /sys/block/${device}/removable ]; then
-        if [ "$(cat /sys/block/${device}/removable)" = "0" ]; then
-            found="yes"
-
-            while true; do
-                # Try sleeping here to avoid getting kernel messages
-                # obscuring/confusing user
-                sleep 5
-                echo "Found drive at /dev/${device}. Do you want to install this image there ? [y/n]"
-                read answer
-                if [ "$answer" = "y" ] ; then
-                    break
-                fi
-
-                if [ "$answer" = "n" ] ; then
-                    found=no
-                    break
-                fi
-
-                echo "Please answer y or n"
-            done
-        fi
-    fi
+# Get a list of hard drives
+hdnamelist=""
+live_dev_name=${1%%/*}
+
+echo "Searching for hard drives ..."
+
+for device in `ls /sys/block/`; do
+    case $device in
+	loop*)
+            # skip loop device
+	    ;;
+	ram*)
+            # skip ram device
+	    ;;
+	*)
+	    # skip the device LiveOS is on
+	    # Add valid hard drive name to the list
+	    if [ $device != $live_dev_name -a -e /dev/$device ]; then
+		hdnamelist="$hdnamelist $device"
+	    fi
+	    ;;
+    esac
+done
 
-    if [ "$found" = "yes" ]; then
-        break;
+TARGET_DEVICE_NAME=""
+for hdname in $hdnamelist; do
+    # Display found hard drives and their basic info
+    echo "-------------------------------"
+    echo /dev/$hdname
+    if [ -r /sys/block/$hdname/device/vendor ]; then
+	echo -n "VENDOR="
+	cat /sys/block/$hdname/device/vendor
+    fi
+    echo -n "MODEL="
+    cat /sys/block/$hdname/device/model
+    cat /sys/block/$hdname/device/uevent
+    echo
+    # Get user choice
+    while true; do
+	echo -n "Do you want to install this image there? [y/n] "
+	read answer
+	if [ "$answer" = "y" -o "$answer" = "n" ]; then
+	    break
+	fi
+	echo "Please answer y or n"
+    done
+    if [ "$answer" = "y" ]; then
+	TARGET_DEVICE_NAME=$hdname
+	break
     fi
 
 done
 
-if [ "$found" = "no" ]; then
+if [ -n "$TARGET_DEVICE_NAME" ]; then
+    echo "Installing image on /dev/$TARGET_DEVICE_NAME ..."
+else
+    echo "No hard drive selected. Installation aborted."
     exit 1
 fi
 
-echo "Installing image on /dev/${device}"
+device=$TARGET_DEVICE_NAME
 
 #
 # The udev automounter can cause pain here, kill it
-- 
1.9.1


