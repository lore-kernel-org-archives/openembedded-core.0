Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A87497568B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 18:04:45 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jun 2015 11:04:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,620,1427785200"; d="scan'208";a="588243802"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 15 Jun 2015 11:04:46 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id B929D6A4083;
	Mon, 15 Jun 2015 11:04:09 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jun 2015 19:10:42 +0300
Message-Id: <1434384647-2901-6-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434384647-2901-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1434384647-2901-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [PATCH 05/10] init-install: Use GPT table with GRUB 2
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
X-List-Received-Date: Mon, 15 Jun 2015 18:04:46 -0000

Changed partition type from 'msdos' to 'gpt'.
Added special partition for grub stage2 bootloader.

NOTE: This is done only for GRUB 2 as legacy GRUB is
rarely used and doesn't support GPT partitions.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index cb26163..298ea8d 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -106,10 +106,21 @@ fi
 
 disk_size=$(parted /dev/${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
 
+grub_version=$(grub-install -v|sed 's/.* \([0-9]\).*/\1/')
+
+if [ $grub_version -eq 0 ] ; then
+    bios_boot_size=0
+else
+    # For GRUB 2 we need separate parition to store stage2 grub image
+    # 2Mb value is chosen to align partition for best performance.
+    bios_boot_size=2
+fi
+
 swap_size=$((disk_size*swap_ratio/100))
-rootfs_size=$((disk_size-boot_size-swap_size))
+rootfs_size=$((disk_size-bios_boot_size-boot_size-swap_size))
 
-rootfs_start=$((boot_size))
+boot_start=$((bios_boot_size))
+rootfs_start=$((bios_boot_size+boot_size))
 rootfs_end=$((rootfs_start+rootfs_size))
 swap_start=$((rootfs_end))
 
@@ -122,11 +133,21 @@ if [ ! "${device#mmcblk}" = "${device}" ]; then
 	part_prefix="p"
 	rootwait="rootwait"
 fi
-bootfs=/dev/${device}${part_prefix}1
-rootfs=/dev/${device}${part_prefix}2
-swap=/dev/${device}${part_prefix}3
+
+if [ $grub_version -eq 0 ] ; then
+    bios_boot=''
+    bootfs=/dev/${device}${part_prefix}1
+    rootfs=/dev/${device}${part_prefix}2
+    swap=/dev/${device}${part_prefix}3
+else
+    bios_boot=/dev/${device}${part_prefix}1
+    bootfs=/dev/${device}${part_prefix}2
+    rootfs=/dev/${device}${part_prefix}3
+    swap=/dev/${device}${part_prefix}4
+fi
 
 echo "*****************"
+[ $grub_version -ne 0 ] && echo "BIOS boot partition size: $bios_boot_size MB ($bios_boot)"
 echo "Boot partition size:   $boot_size MB ($bootfs)"
 echo "Rootfs partition size: $rootfs_size MB ($rootfs)"
 echo "Swap partition size:   $swap_size MB ($swap)"
@@ -135,10 +156,18 @@ echo "Deleting partition table on /dev/${device} ..."
 dd if=/dev/zero of=/dev/${device} bs=512 count=2
 
 echo "Creating new partition table on /dev/${device} ..."
-parted /dev/${device} mklabel msdos
-
-echo "Creating boot partition on $bootfs"
-parted /dev/${device} mkpart primary 0% $boot_size
+if [ $grub_version -eq 0 ] ; then
+    parted /dev/${device} mktable msdos
+    echo "Creating boot partition on $bootfs"
+    parted /dev/${device} mkpart primary 0% $boot_size
+else
+    parted /dev/${device} mktable gpt
+    echo "Creating BIOS boot partition on $bios_boot"
+    parted /dev/${device} mkpart primary 0% $bios_boot_size
+    parted /dev/${device} set 1 bios_grub on
+    echo "Creating boot partition on $bootfs"
+    parted /dev/${device} mkpart primary $boot_start $boot_size
+fi
 
 echo "Creating rootfs partition on $rootfs"
 parted /dev/${device} mkpart primary $rootfs_start $rootfs_end
@@ -186,7 +215,7 @@ if [ -f /etc/grub.d/00_header ] ; then
     mkdir -p $(dirname $GRUBCFG)
     cat >$GRUBCFG <<_EOF
 menuentry "Linux" {
-    set root=(hd0,1)
+    set root=(hd0,2)
     linux /vmlinuz root=$rootfs $rootwait rw $5 $3 $4 quiet
 }
 _EOF
@@ -195,8 +224,7 @@ fi
 grub-install /dev/${device}
 echo "(hd0) /dev/${device}" > /boot/grub/device.map
 
-# If grub.cfg doesn't exist, assume GRUB 0.97 and create a menu.lst
-if [ ! -f /boot/grub/grub.cfg ] ; then
+if [ $grub_version -eq 0 ] ; then
     echo "Preparing custom grub menu..."
     echo "default 0" > /boot/grub/menu.lst
     echo "timeout 30" >> /boot/grub/menu.lst
-- 
2.1.4


