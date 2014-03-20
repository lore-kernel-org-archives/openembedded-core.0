Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B65806F8CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 16:36:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Mar 2014 09:25:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,695,1389772800"; d="scan'208";a="476505394"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2014 09:29:35 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.160])
	by linux.intel.com (Postfix) with ESMTP id 557796A4083
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 09:29:21 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Mar 2014 18:29:34 +0200
Message-Id: <2dc24391f3652ef5bd613e701a653fdd0f92df0d.1395332218.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1395332218.git.stefanx.stanacar@intel.com>
References: <cover.1395332218.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1395332218.git.stefanx.stanacar@intel.com>
References: <cover.1395332218.git.stefanx.stanacar@intel.com>
Subject: [RFC PATCH 2/4] initrdscripts: add install scripts with a second rootfs
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
X-List-Received-Date: Thu, 20 Mar 2014 16:36:27 -0000

The install scripts are similar to the default ones, but:
- custom partitioning, replaces the swap partiton with a second root filesystem
- adds labels to the partitions
- preconfigures a boot loader entry for the second
Other arches not using installers would simply deploy the image as they do,
they just need to follow the same schema.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 .../initrdscripts/files/init-install-efi-testfs.sh | 36 ++++++++++++----------
 .../initrdscripts/files/init-install-testfs.sh     | 33 +++++++++++---------
 .../initramfs-live-install-efi-testfs_1.0.bb       | 20 ++++++++++++
 .../initramfs-live-install-testfs_1.0.bb           | 20 ++++++++++++
 4 files changed, 77 insertions(+), 32 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
index ed3221b..2fea761 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
@@ -8,11 +8,11 @@
 
 PATH=/sbin:/bin:/usr/sbin:/usr/bin
 
-# We need 20 Mb for the boot partition
-boot_size=20
+# We need 200 Mb for the boot partition
+boot_size=200
 
-# 5% for swap
-swap_ratio=5
+# 50% for the second rootfs
+testfs_ratio=50
 
 found="no"
 
