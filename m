Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 8A98A6E877
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 12:23:02 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Jan 2014 04:23:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,741,1384329600"; d="scan'208";a="406981437"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 29 Jan 2014 04:23:02 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id 38C8E6A4093;
	Wed, 29 Jan 2014 04:22:55 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 14:24:04 +0200
Message-Id: <1390998244-25560-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] oeqa/runtime: drop restartTarget method
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
X-List-Received-Date: Wed, 29 Jan 2014 12:23:03 -0000

Restart is a property of a specific target, not
of a test class, should a test really need to restart
the target the direct method should be called.
Also some tests used this to enforce more ram, which
makes sense only for qemu targets only (and the inital
reason this was needed isn't valid anymore, qemu machines had
the default ram size bumped a while ago).

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/oetest.py                | 4 ----
 meta/lib/oeqa/runtime/buildcvs.py      | 2 --
 meta/lib/oeqa/runtime/buildiptables.py | 2 --
 meta/lib/oeqa/runtime/buildsudoku.py   | 2 --
 4 files changed, 10 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index ed545b4..0db6cb8 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -78,10 +78,6 @@ class oeRuntimeTest(oeTest):
         self.target = oeRuntimeTest.tc.target
         super(oeRuntimeTest, self).__init__(methodName)
 
-    @classmethod
-    def restartTarget(self,params=None):
-        oeRuntimeTest.tc.target.restart(params)
-
 
 def getmodule(pos=2):
     # stack returns a list of tuples containg frame information
diff --git a/meta/lib/oeqa/runtime/buildcvs.py b/meta/lib/oeqa/runtime/buildcvs.py
index f024dfa..9bf764d 100644
--- a/meta/lib/oeqa/runtime/buildcvs.py
+++ b/meta/lib/oeqa/runtime/buildcvs.py
@@ -10,7 +10,6 @@ class BuildCvsTest(oeRuntimeTest):
 
     @classmethod
     def setUpClass(self):
-        self.restartTarget("-m 512")
         self.project = TargetBuildProject(oeRuntimeTest.tc.target,
                         "http://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13/cvs-1.12.13.tar.bz2")
         self.project.download_archive()
@@ -29,4 +28,3 @@ class BuildCvsTest(oeRuntimeTest):
     @classmethod
     def tearDownClass(self):
         self.project.clean()
-        self.restartTarget()
diff --git a/meta/lib/oeqa/runtime/buildiptables.py b/meta/lib/oeqa/runtime/buildiptables.py
index 88ece3b..50faf5d 100644
--- a/meta/lib/oeqa/runtime/buildiptables.py
+++ b/meta/lib/oeqa/runtime/buildiptables.py
@@ -10,7 +10,6 @@ class BuildIptablesTest(oeRuntimeTest):
 
     @classmethod
     def setUpClass(self):
-        self.restartTarget("-m 512")
         self.project = TargetBuildProject(oeRuntimeTest.tc.target,
                         "http://netfilter.org/projects/iptables/files/iptables-1.4.13.tar.bz2")
         self.project.download_archive()
@@ -29,4 +28,3 @@ class BuildIptablesTest(oeRuntimeTest):
     @classmethod
     def tearDownClass(self):
         self.project.clean()
-        self.restartTarget()
diff --git a/meta/lib/oeqa/runtime/buildsudoku.py b/meta/lib/oeqa/runtime/buildsudoku.py
index 0a7306d..61dc1ff 100644
--- a/meta/lib/oeqa/runtime/buildsudoku.py
+++ b/meta/lib/oeqa/runtime/buildsudoku.py
@@ -10,7 +10,6 @@ class SudokuTest(oeRuntimeTest):
 
     @classmethod
     def setUpClass(self):
-        self.restartTarget("-m 512")
         self.project = TargetBuildProject(oeRuntimeTest.tc.target,
                         "http://downloads.sourceforge.net/project/sudoku-savant/sudoku-savant/sudoku-savant-1.3/sudoku-savant-1.3.tar.bz2")
         self.project.download_archive()
@@ -26,4 +25,3 @@ class SudokuTest(oeRuntimeTest):
     @classmethod
     def tearDownClass(self):
         self.project.clean()
-        self.restartTarget()
-- 
1.8.5.3


