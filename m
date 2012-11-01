Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@adamian-desktop>) id 1TTw1q-00057S-BR
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Nov 2012 15:45:54 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Nov 2012 07:32:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,693,1344236400"; d="scan'208";a="242953023"
Received: from adamian-desktop.rb.intel.com (HELO adamian-desktop)
	([10.237.105.47])
	by fmsmga002.fm.intel.com with ESMTP; 01 Nov 2012 07:32:14 -0700
Received: by adamian-desktop (Postfix, from userid 1000)
	id 92B22560882; Thu,  1 Nov 2012 16:32:16 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org,
	ross.burton@intel.com
Date: Thu,  1 Nov 2012 16:32:15 +0200
Message-Id: <1351780335-12617-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] initrdscripts: fix udevd path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Nov 2012 14:45:54 -0000

From: Ross Burton <ross.burton@intel.com>

udevd moved location and isn't in $PATH anymore, so use an absolute path to
start it.

The control socket path moved too, so mkdir the directory it's in.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |   50 +++++++++++++++++---
 .../initrdscripts/initramfs-framework/udev         |    6 +--
 .../initrdscripts/initramfs-framework_1.0.bb       |    2 +
 .../initrdscripts/initramfs-live-boot_1.0.bb       |    2 +-
 4 files changed, 50 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 5682fd1..fdea892 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -19,7 +19,8 @@ early_setup() {
     modprobe isofs 2> /dev/null
 
     mkdir -p /run
-    udevd --daemon
+    mkdir -p /var/run
+    /lib/udev/udevd --daemon
     udevadm trigger --action=add
 }
 
@@ -68,13 +69,49 @@ fatal() {
 
 early_setup
 
+# wait for the udevd to settle
+echo "Waiting for udev to settle..."
+sleep 3
+
 [ -z "$CONSOLE" ] && CONSOLE="/dev/console"
 
 read_args
 
-echo "Waiting for removable media..."
-while true
+# boot partiton menu, if one or more bootable partitions exist
+BOOTMENU=`ls /media/sd*/sbin/init 2>/dev/null | wc -l`
+if [ $BOOTMENU -gt 0 ]; then
+	choice=0
+	while [ $choice -le 0 ]; do
+		echo "1). boot live ramfs image"
+		count=2
+		for i in `ls /media/sd*/sbin/init 2>/dev/null | cut -d "/" -f 3`; do
+			echo $count"). boot /dev/"$i
+			choicecmd[$count]=$i
+			count=$(( count + 1))
+		done
+		echo
+		echo -n "Your choice: "
+		read choice
+	done
+	
+	if [ $choice -gt 1 ]; then 
+		#ROOT_MOUNT=/media/${choicecmd[${choice}]}
+		ROOT_MOUNT=none	#testing
+		echo "Booting local root ... $ROOT_MOUNT"
+		if [ -d $ROOT_MOUNT ]; then
+			boot_live_root
+		else
+			fatal "Rootfs partition not mounted"
+		fi
+	fi
+fi	
+
+echo -n "Waiting for removable media... "
+CNT=0
+while [ $CNT -le 3 ];
 do
+  echo -n "$CNT "
+  CNT=$(( $CNT + 1 ))
   for i in `ls /media 2>/dev/null`; do
       if [ -f /media/$i/$ROOT_IMAGE ] ; then
 		found="yes"
@@ -82,7 +119,7 @@ do
 	  elif [ -f /media/$i/isolinux/$ROOT_IMAGE ]; then
 		found="yes"
 		ISOLINUX="isolinux"
-		break	
+		break
       fi
   done
   if [ "$found" = "yes" ]; then
@@ -90,13 +127,14 @@ do
   fi
   sleep 1
 done
+if [ "$found" != "yes" ]; then
+	fatal "...could not mount removable media, drop to shell"
+fi
 
 case $label in
     boot)
 	mkdir $ROOT_MOUNT
 	mknod /dev/loop0 b 7 0 2>/dev/null
-
-	
 	if [ "$UNIONFS" = "yes" ]; then
 	    mkdir /rootfs-tmp
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
index 9ea8aa3..15a1d5b 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
@@ -3,8 +3,8 @@
 # Licensed on MIT
 
 udev_enabled() {
-	if [ ! -e /sbin/udevd ]; then
-		debug "/sbin/udev doesn't exist"
+	if [ ! -e /lib/udev/udevd ]; then
+		debug "/lib/udev/udev doesn't exist"
 		return 1
 	fi
 
@@ -14,7 +14,7 @@ udev_enabled() {
 udev_run() {
 	mkdir -p /run
 
-	udevd --daemon > /dev/null
+	/lib/udev/udevd --daemon > /dev/null
 	udevadm trigger --action=add
 	udevadm settle
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 58e41d4..45d6592 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -3,6 +3,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS = "busybox"
 
+PR = "r1"
+
 inherit allarch
 
 SRC_URI = "file://init \
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index 137a401..55a8600 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -5,7 +5,7 @@ RDEPENDS = "udev"
 DEPENDS = "virtual/kernel"
 SRC_URI = "file://init-live.sh"
 
-PR = "r10"
+PR = "r11"
 
 do_compile() {
 	#if grep -q "CONFIG_UNION_FS=y" ${STAGING_KERNEL_DIR}/.config; then
-- 
1.7.10.4



