Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id DD42078711
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 17:09:30 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2017 09:09:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,436,1505804400"; d="scan'208";a="179379538"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga006.fm.intel.com with ESMTP; 22 Nov 2017 09:09:31 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2017 09:09:30 -0800
Message-Id: <20171122170930.1861-1-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH] initramfs-live-boot-tiny: Create the initramfs-live-boot-tiny recipe
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
X-List-Received-Date: Wed, 22 Nov 2017 17:09:31 -0000

The original initramfs-live-boot recipe RDEPENDS on udev, which is ok since
the init script relies some of its functionality on udevadm and such,
but on core-image-tiny-initramfs the init script simply drops to shell
after a basic setup, so udev is not needed.

This patch splits up an initramfs-live-boot-tiny recipe which does not
use udev, but uses busybox-mdev instead, eudev installed about 600
extra Kilobytes to core-image-tiny-initramfs userspace, by avoiding to
install eudev we achieve an even smaller footprint (almost 40% smaller).

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../images/core-image-tiny-initramfs.bb             |  2 +-
 .../initrdscripts/initramfs-live-boot-tiny_1.0.bb   | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb

diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/recipes-core/images/core-image-tiny-initramfs.bb
index 16995e6580a..51d08a0cd1c 100644
--- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
+++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
@@ -5,7 +5,7 @@ first 'init' program more efficiently. core-image-tiny-initramfs doesn't \
 actually generate an image but rather generates boot and rootfs artifacts \
 that can subsequently be picked up by external image generation tools such as wic."
 
-PACKAGE_INSTALL = "initramfs-live-boot packagegroup-core-boot dropbear ${VIRTUAL-RUNTIME_base-utils} udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
+PACKAGE_INSTALL = "initramfs-live-boot-tiny packagegroup-core-boot dropbear ${VIRTUAL-RUNTIME_base-utils} ${VIRTUAL-RUNTIME_dev_manager} base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
 
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb
new file mode 100644
index 00000000000..7a9a8ecae26
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot-tiny_1.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Live image init script"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+DEPENDS = "virtual/kernel"
+RDEPENDS_${PN} = "busybox-mdev"
+SRC_URI = "file://init-live.sh"
+
+PR = "r12"
+
+S = "${WORKDIR}"
+
+do_install() {
+        install -m 0755 ${WORKDIR}/init-live.sh ${D}/init
+        install -d ${D}/dev
+        mknod -m 622 ${D}/dev/console c 5 1
+}
+
+FILES_${PN} += " /init /dev "
+
+# Due to kernel dependency
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.12.3


