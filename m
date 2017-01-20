Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5A29E77253
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567524"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:58 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:20 -0600
Message-Id: <ddc25d69f0abe5c9e41ae17e109a5f701e1436c2.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 49/55] runtime/cases/smart.py: Migrate smart tests
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This migrates the smart test from the old framework to
the new one. This has its own commit because smart
test was using bb and oe libraries that are available
when exporting the test cases to run in a different host.

Because of the removal of bb and oe libraries index and
packages feeds creation will be managed in testimage bbclass.

[YOCTO #10234]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass       |  53 +++++++++++
 meta/lib/oeqa/runtime/cases/smart.py | 172 +++++++++++++++--------------------
 2 files changed, 128 insertions(+), 97 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 016c1c1..abcecca 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -116,6 +116,10 @@ python do_testimage() {
 
     testimage_sanity(d)
 
+    if (d.getVar('IMAGE_PKGTYPE') == 'rpm'
+       and 'smart' in d.getVar('TEST_SUITES')):
+        create_rpm_index(d)
+
     testimage_main(d)
 }
 
@@ -284,6 +288,55 @@ def get_runtime_paths(d):
             paths.append(path)
     return paths
 
+def create_index(arg):
+    import subprocess
+
+    index_cmd = arg
+    try:
+        bb.note("Executing '%s' ..." % index_cmd)
+        result = subprocess.check_output(index_cmd,
+                                        stderr=subprocess.STDOUT,
+                                        shell=True)
+        result = result.decode('utf-8')
+    except subprocess.CalledProcessError as e:
+        return("Index creation command '%s' failed with return code "
+               '%d:\n%s' % (e.cmd, e.returncode, e.output.decode("utf-8")))
+    if result:
+        bb.note(result)
+    return None
+
+def create_rpm_index(d):
+    # Index RPMs
+    rpm_createrepo = bb.utils.which(os.getenv('PATH'), "createrepo")
+    index_cmds = []
+    archs = (d.getVar('ALL_MULTILIB_PACKAGE_ARCHS') or '').replace('-', '_')
+
+    for arch in archs.split():
+        rpm_dir = os.path.join(d.getVar('DEPLOY_DIR_RPM'), arch)
+        idx_path = os.path.join(d.getVar('WORKDIR'), 'rpm', arch)
+        db_path = os.path.join(d.getVar('WORKDIR'), 'rpmdb', arch)
+
+        if not os.path.isdir(rpm_dir):
+            continue
+        if os.path.exists(db_path):
+            bb.utils.remove(dbpath, True)
+
+        lockfilename = os.path.join(d.getVar('DEPLOY_DIR_RPM'), 'rpm.lock')
+        lf = bb.utils.lockfile(lockfilename, False)
+        oe.path.copyhardlinktree(rpm_dir, idx_path)
+        # Full indexes overload a 256MB image so reduce the number of rpms
+        # in the feed. Filter to p* since we use the psplash packages and
+        # this leaves some allarch and machine arch packages too.
+        bb.utils.remove(idx_path + "*/[a-oq-z]*.rpm")
+        bb.utils.unlockfile(lf)
+        cmd = '%s --dbpath %s --update -q %s' % (rpm_createrepo,
+                                                 db_path, idx_path)
+
+        # Create repodata
+        result = create_index(cmd)
+        if result:
+            bb.fatal('%s' % ('\n'.join(result)))
+
 def test_create_extract_dirs(d):
     install_path = d.getVar("TEST_INSTALL_TMP_DIR")
     package_path = d.getVar("TEST_PACKAGED_DIR")
diff --git a/meta/lib/oeqa/runtime/cases/smart.py b/meta/lib/oeqa/runtime/cases/smart.py
index dde1c4d..9b4d0d2 100644
--- a/meta/lib/oeqa/runtime/cases/smart.py
+++ b/meta/lib/oeqa/runtime/cases/smart.py
@@ -1,166 +1,142 @@
-import unittest
+import os
 import re
-import oe
 import subprocess
-from oeqa.oetest import oeRuntimeTest, skipModule
-from oeqa.utils.decorators import *
 from oeqa.utils.httpserver import HTTPService
 
-def setUpModule():
-    if not oeRuntimeTest.hasFeature("package-management"):
-        skipModule("Image doesn't have package management feature")
-    if not oeRuntimeTest.hasPackage("smartpm"):
-        skipModule("Image doesn't have smart installed")
-    if "package_rpm" != oeRuntimeTest.tc.d.getVar("PACKAGE_CLASSES").split()[0]:
-        skipModule("Rpm is not the primary package manager")
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.core.decorator.data import skipIfNotDataVar, skipIfNotFeature
+from oeqa.runtime.decorator.package import OEHasPackage
 
-class SmartTest(oeRuntimeTest):
+class SmartTest(OERuntimeTestCase):
 
-    @skipUnlessPassed('test_smart_help')
     def smart(self, command, expected = 0):
         command = 'smart %s' % command
         status, output = self.target.run(command, 1500)
         message = os.linesep.join([command, output])
         self.assertEqual(status, expected, message)
-        self.assertFalse("Cannot allocate memory" in output, message)
+        self.assertFalse('Cannot allocate memory' in output, message)
         return output
 
 class SmartBasicTest(SmartTest):
 
-    @testcase(716)
-    @skipUnlessPassed('test_ssh')
+    @skipIfNotFeature('package-management',
+                      'Test requires package-management to be in IMAGE_FEATURES')
+    @skipIfNotDataVar('PACKAGE_CLASSES', 'package_rpm',
+                      'RPM is not the primary package manager')
+    @OEHasPackage(['smartpm'])
+    @OETestID(716)
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
     def test_smart_help(self):
         self.smart('--help')
 
-    @testcase(968)
+    @OETestID(968)
+    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
     def test_smart_version(self):
         self.smart('--version')
 
-    @testcase(721)
+    @OETestID(721)
+    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
     def test_smart_info(self):
         self.smart('info python-smartpm')
 
-    @testcase(421)
+    @OETestID(421)
+    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
     def test_smart_query(self):
         self.smart('query python-smartpm')
 
-    @testcase(720)
+    @OETestID(720)
+    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
     def test_smart_search(self):
         self.smart('search python-smartpm')
 
-    @testcase(722)
+    @OETestID(722)
+    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
     def test_smart_stats(self):
         self.smart('stats')
 
 class SmartRepoTest(SmartTest):
 
     @classmethod
-    def create_index(self, arg):
-        index_cmd = arg
-        try:
-            bb.note("Executing '%s' ..." % index_cmd)
-            result = subprocess.check_output(index_cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
-        except subprocess.CalledProcessError as e:
-            return("Index creation command '%s' failed with return code %d:\n%s" %
-                    (e.cmd, e.returncode, e.output.decode("utf-8")))
-        if result:
-            bb.note(result)
-        return None
+    def setUpClass(cls):
+        cls.repolist = []
+        cls.repo_server = HTTPService(cls.tc.td['WORKDIR'],
+                                      cls.tc.target.server_ip)
+        cls.repo_server.start()
 
     @classmethod
-    def setUpClass(self):
-        self.repolist = []
-
-        # Index RPMs
-        rpm_createrepo = bb.utils.which(os.getenv('PATH'), "createrepo")
-        index_cmds = []
-        rpm_dirs_found = False
-        archs = (oeRuntimeTest.tc.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS') or "").replace('-', '_').split()
-        for arch in archs:
-            rpm_dir = os.path.join(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR_RPM'), arch)
-            idx_path = os.path.join(oeRuntimeTest.tc.d.getVar('WORKDIR'), 'rpm', arch)
-            db_path = os.path.join(oeRuntimeTest.tc.d.getVar('WORKDIR'), 'rpmdb', arch)
-            if not os.path.isdir(rpm_dir):
-                continue
-            if os.path.exists(db_path):
-                bb.utils.remove(dbpath, True)
-            lockfilename = oeRuntimeTest.tc.d.getVar('DEPLOY_DIR_RPM') + "/rpm.lock"
-            lf = bb.utils.lockfile(lockfilename, False)
-            oe.path.copyhardlinktree(rpm_dir, idx_path)
-            # Full indexes overload a 256MB image so reduce the number of rpms
-            # in the feed. Filter to p* since we use the psplash packages and
-            # this leaves some allarch and machine arch packages too.
-            bb.utils.remove(idx_path + "*/[a-oq-z]*.rpm")
-            bb.utils.unlockfile(lf)
-            index_cmds.append("%s --dbpath %s --update -q %s" % (rpm_createrepo, db_path, idx_path))
-            rpm_dirs_found = True
-         # Create repodata¬
-        result = oe.utils.multiprocess_exec(index_cmds, self.create_index)
-        if result:
-            bb.fatal('%s' % ('\n'.join(result)))
-        self.repo_server = HTTPService(oeRuntimeTest.tc.d.getVar('WORKDIR'), oeRuntimeTest.tc.target.server_ip)
-        self.repo_server.start()
-
-    @classmethod
-    def tearDownClass(self):
-        self.repo_server.stop()
-        for i in self.repolist:
-            oeRuntimeTest.tc.target.run('smart channel -y --remove '+str(i))
+    def tearDownClass(cls):
+        cls.repo_server.stop()
+        for repo in cls.repolist:
+            cls.tc.target.run('smart channel -y --remove %s' % repo)
 
-    @testcase(1143)
+    @OETestID(1143)
+    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
     def test_smart_channel(self):
         self.smart('channel', 1)
 
-    @testcase(719)
+    @OETestID(719)
+    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
     def test_smart_channel_add(self):
-        image_pkgtype = self.tc.d.getVar('IMAGE_PKGTYPE')
-        deploy_url = 'http://%s:%s/%s' %(self.target.server_ip, self.repo_server.port, image_pkgtype)
-        pkgarchs = self.tc.d.getVar('PACKAGE_ARCHS').replace("-","_").split()
-        for arch in os.listdir('%s/%s' % (self.repo_server.root_dir, image_pkgtype)):
+        image_pkgtype = self.tc.td['IMAGE_PKGTYPE']
+        deploy_url = 'http://%s:%s/%s' % (self.target.server_ip,
+                                          self.repo_server.port,
+                                          image_pkgtype)
+        pkgarchs = self.tc.td['PACKAGE_ARCHS'].replace("-","_").split()
+        archs = os.listdir(os.path.join(self.repo_server.root_dir,
+                                        image_pkgtype))
+        for arch in archs:
             if arch in pkgarchs:
-                self.smart('channel -y --add {a} type=rpm-md baseurl={u}/{a}'.format(a=arch, u=deploy_url))
+                cmd = ('channel -y --add {a} type=rpm-md '
+                      'baseurl={u}/{a}'.format(a=arch, u=deploy_url))
+                self.smart(cmd)
                 self.repolist.append(arch)
         self.smart('update')
 
-    @testcase(969)
+    @OETestID(969)
+    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
     def test_smart_channel_help(self):
         self.smart('channel --help')
 
-    @testcase(970)
+    @OETestID(970)
+    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
     def test_smart_channel_list(self):
         self.smart('channel --list')
 
-    @testcase(971)
+    @OETestID(971)
+    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
     def test_smart_channel_show(self):
         self.smart('channel --show')
 
-    @testcase(717)
+    @OETestID(717)
+    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
     def test_smart_channel_rpmsys(self):
         self.smart('channel --show rpmsys')
         self.smart('channel --disable rpmsys')
         self.smart('channel --enable rpmsys')
 
-    @testcase(1144)
-    @skipUnlessPassed('test_smart_channel_add')
+    @OETestID(1144)
+    @OETestDepends(['smart.SmartRepoTest.test_smart_channel_add'])
     def test_smart_install(self):
         self.smart('remove -y psplash-default')
         self.smart('install -y psplash-default')
 
-    @testcase(728)
-    @skipUnlessPassed('test_smart_install')
+    @OETestID(728)
+    @OETestDepends(['smart.SmartRepoTest.test_smart_install'])
     def test_smart_install_dependency(self):
         self.smart('remove -y psplash')
         self.smart('install -y psplash-default')
 
-    @testcase(723)
-    @skipUnlessPassed('test_smart_channel_add')
+    @OETestID(723)
+    @OETestDepends(['smart.SmartRepoTest.test_smart_channel_add'])
     def test_smart_install_from_disk(self):
         self.smart('remove -y psplash-default')
         self.smart('download psplash-default')
         self.smart('install -y ./psplash-default*')
 
-    @testcase(725)
-    @skipUnlessPassed('test_smart_channel_add')
+    @OETestID(725)
+    @OETestDepends(['smart.SmartRepoTest.test_smart_channel_add'])
     def test_smart_install_from_http(self):
         output = self.smart('download --urls psplash-default')
         url = re.search('(http://.*/psplash-default.*\.rpm)', output)
@@ -168,19 +144,20 @@ class SmartRepoTest(SmartTest):
         self.smart('remove -y psplash-default')
         self.smart('install -y %s' % url.group(0))
 
-    @testcase(729)
-    @skipUnlessPassed('test_smart_install')
+    @OETestID(729)
+    @OETestDepends(['smart.SmartRepoTest.test_smart_install'])
     def test_smart_reinstall(self):
         self.smart('reinstall -y psplash-default')
 
-    @testcase(727)
-    @skipUnlessPassed('test_smart_channel_add')
+    @OETestID(727)
+    @OETestDepends(['smart.SmartRepoTest.test_smart_channel_add'])
     def test_smart_remote_repo(self):
         self.smart('update')
         self.smart('install -y psplash')
         self.smart('remove -y psplash')
 
-    @testcase(726)
+    @OETestID(726)
+    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
     def test_smart_local_dir(self):
         self.target.run('mkdir /tmp/myrpmdir')
         self.smart('channel --add myrpmdir type=rpm-dir path=/tmp/myrpmdir -y')
@@ -198,7 +175,8 @@ class SmartRepoTest(SmartTest):
         self.smart('channel --remove myrpmdir -y')
         self.target.run("rm -rf /tmp/myrpmdir")
 
-    @testcase(718)
+    @OETestID(718)
+    @OETestDepends(['smart.SmartBasicTest.test_smart_help'])
     def test_smart_add_rpmdir(self):
         self.target.run('mkdir /tmp/myrpmdir')
         self.smart('channel --add myrpmdir type=rpm-dir path=/tmp/myrpmdir -y')
@@ -211,8 +189,8 @@ class SmartRepoTest(SmartTest):
         self.smart('channel --remove myrpmdir -y')
         self.target.run("rm -rf /tmp/myrpmdir")
 
-    @testcase(731)
-    @skipUnlessPassed('test_smart_channel_add')
+    @OETestID(731)
+    @OETestDepends(['smart.SmartRepoTest.test_smart_channel_add'])
     def test_smart_remove_package(self):
         self.smart('install -y psplash')
         self.smart('remove -y psplash')
-- 
2.1.4


