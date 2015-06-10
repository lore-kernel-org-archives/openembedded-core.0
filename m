Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2949F609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 17:01:36 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 10 Jun 2015 10:01:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,588,1427785200"; d="scan'208";a="585496267"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 10 Jun 2015 10:01:29 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id A28C76A4005;
	Wed, 10 Jun 2015 10:00:53 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jun 2015 18:07:45 +0300
Message-Id: <1433948865-3729-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] init-install-efi: Implement UUID support
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
X-List-Received-Date: Wed, 10 Jun 2015 17:01:37 -0000

Using UUID in favor of device names is more reliable as
UUID names are persistent.

Device names can change as the order of adding device nodes
is arbitrary. This sometimes results in device names switching
on each boot, which can cause system fail to boot.
Persistent naming solves these issues.

Used partition UUID in kernel command line to specify root partition.
Used partition UUID in /etc/fstab to specify boot and swap partitions.

[YOCTO #6101]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 .../recipes-core/initrdscripts/files/init-install-efi.sh | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 8dd2749..d03d087 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -158,14 +158,22 @@ mkdir /tgt_root
 mkdir /src_root
 mkdir -p /boot
 
+# Get partition UUIDs
+get_partuuid() {
+    sgdisk -i$2 /dev/$1 | sed -n 's/Partition unique GUID: \(.*\)/\1/p'
+}
+bootuuid=$(get_partuuid $device 1)
+rootuuid=$(get_partuuid $device 2)
+swapuuid=$(get_partuuid $device 3)
+
 # Handling of the target root partition
 mount $rootfs /tgt_root
 mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /src_root
 echo "Copying rootfs files..."
 cp -a /src_root/* /tgt_root
 if [ -d /tgt_root/etc/ ] ; then
-    echo "$swap                swap             swap       defaults              0  0" >> /tgt_root/etc/fstab
-    echo "$bootfs              /boot            vfat       defaults              1  2" >> /tgt_root/etc/fstab
+    echo "PARTUUID=$swapuuid                swap             swap       defaults              0  0" >> /tgt_root/etc/fstab
+    echo "PARTUUID=$bootuuid              /boot            vfat       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
     if [ -d /tgt_root/etc/udev/ ] ; then
 	echo "/dev/${device}" >> /tgt_root/etc/udev/mount.blacklist
@@ -196,7 +204,7 @@ if [ -f /run/media/$1/EFI/BOOT/grub.cfg ]; then
     # Delete any root= strings
     sed -i "s/ root=[^ ]*/ /" $GRUBCFG
     # Add the root= and other standard boot options
-    sed -i "s@linux /vmlinuz *@linux /vmlinuz root=$rootfs rw $rootwait quiet @" $GRUBCFG
+    sed -i "s@linux /vmlinuz *@linux /vmlinuz root=PARTUUID=$rootuuid rw $rootwait quiet @" $GRUBCFG
 fi
 
 if [ -d /run/media/$1/loader ]; then
@@ -212,7 +220,7 @@ if [ -d /run/media/$1/loader ]; then
     # delete any root= strings
     sed -i "s/ root=[^ ]*/ /" $GUMMIBOOT_CFGS
     # add the root= and other standard boot options
-    sed -i "s@options *@options root=$rootfs rw $rootwait quiet @" $GUMMIBOOT_CFGS
+    sed -i "s@options *@options root=PARTUUID=$rootuuid rw $rootwait quiet @" $GUMMIBOOT_CFGS
 fi
 
 umount /tgt_root
-- 
2.1.4


