Return-Path: <mazliana.mohamad@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 0034E7CE7C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 09:11:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Mar 2019 02:01:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,467,1544515200"; d="scan'208";a="140931335"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga002.jf.intel.com with ESMTP; 11 Mar 2019 02:01:39 -0700
From: mazliana.mohamad@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2019 16:30:34 +0800
Message-Id: <1552293034-65821-2-git-send-email-mazliana.mohamad@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552293034-65821-1-git-send-email-mazliana.mohamad@intel.com>
References: <1552293034-65821-1-git-send-email-mazliana.mohamad@intel.com>
Subject: [PATCH] scripts/resulttool: Enhance retrieving test cases value
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
X-List-Received-Date: Mon, 11 Mar 2019 09:11:01 -0000

From: Mazliana <mazliana.mohamad@intel.com>

We found that manualexecution does not capture test suite values
correctly if there are more than one test suite in test cases.
After verification has made we found out we should retrieved
full test cases value <test_module.test_suite.test_case> from
oeqa/manual/ json file rather than split it them into new
variables test_suite and test_cases.

Signed-off-by: Mazliana <mazliana.mohamad@intel.com>
---
 scripts/lib/resulttool/manualexecution.py | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index a44cc86..6487cd9 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -29,8 +29,7 @@ class ManualTestRunner(object):
     def __init__(self):
         self.jdata = ''
         self.test_module = ''
-        self.test_suite = ''
-        self.test_cases = ''
+        self.test_cases_id = ''
         self.configuration = ''
         self.starttime = ''
         self.result_id = ''
@@ -38,11 +37,10 @@ class ManualTestRunner(object):
 
     def _get_testcases(self, file):
         self.jdata = load_json_file(file)
-        self.test_cases = []
+        self.test_cases_id = []
         self.test_module = self.jdata[0]['test']['@alias'].split('.', 2)[0]
-        self.test_suite = self.jdata[0]['test']['@alias'].split('.', 2)[1]
         for i in self.jdata:
-            self.test_cases.append(i['test']['@alias'].split('.', 2)[2])
+            self.test_cases_id.append(i['test']['@alias'])
     
     def _get_input(self, config):
         while True:
@@ -81,10 +79,9 @@ class ManualTestRunner(object):
 
     def _execute_test_steps(self, test_id):
         test_result = {}
-        testcase_id = self.test_module + '.' + self.test_suite + '.' + self.test_cases[test_id]
         total_steps = len(self.jdata[test_id]['test']['execution'].keys())
         print('------------------------------------------------------------------------')
-        print('Executing test case:' + '' '' + self.test_cases[test_id])
+        print('Executing test case:' + '' '' + self.test_cases_id[test_id])
         print('------------------------------------------------------------------------')
         print('You have total ' + str(total_steps) + ' test steps to be executed.')
         print('------------------------------------------------------------------------\n')
@@ -105,9 +102,9 @@ class ManualTestRunner(object):
                         res = result_types[r]
                         if res == 'FAILED':
                             log_input = input('\nPlease enter the error and the description of the log: (Ex:log:211 Error Bitbake)\n')
-                            test_result.update({testcase_id: {'status': '%s' % res, 'log': '%s' % log_input}})
+                            test_result.update({self.test_cases_id[test_id]: {'status': '%s' % res, 'log': '%s' % log_input}})
                         else:
-                            test_result.update({testcase_id: {'status': '%s' % res}})
+                            test_result.update({self.test_cases_id[test_id]: {'status': '%s' % res}})
                 break
             print('Invalid input!')
         return test_result
-- 
2.7.4