@@ -71,12 +71,12 @@ cat /proc/mounts > /etc/mtab
 
 disk_size=$(parted /dev/${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
 
-swap_size=$((disk_size*swap_ratio/100))
-rootfs_size=$((disk_size-boot_size-swap_size))
+testfs_size=$((disk_size*testfs_ratio/100))
+rootfs_size=$((disk_size-boot_size-testfs_size))
 
 rootfs_start=$((boot_size))
 rootfs_end=$((rootfs_start+rootfs_size))
-swap_start=$((rootfs_end))
+testfs_start=$((rootfs_end))
 
 # MMC devices are special in a couple of ways
 # 1) they use a partition prefix character 'p'
@@ -89,12 +89,12 @@ if [ ! "${device#mmcblk}" = "${device}" ]; then
 fi
 bootfs=/dev/${device}${part_prefix}1
 rootfs=/dev/${device}${part_prefix}2
-swap=/dev/${device}${part_prefix}3
+testfs=/dev/${device}${part_prefix}3
 
 echo "*****************"
 echo "Boot partition size:   $boot_size MB ($bootfs)"
 echo "Rootfs partition size: $rootfs_size MB ($rootfs)"
-echo "Swap partition size:   $swap_size MB ($swap)"
+echo "Testfs partition size:   $testfs_size MB ($testfs)"
 echo "*****************"
 echo "Deleting partition table on /dev/${device} ..."
 dd if=/dev/zero of=/dev/${device} bs=512 count=2
@@ -109,19 +109,19 @@ parted /dev/${device} set 1 boot on
 echo "Creating rootfs partition on $rootfs"
 parted /dev/${device} mkpart primary $rootfs_start $rootfs_end
 
-echo "Creating swap partition on $swap"
-parted /dev/${device} mkpart primary $swap_start 100%
+echo "Creating testfs partition on $testfs"
+parted /dev/${device} mkpart primary $testfs_start 100%
 
 parted /dev/${device} print
 
 echo "Formatting $bootfs to vfat..."
-mkfs.vfat $bootfs
+mkfs.vfat -n "boot" $bootfs
 
 echo "Formatting $rootfs to ext3..."
-mkfs.ext3 $rootfs
+mkfs.ext3 -L "platform" $rootfs
 
-echo "Formatting swap partition...($swap)"
-mkswap $swap
+echo "Formatting $testfs to ext3..."
+mkfs.ext3 -L "testrootfs" $testfs
 
 mkdir /ssd
 mkdir /rootmnt
@@ -133,9 +133,9 @@ mount -o rw,loop,noatime,nodiratime /media/$1/$2 /rootmnt
 echo "Copying rootfs files..."
 cp -a /rootmnt/* /ssd
 
-if [ -d /ssd/etc/ ] ; then
-    echo "$swap                swap             swap       defaults              0  0" >> /ssd/etc/fstab
+touch /ssd/etc/masterimage
 
+if [ -d /ssd/etc/ ] ; then
     # We dont want udev to mount our root device while we're booting...
     if [ -d /ssd/etc/udev/ ] ; then
         echo "/dev/${device}" >> /ssd/etc/udev/mount.blacklist
@@ -184,6 +184,8 @@ if [ -d /media/$1/loader ]; then
     sed -i "s/ root=[^ ]*/ /" $GUMMIBOOT_CFGS
     # add the root= and other standard boot options
     sed -i "s@options *@options root=$rootfs rw $rootwait quiet @" $GUMMIBOOT_CFGS
+    # Add the test label
+    echo -ne "title test\nlinux /test-kernel\noptions root=$testfs rw $rootwait quiet\n" > /ssd/loader/entries/test.conf
 fi
 
 umount /ssd
diff --git a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
index 8e433d5..c35fd2a 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
@@ -8,10 +8,10 @@
 PATH=/sbin:/bin:/usr/sbin:/usr/bin
 
 # We need 20 Mb for the boot partition
-boot_size=20
+boot_size=200
 
-# 5% for the swap
-swap_ratio=5
+# 50% for the the test partition
+testfs_ratio=50
 
 # Get a list of hard drives
 hdnamelist=""
@@ -94,12 +94,12 @@ cat /proc/mounts > /etc/mtab
 
 disk_size=$(parted /dev/${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
 
-swap_size=$((disk_size*swap_ratio/100))
-rootfs_size=$((disk_size-boot_size-swap_size))
+testfs_size=$((disk_size*testfs_ratio/100))
+rootfs_size=$((disk_size-boot_size-testfs_size))
 
 rootfs_start=$((boot_size))
 rootfs_end=$((rootfs_start+rootfs_size))
-swap_start=$((rootfs_end))
+testfs_start=$((rootfs_end))
 
 # MMC devices are special in a couple of ways
 # 1) they use a partition prefix character 'p'
@@ -112,12 +112,12 @@ if [ ! "${device#mmcblk}" = "${device}" ]; then
 fi
 bootfs=/dev/${device}${part_prefix}1
 rootfs=/dev/${device}${part_prefix}2
-swap=/dev/${device}${part_prefix}3
+testfs=/dev/${device}${part_prefix}3
 
 echo "*****************"
 echo "Boot partition size:   $boot_size MB ($bootfs)"
 echo "Rootfs partition size: $rootfs_size MB ($rootfs)"
-echo "Swap partition size:   $swap_size MB ($swap)"
+echo "Testfs partition size: $testfs_size MB ($testfs)"
 echo "*****************"
 echo "Deleting partition table on /dev/${device} ..."
 dd if=/dev/zero of=/dev/${device} bs=512 count=2
@@ -131,19 +131,19 @@ parted /dev/${device} mkpart primary 0% $boot_size
 echo "Creating rootfs partition on $rootfs"
 parted /dev/${device} mkpart primary $rootfs_start $rootfs_end
 
-echo "Creating swap partition on $swap"
-parted /dev/${device} mkpart primary $swap_start 100%
+echo "Creating testfs partition on $testfs"
+parted /dev/${device} mkpart primary $testfs_start 100%
 
 parted /dev/${device} print
 
 echo "Formatting $bootfs to ext3..."
-mkfs.ext3 $bootfs
+mkfs.ext3 -L "boot" $bootfs
 
 echo "Formatting $rootfs to ext3..."
-mkfs.ext3 $rootfs
+mkfs.ext3 -L "platform" $rootfs
 
-echo "Formatting swap partition...($swap)"
-mkswap $swap
+echo "Formatting testfs partition...($testfs)"
+mkfs.ext3 -L "testrootfs" $testfs
 
 mkdir /tgt_root
 mkdir /src_root
@@ -155,7 +155,6 @@ mount -o rw,loop,noatime,nodiratime /media/$1/$2 /src_root
 echo "Copying rootfs files..."
 cp -a /src_root/* /tgt_root
 if [ -d /tgt_root/etc/ ] ; then
-    echo "$swap                swap             swap       defaults              0  0" >> /tgt_root/etc/fstab
     echo "$bootfs              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
     if [ -d /tgt_root/etc/udev/ ] ; then
@@ -179,6 +178,10 @@ if [ -f /etc/grub.d/40_custom ] ; then
     sed -i "s/__CONSOLE__/$5/g" $GRUBCFG
     sed -i "/#/d" $GRUBCFG
     sed -i "/exec tail/d" $GRUBCFG
+
+    # Add the test label
+    echo -ne "\nmenuentry 'test' {\nlinux /test-kernel root=$testfs rw $rootwait quiet\n}\n" >> $GRUBCFG
+
     chmod 0444 $GRUBCFG
 fi
 grub-install /dev/${device}
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb
new file mode 100644
index 0000000..2fb56f4
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi-testfs_1.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Live image install script for grub-efi with a second rootfs/kernel option"
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
+# While this package maybe an allarch due to it being a
+# simple script, reality is that it is Host specific based
+# on the COMPATIBLE_HOST below, which needs to take precedence
+#inherit allarch
+INHIBIT_DEFAULT_DEPS = "1"
+
+FILES_${PN} = " /install-efi.sh "
+
+COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb
new file mode 100644
index 0000000..3e47c56
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-testfs_1.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Live image install script for grub with a second rootfs"
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
1.8.5.3


