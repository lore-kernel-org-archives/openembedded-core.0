Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AF63C6BA11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 18:04:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Aug 2013 11:04:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,943,1367996400"; d="scan'208";a="391068620"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 23 Aug 2013 11:04:41 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 75C4D2C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 11:04:39 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 21:04:24 +0300
Message-Id: <21c391d33411c0e0c74ad13ef15096c0deb3f63f.1377280794.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 14/19] lib/oeqa/runtime: smart: add new smart tests
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
X-List-Received-Date: Fri, 23 Aug 2013 18:04:41 -0000

From: Mihai Lindner <mihaix.lindner@linux.intel.com>

Add class to be inherited by smart tests, along with more basic tests and tests
using a rpm repository.

Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/smart.py | 102 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 91 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart.py
index 0b03a30..4ea2699 100644
--- a/meta/lib/oeqa/runtime/smart.py
+++ b/meta/lib/oeqa/runtime/smart.py
@@ -1,6 +1,7 @@
 import unittest
 from oeqa.oetest import oeRuntimeTest
 from oeqa.utils.decorators import *
+from oeqa.utils.httpserver import HTTPService
 
 def setUpModule():
     if not oeRuntimeTest.hasFeature("package-management"):
@@ -8,21 +9,100 @@ def setUpModule():
     if not oeRuntimeTest.hasPackage("smart"):
         skipModule("Image doesn't have smart installed")
 
-class SmartHelpTest(oeRuntimeTest):
+class SmartTest(oeRuntimeTest):
+
+    longMessage = True
+
+    @skipUnlessPassed('test_smart_help')
+    def smart(self, command, expected = 0):
+        command = 'smart %s' % command
+        status, output = self.target.run(command)
+        message = os.linesep.join([command, output])
+        self.assertEqual(status, expected, message)
+        return output
+
+class SmartBasicTest(SmartTest):
 
     @skipUnlessPassed('test_ssh')
     def test_smart_help(self):
-        status = self.target.run('smart --help')[0]
-        self.assertEqual(status, 0)
+        self.smart('--help')
 
-class SmartQueryTest(oeRuntimeTest):
+    def test_smart_version(self):
+        self.smart('--version')
+
+    def test_smart_info(self):
+        self.smart('info python-smartpm')
 
-    @skipUnlessPassed('test_smart_help')
     def test_smart_query(self):
-        (status, output) = self.target.run('smart query rpm')
-        self.assertEqual(status, 0, msg="smart query failed, output: %s" % output)
+        self.smart('query python-smartpm')
 
-    @skipUnlessPassed('test_smart_query')
-    def test_smart_info(self):
-        (status, output) = self.target.run('smart info rpm')
-        self.assertEqual(status, 0, msg="smart info rpm failed, output: %s" % output)
+    def test_smart_search(self):
+        self.smart('search python-smartpm')
+
+    def test_smart_stats(self):
+        self.smart('stats')
+
+class SmartRepoTest(SmartTest):
+
+    @classmethod
+    def setUpClass(self):
+        self.repo_server = HTTPService(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True))
+        self.repo_server.start()
+
+    @classmethod
+    def tearDownClass(self):
+        self.repo_server.stop()
+
+    def test_smart_channel(self):
+        self.smart('channel', 1)
+
+    def test_smart_channel_add(self):
+        image_pkgtype = self.tc.d.getVar('IMAGE_PKGTYPE', True)
+        deploy_url = 'http://%s:%s/%s' %(self.tc.qemu.host_ip, self.repo_server.port, image_pkgtype)
+        for arch in os.listdir('%s/%s' % (self.repo_server.root_dir, image_pkgtype)):
+            self.smart('channel -y --add {a} type=rpm-md baseurl={u}/{a}'.format(a=arch, u=deploy_url))
+        self.smart('update')
+
+    def test_smart_channel_help(self):
+        self.smart('channel --help')
+
+    def test_smart_channel_list(self):
+        self.smart('channel --list')
+
+    def test_smart_channel_show(self):
+        self.smart('channel --show')
+
+    def test_smart_channel_rpmsys(self):
+        self.smart('channel --show rpmsys')
+        self.smart('channel --disable rpmsys')
+        self.smart('channel --enable rpmsys')
+
+    @skipUnlessPassed('test_smart_channel_add')
+    def test_smart_install(self):
+        self.smart('remove -y psplash-default')
+        self.smart('install -y psplash-default')
+
+    @skipUnlessPassed('test_smart_install')
+    def test_smart_install_dependency(self):
+        self.smart('remove -y psplash')
+        self.smart('install -y psplash-default')
+
+    @skipUnlessPassed('test_smart_channel_add')
+    def test_smart_install_from_disk(self):
+        self.smart('remove -y psplash-default')
+        self.smart('download psplash-default')
+        self.smart('install -y ./psplash-default*')
+
+    @skipUnlessPassed('test_smart_channel_add')
+    def test_smart_install_from_http(self):
+        url = 'http://'
+        output = self.smart('download --urls psplash-default')
+        for line in output.splitlines():
+            if line.startswith(url):
+                url = line
+        self.smart('remove -y psplash-default')
+        self.smart('install -y %s' % url)
+
+    @skipUnlessPassed('test_smart_install')
+    def test_smart_reinstall(self):
+        self.smart('reinstall -y psplash-default')
-- 
1.8.3.1


