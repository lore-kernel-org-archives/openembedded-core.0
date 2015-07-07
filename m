Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 3E13D75D25
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 07:43:44 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ZCNXc-0006yR-Cm from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jul 2015 00:43:44 -0700
Received: from awais-Precision-M4700.world.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Tue, 7 Jul 2015 08:43:42 +0100
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Jul 2015 12:43:37 +0500
Message-ID: <1436255017-950-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] initrdscripts: handle mmc device as installer medium
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
X-List-Received-Date: Tue, 07 Jul 2015 07:43:45 -0000
Content-Type: text/plain

Platforms which have the capability of using the MMC as an
installer medium will present the same MMC device as an
installation candidate. This happens because the MMC
devices appear as mmcblk<X> and the current script strips
up the <X> which is needed to identify an MMC device
uniqely.
This patch now updates the way device identifier stripping
is done and handles the exclusion of installer device from
installation candidates more generically.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 .../initrdscripts/files/init-install-efi.sh          | 20 ++++++++++++++++----
 .../recipes-core/initrdscripts/files/init-install.sh | 20 ++++++++++++++++----
 2 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 14939ac..f339b30 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -18,7 +18,14 @@ swap_ratio=5
 hdnamelist=""
 live_dev_name=`cat /proc/mounts | grep ${1%/} | awk '{print $1}'`
 live_dev_name=${live_dev_name#\/dev/}
-live_dev_name=${live_dev_name%%[0-9]*}
+# Only strip the digit identifier if the device is not an mmc
+case $live_dev_name in
+    mmcblk*)
+    ;;
+    *)
+        live_dev_name=${live_dev_name%%[0-9]*}
+    ;;
+esac
 
 echo "Searching for hard drives ..."
 
@@ -36,9 +43,14 @@ for device in `ls /sys/block/`; do
         *)
             # skip the device LiveOS is on
             # Add valid hard drive name to the list
-            if [ $device != $live_dev_name -a -e /dev/$device ]; then
-                hdnamelist="$hdnamelist $device"
-            fi
+            case $device in
+                $live_dev_name*)
+                # skip the device we are running from
+                ;;
+                *)
+                    hdnamelist="$hdnamelist $device"
+                ;;
+            esac
             ;;
     esac
 done
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 7fccdde..f9e9768 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -17,7 +17,14 @@ swap_ratio=5
 hdnamelist=""
 live_dev_name=`cat /proc/mounts | grep ${1%/} | awk '{print $1}'`
 live_dev_name=${live_dev_name#\/dev/}
-live_dev_name=${live_dev_name%%[0-9]*}
+# Only strip the digit identifier if the device is not an mmc
+case $live_dev_name in
+    mmcblk*)
+    ;;
+    *)
+        live_dev_name=${live_dev_name%%[0-9]*}
+    ;;
+esac
 
 echo "Searching for hard drives ..."
 
@@ -35,9 +42,14 @@ for device in `ls /sys/block/`; do
         *)
             # skip the device LiveOS is on
             # Add valid hard drive name to the list
-            if [ $device != $live_dev_name -a -e /dev/$device ]; then
-                hdnamelist="$hdnamelist $device"
-            fi
+            case $device in
+                $live_dev_name*)
+                # skip the device we are running from
+                ;;
+                *)
+                    hdnamelist="$hdnamelist $device"
+                ;;
+            esac
             ;;
     esac
 done
-- 
1.9.1


