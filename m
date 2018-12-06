Return-Path: <mazliana.mohamad@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 802C179988
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 11:14:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Dec 2018 03:14:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,322,1539673200"; d="scan'208";a="116494315"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga001.jf.intel.com with ESMTP; 06 Dec 2018 03:14:29 -0800
From: mazliana.mohamad@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2018 18:59:27 +0800
Message-Id: <1544093967-5387-2-git-send-email-mazliana.mohamad@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544093967-5387-1-git-send-email-mazliana.mohamad@intel.com>
References: <1544093967-5387-1-git-send-email-mazliana.mohamad@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] script/lib/testcasemgmt/manualexecution.py : manual helper script with bare-minimum function
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
X-List-Received-Date: Thu, 06 Dec 2018 11:14:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mazliana <mazliana.mohamad@intel.com>

Manual execution is a helper script to execute all manual test cases in baseline command. Basically, this script
will show the steps and expected results. Then, in the end of the steps, user need to give their input for the result.
The input based on the passed/failed/skipped status. The result given will  be stored in testresults.json and it will
stored the log error given by user input & the configuration. The output test result for json file was created by using
OEQA library.

The configuration part is manually key-in by user. The system allow user to specify how many configuration they want to
add and they needs to define the configuration name and value pair needed. The configuration part was added because we
want to standardize the output test result format between automation and manual execution.
  
[YOCTO #12651]

Signed-off-by: Mazliana <mazliana.mohamad@intel.com>
---
 scripts/lib/testcasemgmt/manualexecution.py | 141 ++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 scripts/lib/testcasemgmt/manualexecution.py

diff --git a/scripts/lib/testcasemgmt/manualexecution.py b/scripts/lib/testcasemgmt/manualexecution.py
new file mode 100644
index 0000000..2911c1e
--- /dev/null
+++ b/scripts/lib/testcasemgmt/manualexecution.py
@@ -0,0 +1,141 @@
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
+import scriptpath
+import re
+scriptpath.add_oe_lib_path()
+scriptpath.add_bitbake_lib_path()
+import bb.utils
+from oeqa.core.runner import OETestResultJSONHelper
+
+class ManualTestRunner(object):
+    def __init__(self):
+        self.jdata = ''
+        self.testmodule = ''
+        self.testsuite = ''
+        self.testcase = ''
+        self.configuration = ''
+        self.host_distro = ''
+        self.host_name = ''
+        self.machine = ''
+        self.starttime = ''
+        self.result_id = ''
+
+    def read_json(self, file):
+        self.jdata = json.load(open('%s' % file))
+        self.testcase = []
+        self.testmodule = self.jdata[0]['test']['@alias'].split('.', 2)[0]
+        self.testsuite = self.jdata[0]['test']['@alias'].split('.', 2)[1]
+        for i in range(0, len(self.jdata)):
+            self.testcase.append(self.jdata[i]['test']['@alias'].split('.', 2)[2])
+        return self.jdata, self.testmodule, self.testsuite, self.testcase
+    
+    def get_input(self, config):
+        while True:
+            output = input('{} = '.format(config))
+            if re.match('^[a-zA-Z0-9_]+$', output):
+                break
+            print('Only alphanumeric and underscore are allowed. Please try again')
+        return output
+
+    def create_config(self):
+        self.configuration = {}
+        while True:
+            try:
+                conf_total = int(input('\nPlease provide how many configuration you want to save \n'))
+                break
+            except ValueError:
+                print('Invalid input. Please provide input as a number not character.')
+        for i in range(conf_total):
+            print('---------------------------------------------')
+            print('This is your %s ' % (i + 1) + 'configuration. Please provide configuration name and its value')
+            print('---------------------------------------------')
+            self.name_conf = self.get_input('Configuration Name')
+            self.value_conf = self.get_input('Configuration Value')
+            print('---------------------------------------------\n')
+            self.configuration[self.name_conf.upper()] = self.value_conf
+        self.currentDT = datetime.datetime.now()
+        self.starttime = self.currentDT.strftime('%Y%m%d%H%M%S')
+        self.test_type = self.testmodule
+        self.configuration['STARTTIME'] = self.starttime
+        self.configuration['TEST_TYPE'] = self.test_type
+        return self.configuration
+
+    def create_result_id(self):
+        self.result_id = 'manual_' + self.test_type + '_' + self.starttime
+        return self.result_id
+
+    def execute_test_steps(self, testID):
+        temp = {}
+        testcaseID = self.testmodule + '.' + self.testsuite + '.' + self.testcase[testID]
+        print('------------------------------------------------------------------------')
+        print('Executing test case:' + '' '' + self.testcase[testID])
+        print('------------------------------------------------------------------------')
+        print('You have total ' + max(self.jdata[testID]['test']['execution'].keys()) + ' test steps to be executed.')
+        print('------------------------------------------------------------------------\n')
+
+        for step in range(1, int(max(self.jdata[testID]['test']['execution'].keys()) + '1')):
+            print('Step %s: ' % step + self.jdata[testID]['test']['execution']['%s' % step]['action'])
+            print('Expected output: ' + self.jdata[testID]['test']['execution']['%s' % step]['expected_results'])
+            if step == int(max(self.jdata[testID]['test']['execution'].keys())):
+                done = input('\nPlease provide test results: (P)assed/(F)ailed/(B)locked? \n')
+                break
+            else:
+                done = input('\nPlease press ENTER when you are done to proceed to next step.\n')
+                step = step + 1
+
+        if done == 'p' or done == 'P':
+            res = 'PASSED'
+        elif done == 'f' or done == 'F':
+            res = 'FAILED'
+            log_input = input('\nPlease enter the error and the description of the log: (Ex:log:211 Error Bitbake)\n')
+        elif done == 'b' or done == 'B':
+            res = 'BLOCKED'
+        else:
+            res = 'SKIPPED'
+            
+        if res == 'FAILED':
+            temp.update({testcaseID: {'status': '%s' % res, 'log': '%s' % log_input}})
+        else:
+            temp.update({testcaseID: {'status': '%s' % res}})
+        return temp
+
+def manualexecution(args, logger):
+    basepath = os.getcwd()
+    write_dir = basepath + '/tmp/log/manual/'
+    sys.path.insert(0, write_dir)
+    manualtestcasejson = ManualTestRunner()
+    manualtestcasejson.read_json(args.file)
+    test_result = {}
+    manualtestcasejson.create_config()
+    manualtestcasejson.create_result_id()
+    print('\nTotal number of test cases in this test suite: ' + '%s\n' % len(manualtestcasejson.jdata))
+    for i in range(0, len(manualtestcasejson.jdata)):
+        test_results = manualtestcasejson.execute_test_steps(i)
+        test_result.update(test_results)
+    resultjsonhelper = OETestResultJSONHelper()
+    resultjsonhelper.dump_testresult_file(write_dir, manualtestcasejson.configuration, manualtestcasejson.result_id, test_result)
+    return 0
+
+def register_commands(subparsers):
+    """Register subcommands from this plugin"""
+    parser_build = subparsers.add_parser('manualexecution', help='Helper script for results populating during manual test execution.',
+                                         description='Helper script for results populating during manual test execution. You can find file in meta/lib/oeqa/manual/',
+                                         group='manualexecution')
+    parser_build.set_defaults(func=manualexecution)
+    parser_build.add_argument('file', help='Specify path to manual test case JSON file.Note: Please use \"\" to encapsulate the file path.')
-- 
2.7.4


