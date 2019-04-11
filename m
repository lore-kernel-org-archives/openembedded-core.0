Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2F5D97D58A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 05:51:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Apr 2019 22:51:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,336,1549958400"; d="scan'208";a="290556808"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga004.jf.intel.com with ESMTP; 10 Apr 2019 22:51:48 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2019 13:20:49 +0800
Message-Id: <1554960049-25729-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] resulttool/manualexecution: Refactor and remove duplicate code
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
X-List-Received-Date: Thu, 11 Apr 2019 05:51:49 -0000

Remove duplicate codes. Replace unnecessary class variables with
local variables. Rename variables and arguments with simple and
standard name.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/resulttool/manualexecution.py | 87 ++++++++++++++-----------------
 1 file changed, 40 insertions(+), 47 deletions(-)

diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index 12ef90d..ea44219 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -20,9 +20,9 @@ import re
 from oeqa.core.runner import OETestResultJSONHelper
 
 
-def load_json_file(file):
-    with open(file, "r") as f:
-        return json.load(f)
+def load_json_file(f):
+    with open(f, "r") as filedata:
+        return json.load(filedata)
 
 def write_json_file(f, json_data):
     os.makedirs(os.path.dirname(f), exist_ok=True)
@@ -31,9 +31,8 @@ def write_json_file(f, json_data):
 
 class ManualTestRunner(object):
 
-    def _get_testcases(self, file):
-        self.jdata = load_json_file(file)
-        self.test_module = self.jdata[0]['test']['@alias'].split('.', 2)[0]
+    def _get_test_module(self, case_file):
+        return os.path.basename(case_file).split('.')[0]
 
     def _get_input(self, config):
         while True:
@@ -57,23 +56,21 @@ class ManualTestRunner(object):
             print('Only integer index inputs from above available configuration options are allowed. Please try again.')
         return options[output]
 
-    def _create_config(self, config_options):
+    def _get_config(self, config_options, test_module):
         from oeqa.utils.metadata import get_layers
         from oeqa.utils.commands import get_bb_var
         from resulttool.resultutils import store_map
 
         layers = get_layers(get_bb_var('BBLAYERS'))
-        self.configuration = {}
-        self.configuration['LAYERS'] = layers
-        current_datetime = datetime.datetime.now()
-        self.starttime = current_datetime.strftime('%Y%m%d%H%M%S')
-        self.configuration['STARTTIME'] = self.starttime
-        self.configuration['TEST_TYPE'] = 'manual'
-        self.configuration['TEST_MODULE'] = self.test_module
-
-        extra_config = set(store_map['manual']) - set(self.configuration)
+        configurations = {}
+        configurations['LAYERS'] = layers
+        configurations['STARTTIME'] = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
+        configurations['TEST_TYPE'] = 'manual'
+        configurations['TEST_MODULE'] = test_module
+
+        extra_config = set(store_map['manual']) - set(configurations)
         for config in sorted(extra_config):
-            avail_config_options = self._get_available_config_options(config_options, self.test_module, config)
+            avail_config_options = self._get_available_config_options(config_options, test_module, config)
             if avail_config_options:
                 print('---------------------------------------------')
                 print('These are available configuration #%s options:' % config)
@@ -89,21 +86,19 @@ class ManualTestRunner(object):
                 print('---------------------------------------------')
                 value_conf = self._get_input('Configuration Value')
                 print('---------------------------------------------\n')
-            self.configuration[config] = value_conf
-
-    def _create_result_id(self):
-        self.result_id = 'manual_%s_%s' % (self.test_module, self.starttime)
+            configurations[config] = value_conf
+        return configurations
 
-    def _execute_test_steps(self, test):
+    def _execute_test_steps(self, case):
         test_result = {}
         print('------------------------------------------------------------------------')
-        print('Executing test case: %s' % test['test']['@alias'])
+        print('Executing test case: %s' % case['test']['@alias'])
         print('------------------------------------------------------------------------')
-        print('You have total %s test steps to be executed.' % len(test['test']['execution']))
+        print('You have total %s test steps to be executed.' % len(case['test']['execution']))
         print('------------------------------------------------------------------------\n')
