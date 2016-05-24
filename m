Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 122EE60796
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 20:49:02 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 24 May 2016 13:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,360,1459839600"; d="scan'208";a="708326936"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 24 May 2016 13:49:03 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 12:44:11 +0000
Message-Id: <359d5cf8f5eac3a56e3789c62a86c9fd8f26f2ed.1464092933.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1464092933.git.mariano.lopez@linux.intel.com>
References: <cover.1464092933.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1464092933.git.mariano.lopez@linux.intel.com>
References: <cover.1464092933.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 02/10] oetest.py: Move getTests() outside loadTests() method
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
X-List-Received-Date: Tue, 24 May 2016 20:49:03 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The method getTests() can be useful to all the class,
not just to loadTests().

[YOCTO #8694]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/oetest.py | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 70db119..8ad3715 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -264,6 +264,22 @@ class TestContext(object):
 
         return testslist
 
+    def getTests(self, test):
+        '''Return all individual tests executed when running the suite.'''
+        # Unfortunately unittest does not have an API for this, so we have
+        # to rely on implementation details. This only needs to work
+        # for TestSuite containing TestCase.
+        method = getattr(test, '_testMethodName', None)
+        if method:
+            # leaf case: a TestCase
+            yield test
+        else:
+            # Look into TestSuite.
+            tests = getattr(test, '_tests', [])
+            for t1 in tests:
+                for t2 in self.getTests(t1):
+                    yield t2
+
     def loadTests(self):
         setattr(oeTest, "tc", self)
 
@@ -272,36 +288,20 @@ class TestContext(object):
         suites = [testloader.loadTestsFromName(name) for name in self.testslist]
         suites = filterByTagExp(suites, getattr(self, "tagexp", None))
 
-        def getTests(test):
-            '''Return all individual tests executed when running the suite.'''
-            # Unfortunately unittest does not have an API for this, so we have
-            # to rely on implementation details. This only needs to work
-            # for TestSuite containing TestCase.
-            method = getattr(test, '_testMethodName', None)
-            if method:
-                # leaf case: a TestCase
-                yield test
-            else:
-                # Look into TestSuite.
-                tests = getattr(test, '_tests', [])
-                for t1 in tests:
-                    for t2 in getTests(t1):
-                        yield t2
-
         # Determine dependencies between suites by looking for @skipUnlessPassed
         # method annotations. Suite A depends on suite B if any method in A
         # depends on a method on B.
         for suite in suites:
             suite.dependencies = []
             suite.depth = 0
-            for test in getTests(suite):
+            for test in self.getTests(suite):
                 methodname = getattr(test, '_testMethodName', None)
                 if methodname:
                     method = getattr(test, methodname)
                     depends_on = getattr(method, '_depends_on', None)
                     if depends_on:
                         for dep_suite in suites:
-                            if depends_on in [getattr(t, '_testMethodName', None) for t in getTests(dep_suite)]:
+                            if depends_on in [getattr(t, '_testMethodName', None) for t in self.getTests(dep_suite)]:
                                 if dep_suite not in suite.dependencies and \
                                    dep_suite is not suite:
                                     suite.dependencies.append(dep_suite)
-- 
2.6.6


