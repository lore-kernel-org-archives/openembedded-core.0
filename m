Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 4A1C17C0D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 10:13:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jan 2019 02:13:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,505,1539673200"; d="scan'208";a="111696335"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008.jf.intel.com with ESMTP; 22 Jan 2019 02:13:29 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jan 2019 17:42:11 +0800
Message-Id: <1548150131-65036-3-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548150131-65036-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1548150131-65036-1-git-send-email-ee.peng.yeoh@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2 v5] scripts/resultstool: enable manual execution and result creation
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
X-List-Received-Date: Tue, 22 Jan 2019 10:13:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mazliana <mazliana.mohamad@intel.com>

Integrated “manualexecution” operation to test-case-mgmt scripts.
Manual execution script is a helper script to execute all manual
test cases in baseline command, which consists of user guideline
steps and the expected results. The last step will ask user to
provide their input to execute result. The input options are
passed/failed/blocked/skipped status. The result given will be
written in testresults.json including log error from the user
input and configuration if there is any.The output test result
for json file is created by using OEQA library.

The configuration part is manually key-in by the user. The system
allow user to specify how many configuration they want to add and
they need to define the required configuration name and value pair.
In QA perspective, "configuration" means the test environments and
parameters used during QA setup before testing can be carry out.
Example of configurations: image used for boot up, host machine
distro used, poky configurations, etc.

The purpose of adding the configuration is to standardize the
output test result format between automation and manual execution.

To use these scripts, first source oe environment, then run the
entry point script to look for help.
        $ resultstool

To execute manual test cases, execute the below
        $ resultstool  manualexecution <manualjsonfile>

By default testresults.json store in <build_dir>/tmp/log/manual/

