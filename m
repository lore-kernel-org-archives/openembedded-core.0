Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E3EF7660F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 10:40:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4FAe6wV011109
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 03:40:07 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 15 May 2014 03:40:06 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 May 2014 18:40:25 +0800
Message-ID: <d5f4c990c54f1743562b9e565ac76562455cc32f.1400150280.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1400150280.git.Qi.Chen@windriver.com>
References: <cover.1400150280.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] initrdscripts: fix for /run/media
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
X-List-Received-Date: Thu, 15 May 2014 10:40:07 -0000
Content-Type: text/plain

mount.sh in udev-extraconf was modified to use /run/media instead
of /media. Unfortunately, our scripts in initrdscripts have some
dependency on the auto-mounting mechanism proviced by udev-extraconf.
So these scripts should also be fixed to use /run/media instead /media,
otherwise, our live image cannot work correctly.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../initrdscripts/files/init-install-efi-testfs.sh |   14 +++++++-------
 .../initrdscripts/files/init-install-efi.sh        |   14 +++++++-------
 .../initrdscripts/files/init-install-testfs.sh     |    4 ++--
 .../initrdscripts/files/init-install.sh            |    4 ++--
 meta/recipes-core/initrdscripts/files/init-live.sh |   18 +++++++++---------
 5 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
index 2fea761..7a0b4d4 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
@@ -128,7 +128,7 @@ mkdir /rootmnt
 mkdir /bootmnt
 
 mount $rootfs /ssd
