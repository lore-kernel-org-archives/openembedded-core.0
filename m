Return-Path: <wei.tee.ng@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BFD4977CEC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 01:39:06 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 18:39:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,320,1496127600"; d="scan'208";a="989880852"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga003.jf.intel.com with ESMTP; 06 Jul 2017 18:39:08 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 11:28:35 -0700
Message-Id: <ee38977370db92520a2e0d81e76189be3661f787.1499294682.git.wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1499294682.git.wei.tee.ng@intel.com>
References: <cover.1499294682.git.wei.tee.ng@intel.com>
Cc: wei.tee.ng@intel.com, saul.wold@intel.com
Subject: [PATCH v3 2/2] initramfs-framwork: module to support boot live image
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
X-List-Received-Date: Fri, 07 Jul 2017 01:39:06 -0000

From: "Ng, Wei Tee" <wei.tee.ng@intel.com>

setup-live module is a new module being introduced to integrate the
functionality of init-live.sh into new scriptlet in order to
support the live boot image. The udev-extraconf rdepends is being
added to perform automounting. It gets to run before the rootfs
and finish module.

[YOCTO #11701]

Signed-off-by: Ng, Wei Tee <wei.tee.ng@intel.com>
---
This v3 changes included the creation of new initramfs-module-setup-live
and added the udev-extraconf rdepends on this module as live-boot
require it to work.

 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 67a1b04..aa1d847 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -13,7 +13,8 @@ SRC_URI = "file://init \
            file://mdev \
            file://udev \
            file://e2fs \
-           file://debug"
+           file://debug \
+	   file://setup-live"
 
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
+	    initramfs-module-setup-live"
 
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


