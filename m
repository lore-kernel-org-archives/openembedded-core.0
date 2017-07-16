Return-Path: <wei.tee.ng@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1144C65D00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 02:39:32 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jul 2017 19:39:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,372,1496127600"; d="scan'208";a="108754965"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga004.jf.intel.com with ESMTP; 16 Jul 2017 19:39:32 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Jul 2017 12:29:04 -0700
Message-Id: <5f6ad89554e31ff40b720599eb60f0237f1b4dfa.1500229225.git.wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1500229225.git.wei.tee.ng@intel.com>
References: <cover.1500229225.git.wei.tee.ng@intel.com>
Cc: wei.tee.ng@intel.com, saul.wold@intel.com
Subject: [PATCH v2 1/1] initramfs-framework: include install-efi module in recipe for installation
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
X-List-Received-Date: Mon, 17 Jul 2017 02:39:32 -0000

From: "Ng, Wei Tee" <wei.tee.ng@intel.com>

Utilized the existing init-install-efi.sh script and renamed it to
install-efi.sh to manage the installation process of images in
initramfs-framework model. This script will be executed when
"install" option is being chosen in the grub menu and install
the image on the target platform. A new install-efi module is
being added in the recipe to handle the installation process
using initramfs-framework.

[YOCTO #10989]

Signed-off-by: Ng, Wei Tee <wei.tee.ng@intel.com>
---
This version is to rename init-install-efi.sh to install-efi.sh and package name to install-efi.
 .../initramfs-framework/install-efi.sh             | 276 +++++++++++++++++++++
 .../initrdscripts/initramfs-framework_1.0.bb       |  13 +-
 2 files changed, 287 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/install-efi.sh

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/install-efi.sh b/meta/recipes-core/initrdscripts/initramfs-framework/install-efi.sh
new file mode 100644
index 0000000..5ad3a60
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/install-efi.sh
@@ -0,0 +1,276 @@
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
+# We need 20 Mb for the boot partition
+boot_size=20
+
+# 5% for swap
+swap_ratio=5
+
+# Get a list of hard drives
+hdnamelist=""
+live_dev_name=`cat /proc/mounts | grep ${1%/} | awk '{print $1}'`
+live_dev_name=${live_dev_name#\/dev/}
+# Only strip the digit identifier if the device is not an mmc
+case $live_dev_name in
+    mmcblk*)
+    ;;
+    nvme*)
+    ;;
+    *)
+        live_dev_name=${live_dev_name%%[0-9]*}
+    ;;
+esac
+
+echo "Searching for hard drives ..."
+
+# Some eMMC devices have special sub devices such as mmcblk0boot0 etc
+# we're currently only interested in the root device so pick them wisely
+devices=`ls /sys/block/ | grep -v mmcblk` || true
+mmc_devices=`ls /sys/block/ | grep "mmcblk[0-9]\{1,\}$"` || true
+devices="$devices $mmc_devices"
+
+for device in $devices; do
+    case $device in
+        loop*)
+            # skip loop device
+            ;;
+        sr*)
+            # skip CDROM device
+            ;;
+        ram*)
+            # skip ram device
+            ;;
+        *)
+            # skip the device LiveOS is on
+            # Add valid hard drive name to the list
+            case $device in
+                $live_dev_name*)
+                # skip the device we are running from
+                ;;
+                *)
+                    hdnamelist="$hdnamelist $device"
+                ;;
+            esac
+            ;;
+    esac
+done
+
+if [ -z "${hdnamelist}" ]; then
+    echo "You need another device (besides the live device /dev/${live_dev_name}) to install the image. Installation aborted."
+    exit 1
+fi
+
+TARGET_DEVICE_NAME=""
+for hdname in $hdnamelist; do
+    # Display found hard drives and their basic info
+    echo "-------------------------------"
+    echo /dev/$hdname
+    if [ -r /sys/block/$hdname/device/vendor ]; then
+        echo -n "VENDOR="
+        cat /sys/block/$hdname/device/vendor
+    fi
+    if [ -r /sys/block/$hdname/device/model ]; then
+        echo -n "MODEL="
+        cat /sys/block/$hdname/device/model
+    fi
+    if [ -r /sys/block/$hdname/device/uevent ]; then
+        echo -n "UEVENT="
+        cat /sys/block/$hdname/device/uevent
+    fi
+    echo
+done
+
+# Get user choice
+while true; do
+    echo "Please select an install target or press n to exit ($hdnamelist ): "
+    read answer
+    if [ "$answer" = "n" ]; then
+        echo "Installation manually aborted."
+        exit 1
+    fi
+    for hdname in $hdnamelist; do
+        if [ "$answer" = "$hdname" ]; then
+            TARGET_DEVICE_NAME=$answer
+            break
+        fi
+    done
+    if [ -n "$TARGET_DEVICE_NAME" ]; then
+        break
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
+device=/dev/$TARGET_DEVICE_NAME
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
+umount ${device}* 2> /dev/null || /bin/true
+
+mkdir -p /tmp
+
+# Create /etc/mtab if not present
+if [ ! -e /etc/mtab ] && [ -e /proc/mounts ]; then
+    ln -sf /proc/mounts /etc/mtab
+fi
+
+disk_size=$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | cut -d" " -f 3 | sed -e "s/MB//")
+
+swap_size=$((disk_size*swap_ratio/100))
+rootfs_size=$((disk_size-boot_size-swap_size))
+
+rootfs_start=$((boot_size))
+rootfs_end=$((rootfs_start+rootfs_size))
+swap_start=$((rootfs_end))
+
+# MMC devices are special in a couple of ways
+# 1) they use a partition prefix character 'p'
+# 2) they are detected asynchronously (need rootwait)
+rootwait=""
+part_prefix=""
+if [ ! "${device#/dev/mmcblk}" = "${device}" ] || \
+   [ ! "${device#/dev/nvme}" = "${device}" ]; then
+    part_prefix="p"
+    rootwait="rootwait"
+fi
+
+# USB devices also require rootwait
+if [ -n `readlink /dev/disk/by-id/usb* | grep $TARGET_DEVICE_NAME` ]; then
+    rootwait="rootwait"
+fi
+
+bootfs=${device}${part_prefix}1
+rootfs=${device}${part_prefix}2
+swap=${device}${part_prefix}3
+
+echo "*****************"
+echo "Boot partition size:   $boot_size MB ($bootfs)"
+echo "Rootfs partition size: $rootfs_size MB ($rootfs)"
+echo "Swap partition size:   $swap_size MB ($swap)"
+echo "*****************"
+echo "Deleting partition table on ${device} ..."
+dd if=/dev/zero of=${device} bs=512 count=35
+
+echo "Creating new partition table on ${device} ..."
+parted ${device} mklabel gpt
+
+echo "Creating boot partition on $bootfs"
+parted ${device} mkpart boot fat32 0% $boot_size
+parted ${device} set 1 boot on
+
+echo "Creating rootfs partition on $rootfs"
+parted ${device} mkpart root ext3 $rootfs_start $rootfs_end
+
+echo "Creating swap partition on $swap"
+parted ${device} mkpart swap linux-swap $swap_start 100%
+
+parted ${device} print
+
+echo "Formatting $bootfs to vfat..."
+mkfs.vfat $bootfs
+
+echo "Formatting $rootfs to ext3..."
+mkfs.ext3 $rootfs
+
+echo "Formatting swap partition...($swap)"
+mkswap $swap
+
+mkdir /tgt_root
+mkdir /src_root
+mkdir -p /boot
+
+# Handling of the target root partition
+mount $rootfs /tgt_root
+mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /src_root
+echo "Copying rootfs files..."
+cp -a /src_root/* /tgt_root
+if [ -d /tgt_root/etc/ ] ; then
+    boot_uuid=$(blkid -o value -s UUID ${bootfs})
+    swap_part_uuid=$(blkid -o value -s PARTUUID ${swap})
+    echo "/dev/disk/by-partuuid/$swap_part_uuid                swap             swap       defaults              0  0" >> /tgt_root/etc/fstab
+    echo "UUID=$boot_uuid              /boot            vfat       defaults              1  2" >> /tgt_root/etc/fstab
+    # We dont want udev to mount our root device while we're booting...
+    if [ -d /tgt_root/etc/udev/ ] ; then
+        echo "${device}" >> /tgt_root/etc/udev/mount.blacklist
+    fi
+fi
+
+umount /src_root
+
+# Handling of the target boot partition
+mount $bootfs /boot
+echo "Preparing boot partition..."
+
+EFIDIR="/boot/EFI/BOOT"
+mkdir -p $EFIDIR
+# Copy the efi loader
+cp /run/media/$1/EFI/BOOT/*.efi $EFIDIR
+
+if [ -f /run/media/$1/EFI/BOOT/grub.cfg ]; then
+    root_part_uuid=$(blkid -o value -s PARTUUID ${rootfs})
+    GRUBCFG="$EFIDIR/grub.cfg"
+    cp /run/media/$1/EFI/BOOT/grub.cfg $GRUBCFG
+    # Update grub config for the installed image
+    # Delete the install entry
+    sed -i "/menuentry 'install'/,/^}/d" $GRUBCFG
+    # Delete the initrd lines
+    sed -i "/initrd /d" $GRUBCFG
+    # Delete any LABEL= strings
+    sed -i "s/ LABEL=[^ ]*/ /" $GRUBCFG
+    # Delete any root= strings
+    sed -i "s/ root=[^ ]*/ /g" $GRUBCFG
+    # Add the root= and other standard boot options
+    sed -i "s@linux /vmlinuz *@linux /vmlinuz root=PARTUUID=$root_part_uuid rw $rootwait quiet @" $GRUBCFG
+fi
+
+if [ -d /run/media/$1/loader ]; then
+    rootuuid=$(blkid -o value -s PARTUUID ${rootfs})
+    SYSTEMDBOOT_CFGS="/boot/loader/entries/*.conf"
+    # copy config files for systemd-boot
+    cp -dr /run/media/$1/loader /boot
+    # delete the install entry
+    rm -f /boot/loader/entries/install.conf
+    # delete the initrd lines
+    sed -i "/initrd /d" $SYSTEMDBOOT_CFGS
+    # delete any LABEL= strings
+    sed -i "s/ LABEL=[^ ]*/ /" $SYSTEMDBOOT_CFGS
+    # delete any root= strings
+    sed -i "s/ root=[^ ]*/ /" $SYSTEMDBOOT_CFGS
+    # add the root= and other standard boot options
+    sed -i "s@options *@options root=PARTUUID=$rootuuid rw $rootwait quiet @" $SYSTEMDBOOT_CFGS
+fi
+
+umount /tgt_root
+
+cp /run/media/$1/vmlinuz /boot
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
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 211e89d..2928e5d 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -14,7 +14,8 @@ SRC_URI = "file://init \
            file://udev \
            file://e2fs \
            file://debug \
-           file://setup-live"
+           file://setup-live \
+           file://install-efi.sh"
 
 S = "${WORKDIR}"
 
