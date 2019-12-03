Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1D947D2AE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2019 19:49:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xB3JnesT020730
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 3 Dec 2019 11:49:40 -0800 (PST)
Received: from yow-tgamblin-fedora1.wrs.com (128.224.56.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Tue, 3 Dec 2019 11:49:40 -0800
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Dec 2019 14:49:39 -0500
Message-ID: <20191203194939.3322425-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] oescripts.py: fix skip count behavior in OEPybootchartguyTests
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
X-List-Received-Date: Tue, 03 Dec 2019 19:49:42 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Prior to this fix, the try/except block in OEScriptTests' setUpClass
did both the import and the raise unittest.SkipTest for the
subsequent OEPybootchartguyTests. The consequence of the this meant
that, when cairo was not available on the test host, the raise was
counted only once as a class setup failure, instead of once for each
of the tests to be run, resulting in incorrect skip counts in the
test results.

Instead of raising unittest.SkipTest in setUpClass, this change
sets the boolean cls.import_failure, which is then checked by the
individual test methods in OEPybootchartguyTests. If it is True,
each method will raise unittest.SkipTest individually, with a
message string equal to the value of cls.import_failure_msg.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/lib/oeqa/selftest/cases/oescripts.py | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 41cbe04808..7ab80f48f0 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -38,30 +38,43 @@ class OEScriptTests(OESelftestTestCase):
     @classmethod
     def setUpClass(cls):
         super(OEScriptTests, cls).setUpClass()
+        # track the success of importing the required module, so that
+        # individual tests can raise unittest.SkipTest
+        cls.import_failure = False
         try:
             import cairo
         except ImportError:
-            raise unittest.SkipTest('Python module cairo is not present')
-        bitbake("core-image-minimal -c rootfs -f")
-        cls.tmpdir = get_bb_var('TMPDIR')
-        cls.buildstats = cls.tmpdir + "/buildstats/" + sorted(os.listdir(cls.tmpdir + "/buildstats"))[-1]
+            cls.import_failure = True
+            cls.import_failure_msg = "Python module cairo is not present"
+        else:
+            bitbake("core-image-minimal -c rootfs -f")
+            cls.tmpdir = get_bb_var('TMPDIR')
+            cls.buildstats = cls.tmpdir + "/buildstats/" + sorted(os.listdir(cls.tmpdir + "/buildstats"))[-1]
 
     scripts_dir = os.path.join(get_bb_var('COREBASE'), 'scripts')
 
 class OEPybootchartguyTests(OEScriptTests):
 
     def test_pybootchartguy_help(self):
+        if self.import_failure:
+            raise unittest.SkipTest(self.import_failure_msg)
         runCmd('%s/pybootchartgui/pybootchartgui.py  --help' % self.scripts_dir)
 
     def test_pybootchartguy_to_generate_build_png_output(self):
+        if self.import_failure:
+            raise unittest.SkipTest(self.import_failure_msg)
         runCmd('%s/pybootchartgui/pybootchartgui.py  %s -o %s/charts -f png' % (self.scripts_dir, self.buildstats, self.tmpdir))
         self.assertTrue(os.path.exists(self.tmpdir + "/charts.png"))
 
     def test_pybootchartguy_to_generate_build_svg_output(self):
+        if self.import_failure:
+            raise unittest.SkipTest(self.import_failure_msg)
         runCmd('%s/pybootchartgui/pybootchartgui.py  %s -o %s/charts -f svg' % (self.scripts_dir, self.buildstats, self.tmpdir))
         self.assertTrue(os.path.exists(self.tmpdir + "/charts.svg"))
 
     def test_pybootchartguy_to_generate_build_pdf_output(self):
+        if self.import_failure:
+            raise unittest.SkipTest(self.import_failure_msg)
         runCmd('%s/pybootchartgui/pybootchartgui.py  %s -o %s/charts -f pdf' % (self.scripts_dir, self.buildstats, self.tmpdir))
         self.assertTrue(os.path.exists(self.tmpdir + "/charts.pdf"))
 
-- 
2.23.0


