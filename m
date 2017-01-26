Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AF38F731A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 13:04:19 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jan 2017 05:04:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,289,1477983600"; d="scan'208";a="52621229"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 26 Jan 2017 05:04:20 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id AF66A6A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 05:03:22 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 14:40:32 +0200
Message-Id: <cd0ba303c874ecf570f187510e30e86fb3bcc1a3.1485434085.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485434085.git.ed.bartosh@linux.intel.com>
References: <cover.1485434085.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 04/14] image-wic.bbclas: add task do_efi_populate
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
X-List-Received-Date: Thu, 26 Jan 2017 13:04:20 -0000

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
index 2acfd65..41b406d 100644
--- a/meta/classes/image-wic.bbclass
+++ b/meta/classes/image-wic.bbclass
@@ -118,3 +118,23 @@ python do_rootfs_wicenv () {
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


