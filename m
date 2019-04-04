Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B0D557D45E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 09:19:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2019 02:19:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,306,1549958400"; d="scan'208";a="132891051"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga006.jf.intel.com with ESMTP; 04 Apr 2019 02:19:46 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2019 16:48:38 +0800
Message-Id: <1554367718-74682-5-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554367718-74682-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1554367718-74682-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 4/4] resulttool/manualexecution: Refactor and simplify codebase
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
X-List-Received-Date: Thu, 04 Apr 2019 09:19:45 -0000

Simplify and removed unnecessary codes.
Refactor to allow pythonic loop.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/resulttool/manualexecution.py | 56 +++++++++++--------------------
 1 file changed, 20 insertions(+), 36 deletions(-)

diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index 9a29b0b..c94f981 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -24,24 +24,12 @@ def load_json_file(file):
     with open(file, "r") as f:
         return json.load(f)
 
-
 class ManualTestRunner(object):
-    def __init__(self):
-        self.jdata = ''
-        self.test_module = ''
-        self.test_cases_id = ''
-        self.configuration = ''
-        self.starttime = ''
-        self.result_id = ''
-        self.write_dir = ''
 
     def _get_testcases(self, file):
         self.jdata = load_json_file(file)
-        self.test_cases_id = []
         self.test_module = self.jdata[0]['test']['@alias'].split('.', 2)[0]
-        for i in self.jdata:
-            self.test_cases_id.append(i['test']['@alias'])
-    
+
     def _get_input(self, config):
         while True:
             output = input('{} = '.format(config))
@@ -67,45 +55,42 @@ class ManualTestRunner(object):
         extra_config = set(store_map['manual']) - set(self.configuration)
         for config in sorted(extra_config):
             print('---------------------------------------------')
-            print('This is configuration #%s. Please provide configuration value(use "None" if not applicable).'
-                  % config)
+            print('This is configuration #%s. Please provide configuration value(use "None" if not applicable).' % config)
             print('---------------------------------------------')
             value_conf = self._get_input('Configuration Value')
             print('---------------------------------------------\n')
             self.configuration[config] = value_conf
 
     def _create_result_id(self):
-        self.result_id = 'manual_' + self.test_module + '_' + self.starttime
+        self.result_id = 'manual_%s_%s' % (self.test_module, self.starttime)
 
-    def _execute_test_steps(self, test_id):
+    def _execute_test_steps(self, test):
         test_result = {}
-        total_steps = len(self.jdata[test_id]['test']['execution'].keys())
         print('------------------------------------------------------------------------')
-        print('Executing test case:' + '' '' + self.test_cases_id[test_id])
+        print('Executing test case: %s' % test['test']['@alias'])
         print('------------------------------------------------------------------------')
-        print('You have total ' + str(total_steps) + ' test steps to be executed.')
+        print('You have total %s test steps to be executed.' % len(test['test']['execution']))
         print('------------------------------------------------------------------------\n')
-        for step, _ in sorted(self.jdata[test_id]['test']['execution'].items(), key=lambda x: int(x[0])):
-            print('Step %s: ' % step + self.jdata[test_id]['test']['execution']['%s' % step]['action'])
-            expected_output = self.jdata[test_id]['test']['execution']['%s' % step]['expected_results']
+        for step, _ in sorted(test['test']['execution'].items(), key=lambda x: int(x[0])):
+            print('Step %s: %s' % (step, test['test']['execution'][step]['action']))
+            expected_output = test['test']['execution'][step]['expected_results']
             if expected_output:
-                print('Expected output: ' + expected_output)
+                print('Expected output: %s' % expected_output)
         while True:
-            done = input('\nPlease provide test results: (P)assed/(F)ailed/(B)locked/(S)kipped? \n')
-            done = done.lower()
+            done = input('\nPlease provide test results: (P)assed/(F)ailed/(B)locked/(S)kipped? \n').lower()
             result_types = {'p':'PASSED',
-                                'f':'FAILED',
-                                'b':'BLOCKED',
-                                's':'SKIPPED'}
+                            'f':'FAILED',
+                            'b':'BLOCKED',
+                            's':'SKIPPED'}
             if done in result_types:
                 for r in result_types:
                     if done == r:
                         res = result_types[r]
                         if res == 'FAILED':
                             log_input = input('\nPlease enter the error and the description of the log: (Ex:log:211 Error Bitbake)\n')
-                            test_result.update({self.test_cases_id[test_id]: {'status': '%s' % res, 'log': '%s' % log_input}})
+                            test_result.update({test['test']['@alias']: {'status': '%s' % res, 'log': '%s' % log_input}})
                         else:
-                            test_result.update({self.test_cases_id[test_id]: {'status': '%s' % res}})
+                            test_result.update({test['test']['@alias']: {'status': '%s' % res}})
                 break
             print('Invalid input!')
         return test_result
@@ -120,9 +105,9 @@ class ManualTestRunner(object):
         self._create_result_id()
         self._create_write_dir()
         test_results = {}
-        print('\nTotal number of test cases in this test suite: ' + '%s\n' % len(self.jdata))
-        for i in range(0, len(self.jdata)):
-            test_result = self._execute_test_steps(i)
+        print('\nTotal number of test cases in this test suite: %s\n' % len(self.jdata))
+        for t in self.jdata:
+            test_result = self._execute_test_steps(t)
             test_results.update(test_result)
         return self.configuration, self.result_id, self.write_dir, test_results
 
@@ -130,8 +115,7 @@ def manualexecution(args, logger):
     testrunner = ManualTestRunner()
     get_configuration, get_result_id, get_write_dir, get_test_results = testrunner.run_test(args.file)
     resultjsonhelper = OETestResultJSONHelper()
-    resultjsonhelper.dump_testresult_file(get_write_dir, get_configuration, get_result_id,
-                                          get_test_results)
+    resultjsonhelper.dump_testresult_file(get_write_dir, get_configuration, get_result_id, get_test_results)
     return 0
 
 def register_commands(subparsers):
-- 
2.7.4


