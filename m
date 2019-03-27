Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 315736BF3D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 11:06:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2RB6DML013010
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 04:06:23 -0700
Received: from localhost.localdomain.com (128.224.162.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 27 Mar 2019 04:06:03 -0700
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Mar 2019 19:05:50 +0800
Message-ID: <1553684750-15225-1-git-send-email-yongxin.liu@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] init-install-efi.sh: don't assume the fixed location of efi loader
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
X-List-Received-Date: Wed, 27 Mar 2019 11:06:33 -0000
Content-Type: text/plain

Currently, it is true that efi loader is in the same device as the
rootfs image. But the script doesn't work when efi loader and rootfs
image are in different live devices. This change makes the script work
in this situation.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 .../initrdscripts/files/init-install-efi.sh        | 29 ++++++++++++++++------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index b6855b5..922f97b 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -241,13 +241,28 @@ echo "Preparing boot partition..."
 
 EFIDIR="/boot/EFI/BOOT"
 mkdir -p $EFIDIR
-# Copy the efi loader
-cp /run/media/$1/EFI/BOOT/*.efi $EFIDIR
 
-if [ -f /run/media/$1/EFI/BOOT/grub.cfg ]; then
+src_boot=""
+
+for i in `ls /dev/${live_dev_name}*`; do
+    i=${i#\/dev/}
+    if [ -f /run/media/$i/EFI/BOOT/*.efi ]; then
+        # Copy the efi loader
+        cp /run/media/$i/EFI/BOOT/*.efi $EFIDIR
+        src_boot=$i
+        break
+    fi
+done
+
+if [ -z "$src_boot" ]; then
+echo "No EFI bootloader found. Installation aborted."
+exit 1
+fi
+
+if [ -f /run/media/$src_boot/EFI/BOOT/grub.cfg ]; then
     root_part_uuid=$(blkid -o value -s PARTUUID ${rootfs})
     GRUBCFG="$EFIDIR/grub.cfg"
-    cp /run/media/$1/EFI/BOOT/grub.cfg $GRUBCFG
+    cp /run/media/$src_boot/EFI/BOOT/grub.cfg $GRUBCFG
     # Update grub config for the installed image
     # Delete the install entry
     sed -i "/menuentry 'install'/,/^}/d" $GRUBCFG
@@ -260,11 +275,11 @@ if [ -f /run/media/$1/EFI/BOOT/grub.cfg ]; then
     sed -i "s/ root=[^ ]*/ root=PARTUUID=$root_part_uuid rw $rootwait quiet /g" $GRUBCFG
 fi
 
-if [ -d /run/media/$1/loader ]; then
+if [ -d /run/media/$src_boot/loader ]; then
     rootuuid=$(blkid -o value -s PARTUUID ${rootfs})
     SYSTEMDBOOT_CFGS="/boot/loader/entries/*.conf"
     # copy config files for systemd-boot
-    cp -dr /run/media/$1/loader /boot
+    cp -dr /run/media/$src_boot/loader /boot
     # delete the install entry
     rm -f /boot/loader/entries/install.conf
     # delete the initrd lines
@@ -282,7 +297,7 @@ umount /tgt_root
 # Copy kernel artifacts. To add more artifacts just add to types
 # For now just support kernel types already being used by something in OE-core
 for types in bzImage zImage vmlinux vmlinuz fitImage; do
-    for kernel in `find /run/media/$1/ -name $types*`; do
+    for kernel in `find /run/media/$src_boot/ -name $types*`; do
         cp $kernel /boot
     done
 done
-- 
1.8.3.1


