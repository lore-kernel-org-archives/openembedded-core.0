Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id DB3E16B115
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 15:32:36 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2013 08:32:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="285884537"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2013 08:32:37 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 532D72C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 08:32:35 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 18:30:50 +0300
Message-Id: <fafb22fcb0aa05d4bfb83840b92b5a05fd4f79de.1377269485.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377269484.git.stefanx.stanacar@intel.com>
References: <cover.1377269484.git.stefanx.stanacar@intel.com>
Subject: [PATCH 10/21] oeqa/utils/decorators: return the decorated method
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
X-List-Received-Date: Fri, 23 Aug 2013 15:32:37 -0000

From: Mihai Lindner <mihaix.lindner@linux.intel.com>

Decorators should return whatever the decorated methods return.

Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/decorators.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index e0ca6fd..33fed5a 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -17,7 +17,7 @@ class skipIfFailure(object):
         def wrapped_f(*args):
             if self.testcase in (oeRuntimeTest.testFailures or oeRuntimeTest.testErrors):
                 raise unittest.SkipTest("Testcase dependency not met: %s" % self.testcase)
-            f(*args)
+            return f(*args)
         wrapped_f.__name__ = f.__name__
         return wrapped_f
 
@@ -30,7 +30,7 @@ class skipIfSkipped(object):
         def wrapped_f(*args):
             if self.testcase in oeRuntimeTest.testSkipped:
                 raise unittest.SkipTest("Testcase dependency not met: %s" % self.testcase)
-            f(*args)
+            return f(*args)
         wrapped_f.__name__ = f.__name__
         return wrapped_f
 
@@ -45,6 +45,6 @@ class skipUnlessPassed(object):
                     self.testcase in  oeRuntimeTest.testFailures or \
                     self.testcase in oeRuntimeTest.testErrors:
                 raise unittest.SkipTest("Testcase dependency not met: %s" % self.testcase)
-            f(*args)
+            return f(*args)
         wrapped_f.__name__ = f.__name__
         return wrapped_f
-- 
1.8.3.1


