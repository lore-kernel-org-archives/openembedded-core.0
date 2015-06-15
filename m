Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8907D7422B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 18:04:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 15 Jun 2015 11:04:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,620,1427785200"; d="scan'208";a="743839187"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2015 11:04:45 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 577D46A4083;
	Mon, 15 Jun 2015 11:04:08 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jun 2015 19:10:41 +0300
Message-Id: <1434384647-2901-5-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434384647-2901-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1434384647-2901-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [PATCH 04/10] init-install-efi: Implement UUID support
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

Using UUID in favor of device names is more reliable as
UUID names are persistent.

Device names can change as the order of adding device nodes
is arbitrary. This sometimes results in device names switching
on each boot, which can cause system fail to boot.
Persistent naming solves these issues.

Used partition UUID in kernel command line to specify root partition.
Used partition UUID in /etc/fstab to specify swap partition.
Used filesystem UUID in /etc/fstab to specify boot partition.

[YOCTO #6101]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 8dd2749..5fb4d4d 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -164,8 +164,10 @@ mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /src_root
 echo "Copying rootfs files..."
 cp -a /src_root/* /tgt_root
 if [ -d /tgt_root/etc/ ] ; then
-    echo "$swap                swap             swap       defaults              0  0" >> /tgt_root/etc/fstab
-    echo "$bootfs              /boot            vfat       defaults              1  2" >> /tgt_root/etc/fstab
+    boot_uuid=$(blkid -o value -s UUID /dev/${device}1)
+    swap_part_uuid=$(blkid -o value -s PARTUUID /dev/${device}3)
+    echo "/dev/disk/by-partuuid/$swap_part_uuid                swap             swap       defaults              0  0" >> /tgt_root/etc/fstab
+    echo "UUID=$boot_uuid              /boot            vfat       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
     if [ -d /tgt_root/etc/udev/ ] ; then
 	echo "/dev/${device}" >> /tgt_root/etc/udev/mount.blacklist
@@ -184,6 +186,7 @@ mkdir -p $EFIDIR
 cp /run/media/$1/EFI/BOOT/*.efi $EFIDIR
 
 if [ -f /run/media/$1/EFI/BOOT/grub.cfg ]; then
+    root_part_uuid=$(blkid -o value -s PARTUUID /dev/${device}2)
     GRUBCFG="$EFIDIR/grub.cfg"
     cp /run/media/$1/EFI/BOOT/grub.cfg $GRUBCFG
     # Update grub config for the installed image
@@ -196,7 +199,7 @@ if [ -f /run/media/$1/EFI/BOOT/grub.cfg ]; then
     # Delete any root= strings
     sed -i "s/ root=[^ ]*/ /" $GRUBCFG
     # Add the root= and other standard boot options
-    sed -i "s@linux /vmlinuz *@linux /vmlinuz root=$rootfs rw $rootwait quiet @" $GRUBCFG
+    sed -i "s@linux /vmlinuz *@linux /vmlinuz root=PARTUUID=$root_part_uuid rw $rootwait quiet @" $GRUBCFG
 fi
 
 if [ -d /run/media/$1/loader ]; then
@@ -212,7 +215,7 @@ if [ -d /run/media/$1/loader ]; then
     # delete any root= strings
     sed -i "s/ root=[^ ]*/ /" $GUMMIBOOT_CFGS
     # add the root= and other standard boot options
-    sed -i "s@options *@options root=$rootfs rw $rootwait quiet @" $GUMMIBOOT_CFGS
+    sed -i "s@options *@options root=PARTUUID=$rootuuid rw $rootwait quiet @" $GUMMIBOOT_CFGS
 fi
 
 umount /tgt_root
-- 
2.1.4


