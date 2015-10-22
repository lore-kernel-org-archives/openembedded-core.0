Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id D83D077156
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 471B5600F80
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:37 +0100
Message-Id: <13282223b07787a92c251f89251e8a49a0e4e3eb.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 16/52] oeqa/runtime: Fix setUp and tearDown methods
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:21 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Currently some of the runtime test overwrites
the setUp and tearDown methods provided by
oeRuntimeTest, this will avoid some checks
required when running the test suit.

This patch changes the setUp and tearDown methods
for their local counterparts, so when these
tests are called, it will run the parent setUp
and tearDown and also the local ones.

[YOCTO #8465]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/runtime/_ptest.py       | 2 +-
 meta/lib/oeqa/runtime/date.py         | 4 ++--
 meta/lib/oeqa/runtime/kernelmodule.py | 4 ++--
 meta/lib/oeqa/runtime/scanelf.py      | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/runtime/_ptest.py b/meta/lib/oeqa/runtime/_ptest.py
index 81c9c43..0621028 100644
--- a/meta/lib/oeqa/runtime/_ptest.py
+++ b/meta/lib/oeqa/runtime/_ptest.py
@@ -98,7 +98,7 @@ class PtestRunnerTest(oeRuntimeTest):
 
         return complementary_pkgs.split()
 
-    def setUp(self):
+    def setUpLocal(self):
         self.ptest_log = os.path.join(oeRuntimeTest.tc.d.getVar("TEST_LOG_DIR",True), "ptest-%s.log" % oeRuntimeTest.tc.d.getVar('DATETIME', True))
 
     @skipUnlessPassed('test_ssh')
diff --git a/meta/lib/oeqa/runtime/date.py b/meta/lib/oeqa/runtime/date.py
index 3a8fe84..447987e 100644
--- a/meta/lib/oeqa/runtime/date.py
+++ b/meta/lib/oeqa/runtime/date.py
@@ -4,11 +4,11 @@ import re
 
 class DateTest(oeRuntimeTest):
 
-    def setUp(self):
+    def setUpLocal(self):
         if oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager", True) == "systemd":
             self.target.run('systemctl stop systemd-timesyncd')
 
-    def tearDown(self):
+    def tearDownLocal(self):
         if oeRuntimeTest.tc.d.getVar("VIRTUAL-RUNTIME_init_manager", True) == "systemd":
             self.target.run('systemctl start systemd-timesyncd')
 
diff --git a/meta/lib/oeqa/runtime/kernelmodule.py b/meta/lib/oeqa/runtime/kernelmodule.py
index 2e81720..38ca184 100644
--- a/meta/lib/oeqa/runtime/kernelmodule.py
+++ b/meta/lib/oeqa/runtime/kernelmodule.py
@@ -10,7 +10,7 @@ def setUpModule():
 
 class KernelModuleTest(oeRuntimeTest):
 
-    def setUp(self):
+    def setUpLocal(self):
         self.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "hellomod.c"), "/tmp/hellomod.c")
         self.target.copy_to(os.path.join(oeRuntimeTest.tc.filesdir, "hellomod_makefile"), "/tmp/Makefile")
 
@@ -30,5 +30,5 @@ class KernelModuleTest(oeRuntimeTest):
             (status, output) = self.target.run(cmd, 900)
             self.assertEqual(status, 0, msg="\n".join([cmd, output]))
 
-    def tearDown(self):
+    def tearDownLocal(self):
         self.target.run('rm -f /tmp/Makefile /tmp/hellomod.c')
diff --git a/meta/lib/oeqa/runtime/scanelf.py b/meta/lib/oeqa/runtime/scanelf.py
index 43a024a..67e02ff 100644
--- a/meta/lib/oeqa/runtime/scanelf.py
+++ b/meta/lib/oeqa/runtime/scanelf.py
@@ -8,7 +8,7 @@ def setUpModule():
 
 class ScanelfTest(oeRuntimeTest):
 
-    def setUp(self):
+    def setUpLocal(self):
         self.scancmd = 'scanelf --quiet --recursive --mount --ldpath --path'
 
     @testcase(966)
-- 
2.1.4


