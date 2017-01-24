Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7474D772B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 14:07:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 24 Jan 2017 06:07:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,278,1477983600"; d="scan'208";a="1117122663"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2017 06:07:33 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 101366A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 06:06:35 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 15:43:56 +0200
Message-Id: <62f504e8e2eefef275a7afa41654ab10750771a8.1485264964.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485264964.git.ed.bartosh@linux.intel.com>
References: <cover.1485264964.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 8/8] selftest: wic: test default output directory
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
X-List-Received-Date: Tue, 24 Jan 2017 14:07:33 -0000

As tests now explicitly specify output directory we don't
need test_alternate_output_dir test case. However, we need
to test wic output to default output location.

Removed test_alternate_output_dir test case.
Added test_default_output_dir test case.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 7916071..8295b40 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -36,7 +36,6 @@ from oeqa.utils.decorators import testcase
 class Wic(oeSelfTest):
     """Wic test class."""
 
-    alternate_resultdir = "/var/tmp/wic/build/alt/"
     resultdir = "/var/tmp/wic.oe-selftest/"
     image_is_ready = False
     wicenv_cache = {}
@@ -202,20 +201,13 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "sdimage-bootpart-*direct")))
 
     @testcase(1562)
-    def test_alternate_output_dir(self):
-        """Test alternate output directory"""
-        self.assertEqual(0, runCmd("wic create directdisk "
-                                   "-e core-image-minimal "
-                                   "-o %s"
-                                   % self.alternate_resultdir).status)
-        self.assertEqual(1, len(glob(self.alternate_resultdir +
-                                     "build/directdisk-*.direct")))
-        self.assertEqual(0, runCmd("wic create mkefidisk -e "
-                                   "core-image-minimal "
-                                   "--outdir=%s"
-                                   % self.alternate_resultdir).status)
-        self.assertEqual(1, len(glob(self.alternate_resultdir +
-                                     "build/mkefidisk-*direct")))
+    def test_default_output_dir(self):
+        """Test default output location"""
+        for fname in glob("directdisk-*.direct"):
+            os.remove(fname)
+        cmd = "wic create directdisk -e core-image-minimal"
+        self.assertEqual(0, runCmd(cmd).status)
+        self.assertEqual(1, len(glob("directdisk-*.direct")))
 
     @testcase(1212)
     def test_build_artifacts(self):
-- 
2.1.4


