Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jingdong.Lu@windriver.com>) id 1Qw8qf-0007wG-5s
	for Openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 10:30:09 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7O8PMpu013577
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 01:25:22 -0700 (PDT)
Received: from localhost (128.224.162.207) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 24 Aug 2011 01:25:22 -0700
From: Jingdong.Lu@windriver.com
To: <Openembedded-core@lists.openembedded.org>
Date: Wed, 24 Aug 2011 16:25:04 +0800
Message-ID: <9761e1c9c114d22ab7a06ff55bf10b6ccf27a54a.1314172740.git.jingdong.lu@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1314172740.git.jingdong.lu@windriver.com>
References: <cover.1314172740.git.jingdong.lu@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.207]
Subject: [PATCH 1/1] initrdscripts: fix init-live.sh for hddimg and livecd
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
X-List-Received-Date: Wed, 24 Aug 2011 08:30:09 -0000
Content-Type: text/plain

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
1.7.0.4



