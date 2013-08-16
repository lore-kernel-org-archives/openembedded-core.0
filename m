Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 93FB36B79C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 09:38:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7G9cA1n024537
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 02:38:10 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 16 Aug 2013 02:38:10 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Aug 2013 17:38:09 +0800
Message-ID: <ef8c969afb283f267fdd10dd8e41c27a2f1969a9.1376630883.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1376630883.git.Qi.Chen@windriver.com>
References: <cover.1376630883.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 1/2] init-install.sh: improve hard drive searching process
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
X-List-Received-Date: Fri, 16 Aug 2013 09:38:09 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Previously, only unremovable hard drives are searched and are treated
as candidates of target disks to intall into.

However, it's possible that we're going to install the live image into
a removable media such as an USB. This patch enables this possibility.

In addition, this patch presents more information about the hard drives
so that user may have more knowledge about which hard drive they are
going to install their image into.

[YOCTO #5018]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initrdscripts/files/init-install.sh            |   98 +++++++++++---------
 1 file changed, 55 insertions(+), 43 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index d2a0db3..c892075 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -13,46 +13,66 @@ boot_size=20
 # 5% for the swap
 swap_ratio=5
 
-found="no"
-
-echo "Searching for a hard drive..."
-for device in 'hda' 'hdb' 'sda' 'sdb' 'mmcblk0' 'mmcblk1'
-  do
-  if [ -e /sys/block/${device}/removable ]; then
-      if [ "$(cat /sys/block/${device}/removable)" = "0" ]; then
-	  found="yes"
-
-	  while true; do
-	      # Try sleeping here to avoid getting kernel messages
-              # obscuring/confusing user
-	      sleep 5
-	      echo "Found drive at /dev/${device}. Do you want to install this image there ? [y/n]"
-	      read answer
-	      if [ "$answer" = "y" ] ; then
-		  break
-	      fi
-	  
-	      if [ "$answer" = "n" ] ; then
-		  found=no
-		  break
-	      fi
-
-	      echo "Please answer by y or n"
-	  done
-      fi
-  fi
-
-  if [ "$found" = "yes" ]; then
-      break;
-  fi
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
+    fi
 done
 
-if [ "$found" = "no" ]; then
-      exit 1      
+if [ -n "$TARGET_DEVICE_NAME" ]; then
+    echo "Installing image on /dev/$TARGET_DEVICE_NAME ..."
+else
+    echo "No hard drive selected. Installation aborted."
+    exit 1
 fi
 
-echo "Installing image on /dev/${device}"
+device=$TARGET_DEVICE_NAME
 
 #
 # The udev automounter can cause pain here, kill it
@@ -65,14 +85,6 @@ rm -f /etc/udev/scripts/mount*
 #
 umount /dev/${device}* 2> /dev/null || /bin/true
 
-if [ ! -b /dev/sda ] ; then
-    mknod /dev/sda b 8 0
-fi
-
-if [ ! -b /dev/sdb ] ; then
-    mknod /dev/sdb b 8 16
-fi
-
 if [ ! -b /dev/loop0 ] ; then
     mknod /dev/loop0 b 7 0
 fi
-- 
1.7.9.5


