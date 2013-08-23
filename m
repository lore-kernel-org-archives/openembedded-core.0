Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2199A6BA02
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 15:32:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Aug 2013 08:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="367441468"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 23 Aug 2013 08:32:49 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id BF92F2C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 08:32:47 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 18:31:01 +0300
Message-Id: <6d7bb8409eb99b415d2500c5146a6b0c7eac2e7f.1377269486.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
Subject: [PATCH 21/21] lib/oeqa: add a restart method for base class and use it for build tests
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
X-List-Received-Date: Fri, 23 Aug 2013 15:32:49 -0000

This can be used by tests to restart the target
(useful for passing extra qemuparams, like more RAM)

Build projects like cvs/iptables can take 15min+ on
qemu targets with the default RAM, and sudoku fails
with out of memory, so use this there.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/oetest.py                | 7 +++++++
 meta/lib/oeqa/runtime/buildcvs.py      | 2 ++
 meta/lib/oeqa/runtime/buildiptables.py | 2 ++
 meta/lib/oeqa/runtime/buildsudoku.py   | 2 ++
 4 files changed, 13 insertions(+)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index e694c0b..c9dc5dc 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -81,6 +81,13 @@ class oeRuntimeTest(unittest.TestCase):
         else:
             return False
 
+    @classmethod
+    def restartTarget(self,params=None):
+
+        if oeRuntimeTest.tc.qemu.restart(params):
+            oeRuntimeTest.tc.target.host = oeRuntimeTest.tc.qemu.ip
+        else:
+            raise Exception("Restarting target failed")
 
 
 def getmodule(pos=2):
diff --git a/meta/lib/oeqa/runtime/buildcvs.py b/meta/lib/oeqa/runtime/buildcvs.py
index 9bf764d..f024dfa 100644
--- a/meta/lib/oeqa/runtime/buildcvs.py
+++ b/meta/lib/oeqa/runtime/buildcvs.py
@@ -10,6 +10,7 @@ class BuildCvsTest(oeRuntimeTest):
 
     @classmethod
     def setUpClass(self):
+        self.restartTarget("-m 512")
         self.project = TargetBuildProject(oeRuntimeTest.tc.target,
                         "http://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13/cvs-1.12.13.tar.bz2")
         self.project.download_archive()
@@ -28,3 +29,4 @@ class BuildCvsTest(oeRuntimeTest):
     @classmethod
     def tearDownClass(self):
         self.project.clean()
+        self.restartTarget()
diff --git a/meta/lib/oeqa/runtime/buildiptables.py b/meta/lib/oeqa/runtime/buildiptables.py
index 50faf5d..88ece3b 100644
--- a/meta/lib/oeqa/runtime/buildiptables.py
+++ b/meta/lib/oeqa/runtime/buildiptables.py
@@ -10,6 +10,7 @@ class BuildIptablesTest(oeRuntimeTest):
 
     @classmethod
     def setUpClass(self):
+        self.restartTarget("-m 512")
         self.project = TargetBuildProject(oeRuntimeTest.tc.target,
                         "http://netfilter.org/projects/iptables/files/iptables-1.4.13.tar.bz2")
         self.project.download_archive()
@@ -28,3 +29,4 @@ class BuildIptablesTest(oeRuntimeTest):
     @classmethod
     def tearDownClass(self):
         self.project.clean()
+        self.restartTarget()
diff --git a/meta/lib/oeqa/runtime/buildsudoku.py b/meta/lib/oeqa/runtime/buildsudoku.py
index 61dc1ff..0a7306d 100644
--- a/meta/lib/oeqa/runtime/buildsudoku.py
+++ b/meta/lib/oeqa/runtime/buildsudoku.py
@@ -10,6 +10,7 @@ class SudokuTest(oeRuntimeTest):
 
     @classmethod
     def setUpClass(self):
+        self.restartTarget("-m 512")
         self.project = TargetBuildProject(oeRuntimeTest.tc.target,
                         "http://downloads.sourceforge.net/project/sudoku-savant/sudoku-savant/sudoku-savant-1.3/sudoku-savant-1.3.tar.bz2")
         self.project.download_archive()
@@ -25,3 +26,4 @@ class SudokuTest(oeRuntimeTest):
     @classmethod
     def tearDownClass(self):
         self.project.clean()
+        self.restartTarget()
-- 
1.8.3.1


