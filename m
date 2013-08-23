Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 163EC6B9A2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 15:32:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 23 Aug 2013 08:32:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="385514886"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2013 08:32:40 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id B74562C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 08:32:38 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 18:30:53 +0300
Message-Id: <8dcb7896d7d74ed53506cda1daab92631d600f4f.1377269485.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
Subject: [PATCH 13/21] lib/oeqa/runtime: add iptables, cvs and sudoku projects build tests on target
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
X-List-Received-Date: Fri, 23 Aug 2013 15:32:40 -0000

From: Mihai Prica <mihai.prica@intel.com>

Downloads iptables/cvs/sudoku-savant sources and builds them on target.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/buildcvs.py      | 30 ++++++++++++++++++++++++++++++
 meta/lib/oeqa/runtime/buildiptables.py | 30 ++++++++++++++++++++++++++++++
 meta/lib/oeqa/runtime/buildsudoku.py   | 27 +++++++++++++++++++++++++++
 3 files changed, 87 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/buildcvs.py
 create mode 100644 meta/lib/oeqa/runtime/buildiptables.py
 create mode 100644 meta/lib/oeqa/runtime/buildsudoku.py

diff --git a/meta/lib/oeqa/runtime/buildcvs.py b/meta/lib/oeqa/runtime/buildcvs.py
new file mode 100644
index 0000000..9bf764d
--- /dev/null
+++ b/meta/lib/oeqa/runtime/buildcvs.py
@@ -0,0 +1,30 @@
+from oeqa.oetest import oeRuntimeTest
+from oeqa.utils.decorators import *
+from oeqa.utils.targetbuild import TargetBuildProject
+
+def setUpModule():
+    if not oeRuntimeTest.hasFeature("tools-sdk"):
+        skipModule("Image doesn't have tools-sdk in IMAGE_FEATURES")
+
+class BuildCvsTest(oeRuntimeTest):
+
+    @classmethod
+    def setUpClass(self):
+        self.project = TargetBuildProject(oeRuntimeTest.tc.target,
+                        "http://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13/cvs-1.12.13.tar.bz2")
+        self.project.download_archive()
+
+    @skipUnlessPassed("test_ssh")
+    def test_cvs(self):
+        self.assertEqual(self.project.run_configure(), 0,
+                        msg="Running configure failed")
+
+        self.assertEqual(self.project.run_make(), 0,
+                        msg="Running make failed")
+
+        self.assertEqual(self.project.run_install(), 0,
+                        msg="Running make install failed")
+
+    @classmethod
+    def tearDownClass(self):
+        self.project.clean()
diff --git a/meta/lib/oeqa/runtime/buildiptables.py b/meta/lib/oeqa/runtime/buildiptables.py
new file mode 100644
index 0000000..50faf5d
--- /dev/null
+++ b/meta/lib/oeqa/runtime/buildiptables.py
@@ -0,0 +1,30 @@
+from oeqa.oetest import oeRuntimeTest
+from oeqa.utils.decorators import *
+from oeqa.utils.targetbuild import TargetBuildProject
+
+def setUpModule():
+    if not oeRuntimeTest.hasFeature("tools-sdk"):
+        skipModule("Image doesn't have tools-sdk in IMAGE_FEATURES")
+
+class BuildIptablesTest(oeRuntimeTest):
+
+    @classmethod
+    def setUpClass(self):
+        self.project = TargetBuildProject(oeRuntimeTest.tc.target,
+                        "http://netfilter.org/projects/iptables/files/iptables-1.4.13.tar.bz2")
+        self.project.download_archive()
+
+    @skipUnlessPassed("test_ssh")
+    def test_iptables(self):
+        self.assertEqual(self.project.run_configure(), 0,
+                        msg="Running configure failed")
+
+        self.assertEqual(self.project.run_make(), 0,
+                        msg="Running make failed")
+
+        self.assertEqual(self.project.run_install(), 0,
+                        msg="Running make install failed")
+
+    @classmethod
+    def tearDownClass(self):
+        self.project.clean()
diff --git a/meta/lib/oeqa/runtime/buildsudoku.py b/meta/lib/oeqa/runtime/buildsudoku.py
new file mode 100644
index 0000000..61dc1ff
--- /dev/null
+++ b/meta/lib/oeqa/runtime/buildsudoku.py
@@ -0,0 +1,27 @@
+from oeqa.oetest import oeRuntimeTest
+from oeqa.utils.decorators import *
+from oeqa.utils.targetbuild import TargetBuildProject
+
+def setUpModule():
+    if not oeRuntimeTest.hasFeature("tools-sdk"):
+        skipModule("Image doesn't have tools-sdk in IMAGE_FEATURES")
+
+class SudokuTest(oeRuntimeTest):
+
+    @classmethod
+    def setUpClass(self):
+        self.project = TargetBuildProject(oeRuntimeTest.tc.target,
+                        "http://downloads.sourceforge.net/project/sudoku-savant/sudoku-savant/sudoku-savant-1.3/sudoku-savant-1.3.tar.bz2")
+        self.project.download_archive()
+
+    @skipUnlessPassed("test_ssh")
+    def test_sudoku(self):
+        self.assertEqual(self.project.run_configure(), 0,
+                        msg="Running configure failed")
+
+        self.assertEqual(self.project.run_make(), 0,
+                        msg="Running make failed")
+
+    @classmethod
+    def tearDownClass(self):
+        self.project.clean()
-- 
1.8.3.1


