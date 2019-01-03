Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id C67856C455
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 07:54:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jan 2019 23:54:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,434,1539673200"; d="scan'208";a="307091625"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga006.fm.intel.com with ESMTP; 02 Jan 2019 23:54:42 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jan 2019 15:23:15 +0800
Message-Id: <1546500195-57586-4-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1546500195-57586-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1546500195-57586-1-git-send-email-ee.peng.yeoh@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3 v2] scripts/test-case-mgmt: enable manual execution and result creation
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
X-List-Received-Date: Thu, 03 Jan 2019 07:54:41 -0000
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
        $ test-case-mgmt

To execute manual test cases, execute the below
        $ test-case-mgmt manualexecution <manualjsonfile>

By default testresults.json store in <build_dir>/tmp/log/manual/

[YOCTO #12651]

Signed-off-by: Mazliana <mazliana.mohamad@intel.com>
---
 scripts/lib/testcasemgmt/manualexecution.py | 142 ++++++++++++++++++++++++++++
 scripts/test-case-mgmt                      |  11 ++-
 2 files changed, 152 insertions(+), 1 deletion(-)
 create mode 100644 scripts/lib/testcasemgmt/manualexecution.py

diff --git a/scripts/lib/testcasemgmt/manualexecution.py b/scripts/lib/testcasemgmt/manualexecution.py
new file mode 100644
index 0000000..8fd378d
--- /dev/null
+++ b/scripts/lib/testcasemgmt/manualexecution.py
@@ -0,0 +1,142 @@
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
+
+class ManualTestRunner(object):
+    def __init__(self):
+        self.jdata = ''
+        self.test_module = ''
+        self.test_suite = ''
+        self.test_case = ''
+        self.configuration = ''
+        self.starttime = ''
+        self.result_id = ''
+        self.write_dir = ''
+
+    def _read_json(self, file):
+        self.jdata = json.load(open('%s' % file))
+        self.test_case = []
+        self.test_module = self.jdata[0]['test']['@alias'].split('.', 2)[0]
+        self.test_suite = self.jdata[0]['test']['@alias'].split('.', 2)[1]
+        for i in range(0, len(self.jdata)):
+            self.test_case.append(self.jdata[i]['test']['@alias'].split('.', 2)[2])
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
+        testcase_id = self.test_module + '.' + self.test_suite + '.' + self.test_case[test_id]
+        total_steps = len(self.jdata[test_id]['test']['execution'].keys())
+        print('------------------------------------------------------------------------')
+        print('Executing test case:' + '' '' + self.test_case[test_id])
+        print('------------------------------------------------------------------------')
+        print('You have total ' + str(total_steps) + ' test steps to be executed.')
+        print('------------------------------------------------------------------------\n')
+
+        for step in range (1, (total_steps + 1)):
+            print('Step %s: ' % step + self.jdata[test_id]['test']['execution']['%s' % step]['action'])
+            print('Expected output: ' + self.jdata[test_id]['test']['execution']['%s' % step]['expected_results'])
+            if step == total_steps:
+                while True:
+                    try:
+                        done = input('\nPlease provide test results: (P)assed/(F)ailed/(B)locked/(S)kipped? \n')
+                        done = done.lower()
+                        if done == 'p':
+                            res = 'PASSED'
+                        elif done == 'f':
+                            res = 'FAILED'
+                            log_input = input('\nPlease enter the error and the description of the log: (Ex:log:211 Error Bitbake)\n')
+                        elif done == 'b':
+                            res = 'BLOCKED'
+                        elif done == 's':
+                            res = 'SKIPPED'
+
+                        if res == 'FAILED':
+                            test_result.update({testcase_id: {'status': '%s' % res, 'log': '%s' % log_input}})
+                        else:
+                            test_result.update({testcase_id: {'status': '%s' % res}})
+                        break
+                    except:
+                        print('Invalid input!')
+            else:
+                done = input('\nPlease press ENTER when you are done to proceed to next step.\n')
+        return test_result
+
+    def _create_write_dir(self):
+        basepath = os.environ['BUILDDIR']
+        self.write_dir = basepath + '/tmp/log/manual/'
+
+    def run_test(self, file):
+        self._read_json(file)
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
diff --git a/scripts/test-case-mgmt b/scripts/test-case-mgmt
index 0df305d..5c1d435 100755
--- a/scripts/test-case-mgmt
+++ b/scripts/test-case-mgmt
@@ -8,7 +8,7 @@
 # test-case-mgmt script was designed as part of the helper script for below purpose:
 # 1. To store test result inside git repository
 # 2. To report text-based test result summary
-# 3. (Future) To execute manual test cases
+# 3. To execute manual test cases
 #
 # To look for help information.
 #    $ test-case-mgmt
@@ -19,6 +19,12 @@
 # To report test result summary, execute the below
 #     $ test-case-mgmt report <git_branch>
 #
+# To execute manual test cases, execute the below
+#    $ test-case-mgmt manualexecution <manualjsonfile>
+#
+# By default testresults.json for manualexecution store in <build_dir>/tmp/log/manual/
+#
+#
 # Copyright (c) 2018, Intel Corporation.
 #
 # This program is free software; you can redistribute it and/or modify it
@@ -42,6 +48,7 @@ import argparse_oe
 import scriptutils
 import testcasemgmt.store
 import testcasemgmt.report
+import testcasemgmt.manualexecution
 logger = scriptutils.logger_create('test-case-mgmt')
 
 def _validate_user_input_arguments(args):
@@ -72,6 +79,8 @@ def main():
     parser.add_argument('-q', '--quiet', help='print only errors', action='store_true')
     subparsers = parser.add_subparsers(dest="subparser_name", title='subcommands', metavar='<subcommand>')
     subparsers.required = True
+    subparsers.add_subparser_group('manualexecution', 'execute manual test cases', 300)
+    testcasemgmt.manualexecution.register_commands(subparsers)
     subparsers.add_subparser_group('store', 'store test result', 200)
     testcasemgmt.store.register_commands(subparsers)
     subparsers.add_subparser_group('report', 'report test result summary', 100)
-- 
2.7.4


