Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 755C271ADD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 19:58:23 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 11 Jan 2017 11:58:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="807758380"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Jan 2017 11:58:23 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2017 19:55:18 +0000
Message-Id: <aff775fa6d3760d628b28276840a306f906347a6.1484164023.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
References: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
References: <cover.1484164023.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH v2 1/7] image-live-artifacts: Add support for creating image artifacts only
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
X-List-Received-Date: Wed, 11 Jan 2017 19:58:23 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

Rather than create an actual image, just put the image artifacts in an
'artifacts' directory that can then be picked up by wic.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 meta/classes/image-live-artifacts.bbclass | 40 +++++++++++++++++++++++++++++++
 meta/classes/image.bbclass                |  3 +++
 meta/classes/image_types.bbclass          |  2 ++
 3 files changed, 45 insertions(+)
 create mode 100644 meta/classes/image-live-artifacts.bbclass

diff --git a/meta/classes/image-live-artifacts.bbclass b/meta/classes/image-live-artifacts.bbclass
new file mode 100644
index 0000000..1501a9b
--- /dev/null
+++ b/meta/classes/image-live-artifacts.bbclass
@@ -0,0 +1,40 @@
+# Create the artifacts only on an ARTIFACTS_DIR,
+# which can be later picked up by wic
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
index 04fd5f9..fd249c8 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -130,6 +130,9 @@ do_rootfs[vardeps] += "${@rootfs_variables(d)}"
 do_build[depends] += "virtual/kernel:do_deploy"
 
 def build_live(d):
+    if bb.utils.contains("IMAGE_FSTYPES", "live-artifacts-only", "live-artifacts-only", "0", d) == "live-artifacts-only":
+         return "image-live-artifacts"
+
     if bb.utils.contains("IMAGE_FSTYPES", "live", "live", "0", d) == "0": # live is not set but hob might set iso or hddimg
         d.setVar('NOISO', bb.utils.contains('IMAGE_FSTYPES', "iso", "0", "1", d))
         d.setVar('NOHDD', bb.utils.contains('IMAGE_FSTYPES', "hddimg", "0", "1", d))
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 8f04849..b9359b2 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -270,6 +270,8 @@ python () {
                 bb.build.addtask('do_write_wks_template', 'do_image_wic', None, d)
 }
 
+IMAGE_CMD_live-artifacts-only = " "
+
 EXTRA_IMAGECMD = ""
 
 inherit siteinfo
-- 
2.6.6