-mount -o rw,loop,noatime,nodiratime /media/$1/$2 /rootmnt
+mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /rootmnt
 
 echo "Copying rootfs files..."
 cp -a /rootmnt/* /ssd
@@ -150,13 +150,13 @@ mount $bootfs /ssd
 
 EFIDIR="/ssd/EFI/BOOT"
 mkdir -p $EFIDIR
-cp /media/$1/vmlinuz /ssd
+cp /run/media/$1/vmlinuz /ssd
 # Copy the efi loader
-cp /media/$1/EFI/BOOT/*.efi $EFIDIR
+cp /run/media/$1/EFI/BOOT/*.efi $EFIDIR
 
-if [ -f /media/$1/EFI/BOOT/grub.cfg ]; then
+if [ -f /run/media/$1/EFI/BOOT/grub.cfg ]; then
     GRUBCFG="$EFIDIR/grub.cfg"
-    cp /media/$1/EFI/BOOT/grub.cfg $GRUBCFG
+    cp /run/media/$1/EFI/BOOT/grub.cfg $GRUBCFG
     # Update grub config for the installed image
     # Delete the install entry
     sed -i "/menuentry 'install'/,/^}/d" $GRUBCFG
@@ -170,10 +170,10 @@ if [ -f /media/$1/EFI/BOOT/grub.cfg ]; then
     sed -i "s@linux /vmlinuz *@linux /vmlinuz root=$rootfs rw $rootwait quiet @" $GRUBCFG
 fi
 
-if [ -d /media/$1/loader ]; then
+if [ -d /run/media/$1/loader ]; then
     GUMMIBOOT_CFGS="/ssd/loader/entries/*.conf"
     # copy config files for gummiboot
-    cp -dr /media/$1/loader /ssd
+    cp -dr /run/media/$1/loader /ssd
     # delete the install entry
     rm -f /ssd/loader/entries/install.conf
     # delete the initrd lines
diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index ed3221b..8bd7025 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -128,7 +128,7 @@ mkdir /rootmnt
 mkdir /bootmnt
 
 mount $rootfs /ssd
-mount -o rw,loop,noatime,nodiratime /media/$1/$2 /rootmnt
+mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /rootmnt
 
 echo "Copying rootfs files..."
 cp -a /rootmnt/* /ssd
@@ -150,13 +150,13 @@ mount $bootfs /ssd
 
 EFIDIR="/ssd/EFI/BOOT"
 mkdir -p $EFIDIR
-cp /media/$1/vmlinuz /ssd
+cp /run/media/$1/vmlinuz /ssd
 # Copy the efi loader
-cp /media/$1/EFI/BOOT/*.efi $EFIDIR
+cp /run/media/$1/EFI/BOOT/*.efi $EFIDIR
 
-if [ -f /media/$1/EFI/BOOT/grub.cfg ]; then
+if [ -f /run/media/$1/EFI/BOOT/grub.cfg ]; then
     GRUBCFG="$EFIDIR/grub.cfg"
-    cp /media/$1/EFI/BOOT/grub.cfg $GRUBCFG
+    cp /run/media/$1/EFI/BOOT/grub.cfg $GRUBCFG
     # Update grub config for the installed image
     # Delete the install entry
     sed -i "/menuentry 'install'/,/^}/d" $GRUBCFG
@@ -170,10 +170,10 @@ if [ -f /media/$1/EFI/BOOT/grub.cfg ]; then
     sed -i "s@linux /vmlinuz *@linux /vmlinuz root=$rootfs rw $rootwait quiet @" $GRUBCFG
 fi
 
-if [ -d /media/$1/loader ]; then
+if [ -d /run/media/$1/loader ]; then
     GUMMIBOOT_CFGS="/ssd/loader/entries/*.conf"
     # copy config files for gummiboot
-    cp -dr /media/$1/loader /ssd
+    cp -dr /run/media/$1/loader /ssd
     # delete the install entry
     rm -f /ssd/loader/entries/install.conf
     # delete the initrd lines
diff --git a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
index d2f2420..26e1fb3 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
@@ -151,7 +151,7 @@ mkdir -p /boot
 
 # Handling of the target root partition
 mount $rootfs /tgt_root
-mount -o rw,loop,noatime,nodiratime /media/$1/$2 /src_root
+mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /src_root
 echo "Copying rootfs files..."
 cp -a /src_root/* /tgt_root
 if [ -d /tgt_root/etc/ ] ; then
@@ -197,7 +197,7 @@ if [ ! -f /boot/grub/grub.cfg ] ; then
     echo "kernel /vmlinuz root=$rootfs rw $3 $4 quiet" >> /boot/grub/menu.lst
 fi
 
-cp /media/$1/vmlinuz /boot/
+cp /run/media/$1/vmlinuz /boot/
 
 umount /boot
 
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 8e433d5..b160003 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -151,7 +151,7 @@ mkdir -p /boot
 
 # Handling of the target root partition
 mount $rootfs /tgt_root
-mount -o rw,loop,noatime,nodiratime /media/$1/$2 /src_root
+mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /src_root
 echo "Copying rootfs files..."
 cp -a /src_root/* /tgt_root
 if [ -d /tgt_root/etc/ ] ; then
@@ -194,7 +194,7 @@ if [ ! -f /boot/grub/grub.cfg ] ; then
     echo "kernel /vmlinuz root=$rootfs rw $3 $4 quiet" >> /boot/grub/menu.lst
 fi
 
-cp /media/$1/vmlinuz /boot/
+cp /run/media/$1/vmlinuz /boot/
 
 umount /boot
 
diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 0bc38b7..0be9b6f 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -82,9 +82,9 @@ boot_live_root() {
 
     # Move the mount points of some filesystems over to
     # the corresponding directories under the real root filesystem.
-    for dir in `awk '/\/dev.* \/media/{print $2}' /proc/mounts`; do
-        mkdir -p  ${ROOT_MOUNT}/$dir
-        mount -n --move $dir ${ROOT_MOUNT}/$dir
+    for dir in `awk '/\/dev.* \/run\/media/{print $2}' /proc/mounts`; do
+        mkdir -p  ${ROOT_MOUNT}/media/${dir##*/}
+        mount -n --move $dir ${ROOT_MOUNT}/media/${dir##*/}
     done
     mount -n --move /proc ${ROOT_MOUNT}/proc
     mount -n --move /sys ${ROOT_MOUNT}/sys
@@ -113,11 +113,11 @@ echo "Waiting for removable media..."
 C=0
 while true
 do
-  for i in `ls /media 2>/dev/null`; do
-      if [ -f /media/$i/$ROOT_IMAGE ] ; then
+  for i in `ls /run/media 2>/dev/null`; do
+      if [ -f /run/media/$i/$ROOT_IMAGE ] ; then
 		found="yes"
 		break
-	  elif [ -f /media/$i/isolinux/$ROOT_IMAGE ]; then
+	  elif [ -f /run/media/$i/isolinux/$ROOT_IMAGE ]; then
 		found="yes"
 		ISOLINUX="isolinux"
 		break	
@@ -135,7 +135,7 @@ do
            mount | grep media
            echo "Available block devices"
            cat /proc/partitions
-           fatal "Cannot find $ROOT_IMAGE file in /media/* , dropping to a shell "
+           fatal "Cannot find $ROOT_IMAGE file in /run/media/* , dropping to a shell "
       fi
       C=$(( C + 1 ))
   fi
@@ -150,7 +150,7 @@ mount_and_boot() {
     mkdir $ROOT_MOUNT
     mknod /dev/loop0 b 7 0 2>/dev/null
 
-    if ! mount -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
+    if ! mount -o rw,loop,noatime,nodiratime /run/media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
 	fatal "Could not mount rootfs image"
     fi
 
@@ -211,7 +211,7 @@ case $label in
 	mount_and_boot
 	;;
     install|install-efi)
-	if [ -f /media/$i/$ISOLINUX/$ROOT_IMAGE ] ; then
+	if [ -f /run/media/$i/$ISOLINUX/$ROOT_IMAGE ] ; then
 	    ./$label.sh $i/$ISOLINUX $ROOT_IMAGE $video_mode $vga_mode $console_params
 	else
 	    fatal "Could not find $label script"
-- 
1.7.9.5


