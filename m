Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2AF6B989
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 15:32:44 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 23 Aug 2013 08:32:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="385514914"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2013 08:32:45 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 29D572C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 08:32:42 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 18:30:57 +0300
Message-Id: <b58ed117ebd7a8b543fb843c2f67e014e4b521ad.1377269486.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
Subject: [PATCH 17/21] oeqa/utils/targetbuild: change download to use bitbake's fetcher
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
X-List-Received-Date: Fri, 23 Aug 2013 15:32:45 -0000

Use bb.fetcher2 instead of running our own wget command
(helps with proxy too). Also no need to use the class attribute target,
use self.target, as the tests pass that to the class.
Also, we shouldn't clean the archive, now that it gets to DL_DIR.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/targetbuild.py | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index 7555add..9b2cf53 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -5,8 +5,8 @@
 # Provides a class for automating build tests for projects
 
 from oeqa.oetest import oeRuntimeTest
-from oeqa.utils.decorators import *
-import bb.process
+import bb.fetch2
+import bb.data
 import os
 import re
 
@@ -18,6 +18,9 @@ class TargetBuildProject():
         self.uri = uri
         self.targetdir = "/home/root/"
 
+        self.localdata = bb.data.createCopy(oeRuntimeTest.tc.d)
+        bb.data.update_data(self.localdata)
+
         if not foldername:
             self.archive = os.path.basename(uri)
             self.fname = re.sub(r'.tar.bz2|tar.gz$', '', self.archive)
@@ -25,22 +28,20 @@ class TargetBuildProject():
             self.fname = foldername
 
     def download_archive(self):
-        wgetcmd = oeRuntimeTest.tc.d.getVar('FETCHCMD_wget', True).split()
-        self.testdir = oeRuntimeTest.tc.d.getVar('TEST_LOG_DIR', True)
 
         try:
-            output = bb.process.run(wgetcmd + ['-P', self.testdir, self.uri])[0]
-        except bb.process.CmdError:
-            raise Exception("Failed to download archive, output: %s" % output)
-
-        (status, output) = oeRuntimeTest.tc.target.copy_to(
-            os.path.join(self.testdir, self.archive),
-            self.targetdir)
+            self.localdata.delVar("BB_STRICT_CHECKSUM")
+            fetcher = bb.fetch2.Fetch([self.uri], self.localdata)
+            fetcher.download()
+            self.localarchive = fetcher.localpath(self.uri)
+        except bb.fetch2.BBFetchException:
+            raise Exception("Failed to download archive: %s" % self.uri)
+
+        (status, output) = self.target.copy_to(self.localarchive, self.targetdir)
         if status != 0:
             raise Exception("Failed to copy archive to target, output: %s" % output)
 
-        (status, output) = oeRuntimeTest.tc.target.run(
-            'tar xf %s%s -C %s' % (self.targetdir, self.archive, self.targetdir))
+        (status, output) = self.target.run('tar xf %s%s -C %s' % (self.targetdir, self.archive, self.targetdir))
         if status != 0:
             raise Exception("Failed to extract archive, output: %s" % output)
 
@@ -59,8 +60,4 @@ class TargetBuildProject():
         return self.target.run('cd %s; make install' % self.targetdir, 0)[0]
 
     def clean(self):
-        self.target.run('rm -r %s*' % self.targetdir)
-        try:
-            bb.process.run(['rm', '-rf', os.path.join(self.testdir, self.archive)])
-        except bb.process.CmdError:
-            bb.note("Failed to remove archive")
+        self.target.run('rm -rf %s' % self.targetdir)
-- 
1.8.3.1


