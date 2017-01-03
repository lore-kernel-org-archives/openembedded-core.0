Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EF0E66FFFB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2017 22:33:28 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 03 Jan 2017 14:33:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,457,1477983600"; d="scan'208";a="209315225"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga004.fm.intel.com with ESMTP; 03 Jan 2017 14:33:28 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2017 22:30:37 +0000
Message-Id: <04107922d67fb222e89181e85f914884a34a4141.1482363237.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
References: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
References: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/6] image-live-artifacts: Add support for creating image artifacts only
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
X-List-Received-Date: Tue, 03 Jan 2017 22:33:29 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

Rather than create an actual image, just put the image artifacts in an
'artifacts' directory that can then be picked up by wic.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 meta/classes/image-live-artifacts.bbclass | 64 +++++++++++++++++++++++++++++++
 meta/classes/image.bbclass                |  4 ++
 2 files changed, 68 insertions(+)
 create mode 100644 meta/classes/image-live-artifacts.bbclass

diff --git a/meta/classes/image-live-artifacts.bbclass b/meta/classes/image-live-artifacts.bbclass
new file mode 100644
index 0000000..e056336
--- /dev/null
+++ b/meta/classes/image-live-artifacts.bbclass
@@ -0,0 +1,64 @@
+# Copyright (C) 2004, Advanced Micro Devices, Inc.  All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+# Creates a bootable image using syslinux, your kernel and an optional
+# initrd
+
+#
+# End result is two things:
+#
+# 1. A .hddimg file which is an msdos filesystem containing syslinux, a kernel,
+# an initrd and a rootfs image. These can be written to harddisks directly and
+# also booted on USB flash disks (write them there with dd).
+#
+# 2. A CD .iso image
+
+# Boot process is that the initrd will boot and process which label was selected
+# in syslinux. Actions based on the label are then performed (e.g. installing to
+# an hdd)
+
+# External variables (also used by syslinux.bbclass)
+# ${INITRD} - indicates a list of filesystem images to concatenate and use as an initrd (optional)
+# ${COMPRESSISO} - Transparent compress ISO, reduce size ~40% if set to 1
+# ${NOISO}  - skip building the ISO image if set to 1
+# ${NOHDD}  - skip building the HDD image if set to 1
+# ${HDDIMG_ID} - FAT image volume-id
+# ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
+
+inherit live-vm-common
+
+do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
+                        mtools-native:do_populate_sysroot \
+                        cdrtools-native:do_populate_sysroot \
+                        virtual/kernel:do_deploy \
+                        ${MLPREFIX}syslinux:do_populate_sysroot \
+                        syslinux-native:do_populate_sysroot \
+                        ${@oe.utils.ifelse(d.getVar('COMPRESSISO', False),'zisofs-tools-native:do_populate_sysroot','')} \
+                        "
+
+
+LABELS_LIVE ?= "boot install"
+
+ARTIFACTS_DIR = "${DEPLOY_DIR_IMAGE}/artifacts"
+
+populate_bootloader() {
+	populate_kernel ${ARTIFACTS_DIR}
+
+	if [ "${PCBIOS}" = "1" ]; then
+		syslinux_hddimg_populate ${ARTIFACTS_DIR}
+	fi
+	if [ "${EFI}" = "1" ]; then
+		efi_hddimg_populate ${ARTIFACTS_DIR}
+	fi
+}
+
+python do_bootimg() {
+    set_live_vm_vars(d, 'LIVE')
+    if d.getVar("PCBIOS", True) == "1":
+        bb.build.exec_func('build_syslinux_cfg', d)
+    if d.getVar("EFI", True) == "1":
+        bb.build.exec_func('build_efi_cfg', d)
+    bb.build.exec_func('populate_bootloader', d)
+}
+
+addtask bootimg before do_image_complete
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 04fd5f9..c3f5f2e 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -130,6 +130,10 @@ do_rootfs[vardeps] += "${@rootfs_variables(d)}"
 do_build[depends] += "virtual/kernel:do_deploy"
 
 def build_live(d):
+    artifacts_only = d.getVar("ARTIFACTS_ONLY", True)
+    if artifacts_only:
+         return "image-live-artifacts"
+
     if bb.utils.contains("IMAGE_FSTYPES", "live", "live", "0", d) == "0": # live is not set but hob might set iso or hddimg
         d.setVar('NOISO', bb.utils.contains('IMAGE_FSTYPES', "iso", "0", "1", d))
         d.setVar('NOHDD', bb.utils.contains('IMAGE_FSTYPES', "hddimg", "0", "1", d))
-- 
2.6.6