-        for step, _ in sorted(test['test']['execution'].items(), key=lambda x: int(x[0])):
-            print('Step %s: %s' % (step, test['test']['execution'][step]['action']))
-            expected_output = test['test']['execution'][step]['expected_results']
+        for step, _ in sorted(case['test']['execution'].items(), key=lambda x: int(x[0])):
+            print('Step %s: %s' % (step, case['test']['execution'][step]['action']))
+            expected_output = case['test']['execution'][step]['expected_results']
             if expected_output:
                 print('Expected output: %s' % expected_output)
         while True:
@@ -118,31 +113,30 @@ class ManualTestRunner(object):
                         res = result_types[r]
                         if res == 'FAILED':
                             log_input = input('\nPlease enter the error and the description of the log: (Ex:log:211 Error Bitbake)\n')
-                            test_result.update({test['test']['@alias']: {'status': '%s' % res, 'log': '%s' % log_input}})
+                            test_result.update({case['test']['@alias']: {'status': '%s' % res, 'log': '%s' % log_input}})
                         else:
-                            test_result.update({test['test']['@alias']: {'status': '%s' % res}})
+                            test_result.update({case['test']['@alias']: {'status': '%s' % res}})
                 break
             print('Invalid input!')
         return test_result
 
-    def _create_write_dir(self):
-        basepath = os.environ['BUILDDIR']
-        self.write_dir = basepath + '/tmp/log/manual/'
+    def _get_write_dir(self):
+        return os.environ['BUILDDIR'] + '/tmp/log/manual/'
 
-    def run_test(self, file, config_options_file):
-        self._get_testcases(file)
+    def run_test(self, case_file, config_options_file):
+        test_module = self._get_test_module(case_file)
+        cases = load_json_file(case_file)
         config_options = {}
         if config_options_file:
             config_options = load_json_file(config_options_file)
-        self._create_config(config_options)
-        self._create_result_id()
-        self._create_write_dir()
+        configurations = self._get_config(config_options, test_module)
+        result_id = 'manual_%s_%s' % (test_module, configurations['STARTTIME'])
         test_results = {}
-        print('\nTotal number of test cases in this test suite: %s\n' % len(self.jdata))
-        for t in self.jdata:
-            test_result = self._execute_test_steps(t)
+        print('\nTotal number of test cases in this test suite: %s\n' % len(cases))
+        for c in cases:
+            test_result = self._execute_test_steps(c)
             test_results.update(test_result)
-        return self.configuration, self.result_id, self.write_dir, test_results
+        return configurations, result_id, self._get_write_dir(), test_results
 
     def _get_true_false_input(self, input_message):
         yes_list = ['Y', 'YES']
@@ -156,11 +150,11 @@ class ManualTestRunner(object):
             return False
         return True
 
-    def make_config_option_file(self, logger, manual_case_file, config_options_file):
+    def make_config_option_file(self, logger, case_file, config_options_file):
         config_options = {}
         if config_options_file:
             config_options = load_json_file(config_options_file)
-        new_test_module = os.path.basename(manual_case_file).split('.')[0]
+        new_test_module = self._get_test_module(case_file)
         print('Creating configuration options file for test module: %s' % new_test_module)
         new_config_options = {}
 
@@ -181,8 +175,7 @@ class ManualTestRunner(object):
         if new_config_options:
             config_options[new_test_module] = new_config_options
         if not config_options_file:
-            self._create_write_dir()
-            config_options_file = os.path.join(self.write_dir, 'manual_config_options.json')
+            config_options_file = os.path.join(self._get_write_dir(), 'manual_config_options.json')
         write_json_file(config_options_file, config_options)
         logger.info('Configuration option file created at %s' % config_options_file)
 
@@ -191,9 +184,9 @@ def manualexecution(args, logger):
     if args.make_config_options_file:
         testrunner.make_config_option_file(logger, args.file, args.config_options_file)
         return 0
-    get_configuration, get_result_id, get_write_dir, get_test_results = testrunner.run_test(args.file, args.config_options_file)
+    configurations, result_id, write_dir, test_results = testrunner.run_test(args.file, args.config_options_file)
     resultjsonhelper = OETestResultJSONHelper()
-    resultjsonhelper.dump_testresult_file(get_write_dir, get_configuration, get_result_id, get_test_results)
+    resultjsonhelper.dump_testresult_file(write_dir, configurations, result_id, test_results)
     return 0
 
 def register_commands(subparsers):
-- 
2.7.4


