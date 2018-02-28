Return-Path: <california.l.sullivan@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E8861788E2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 03:09:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2018 19:09:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,403,1515484800"; d="scan'208";a="21325771"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga008.jf.intel.com with ESMTP; 27 Feb 2018 19:09:26 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 19:09:18 -0800
Message-Id: <20180228030918.35934-19-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228030918.35934-1-california.l.sullivan@intel.com>
References: <20180228030918.35934-1-california.l.sullivan@intel.com>
Subject: [PATCH v2 18/18] selftests: Add test case for booting a generic EFI boot partition image
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
X-List-Received-Date: Wed, 28 Feb 2018 03:09:27 -0000

Simple test case that adds 'efi' to MACHINE_FEATURES, sets WKS_FILE to
"efi-bootdisk.wks.in", installed required boot items, and attempts to
boot the wic image.

Quick check to make sure that the feature actually works.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/lib/oeqa/selftest/cases/efibootpartition.py | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/efibootpartition.py

diff --git a/meta/lib/oeqa/selftest/cases/efibootpartition.py b/meta/lib/oeqa/selftest/cases/efibootpartition.py
new file mode 100644
index 00000000000..0c832566965
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/efibootpartition.py
@@ -0,0 +1,45 @@
+# Based on runqemu.py test file
+#
+# Copyright (c) 2017 Wind River Systems, Inc.
+#
+
+import re
+
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, runqemu, get_bb_var
+
+class GenericEFITest(OESelftestTestCase):
+    """EFI booting test class"""
+
+    buffer = True
+    cmd_common = "runqemu nographic serial wic ovmf"
+    efi_provider = "systemd-boot"
+    image = "core-image-minimal"
+    machine = "qemux86-64"
+    recipes_built = False
+
+    @classmethod
+    def setUpLocal(self):
+        super(GenericEFITest, self).setUpLocal(self)
+
+        self.write_config(self,
+"""
+EFI_PROVIDER = "%s"
+IMAGE_FSTYPES_pn-%s_append = " wic"
+MACHINE = "%s"
+MACHINE_FEATURES_append = " efi"
+WKS_FILE = "efi-bootdisk.wks.in"
+IMAGE_INSTALL_append = " grub-efi systemd-boot kernel-image-bzimage"
+"""
+% (self.efi_provider, self.image, self.machine))
+        if not self.recipes_built:
+            bitbake("ovmf")
+            bitbake(self.image)
+            self.recipes_built = True
+
+    @classmethod
+    def test_boot_efi(self):
+        """Test generic boot partition with qemu"""
+        cmd = "%s %s" % (self.cmd_common, self.machine)
+        with runqemu(self.image, ssh=False, launch_cmd=cmd) as qemu:
+            self.assertTrue(qemu.runner.logged, "Failed: %s" % cmd)
-- 
2.14.3


