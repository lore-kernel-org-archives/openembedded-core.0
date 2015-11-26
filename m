Return-Path: <mei.yeen.ng@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AA208612E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 02:26:48 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 25 Nov 2015 18:26:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,345,1444719600"; 
   d="scan'208";a="2430488"
Received: from mng4-ilbpg4.png.intel.com ([10.88.227.35])
	by fmsmga004.fm.intel.com with ESMTP; 25 Nov 2015 18:26:48 -0800
From: Mei Yeen Ng <mei.yeen.ng@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 10:25:29 +0800
Message-Id: <1448504729-25657-3-git-send-email-mei.yeen.ng@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448504729-25657-1-git-send-email-mei.yeen.ng@intel.com>
References: <1448504729-25657-1-git-send-email-mei.yeen.ng@intel.com>
Cc: Mei Yeen Ng <mei.yeen.ng@intel.com>
Subject: [PATCH 2/2] meta: fix install-efi script for emmc installation
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
X-List-Received-Date: Thu, 26 Nov 2015 02:26:48 -0000

From: "Ng, Mei Yeen" <mei.yeen.ng@intel.com>

Running the install option from bootloader to install image to eMMC will fail
with error:
Formatting /dev/mmcblk01 to vfat...
mkfs.fat 3.0.28 (2015-05-16)
/dev/mmcblk01: No such file or directory

This issue impacts both grub and gummiboot install options to eMMC device.
The installation failure is due to the following:
[1] Unable to partition eMMC as the partition prefix 'p' is not appended
The condition checking failed with the additional /dev/ appended to
the target device name.
[2] The partition uuid for boot, root and swap partition is not captured
for eMMC

This fix updated the condition checking and changed the variables to
reference the boot, root and swap partitions for UUID.

[YOCTO #8710]
Signed-off-by: Ng, Mei Yeen <mei.yeen.ng@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 3c79a0d..0443a9d 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -134,7 +134,7 @@ swap_start=$((rootfs_end))
 # 2) they are detected asynchronously (need rootwait)
 rootwait=""
 part_prefix=""
-if [ ! "${device#mmcblk}" = "${device}" ]; then
+if [ ! "${device#/dev/mmcblk}" = "${device}" ]; then
     part_prefix="p"
     rootwait="rootwait"
 fi
@@ -184,8 +184,8 @@ mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /src_root
 echo "Copying rootfs files..."
 cp -a /src_root/* /tgt_root
 if [ -d /tgt_root/etc/ ] ; then
-    boot_uuid=$(blkid -o value -s UUID ${device}1)
-    swap_part_uuid=$(blkid -o value -s PARTUUID ${device}3)
+    boot_uuid=$(blkid -o value -s UUID ${bootfs})
+    swap_part_uuid=$(blkid -o value -s PARTUUID ${swap})
     echo "/dev/disk/by-partuuid/$swap_part_uuid                swap             swap       defaults              0  0" >> /tgt_root/etc/fstab
     echo "UUID=$boot_uuid              /boot            vfat       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
@@ -206,7 +206,7 @@ mkdir -p $EFIDIR
 cp /run/media/$1/EFI/BOOT/*.efi $EFIDIR
 
 if [ -f /run/media/$1/EFI/BOOT/grub.cfg ]; then
-    root_part_uuid=$(blkid -o value -s PARTUUID ${device}2)
+    root_part_uuid=$(blkid -o value -s PARTUUID ${rootfs})
     GRUBCFG="$EFIDIR/grub.cfg"
     cp /run/media/$1/EFI/BOOT/grub.cfg $GRUBCFG
     # Update grub config for the installed image
-- 
1.9.1


