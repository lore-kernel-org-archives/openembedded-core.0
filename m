Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7078F759FD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 08:07:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 16 Jun 2015 01:07:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,624,1427785200"; d="scan'208";a="711766052"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 16 Jun 2015 01:07:54 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 67D266A4005;
	Tue, 16 Jun 2015 01:07:18 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 09:13:53 +0300
Message-Id: <1434435234-4892-11-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434435234-4892-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1434435234-4892-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [PATCH v2 10/11] init-install: code cleanup: replace /dev/$device -> $device
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
X-List-Received-Date: Tue, 16 Jun 2015 08:07:53 -0000

Shortened code by including /dev/ prefix into variable.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index dca1432..74372b0 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -83,7 +83,7 @@ else
     exit 1
 fi
 
-device=$TARGET_DEVICE_NAME
+device=/dev/$TARGET_DEVICE_NAME
 
 #
 # The udev automounter can cause pain here, kill it
@@ -94,12 +94,12 @@ rm -f /etc/udev/scripts/mount*
 #
 # Unmount anything the automounter had mounted
 #
-umount /dev/${device}* 2> /dev/null || /bin/true
+umount ${device}* 2> /dev/null || /bin/true
 
 mkdir -p /tmp
 cat /proc/mounts > /etc/mtab
 
