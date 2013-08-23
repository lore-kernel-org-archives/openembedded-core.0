Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 71A866BA15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 18:04:46 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2013 11:04:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,943,1367996400"; d="scan'208";a="285943321"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2013 11:04:45 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id DF9AA2C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 11:04:42 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 21:04:27 +0300
Message-Id: <5db3f4200c4463ce44fac29da3345e5472390a1f.1377280794.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 17/19] lib/oeqa/runtime: add iptables, cvs and sudoku projects build tests on target
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
X-List-Received-Date: Fri, 23 Aug 2013 18:04:46 -0000

From: Mihai Prica <mihai.prica@intel.com>

Downloads iptables/cvs/sudoku-savant sources and builds them on target.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/buildcvs.py      | 32 ++++++++++++++++++++++++++++++++
 meta/lib/oeqa/runtime/buildiptables.py | 32 ++++++++++++++++++++++++++++++++
 meta/lib/oeqa/runtime/buildsudoku.py   | 29 +++++++++++++++++++++++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/buildcvs.py
 create mode 100644 meta/lib/oeqa/runtime/buildiptables.py
 create mode 100644 meta/lib/oeqa/runtime/buildsudoku.py

diff --git a/meta/lib/oeqa/runtime/buildcvs.py b/meta/lib/oeqa/runtime/buildcvs.py
new file mode 100644
index 0000000..f024dfa
--- /dev/null
+++ b/meta/lib/oeqa/runtime/buildcvs.py
@@ -0,0 +1,32 @@
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
+        self.restartTarget("-m 512")
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
+        self.restartTarget()
diff --git a/meta/lib/oeqa/runtime/buildiptables.py b/meta/lib/oeqa/runtime/buildiptables.py
new file mode 100644
index 0000000..88ece3b
--- /dev/null
+++ b/meta/lib/oeqa/runtime/buildiptables.py
@@ -0,0 +1,32 @@
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
+        self.restartTarget("-m 512")
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
+        self.restartTarget()
diff --git a/meta/lib/oeqa/runtime/buildsudoku.py b/meta/lib/oeqa/runtime/buildsudoku.py
new file mode 100644
index 0000000..0a7306d
--- /dev/null
+++ b/meta/lib/oeqa/runtime/buildsudoku.py
@@ -0,0 +1,29 @@
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
+        self.restartTarget("-m 512")
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
+        self.restartTarget()
-- 
1.8.3.1


