Return-Path: <sangeeta.jain@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 6C7C26C106
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 08:53:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Apr 2019 01:53:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,369,1549958400"; d="scan'208";a="162995403"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2019 01:53:27 -0700
From: sangeeta.jain@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Apr 2019 16:22:26 +0800
Message-Id: <1555662146-74749-1-git-send-email-sangeeta.jain@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] resulttool/manualexecution: Enable test case configuration option
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
X-List-Received-Date: Fri, 19 Apr 2019 08:53:39 -0000

From: sangeeta jain <sangeeta.jain@intel.com>

Current manualexecution required user to exceute all test cases defined inside a "modulename.json" file in oeqa/manual

There are cases when all test cases all not required to run for a module on specific DUT.

Enable manualexecution to have the optional feature where it will use pre-defined json format test case configuration file
where user will be able to select test cases from the "modulename.json" instead of running all of them. This will help
in reducing testing time and reporting unneccesary skip or failures.

Example pre-defined json format test case configuration file (for build-applince):

{
    "testcases" : [
        "build-appliance.build-appliance.Create_core-image-sato-sdk_using_build_appliance",
        "build-appliance.build-appliance.Build_a_image_without_error_(added_recipe)"
    ]
}

Signed-off-by: sangeeta jain <sangeeta.jain@intel.com>
---
 scripts/lib/resulttool/manualexecution.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index ea44219..dc368f3 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -17,6 +17,7 @@ import os
 import sys
 import datetime
 import re
+import copy
 from oeqa.core.runner import OETestResultJSONHelper
 
 
@@ -123,7 +124,7 @@ class ManualTestRunner(object):
     def _get_write_dir(self):
         return os.environ['BUILDDIR'] + '/tmp/log/manual/'
 
-    def run_test(self, case_file, config_options_file):
+    def run_test(self, case_file, config_options_file, testcase_config_file):
         test_module = self._get_test_module(case_file)
         cases = load_json_file(case_file)
         config_options = {}
@@ -132,6 +133,13 @@ class ManualTestRunner(object):
         configurations = self._get_config(config_options, test_module)
         result_id = 'manual_%s_%s' % (test_module, configurations['STARTTIME'])
         test_results = {}
+        if testcase_config_file:
+            test_case_config = load_json_file(testcase_config_file)
+            test_case_to_execute = test_case_config['testcases']
+            for case in copy.deepcopy(cases) :
+                if case['test']['@alias'] not in test_case_to_execute:
+                    cases.remove(case)
+
         print('\nTotal number of test cases in this test suite: %s\n' % len(cases))
         for c in cases:
             test_result = self._execute_test_steps(c)
@@ -184,7 +192,7 @@ def manualexecution(args, logger):
     if args.make_config_options_file:
         testrunner.make_config_option_file(logger, args.file, args.config_options_file)
         return 0
-    configurations, result_id, write_dir, test_results = testrunner.run_test(args.file, args.config_options_file)
+    configurations, result_id, write_dir, test_results = testrunner.run_test(args.file, args.config_options_file, args.testcase_config_file)
     resultjsonhelper = OETestResultJSONHelper()
     resultjsonhelper.dump_testresult_file(write_dir, configurations, result_id, test_results)
     return 0
@@ -200,3 +208,5 @@ def register_commands(subparsers):
                               help='the config options file to import and used as available configuration option selection or make config option file')
     parser_build.add_argument('-m', '--make-config-options-file', action='store_true',
                               help='make the configuration options file based on provided inputs')
+    parser_build.add_argument('-t', '--testcase-config-file', default='',
+                              help='the testcase configuration file to enable user to run a selected set of test case')
\ No newline at end of file
-- 
2.7.4


