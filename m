Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 350E9781AD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 16:39:35 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jun 2017 09:39:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,311,1493708400"; d="scan'208";a="111569467"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.117])
	by fmsmga005.fm.intel.com with ESMTP; 07 Jun 2017 09:39:34 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 11:39:38 -0500
Message-Id: <1496853578-3188-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH] oeqa: Change the order to logDetails and logSummary
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
X-List-Received-Date: Wed, 07 Jun 2017 16:39:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Is better to log the summary at end to see in an easy way
the actual result of the test run.

[YOCTO #11622]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/testimage.bbclass    | 2 +-
 meta/classes/testsdk.bbclass      | 4 ++--
 meta/lib/oeqa/core/context.py     | 2 +-
 meta/lib/oeqa/selftest/context.py | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 1185593..6c33e16 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -292,8 +292,8 @@ def testimage_main(d):
     # Show results (if we have them)
     if not results:
         bb.fatal('%s - FAILED - tests were interrupted during execution' % pn)
-    results.logSummary(pn)
     results.logDetails()
+    results.logSummary(pn)
     if not results.wasSuccessful():
         bb.fatal('%s - FAILED - check the task log and the ssh log' % pn)
 
diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 8a9e680..6b51a33 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -72,8 +72,8 @@ def testsdk_main(d):
         component = "%s %s" % (pn, OESDKTestContextExecutor.name)
         context_msg = "%s:%s" % (os.path.basename(tcname), os.path.basename(sdk_env))
 
-        result.logSummary(component, context_msg)
         result.logDetails()
+        result.logSummary(component, context_msg)
 
         if not result.wasSuccessful():
             fail = True
@@ -176,8 +176,8 @@ def testsdkext_main(d):
         component = "%s %s" % (pn, OESDKExtTestContextExecutor.name)
         context_msg = "%s:%s" % (os.path.basename(tcname), os.path.basename(sdk_env))
 
-        result.logSummary(component, context_msg)
         result.logDetails()
+        result.logSummary(component, context_msg)
 
         if not result.wasSuccessful():
             fail = True
diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 0dbf5c3..2d543ff 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -158,8 +158,8 @@ class OETestContextExecutor(object):
         else:
             self._pre_run()
             rc = self.tc.runTests(**self.tc_kwargs['run'])
-            rc.logSummary(self.name)
             rc.logDetails()
+            rc.logSummary(self.name)
 
         output_link = os.path.join(os.path.dirname(args.output_log),
                 "%s-results.log" % self.name)
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index ca73070..8c8439b 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -179,8 +179,8 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         else:
             self._pre_run()
             rc = self.tc.runTests(**self.tc_kwargs['run'])
-            rc.logSummary(self.name)
             rc.logDetails()
+            rc.logSummary(self.name)
 
         return rc
     
-- 
2.1.4


