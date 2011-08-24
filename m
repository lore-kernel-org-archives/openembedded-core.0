Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QwFna-0008Ki-Vg
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 17:55:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Aug 2011 08:50:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,275,1312182000"; d="scan'208";a="41953307"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.203])
	by azsmga001.ch.intel.com with ESMTP; 24 Aug 2011 08:50:35 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2011 08:50:31 -0700
Message-Id: <4e7221d23bf335cbb4e1e2ba703e4c0a04df7129.1314200868.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314200868.git.sgw@linux.intel.com>
References: <cover.1314200868.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314200868.git.sgw@linux.intel.com>
References: <cover.1314200868.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 6/6] initrdscripts: fix init-live.sh for hddimg and livecd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Aug 2011 15:55:27 -0000

From: Jingdong Lu <jingdong.lu@windriver.com>

Both hddimg and livecd use init-live.sh script to boot the rootfs.img.
But the paths of rootfs.img in hddimg and livecd are different. So we add
a variable "ISOLINUX" to provide a correct path.

Signed-off-by: Jingdong Lu <jingdong.lu@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |   17 +++++++++++------
 .../initrdscripts/initramfs-live-boot_1.0.bb       |    2 +-
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 1cd87e8..6a1deba 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -1,9 +1,10 @@
 #!/bin/sh
 
 ROOT_MOUNT="/rootfs/"
-ROOT_IMAGE="isolinux/rootfs.img"
+ROOT_IMAGE="rootfs.img"
 MOUNT="/bin/mount"
 UMOUNT="/bin/umount"
+ISOLINUX=""
 
 early_setup() {
     mkdir /proc
@@ -58,8 +59,12 @@ while true
 do
   for i in `ls /media 2>/dev/null`; do
       if [ -f /media/$i/$ROOT_IMAGE ] ; then
-	  found="yes"
-	  break
+		found="yes"
+		break
+	  elif [ -f /media/$i/isolinux/$ROOT_IMAGE ]; then
+		found="yes"
+		ISOLINUX="isolinux"
+		break	
       fi
   done
   if [ "$found" = "yes" ]; then
@@ -73,15 +78,15 @@ case $label in
 	mkdir $ROOT_MOUNT
 	mknod /dev/loop0 b 7 0
 
-	if ! $MOUNT -o rw,loop,noatime,nodiratime /media/$i/$ROOT_IMAGE $ROOT_MOUNT ; then
+	if ! $MOUNT -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
 	    fatal "Couldnt mount rootfs image"
 	else
 	    boot_live_root
 	fi
 	;;
     install)
-	if [ -f /media/$i/$ROOT_IMAGE ] ; then
-	    ./install.sh $i $ROOT_IMAGE $video_mode $vga_mode
+	if [ -f /media/$i/$ISOLINUX/$ROOT_IMAGE ] ; then
+	    ./install.sh $i/$ISOLINUX $ROOT_IMAGE $video_mode $vga_mode
 	else
 	    fatal "Couldnt find install script"
 	fi
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index 140fb1d..6d354b7 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SRC_URI = "file://init-live.sh"
 
-PR = "r4"
+PR = "r5"
 
 do_install() {
         install -m 0755 ${WORKDIR}/init-live.sh ${D}/init
-- 
1.7.6



