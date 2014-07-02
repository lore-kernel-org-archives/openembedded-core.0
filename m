Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4FDA965DB1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 22:09:36 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1X2Sif-0004F5-Tx from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Jul 2014 15:09:37 -0700
Received: from SVR-ORW-FEM-06.mgc.mentorg.com ([147.34.97.120]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 2 Jul 2014 15:09:37 -0700
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	SVR-ORW-FEM-06.mgc.mentorg.com (147.34.97.120) with Microsoft SMTP
	Server id 14.2.247.3; Wed, 2 Jul 2014 15:09:37 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Jul 2014 18:09:29 -0400
Message-ID: <1404338969-30935-2-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1404338969-30935-1-git-send-email-drew_moseley@mentor.com>
References: <1404338969-30935-1-git-send-email-drew_moseley@mentor.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 02 Jul 2014 22:09:37.0498 (UTC)
	FILETIME=[503963A0:01CF9642]
Subject: [PATCH 2/2] init-install-efi.sh: fix to handle the boot partition correctly
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
X-List-Received-Date: Wed, 02 Jul 2014 22:09:36 -0000
Content-Type: text/plain

(This patch was originally done against init-install.sh in
OE-Core rev aa67b1333b4774e1845f562085f7048df65a644f)

Previously, the boot partition was created for the target hard drive
but there was no corresponding entry for it in /etc/fstab. Besides,
even if the boot partition was mounted, it would just result in odd
directory hierarchy like /boot/boot/grub. However, what we really need
is /boot/grub. This patch fixes this problem.

Besides, for future maintance work, this patch also renames some of the
intermediate directories. It uses more descriptive names like /tgt_root
and /src_root. The name of /ssd is dropped.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 .../initrdscripts/files/init-install-efi.sh        | 47 ++++++++++++----------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index da3e33c..fcf21cd 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -144,34 +144,32 @@ mkfs.ext3 $rootfs
 echo "Formatting swap partition...($swap)"
 mkswap $swap
 
-mkdir /ssd
-mkdir /rootmnt
-mkdir /bootmnt
-
-mount $rootfs /ssd
-mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /rootmnt
+mkdir /tgt_root
+mkdir /src_root
+mkdir -p /boot
 
+# Handling of the target root partition
+mount $rootfs /tgt_root
+mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /src_root
 echo "Copying rootfs files..."
-cp -a /rootmnt/* /ssd
-
-if [ -d /ssd/etc/ ] ; then
-    echo "$swap                swap             swap       defaults              0  0" >> /ssd/etc/fstab
-
+cp -a /src_root/* /tgt_root
+if [ -d /tgt_root/etc/ ] ; then
+    echo "$swap                swap             swap       defaults              0  0" >> /tgt_root/etc/fstab
+    echo "$bootfs              /boot            vfat       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
-    if [ -d /ssd/etc/udev/ ] ; then
-        echo "/dev/${device}" >> /ssd/etc/udev/mount.blacklist
+    if [ -d /tgt_root/etc/udev/ ] ; then
+	echo "/dev/${device}" >> /tgt_root/etc/udev/mount.blacklist
     fi
 fi
 
-umount /ssd
-umount /rootmnt
+umount /src_root
 
+# Handling of the target boot partition
+mount $bootfs /boot
 echo "Preparing boot partition..."
-mount $bootfs /ssd
 
-EFIDIR="/ssd/EFI/BOOT"
+EFIDIR="/boot/EFI/BOOT"
 mkdir -p $EFIDIR
-cp /run/media/$1/vmlinuz /ssd
 # Copy the efi loader
 cp /run/media/$1/EFI/BOOT/*.efi $EFIDIR
 
@@ -192,11 +190,11 @@ if [ -f /run/media/$1/EFI/BOOT/grub.cfg ]; then
 fi
 
 if [ -d /run/media/$1/loader ]; then
-    GUMMIBOOT_CFGS="/ssd/loader/entries/*.conf"
+    GUMMIBOOT_CFGS="/tgt_root/loader/entries/*.conf"
     # copy config files for gummiboot
-    cp -dr /run/media/$1/loader /ssd
+    cp -dr /run/media/$1/loader /tgt_root
     # delete the install entry
-    rm -f /ssd/loader/entries/install.conf
+    rm -f /tgt_root/loader/entries/install.conf
     # delete the initrd lines
     sed -i "/initrd /d" $GUMMIBOOT_CFGS
     # delete any LABEL= strings
@@ -207,7 +205,12 @@ if [ -d /run/media/$1/loader ]; then
     sed -i "s@options *@options root=$rootfs rw $rootwait quiet @" $GUMMIBOOT_CFGS
 fi
 
-umount /ssd
+umount /tgt_root
+
+cp /run/media/$1/vmlinuz /boot
+
+umount /boot
+
 sync
 
 echo "Remove your installation media, and press ENTER"
-- 
1.9.1


