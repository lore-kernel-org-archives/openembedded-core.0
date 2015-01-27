Return-Path: <george.l.musat@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D0B64718E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 16:10:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jan 2015 08:08:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,475,1418112000"; d="scan'208";a="676809336"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 27 Jan 2015 08:09:00 -0800
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 4E38D2C8002;
	Tue, 27 Jan 2015 08:08:52 -0800 (PST)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jan 2015 18:08:08 +0200
Message-Id: <1422374889-6141-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 1/2] oeqa/smart: Added some new test cases
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
X-List-Received-Date: Tue, 27 Jan 2015 16:10:07 -0000

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/smart.py | 48 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart.py
index 3b49314..dba3bd6 100644
--- a/meta/lib/oeqa/runtime/smart.py
+++ b/meta/lib/oeqa/runtime/smart.py
@@ -53,12 +53,15 @@ class SmartRepoTest(SmartTest):
 
     @classmethod
     def setUpClass(self):
+        self.repolist = []
         self.repo_server = HTTPService(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True), oeRuntimeTest.tc.target.server_ip)
         self.repo_server.start()
 
     @classmethod
     def tearDownClass(self):
         self.repo_server.stop()
+        for i in self.repolist:
+            oeRuntimeTest.tc.target.run('smart channel -y --remove '+str(i))
 
     def test_smart_channel(self):
         self.smart('channel', 1)
@@ -71,6 +74,7 @@ class SmartRepoTest(SmartTest):
         for arch in os.listdir('%s/%s' % (self.repo_server.root_dir, image_pkgtype)):
             if arch in pkgarchs:
                 self.smart('channel -y --add {a} type=rpm-md baseurl={u}/{a}'.format(a=arch, u=deploy_url))
+                self.repolist.append(arch)
         self.smart('update')
 
     def test_smart_channel_help(self):
@@ -119,3 +123,47 @@ class SmartRepoTest(SmartTest):
     @skipUnlessPassed('test_smart_install')
     def test_smart_reinstall(self):
         self.smart('reinstall -y psplash-default')
+
+    @testcase(727)
+    @skipUnlessPassed('test_smart_channel_add')
+    def test_smart_remote_repo(self):
+        self.smart('update')
+        self.smart('install -y psplash')
+        self.smart('remove -y psplash')
+
+    @testcase(726)
+    def test_smart_local_dir(self):
+        self.target.run('mkdir /tmp/myrpmdir')
+        self.smart('channel --add myrpmdir type=rpm-dir path=/tmp/myrpmdir -y')
+        self.target.run('cd /tmp/myrpmdir')
+        self.smart('download psplash')
+        output = self.smart('channel --list')
+        for i in output.split("\n"):
+            if ("rpmsys" != str(i)) and ("myrpmdir" != str(i)):
+                self.smart('channel --disable '+str(i))
+        self.target.run('cd /home/root')
+        self.smart('install psplash')
+        for i in output.split("\n"):
+            if ("rpmsys" != str(i)) and ("myrpmdir" != str(i)):
+                self.smart('channel --enable '+str(i))
+        self.smart('channel --remove myrpmdir -y')
+        self.target.run("rm -rf /tmp/myrpmdir")
+
+    @testcase(718)
+    def test_smart_add_rpmdir(self):
+        self.target.run('mkdir /tmp/myrpmdir')
+        self.smart('channel --add myrpmdir type=rpm-dir path=/tmp/myrpmdir -y')
+        self.smart('channel --disable myrpmdir -y')
+        output = self.smart('channel --show myrpmdir')
+        self.assertTrue("disabled = yes" in output, msg="Failed to disable rpm dir")
+        self.smart('channel --enable  myrpmdir -y')
+        output = self.smart('channel --show myrpmdir')
+        self.assertFalse("disabled = yes" in output, msg="Failed to enable rpm dir")
+        self.smart('channel --remove myrpmdir -y')
+        self.target.run("rm -rf /tmp/myrpmdir")
+
+    @testcase(731)
+    @skipUnlessPassed('test_smart_channel_add')
+    def test_smart_remove_package(self):
+        self.smart('install -y psplash')
+        self.smart('remove -y psplash')
\ No newline at end of file
-- 
2.1.0