@@ -41,6 +42,9 @@ do_install() {
     # debug
     install -m 0755 ${WORKDIR}/debug ${D}/init.d/00-debug
 
+    # install-efi
+    install -m 0755 ${WORKDIR}/install-efi.sh ${D}/init.d/install-efi.sh
+
     # Create device nodes expected by some kernels in initramfs
     # before even executing /init.
     install -d ${D}/dev
@@ -53,7 +57,8 @@ PACKAGES = "${PN}-base \
             initramfs-module-e2fs \
             initramfs-module-rootfs \
             initramfs-module-debug \
-            initramfs-module-setup-live"
+            initramfs-module-setup-live \
+            initramfs-module-install-efi"
 
 FILES_${PN}-base = "/init /init.d/99-finish /dev"
 
@@ -88,3 +93,7 @@ FILES_initramfs-module-rootfs = "/init.d/90-rootfs"
 SUMMARY_initramfs-module-debug = "initramfs dynamic debug support"
 RDEPENDS_initramfs-module-debug = "${PN}-base"
 FILES_initramfs-module-debug = "/init.d/00-debug"
+
+SUMMARY_initramfs-module-install-efi = "initramfs support for installation option"
+RDEPENDS_initramfs-module-install-efi = "${PN}-base parted e2fsprogs-mke2fs dosfstools util-linux-blkid"
+FILES_initramfs-module-install-efi = "/init.d/install-efi.sh"
-- 
2.7.4


