Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1U8aCD-00053w-DZ
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 18:44:42 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Feb 2013 09:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,710,1355126400"; d="scan'208";a="265780386"
Received: from unknown (HELO localhost) ([10.255.12.193])
	by orsmga001.jf.intel.com with ESMTP; 21 Feb 2013 09:28:19 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2013 09:28:02 -0800
Message-Id: <3b7c2a23848052209b6fd4606093ca830ebf7a6c.1361467682.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Cc: richard.purdie@intel.com, Darren Hart <dvhart@linux.intel.com>,
	alexandru.c.georgescu@intel.com
Subject: [PATCH] install: Look for grub2 files on the initramfs, not rootfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Feb 2013 17:44:43 -0000

Fixes [YOCTO #3870] atom-pc - cannot boot image on netbook after install

The problem here is that grub2 is installed but a grub 1 menu.lst is
created at install time. At boot, grub2 doesn't find a grub.cfg file and
drops to the grub shell.

This happens because the installer is looking for 40_custom (a grub2
file) on the rootfs, but grub2 isn't installed on the rootfs. It exists
in the initramfs. Patching the installer to look on the initramfs
resolves the problem.

Note that the problem may have occurred if grub2 used to be installed on
the rootfs but was later removed. In any case, the installer is HORRIBLE
and really needs to be completely redesigned as part of the deployment
effort. For now, this should get the live image installer limping along
again.

Tested on a Toshiba NB-305.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: alexandru.c.georgescu@intel.com
Cc: sgw@linux.intel.com
Cc: ross.burton@intel.com
Cc: richard.purdie@intel.com
---
 .../initrdscripts/files/init-install.sh            | 25 +++++++++++-----------
 .../initrdscripts/initramfs-live-install_1.0.bb    |  2 +-
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index c1f8cba..2c4486a 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -151,14 +151,19 @@ if [ -d /ssd/etc/ ] ; then
     fi
 fi
 
-if [ -f /ssd/etc/grub.d/40_custom ] ; then
+if [ -f /etc/grub.d/40_custom ] ; then
     echo "Preparing custom grub2 menu..."
-    sed -i "s@__ROOTFS__@$rootfs $rootwait@g" /ssd/etc/grub.d/40_custom
-    sed -i "s/__VIDEO_MODE__/$3/g" /ssd/etc/grub.d/40_custom
-    sed -i "s/__VGA_MODE__/$4/g" /ssd/etc/grub.d/40_custom
-    sed -i "s/__CONSOLE__/$5/g" /ssd/etc/grub.d/40_custom
+    GRUBCFG="/bootmnt/boot/grub/grub.cfg"
     mount $bootfs /bootmnt
-    cp /ssd/etc/grub.d/40_custom /bootmnt/40_custom
+    mkdir -p $(dirname $GRUBCFG)
+    cp /etc/grub.d/40_custom $GRUBCFG
+    sed -i "s@__ROOTFS__@$rootfs $rootwait@g" $GRUBCFG
+    sed -i "s/__VIDEO_MODE__/$3/g" $GRUBCFG
+    sed -i "s/__VGA_MODE__/$4/g" $GRUBCFG
+    sed -i "s/__CONSOLE__/$5/g" $GRUBCFG
+    sed -i "/#/d" $GRUBCFG
+    sed -i "/exec tail/d" $GRUBCFG
+    chmod 0444 $GRUBCFG
     umount /bootmnt
 fi
 
@@ -171,12 +176,8 @@ grub-install --root-directory=/ssd /dev/${device}
 
 echo "(hd0) /dev/${device}" > /ssd/boot/grub/device.map
 
-if [ -f /ssd/40_custom ] ; then
-    mv /ssd/40_custom /ssd/boot/grub/grub.cfg
-    sed -i "/#/d" /ssd/boot/grub/grub.cfg
-    sed -i "/exec tail/d" /ssd/boot/grub/grub.cfg
-    chmod 0444 /ssd/boot/grub/grub.cfg
-else
+# If grub.cfg doesn't exist, assume GRUB 0.97 and create a menu.lst
+if [ ! -f /ssd/boot/grub/grub.cfg ] ; then
     echo "Preparing custom grub menu..."
     echo "default 0" > /ssd/boot/grub/menu.lst
     echo "timeout 30" >> /ssd/boot/grub/menu.lst
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index ac73ef8..0f80f0e 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SRC_URI = "file://init-install.sh"
 
-PR = "r7"
+PR = "r8"
 
 RDEPENDS_${PN} = "grub parted e2fsprogs-mke2fs"
 
-- 
1.8.1.2



