Return-Path: <wei.tee.ng@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8964365CC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 04:57:45 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2017 21:57:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,347,1496127600"; d="scan'208";a="991937279"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga003.jf.intel.com with ESMTP; 11 Jul 2017 21:57:46 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 14:47:16 -0700
Message-Id: <3812c79859a0b5c4ed5d0af2116bab65d6cd0706.1499801966.git.wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1499801966.git.wei.tee.ng@intel.com>
References: <cover.1499801966.git.wei.tee.ng@intel.com>
Cc: wei.tee.ng@intel.com, saul.wold@intel.com
Subject: [PATCH 1/1] initramfs-framwork: module to support boot live image
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
X-List-Received-Date: Wed, 12 Jul 2017 04:57:45 -0000

From: "Ng, Wei Tee" <wei.tee.ng@intel.com>

setup-live module is a new module being introduced to integrate the
functionality of init-live.sh into new scriptlet named setup-live in
order to support the live boot image. The udev-extraconf rdepends is
being added to perform automounting. It gets to run before the rootfs
and finish module.

The setup-live scriplet include the changes for:

- Create a conditional loop for the bootparam_root variable. If it is
not set, then it will boot from ROOT_IMAGE. Else, it will boot normally
which is not from removable media.

- Gives a standard path to the original boot disk mount which can be
used to. While /media/sda is a good guess, it isn't always right, nor
is it a good assumption that only one boot disk is in the system.

- The current rootfs module has no support for rootfs images, currently
it only support for rootfs partitions for wic image. Therefore, there
is a need to assign the rootfs image for live image.

[YOCTO #11701]

Signed-off-by: Ng, Wei Tee <wei.tee.ng@intel.com>
---
This v5 is to re-correct the bad indents in recipe file.

 .../initrdscripts/initramfs-framework/setup-live   | 66 ++++++++++++++++++++++
 .../initrdscripts/initramfs-framework_1.0.bb       | 13 ++++-
 2 files changed, 77 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/setup-live

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/setup-live b/meta/recipes-core/initrdscripts/initramfs-framework/setup-live
new file mode 100644
index 0000000..ec4a139
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/setup-live
@@ -0,0 +1,66 @@
+#/bin/sh
+# Copyright (C) 2011 O.S. Systems Software LTDA.
+# Licensed on MIT
+
+setup_enabled() {
+	return 0
+}
+
+setup_run() {
+ROOT_IMAGE="rootfs.img"
+ISOLINUX=""
+ROOT_DISK=""
+shelltimeout=30
+
+	if [ -z $bootparam_root ]; then
+		echo "Waiting for removable media..."
+		C=0
+		while true
+		do
+		  for i in `ls /run/media 2>/dev/null`; do
+		      if [ -f /run/media/$i/$ROOT_IMAGE ] ; then
+				found="yes"
+				ROOT_DISK="$i"
+				break
+			  elif [ -f /run/media/$i/isolinux/$ROOT_IMAGE ]; then
+				found="yes"
+				ISOLINUX="isolinux"
+				ROOT_DISK="$i"
+				break
+		      fi
+		  done
+		  if [ "$found" = "yes" ]; then
+		      break;
+		  fi
+		  # don't wait for more than $shelltimeout seconds, if it's set
+		  if [ -n "$shelltimeout" ]; then
+		      echo -n " " $(( $shelltimeout - $C ))
+		      if [ $C -ge $shelltimeout ]; then
+		           echo "..."
+			   echo "Mounted filesystems"
+		           mount | grep media
+		           echo "Available block devices"
+		           cat /proc/partitions
+		           fatal "Cannot find $ROOT_IMAGE file in /run/media/* , dropping to a shell "
+		      fi
+		      C=$(( C + 1 ))
+		  fi
+		  sleep 1
+		done
+		# The existing rootfs module has no support for rootfs images. Assign the rootfs image.
+		bootparam_root="/run/media/$ROOT_DISK/$ISOLINUX/$ROOT_IMAGE"
+	else
+		break
+	fi
+
+	if [ "$bootparam_LABEL" != "boot" -a -f /init.d/$bootparam_LABEL.sh ] ; then
+		if [ -f /run/media/$i/$ISOLINUX/$ROOT_IMAGE ] ; then
+		    ./init.d/$bootparam_LABEL.sh $i/$ISOLINUX $ROOT_IMAGE $video_mode $vga_mode $console_params
+		else
+		    fatal "Could not find $bootparam_LABEL script"
+		fi
+
+		# If we're getting here, we failed...
+		fatal "Target $bootparam_LABEL failed"
+	fi
+}
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 67a1b04..211e89d 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -13,7 +13,8 @@ SRC_URI = "file://init \
            file://mdev \
            file://udev \
            file://e2fs \
-           file://debug"
+           file://debug \
+           file://setup-live"
 
 S = "${WORKDIR}"
 
@@ -25,6 +26,9 @@ do_install() {
     install -m 0755 ${WORKDIR}/rootfs ${D}/init.d/90-rootfs
     install -m 0755 ${WORKDIR}/finish ${D}/init.d/99-finish
 
+    # setup-live
+    install -m 0755 ${WORKDIR}/setup-live ${D}/init.d/80-setup-live
+
     # mdev
     install -m 0755 ${WORKDIR}/mdev ${D}/init.d/01-mdev
 
@@ -48,7 +52,8 @@ PACKAGES = "${PN}-base \
             initramfs-module-udev \
             initramfs-module-e2fs \
             initramfs-module-rootfs \
-            initramfs-module-debug"
+            initramfs-module-debug \
+            initramfs-module-setup-live"
 
 FILES_${PN}-base = "/init /init.d/99-finish /dev"
 
@@ -68,6 +73,10 @@ SUMMARY_initramfs-module-udev = "initramfs support for udev"
 RDEPENDS_initramfs-module-udev = "${PN}-base udev"
 FILES_initramfs-module-udev = "/init.d/01-udev"
 
+SUMMARY_initramfs-module-setup-live = "initramfs support for setup live"
+RDEPENDS_initramfs-module-setup-live = "${PN}-base udev-extraconf"
+FILES_initramfs-module-setup-live = "/init.d/80-setup-live"
+
 SUMMARY_initramfs-module-e2fs = "initramfs support for ext4/ext3/ext2 filesystems"
 RDEPENDS_initramfs-module-e2fs = "${PN}-base"
 FILES_initramfs-module-e2fs = "/init.d/10-e2fs"
-- 
2.7.4


