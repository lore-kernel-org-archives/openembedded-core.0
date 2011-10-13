Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1REMZ6-0001Ig-Gv
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 16:47:21 +0200
Received: by mail-gy0-f175.google.com with SMTP id 15so82885gyc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 07:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=u4+/MzfiK+QAEe4nAoPgefhSrPxZpzffl3OeaFayDEs=;
	b=mV4/L1SQRqvymNqyuWZ72ttZ0wyaI5tnEbL5xJtzO9bAoqjQKDH9ps6i6GuZYO6XAX
	izRTub/eJl3cNqHMQRXdKG8LZrRkuWSzB16gOiX5w1O7GkAhnSfK/E5WaQ6zEx2gcWTV
	nE6pfjULzIddZH4y/9KM6gM+gfT2ghj1RRdJY=
Received: by 10.150.163.6 with SMTP id l6mr4805360ybe.40.1318516896977;
	Thu, 13 Oct 2011 07:41:36 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id v20sm122509anv.17.2011.10.13.07.41.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 07:41:36 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 14:41:17 +0000
Message-Id: <1b73ce88b76dd957c8a716809b458ba35a8b93b0.1318516840.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1318516840.git.otavio@ossystems.com.br>
References: <cover.1318516840.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1318516840.git.otavio@ossystems.com.br>
References: <cover.1318516840.git.otavio@ossystems.com.br>
Subject: [PATCH 2/4] initramfs-live-boot: make it more generic and easy to use
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
X-List-Received-Date: Thu, 13 Oct 2011 14:47:21 -0000

The script was making some assumptions that enforced many requirement
in the machine kernel configuration and usage, besides it were too
while booting.

Changes included:

 * fix indentation;
 * rdepends on udev;
 * allow use of isofs as module;
 * remove rootdelay param parsing as it was unused;
 * don't verbosely kill udevd and mknod;
 * mount devtmpfs into rootfs, if available, before swithing root;

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |   32 ++++++++++++-------
 .../initrdscripts/initramfs-live-boot_1.0.bb       |    3 +-
 2 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index c054863..eb5ab5b 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -13,6 +13,11 @@ early_setup() {
     mkdir /sys
     mount -t proc proc /proc
     mount -t sysfs sysfs /sys
+
+    # support modular kernel
+    modprobe isofs 2> /dev/null
+
+    mkdir /run
     udevd --daemon
     udevadm trigger --action=add
 }
@@ -25,21 +30,25 @@ read_args() {
             root=*)
                 ROOT_DEVICE=$optarg ;;
             rootfstype=*)
-                ROOT_FSTYPE=$optarg ;;
-            rootdelay=*)
-                rootdelay=$optarg ;;
-	    LABEL=*)
-		label=$optarg ;;
-	    video=*)
-		video_mode=$arg ;;
-	    vga=*)
-		vga_mode=$arg ;;
+                modprobe $optarg 2> /dev/null ;;
+            LABEL=*)
+                label=$optarg ;;
+            video=*)
+                video_mode=$arg ;;
+            vga=*)
+                vga_mode=$arg ;;
         esac
     done
 }
 
 boot_live_root() {
-    killall udevd
+    killall udevd 2>/dev/null
+
+    # use devtmpfs if available
+    if grep -q devtmpfs /proc/filesystems; then
+        mount -t devtmpfs devtmpfs $ROOT_MOUNT/dev
+    fi
+
     cd $ROOT_MOUNT
     exec switch_root -c /dev/console $ROOT_MOUNT /sbin/init
 }
@@ -78,7 +87,7 @@ done
 case $label in
     boot)
 	mkdir $ROOT_MOUNT
-	mknod /dev/loop0 b 7 0
+	mknod /dev/loop0 b 7 0 2>/dev/null
 
 	if ! $MOUNT -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
 	    fatal "Couldnt mount rootfs image"
@@ -97,4 +106,3 @@ case $label in
 	fatal "Installation image failed"
 	;;
 esac
-
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index b404f8c..e85a0e1 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -1,9 +1,10 @@
 DESCRIPTION = "A live image init script"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+RDEPENDS = "udev"
 SRC_URI = "file://init-live.sh"
 
-PR = "r6"
+PR = "r7"
 
 do_install() {
         install -m 0755 ${WORKDIR}/init-live.sh ${D}/init
-- 
1.7.2.5



