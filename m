Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C2FA172F28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 12:12:02 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 15 May 2017 05:12:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,344,1491289200"; d="scan'208";a="87547487"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 15 May 2017 05:12:04 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 33A166A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 05:11:48 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 14:48:59 +0300
Message-Id: <56774b8e4b56816482642cbbbc49421b11b34979.1494846385.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1494846385.git.ed.bartosh@linux.intel.com>
References: <cover.1494846385.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v3 2/5] image_types_wic: add do_populate_bootfs task
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
X-List-Received-Date: Mon, 15 May 2017 12:12:02 -0000

This task generates root partition UUID and calls efi_bootfs_populate
API of current EFI provider to populate bootfs directory with
EFI artifacts.

[YOCTO #10073]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types_wic.bbclass | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 4711c24..4f5e4ea 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -115,3 +115,40 @@ python do_rootfs_wicenv () {
 addtask do_rootfs_wicenv after do_image before do_image_wic
 do_rootfs_wicenv[vardeps] += "${WICVARS}"
 do_rootfs_wicenv[prefuncs] = 'set_image_size'
+
+# Set variables for efi_bootfs_populate
+GRUB_CFG ?= "${WORKDIR}/grub_wic.cfg"
+SYSTEMD_BOOT_CFG ?= "${WORKDIR}/loader_wic.conf"
+GRUB_GFXSERIAL ?= "1"
+LABELS_WIC ?= "boot install"
+LABELS ?= "${LABELS_WIC}"
+
+EFI_PROVIDER ?= "grub-efi"
+EFI_CLASS = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)}"
+inherit ${EFI_CLASS}
+
+python do_populate_bootfs() {
+    def populate_bootfs(partuuid):
+        # remove bootfs dir as it may have files from previous build
+        bootfs = os.path.join(d.getVar("WORKDIR"), 'bootfs')
+        if os.path.exists(bootfs):
+            import shutil
+            shutil.rmtree(bootfs)
+
+        d.setVar("APPEND", "root=PARTUUID=%s" % partuuid)
+        bb.build.exec_func('build_efi_cfg', d)
+
+        bb.build.exec_func('efi_bootfs_populate', d)
+
+    if d.getVar('USING_WIC'):
+        # Generate parition UUID
+        from uuid import uuid4
+        partuuid = str(uuid4())
+        d.setVar("ROOTFS_PARTUUID", partuuid)
+
+        if d.getVar("EFI_CLASS"):
+            populate_bootfs(partuuid)
+}
+
+addtask do_populate_bootfs before do_image_wic
+do_populate_bootfs[depends] = "${MLPREFIX}${EFI_PROVIDER}:do_deploy virtual/kernel:do_deploy"
-- 
2.1.4


