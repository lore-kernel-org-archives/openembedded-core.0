Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A79A861663
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 14:44:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 15 Jul 2013 07:44:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,669,1367996400"; d="scan'208";a="365459602"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 15 Jul 2013 07:43:31 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 9B6E56A4091
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 07:42:20 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2013 17:42:30 +0300
Message-Id: <4d06d05ef481537369dd646b114f617a2bc7f8a4.1373899189.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1373899189.git.stefanx.stanacar@intel.com>
References: <cover.1373899189.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1373899189.git.stefanx.stanacar@intel.com>
References: <cover.1373899189.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 9/9] lib/oeqa: fix dependecy check
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
X-List-Received-Date: Mon, 15 Jul 2013 14:44:05 -0000

Adds missing skip for smart test and fix the check (which I somehow broke
a while ago).

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/smart.py    | 1 +
 meta/lib/oeqa/utils/decorators.py | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart.py
index 8cfacd4..0b03a30 100644
--- a/meta/lib/oeqa/runtime/smart.py
+++ b/meta/lib/oeqa/runtime/smart.py
@@ -10,6 +10,7 @@ def setUpModule():
 
 class SmartHelpTest(oeRuntimeTest):
 
+    @skipUnlessPassed('test_ssh')
     def test_smart_help(self):
         status = self.target.run('smart --help')[0]
         self.assertEqual(status, 0)
diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index adec65e..e0ca6fd 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -41,7 +41,9 @@ class skipUnlessPassed(object):
 
     def __call__(self,f):
         def wrapped_f(*args):
-            if self.testcase in (oeRuntimeTest.testSkipped, oeRuntimeTest.testFailures, oeRuntimeTest.testErrors):
+            if self.testcase in oeRuntimeTest.testSkipped or \
+                    self.testcase in  oeRuntimeTest.testFailures or \
+                    self.testcase in oeRuntimeTest.testErrors:
                 raise unittest.SkipTest("Testcase dependency not met: %s" % self.testcase)
             f(*args)
         wrapped_f.__name__ = f.__name__
-- 
1.8.3.1


