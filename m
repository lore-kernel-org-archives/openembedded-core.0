Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1R3iHN-0003BQ-VW
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 07:45:02 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Sep 2011 22:39:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,378,1312182000"; d="scan'208";a="51047683"
Received: from unknown (HELO [10.255.14.200]) ([10.255.14.200])
	by fmsmga001.fm.intel.com with ESMTP; 13 Sep 2011 22:39:44 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 00:39:32 -0500
Message-ID: <1315978772.26879.1860.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: [PATCH 2/2] initramfs-live-install: add a version for use with grub2
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
X-List-Received-Date: Wed, 14 Sep 2011 05:45:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

grub2 uses a completely different set of install steps.  These are
contained in a 2.0 version of init-install.sh, which is tied to grub2
(1.98) and a 2.0 version of the initramfs-live-install recipe.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 .../initrdscripts/files/init-install_2.0.sh        |  178 ++++++++++++++++++++
 .../initrdscripts/initramfs-live-install_2.0.bb    |   22 +++
 2 files changed, 200 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/files/init-install_2.0.sh
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-live-install_2.0.bb

diff --git a/meta/recipes-core/initrdscripts/files/init-install_2.0.sh b/meta/recipes-core/initrdscripts/files/init-install_2.0.sh
new file mode 100644
index 0000000..a1876f8
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/files/init-install_2.0.sh
@@ -0,0 +1,178 @@
+#!/bin/sh -e
+#
+# Copyright (C) 2011 Intel
+#
+# install.sh [device_name] [rootfs_name] [video_mode] [vga_mode]
+#
+
+# We need 20 Mb for the boot partition
+boot_size=20
+
+# 5% for the swap
+swap_ratio=5
+
+found="no"
+
+echo "Searching for a hard drive..."
+for device in 'hda' 'hdb' 'sda' 'sdb'
+  do
+  if [ -e /sys/block/${device}/removable ]; then
+      if [ "$(cat /sys/block/${device}/removable)" = "0" ]; then
+	  found="yes"
+
+	  while true; do
+	      echo "Found drive at /dev/${device}. Do you want to install poky there ? [y/n]"
+	      read answer
+	      if [ "$answer" = "y" ] ; then
+		  break
+	      fi
+	  
+	      if [ "$answer" = "n" ] ; then
+		  found=no
+		  break
+	      fi
+
+	      echo "Please answer by y or n"
+	  done
+      fi
+  fi
+
+  if [ "$found" = "yes" ]; then
+      break;
+  fi
+
+done
+
+if [ "$found" = "no" ]; then
+      exit 1      
+fi
+
+echo "Installing image on /dev/${device}"
+
+#
+# The udev automounter can cause pain here, kill it
+#
+rm -f /etc/udev/scripts/mount*
+
+#
+# Unmount anything the automounter had mounted
+#
+umount /dev/${device} 2> /dev/null || /bin/true
+umount /dev/${device}1 2> /dev/null || /bin/true
+umount /dev/${device}2 2> /dev/null || /bin/true
+umount /dev/${device}3 2> /dev/null || /bin/true
+umount /dev/${device}4 2> /dev/null || /bin/true
+umount /dev/${device}5 2> /dev/null || /bin/true
+umount /dev/${device}6 2> /dev/null || /bin/true
+
+if [ ! -b /dev/sda ] ; then
+    mknod /dev/sda b 8 0
+fi
+
+if [ ! -b /dev/sdb ] ; then
+    mknod /dev/sdb b 8 16
+fi
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
+swap_size=$((disk_size*5/100))
+rootfs_size=$((disk_size-boot_size-swap_size))
+
+rootfs_start=$((boot_size + 1))
+rootfs_end=$((rootfs_start+rootfs_size))
+swap_start=$((rootfs_end+1))
+
+bootfs=/dev/${device}1
+rootfs=/dev/${device}2
+swap=/dev/${device}3
+
+echo "*****************"
+echo "Boot partition size:   $boot_size MB (/dev/${device}1)"
+echo "Rootfs partition size: $rootfs_size MB (/dev/${device}2)"
+echo "Swap partition size:   $swap_size MB (/dev/${device}3)"
+echo "*****************"
+echo "Deleting partition table on /dev/${device} ..."
+dd if=/dev/zero of=/dev/${device} bs=512 count=2
+
+echo "Creating new partition table on /dev/${device} ..."
+parted /dev/${device} mklabel msdos
+
+echo "Creating boot partition on /dev/${device}1"
+parted /dev/${device} mkpart primary 1 $boot_size
+
+echo "Creating rootfs partition on /dev/${device}2"
+parted /dev/${device} mkpart primary $rootfs_start $rootfs_end 
+
+echo "Creating swap partition on /dev/${device}3"
+parted /dev/${device} mkpart primary $swap_start $disk_size
+
+parted /dev/${device} print
+
+echo "Formatting /dev/${device}1 to ext2..."
+mkfs.ext3 $bootfs
+
+echo "Formatting /dev/${device}2 to ext3..."
+mkfs.ext3 $rootfs
+
+echo "Formatting swap partition...(/dev/${device}3)"
+mkswap $swap
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
+if [ -d /ssd/etc/ ] ; then
+    echo "$swap                swap             swap       defaults              0  0" >> /ssd/etc/fstab
+
+    # We dont want udev to mount our root device while we're booting...
+    if [ -d /ssd/etc/udev/ ] ; then
+	echo "/dev/${device}" >> /ssd/etc/udev/mount.blacklist
+    fi
+fi
+
+sed -i "s@__ROOTFS__@$rootfs@g" /ssd/etc/grub.d/40_custom
+sed -i "s/__VIDEO_MODE__/$3/g" /ssd/etc/grub.d/40_custom
+sed -i "s/__VGA_MODE__/$4/g" /ssd/etc/grub.d/40_custom
+mount $bootfs /bootmnt
+cp /ssd/etc/grub.d/40_custom /bootmnt/40_custom
+umount /bootmnt
+force="--force"
+
+umount /ssd
+umount /rootmnt
+
+echo "Preparing boot partition..."
+mount $bootfs /ssd
+grub-install $force --root-directory=/ssd /dev/${device}
+
+echo "(hd0) /dev/${device}" > /ssd/boot/grub/device.map
+
+mv /ssd/40_custom /ssd/boot/grub/grub.cfg
+sed -i "/#/d" /ssd/boot/grub/grub.cfg
+sed -i "/exec tail/d" /ssd/boot/grub/grub.cfg
+chmod 0444 /ssd/boot/grub/grub.cfg
+
+cp /media/$1/vmlinuz /ssd/boot/
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
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_2.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_2.0.bb
new file mode 100644
index 0000000..75ba198
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_2.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "A live image init script for grub2"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+SRC_URI = "file://init-install_2.0.sh"
+
+PR = "r0"
+
+RDEPENDS="grub (>= 1.99) parted e2fsprogs-mke2fs"
+
+do_install() {
+        install -m 0755 ${WORKDIR}/init-install_2.0.sh ${D}/install.sh
+}
+
+# While this package maybe an allarch due to it being a 
+# simple script, reality is that it is Host specific based
+# on the COMPATIBLE_HOST below, which needs to take precedence
+#inherit allarch
+INHIBIT_DEFAULT_DEPS = "1"
+
+FILES_${PN} = " /install.sh "
+
+COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
-- 
1.7.0.4





