Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F0E6C734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 20:29:34 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2015 13:29:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,418,1437462000"; d="scan'208";a="549118612"
Received: from yctb04.ostc.intel.com (HELO yctb04.otcr.jf.intel.com)
	([10.23.219.53])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2015 13:29:35 -0700
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 12:26:02 +0000
Message-Id: <1440591962-35348-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 2.3.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH] selftest/manifest.py: Test to verify rootfs manifest
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
X-List-Received-Date: Wed, 26 Aug 2015 20:29:36 -0000

Adding a new test to verify if the packages in the
manifest files actually exists in pkgdata.
 -adding a setUpClass for when more tests get created here
 -check for the paths and fail gracefully if not there
 -skip the test when there are no manifest files to check
 -debug prints for failure analysis

[YOCTO#8028]

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/selftest/manifest.py | 52 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/manifest.py

diff --git a/meta/lib/oeqa/selftest/manifest.py b/meta/lib/oeqa/selftest/manifest.py
new file mode 100644
index 0000000..c2bc945
--- /dev/null
+++ b/meta/lib/oeqa/selftest/manifest.py
@@ -0,0 +1,52 @@
+import unittest
+import os
+from glob import glob
+
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import get_bb_var
+from oeqa.utils.decorators import testcase
+
+class VerifyManifest(oeSelfTest):
+    '''Tests for the manifest files and contents of an image'''
+
+    @classmethod
+    def setUpClass(self):
+
+        # get directory locations from variable values and check them
+        self.deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE');
+        if not self.deploy_dir_image \
+            or not os.path.isdir(self.deploy_dir_image):
+            raise unittest.SkipTest("{}: DEPLOY_DIR_IMAGE does not exist: {}"\
+                    .format("VerifyManifest", self.deploy_dir_image))
+
+        self.pkgdata_dir = get_bb_var('PKGDATA_DIR');
+        if not self.pkgdata_dir \
+            or not os.path.isdir(self.pkgdata_dir):
+            raise unittest.SkipTest("{}: PKGDATA_DIR does not exist: {}"\
+                    .format("VerifyManifest", self.pkgdata_dir))
+
+        # get the manifest files
+        # no need to try: since glob would return an empty list if
+        # the path is non-existant
+        self.manifest_files = glob("%s/*.manifest" % self.deploy_dir_image)
+        self.log.debug("manifest files: {}".format(self.manifest_files))
+        if not self.manifest_files:
+            raise unittest.SkipTest("{}: No manifest files found in: {}"\
+                .format("VerifyManifest", self.deploy_dir_image))
+
+
+    def test_manifest_entries(self):
+        '''Verifying the manifest entries as packages '''
+        testname = self.id().split('.')[-1]
+        rundir = os.path.join(self.pkgdata_dir, "runtime-reverse")
+
+        errmsg = "ERROR: Package %s is in manifest but not in pkgdata"
+        for manifest in self.manifest_files:
+            with open(manifest, "r") as mfile:
+                for manifest_entries in mfile:
+                    pkg = manifest_entries.split()[0]
+                    pkgfile = os.path.join(rundir, pkg)
+                    self.log.debug("{}: looking for {}"\
+                            .format(testname, pkgfile))
+                    self.assertTrue(os.path.isfile(pkgfile),
+                            errmsg % pkg)
-- 
2.3.0


