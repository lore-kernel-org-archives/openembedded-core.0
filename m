Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D1B86FC3D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 10:45:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5GAjZu6003082
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 03:45:35 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 16 Jun 2014 03:45:34 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jun 2014 18:46:31 +0800
Message-ID: <23a3411d065b16b054a0339d4aab9839d87cd6f3.1402915083.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1402915083.git.Qi.Chen@windriver.com>
References: <cover.1402915083.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 9/9] init-install.sh: add support for installing initramfs onto the target
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
X-List-Received-Date: Mon, 16 Jun 2014 10:45:34 -0000
Content-Type: text/plain

Add support to install initramfs image or the kernel bundled with it
onto the target. And if there's an initramfs image available, we try
to use the 'root=UUID=xxx' in the grub entry so that the target can
always boot up even if the device names are changed, say, from /dev/hdb
to /dev/hda.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initrdscripts/files/init-install.sh            |   49 ++++++++++++++++----
 1 file changed, 40 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 0a1141a..748a9d8 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -151,25 +151,55 @@ mkdir /tgt_root
 mkdir /src_root
 mkdir -p /boot
 
-# Handling of the target root partition
+# mount target filesystems
+mount $bootfs /boot
 mount $rootfs /tgt_root
+
+# Check whether an initramfs is available and get uuid of filesystems
+has_initramfs=""
+uuid_rootfs=""
+uuid_bootfs=""
+uuid_swap=""
+if [ -e /run/media/$1/vmlinuz-initramfs -o -e /run/media/$1/initrd.img ]; then
+    has_initramfs="yes"
+    uuid_rootfs="`blkid $rootfs | cut -d' ' -f2 | sed -e 's/\"//g'`"
+    uuid_bootfs="`blkid $bootfs | cut -d' ' -f2 | sed -e 's/\"//g'`"
+    uuid_swap="`blkid $swap | cut -d' ' -f2 | sed -e 's/\"//g'`"
+fi
+
+# Handling of the target root partition
 mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /src_root
 echo "Copying rootfs files..."
 cp -a /src_root/* /tgt_root
+# Try to use uuid entries in /etc/fstab
+if [ "$has_initramfs" = "yes" ]; then
+    swap="$uuid_swap"
+    bootfs="$uuid_bootfs"
+fi
 if [ -d /tgt_root/etc/ ] ; then
     echo "$swap                swap             swap       defaults              0  0" >> /tgt_root/etc/fstab
     echo "$bootfs              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
-    # We dont want udev to mount our root device while we're booting...
-    if [ -d /tgt_root/etc/udev/ ] ; then
-	echo "/dev/${device}" >> /tgt_root/etc/udev/mount.blacklist
-    fi
 fi
-umount /tgt_root
 umount /src_root
 
 # Handling of the target boot partition
-mount $bootfs /boot
 echo "Preparing boot partition..."
+
+# If there's an initramfs available, try to use UUID in grub.cfg.
+# We assume the initramfs has the ability to deal with the UUID parameter.
+if [ -e /run/media/$1/vmlinuz-initramfs ]; then
+    cp /run/media/$1/vmlinuz-initramfs /boot/vmlinuz
+    rootfs="$uuid_rootfs"
+else
+    cp /run/media/$1/vmlinuz /boot/
+fi
+
+if [ -e /run/media/$1/initrd.img ]; then
+    cp /run/media/$1/initrd.img /boot/initrd.img
+    rootfs="$uuid_rootfs"
+    initrd_line="initrd /initrd.img"
+fi
+
 if [ -f /etc/grub.d/00_header ] ; then
     echo "Preparing custom grub2 menu..."
     GRUBCFG="/boot/grub/grub.cfg"
@@ -178,6 +208,7 @@ if [ -f /etc/grub.d/00_header ] ; then
 menuentry "Linux" {
     set root=(hd0,1)
     linux /vmlinuz root=$rootfs $rootwait rw $5 $3 $4 quiet
+    $initrd_line
 }
 _EOF
     chmod 0444 $GRUBCFG
@@ -195,8 +226,8 @@ if [ ! -f /boot/grub/grub.cfg ] ; then
     echo "kernel /vmlinuz root=$rootfs rw $3 $4 quiet" >> /boot/grub/menu.lst
 fi
 
-cp /run/media/$1/vmlinuz /boot/
-
+# umount target filesystems
+umount /tgt_root
 umount /boot
 
 sync
-- 
1.7.9.5


