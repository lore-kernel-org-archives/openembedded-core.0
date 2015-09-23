Return-Path: <george.l.musat@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5B7827404E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 15:42:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 23 Sep 2015 08:42:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,577,1437462000"; d="scan'208";a="775376294"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 23 Sep 2015 08:42:23 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id D04F76A4005;
	Wed, 23 Sep 2015 08:41:28 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Sep 2015 18:40:25 +0300
Message-Id: <1443022826-32446-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCHv2 1/2] oeqa/oetest: Remove bb as requirement for oetest.
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
X-List-Received-Date: Wed, 23 Sep 2015 15:42:25 -0000

In order for the test export runner to work oetest needs to be
separated from bitbake environment. There is no need to use bb
import here so we can use a logger instead.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/oetest.py | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 3816c1a..0be61c2 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -11,10 +11,16 @@ import os, re, mmap
 import unittest
 import inspect
 import subprocess
-import bb
+try:
+    import bb
+except ImportError:
+    pass
+import logging
 from oeqa.utils.decorators import LogResults, gettag
 from sys import exc_info, exc_clear
 
+logger = logging.getLogger("BitBake")
+
 def getVar(obj):
     #extend form dict, if a variable didn't exists, need find it in testcase
     class VarDict(dict):
@@ -89,7 +95,7 @@ def loadTests(tc, type="runtime"):
                                 suite.dependencies.append(dep_suite)
                             break
                     else:
-                        bb.warn("Test %s was declared as @skipUnlessPassed('%s') but that test is either not defined or not active. Will run the test anyway." %
+                        logger.warning("Test %s was declared as @skipUnlessPassed('%s') but that test is either not defined or not active. Will run the test anyway." %
                                 (test, depends_on))
     # Use brute-force topological sort to determine ordering. Sort by
     # depth (higher depth = must run later), with original ordering to
@@ -114,19 +120,26 @@ def custom_verbose(msg, *args, **kwargs):
         _buffer += msg
     else:
         _buffer += msg
-        bb.plain(_buffer.rstrip("\n"), *args, **kwargs)
+        try:
+            bb.plain(_buffer.rstrip("\n"), *args, **kwargs)
+        except NameError:
+            logger.info(_buffer.rstrip("\n"), *args, **kwargs)
         _buffer = ""
 
 def runTests(tc, type="runtime"):
 
     suite = loadTests(tc, type)
-    bb.note("Test modules  %s" % tc.testslist)
+    logger.info("Test modules  %s" % tc.testslist)
     if hasattr(tc, "tagexp") and tc.tagexp:
-        bb.note("Filter test cases by tags: %s" % tc.tagexp)
-    bb.note("Found %s tests" % suite.countTestCases())
+        logger.info("Filter test cases by tags: %s" % tc.tagexp)
+    logger.info("Found %s tests" % suite.countTestCases())
     runner = unittest.TextTestRunner(verbosity=2)
-    if bb.msg.loggerDefaultVerbose:
-        runner.stream.write = custom_verbose
+    try:
+        if bb.msg.loggerDefaultVerbose:
+            runner.stream.write = custom_verbose
+    except NameError:
+        # Not in bb environment?
+        pass
     result = runner.run(suite)
 
     return result
-- 
2.1.4


