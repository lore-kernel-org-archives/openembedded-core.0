Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 0BAE3783C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 04:31:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2018 20:31:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,395,1511856000"; d="scan'208";a="197458494"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga005.fm.intel.com with ESMTP; 21 Jan 2018 20:31:43 -0800
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Jan 2018 12:26:22 +0800
Message-Id: <1516595182-50325-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] oeqa/sdkext: wic: add new test cases for eSDK
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
X-List-Received-Date: Mon, 22 Jan 2018 04:31:44 -0000

wic is now available in the eSDK. Adding test cases to test
wic utility within eSDK.

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta/lib/oeqa/sdkext/cases/wic.py | 171 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 171 insertions(+)
 create mode 100644 meta/lib/oeqa/sdkext/cases/wic.py

diff --git a/meta/lib/oeqa/sdkext/cases/wic.py b/meta/lib/oeqa/sdkext/cases/wic.py
new file mode 100644
index 0000000..221a290
--- /dev/null
+++ b/meta/lib/oeqa/sdkext/cases/wic.py
@@ -0,0 +1,171 @@
+import os
+import sys
+import shutil
+import unittest
+
+from glob import glob
+
+from oeqa.sdkext.case import OESDKExtTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.utils.commands import runCmd
+
+
+class WicTest(OESDKExtTestCase):
+    """Wic test within eSDK."""
+
+    testdir = "/var/tmp/wic.test.sdkext/"
+    outfile = "/var/tmp/wic.test.sdkext/output.txt"
+
+    @OETestID(1963)
+    def test_wic_location(self):
+        """Check whether wic is run within eSDK sysroot"""
+        output = self._run("which wic")
+        self.assertEqual(output.startswith(self.tc.sdk_dir), True, \
+            msg="Seems that wic isn't the eSDK one : %s" % output)
+
+    def _exec_wic_cmd(self, cmd):
+        """Wrapper to execute wic command and check status"""
+        status = runCmd("cd %s; . %s; %s" % (self.tc.sdk_dir, self.tc.sdk_env, cmd)).status
+        self.assertEqual(0, status)
+
+    def _exec_devtool_build(self):
+        """Wrapper to build image as pre-requisite for wic"""
+        cmd = "devtool build-image"
+        runCmd("cd %s; . %s; %s" % (self.tc.sdk_dir, self.tc.sdk_env, cmd))
+
+    def _get_img_type(self):
+        """Wrapper to get SDK target for image creation"""
+        # Get sdk_targets from devtool.conf
+        conf_file = self.tc.sdk_dir + "conf/devtool.conf"
+        with open (conf_file, 'r') as in_file:
+             for line in in_file:
+                if 'sdk_targets' in line:
+                    image = line.split()
+                    for img_name in image:
+                        if img_name.startswith('core-image'):
+                            break
+        return img_name
+
+    def _get_line_count(self):
+        count = 0
+        with open (self.outfile, 'r') as output:
+            count = sum(1 for line in output if line.rstrip('\n'))
+        return count
+
+    @OETestID(1964)
+    @OETestDepends(['test_wic_location'])
+    def test_wic_version(self):
+        cmd = "wic --version"
+        self._exec_wic_cmd(cmd)
+
+    @OETestID(1965)
+    @OETestDepends(['test_wic_location'])
+    def test_wic_help(self):
+        cmd = "wic --help"
+        self._exec_wic_cmd(cmd)
+        cmd = "wic -h"
+        self._exec_wic_cmd(cmd)
+
+    @OETestID(1966)
+    @OETestDepends(['test_wic_location'])
+    def test_wic_create_help(self):
+        cmd = "wic create --help"
+        self._exec_wic_cmd(cmd)
+
+    @OETestID(1967)
+    @OETestDepends(['test_wic_location'])
+    def test_wic_list_help(self):
+        cmd = "wic list --help"
+        self._exec_wic_cmd(cmd)
+
+    @OETestID(1968)
+    @OETestDepends(['test_wic_location'])
+    def test_wic_help_create(self):
+        cmd = "wic help create"
+        self._exec_wic_cmd(cmd)
+
+    @OETestID(1969)
+    @OETestDepends(['test_wic_location'])
+    def test_wic_help_list(self):
+        cmd = "wic help list"
+        self._exec_wic_cmd(cmd)
+
+    @OETestID(1970)
+    @OETestDepends(['test_wic_location'])
+    def test_wic_help_overview(self):
+        cmd = "wic help overview"
+        self._exec_wic_cmd(cmd)
+
+    @OETestID(1971)
+    @OETestDepends(['test_wic_location'])
+    def test_wic_help_plugins(self):
+        cmd = "wic help plugins"
+        self._exec_wic_cmd(cmd)
+
+    @OETestID(1972)
+    @OETestDepends(['test_wic_location'])
+    def test_wic_help_kickstart(self):
+        cmd = "wic help kickstart"
+        self._exec_wic_cmd(cmd)
+
+    @OETestID(1973)
+    @OETestDepends(['test_wic_location'])
+    def test_wic_list_images(self):
+        cmd = "wic list images"
+        self._exec_wic_cmd(cmd)
+
+    @OETestID(1974)
+    @OETestDepends(['test_wic_location'])
+    def test_wic_list_src_plugins(self):
+        cmd = "wic list source-plugins"
+        self._exec_wic_cmd(cmd)
+
+    @OETestID(1976)
+    @OETestDepends(['test_wic_location'])
+    def test_wic_listed_images_help(self):
+        cmd = "wic list images"
+        output = runCmd("cd %s; %s" % (self.tc.sdk_dir, cmd)).output
+        imagelist = [line.split()[0] for line in output.splitlines()]
+        for img in imagelist:
+            cmd = "wic list %s help" % img
+            self._exec_wic_cmd(cmd)
+
+    @OETestID(1977)
+    @OETestDepends(['test_wic_location'])
+    def test_wic_unsupported_subcommand(self):
+        self.assertNotEqual(0, runCmd('wic unsupported', ignore_status=True).status)
+
+    @OETestID(1978)
+    @OETestDepends(['test_wic_location'])
+    def test_wic_no_subcommand(self):
+        self.assertEqual(1, runCmd('wic', ignore_status=True).status)
+
+    @OETestID(1979)
+    @OETestDepends(['test_wic_location'])
+    def test_wic_mkefidisk_image(self):
+        self._exec_devtool_build()
+        image = self._get_img_type()
+        cmd = "wic create mkefidisk --image-name %s -o %s" % (image, self.testdir)
+        self._exec_wic_cmd(cmd)
+        self.assertEqual(1, len(glob(self.testdir + "mkefidisk-*.direct")))
+
+    @OETestID(1980)
+    @OETestDepends(['test_wic_location', 'test_wic_mkefidisk_image'])
+    def test_wic_ls(self):
+        images = glob(self.testdir + "mkefidisk-*.direct")
+        self.assertEqual(1, len(images))
+
+        # list partition
+        cmd = "wic ls %s > %s" % (images[0], self.outfile)
+        self._exec_wic_cmd(cmd)
+        count = self._get_line_count()
+        self.assertEqual(4, count)
+
+        # list directory content of the first partition
+        cmd = "wic ls %s:1 > %s" % (images[0], self.outfile)
+        self._exec_wic_cmd(cmd)
+        count = self._get_line_count()
+        self.assertEqual(7, count)
+        # clean up testdir
+        shutil.rmtree(self.testdir)
-- 
2.7.4


