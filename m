Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5D8A877D6F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 22:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490912300; x=1522448300;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=kn8rbN2j46hy5ddHZPKuZGmuRRoI5cj8PXaKF1mxhCg=;
	b=Caa/PXc0IV812qXjOrs8y7TQ/cUAUI/PVwL07CGA2LltucTMrhr0CGIa
	KndxBDrkmRKd9zVE02qa2upMQKfQtA==;
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2017 15:18:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,249,1486454400"; d="scan'208";a="840197556"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Mar 2017 15:18:16 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 15:18:14 -0700
Message-Id: <e45f287aa5d763e5a3dc46c4f52a883e826a11b5.1490912244.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1490912244.git.mariano.lopez@linux.intel.com>
References: <cover.1490912244.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] oeqa/runtime/cases: Migrate underscore cases
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
X-List-Received-Date: Thu, 30 Mar 2017 22:18:18 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

There were two missing cases to be migrated to the new framework: _qemutiny and
_ptest.

qemutiny was straightforward.

ptest on the other hand wasn't working even in previous releases; it has been
migrated from smart to dnf, and how ptest packages are gathered to be
installed, adapted to use unicode, and removed a lot of code that wasn't needed
anymore.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/runtime/cases/_ptest.py    | 130 +++++++++++++------------------
 meta/lib/oeqa/runtime/cases/_qemutiny.py |  11 ++-
 2 files changed, 59 insertions(+), 82 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/_ptest.py b/meta/lib/oeqa/runtime/cases/_ptest.py
index a243251..aaed9a5 100644
--- a/meta/lib/oeqa/runtime/cases/_ptest.py
+++ b/meta/lib/oeqa/runtime/cases/_ptest.py
@@ -1,30 +1,39 @@
-import unittest, os, shutil
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
+import os
+import shutil
+import subprocess
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature
+from oeqa.runtime.decorator.package import OEHasPackage
+
+from oeqa.runtime.cases.dnf import DnfTest
 from oeqa.utils.logparser import *
 from oeqa.utils.httpserver import HTTPService
-import bb
-import glob
-from oe.package_manager import RpmPkgsList
-import subprocess
 
-def setUpModule():
-    if not oeRuntimeTest.hasFeature("package-management"):
-        skipModule("Image doesn't have package management feature")
-    if not oeRuntimeTest.hasPackage("smartpm"):
-        skipModule("Image doesn't have smart installed")
-    if "package_rpm" != oeRuntimeTest.tc.d.getVar("PACKAGE_CLASSES").split()[0]:
-        skipModule("Rpm is not the primary package manager")
+class PtestRunnerTest(DnfTest):
+
+    @classmethod
+    def setUpClass(cls):
+        rpm_deploy = os.path.join(cls.tc.td['DEPLOY_DIR'], 'rpm')
+        cls.repo_server = HTTPService(rpm_deploy, cls.tc.target.server_ip)
+        cls.repo_server.start()
 
-class PtestRunnerTest(oeRuntimeTest):
+    @classmethod
+    def tearDownClass(cls):
+        cls.repo_server.stop()
 
     # a ptest log parser
     def parse_ptest(self, logfile):
-        parser = Lparser(test_0_pass_regex="^PASS:(.+)", test_0_fail_regex="^FAIL:(.+)", section_0_begin_regex="^BEGIN: .*/(.+)/ptest", section_0_end_regex="^END: .*/(.+)/ptest")
+        parser = Lparser(test_0_pass_regex="^PASS:(.+)",
+                         test_0_fail_regex="^FAIL:(.+)",
+                         section_0_begin_regex="^BEGIN: .*/(.+)/ptest",
+                         section_0_end_regex="^END: .*/(.+)/ptest")
         parser.init()
         result = Result()
 
-        with open(logfile) as f:
+        with open(logfile, errors='replace') as f:
             for line in f:
                 result_tuple = parser.parse_line(line)
                 if not result_tuple:
@@ -50,70 +59,39 @@ class PtestRunnerTest(oeRuntimeTest):
         result.sort_tests()
         return result
 
