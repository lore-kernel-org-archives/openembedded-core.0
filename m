Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CBFD8766F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 13:28:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 26 Oct 2015 06:28:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,201,1444719600"; d="scan'208";a="803199005"
Received: from randjicd-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.27.7])
	by orsmga001.jf.intel.com with ESMTP; 26 Oct 2015 06:28:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Oct 2015 13:28:26 +0000
Message-Id: <2de8b9fb251e9c4ef578faf1efff171d7266a1a1.1445866022.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1445866022.git.paul.eggleton@linux.intel.com>
References: <cover.1445866022.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1445866022.git.paul.eggleton@linux.intel.com>
References: <cover.1445866022.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] oeqa/utils/decorators: fix missing keyword arguments on decorators
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
X-List-Received-Date: Mon, 26 Oct 2015 13:28:52 -0000

We need to handle keyword arguments here or sending a keyword argument
to a decorated function that accepts keyword arguments will trigger an
error. (This showed up when testcase decorators were added to the
recipetool.RecipetoolTests.test_recipetool_appendsrcfiles_basic_subdir
test).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/utils/decorators.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index 2169a20..0d79223 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -57,11 +57,11 @@ class skipIfFailure(object):
         self.testcase = testcase
 
     def __call__(self,f):
-        def wrapped_f(*args):
+        def wrapped_f(*args, **kwargs):
             res = getResults()
             if self.testcase in (res.getFailList() or res.getErrorList()):
                 raise unittest.SkipTest("Testcase dependency not met: %s" % self.testcase)
-            return f(*args)
+            return f(*args, **kwargs)
         wrapped_f.__name__ = f.__name__
         return wrapped_f
 
@@ -71,11 +71,11 @@ class skipIfSkipped(object):
         self.testcase = testcase
 
     def __call__(self,f):
-        def wrapped_f(*args):
+        def wrapped_f(*args, **kwargs):
             res = getResults()
             if self.testcase in res.getSkipList():
                 raise unittest.SkipTest("Testcase dependency not met: %s" % self.testcase)
-            return f(*args)
+            return f(*args, **kwargs)
         wrapped_f.__name__ = f.__name__
         return wrapped_f
 
@@ -85,13 +85,13 @@ class skipUnlessPassed(object):
         self.testcase = testcase
 
     def __call__(self,f):
-        def wrapped_f(*args):
+        def wrapped_f(*args, **kwargs):
             res = getResults()
             if self.testcase in res.getSkipList() or \
                     self.testcase in res.getFailList() or \
                     self.testcase in res.getErrorList():
                 raise unittest.SkipTest("Testcase dependency not met: %s" % self.testcase)
-            return f(*args)
+            return f(*args, **kwargs)
         wrapped_f.__name__ = f.__name__
         wrapped_f._depends_on = self.testcase
         return wrapped_f
@@ -102,8 +102,8 @@ class testcase(object):
         self.test_case = test_case
 
     def __call__(self, func):
-        def wrapped_f(*args):
-            return func(*args)
+        def wrapped_f(*args, **kwargs):
+            return func(*args, **kwargs)
         wrapped_f.test_case = self.test_case
         wrapped_f.__name__ = func.__name__
         return wrapped_f
-- 
2.1.0


