Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 84C9A6B9E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 18:05:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 23 Aug 2013 11:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,943,1367996400"; d="scan'208";a="385580184"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2013 11:04:43 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id BA42B2C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 11:04:41 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 21:04:26 +0300
Message-Id: <5efd72ae183f308d94d11e3a6d17f12556faa9aa.1377280794.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 16/19] lib/oeqa/utils: targetbuild: Add helper class for building packages on target
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
X-List-Received-Date: Fri, 23 Aug 2013 18:05:09 -0000

From: Mihai Prica <mihai.prica@intel.com>

This class can be used for test cases that configure
and build packages on target.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/targetbuild.py | 63 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 meta/lib/oeqa/utils/targetbuild.py

diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
new file mode 100644
index 0000000..9b2cf53
--- /dev/null
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -0,0 +1,63 @@
+# Copyright (C) 2013 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+# Provides a class for automating build tests for projects
+
+from oeqa.oetest import oeRuntimeTest
+import bb.fetch2
+import bb.data
+import os
+import re
+
+
+class TargetBuildProject():
+
+    def __init__(self, target, uri, foldername=None):
+        self.target = target
+        self.uri = uri
+        self.targetdir = "/home/root/"
+
+        self.localdata = bb.data.createCopy(oeRuntimeTest.tc.d)
+        bb.data.update_data(self.localdata)
+
+        if not foldername:
+            self.archive = os.path.basename(uri)
+            self.fname = re.sub(r'.tar.bz2|tar.gz$', '', self.archive)
+        else:
+            self.fname = foldername
+
+    def download_archive(self):
+
+        try:
+            self.localdata.delVar("BB_STRICT_CHECKSUM")
+            fetcher = bb.fetch2.Fetch([self.uri], self.localdata)
+            fetcher.download()
+            self.localarchive = fetcher.localpath(self.uri)
+        except bb.fetch2.BBFetchException:
+            raise Exception("Failed to download archive: %s" % self.uri)
+
+        (status, output) = self.target.copy_to(self.localarchive, self.targetdir)
+        if status != 0:
+            raise Exception("Failed to copy archive to target, output: %s" % output)
+
+        (status, output) = self.target.run('tar xf %s%s -C %s' % (self.targetdir, self.archive, self.targetdir))
+        if status != 0:
+            raise Exception("Failed to extract archive, output: %s" % output)
+
+        #Change targetdir to project folder
+        self.targetdir = self.targetdir + self.fname
+
+    # The timeout parameter of target.run is set to 0 to make the ssh command
+    # run with no timeout.
+    def run_configure(self):
+        return self.target.run('cd %s; ./configure' % self.targetdir, 0)[0]
+
+    def run_make(self):
+        return self.target.run('cd %s; make' % self.targetdir, 0)[0]
+
+    def run_install(self):
+        return self.target.run('cd %s; make install' % self.targetdir, 0)[0]
+
+    def clean(self):
+        self.target.run('rm -rf %s' % self.targetdir)
-- 
1.8.3.1


