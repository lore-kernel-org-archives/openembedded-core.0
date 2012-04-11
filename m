Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHmaT-0002rH-Bv
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 03:43:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 Apr 2012 18:33:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129434390"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by azsmga001.ch.intel.com with ESMTP; 10 Apr 2012 18:33:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 18:33:43 -0700
Message-Id: <5db901b79e5dde24e04a4c6237c377d8a9fdac22.1334107957.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334107957.git.sgw@linux.intel.com>
References: <cover.1334107957.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334107957.git.sgw@linux.intel.com>
References: <cover.1334107957.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (for RC3) 2/5] initrdscripts: fix init-live.sh and use unionfs
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
X-List-Received-Date: Wed, 11 Apr 2012 01:43:09 -0000

From: Yang Shi <yang.shi@windriver.com>

[YOCTO #1487]

When booting up with liveCD image, init scripts can't work well on read-only filesystem. Unionfs,
which is supported in Yocto kernel, allows a filesystem to appear as writeable, but without
actually allowing writes to change the filesystem.

Use unionfs to mount rootfs and make root file system can be writen when using liveCD to boot up.
Set UNION_FS variable depending on kernel config, so that it can work with kernel which doesn't
have unionfs feature.

Signed-off-by: Yang Shi <yang.shi@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |   23 ++++++++++++++++---
 .../initrdscripts/initramfs-live-boot_1.0.bb       |    9 +++++++-
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index eb5ab5b..737dae4 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -7,6 +7,7 @@ ROOT_IMAGE="rootfs.img"
 MOUNT="/bin/mount"
 UMOUNT="/bin/umount"
 ISOLINUX=""
+UNIONFS="no"
 
 early_setup() {
     mkdir /proc
@@ -89,17 +90,31 @@ case $label in
 	mkdir $ROOT_MOUNT
 	mknod /dev/loop0 b 7 0 2>/dev/null
 
-	if ! $MOUNT -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
-	    fatal "Couldnt mount rootfs image"
+	
+	if [ "$UNIONFS" = "yes" ]; then
+	    mkdir /rootfs-tmp
+
+	    if ! $MOUNT -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE /rootfs-tmp ; then
+		fatal "Could not mount rootfs image"
+	    else
+		mkdir /cow
+		mount -t tmpfs -o rw,noatime,mode=755 tmpfs /cow
+		mount -t unionfs -o dirs=/cow:/rootfs-tmp=ro unionfs $ROOT_MOUNT
+		boot_live_root
+	    fi
 	else
-	    boot_live_root
+	    if ! $MOUNT -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
+		fatal "Could not mount rootfs image"
+	    else
+		boot_live_root
+	    fi
 	fi
 	;;
     install)
 	if [ -f /media/$i/$ISOLINUX/$ROOT_IMAGE ] ; then
 	    ./install.sh $i/$ISOLINUX $ROOT_IMAGE $video_mode $vga_mode
 	else
-	    fatal "Couldnt find install script"
+	    fatal "Could not find install script"
 	fi
 
 	# If we're getting here, we failed...
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index e85a0e1..f7f0c9d 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -2,10 +2,17 @@ DESCRIPTION = "A live image init script"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 RDEPENDS = "udev"
+DEPENDS = "virtual/kernel"
 SRC_URI = "file://init-live.sh"
 
-PR = "r7"
+PR = "r8"
 
+do_compile() {
+	if grep -q "CONFIG_UNION_FS=y" ${STAGING_KERNEL_DIR}/.config; then
+		sed -i 's/UNIONFS="no"/UNIONFS="yes"/g' ${WORKDIR}/init-live.sh
+	fi
+}
+ 
 do_install() {
         install -m 0755 ${WORKDIR}/init-live.sh ${D}/init
 }
-- 
1.7.7.6



