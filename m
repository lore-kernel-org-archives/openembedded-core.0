Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4635572A78
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 15:52:46 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1Y9brj-0000Mp-A0 from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Jan 2015 07:52:47 -0800
Received: from key-largo.world.mentorg.com (147.34.91.1) by
	svr-orw-fem-05.mgc.mentorg.com (147.34.97.43) with Microsoft SMTP
	Server id 14.3.224.2; Fri, 9 Jan 2015 07:52:47 -0800
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Jan 2015 10:52:44 -0500
Message-ID: <1420818765-28571-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] init-install.sh: Switch to using static device paths.
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
X-List-Received-Date: Fri, 09 Jan 2015 15:52:54 -0000
Content-Type: text/plain

Use static device paths for mounting from /dev/disk/<blah> in
case the device ordering changes.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta/recipes-core/initrdscripts/files/init-install.sh | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index fb537ee..f924418 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -156,6 +156,12 @@ mkfs.ext3 $rootfs
 echo "Formatting swap partition...($swap)"
 mkswap $swap
 
+# Determine the static device paths
+sync; udevadm settle
+bootfs_static="$(udevadm info --query=property --name=$bootfs | grep DEVLINKS= | cut -d= -f2 | cut -d\  -f1)"
+swap_static="$(udevadm info --query=property --name=$swap | grep DEVLINKS= | cut -d= -f2 | cut -d\  -f1)"
+rootfs_uuid="$(udevadm info --query=property --name=$rootfs | grep ID_PART_ENTRY_UUID | cut -d= -f2)"
+
 mkdir /tgt_root
 mkdir /src_root
 mkdir -p /boot
@@ -166,8 +172,8 @@ mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /src_root
 echo "Copying rootfs files..."
 cp -a /src_root/* /tgt_root
 if [ -d /tgt_root/etc/ ] ; then
-    echo "$swap                swap             swap       defaults              0  0" >> /tgt_root/etc/fstab
-    echo "$bootfs              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
+    echo "$swap_static                swap             swap       defaults              0  0" >> /tgt_root/etc/fstab
+    echo "$bootfs_static              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
     if [ -d /tgt_root/etc/udev/ ] ; then
 	echo "/dev/${device}" >> /tgt_root/etc/udev/mount.blacklist
@@ -186,7 +192,7 @@ if [ -f /etc/grub.d/00_header ] ; then
     cat >$GRUBCFG <<_EOF
 menuentry "Linux" {
     set root=(hd0,1)
-    linux /vmlinuz root=$rootfs $rootwait rw $5 $3 $4 quiet
+    linux /vmlinuz root=PARTUUID=$rootfs_uuid $rootwait rw $5 $3 $4 quiet
 }
 _EOF
     chmod 0444 $GRUBCFG
@@ -201,7 +207,7 @@ if [ ! -f /boot/grub/grub.cfg ] ; then
     echo "timeout 30" >> /boot/grub/menu.lst
     echo "title Live Boot/Install-Image" >> /boot/grub/menu.lst
     echo "root  (hd0,0)" >> /boot/grub/menu.lst
-    echo "kernel /vmlinuz root=$rootfs rw $3 $4 quiet" >> /boot/grub/menu.lst
+    echo "kernel /vmlinuz root=PARTUUID=$rootfs_uuid rw $3 $4 quiet" >> /boot/grub/menu.lst
 fi
 
 cp /run/media/$1/vmlinuz /boot/
-- 
1.9.1


