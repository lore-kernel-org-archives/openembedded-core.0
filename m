Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SrpSK-0003Xb-KY
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 14:03:44 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Jul 2012 04:52:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="180428851"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2012 04:52:21 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 14:59:52 +0300
Message-Id: <1342699192-14294-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] Add console kernel options
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
X-List-Received-Date: Thu, 19 Jul 2012 12:03:44 -0000

Live image installer did not preserve BSP specified console= kernel parameter.
This patch updates the init scripts that are responsible for grub.cfg creation
so that options like console= are passed allong from installer to installed img

[YOCTO #2426]

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/recipes-bsp/grub/grub-1.99/40_custom          |    2 +-
 .../initrdscripts/files/init-install.sh            |    1 +
 meta/recipes-core/initrdscripts/files/init-live.sh |    8 +++++++-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-1.99/40_custom b/meta/recipes-bsp/grub/grub-1.99/40_custom
index 0d80854..ba48830 100755
--- a/meta/recipes-bsp/grub/grub-1.99/40_custom
+++ b/meta/recipes-bsp/grub/grub-1.99/40_custom
@@ -5,5 +5,5 @@ exec tail -n +3 $0
 # the 'exec tail' line above.
 menuentry "Linux" {
     set root=(hd0,1)
-    linux /boot/vmlinuz root=__ROOTFS__ rw __VIDEO_MODE__ __VGA_MODE__ quiet
+    linux /boot/vmlinuz root=__ROOTFS__ rw __CONSOLE__ __VIDEO_MODE__ __VGA_MODE__ quiet
 }
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 0ac4949..c1f8cba 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -156,6 +156,7 @@ if [ -f /ssd/etc/grub.d/40_custom ] ; then
     sed -i "s@__ROOTFS__@$rootfs $rootwait@g" /ssd/etc/grub.d/40_custom
     sed -i "s/__VIDEO_MODE__/$3/g" /ssd/etc/grub.d/40_custom
     sed -i "s/__VGA_MODE__/$4/g" /ssd/etc/grub.d/40_custom
+    sed -i "s/__CONSOLE__/$5/g" /ssd/etc/grub.d/40_custom
     mount $bootfs /bootmnt
     cp /ssd/etc/grub.d/40_custom /bootmnt/40_custom
     umount /bootmnt
diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 737dae4..d5e241a 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -38,6 +38,12 @@ read_args() {
                 video_mode=$arg ;;
             vga=*)
                 vga_mode=$arg ;;
+            console=*)
+                if [ -z "${console_params}" ]; then
+                    console_params=$arg
+                else
+                    console_params="$console_params $arg"
+                fi
         esac
     done
 }
@@ -112,7 +118,7 @@ case $label in
 	;;
     install)
 	if [ -f /media/$i/$ISOLINUX/$ROOT_IMAGE ] ; then
-	    ./install.sh $i/$ISOLINUX $ROOT_IMAGE $video_mode $vga_mode
+	    ./install.sh $i/$ISOLINUX $ROOT_IMAGE $video_mode $vga_mode $console_params
 	else
 	    fatal "Could not find install script"
 	fi
-- 
1.7.9.5



