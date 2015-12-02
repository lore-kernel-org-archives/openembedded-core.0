Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 22F7E6B6F5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 02:41:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 01 Dec 2015 18:41:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,371,1444719600"; d="scan'208";a="611016832"
Received: from psverdru-mobl1.amr.corp.intel.com (HELO
	swold-mobl.jf.intel.com) ([10.252.197.212])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Dec 2015 18:41:52 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, liezhi.yang@windriver.com
Date: Tue,  1 Dec 2015 18:41:48 -0800
Message-Id: <1449024109-3476-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449024109-3476-1-git-send-email-sgw@linux.intel.com>
References: <1449024109-3476-1-git-send-email-sgw@linux.intel.com>
Cc: "Ng, Mei Yeen" <mei.yeen.ng@intel.com>
Subject: [PATCH 2/3] init-install-efi: fix script for eMMC installation
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
X-List-Received-Date: Wed, 02 Dec 2015 02:41:52 -0000

From: "Ng, Mei Yeen" <mei.yeen.ng@intel.com>

Running the install option from bootloader to install image to eMMC will fail
with error:
Formatting /dev/mmcblk01 to vfat...
mkfs.fat 3.0.28 (2015-05-16)
/dev/mmcblk01: No such file or directory

This issue impacts both grub and gummiboot install option to eMMC device.
The installation failure is due to the following:
[1] Unable to partition eMMC as the partition prefix 'p' is not appended
The condition checking failed with the additional /dev/ appended with
the target device name.
[2] The partition uuid for boot, root and swap partition is not captured
for eMMC

This fix updated the condition checking and changed the variables to
reference the boot, root and swap partitions for UUID.

[YOCTO #8710]
(From OE-Core rev: a7d081c3db776c8b0734942df6bf96f811f15bd3)

Signed-off-by: Ng, Mei Yeen <mei.yeen.ng@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index fc4908e..ac26bce 100644
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
2.5.0


