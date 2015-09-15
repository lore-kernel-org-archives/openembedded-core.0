Return-Path: <george.l.musat@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 638E676DEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 13:51:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 15 Sep 2015 06:51:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,536,1437462000"; d="scan'208";a="789832699"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 15 Sep 2015 06:51:49 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id C25D36A4005;
	Tue, 15 Sep 2015 06:50:55 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Sep 2015 16:52:44 +0300
Message-Id: <1442325164-17188-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/testimage: Enhance -v switch in testimage
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
X-List-Received-Date: Tue, 15 Sep 2015 13:51:51 -0000

When testimage is run with -v switch now individual
test progress can be seen directly in bitbake console.

[YOCTO #6841]

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/oetest.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 0fe68d4..99da20d 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -106,6 +106,17 @@ def loadTests(tc, type="runtime"):
     suites.sort(cmp=lambda a,b: cmp((a.depth, a.index), (b.depth, b.index)))
     return testloader.suiteClass(suites)
 
+_buffer = ""
+
+def custom_verbose(msg, *args, **kwargs):
+    global _buffer
+    if msg[-1] != "\n":
+        _buffer += msg
+    else:
+        _buffer += msg
+        bb.plain(_buffer.rstrip("\n"), *args, **kwargs)
+        _buffer = ""
+
 def runTests(tc, type="runtime"):
 
     suite = loadTests(tc, type)
@@ -114,6 +125,8 @@ def runTests(tc, type="runtime"):
         bb.note("Filter test cases by tags: %s" % tc.tagexp)
     bb.note("Found %s tests" % suite.countTestCases())
     runner = unittest.TextTestRunner(verbosity=2)
+    if bb.msg.loggerDefaultVerbose:
+        runner.stream.write = custom_verbose
     result = runner.run(suite)
 
     return result
-- 
2.1.4


