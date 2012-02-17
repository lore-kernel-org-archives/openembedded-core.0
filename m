Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RyLpN-00084B-BY
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 12:18:13 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Feb 2012 03:10:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="118595421"
Received: from dcui-desktop.sh.intel.com ([10.239.36.38])
	by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2012 03:09:59 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org, sgw@linux.intel.com,
	dvhart@linux.intel.com
Date: Fri, 17 Feb 2012 19:10:16 +0800
Message-Id: <a9afd4efa97461fdfc6f32b8641150dd2e09d597.1329470047.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1329470047.git.dexuan.cui@intel.com>
References: <cover.1329470047.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1329470047.git.dexuan.cui@intel.com>
References: <cover.1329470047.git.dexuan.cui@intel.com>
Subject: [PATCH 2/2] self-hosted-directdisk-image: create .hdddirect and .vmdk images
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
X-List-Received-Date: Fri, 17 Feb 2012 11:18:13 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/classes/boot-directdisk.bbclass               |    4 +++-
 meta/conf/machine/include/qemu.inc                 |    2 ++
 .../images/self-hosted-directdisk-image.bb         |   15 +++++++++++++++
 3 files changed, 20 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/images/self-hosted-directdisk-image.bb

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 8879ba8..d0daa82 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -38,7 +38,8 @@ BOOTDD_EXTRA_SPACE ?= "16384"
 
 AUTO_SYSLINUXCFG = "1"
 LABELS = "boot"
-APPEND = "root=/dev/sda2"
+SYSLINUX_ROOT ?= "root=/dev/sda2"
+APPEND_prepend = "${SYSLINUX_ROOT}"
 TIMEOUT = "10"
 SYSLINUXCFG  = "${HDDDIR}/syslinux.cfg"
 SYSLINUXMENU = "${HDDDIR}/menu"
@@ -50,6 +51,7 @@ build_boot_dd() {
 
 	install -d ${HDDDIR}
 	install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage ${HDDDIR}/vmlinuz
+	install -m 0644 ${S}/syslinux.cfg ${HDDDIR}/syslinux.cfg
 	install -m 444 ${STAGING_LIBDIR}/syslinux/ldlinux.sys ${HDDDIR}/ldlinux.sys
 
 	BLOCKS=`du -bks ${HDDDIR} | cut -f 1`
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 10ab76e..4897491 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -5,6 +5,8 @@ MACHINE_FEATURES = "apm alsa pcmcia bluetooth irda usbgadget screen"
 
 IMAGE_FSTYPES ?= "tar.bz2 ext3"
 
+SYSLINUX_ROOT = "root=/dev/hda2"
+
 ROOT_FLASH_SIZE = "280"
 
 # Don't include kernels in standard images
diff --git a/meta/recipes-core/images/self-hosted-directdisk-image.bb b/meta/recipes-core/images/self-hosted-directdisk-image.bb
new file mode 100644
index 0000000..32cba3f
--- /dev/null
+++ b/meta/recipes-core/images/self-hosted-directdisk-image.bb
@@ -0,0 +1,15 @@
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+ROOTFS = "${DEPLOY_DIR_IMAGE}/self-hosted-image-${MACHINE}.ext3"
+SYSLINUX_PROMPT = "0"
+inherit boot-directdisk
+
+do_bootdirectdisk[depends] += "qemu-native:do_populate_sysroot \
+                               self-hosted-image:do_rootfs"
+build_boot_dd_append () {
+	${STAGING_BINDIR_NATIVE}/qemu-img convert -O vmdk \
+		${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect \
+		${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk
+}
-- 
1.7.6



