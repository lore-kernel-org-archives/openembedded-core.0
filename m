Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 40E916D8F6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 19:21:30 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Feb 2014 11:21:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,774,1384329600"; d="scan'208";a="338528849"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Feb 2014 11:21:30 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id CAE346A4093
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 11:21:23 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2014 21:22:31 +0200
Message-Id: <ec9a0948f200b6ee5b20ebfa0fc62d0efc0b969e.1391454072.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391454072.git.stefanx.stanacar@intel.com>
References: <cover.1391454072.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1391454072.git.stefanx.stanacar@intel.com>
References: <cover.1391454072.git.stefanx.stanacar@intel.com>
Subject: [PATCH 3/3] oeqa/utils: targetbuild: don't use bb.fetch anymore
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
X-List-Received-Date: Mon, 03 Feb 2014 19:21:30 -0000

When running tests outside of the build system we can't use
bb.fetch anymore. It was nice but tests and their modules
need to rely on the data storage only as that gets exported.
This module is used by the oeqa/runtime/build* tests.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/targetbuild.py | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index 9b2cf53..77181b1 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -4,11 +4,9 @@
 
 # Provides a class for automating build tests for projects
 
-from oeqa.oetest import oeRuntimeTest
-import bb.fetch2
-import bb.data
 import os
 import re
+import subprocess
 
 
 class TargetBuildProject():
@@ -16,26 +14,16 @@ class TargetBuildProject():
     def __init__(self, target, uri, foldername=None):
         self.target = target
         self.uri = uri
-        self.targetdir = "/home/root/"
-
-        self.localdata = bb.data.createCopy(oeRuntimeTest.tc.d)
-        bb.data.update_data(self.localdata)
-
-        if not foldername:
-            self.archive = os.path.basename(uri)
-            self.fname = re.sub(r'.tar.bz2|tar.gz$', '', self.archive)
-        else:
+        self.targetdir = "~/"
+        self.archive = os.path.basename(uri)
+        self.localarchive = "/tmp/" + self.archive
+        self.fname = re.sub(r'.tar.bz2|tar.gz$', '', self.archive)
+        if foldername:
             self.fname = foldername
 
     def download_archive(self):
 
-        try:
-            self.localdata.delVar("BB_STRICT_CHECKSUM")
-            fetcher = bb.fetch2.Fetch([self.uri], self.localdata)
-            fetcher.download()
-            self.localarchive = fetcher.localpath(self.uri)
-        except bb.fetch2.BBFetchException:
-            raise Exception("Failed to download archive: %s" % self.uri)
+        subprocess.check_call("wget -O %s %s" % (self.localarchive, self.uri), shell=True)
 
         (status, output) = self.target.copy_to(self.localarchive, self.targetdir)
         if status != 0:
@@ -61,3 +49,4 @@ class TargetBuildProject():
 
     def clean(self):
         self.target.run('rm -rf %s' % self.targetdir)
+        subprocess.call('rm -f %s' % self.localarchive, shell=True)
-- 
1.8.5.3


