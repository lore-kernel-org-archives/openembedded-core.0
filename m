Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 45244784B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 09:50:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6V9oDRE008026
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 02:50:13 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 31 Jul 2017 02:50:12 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 31 Jul 2017 02:50:02 -0700
Message-ID: <34ee7b412201716e3c01083c9bc44e4ce8190b39.1501494496.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1501494496.git.liezhi.yang@windriver.com>
References: <cover.1501494496.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/10] runtime/cases/_ptest.py: revive it
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
X-List-Received-Date: Mon, 31 Jul 2017 09:50:12 -0000
Content-Type: text/plain

* Make it work with current oeqa
* Skip the test if ptest is not in DISTRO_FEATURES
* Skip the test if ptest-pkgs is not in IMAGE_FEATURES
* The logs are saved to:
  testimage/ptest_log -> testimage/ptest_log.<datetime>
* Will write a tool to make regression check

[YOCTO #11547]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/runtime/cases/_ptest.py | 96 +++++++++++++----------------------
 1 file changed, 35 insertions(+), 61 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/_ptest.py b/meta/lib/oeqa/runtime/cases/_ptest.py
index aaed9a5352f..6d239494b88 100644
--- a/meta/lib/oeqa/runtime/cases/_ptest.py
+++ b/meta/lib/oeqa/runtime/cases/_ptest.py
@@ -1,28 +1,10 @@
-import os
-import shutil
-import subprocess
-
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
-from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature
-from oeqa.runtime.decorator.package import OEHasPackage
-
-from oeqa.runtime.cases.dnf import DnfTest
-from oeqa.utils.logparser import *
-from oeqa.utils.httpserver import HTTPService
-
-class PtestRunnerTest(DnfTest):
+from oeqa.core.decorator.data import skipIfNotFeature
+from oeqa.utils.logparser import Lparser, Result
 
-    @classmethod
-    def setUpClass(cls):
-        rpm_deploy = os.path.join(cls.tc.td['DEPLOY_DIR'], 'rpm')
-        cls.repo_server = HTTPService(rpm_deploy, cls.tc.target.server_ip)
-        cls.repo_server.start()
-
-    @classmethod
-    def tearDownClass(cls):
-        cls.repo_server.stop()
+class PtestRunnerTest(OERuntimeTestCase):
 
     # a ptest log parser
     def parse_ptest(self, logfile):
@@ -59,45 +41,37 @@ class PtestRunnerTest(DnfTest):
         result.sort_tests()
         return result
 
-    def _install_ptest_packages(self):
-        # Get ptest packages that can be installed in the image.
-        packages_dir = os.path.join(self.tc.td['DEPLOY_DIR'], 'rpm')
-        ptest_pkgs = [pkg[:pkg.find('-ptest')+6]
-                          for _, _, filenames in os.walk(packages_dir)
-                          for pkg in filenames
-                          if 'ptest' in pkg
-                          and pkg[:pkg.find('-ptest')] in self.tc.image_packages]
-
-        repo_url = 'http://%s:%s' % (self.target.server_ip,
-                                     self.repo_server.port)
-        dnf_options = ('--repofrompath=oe-ptest-repo,%s '
-                       '--nogpgcheck '
-                       'install -y' % repo_url)
-        self.dnf('%s %s ptest-runner' % (dnf_options, ' '.join(ptest_pkgs)))
-
-    @skipIfNotFeature('package-management',
-                      'Test requires package-management to be in DISTRO_FEATURES')
-    @skipIfNotFeature('ptest',
-                      'Test requires package-management to be in DISTRO_FEATURES')
-    @skipIfNotDataVar('IMAGE_PKGTYPE', 'rpm',
-                      'RPM is not the primary package manager')
-    @OEHasPackage(['dnf'])
+    @OETestID(1600)
+    @skipIfNotFeature('ptest', 'Test requires ptest to be in DISTRO_FEATURES')
+    @skipIfNotFeature('ptest-pkgs', 'Test requires ptest-pkgs to be in IMAGE_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_ptestrunner(self):
-        self.ptest_log = os.path.join(self.tc.td['TEST_LOG_DIR'],
-                                      'ptest-%s.log' % self.tc.td['DATETIME'])
-        self._install_ptest_packages()
-
-        (runnerstatus, result) = self.target.run('/usr/bin/ptest-runner > /tmp/ptest.log 2>&1', 0)
-        #exit code is !=0 even if ptest-runner executes because some ptest tests fail.
-        self.assertTrue(runnerstatus != 127, msg="Cannot execute ptest-runner!")
-        self.target.copyFrom('/tmp/ptest.log', self.ptest_log)
-        shutil.copyfile(self.ptest_log, "ptest.log")
-
-        result = self.parse_ptest("ptest.log")
-        log_results_to_location = "./results"
-        if os.path.exists(log_results_to_location):
-            shutil.rmtree(log_results_to_location)
-        os.makedirs(log_results_to_location)
-
-        result.log_as_files(log_results_to_location, test_status = ['pass','fail'])
+        import datetime
+
+        test_log_dir = self.td.get('TEST_LOG_DIR', '')
+        # The TEST_LOG_DIR maybe NULL when testimage is added after
+        # testdata.json is generated.
+        if not test_log_dir:
+            test_log_dir = os.path.join(self.td.get('WORKDIR', ''), 'testimage')
+        # Don't use self.td.get('DATETIME'), it's from testdata.json, not
+        # up-to-date, and may cause "File exists" when re-reun.
+        datetime = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
+        ptest_log_dir_link = os.path.join(test_log_dir, 'ptest_log')
+        ptest_log_dir = '%s.%s' % (ptest_log_dir_link, datetime)
+        ptest_runner_log = os.path.join(ptest_log_dir, 'ptest-runner.log')
+
+        status, output = self.target.run('ptest-runner', 0)
+        os.makedirs(ptest_log_dir)
+        with open(ptest_runner_log, 'w') as f:
+            f.write(output)
+
+        # status != 0 is OK since some ptest tests may fail
+        self.assertTrue(status != 127, msg="Cannot execute ptest-runner!")
+
+        # Parse and save results
+        parse_result = self.parse_ptest(ptest_runner_log)
+        parse_result.log_as_files(ptest_log_dir, test_status = ['pass','fail'])
+        if os.path.exists(ptest_log_dir_link):
+            # Remove the old link to create a new one
+            os.remove(ptest_log_dir_link)
+        os.symlink(os.path.basename(ptest_log_dir), ptest_log_dir_link)
-- 
2.11.0


