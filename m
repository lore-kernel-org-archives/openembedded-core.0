Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 464B56B79C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 09:38:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7G9cDcL015666
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 02:38:13 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 16 Aug 2013 02:38:11 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Aug 2013 17:38:10 +0800
Message-ID: <e5931f59a5d57055c423ba151eadb959e462e7b9.1376630883.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1376630883.git.Qi.Chen@windriver.com>
References: <cover.1376630883.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 2/2] init-install.sh: fix to handle the boot partition correctly
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
X-List-Received-Date: Fri, 16 Aug 2013 09:38:11 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Previously, the boot partition was created for the target hard drive
but there was no corresponding entry for it in /etc/fstab. Besides,
even if the boot partition was mounted, it would just result in odd
directory hierarchy like /boot/boot/grub. However, what we really need
is /boot/grub. This patch fixes this problem.

Besides, for future maintance work, this patch also renames some of the
intermediate directories. It uses more descriptive names like /tgt_root
and /src_root. The name of /ssd is dropped.

[YOCTO #5018]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/grub/grub-2.00/40_custom          |    2 +-
 .../initrdscripts/files/init-install.sh            |   62 +++++++++-----------
 2 files changed, 30 insertions(+), 34 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-2.00/40_custom b/meta/recipes-bsp/grub/grub-2.00/40_custom
index ba48830..f891b02 100755
--- a/meta/recipes-bsp/grub/grub-2.00/40_custom
+++ b/meta/recipes-bsp/grub/grub-2.00/40_custom
@@ -5,5 +5,5 @@ exec tail -n +3 $0
 # the 'exec tail' line above.
 menuentry "Linux" {
     set root=(hd0,1)
-    linux /boot/vmlinuz root=__ROOTFS__ rw __CONSOLE__ __VIDEO_MODE__ __VGA_MODE__ quiet
+    linux /vmlinuz root=__ROOTFS__ rw __CONSOLE__ __VIDEO_MODE__ __VGA_MODE__ quiet
 }
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index c892075..8e433d5 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -145,29 +145,32 @@ mkfs.ext3 $rootfs
 echo "Formatting swap partition...($swap)"
 mkswap $swap
 
-mkdir /ssd
-mkdir /rootmnt
-mkdir /bootmnt
-
-mount $rootfs /ssd
-mount -o rw,loop,noatime,nodiratime /media/$1/$2 /rootmnt
+mkdir /tgt_root
+mkdir /src_root
+mkdir -p /boot
 
+# Handling of the target root partition
+mount $rootfs /tgt_root
+mount -o rw,loop,noatime,nodiratime /media/$1/$2 /src_root
 echo "Copying rootfs files..."
-cp -a /rootmnt/* /ssd
-
-if [ -d /ssd/etc/ ] ; then
-    echo "$swap                swap             swap       defaults              0  0" >> /ssd/etc/fstab
-
+cp -a /src_root/* /tgt_root
+if [ -d /tgt_root/etc/ ] ; then
+    echo "$swap                swap             swap       defaults              0  0" >> /tgt_root/etc/fstab
+    echo "$bootfs              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
-    if [ -d /ssd/etc/udev/ ] ; then
-	echo "/dev/${device}" >> /ssd/etc/udev/mount.blacklist
+    if [ -d /tgt_root/etc/udev/ ] ; then
+	echo "/dev/${device}" >> /tgt_root/etc/udev/mount.blacklist
     fi
 fi
+umount /tgt_root
+umount /src_root
 
+# Handling of the target boot partition
+mount $bootfs /boot
+echo "Preparing boot partition..."
 if [ -f /etc/grub.d/40_custom ] ; then
     echo "Preparing custom grub2 menu..."
-    GRUBCFG="/bootmnt/boot/grub/grub.cfg"
-    mount $bootfs /bootmnt
+    GRUBCFG="/boot/grub/grub.cfg"
     mkdir -p $(dirname $GRUBCFG)
     cp /etc/grub.d/40_custom $GRUBCFG
     sed -i "s@__ROOTFS__@$rootfs $rootwait@g" $GRUBCFG
@@ -177,31 +180,24 @@ if [ -f /etc/grub.d/40_custom ] ; then
     sed -i "/#/d" $GRUBCFG
     sed -i "/exec tail/d" $GRUBCFG
     chmod 0444 $GRUBCFG
-    umount /bootmnt
 fi
-
-umount /ssd
-umount /rootmnt
-
-echo "Preparing boot partition..."
-mount $bootfs /ssd
-grub-install --root-directory=/ssd /dev/${device}
-
-echo "(hd0) /dev/${device}" > /ssd/boot/grub/device.map
+grub-install /dev/${device}
+echo "(hd0) /dev/${device}" > /boot/grub/device.map
 
 # If grub.cfg doesn't exist, assume GRUB 0.97 and create a menu.lst
-if [ ! -f /ssd/boot/grub/grub.cfg ] ; then
+if [ ! -f /boot/grub/grub.cfg ] ; then
     echo "Preparing custom grub menu..."
-    echo "default 0" > /ssd/boot/grub/menu.lst
-    echo "timeout 30" >> /ssd/boot/grub/menu.lst
-    echo "title Live Boot/Install-Image" >> /ssd/boot/grub/menu.lst
-    echo "root  (hd0,0)" >> /ssd/boot/grub/menu.lst
-    echo "kernel /boot/vmlinuz root=$rootfs rw $3 $4 quiet" >> /ssd/boot/grub/menu.lst
+    echo "default 0" > /boot/grub/menu.lst
+    echo "timeout 30" >> /boot/grub/menu.lst
+    echo "title Live Boot/Install-Image" >> /boot/grub/menu.lst
+    echo "root  (hd0,0)" >> /boot/grub/menu.lst
+    echo "kernel /vmlinuz root=$rootfs rw $3 $4 quiet" >> /boot/grub/menu.lst
 fi
 
-cp /media/$1/vmlinuz /ssd/boot/
+cp /media/$1/vmlinuz /boot/
+
+umount /boot
 
-umount /ssd
 sync
 
 echo "Remove your installation media, and press ENTER"
-- 
1.7.9.5


