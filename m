Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CFBDE708C0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 08:53:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Aug 2014 01:54:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,831,1400050800"; d="scan'208";a="582373394"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 09 Aug 2014 01:53:58 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id 30B446A4007;
	Sat,  9 Aug 2014 01:53:20 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Aug 2014 13:59:09 +0300
Message-Id: <1407581949-12085-5-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1407581949-12085-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1407581949-12085-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: [PATCH 4/4] oeqa/sdk/: add sdk tests for sudoku, iptables and cvs
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
X-List-Received-Date: Sat, 09 Aug 2014 08:53:59 -0000

Add test modules for sdk tests.

NOTE: Original patch made by: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/sdk/__init__.py      |  3 +++
 meta/lib/oeqa/sdk/buildcvs.py      | 25 +++++++++++++++++++++++++
 meta/lib/oeqa/sdk/buildiptables.py | 26 ++++++++++++++++++++++++++
 meta/lib/oeqa/sdk/buildsudoku.py   | 22 ++++++++++++++++++++++
 4 files changed, 76 insertions(+)
 create mode 100644 meta/lib/oeqa/sdk/__init__.py
 create mode 100644 meta/lib/oeqa/sdk/buildcvs.py
 create mode 100644 meta/lib/oeqa/sdk/buildiptables.py
 create mode 100644 meta/lib/oeqa/sdk/buildsudoku.py

diff --git a/meta/lib/oeqa/sdk/__init__.py b/meta/lib/oeqa/sdk/__init__.py
new file mode 100644
index 0000000..4cf3fa7
--- /dev/null
+++ b/meta/lib/oeqa/sdk/__init__.py
@@ -0,0 +1,3 @@
+# Enable other layers to have tests in the same named directory
+from pkgutil import extend_path
+__path__ = extend_path(__path__, __name__)
diff --git a/meta/lib/oeqa/sdk/buildcvs.py b/meta/lib/oeqa/sdk/buildcvs.py
new file mode 100644
index 0000000..c7146fa
--- /dev/null
+++ b/meta/lib/oeqa/sdk/buildcvs.py
@@ -0,0 +1,25 @@
+from oeqa.oetest import oeSDKTest, skipModule
+from oeqa.utils.decorators import *
+from oeqa.utils.targetbuild import SDKBuildProject
+
+class BuildCvsTest(oeSDKTest):
+
+    @classmethod
+    def setUpClass(self):
+        self.project = SDKBuildProject(oeSDKTest.tc.sdktestdir + "/cvs/", oeSDKTest.tc.sdkenv, oeSDKTest.tc.d,
+                        "http://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13/cvs-1.12.13.tar.bz2")
+        self.project.download_archive()
+
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
diff --git a/meta/lib/oeqa/sdk/buildiptables.py b/meta/lib/oeqa/sdk/buildiptables.py
new file mode 100644
index 0000000..062e531
--- /dev/null
+++ b/meta/lib/oeqa/sdk/buildiptables.py
@@ -0,0 +1,26 @@
+from oeqa.oetest import oeSDKTest
+from oeqa.utils.decorators import *
+from oeqa.utils.targetbuild import SDKBuildProject
+
+
+class BuildIptablesTest(oeSDKTest):
+
+    @classmethod
+    def setUpClass(self):
+        self.project = SDKBuildProject(oeSDKTest.tc.sdktestdir + "/iptables/", oeSDKTest.tc.sdkenv, oeSDKTest.tc.d,
+                        "http://netfilter.org/projects/iptables/files/iptables-1.4.13.tar.bz2")
+        self.project.download_archive()
+
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
diff --git a/meta/lib/oeqa/sdk/buildsudoku.py b/meta/lib/oeqa/sdk/buildsudoku.py
new file mode 100644
index 0000000..6a60c76
--- /dev/null
+++ b/meta/lib/oeqa/sdk/buildsudoku.py
@@ -0,0 +1,22 @@
+from oeqa.oetest import oeSDKTest, skipModule
+from oeqa.utils.decorators import *
+from oeqa.utils.targetbuild import SDKBuildProject
+
+class SudokuTest(oeSDKTest):
+
+    @classmethod
+    def setUpClass(self):
+        self.project = SDKBuildProject(oeSDKTest.tc.sdktestdir + "/sudoku/", oeSDKTest.tc.sdkenv, oeSDKTest.tc.d,
+                        "http://downloads.sourceforge.net/project/sudoku-savant/sudoku-savant/sudoku-savant-1.3/sudoku-savant-1.3.tar.bz2")
+        self.project.download_archive()
+
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
1.8.3.2


