Return-Path: <sangeeta.jain@intel.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 03 Jun 2019 08:24:56 UTC
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id F090A7D3A6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 08:24:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jun 2019 01:17:51 -0700
X-ExtLoop1: 1
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga001.jf.intel.com with ESMTP; 03 Jun 2019 01:17:50 -0700
From: sangeeta.jain@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 16:17:47 +0800
Message-Id: <1559549867-1987-1-git-send-email-sangeeta.jain@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] resulttool/manualexecution: Enable creation of test case configuration
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
X-List-Received-Date: Mon, 03 Jun 2019 08:24:57 -0000

From: sangeeta jain <sangeeta.jain@intel.com>

Allow the creation of test case configuration file based on user inputs.
Where this testcase configuration file will be used by the the manual
execution to run selected test cases for a module rather than compulsory
run all test cases in manual json file.

Signed-off-by: sangeeta jain <sangeeta.jain@intel.com>
---
 scripts/lib/resulttool/manualexecution.py | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index dc368f3..534c4fe 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -187,11 +187,38 @@ class ManualTestRunner(object):
         write_json_file(config_options_file, config_options)
         logger.info('Configuration option file created at %s' % config_options_file)
 
+    def make_testcase_config_file(self, logger, case_file, testcase_config_file):
+        if  testcase_config_file:
+            if os.path.exists(testcase_config_file):
+                print('\nTest configuration file with name %s already exists. Please provide a unique file name' % (testcase_config_file))
+                return 0
+
+        if not testcase_config_file:
+            testcase_config_file = os.path.join(self._get_write_dir(), "testconfig_new.json")
+
+        testcase_config = {}
+        cases = load_json_file(case_file)
+        new_test_module = self._get_test_module(case_file)
+        new_testcase_config = {}
+        new_testcase_config['testcases'] = []
+
+        print('\nAdd testcases for this configuration file:')
+        for case in cases:
+            print('\n' + case['test']['@alias'])
+            add_tc_config = self._get_true_false_input('\nDo you want to add this test case to test configuration : (Y)es/(N)o\n')
+            if add_tc_config:
+                new_testcase_config['testcases'].append(case['test']['@alias'])
+        write_json_file(testcase_config_file, new_testcase_config)
+        logger.info('Testcase Configuration file created at %s' % testcase_config_file)
+
 def manualexecution(args, logger):
     testrunner = ManualTestRunner()
     if args.make_config_options_file:
         testrunner.make_config_option_file(logger, args.file, args.config_options_file)
         return 0
+    if args.make_testcase_config_file:
+        testrunner.make_testcase_config_file(logger, args.file, args.testcase_config_file)
+        return 0
     configurations, result_id, write_dir, test_results = testrunner.run_test(args.file, args.config_options_file, args.testcase_config_file)
     resultjsonhelper = OETestResultJSONHelper()
     resultjsonhelper.dump_testresult_file(write_dir, configurations, result_id, test_results)
@@ -209,4 +236,6 @@ def register_commands(subparsers):
     parser_build.add_argument('-m', '--make-config-options-file', action='store_true',
                               help='make the configuration options file based on provided inputs')
     parser_build.add_argument('-t', '--testcase-config-file', default='',
-                              help='the testcase configuration file to enable user to run a selected set of test case')
\ No newline at end of file
+                              help='the testcase configuration file to enable user to run a selected set of test case or make a testcase configuration file')
+    parser_build.add_argument('-d', '--make-testcase-config-file', action='store_true',
+                    help='make the testcase configuration file to run a set of test cases based on user selection')
\ No newline at end of file
-- 
2.7.4