-disk_size=$(parted /dev/${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
+disk_size=$(parted ${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
 
 swap_size=$((disk_size*swap_ratio/100))
 rootfs_size=$((disk_size-boot_size-swap_size))
@@ -117,32 +117,32 @@ if [ ! "${device#mmcblk}" = "${device}" ]; then
     part_prefix="p"
     rootwait="rootwait"
 fi
-bootfs=/dev/${device}${part_prefix}1
-rootfs=/dev/${device}${part_prefix}2
-swap=/dev/${device}${part_prefix}3
+bootfs=${device}${part_prefix}1
+rootfs=${device}${part_prefix}2
+swap=${device}${part_prefix}3
 
 echo "*****************"
 echo "Boot partition size:   $boot_size MB ($bootfs)"
 echo "Rootfs partition size: $rootfs_size MB ($rootfs)"
 echo "Swap partition size:   $swap_size MB ($swap)"
 echo "*****************"
-echo "Deleting partition table on /dev/${device} ..."
-dd if=/dev/zero of=/dev/${device} bs=512 count=2
+echo "Deleting partition table on ${device} ..."
+dd if=/dev/zero of=${device} bs=512 count=2
 
-echo "Creating new partition table on /dev/${device} ..."
-parted /dev/${device} mklabel gpt
+echo "Creating new partition table on ${device} ..."
+parted ${device} mklabel gpt
 
 echo "Creating boot partition on $bootfs"
-parted /dev/${device} mkpart boot fat32 0% $boot_size
-parted /dev/${device} set 1 boot on
+parted ${device} mkpart boot fat32 0% $boot_size
+parted ${device} set 1 boot on
 
 echo "Creating rootfs partition on $rootfs"
-parted /dev/${device} mkpart root ext3 $rootfs_start $rootfs_end
+parted ${device} mkpart root ext3 $rootfs_start $rootfs_end
 
 echo "Creating swap partition on $swap"
-parted /dev/${device} mkpart swap linux-swap $swap_start 100%
+parted ${device} mkpart swap linux-swap $swap_start 100%
 
-parted /dev/${device} print
+parted ${device} print
 
 echo "Formatting $bootfs to vfat..."
 mkfs.vfat $bootfs
@@ -163,13 +163,13 @@ mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /src_root
 echo "Copying rootfs files..."
 cp -a /src_root/* /tgt_root
 if [ -d /tgt_root/etc/ ] ; then
-    boot_uuid=$(blkid -o value -s UUID /dev/${device}1)
-    swap_part_uuid=$(blkid -o value -s PARTUUID /dev/${device}3)
+    boot_uuid=$(blkid -o value -s UUID ${device}1)
+    swap_part_uuid=$(blkid -o value -s PARTUUID ${device}3)
     echo "/dev/disk/by-partuuid/$swap_part_uuid                swap             swap       defaults              0  0" >> /tgt_root/etc/fstab
     echo "UUID=$boot_uuid              /boot            vfat       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
     if [ -d /tgt_root/etc/udev/ ] ; then
-        echo "/dev/${device}" >> /tgt_root/etc/udev/mount.blacklist
+        echo "${device}" >> /tgt_root/etc/udev/mount.blacklist
     fi
 fi
 
@@ -185,7 +185,7 @@ mkdir -p $EFIDIR
 cp /run/media/$1/EFI/BOOT/*.efi $EFIDIR
 
 if [ -f /run/media/$1/EFI/BOOT/grub.cfg ]; then
-    root_part_uuid=$(blkid -o value -s PARTUUID /dev/${device}2)
+    root_part_uuid=$(blkid -o value -s PARTUUID ${device}2)
     GRUBCFG="$EFIDIR/grub.cfg"
     cp /run/media/$1/EFI/BOOT/grub.cfg $GRUBCFG
     # Update grub config for the installed image
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index e1e7cb1..0593b3c 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -82,7 +82,7 @@ else
     exit 1
 fi
 
-device=$TARGET_DEVICE_NAME
+device=/dev/$TARGET_DEVICE_NAME
 
 #
 # The udev automounter can cause pain here, kill it
@@ -93,7 +93,7 @@ rm -f /etc/udev/scripts/mount*
 #
 # Unmount anything the automounter had mounted
 #
-umount /dev/${device}* 2> /dev/null || /bin/true
+umount ${device}* 2> /dev/null || /bin/true
 
 if [ ! -b /dev/loop0 ] ; then
     mknod /dev/loop0 b 7 0
@@ -104,7 +104,7 @@ if [ ! -L /etc/mtab ]; then
     cat /proc/mounts > /etc/mtab
 fi
 
-disk_size=$(parted /dev/${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
+disk_size=$(parted ${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
 
 grub_version=$(grub-install -v|sed 's/.* \([0-9]\).*/\1/')
 
@@ -136,14 +136,14 @@ fi
 
 if [ $grub_version -eq 0 ] ; then
     bios_boot=''
-    bootfs=/dev/${device}${part_prefix}1
-    rootfs=/dev/${device}${part_prefix}2
-    swap=/dev/${device}${part_prefix}3
+    bootfs=${device}${part_prefix}1
+    rootfs=${device}${part_prefix}2
+    swap=${device}${part_prefix}3
 else
-    bios_boot=/dev/${device}${part_prefix}1
-    bootfs=/dev/${device}${part_prefix}2
-    rootfs=/dev/${device}${part_prefix}3
-    swap=/dev/${device}${part_prefix}4
+    bios_boot=${device}${part_prefix}1
+    bootfs=${device}${part_prefix}2
+    rootfs=${device}${part_prefix}3
+    swap=${device}${part_prefix}4
 fi
 
 echo "*****************"
@@ -152,32 +152,32 @@ echo "Boot partition size:   $boot_size MB ($bootfs)"
 echo "Rootfs partition size: $rootfs_size MB ($rootfs)"
 echo "Swap partition size:   $swap_size MB ($swap)"
 echo "*****************"
-echo "Deleting partition table on /dev/${device} ..."
-dd if=/dev/zero of=/dev/${device} bs=512 count=2
+echo "Deleting partition table on ${device} ..."
+dd if=/dev/zero of=${device} bs=512 count=2
 
-echo "Creating new partition table on /dev/${device} ..."
+echo "Creating new partition table on ${device} ..."
 if [ $grub_version -eq 0 ] ; then
-    parted /dev/${device} mktable msdos
+    parted ${device} mktable msdos
     echo "Creating boot partition on $bootfs"
-    parted /dev/${device} mkpart primary ext3 0% $boot_size
+    parted ${device} mkpart primary ext3 0% $boot_size
 else
-    parted /dev/${device} mktable gpt
+    parted ${device} mktable gpt
     echo "Creating BIOS boot partition on $bios_boot"
-    parted /dev/${device} mkpart bios_boot 0% $bios_boot_size
-    parted /dev/${device} set 1 bios_grub on
+    parted ${device} mkpart bios_boot 0% $bios_boot_size
+    parted ${device} set 1 bios_grub on
     echo "Creating boot partition on $bootfs"
-    parted /dev/${device} mkpart boot ext3 $boot_start $boot_size
+    parted ${device} mkpart boot ext3 $boot_start $boot_size
 fi
 
 echo "Creating rootfs partition on $rootfs"
 [ $grub_version -eq 0 ] && pname='primary' || pname='root'
-parted /dev/${device} mkpart $pname ext3 $rootfs_start $rootfs_end
+parted ${device} mkpart $pname ext3 $rootfs_start $rootfs_end
 
 echo "Creating swap partition on $swap"
 [ $grub_version -eq 0 ] && pname='primary' || pname='swap'
-parted /dev/${device} mkpart $pname linux-swap $swap_start 100%
+parted ${device} mkpart $pname linux-swap $swap_start 100%
 
-parted /dev/${device} print
+parted ${device} print
 
 echo "Formatting $bootfs to ext3..."
 mkfs.ext3 $bootfs
@@ -211,7 +211,7 @@ if [ -d /tgt_root/etc/ ] ; then
     echo "$bootdev              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
     if [ -d /tgt_root/etc/udev/ ] ; then
-        echo "/dev/${device}" >> /tgt_root/etc/udev/mount.blacklist
+        echo "${device}" >> /tgt_root/etc/udev/mount.blacklist
     fi
 fi
 umount /tgt_root
@@ -222,8 +222,8 @@ mount $bootfs /boot
 echo "Preparing boot partition..."
 if [ -f /etc/grub.d/00_header -a $grub_version -ne 0 ] ; then
     echo "Preparing custom grub2 menu..."
-    root_part_uuid=$(blkid -o value -s PARTUUID /dev/${device}3)
-    boot_uuid=$(blkid -o value -s UUID /dev/${device}2)
+    root_part_uuid=$(blkid -o value -s PARTUUID ${device}3)
+    boot_uuid=$(blkid -o value -s UUID ${device}2)
     GRUBCFG="/boot/grub/grub.cfg"
     mkdir -p $(dirname $GRUBCFG)
     cat >$GRUBCFG <<_EOF
@@ -234,10 +234,10 @@ menuentry "Linux" {
 _EOF
     chmod 0444 $GRUBCFG
 fi
-grub-install /dev/${device}
+grub-install ${device}
 
 if [ $grub_version -eq 0 ] ; then
-    echo "(hd0) /dev/${device}" > /boot/grub/device.map
+    echo "(hd0) ${device}" > /boot/grub/device.map
     echo "Preparing custom grub menu..."
     echo "default 0" > /boot/grub/menu.lst
     echo "timeout 30" >> /boot/grub/menu.lst
-- 
2.1.4


