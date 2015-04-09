Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1AD7C73C73
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 09:24:39 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so108077869ied.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Apr 2015 02:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=rqknKFN0GdbJBMPp9lO6imzrg8NfldZMx8ftXllpgJg=;
	b=G9wgezoy2fgSfsIyc1O9ulxNB3ZUyYfj2/36eSdKh6rARF7dX+vPEp5ewKMDqVx64W
	c/sKgiyLfsbToC+3JTNQ3ppPx/RH4l5WFe/+HQUV2KtacnuZntE7KBt2QQB3W2d6Y88P
	TdcCEocpLs8flM3VqYWGBumvPLaQZwC7KYByv/9jny7w+cc4IkpTVIMAhTMsuKSYKDoD
	rbB6IAH8Lyc+9FRU5Spa61xUtZBRQbmx4QM5JGJcgJPxYalvsw+6R3WsLCAjBxXq26JJ
	fF+ujhcVSG4+aU/uolTOXptk0c/NfoU4yJ3MbKZuyCT323DzfASqycQjFD/HSaJ6ujBW
	zZsA==
X-Gm-Message-State: ALoCoQnojCl56WBXG+9XIoFf1PQyCTwCNy7TLUpT6kLvHXQKZGwZ573zAmpW7YrjSklWIUskqDR2
X-Received: by 10.107.39.72 with SMTP id n69mr44523074ion.8.1428571481116;
	Thu, 09 Apr 2015 02:24:41 -0700 (PDT)
Received: from syncev.vlan14.01.org (p5DE8CDA6.dip0.t-ipconnect.de.
	[93.232.205.166])
	by mx.google.com with ESMTPSA id s5sm3251036igh.6.2015.04.09.02.24.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Apr 2015 02:24:39 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 02:24:24 -0700
Message-Id: <21b514a89c294bc0da02ec7461b8e288750058d3.1428571193.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <a7349833ae2b74d2bb145dcd0fef8c95db1ae8e7.1428571193.git.patrick.ohly@intel.com>
References: <a7349833ae2b74d2bb145dcd0fef8c95db1ae8e7.1428571193.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1428571193.git.patrick.ohly@intel.com>
References: <cover.1428571193.git.patrick.ohly@intel.com>
Subject: [PATCH 3/3] testimage: sort modules based on dependencies
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
X-List-Received-Date: Thu, 09 Apr 2015 09:24:42 -0000

TEST_SUITES="auto" is useful to run all suitable tests without
having to hard-code the list. However, it did not take test
dependencies into account, which can be an issue for tests
which really depend on some other test to run first.

To fix this, modules get loaded in the order determined by
TESTS_SUITES, but then get re-ordered based on dependencies
derived from @skipUnlessPassed before running them. The original
order is used to break ties when there are no dependencies, so
reordering only occurs when really necessary.

@skipUnlessPassed gets extended such that it makes the test name
a method depends on available for inspection by the test loader
in oetest.py.

Unfortunately Python's unittest offers no API to inspect tests
in a TestSuite, so the code has to rely on implementation details
to find all tests. The worst that can happen when the implementation
changes is that tests are not found and reordering does not happen.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/testimage.bbclass    |  6 ++++-
 meta/lib/oeqa/oetest.py           | 56 ++++++++++++++++++++++++++++++++++++---
 meta/lib/oeqa/utils/decorators.py |  1 +
 3 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 6831738..dc163c7 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -16,7 +16,11 @@
 # The test names are the module names in meta/lib/oeqa/runtime.
 # Each name in TEST_SUITES represents a required test for the image. (no skipping allowed)
 # Appending "auto" means that it will try to run all tests that are suitable for the image (each test decides that on it's own).
-# Note that order in TEST_SUITES is important (it's the order tests run) and it influences tests dependencies.
+# Note that order in TEST_SUITES is relevant: tests are run in an order such that
+# tests mentioned in @skipUnlessPassed run before the tests that depend on them,
+# but without such dependencies, tests run in the order in which they are listed
+# in TEST_SUITES.
+#
 # A layer can add its own tests in lib/oeqa/runtime, provided it extends BBPATH as normal in its layer.conf.
 
 # TEST_LOG_DIR contains a command ssh log and may contain infromation about what command is running, output and return codes and for qemu a boot log till login.
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index a3c5c1d..da9556a 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -27,9 +27,59 @@ def loadTests(tc, type="runtime"):
         setattr(oeTest, "tc", tc)
     testloader = unittest.TestLoader()
     testloader.sortTestMethodsUsing = None
-    suite = testloader.loadTestsFromNames(tc.testslist)
-
-    return suite
+    suites = [testloader.loadTestsFromName(name) for name in tc.testslist]
+
+    def getTests(test):
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
+                for t2 in getTests(t1):
+                    yield t2
+
+    # Determine dependencies between suites by looking for @skipUnlessPassed
+    # method annotations. Suite A depends on suite B if any method in A
+    # depends on a method on B.
+    for suite in suites:
+        suite.dependencies = []
+        suite.depth = 0
+        for test in getTests(suite):
+            methodname = getattr(test, '_testMethodName', None)
+            if methodname:
+                method = getattr(test, methodname)
+                depends_on = getattr(method, '_depends_on', None)
+                if depends_on:
+                    for dep_suite in suites:
+                        if depends_on in [getattr(t, '_testMethodName', None) for t in getTests(dep_suite)]:
+                            if dep_suite not in suite.dependencies and \
+                               dep_suite is not suite:
+                                suite.dependencies.append(dep_suite)
+                            break
+                    else:
+                        bb.warn("Test %s was declared as @skipUnlessPassed('%s') but that test is either not defined or not active. Will run the test anyway." %
+                                (test, depends_on))
+    # Use brute-force topological sort to determine ordering. Sort by
+    # depth (higher depth = must run later), with original ordering to
+    # break ties.
+    def set_suite_depth(suite):
+        for dep in suite.dependencies:
+            new_depth = set_suite_depth(dep) + 1
+            if new_depth > suite.depth:
+                suite.depth = new_depth
+        return suite.depth
+    for index, suite in enumerate(suites):
+        set_suite_depth(suite)
+        suite.index = index
+    suites.sort(cmp=lambda a,b: cmp((a.depth, a.index), (b.depth, b.index)))
+    return testloader.suiteClass(suites)
 
 def runTests(tc, type="runtime"):
 
diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index ff5f278..1e5a890 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -85,6 +85,7 @@ class skipUnlessPassed(object):
                 raise unittest.SkipTest("Testcase dependency not met: %s" % self.testcase)
             return f(*args)
         wrapped_f.__name__ = f.__name__
+        wrapped_f._depends_on = self.testcase
         return wrapped_f
 
 class testcase(object):
-- 
1.8.4.5