[YOCTO #12651]

Signed-off-by: Mazliana <mazliana.mohamad@intel.com>
Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/resultstool/manualexecution.py | 137 +++++++++++++++++++++++++++++
 scripts/resultstool                        |   8 ++
 2 files changed, 145 insertions(+)
 create mode 100644 scripts/lib/resultstool/manualexecution.py

diff --git a/scripts/lib/resultstool/manualexecution.py b/scripts/lib/resultstool/manualexecution.py
new file mode 100644
index 0000000..e0c0c36
--- /dev/null
+++ b/scripts/lib/resultstool/manualexecution.py
@@ -0,0 +1,137 @@
+# test case management tool - manual execution from testopia test cases
+#
+# Copyright (c) 2018, Intel Corporation.
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms and conditions of the GNU General Public License,
+# version 2, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+# more details.
+#
+import argparse
+import json
+import os
+import sys
+import datetime
+import re
+from oeqa.core.runner import OETestResultJSONHelper
+from resultstool.resultsutils import load_json_file
+
+class ManualTestRunner(object):
+    def __init__(self):
+        self.jdata = ''
+        self.test_module = ''
+        self.test_suite = ''
+        self.test_cases = ''
+        self.configuration = ''
+        self.starttime = ''
+        self.result_id = ''
+        self.write_dir = ''
+
+    def _get_testcases(self, file):
+        self.jdata = load_json_file(file)
+        self.test_cases = []
+        self.test_module = self.jdata[0]['test']['@alias'].split('.', 2)[0]
+        self.test_suite = self.jdata[0]['test']['@alias'].split('.', 2)[1]
+        for i in self.jdata:
+            self.test_cases.append(i['test']['@alias'].split('.', 2)[2])
+    
+    def _get_input(self, config):
+        while True:
+            output = input('{} = '.format(config))
+            if re.match('^[a-zA-Z0-9_]+$', output):
+                break
+            print('Only alphanumeric and underscore are allowed. Please try again')
+        return output
+
+    def _create_config(self):
+        self.configuration = {}
+        while True:
+            try:
+                conf_total = int(input('\nPlease provide how many configuration you want to save \n'))
+                break
+            except ValueError:
+                print('Invalid input. Please provide input as a number not character.')
+        for i in range(conf_total):
+            print('---------------------------------------------')
+            print('This is configuration #%s ' % (i + 1) + '. Please provide configuration name and its value')
+            print('---------------------------------------------')
+            name_conf = self._get_input('Configuration Name')
+            value_conf = self._get_input('Configuration Value')
+            print('---------------------------------------------\n')
+            self.configuration[name_conf.upper()] = value_conf
+        current_datetime = datetime.datetime.now()
+        self.starttime = current_datetime.strftime('%Y%m%d%H%M%S')
+        self.configuration['STARTTIME'] = self.starttime
+        self.configuration['TEST_TYPE'] = self.test_module
+
+    def _create_result_id(self):
+        self.result_id = 'manual_' + self.test_module + '_' + self.starttime
+
+    def _execute_test_steps(self, test_id):
+        test_result = {}
+        testcase_id = self.test_module + '.' + self.test_suite + '.' + self.test_cases[test_id]
+        total_steps = len(self.jdata[test_id]['test']['execution'].keys())
+        print('------------------------------------------------------------------------')
+        print('Executing test case:' + '' '' + self.test_cases[test_id])
+        print('------------------------------------------------------------------------')
+        print('You have total ' + str(total_steps) + ' test steps to be executed.')
+        print('------------------------------------------------------------------------\n')
+        for step in sorted((self.jdata[test_id]['test']['execution']).keys()):
+            print('Step %s: ' % step + self.jdata[test_id]['test']['execution']['%s' % step]['action'])
+            print('Expected output: ' + self.jdata[test_id]['test']['execution']['%s' % step]['expected_results'])
+            done = input('\nPlease press ENTER when you are done to proceed to next step.\n')
+        while True:
+            done = input('\nPlease provide test results: (P)assed/(F)ailed/(B)locked/(S)kipped? \n')
+            done = done.lower()
+            result_types = {'p':'PASSED',
+                                'f':'FAILED',
+                                'b':'BLOCKED',
+                                's':'SKIPPED'}
+            if done in result_types:
+                for r in result_types:
+                    if done == r:
+                        res = result_types[r]
+                        if res == 'FAILED':
+                            log_input = input('\nPlease enter the error and the description of the log: (Ex:log:211 Error Bitbake)\n')
+                            test_result.update({testcase_id: {'status': '%s' % res, 'log': '%s' % log_input}})
+                        else:
+                            test_result.update({testcase_id: {'status': '%s' % res}})
+                break
+            print('Invalid input!')
+        return test_result
+
+    def _create_write_dir(self):
+        basepath = os.environ['BUILDDIR']
+        self.write_dir = basepath + '/tmp/log/manual/'
+
+    def run_test(self, file):
+        self._get_testcases(file)
+        self._create_config()
+        self._create_result_id()
+        self._create_write_dir()
+        test_results = {}
+        print('\nTotal number of test cases in this test suite: ' + '%s\n' % len(self.jdata))
+        for i in range(0, len(self.jdata)):
+            test_result = self._execute_test_steps(i)
+            test_results.update(test_result)
+        return self.configuration, self.result_id, self.write_dir, test_results
+
+def manualexecution(args, logger):
+    testrunner = ManualTestRunner()
+    get_configuration, get_result_id, get_write_dir, get_test_results = testrunner.run_test(args.file)
+    resultjsonhelper = OETestResultJSONHelper()
+    resultjsonhelper.dump_testresult_file(get_write_dir, get_configuration, get_result_id,
+                                          get_test_results)
+    return 0
+
+def register_commands(subparsers):
+    """Register subcommands from this plugin"""
+    parser_build = subparsers.add_parser('manualexecution', help='Helper script for results populating during manual test execution.',
+                                         description='Helper script for results populating during manual test execution. You can find manual test case JSON file in meta/lib/oeqa/manual/',
+                                         group='manualexecution')
+    parser_build.set_defaults(func=manualexecution)
+    parser_build.add_argument('file', help='Specify path to manual test case JSON file.Note: Please use \"\" to encapsulate the file path.')
\ No newline at end of file
diff --git a/scripts/resultstool b/scripts/resultstool
index 35cf080..e2bd590 100755
--- a/scripts/resultstool
+++ b/scripts/resultstool
@@ -17,6 +17,11 @@
 # To perform regression analysis, execute the below
 #     $ resultstool regression <base_result_file> <target_result_file>
 #
+# To execute manual test cases, execute the below
+#     $ resultstool manualexecution <manualjsonfile>
+#
+# By default testresults.json for manualexecution store in <build>/tmp/log/manual/
+#
 # Copyright (c) 2019, Intel Corporation.
 #
 # This program is free software; you can redistribute it and/or modify it
@@ -42,6 +47,7 @@ import resultstool.merge
 import resultstool.store
 import resultstool.regression
 import resultstool.report
+import resultstool.manualexecution
 logger = scriptutils.logger_create('resultstool')
 
 def _validate_user_input_arguments(args):
@@ -58,6 +64,8 @@ def main():
     parser.add_argument('-q', '--quiet', help='print only errors', action='store_true')
     subparsers = parser.add_subparsers(dest="subparser_name", title='subcommands', metavar='<subcommand>')
     subparsers.required = True
+    subparsers.add_subparser_group('manualexecution', 'manual test cases', 300)
+    resultstool.manualexecution.register_commands(subparsers)
     subparsers.add_subparser_group('setup', 'setup', 200)
     resultstool.merge.register_commands(subparsers)
     resultstool.store.register_commands(subparsers)
-- 
2.7.4


