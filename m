Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3FBC56D445
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 15:43:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2013 07:43:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="437868372"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 19 Nov 2013 07:43:03 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 96F2B6A400F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 07:43:02 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2013 17:43:37 +0200
Message-Id: <b5be24c1f66a83836b0ca6b2fa19be350ea92664.1384874570.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1384874570.git.stefanx.stanacar@intel.com>
References: <cover.1384874570.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1384874570.git.stefanx.stanacar@intel.com>
References: <cover.1384874570.git.stefanx.stanacar@intel.com>
Subject: [RFC PATCH 4/4] scripts/lib/selftest: add more simple build tests
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
X-List-Received-Date: Tue, 19 Nov 2013 15:43:27 -0000

From: Alexandru Palalau <alexandrux.palalau@intel.com>

Tests for RM_OLD_IMAGE and for WARN_QA/ERROR_QA behaviour.

Signed-off-by: Alexandru Palalau <alexandrux.palalau@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 scripts/lib/selftest/tests/__init__.py  |  1 +
 scripts/lib/selftest/tests/bboptions.py | 39 +++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 scripts/lib/selftest/tests/bboptions.py

diff --git a/scripts/lib/selftest/tests/__init__.py b/scripts/lib/selftest/tests/__init__.py
index 3acc480..7826054 100644
--- a/scripts/lib/selftest/tests/__init__.py
+++ b/scripts/lib/selftest/tests/__init__.py
@@ -1 +1,2 @@
 from selftest.tests.bboutput import *
+from selftest.tests.bboptions import *
diff --git a/scripts/lib/selftest/tests/bboptions.py b/scripts/lib/selftest/tests/bboptions.py
new file mode 100644
index 0000000..ad35386
--- /dev/null
+++ b/scripts/lib/selftest/tests/bboptions.py
@@ -0,0 +1,39 @@
+import unittest
+import os
+import logging
+
+from selftest.base import oeSelfTest
+from selftest.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
+import selftest.utils.ftools as ftools
+
+class OptionsTests(oeSelfTest):
+
+    def test_options_warnqa_errorqa_switch(self):
+        bitbake("xcursor-transparent-theme -ccleansstate")
+
+        if "packages-list" not in get_bb_var("ERROR_QA"):
+            self.write_config("ERROR_QA_append = \" packages-list\"")
+
+        xcursor_path = os.path.join(get_test_layer(), "recipes-test/xcursor-transparent-theme/test_recipe.inc")
+        ftools.write_file(xcursor_path, 'PACKAGES += \"${PN}-dbg\"')
+
+        res = bitbake("xcursor-transparent-theme", ignore_status=True)
+        self.assertTrue("ERROR: QA Issue" in res.output)
+        self.assertEqual(res.status, 1)
+
+        self.append_config("ERROR_QA_remove = \"packages-list\"")
+        self.append_config("WARN_QA_append = \" packages-list\"")
+        bitbake("xcursor-transparent-theme")
+        bitbake("xcursor-transparent-theme -ccleansstate")
+        os.remove(xcursor_path)
+
+    def test_options_rm_old_image(self):
+        bitbake("core-image-minimal")
+
+        deploydir = get_bb_var("DEPLOY_DIR_IMAGE", target="core-image-minimal")
+        imagename = get_bb_var("IMAGE_LINK_NAME", target="core-image-minimal")
+        oldimgpath = os.path.realpath(os.path.join(deploydir, imagename + ".ext3"))
+
+        self.append_config("RM_OLD_IMAGE = \"1\"")
+        bitbake("core-image-minimal")
+        self.assertFalse(os.path.exists(oldimgpath), msg="Old image path still exists: %s" % oldimgpath)
-- 
1.8.3.1


