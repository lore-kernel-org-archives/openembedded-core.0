Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 136EA71A88
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 16:10:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 16 Jan 2017 08:10:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,239,1477983600"; d="scan'208";a="1113461657"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jan 2017 08:10:07 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id DC0546A4006;
	Mon, 16 Jan 2017 08:09:11 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2017 17:46:33 +0200
Message-Id: <6841425d3bf125a5446c96097ec346eea5fa747e.1484581112.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484581112.git.ed.bartosh@linux.intel.com>
References: <cover.1484581112.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 04/14] image-wic.bbclas: add task do_efi_populate
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
X-List-Received-Date: Mon, 16 Jan 2017 16:10:07 -0000

Produce EFI artifacts by calling efi_populate function
provided by current EFI provider.

This should eliminate dependency of wic image-efi plugin
to hddimg. Instead of getting EFI artifacts from HDDDIR
it can get it from $WORKDIR/efi.

[YOCTO #10835]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image-wic.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/classes/image-wic.bbclass b/meta/classes/image-wic.bbclass
index bf94e2d..ba6d8ae 100644
--- a/meta/classes/image-wic.bbclass
+++ b/meta/classes/image-wic.bbclass
@@ -111,3 +111,23 @@ python do_rootfs_wicenv () {
 addtask do_rootfs_wicenv after do_image before do_image_wic
 do_rootfs_wicenv[vardeps] += "${WICVARS}"
 do_rootfs_wicenv[prefuncs] = 'set_image_size'
+
+# Populate EFI artifacts
+
+EFI_PROVIDER ?= "grub-efi"
+
+EFI_CLASS = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)}"
+inherit ${EFI_CLASS}
+
+python do_efi_populate() {
+    if d.getVar("EFI_CLASS"):
+        # set variables required for populating efi artifacts
+        for key, value in [('LABELS', "boot"), ('GRUB_CFG', "grub-wic.cfg")]:
+            if not d.getVar(key):
+                d.setVar(key, value)
+
+        bb.build.exec_func('build_efi_cfg', d)
+        bb.build.exec_func('efi_populate', d)
+}
+
+addtask do_efi_populate after do_rootfs before do_image
-- 
2.1.4


