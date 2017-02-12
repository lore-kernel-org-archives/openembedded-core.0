Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7276E71A2D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 02:53:59 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 12 Feb 2017 18:54:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,155,1484035200"; d="scan'208";a="64326504"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by fmsmga005.fm.intel.com with ESMTP; 12 Feb 2017 18:54:00 -0800
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Feb 2017 19:00:38 +0000
Message-Id: <1486926038-17415-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 2.5.1
Cc: benjamin.esquivel@intel.com, mariano.lopez@intel.com
Subject: [PATCH] selftest: remove result file log awkward checking
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
X-List-Received-Date: Mon, 13 Feb 2017 02:54:00 -0000

because of the way that the test cases are looked in the results,
the file logger is incompatible with extended implementations of the
unittest runner.

as the xml runner extends the unittest runner, it shares the id()
method which returns the full name of the test, not only the test
function name. With that, a single check of the full name reviews at
the same time the class name as well as the function name.

[YOCTO#11012]

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 meta/lib/oeqa/utils/decorators.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index 25f9c54..d876896 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -172,18 +172,19 @@ def LogResults(original_class):
 
         #check status of tests and record it
 
+        tcid = self.id()
         for (name, msg) in result.errors:
-            if (self._testMethodName == str(name).split(' ')[0]) and (class_name in str(name).split(' ')[1]):
+            if tcid == name.id():
                 local_log.results("Testcase "+str(test_case)+": ERROR")
                 local_log.results("Testcase "+str(test_case)+":\n"+msg)
                 passed = False
         for (name, msg) in result.failures:
-            if (self._testMethodName == str(name).split(' ')[0]) and (class_name in str(name).split(' ')[1]):
+            if tcid == name.id():
                 local_log.results("Testcase "+str(test_case)+": FAILED")
                 local_log.results("Testcase "+str(test_case)+":\n"+msg)
                 passed = False
         for (name, msg) in result.skipped:
-            if (self._testMethodName == str(name).split(' ')[0]) and (class_name in str(name).split(' ')[1]):
+            if tcid == name.id():
                 local_log.results("Testcase "+str(test_case)+": SKIPPED")
                 passed = False
         if passed:
-- 
2.5.1


