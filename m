Return-Path: <Liwei.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A4F107CE79
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 03:21:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2L3LM7n007287
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 20:21:22 -0700 (PDT)
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 20 Mar 2019 20:21:19 -0700
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Mar 2019 23:19:14 -0400
Message-ID: <1553138356-85237-7-git-send-email-liwei.song@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553138356-85237-1-git-send-email-liwei.song@windriver.com>
References: <1553138356-85237-1-git-send-email-liwei.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] init-install: add support for install image to Intel VROC raid disk
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
X-List-Received-Date: Thu, 21 Mar 2019 03:21:20 -0000
Content-Type: text/plain

Intel VROC raid device named as /dev/mdXX, now it only can boot with
initramfs method because it need mdadm to do initial work in it, so do
not remove initrd for such kind device.

It also use "p" as partition prefix, adjust it to aviod use a wrong device name
durning install.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 .../initrdscripts/files/init-install-efi.sh        | 23 ++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index b6855b5aac0f..c23132ae632d 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -44,9 +44,10 @@ echo "Searching for hard drives ..."
 
 # Some eMMC devices have special sub devices such as mmcblk0boot0 etc
 # we're currently only interested in the root device so pick them wisely
-devices=`ls /sys/block/ | grep -v mmcblk` || true
+devices=`ls /sys/block/ | grep -v "mmcblk\|md\|dm"` || true
 mmc_devices=`ls /sys/block/ | grep "mmcblk[0-9]\{1,\}$"` || true
-devices="$devices $mmc_devices"
+md_devices=`cat /proc/mdstat  |grep -w active |awk -F":" '{print $1}'` || true
+devices="$devices $mmc_devices $md_devices"
 
 for device in $devices; do
     case $device in
@@ -165,6 +166,14 @@ if [ ! "${device#/dev/mmcblk}" = "${device}" ] || \
     rootwait="rootwait"
 fi
 
+# MD raid device use partition prefix charater 'p'
+# and it need a larger capacity to store initrd,
+# considering some debug purpose, enlarge it to 1G.
+if [ ! "${device#/dev/md}" = "${device}" ]; then
+    part_prefix="p"
+    boot_size=1024
+fi
+
 # USB devices also require rootwait
 if [ -n `readlink /dev/disk/by-id/usb* | grep $TARGET_DEVICE_NAME` ]; then
     rootwait="rootwait"
@@ -251,8 +260,14 @@ if [ -f /run/media/$1/EFI/BOOT/grub.cfg ]; then
     # Update grub config for the installed image
     # Delete the install entry
     sed -i "/menuentry 'install'/,/^}/d" $GRUBCFG
-    # Delete the initrd lines
-    sed -i "/initrd /d" $GRUBCFG
+    # initrd is necessary to boot from MD device
+    if [ ! "${device#/dev/md}" = "${device}" ]; then
+       cp /run/media/$1/initrd /boot
+       cp /run/media/$1/startup.nsh /boot
+    else
+       # Delete the initrd lines
+       sed -i "/initrd /d" $GRUBCFG
+    fi
     # Delete any LABEL= strings
     sed -i "s/ LABEL=[^ ]*/ /" $GRUBCFG
     # Replace root= and add additional standard boot options
-- 
2.7.4


