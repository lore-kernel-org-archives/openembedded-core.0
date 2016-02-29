Return-Path: <costin.c.constantin@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9F2D077026
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 10:24:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 29 Feb 2016 02:24:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,520,1449561600"; d="scan'208";a="926083310"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 29 Feb 2016 02:24:36 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id BB0DB6A4002;
	Mon, 29 Feb 2016 03:12:23 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 12:38:02 +0200
Message-Id: <1456742282-11595-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH v2] oeqa/selftest/kernel.py: Add new file destined for kernel related tests
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
X-List-Received-Date: Mon, 29 Feb 2016 10:24:36 -0000

[YP#7202]:  Test for linux-dummy
The new kernel.py file is intended for kernel related test cases.
The test for linux-dummy will ensure it is in good shape and can
be used as a kernel replacement at build time. To do this, the
test will first clean sstate for linux-dummy target, ensuring no
file is present in the stamps directory. After, core-image-minimal
is built, ensuring linux-dummy can be used as a kernel substitute.

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/selftest/kernel.py | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/kernel.py

diff --git a/meta/lib/oeqa/selftest/kernel.py b/meta/lib/oeqa/selftest/kernel.py
new file mode 100644
index 0000000..3fe3517
--- /dev/null
+++ b/meta/lib/oeqa/selftest/kernel.py
@@ -0,0 +1,29 @@
+import os
+import oeqa.utils.ftools as ftools
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+from oeqa.utils.decorators import testcase
+
+class KernelTests(oeSelfTest):
+    def  test_dummy_kernel(self):
+        """
+        [YP#7202]
+        - test that linux-dummy target can be used as kernel provider for an image
+        - check no "multiple providers are available for" message is received while building the image
+        """
+        config_param = 'PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"'
+        self.append_config(config_param)
+        arch_dir = get_bb_var('MULTIMACH_TARGET_SYS', target='linux-dummy')
+        stamps_dir = os.path.join(os.getenv('BUILDDIR'), "tmp/stamps")
+        lnx_dmy_stamps_dir = os.path.join(stamps_dir, arch_dir, 'linux-dummy')
+        res = bitbake("linux-dummy -ccleansstate") # ensure we have nothing related to linux-dummy in stamps dir.
+        self.assertFalse(os.listdir(lnx_dmy_stamps_dir), msg='linux-dummy stamps dir. should have been cleaned. Something \
+                         happened with bitbake linux-dummy -ccleansstate')
+        res = bitbake("core-image-minimal")# testing linux-dummy is both buildable and usable within an image
+        self.remove_config(config_param)
+        self.assertEqual(res.status, 0, msg="core-image-minimal failed to build. Please check logs. ")
+        self.assertNotIn("multiple providers are available for", res.output, msg="'multiple providers are available for\
+                        linux-dummy' message received during buildtime.")
+        self.assertTrue(os.listdir(lnx_dmy_stamps_dir), msg="linux-dummy didn't build correctly. No stamp present in stamps \
+                        dir. %s" % lnx_dmy_stamps_dir)
+         
-- 
2.5.0