-    @classmethod
-    def setUpClass(self):
-        #note the existing channels that are on the board before creating new ones
-#        self.existingchannels = set()
-#        (status, result) = oeRuntimeTest.tc.target.run('smart channel --show | grep "\["', 0)
-#        for x in result.split("\n"):
-#            self.existingchannels.add(x)
-        self.repo_server = HTTPService(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR'), oeRuntimeTest.tc.target.server_ip)
-        self.repo_server.start()
-
-    @classmethod
-    def tearDownClass(self):
-        self.repo_server.stop()
-        #remove created channels to be able to repeat the tests on same image
-#        (status, result) = oeRuntimeTest.tc.target.run('smart channel --show | grep "\["', 0)
-#        for x in result.split("\n"):
-#            if x not in self.existingchannels:
-#                oeRuntimeTest.tc.target.run('smart channel --remove '+x[1:-1]+' -y', 0)
-
-    def add_smart_channel(self):
-        image_pkgtype = self.tc.d.getVar('IMAGE_PKGTYPE')
-        deploy_url = 'http://%s:%s/%s' %(self.target.server_ip, self.repo_server.port, image_pkgtype)
-        pkgarchs = self.tc.d.getVar('PACKAGE_ARCHS').replace("-","_").split()
-        for arch in os.listdir('%s/%s' % (self.repo_server.root_dir, image_pkgtype)):
-            if arch in pkgarchs:
-                self.target.run('smart channel -y --add {a} type=rpm-md baseurl={u}/{a}'.format(a=arch, u=deploy_url), 0)
-        self.target.run('smart update', 0)
-
-    def install_complementary(self, globs=None):
-        installed_pkgs_file = os.path.join(oeRuntimeTest.tc.d.getVar('WORKDIR'),
-                                           "installed_pkgs.txt")
-        self.pkgs_list = RpmPkgsList(oeRuntimeTest.tc.d, oeRuntimeTest.tc.d.getVar('IMAGE_ROOTFS'), oeRuntimeTest.tc.d.getVar('arch_var'), oeRuntimeTest.tc.d.getVar('os_var'))
-        with open(installed_pkgs_file, "w+") as installed_pkgs:
-            installed_pkgs.write(self.pkgs_list.list("arch"))
-
-        cmd = [bb.utils.which(os.getenv('PATH'), "oe-pkgdata-util"),
-               "-p", oeRuntimeTest.tc.d.getVar('PKGDATA_DIR'), "glob", installed_pkgs_file,
-               globs]
-        try:
-            bb.note("Installing complementary packages ...")
-            complementary_pkgs = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
-        except subprocess.CalledProcessError as e:
-            bb.fatal("Could not compute complementary packages list. Command "
-                     "'%s' returned %d:\n%s" %
-                     (' '.join(cmd), e.returncode, e.output))
-
-        return complementary_pkgs.split()
-
-    def setUpLocal(self):
-        self.ptest_log = os.path.join(oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR"), "ptest-%s.log" % oeRuntimeTest.tc.d.getVar('DATETIME'))
-
-    @skipUnlessPassed('test_ssh')
+    def _install_ptest_packages(self):
+        # Get ptest packages that can be installed in the image.
+        packages_dir = os.path.join(self.tc.td['DEPLOY_DIR'], 'rpm')
+        ptest_pkgs = [pkg[:pkg.find('-ptest')+6]
+                          for _, _, filenames in os.walk(packages_dir)
+                          for pkg in filenames
+                          if 'ptest' in pkg
+                          and pkg[:pkg.find('-ptest')] in self.tc.image_packages]
+
+        repo_url = 'http://%s:%s' % (self.target.server_ip,
+                                     self.repo_server.port)
+        dnf_options = ('--repofrompath=oe-ptest-repo,%s '
+                       '--nogpgcheck '
+                       'install -y' % repo_url)
+        self.dnf('%s %s ptest-runner' % (dnf_options, ' '.join(ptest_pkgs)))
+
+    @skipIfNotFeature('package-management',
+                      'Test requires package-management to be in DISTRO_FEATURES')
+    @skipIfNotFeature('ptest',
+                      'Test requires package-management to be in DISTRO_FEATURES')
+    @skipIfNotDataVar('IMAGE_PKGTYPE', 'rpm',
+                      'RPM is not the primary package manager')
+    @OEHasPackage(['dnf'])
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_ptestrunner(self):
-        self.add_smart_channel()
-        (runnerstatus, result) = self.target.run('which ptest-runner', 0)
-        cond = oeRuntimeTest.hasPackage("ptest-runner") and oeRuntimeTest.hasFeature("ptest") and oeRuntimeTest.hasPackageMatch("-ptest") and (runnerstatus != 0)
-        if cond:
-            self.install_packages(self.install_complementary("*-ptest"))
-            self.install_packages(['ptest-runner'])
+        self.ptest_log = os.path.join(self.tc.td['TEST_LOG_DIR'],
+                                      'ptest-%s.log' % self.tc.td['DATETIME'])
+        self._install_ptest_packages()
 
         (runnerstatus, result) = self.target.run('/usr/bin/ptest-runner > /tmp/ptest.log 2>&1', 0)
         #exit code is !=0 even if ptest-runner executes because some ptest tests fail.
         self.assertTrue(runnerstatus != 127, msg="Cannot execute ptest-runner!")
-        self.target.copy_from('/tmp/ptest.log', self.ptest_log)
+        self.target.copyFrom('/tmp/ptest.log', self.ptest_log)
         shutil.copyfile(self.ptest_log, "ptest.log")
 
         result = self.parse_ptest("ptest.log")
diff --git a/meta/lib/oeqa/runtime/cases/_qemutiny.py b/meta/lib/oeqa/runtime/cases/_qemutiny.py
index a3c29f3..7b5b481 100644
--- a/meta/lib/oeqa/runtime/cases/_qemutiny.py
+++ b/meta/lib/oeqa/runtime/cases/_qemutiny.py
@@ -1,9 +1,8 @@
-import unittest
-from oeqa.oetest import oeRuntimeTest
-from oeqa.utils.qemutinyrunner import *
+from oeqa.runtime.case import OERuntimeTestCase
 
-class QemuTinyTest(oeRuntimeTest):
+class QemuTinyTest(OERuntimeTestCase):
 
     def test_boot_tiny(self):
-        (status, output) = self.target.run_serial('uname -a')
-        self.assertTrue("yocto-tiny" in output, msg="Cannot detect poky tiny boot!")
\ No newline at end of file
+        status, output = self.target.run_serial('uname -a')
+        msg = "Cannot detect poky tiny boot!"
+        self.assertTrue("yocto-tiny" in output, msg)
-- 
2.10.2


