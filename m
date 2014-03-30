Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B9C9F6F7C6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 15:47:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Mar 2014 08:47:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,761,1389772800"; d="scan'208";a="510170010"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 30 Mar 2014 08:47:40 -0700
Received: from sstanacx-mobl1.ger.corp.intel.com (sstanacx-mobl1.rb.intel.com
	[10.237.105.81])
	by linux.intel.com (Postfix) with ESMTP id 1886C6A4083
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 08:47:24 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Mar 2014 17:47:33 +0300
Message-Id: <041aef0d60443bf1b4a7c1a61ef15779af9e14a7.1396188987.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1396188987.git.stefanx.stanacar@intel.com>
References: <cover.1396188987.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1396188987.git.stefanx.stanacar@intel.com>
References: <cover.1396188987.git.stefanx.stanacar@intel.com>
Subject: [PATCH 1/3] initrdscripts: add install scripts with a second rootfs
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
X-List-Received-Date: Sun, 30 Mar 2014 15:47:42 -0000

These are meant to be used by a master image, for a simple
initial setup.
The install scripts are similar to the default ones, but:
- custom partitioning, replaces the swap partiton with a second root filesystem
- adds labels to the partitions
- preconfigures a boot loader entry for the second rootfs

Part of [YOCTO #5614]

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 .../initrdscripts/files/init-install-efi-testfs.sh | 199 +++++++++++++++++++
 .../initrdscripts/files/init-install-testfs.sh     | 211 +++++++++++++++++++++
 .../initramfs-live-install-efi-testfs_1.0.bb       |  14 ++
 .../initramfs-live-install-testfs_1.0.bb           |  14 ++
 4 files changed, 438 insertions(+)
 create mode 100644 meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
 create mode 100644 meta/recipes-core/initrdscripts/files/init-install-testfs.sh
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
new file mode 100644
index 0000000..2fea761
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
@@ -0,0 +1,199 @@
+#!/bin/sh -e
+#
+# Copyright (c) 2012, Intel Corporation.
+# All rights reserved.
+#
+# install.sh [device_name] [rootfs_name]
+#
+
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+
+# We need 200 Mb for the boot partition
+boot_size=200
+
+# 50% for the second rootfs
+testfs_ratio=50
+
+found="no"
+
+echo "Searching for a hard drive..."
+for device in 'hda' 'hdb' 'sda' 'sdb' 'mmcblk0' 'mmcblk1'
+do
+    if [ -e /sys/block/${device}/removable ]; then
+        if [ "$(cat /sys/block/${device}/removable)" = "0" ]; then
+            found="yes"
+
+            while true; do
+                # Try sleeping here to avoid getting kernel messages
+                # obscuring/confusing user
+                sleep 5
+                echo "Found drive at /dev/${device}. Do you want to install this image there ? [y/n]"
+                read answer
+                if [ "$answer" = "y" ] ; then
+                    break
+                fi
+
+                if [ "$answer" = "n" ] ; then
+                    found=no
+                    break
+                fi
+
+                echo "Please answer y or n"
+            done
+        fi
+    fi
+
+    if [ "$found" = "yes" ]; then
+        break;
+    fi
+
+done
+
+if [ "$found" = "no" ]; then
+    exit 1
+fi
+
+echo "Installing image on /dev/${device}"
+
+#
+# The udev automounter can cause pain here, kill it
+#
+rm -f /etc/udev/rules.d/automount.rules
+rm -f /etc/udev/scripts/mount*
+
+#
+# Unmount anything the automounter had mounted
+#
+umount /dev/${device}* 2> /dev/null || /bin/true
+
+mkdir -p /tmp
+cat /proc/mounts > /etc/mtab
+
+disk_size=$(parted /dev/${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
+
+testfs_size=$((disk_size*testfs_ratio/100))
+rootfs_size=$((disk_size-boot_size-testfs_size))
+
+rootfs_start=$((boot_size))
+rootfs_end=$((rootfs_start+rootfs_size))
+testfs_start=$((rootfs_end))
+
+# MMC devices are special in a couple of ways
+# 1) they use a partition prefix character 'p'
+# 2) they are detected asynchronously (need rootwait)
+rootwait=""
+part_prefix=""
+if [ ! "${device#mmcblk}" = "${device}" ]; then
+    part_prefix="p"
+    rootwait="rootwait"
+fi
+bootfs=/dev/${device}${part_prefix}1
+rootfs=/dev/${device}${part_prefix}2
+testfs=/dev/${device}${part_prefix}3
+
+echo "*****************"
+echo "Boot partition size:   $boot_size MB ($bootfs)"
+echo "Rootfs partition size: $rootfs_size MB ($rootfs)"
+echo "Testfs partition size:   $testfs_size MB ($testfs)"
+echo "*****************"
+echo "Deleting partition table on /dev/${device} ..."
+dd if=/dev/zero of=/dev/${device} bs=512 count=2
+
+echo "Creating new partition table on /dev/${device} ..."
+parted /dev/${device} mklabel gpt
+
+echo "Creating boot partition on $bootfs"
+parted /dev/${device} mkpart primary 0% $boot_size
+parted /dev/${device} set 1 boot on
+
+echo "Creating rootfs partition on $rootfs"
+parted /dev/${device} mkpart primary $rootfs_start $rootfs_end
+
+echo "Creating testfs partition on $testfs"
+parted /dev/${device} mkpart primary $testfs_start 100%
+
+parted /dev/${device} print
+
+echo "Formatting $bootfs to vfat..."
+mkfs.vfat -n "boot" $bootfs
+
+echo "Formatting $rootfs to ext3..."
+mkfs.ext3 -L "platform" $rootfs
+
+echo "Formatting $testfs to ext3..."
+mkfs.ext3 -L "testrootfs" $testfs
+
+mkdir /ssd
+mkdir /rootmnt
+mkdir /bootmnt
+
+mount $rootfs /ssd
+mount -o rw,loop,noatime,nodiratime /media/$1/$2 /rootmnt
+
+echo "Copying rootfs files..."
+cp -a /rootmnt/* /ssd
+
+touch /ssd/etc/masterimage
+
+if [ -d /ssd/etc/ ] ; then
+    # We dont want udev to mount our root device while we're booting...
+    if [ -d /ssd/etc/udev/ ] ; then
+        echo "/dev/${device}" >> /ssd/etc/udev/mount.blacklist
+    fi
+fi
+
+umount /ssd
+umount /rootmnt
+
+echo "Preparing boot partition..."
+mount $bootfs /ssd
+
+EFIDIR="/ssd/EFI/BOOT"
+mkdir -p $EFIDIR
+cp /media/$1/vmlinuz /ssd
+# Copy the efi loader
+cp /media/$1/EFI/BOOT/*.efi $EFIDIR
+
+if [ -f /media/$1/EFI/BOOT/grub.cfg ]; then
+    GRUBCFG="$EFIDIR/grub.cfg"
+    cp /media/$1/EFI/BOOT/grub.cfg $GRUBCFG
+    # Update grub config for the installed image
+    # Delete the install entry
+    sed -i "/menuentry 'install'/,/^}/d" $GRUBCFG
+    # Delete the initrd lines
+    sed -i "/initrd /d" $GRUBCFG
+    # Delete any LABEL= strings
+    sed -i "s/ LABEL=[^ ]*/ /" $GRUBCFG
+    # Delete any root= strings
+    sed -i "s/ root=[^ ]*/ /" $GRUBCFG
+    # Add the root= and other standard boot options
+    sed -i "s@linux /vmlinuz *@linux /vmlinuz root=$rootfs rw $rootwait quiet @" $GRUBCFG
+fi
+
+if [ -d /media/$1/loader ]; then
+    GUMMIBOOT_CFGS="/ssd/loader/entries/*.conf"
+    # copy config files for gummiboot
+    cp -dr /media/$1/loader /ssd
+    # delete the install entry
+    rm -f /ssd/loader/entries/install.conf
+    # delete the initrd lines
+    sed -i "/initrd /d" $GUMMIBOOT_CFGS
+    # delete any LABEL= strings
+    sed -i "s/ LABEL=[^ ]*/ /" $GUMMIBOOT_CFGS
+    # delete any root= strings
+    sed -i "s/ root=[^ ]*/ /" $GUMMIBOOT_CFGS
+    # add the root= and other standard boot options
+    sed -i "s@options *@options root=$rootfs rw $rootwait quiet @" $GUMMIBOOT_CFGS
+    # Add the test label
+    echo -ne "title test\nlinux /test-kernel\noptions root=$testfs rw $rootwait quiet\n" > /ssd/loader/entries/test.conf
+fi
+
+umount /ssd
+sync
+
+echo "Remove your installation media, and press ENTER"
+
+read enter
+
+echo "Rebooting..."
+reboot -f
diff --git a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
new file mode 100644
index 0000000..d2f2420
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
@@ -0,0 +1,211 @@
+#!/bin/sh -e
+#
+# Copyright (C) 2008-2011 Intel
+#
+# install.sh [device_name] [rootfs_name] [video_mode] [vga_mode]
+#
+
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+
+# We need 20 Mb for the boot partition
+boot_size=200
+
+# 50% for the the test partition
+testfs_ratio=50
+
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
+
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
+done
+
+if [ -n "$TARGET_DEVICE_NAME" ]; then
+    echo "Installing image on /dev/$TARGET_DEVICE_NAME ..."
+else
+    echo "No hard drive selected. Installation aborted."
+    exit 1
+fi
+
+device=$TARGET_DEVICE_NAME
+
+#
+# The udev automounter can cause pain here, kill it
+#
+rm -f /etc/udev/rules.d/automount.rules
+rm -f /etc/udev/scripts/mount*
+
+#
+# Unmount anything the automounter had mounted
+#
+umount /dev/${device}* 2> /dev/null || /bin/true
+
+if [ ! -b /dev/loop0 ] ; then
+    mknod /dev/loop0 b 7 0
+fi
+
+mkdir -p /tmp
+cat /proc/mounts > /etc/mtab
+
+disk_size=$(parted /dev/${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
+
+testfs_size=$((disk_size*testfs_ratio/100))
+rootfs_size=$((disk_size-boot_size-testfs_size))
+
+rootfs_start=$((boot_size))
+rootfs_end=$((rootfs_start+rootfs_size))
+testfs_start=$((rootfs_end))
+
+# MMC devices are special in a couple of ways
+# 1) they use a partition prefix character 'p'
+# 2) they are detected asynchronously (need rootwait)
+rootwait=""
+part_prefix=""
+if [ ! "${device#mmcblk}" = "${device}" ]; then
+	part_prefix="p"
+	rootwait="rootwait"
+fi
+bootfs=/dev/${device}${part_prefix}1
+rootfs=/dev/${device}${part_prefix}2
+testfs=/dev/${device}${part_prefix}3
+
+echo "*****************"
+echo "Boot partition size:   $boot_size MB ($bootfs)"
+echo "Rootfs partition size: $rootfs_size MB ($rootfs)"
+echo "Testfs partition size: $testfs_size MB ($testfs)"
+echo "*****************"
+echo "Deleting partition table on /dev/${device} ..."
+dd if=/dev/zero of=/dev/${device} bs=512 count=2
+
+echo "Creating new partition table on /dev/${device} ..."
+parted /dev/${device} mklabel msdos
+
+echo "Creating boot partition on $bootfs"
+parted /dev/${device} mkpart primary 0% $boot_size
+
+echo "Creating rootfs partition on $rootfs"
+parted /dev/${device} mkpart primary $rootfs_start $rootfs_end
+
+echo "Creating testfs partition on $testfs"
+parted /dev/${device} mkpart primary $testfs_start 100%
+
+parted /dev/${device} print
+
+echo "Formatting $bootfs to ext3..."
+mkfs.ext3 -L "boot" $bootfs
+
+echo "Formatting $rootfs to ext3..."
+mkfs.ext3 -L "rootfs" $rootfs
+
+echo "Formatting $testfs to ext3..."
+mkfs.ext3 -L "testrootfs" $testfs
+
+mkdir /tgt_root
+mkdir /src_root
+mkdir -p /boot
+
+# Handling of the target root partition
+mount $rootfs /tgt_root
+mount -o rw,loop,noatime,nodiratime /media/$1/$2 /src_root
+echo "Copying rootfs files..."
+cp -a /src_root/* /tgt_root
+if [ -d /tgt_root/etc/ ] ; then
+    echo "$bootfs              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
+    # We dont want udev to mount our root device while we're booting...
+    if [ -d /tgt_root/etc/udev/ ] ; then
+	echo "/dev/${device}" >> /tgt_root/etc/udev/mount.blacklist
+    fi
+fi
+umount /tgt_root
+umount /src_root
+
+# Handling of the target boot partition
+mount $bootfs /boot
+echo "Preparing boot partition..."
+if [ -f /etc/grub.d/40_custom ] ; then
+    echo "Preparing custom grub2 menu..."
+    GRUBCFG="/boot/grub/grub.cfg"
+    mkdir -p $(dirname $GRUBCFG)
+    cp /etc/grub.d/40_custom $GRUBCFG
+    sed -i "s@__ROOTFS__@$rootfs $rootwait@g" $GRUBCFG
+    sed -i "s/__VIDEO_MODE__/$3/g" $GRUBCFG
+    sed -i "s/__VGA_MODE__/$4/g" $GRUBCFG
+    sed -i "s/__CONSOLE__/$5/g" $GRUBCFG
+    sed -i "/#/d" $GRUBCFG
+    sed -i "/exec tail/d" $GRUBCFG
+
+    # Add the test label
+    echo -ne "\nmenuentry 'test' {\nlinux /test-kernel root=$testfs rw $rootwait quiet\n}\n" >> $GRUBCFG
+
+    chmod 0444 $GRUBCFG
+fi
+grub-install /dev/${device}
+echo "(hd0) /dev/${device}" > /boot/grub/device.map
+
+# If grub.cfg doesn't exist, assume GRUB 0.97 and create a menu.lst
+if [ ! -f /boot/grub/grub.cfg ] ; then
+    echo "Preparing custom grub menu..."
+    echo "default 0" > /boot/grub/menu.lst
+    echo "timeout 30" >> /boot/grub/menu.lst
+    echo "title Live Boot/Install-Image" >> /boot/grub/menu.lst
+    echo "root  (hd0,0)" >> /boot/grub/menu.lst
+    echo "kernel /vmlinuz root=$rootfs rw $3 $4 quiet" >> /boot/grub/menu.lst
+fi
+
+cp /media/$1/vmlinuz /boot/
+
+umount /boot
+
+sync
+
+echo "Remove your installation media, and press ENTER"
+
+read enter
+
+echo "Rebooting..."
+reboot -f
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb
new file mode 100644
index 0000000..a54960c
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Live image install script for with a second rootfs/kernel option"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+SRC_URI = "file://init-install-efi-testfs.sh"
+
+RDEPENDS_${PN} = "parted e2fsprogs-mke2fs dosfstools"
+
+do_install() {
+        install -m 0755 ${WORKDIR}/init-install-efi-testfs.sh ${D}/install-efi.sh
+}
+
+INHIBIT_DEFAULT_DEPS = "1"
+FILES_${PN} = " /install-efi.sh "
+COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb
new file mode 100644
index 0000000..db4cf54
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Live image install script with a second rootfs/kernel"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+SRC_URI = "file://init-install-testfs.sh"
+
+RDEPENDS_${PN} = "grub parted e2fsprogs-mke2fs"
+
+do_install() {
+        install -m 0755 ${WORKDIR}/init-install-testfs.sh ${D}/install.sh
+}
+
+INHIBIT_DEFAULT_DEPS = "1"
+FILES_${PN} = " /install.sh "
+COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
-- 
1.8.5.3


