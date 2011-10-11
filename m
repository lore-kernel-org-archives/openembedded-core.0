Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RDhwc-0000BB-5r
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 21:24:54 +0200
Received: by gyg8 with SMTP id 8so7010652gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 12:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=u4+/MzfiK+QAEe4nAoPgefhSrPxZpzffl3OeaFayDEs=;
	b=maRomNvoYAYh3NYCkY4JgrSO+ha8O1hO+BuI/rcnSW7h48QQ9GQvfRbJ6G9345Klp/
	NdczYxKc6WVgz+87Gc3JmWVWnwmihOatl/4Q79udRa/8j+AiVE7pq2tOjTEfwAWXN6ML
	bp0F2wS0LKua3uUYKVWqsy/KV2UOdPBdot8ng=
Received: by 10.150.244.20 with SMTP id r20mr11419228ybh.50.1318360751996;
	Tue, 11 Oct 2011 12:19:11 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id g23sm11205147ani.16.2011.10.11.12.19.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 12:19:11 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Oct 2011 19:18:50 +0000
Message-Id: <1e1e28ab52a7fb3d8ff816b15c73d84c9377e83a.1318360701.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1318360701.git.otavio@ossystems.com.br>
References: <cover.1318360701.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1318360701.git.otavio@ossystems.com.br>
References: <cover.1318360701.git.otavio@ossystems.com.br>
Subject: [PATCH 2/2] initramfs-live-boot: make it more generic and easy to use
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
X-List-Received-Date: Tue, 11 Oct 2011 19:24:55 -0000

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



