Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9465E71AB7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 08:27:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 May 2017 01:27:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,318,1491289200"; d="scan'208";a="85024608"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 10 May 2017 01:27:46 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id AA6606A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 01:27:31 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 11:05:09 +0300
Message-Id: <e9ba52cf152b09ce73200eeee272866cd2ad9ef2.1494402710.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1494402710.git.ed.bartosh@linux.intel.com>
References: <cover.1494402710.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/4] timage_types_wic: add do_populate_bootfs task
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
X-List-Received-Date: Wed, 10 May 2017 08:27:45 -0000

This task generates root partition UUID and calls efi_bootfs_populate
API of current EFI provider to populate bootfs directory with
EFI artifacts.

[YOCTO #10073]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types_wic.bbclass | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 4711c24..0ef587b 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -115,3 +115,39 @@ python do_rootfs_wicenv () {
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
+addtask do_populate_bootfs after do_image before do_image_wic
-- 
2.1.4


