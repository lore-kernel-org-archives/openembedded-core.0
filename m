Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 27C2B73CF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 18:04:47 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jun 2015 11:04:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,620,1427785200"; d="scan'208";a="588243821"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 15 Jun 2015 11:04:47 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 2FDDE6A4083;
	Mon, 15 Jun 2015 11:04:10 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jun 2015 19:10:43 +0300
Message-Id: <1434384647-2901-7-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434384647-2901-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1434384647-2901-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [PATCH 06/10] init-install: Implement UUID support
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
X-List-Received-Date: Mon, 15 Jun 2015 18:04:47 -0000

Used partition UUID in kernel command line to specify root partition.
Searched root device by file system uuid in GRUB configuration.
Used partition UUID in /etc/fstab to specify swap partition.
Used filesystem UUID in /etc/fstab to specify boot partition.

[YOCTO #6101]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 298ea8d..74ca0be 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -195,9 +195,11 @@ mount $rootfs /tgt_root
 mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /src_root
 echo "Copying rootfs files..."
 cp -a /src_root/* /tgt_root
-if [ -d /tgt_root/etc/ ] ; then
-    echo "$swap                swap             swap       defaults              0  0" >> /tgt_root/etc/fstab
-    echo "$bootfs              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
+if [ -d /tgt_root/etc/ -a $grub_version -ne 0 ] ; then
+    boot_uuid=$(blkid -o value -s UUID /dev/${device}2)
+    swap_part_uuid=$(blkid -o value -s PARTUUID /dev/${device}4)
+    echo "/dev/disk/by-partuuid/$swap_part_uuid                swap             swap       defaults              0  0" >> /tgt_root/etc/fstab
+    echo "UUID=$boot_uuid              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
     if [ -d /tgt_root/etc/udev/ ] ; then
 	echo "/dev/${device}" >> /tgt_root/etc/udev/mount.blacklist
@@ -209,22 +211,24 @@ umount /src_root
 # Handling of the target boot partition
 mount $bootfs /boot
 echo "Preparing boot partition..."
-if [ -f /etc/grub.d/00_header ] ; then
+if [ -f /etc/grub.d/00_header -a $grub_version -ne 0 ] ; then
     echo "Preparing custom grub2 menu..."
+    root_part_uuid=$(blkid -o value -s PARTUUID /dev/${device}3)
+    boot_uuid=$(blkid -o value -s UUID /dev/${device}2)
     GRUBCFG="/boot/grub/grub.cfg"
     mkdir -p $(dirname $GRUBCFG)
     cat >$GRUBCFG <<_EOF
 menuentry "Linux" {
-    set root=(hd0,2)
-    linux /vmlinuz root=$rootfs $rootwait rw $5 $3 $4 quiet
+    search --no-floppy --fs-uuid $boot_uuid --set root
+    linux /vmlinuz root=PARTUUID=$root_part_uuid rootwait rw $5 $3 $4 quiet
 }
 _EOF
     chmod 0444 $GRUBCFG
 fi
 grub-install /dev/${device}
-echo "(hd0) /dev/${device}" > /boot/grub/device.map
 
 if [ $grub_version -eq 0 ] ; then
+    echo "(hd0) /dev/${device}" > /boot/grub/device.map
     echo "Preparing custom grub menu..."
     echo "default 0" > /boot/grub/menu.lst
     echo "timeout 30" >> /boot/grub/menu.lst
-- 
2.1.4


