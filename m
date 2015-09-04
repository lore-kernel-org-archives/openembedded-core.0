Return-Path: <george.l.musat@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 832C077040
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 13:50:15 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 04 Sep 2015 06:50:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,469,1437462000"; d="scan'208";a="555241423"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Sep 2015 06:50:15 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id 07E146A4083;
	Fri,  4 Sep 2015 06:49:23 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Sep 2015 16:48:29 +0300
Message-Id: <1441374509-27230-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH V2] oeqa/decorators: Fixed a problem with tests having the same names.
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
X-List-Received-Date: Fri, 04 Sep 2015 13:50:19 -0000

When two or more tests had the same name but different classes then
the decorator log whould have the output all wrong. This was because
a comparison which was made only between method names but now it
compares classes too.

YOCTO #8029

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/utils/decorators.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index b9fc76c..ff84541 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -116,13 +116,14 @@ def LogResults(original_class):
         orig_method(self, result, *args, **kws)
         passed = True
         testMethod = getattr(self, self._testMethodName)
-
         #if test case is decorated then use it's number, else use it's name
         try:
             test_case = testMethod.test_case
         except AttributeError:
             test_case = self._testMethodName
 
+        class_name = str(testMethod.im_class).split("'")[1]
+
         #create custom logging level for filtering.
         custom_log_level = 100
         logging.addLevelName(custom_log_level, 'RESULTS')
@@ -143,18 +144,19 @@ def LogResults(original_class):
         local_log = logging.getLogger(caller)
 
         #check status of tests and record it
+
         for (name, msg) in result.errors:
-            if self._testMethodName == str(name).split(' ')[0]:
+            if (self._testMethodName == str(name).split(' ')[0]) and (class_name in str(name).split(' ')[1]):
                 local_log.results("Testcase "+str(test_case)+": ERROR")
                 local_log.results("Testcase "+str(test_case)+":\n"+msg)
                 passed = False
         for (name, msg) in result.failures:
-            if self._testMethodName == str(name).split(' ')[0]:
+            if (self._testMethodName == str(name).split(' ')[0]) and (class_name in str(name).split(' ')[1]):
                 local_log.results("Testcase "+str(test_case)+": FAILED")
                 local_log.results("Testcase "+str(test_case)+":\n"+msg)
                 passed = False
         for (name, msg) in result.skipped:
-            if self._testMethodName == str(name).split(' ')[0]:
+            if (self._testMethodName == str(name).split(' ')[0]) and (class_name in str(name).split(' ')[1]):
                 local_log.results("Testcase "+str(test_case)+": SKIPPED")
                 passed = False
         if passed:
-- 
2.1.4


