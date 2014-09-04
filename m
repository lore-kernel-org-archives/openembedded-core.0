Return-Path: <georgex.l.musat@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 95DF9713F2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 11:32:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Sep 2014 04:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,465,1406617200"; d="scan'208";a="568250807"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 04 Sep 2014 04:32:34 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 2F6D16A4087;
	Thu,  4 Sep 2014 04:31:51 -0700 (PDT)
From: Lucian Musat <georgex.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Sep 2014 14:27:26 +0300
Message-Id: <1409830046-28375-3-git-send-email-georgex.l.musat@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1409830046-28375-1-git-send-email-georgex.l.musat@intel.com>
References: <1409830046-28375-1-git-send-email-georgex.l.musat@intel.com>
Subject: [PATCH 3/3] oeqa/runtime: Automatic test for ptest
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
X-List-Received-Date: Thu, 04 Sep 2014 11:32:40 -0000

For images without ptest the packages are automatically installed alongside ptest-runner. Log results are saved in ./results folder.
No cleanup is done for packages after the test is finished.

Signed-off-by: Lucian Musat <georgex.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/_ptest.py | 124 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/_ptest.py

diff --git a/meta/lib/oeqa/runtime/_ptest.py b/meta/lib/oeqa/runtime/_ptest.py
new file mode 100644
index 0000000..4c58dc1
--- /dev/null
+++ b/meta/lib/oeqa/runtime/_ptest.py
@@ -0,0 +1,124 @@
+import unittest, os, shutil
+from oeqa.oetest import oeRuntimeTest, skipModule
+from oeqa.utils.decorators import *
+from oeqa.utils.logparser import *
+from oeqa.utils.httpserver import HTTPService
+import bb
+import glob
+from oe.package_manager import RpmPkgsList
+import subprocess
+
+def setUpModule():
+    if not oeRuntimeTest.hasFeature("package-management"):
+        skipModule("Image doesn't have package management feature")
+    if not oeRuntimeTest.hasPackage("smart"):
+        skipModule("Image doesn't have smart installed")
+    if "package_rpm" != oeRuntimeTest.tc.d.getVar("PACKAGE_CLASSES", True).split()[0]:
+        skipModule("Rpm is not the primary package manager")
+
+class PtestRunnerTest(oeRuntimeTest):
+
+    # a ptest log parser
+    def parse_ptest(self, logfile):
+        parser = Lparser(test_0_pass_regex="^PASS:(.+)", test_0_fail_regex="^FAIL:(.+)", section_0_begin_regex="^BEGIN: .*/(.+)/ptest", section_0_end_regex="^END: .*/(.+)/ptest")
+        parser.init()
+        result = Result()
+
+        with open(logfile) as f:
+            for line in f:
+                result_tuple = parser.parse_line(line)
+                if not result_tuple:
+                    continue
+                result_tuple = line_type, category, status, name = parser.parse_line(line)
+
+                if line_type == 'section' and status == 'begin':
+                    current_section = name
+                    continue
+
+                if line_type == 'section' and status == 'end':
+                    current_section = None
+                    continue
+
+                if line_type == 'test' and status == 'pass':
+                    result.store(current_section, name, status)
+                    continue
+
+                if line_type == 'test' and status == 'fail':
+                    result.store(current_section, name, status)
+                    continue
+
+        result.sort_tests()
+        return result
+
+    @classmethod
+    def setUpClass(self):
+        #note the existing channels that are on the board before creating new ones
+#        self.existingchannels = set()
+#        (status, result) = oeRuntimeTest.tc.target.run('smart channel --show | grep "\["', 0)
+#        for x in result.split("\n"):
+#            self.existingchannels.add(x)
+        self.repo_server = HTTPService(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True), oeRuntimeTest.tc.target.server_ip)
+        self.repo_server.start()
+
+    @classmethod
+    def tearDownClass(self):
+        self.repo_server.stop()
+        #remove created channels to be able to repeat the tests on same image
+#        (status, result) = oeRuntimeTest.tc.target.run('smart channel --show | grep "\["', 0)
+#        for x in result.split("\n"):
+#            if x not in self.existingchannels:
+#                oeRuntimeTest.tc.target.run('smart channel --remove '+x[1:-1]+' -y', 0)
+
+    def add_smart_channel(self):
+        image_pkgtype = self.tc.d.getVar('IMAGE_PKGTYPE', True)
+        deploy_url = 'http://%s:%s/%s' %(self.target.server_ip, self.repo_server.port, image_pkgtype)
+        pkgarchs = self.tc.d.getVar('PACKAGE_ARCHS', True).replace("-","_").split()
+        for arch in os.listdir('%s/%s' % (self.repo_server.root_dir, image_pkgtype)):
+            if arch in pkgarchs:
+                self.target.run('smart channel -y --add {a} type=rpm-md baseurl={u}/{a}'.format(a=arch, u=deploy_url), 0)
+        self.target.run('smart update', 0)
+
+    def install_complementary(self, globs=None):
+        installed_pkgs_file = os.path.join(oeRuntimeTest.tc.d.getVar('WORKDIR', True),
+                                           "installed_pkgs.txt")
+        self.pkgs_list = RpmPkgsList(oeRuntimeTest.tc.d, oeRuntimeTest.tc.d.getVar('IMAGE_ROOTFS', True), oeRuntimeTest.tc.d.getVar('arch_var', True), oeRuntimeTest.tc.d.getVar('os_var', True))
+        with open(installed_pkgs_file, "w+") as installed_pkgs:
+            installed_pkgs.write(self.pkgs_list.list("arch"))
+
+        cmd = [bb.utils.which(os.getenv('PATH'), "oe-pkgdata-util"),
+               "glob", oeRuntimeTest.tc.d.getVar('PKGDATA_DIR', True), installed_pkgs_file,
+               globs]
+        try:
+            bb.note("Installing complementary packages ...")
+            complementary_pkgs = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Could not compute complementary packages list. Command "
+                     "'%s' returned %d:\n%s" %
+                     (' '.join(cmd), e.returncode, e.output))
+
+        return complementary_pkgs.split()
+
+    def setUp(self):
+        self.buildhist_dir = oeRuntimeTest.tc.d.getVar("BUILDHISTORY_DIR_IMAGE", True)
+        self.assertTrue(os.path.exists(self.buildhist_dir))
+        self.ptest_log = os.path.join(oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR",True), "ptest-%s.log" % oeRuntimeTest.tc.d.getVar('DATETIME', True))
+
+    @skipUnlessPassed('test_ssh')
+    def test_ptestrunner(self):
+        self.add_smart_channel()
+        cond = oeRuntimeTest.hasPackage("ptest-runner") and oeRuntimeTest.hasFeature("ptest") and oeRuntimeTest.hasPackage("-ptest")
+        if not cond:
+            self.install_packages(self.install_complementary("*-ptest"))
+            self.install_packages(['ptest-runner'])
+
+        self.target.run('/usr/bin/ptest-runner > /tmp/ptest.log 2>&1', 0)
+        self.target.copy_from('/tmp/ptest.log', self.ptest_log)
+        shutil.copyfile(self.ptest_log, os.path.join(self.buildhist_dir, "ptest.log"))
+
+        result = self.parse_ptest(os.path.join(self.buildhist_dir, "ptest.log"))
+        log_results_to_location = "./results"
+        if os.path.exists(log_results_to_location):
+            shutil.rmtree(log_results_to_location)
+        os.makedirs(log_results_to_location)
+
+        result.log_as_files(log_results_to_location, test_status = ['fail'])
-- 
1.9.1


