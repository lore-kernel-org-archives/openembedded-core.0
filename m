Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7FF6AC3C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 09:56:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tB89uqkp010322
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Dec 2015 01:56:53 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 8 Dec 2015 01:56:52 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Dec 2015 01:56:38 -0800
Message-ID: <1be316beb5c2b1e32f11ab8ec5dee68f64defb2d.1449568553.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1449568553.git.liezhi.yang@windriver.com>
References: <cover.1449568553.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/15] init-install-efi: fix script for eMMC installation
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
X-List-Received-Date: Tue, 08 Dec 2015 09:56:52 -0000
Content-Type: text/plain

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
(master rev: a7d081c3db776c8b0734942df6bf96f811f15bd3)

Signed-off-by: Ng, Mei Yeen <mei.yeen.ng@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../initrdscripts/files/init-install-efi.sh        |    8 ++++----
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
1.7.9.5


