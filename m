Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF2E60721
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 14:58:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Apr 2016 07:58:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,462,1455004800"; d="scan'208";a="952588867"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga002.jf.intel.com with ESMTP; 11 Apr 2016 07:58:49 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Apr 2016 06:55:35 +0000
Message-Id: <1460357735-34044-1-git-send-email-mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH] oeqa/runexported.py: Fix exported test
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
X-List-Received-Date: Mon, 11 Apr 2016 14:58:54 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

With the changes introduced to test the eSDK
the runexported test failed during the execution.

This change fix runexported test in the least invasive
way, because of the release cycle.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/oetest.py         |  6 +++++-
 meta/lib/oeqa/runexported.py    | 19 ++++++++++---------
 meta/lib/oeqa/utils/commands.py |  6 +++++-
 3 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index fc1e8b5..8eb84ed 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -19,7 +19,11 @@ except ImportError:
 import logging
 
 import oeqa.runtime
-import oeqa.sdkext
+# Exported test doesn't require sdkext
+try:
+    import oeqa.sdkext
+except ImportError:
+    pass
 from oeqa.utils.decorators import LogResults, gettag, getResults
 from oeqa.utils import avoid_paths_in_environ
 
diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index e9a2912..cc89e13 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -30,7 +30,7 @@ except ImportError:
 
 sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "oeqa")))
 
-from oeqa.oetest import runTests
+from oeqa.oetest import TestContext
 from oeqa.utils.sshcontrol import SSHControl
 from oeqa.utils.dump import get_host_dumper
 
@@ -49,7 +49,7 @@ class FakeTarget(object):
     def exportStart(self):
         self.sshlog = os.path.join(self.testdir, "ssh_target_log.%s" % self.datetime)
         sshloglink = os.path.join(self.testdir, "ssh_target_log")
-        if os.path.exists(sshloglink):
+        if os.path.lexists(sshloglink):
             os.remove(sshloglink)
         os.symlink(self.sshlog, sshloglink)
         print("SSH log file: %s" %  self.sshlog)
@@ -69,10 +69,9 @@ class MyDataDict(dict):
     def getVar(self, key, unused = None):
         return self.get(key, "")
 
-class TestContext(object):
-    def __init__(self):
-        self.d = None
-        self.target = None
+class ExportTestContext(TestContext):
+    def __init__(self, d):
+        self.d = d
 
 def main():
 
@@ -121,7 +120,9 @@ def main():
     host_dumper.parent_dir = loaded["host_dumper"]["parent_dir"]
     host_dumper.cmds = loaded["host_dumper"]["cmds"]
 
-    tc = TestContext()
+    target.exportStart()
+    tc = ExportTestContext(d)
+
     setattr(tc, "d", d)
     setattr(tc, "target", target)
     setattr(tc, "host_dumper", host_dumper)
@@ -129,8 +130,8 @@ def main():
         if key != "d" and key != "target" and key != "host_dumper":
             setattr(tc, key, loaded[key])
 
-    target.exportStart()
-    runTests(tc)
+    tc.loadTests()
+    tc.runTests()
 
     return 0
 
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 32e001c..48f6441 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -18,7 +18,11 @@ from oeqa.utils import CommandError
 from oeqa.utils import ftools
 import re
 import contextlib
-import bb
+# Export test doesn't require bb
+try:
+    import bb
+except ImportError:
+    pass
 
 class Command(object):
     def __init__(self, command, bg=False, timeout=None, data=None, **options):
-- 
2.6.2


