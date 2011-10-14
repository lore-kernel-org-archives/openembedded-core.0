Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1REaUY-0002YD-7v
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 07:39:34 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Oct 2011 22:33:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,344,1315206000"; d="scan'208";a="73540458"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2011 22:33:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 22:33:12 -0700
Message-Id: <02facddc389100b239827830f9e7dbf6a1b5c123.1318570250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/28] initramfs-live-boot: make it more generic and easy to use
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
X-List-Received-Date: Fri, 14 Oct 2011 05:39:34 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

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
1.7.6.2



