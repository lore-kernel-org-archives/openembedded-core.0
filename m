Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 866AA76FC9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 20:03:08 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 28 Sep 2015 13:03:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,604,1437462000"; d="scan'208";a="653864576"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga003.jf.intel.com with ESMTP; 28 Sep 2015 13:03:08 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Sep 2015 11:53:18 +0000
Message-Id: <7ac9dcab6a74b1e4a48084b5f5fd14b296dec248.1443440410.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1443440410.git.mariano.lopez@linux.intel.com>
References: <cover.1443440410.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] oetest: Change logic of a failed test
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
X-List-Received-Date: Mon, 28 Sep 2015 20:03:09 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Currently the logic to check if a test failed was
to check for an exception in the thread, but some
decorators used in the syslog runtime test would
generate and handle exceptions; this will mess
with the current check logic and will dump the
host and the target as if the test failed.

This patch changes the check logic to verify if
the test that just happend is in the failure test
list and dump the host and target accordingly.

[YOCTO #8406]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/oetest.py | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index a7c7203..e3bbc46 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -16,8 +16,7 @@ try:
 except ImportError:
     pass
 import logging
-from oeqa.utils.decorators import LogResults, gettag
-from sys import exc_info, exc_clear
+from oeqa.utils.decorators import LogResults, gettag, getResults
 
 logger = logging.getLogger("BitBake")
 
@@ -184,17 +183,18 @@ class oeRuntimeTest(oeTest):
         pass
 
     def tearDown(self):
-        # If a test fails or there is an exception
-        if not exc_info() == (None, None, None):
-            exc_clear()
-            #Only dump for QemuTarget
-            if (type(self.target).__name__ == "QemuTarget"):
-                self.tc.host_dumper.create_dir(self._testMethodName)
-                self.tc.host_dumper.dump_host()
-                self.target.target_dumper.dump_target(
-                        self.tc.host_dumper.dump_dir)
-                print ("%s dump data stored in %s" % (self._testMethodName,
-                         self.tc.host_dumper.dump_dir))
+        res = getResults()
+        # If a test fails or there is an exception dump
+        # for QemuTarget only
+        if (type(self.target).__name__ == "QemuTarget" and
+                (self.id() in res.getErrorList() or
+                self.id() in  res.getFailList())):
+            self.tc.host_dumper.create_dir(self._testMethodName)
+            self.tc.host_dumper.dump_host()
+            self.target.target_dumper.dump_target(
+                    self.tc.host_dumper.dump_dir)
+            print ("%s dump data stored in %s" % (self._testMethodName,
+                     self.tc.host_dumper.dump_dir))
 
     #TODO: use package_manager.py to install packages on any type of image
     def install_packages(self, packagelist):
-- 
1.8.4.5


