Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1DEC16B9FB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 15:32:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Aug 2013 08:32:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="390996797"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 23 Aug 2013 08:32:39 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 933B72C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 08:32:37 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 18:30:52 +0300
Message-Id: <3613c54be859097279a1f5ab6aa69be954ee90f1.1377269485.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
Subject: [PATCH 12/21] lib/oeqa/utils: targetbuild: Add helper class for building packages on target
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

This class can be used for test cases that configure
and build packages on target.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/targetbuild.py | 66 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 meta/lib/oeqa/utils/targetbuild.py

diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
new file mode 100644
index 0000000..7555add
--- /dev/null
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -0,0 +1,66 @@
+# Copyright (C) 2013 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+# Provides a class for automating build tests for projects
+
+from oeqa.oetest import oeRuntimeTest
+from oeqa.utils.decorators import *
+import bb.process
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
+        if not foldername:
+            self.archive = os.path.basename(uri)
+            self.fname = re.sub(r'.tar.bz2|tar.gz$', '', self.archive)
+        else:
+            self.fname = foldername
+
+    def download_archive(self):
+        wgetcmd = oeRuntimeTest.tc.d.getVar('FETCHCMD_wget', True).split()
+        self.testdir = oeRuntimeTest.tc.d.getVar('TEST_LOG_DIR', True)
+
+        try:
+            output = bb.process.run(wgetcmd + ['-P', self.testdir, self.uri])[0]
+        except bb.process.CmdError:
+            raise Exception("Failed to download archive, output: %s" % output)
+
+        (status, output) = oeRuntimeTest.tc.target.copy_to(
+            os.path.join(self.testdir, self.archive),
+            self.targetdir)
+        if status != 0:
+            raise Exception("Failed to copy archive to target, output: %s" % output)
+
+        (status, output) = oeRuntimeTest.tc.target.run(
+            'tar xf %s%s -C %s' % (self.targetdir, self.archive, self.targetdir))
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
+        self.target.run('rm -r %s*' % self.targetdir)
+        try:
+            bb.process.run(['rm', '-rf', os.path.join(self.testdir, self.archive)])
+        except bb.process.CmdError:
+            bb.note("Failed to remove archive")
-- 
1.8.3.1


