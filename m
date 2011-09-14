Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1R3uWv-0000MY-C2
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 20:49:54 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Sep 2011 11:44:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,382,1312182000"; d="scan'208";a="53335858"
Received: from unknown (HELO [10.255.14.200]) ([10.255.14.200])
	by fmsmga002.fm.intel.com with ESMTP; 14 Sep 2011 11:44:40 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Sep 2011 13:44:32 -0500
Message-ID: <1316025872.26879.2585.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: [PATCH 2/2] initramfs-live-install: add support for grub2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2011 18:49:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

grub2 needs a different set of install steps from grub 0.97.  This
adds them to init-install.sh and adds an install-time check that
determines which version is being used and which steps to use
depending on the version of grub selected.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 .../initrdscripts/files/init-install.sh            |   31 ++++++++++++++++----
 .../initrdscripts/initramfs-live-install_1.0.bb    |    8 ++---
 2 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 5e6b81c..fb6cea8 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -1,6 +1,6 @@
 #!/bin/sh -e
 #
-# Copyright (C) 2008 Intel
+# Copyright (C) 2008-2011 Intel
 #
 # install.sh [device_name] [rootfs_name] [video_mode] [vga_mode]
 #
@@ -126,6 +126,7 @@ mkswap $swap
 
 mkdir /ssd
 mkdir /rootmnt
+mkdir /bootmnt
 
 mount $rootfs /ssd
 mount -o rw,loop,noatime,nodiratime /media/$1/$2 /rootmnt
@@ -142,6 +143,16 @@ if [ -d /ssd/etc/ ] ; then
     fi
 fi
 
+if [ -f /ssd/etc/grub.d/40_custom ] ; then
+    echo "Preparing custom grub2 menu..."
+    sed -i "s@__ROOTFS__@$rootfs@g" /ssd/etc/grub.d/40_custom
+    sed -i "s/__VIDEO_MODE__/$3/g" /ssd/etc/grub.d/40_custom
+    sed -i "s/__VGA_MODE__/$4/g" /ssd/etc/grub.d/40_custom
+    mount $bootfs /bootmnt
+    cp /ssd/etc/grub.d/40_custom /bootmnt/40_custom
+    umount /bootmnt
+fi
+
 umount /ssd
 umount /rootmnt
 
@@ -151,11 +162,19 @@ grub-install --root-directory=/ssd /dev/${device}
 
 echo "(hd0) /dev/${device}" > /ssd/boot/grub/device.map
 
-echo "default 0" > /ssd/boot/grub/menu.lst
-echo "timeout 30" >> /ssd/boot/grub/menu.lst
-echo "title Live Boot/Install-Image" >> /ssd/boot/grub/menu.lst
-echo "root  (hd0,0)" >> /ssd/boot/grub/menu.lst
-echo "kernel /boot/vmlinuz root=$rootfs rw $3 $4 quiet" >> /ssd/boot/grub/menu.lst
+if [ -f /ssd/40_custom ] ; then
+    mv /ssd/40_custom /ssd/boot/grub/grub.cfg
+    sed -i "/#/d" /ssd/boot/grub/grub.cfg
+    sed -i "/exec tail/d" /ssd/boot/grub/grub.cfg
+    chmod 0444 /ssd/boot/grub/grub.cfg
+else
+    echo "Preparing custom grub menu..."
+    echo "default 0" > /ssd/boot/grub/menu.lst
+    echo "timeout 30" >> /ssd/boot/grub/menu.lst
+    echo "title Live Boot/Install-Image" >> /ssd/boot/grub/menu.lst
+    echo "root  (hd0,0)" >> /ssd/boot/grub/menu.lst
+    echo "kernel /boot/vmlinuz root=$rootfs rw $3 $4 quiet" >> /ssd/boot/grub/menu.lst
+fi
 
 cp /media/$1/vmlinuz /ssd/boot/
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index 0eeabf1..619b16c 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -1,9 +1,9 @@
-DESCRIPTION = "A live image init script"
+DESCRIPTION = "A live image init script for grub"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SRC_URI = "file://init-install.sh"
 
-PR = "r4"
+PR = "r5"
 
 RDEPENDS="grub parted e2fsprogs-mke2fs"
 
@@ -19,6 +19,4 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 FILES_${PN} = " /install.sh "
 
-# Alternatives to grub need adding for other arch support
-# consistent with grub 0.97
-COMPATIBLE_HOST = "i.86.*-linux"
+COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
-- 
1.7.0.4





