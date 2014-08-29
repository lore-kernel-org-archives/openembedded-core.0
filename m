Return-Path: <georgex.l.musat@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5A2D86AC7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 13:55:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 29 Aug 2014 06:56:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="378686702"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Aug 2014 06:51:40 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 86AAB6A4087;
	Fri, 29 Aug 2014 06:55:18 -0700 (PDT)
From: Lucian Musat <georgex.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 16:51:06 +0300
Message-Id: <1409320266-29059-3-git-send-email-georgex.l.musat@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1409320266-29059-1-git-send-email-georgex.l.musat@intel.com>
References: <1409320266-29059-1-git-send-email-georgex.l.musat@intel.com>
Cc: Stefan Stanacar <stefanx.stanacar@intel.com>
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
X-List-Received-Date: Fri, 29 Aug 2014 13:56:02 -0000

For images without ptest the packages are automatically installed alongside ptest-runner. Log results are saved in ./results folder.
No cleanup is done for packages after the test is finished.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
Signed-off-by: Lucian Musat <georgex.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/_ptest.py | 140 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/_ptest.py

diff --git a/meta/lib/oeqa/runtime/_ptest.py b/meta/lib/oeqa/runtime/_ptest.py
new file mode 100644
index 0000000..cd1e4ad
--- /dev/null
+++ b/meta/lib/oeqa/runtime/_ptest.py
@@ -0,0 +1,140 @@
+import unittest, os, shutil
+from oeqa.oetest import oeRuntimeTest, skipModule
+from oeqa.utils.decorators import *
+from oeqa.utils.logparser import *
+from oeqa.utils.httpserver import HTTPService
+from difflib import SequenceMatcher
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
+    def parse_ptest(logfile):
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
+        self.existingchannels = set()
+        (status, result) = oeRuntimeTest.tc.target.run('smart channel --show | grep "\["', 0)
+        for x in result.split("\n"):
+            self.existingchannels.add(x)
+        self.repo_server = HTTPService(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True), oeRuntimeTest.tc.target.server_ip)
+        self.repo_server.start()
+        (status, result) = oeRuntimeTest.tc.target.run('smart query', 0)
+        self.packagelist = result
+        if self.packagelist == "":
+            raise AssertionError("Cannot get package list!")
+        self.pkglist = self.packagelist.split("\n")
+
+    @classmethod
+    def tearDownClass(self):
+        self.repo_server.stop()
+        #remove created channels to be able to repeat the tests on same image
+        (status, result) = oeRuntimeTest.tc.target.run('smart channel --show | grep "\["', 0)
+        for x in result.split("\n"):
+            if x not in self.existingchannels:
+                oeRuntimeTest.tc.target.run('smart channel --remove '+x[1:-1]+' -y', 0)
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
+    def get_ptest_packages(self):
+        pkgs = set()
+        image_pkgtype = self.tc.d.getVar('IMAGE_PKGTYPE', True)
+        pkgarchs = self.tc.d.getVar('PACKAGE_ARCHS', True).replace("-","_").split()
+        for arch in pkgarchs:
+            folder = self.repo_server.root_dir+"/"+image_pkgtype+'/'+arch
+            if (os.path.isdir(folder)):
+                for fil in os.listdir(folder):
+                    if ("ptest" in str(fil) and "ptest-runner" not in str(fil)):
+                        #get all the packages with -ptest in the name and remove ptest from them for future comparisons 
+                        filez = "".join(str(fil).split("-ptest"))
+                        rootfilez = ".".join(filez.split(".")[:-2])
+                        filex = str(fil).split("-ptest")[0]
+                        #compare with all the packages installed on the board and get a list of potential matches
+                        if filex in self.packagelist:
+                            i = 0
+                            matches = []
+                            while i<len(self.pkglist):
+                                if filex in self.pkglist[i]:
+                                    matches.append(self.pkglist[i])
+                                i +=1
+                            for i in matches:
+                                #sometimes package names differ from corresponding ptest package names (ex. libacl1 != acl-ptest) so we use the Source field from smart info to compare
+                                (status, result) = self.target.run("smart info "+i,0)
+                                rootpkg = re.search("(.*Source:.*)", result).group(1).split(":")[1][1:]
+                                #even source package names mai differ a little so we do a fuzzy string match (ex. libz-1.2.8-r0 -> zlib-1.2.8-r0)
+                                m = SequenceMatcher(None, rootpkg, rootfilez)
+                                if (m.ratio > 0.9):
+                                    filey = "".join(str(fil).split("-ptest")[0])+"-ptest"
+                                    pkgs.add(filey)
+        if str(pkgs) == "set([])":
+            raise AssertionError("Cannot get ptest packages to install!")
+        pkgs.add("ptest-runner")
+        return pkgs
+
+    def setUp(self):
+        self.buildhist_dir = oeRuntimeTest.tc.d.getVar("BUILDHISTORY_DIR_IMAGE", True)
+        self.assertTrue(os.path.exists(self.buildhist_dir))
+        self.ptest_log = os.path.join(oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR",True), "ptest-%s.log" % oeRuntimeTest.tc.d.getVar('DATETIME', True))
+
+    @skipUnlessPassed('test_ssh')
+    def test_ptestrunner(self):
+        self.add_smart_channel()
+        self.install_packages(list(self.get_ptest_packages()))
+
+        self.target.run('/usr/bin/ptest-runner > /tmp/ptest.log 2>&1', 0)
+        self.target.copy_from('/tmp/ptest.log', self.ptest_log)
+        shutil.copyfile(self.ptest_log, os.path.join(self.buildhist_dir, "ptest.log"))
+
+        result = self.parse_ptest(os.path.join(self.buildhist_dir, "ptest.log"))
+        log_results_to_location = os.path.join('./results')
+        if not os.path.exists(log_results_to_location):
+            os.makedirs(log_results_to_location)
+
+        # clear the results directory each time
+        for path in os.listdir(log_results_to_location):
+            os.remove(os.path.join(log_results_to_location, path))
+        result.log_as_files(log_results_to_location, test_status = ['fail'])
-- 
1.9.1


