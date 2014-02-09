Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3E8246ED34
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2014 10:39:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Feb 2014 02:35:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,812,1384329600"; d="scan'208";a="480418440"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 09 Feb 2014 02:39:39 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id E35416A4007;
	Sun,  9 Feb 2014 02:39:31 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Feb 2014 12:39:30 +0200
Message-Id: <1391942371-23953-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] oeqa/utils: targetbuild: take proxy into account
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
X-List-Received-Date: Sun, 09 Feb 2014 10:39:39 -0000

A previous commit broke downloads
when proxies are involved, let's fix it.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/buildcvs.py      |  2 +-
 meta/lib/oeqa/runtime/buildiptables.py |  2 +-
 meta/lib/oeqa/runtime/buildsudoku.py   |  2 +-
 meta/lib/oeqa/utils/targetbuild.py     | 20 ++++++++++++++++++--
 4 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/runtime/buildcvs.py b/meta/lib/oeqa/runtime/buildcvs.py
index 9bf764d..f1fbf19 100644
--- a/meta/lib/oeqa/runtime/buildcvs.py
+++ b/meta/lib/oeqa/runtime/buildcvs.py
@@ -10,7 +10,7 @@ class BuildCvsTest(oeRuntimeTest):
 
     @classmethod
     def setUpClass(self):
-        self.project = TargetBuildProject(oeRuntimeTest.tc.target,
+        self.project = TargetBuildProject(oeRuntimeTest.tc.target, oeRuntimeTest.tc.d,
                         "http://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13/cvs-1.12.13.tar.bz2")
         self.project.download_archive()
 
diff --git a/meta/lib/oeqa/runtime/buildiptables.py b/meta/lib/oeqa/runtime/buildiptables.py
index 50faf5d..f6061a7 100644
--- a/meta/lib/oeqa/runtime/buildiptables.py
+++ b/meta/lib/oeqa/runtime/buildiptables.py
@@ -10,7 +10,7 @@ class BuildIptablesTest(oeRuntimeTest):
 
     @classmethod
     def setUpClass(self):
-        self.project = TargetBuildProject(oeRuntimeTest.tc.target,
+        self.project = TargetBuildProject(oeRuntimeTest.tc.target, oeRuntimeTest.tc.d,
                         "http://netfilter.org/projects/iptables/files/iptables-1.4.13.tar.bz2")
         self.project.download_archive()
 
diff --git a/meta/lib/oeqa/runtime/buildsudoku.py b/meta/lib/oeqa/runtime/buildsudoku.py
index 61dc1ff..a754f1d 100644
--- a/meta/lib/oeqa/runtime/buildsudoku.py
+++ b/meta/lib/oeqa/runtime/buildsudoku.py
@@ -10,7 +10,7 @@ class SudokuTest(oeRuntimeTest):
 
     @classmethod
     def setUpClass(self):
-        self.project = TargetBuildProject(oeRuntimeTest.tc.target,
+        self.project = TargetBuildProject(oeRuntimeTest.tc.target, oeRuntimeTest.tc.d,
                         "http://downloads.sourceforge.net/project/sudoku-savant/sudoku-savant/sudoku-savant-1.3/sudoku-savant-1.3.tar.bz2")
         self.project.download_archive()
 
diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index 77181b1..3229676 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -11,8 +11,9 @@ import subprocess
 
 class TargetBuildProject():
 
-    def __init__(self, target, uri, foldername=None):
+    def __init__(self, target, d, uri, foldername=None):
         self.target = target
+        self.d = d
         self.uri = uri
         self.targetdir = "~/"
         self.archive = os.path.basename(uri)
@@ -23,7 +24,22 @@ class TargetBuildProject():
 
     def download_archive(self):
 
-        subprocess.check_call("wget -O %s %s" % (self.localarchive, self.uri), shell=True)
+        exportvars = ['HTTP_PROXY', 'http_proxy',
+                      'HTTPS_PROXY', 'https_proxy',
+                      'FTP_PROXY', 'ftp_proxy',
+                      'FTPS_PROXY', 'ftps_proxy',
+                      'NO_PROXY', 'no_proxy',
+                      'ALL_PROXY', 'all_proxy',
+                      'SOCKS5_USER', 'SOCKS5_PASSWD']
+
+        cmd = ''
+        for var in exportvars:
+            val = self.d.getVar(var, True)
+            if val:
+                cmd = 'export ' + var + '=\"%s\"; %s' % (val, cmd)
+
+        cmd = cmd + "wget -O %s %s" % (self.localarchive, self.uri)
+        subprocess.check_call(cmd, shell=True)
 
         (status, output) = self.target.copy_to(self.localarchive, self.targetdir)
         if status != 0:
-- 
1.8.5.3


