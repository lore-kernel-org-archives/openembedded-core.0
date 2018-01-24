Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C40AC60068
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 02:01:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jan 2018 18:01:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,409,1511856000"; d="scan'208";a="24531877"
Received: from echidna.jf.intel.com ([10.54.77.42])
	by fmsmga004.fm.intel.com with ESMTP; 24 Jan 2018 18:01:40 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jan 2018 10:49:38 -0800
Message-Id: <1516819778-59257-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] oe-selftest: meta_ide: add test for meta-ide-support
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
X-List-Received-Date: Thu, 25 Jan 2018 02:01:39 -0000

QA team were testing meta-ide-support manually. Add automated
tests to test that bibtake meta-ide-support will create the
toolchain and environment setup script. Also test that after
using environment setup script, one can compile c program.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/selftest/cases/meta_ide.py | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/meta_ide.py

diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
new file mode 100644
index 0000000..1c1c5ab
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
@@ -0,0 +1,31 @@
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_vars, runCmd
+import tempfile
+import shutil
+
+class MetaIDE(OESelftestTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        super(MetaIDE, cls).setUpClass()
+        bitbake('meta-ide-support')
+        bb_vars = get_bb_vars(['MULTIMACH_TARGET_SYS', 'TMPDIR', 'COREBASE'])
+        cls.environment_script = 'environment-setup-%s' % bb_vars['MULTIMACH_TARGET_SYS']
+        cls.tmpdir = bb_vars['TMPDIR']
+        cls.environment_script_path = '%s/%s' % (cls.tmpdir, cls.environment_script)
+        cls.corebasedir = bb_vars['COREBASE']
+        cls.tmpdir_metaideQA = tempfile.mkdtemp(prefix='metaide')
+
+    @classmethod
+    def tearDownClass(cls):
+        shutil.rmtree(cls.tmpdir_metaideQA, ignore_errors=True)
+        super(MetaIDE, cls).tearDownClass()
+
+    def test_meta_ide_had_installed_meta_ide_support(self):
+        self.assertExists(self.environment_script_path)
+
+    def test_meta_ide_can_compiled_cprogram(self):
+        runCmd('cp %s/test.c %s' % (self.tc.files_dir, self.tmpdir_metaideQA))
+        runCmd("cd %s; . %s; $CC test.c -lm" % (self.tmpdir_metaideQA, self.environment_script_path))
+        compiled_file = '%s/a.out' % self.tmpdir_metaideQA
+        self.assertExists(compiled_file)
-- 
2.7.4


