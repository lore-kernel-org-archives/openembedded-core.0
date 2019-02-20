Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id AC4AE7CB00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 21:39:55 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id t18so27797838wrx.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 13:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yITTBoCBjrYBTuFIqMEWooHEDWNF+Z+RHcAuCl5uA8Q=;
	b=VtdEWB/HLClAAYGUUeGJBRpStINcfRxE3CZw3cOSXaPu4ybTS4peMjvkYKqoO6r8n3
	KZUxbJD8C2ngBWpA+wwXqr9QIM0GmEe4sFyefRDGteDP9X/JwIJHhMakl2hqoM/oVyGo
	Yr+MK6cOwUJMglt/i3eJCwyje8j8cCIrnldYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yITTBoCBjrYBTuFIqMEWooHEDWNF+Z+RHcAuCl5uA8Q=;
	b=VkKKmX3Nqo25ivnqzZi1XkysKLIOSyVlUgWlXeOEBHul0Bn1+iPjrordQgNQKTGXVJ
	eYrKLBkB8qm9+7Cl1kR9l9HC3k1oYCs17x2gxkSCMGZ03tycZSMruhaoSsOxr4pgAIgk
	46thCQka8USTVBKzrUAaTrm9jXG7wIrz0lYaH3mKS9VSDGmzZvfiDxnGPMBP0u+hqsOA
	NBA9JJkThmXD6vq4wu2rp6fLU4kxM5UZQP1GOyLOJR9wPWE0CT/tbi7/tCOp/S/TI/7C
	+h5EQXlFxnxs7OgcAG2wSXsFpQnjsEHujHCUafgwDzyjlmgg51W2C+Vviz+GFnX65dIA
	cLyQ==
X-Gm-Message-State: AHQUAuaCmoHuQ1YL5Xs8b8BIH9uLLQnMbM3xf25QIjVGJM7EmZ50sJ1i
	agGC4q3dh6MNQsRQGgkh4XC8Se7kvlw=
X-Google-Smtp-Source: AHgI3IbFDIz/smyz9JhsZKpQEXq9bbf52Rr0dE5KwNzX+AJl6v1RKsgFhQPlVP5KNfb+WNh7cLlhoA==
X-Received: by 2002:adf:b687:: with SMTP id j7mr4281491wre.81.1550698794586;
	Wed, 20 Feb 2019 13:39:54 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k6sm13243581wrq.82.2019.02.20.13.39.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 13:39:53 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2019 21:39:50 +0000
Message-Id: <20190220213951.9462-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] resulttool: Improvements to allow integration to the autobuilder
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
X-List-Received-Date: Wed, 20 Feb 2019 21:39:56 -0000
Content-Transfer-Encoding: 8bit

This is a combined patch of the various tweaks and improvements I
made to resulttool:

* Avoid subprocess.run() as its a python 3.6 feature and we
  have autobuilder workers with 3.5.

* Avoid python keywords as variable names

* Simplify dict accesses using .get()

* Rename resultsutils -> resultutils to match the resultstool ->
  resulttool rename

* Formalised the handling of "file_name" to "TESTSERIES" which the code
  will now add into the json configuration data if its not present, based
  on the directory name.

* When we don't have failed test cases, print something saying so
  instead of an empty table

* Tweak the table headers in the report to be more readable (reference
  "Test Series" instead if file_id and ID instead of results_id)

* Improve/simplify the max string length handling

* Merge the counts and percentage data into one table in the report
  since printing two reports of the same data confuses the user

* Removed the confusing header in the regression report

* Show matches, then regressions, then unmatched runs in the regression
  report, also remove chatting unneeded output

* Try harder to "pair" up matching configurations to reduce noise in
  the regressions report

* Abstracted the "mapping" table concept used to pairing in the
  regression code to general code in resultutils

* Created multiple mappings for results analysis, results storage and
  'flattening' results data in a merge

* Simplify the merge command to take a source and a destination,
  letting the destination be a directory or a file, removing the need for
  an output directory parameter

* Add the 'IMAGE_PKGTYPE' and 'DISTRO' config options to the regression
  mappings

* Have the store command place the testresults files in a layout from
  the mapping, making commits into the git repo for results storage more
  useful for simple comparison purposes

* Set the oe-git-archive tag format appropriately for oeqa results
  storage (and simplify the commit messages closer to their defaults)

* Fix oe-git-archive to use the commit/branch data from the results file

* Cleaned up the command option help to match other changes

* Follow the model of git branch/tag processing used by oe-build-perf-report
  and use that to read the data using git show to avoid branch change

* Add ptest summary to the report command

* Update the tests to match the above changes

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../oeqa/selftest/cases/resulttooltests.py    | 106 +++---
 scripts/lib/resulttool/manualexecution.py     |   8 +-
 scripts/lib/resulttool/merge.py               |  69 ++--
 scripts/lib/resulttool/regression.py          | 328 +++++++++---------
 scripts/lib/resulttool/report.py              | 157 +++++----
 scripts/lib/resulttool/resultsutils.py        |  67 ----
 scripts/lib/resulttool/resultutils.py         | 127 +++++++
 scripts/lib/resulttool/store.py               | 136 ++++----
 .../template/test_report_full_text.txt        |  33 +-
 scripts/resulttool                            |   7 +-
 10 files changed, 530 insertions(+), 508 deletions(-)
 delete mode 100644 scripts/lib/resulttool/resultsutils.py
 create mode 100644 scripts/lib/resulttool/resultutils.py

diff --git a/meta/lib/oeqa/selftest/cases/resulttooltests.py b/meta/lib/oeqa/selftest/cases/resulttooltests.py
index 7bf1ec60c12..0a089c0b7f0 100644
--- a/meta/lib/oeqa/selftest/cases/resulttooltests.py
+++ b/meta/lib/oeqa/selftest/cases/resulttooltests.py
@@ -4,13 +4,46 @@ basepath = os.path.abspath(os.path.dirname(__file__) + '/../../../../../')
 lib_path = basepath + '/scripts/lib'
 sys.path = sys.path + [lib_path]
 from resulttool.report import ResultsTextReport
-from resulttool.regression import ResultsRegressionSelector, ResultsRegression
-from resulttool.merge import ResultsMerge
-from resulttool.store import ResultsGitStore
-from resulttool.resultsutils import checkout_git_dir
+from resulttool import regression as regression
+from resulttool import resultutils as resultutils
 from oeqa.selftest.case import OESelftestTestCase
 
 class ResultToolTests(OESelftestTestCase):
+    base_results_data = {'base_result1': {'configuration': {"TEST_TYPE": "runtime",
+                                                            "TESTSERIES": "series1",
+                                                            "IMAGE_BASENAME": "image",
+                                                            "IMAGE_PKGTYPE": "ipk",
+                                                            "DISTRO": "mydistro",
+                                                            "MACHINE": "qemux86"},
+                                          'result': {}},
+                         'base_result2': {'configuration': {"TEST_TYPE": "runtime",
+                                                            "TESTSERIES": "series1",
+                                                            "IMAGE_BASENAME": "image",
+                                                            "IMAGE_PKGTYPE": "ipk",
+                                                            "DISTRO": "mydistro",
+                                                            "MACHINE": "qemux86-64"},
+                                          'result': {}}}
+    target_results_data = {'target_result1': {'configuration': {"TEST_TYPE": "runtime",
+                                                                "TESTSERIES": "series1",
+                                                                "IMAGE_BASENAME": "image",
+                                                                "IMAGE_PKGTYPE": "ipk",
+                                                                "DISTRO": "mydistro",
+                                                                "MACHINE": "qemux86"},
+                                          'result': {}},
+                           'target_result2': {'configuration': {"TEST_TYPE": "runtime",
+                                                                "TESTSERIES": "series1",
+                                                                "IMAGE_BASENAME": "image",
+                                                                "IMAGE_PKGTYPE": "ipk",
+                                                                "DISTRO": "mydistro",
+                                                                "MACHINE": "qemux86"},
+                                          'result': {}},
+                           'target_result3': {'configuration': {"TEST_TYPE": "runtime",
+                                                                "TESTSERIES": "series1",
+                                                                "IMAGE_BASENAME": "image",
+                                                                "IMAGE_PKGTYPE": "ipk",
+                                                                "DISTRO": "mydistro",
+                                                                "MACHINE": "qemux86-64"},
+                                          'result': {}}}
 
     def test_report_can_aggregate_test_result(self):
         result_data = {'result': {'test1': {'status': 'PASSED'},
@@ -25,23 +58,12 @@ class ResultToolTests(OESelftestTestCase):
         self.assertTrue(result_report['skipped'] == 1, msg="Skipped count not correct:%s" % result_report['skipped'])
 
     def test_regression_can_get_regression_base_target_pair(self):
-        base_results_data = {'base_result1': {'configuration': {"TEST_TYPE": "oeselftest",
-                                                                "HOST": "centos-7"}},
-                             'base_result2': {'configuration': {"TEST_TYPE": "oeselftest",
-                                                                "HOST": "centos-7",
-                                                                "MACHINE": "qemux86-64"}}}
-        target_results_data = {'target_result1': {'configuration': {"TEST_TYPE": "oeselftest",
-                                                                    "HOST": "centos-7"}},
-                               'target_result2': {'configuration': {"TEST_TYPE": "oeselftest",
-                                                                    "HOST": "centos-7",
-                                                                    "MACHINE": "qemux86"}},
-                               'target_result3': {'configuration': {"TEST_TYPE": "oeselftest",
-                                                                    "HOST": "centos-7",
-                                                                    "MACHINE": "qemux86-64"}}}
-        regression = ResultsRegressionSelector()
-        pair = regression.get_regression_base_target_pair(self.logger, base_results_data, target_results_data)
-        self.assertTrue('target_result1' in pair['base_result1'], msg="Pair not correct:%s" % pair['base_result1'])
-        self.assertTrue('target_result3' in pair['base_result2'], msg="Pair not correct:%s" % pair['base_result2'])
+
+        results = {}
+        resultutils.append_resultsdata(results, ResultToolTests.base_results_data)
+        resultutils.append_resultsdata(results, ResultToolTests.target_results_data)
+        self.assertTrue('target_result1' in results['runtime/mydistro/qemux86/image'], msg="Pair not correct:%s" % results)
+        self.assertTrue('target_result3' in results['runtime/mydistro/qemux86-64/image'], msg="Pair not correct:%s" % results)
 
     def test_regrresion_can_get_regression_result(self):
         base_result_data = {'result': {'test1': {'status': 'PASSED'},
@@ -54,8 +76,7 @@ class ResultToolTests(OESelftestTestCase):
                                          'test3': {'status': 'PASSED'},
                                          'test4': {'status': 'ERROR'},
                                          'test5': {'status': 'SKIPPED'}}}
-        regression = ResultsRegression()
-        result = regression.get_regression_result(self.logger, base_result_data, target_result_data)
+        result, text = regression.compare_result(self.logger, "BaseTestRunName", "TargetTestRunName", base_result_data, target_result_data)
         self.assertTrue(result['test2']['base'] == 'PASSED',
                         msg="regression not correct:%s" % result['test2']['base'])
         self.assertTrue(result['test2']['target'] == 'FAILED',
@@ -66,39 +87,8 @@ class ResultToolTests(OESelftestTestCase):
                         msg="regression not correct:%s" % result['test3']['target'])
 
     def test_merge_can_merged_results(self):
-        base_results_data = {'base_result1': {},
-                             'base_result2': {}}
-        target_results_data = {'target_result1': {},
-                               'target_result2': {},
-                               'target_result3': {}}
-
-        merge = ResultsMerge()
-        results = merge.merge_results(base_results_data, target_results_data)
-        self.assertTrue(len(results.keys()) == 5, msg="merge not correct:%s" % len(results.keys()))
-
-    def test_store_can_store_to_new_git_repository(self):
-        basepath = os.path.abspath(os.path.dirname(__file__) + '/../../')
-        source_dir = basepath + '/files/testresults'
-        git_branch = 'qa-cycle-2.7'
-        store = ResultsGitStore()
-        output_dir = store.store_to_new(self.logger, source_dir, git_branch)
-        self.assertTrue(checkout_git_dir(output_dir, git_branch), msg="store to new git repository failed:%s" %
-                                                                      output_dir)
-        store._remove_temporary_workspace_dir(output_dir)
+        results = {}
+        resultutils.append_resultsdata(results, ResultToolTests.base_results_data, configmap=resultutils.flatten_map)
+        resultutils.append_resultsdata(results, ResultToolTests.target_results_data, configmap=resultutils.flatten_map)
+        self.assertEqual(len(results[''].keys()), 5, msg="Flattened results not correct %s" % str(results))
 
-    def test_store_can_store_to_existing(self):
-        basepath = os.path.abspath(os.path.dirname(__file__) + '/../../')
-        source_dir = basepath + '/files/testresults'
-        git_branch = 'qa-cycle-2.6'
-        store = ResultsGitStore()
-        output_dir = store.store_to_new(self.logger, source_dir, git_branch)
-        self.assertTrue(checkout_git_dir(output_dir, git_branch), msg="store to new git repository failed:%s" %
-                                                                      output_dir)
-        git_branch = 'qa-cycle-2.7'
-        output_dir = store.store_to_existing_with_new_branch(self.logger, source_dir, output_dir, git_branch)
-        self.assertTrue(checkout_git_dir(output_dir, git_branch), msg="store to existing git repository failed:%s" %
-                                                                      output_dir)
-        output_dir = store.store_to_existing(self.logger, source_dir, output_dir, git_branch)
-        self.assertTrue(checkout_git_dir(output_dir, git_branch), msg="store to existing git repository failed:%s" %
-                                                                      output_dir)
-        store._remove_temporary_workspace_dir(output_dir)
diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index 64ec581a9f7..ecdc4e7a7a9 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -18,7 +18,11 @@ import sys
 import datetime
 import re
 from oeqa.core.runner import OETestResultJSONHelper
-from resulttool.resultsutils import load_json_file
+
+def load_json_file(file):
+    with open(file, "r") as f:
+        return json.load(f)
+
 
 class ManualTestRunner(object):
     def __init__(self):
@@ -134,4 +138,4 @@ def register_commands(subparsers):
                                          description='helper script for results populating during manual test execution. You can find manual test case JSON file in meta/lib/oeqa/manual/',
                                          group='manualexecution')
     parser_build.set_defaults(func=manualexecution)
-    parser_build.add_argument('file', help='specify path to manual test case JSON file.Note: Please use \"\" to encapsulate the file path.')
\ No newline at end of file
+    parser_build.add_argument('file', help='specify path to manual test case JSON file.Note: Please use \"\" to encapsulate the file path.')
diff --git a/scripts/lib/resulttool/merge.py b/scripts/lib/resulttool/merge.py
index 1d9cfafd417..3e4b7a38ad1 100644
--- a/scripts/lib/resulttool/merge.py
+++ b/scripts/lib/resulttool/merge.py
@@ -1,6 +1,7 @@
-# test result tool - merge multiple testresults.json files
+# resulttool - merge multiple testresults.json files into a file or directory
 #
 # Copyright (c) 2019, Intel Corporation.
+# Copyright (c) 2019, Linux Foundation
 #
 # This program is free software; you can redistribute it and/or modify it
 # under the terms and conditions of the GNU General Public License,
@@ -11,61 +12,31 @@
 # FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 # more details.
 #
-from resulttool.resultsutils import load_json_file, get_dict_value, dump_json_data
 import os
 import json
-
-class ResultsMerge(object):
-
-    def get_test_results(self, logger, file, result_id):
-        results = load_json_file(file)
-        if result_id:
-            result = get_dict_value(logger, results, result_id)
-            if result:
-                return {result_id: result}
-            return result
-        return results
-
-    def merge_results(self, base_results, target_results):
-        for k in target_results:
-            base_results[k] = target_results[k]
-        return base_results
-
-    def _get_write_dir(self):
-        basepath = os.environ['BUILDDIR']
-        return basepath + '/tmp/'
-
-    def dump_merged_results(self, results, output_dir):
-        file_output_dir = output_dir if output_dir else self._get_write_dir()
-        dump_json_data(file_output_dir, 'testresults.json', results)
-        print('Successfully merged results to: %s' % os.path.join(file_output_dir, 'testresults.json'))
-
-    def run(self, logger, base_result_file, target_result_file, target_result_id, output_dir):
-        base_results = self.get_test_results(logger, base_result_file, '')
-        target_results = self.get_test_results(logger, target_result_file, target_result_id)
-        if base_results and target_results:
-            merged_results = self.merge_results(base_results, target_results)
-            self.dump_merged_results(merged_results, output_dir)
+import resulttool.resultutils as resultutils
 
 def merge(args, logger):
-    merge = ResultsMerge()
-    merge.run(logger, args.base_result_file, args.target_result_file, args.target_result_id, args.output_dir)
+    if os.path.isdir(args.target_results):
+        results = resultutils.load_resultsdata(args.target_results, configmap=resultutils.store_map)
+        resultutils.append_resultsdata(results, args.base_results, configmap=resultutils.store_map)
+        resultutils.save_resultsdata(results, args.target_results)
+    else:
+        results = resultutils.load_resultsdata(args.base_results, configmap=resultutils.flatten_map)
+        if os.path.exists(args.target_results):
+            resultutils.append_resultsdata(results, args.target_results, configmap=resultutils.flatten_map)
+        resultutils.save_resultsdata(results, os.path.dirname(args.target_results), fn=os.path.basename(args.target_results))
+
     return 0
 
 def register_commands(subparsers):
     """Register subcommands from this plugin"""
-    parser_build = subparsers.add_parser('merge', help='merge test results',
-                                         description='merge results from multiple files',
+    parser_build = subparsers.add_parser('merge', help='merge test result files/directories',
+                                         description='merge the results from multiple files/directories into the target file or directory',
                                          group='setup')
     parser_build.set_defaults(func=merge)
-    parser_build.add_argument('base_result_file',
-                              help='base result file provide the base result set')
-    parser_build.add_argument('target_result_file',
-                              help='target result file provide the target result set for merging into the '
-                                   'base result set')
-    parser_build.add_argument('-t', '--target-result-id', default='',
-                              help='(optional) default merge all result sets available from target to base '
-                                   'unless specific target result id was provided')
-    parser_build.add_argument('-o', '--output-dir', default='',
-                              help='(optional) default write merged results to <poky>/build/tmp/ unless specific  '
-                                   'output directory was provided')
+    parser_build.add_argument('base_results',
+                              help='the results file/directory to import')
+    parser_build.add_argument('target_results',
+                              help='the target file or directory to merge the base_results with')
+
diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index bee3fb011a8..ff77332fa9b 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -1,6 +1,7 @@
-# test result tool - regression analysis
+# resulttool - regression analysis
 #
 # Copyright (c) 2019, Intel Corporation.
+# Copyright (c) 2019, Linux Foundation
 #
 # This program is free software; you can redistribute it and/or modify it
 # under the terms and conditions of the GNU General Public License,
@@ -11,171 +12,170 @@
 # FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 # more details.
 #
-from resulttool.resultsutils import load_json_file, get_dict_value, pop_dict_element
+import resulttool.resultutils as resultutils
 import json
 
-class ResultsRegressionSelector(object):
-
-    def get_results_unique_configurations(self, logger, results):
-        unique_configurations_map = {"oeselftest": ['TEST_TYPE', 'HOST_DISTRO', 'MACHINE'],
-                                     "runtime": ['TEST_TYPE', 'IMAGE_BASENAME', 'MACHINE'],
-                                     "sdk": ['TEST_TYPE', 'IMAGE_BASENAME', 'MACHINE', 'SDKMACHINE'],
-                                     "sdkext": ['TEST_TYPE', 'IMAGE_BASENAME', 'MACHINE', 'SDKMACHINE']}
-        results_unique_configs = {}
-        for k in results:
-            result = results[k]
-            result_configs = get_dict_value(logger, result, 'configuration')
-            result_test_type = get_dict_value(logger, result_configs, 'TEST_TYPE')
-            unique_configuration_keys = get_dict_value(logger, unique_configurations_map, result_test_type)
-            result_unique_config = {}
-            for ck in unique_configuration_keys:
-                config_value = get_dict_value(logger, result_configs, ck)
-                if config_value:
-                    result_unique_config[ck] = config_value
-            results_unique_configs[k] = result_unique_config
-        return results_unique_configs
-
-    def get_regression_base_target_pair(self, logger, base_results, target_results):
-        base_configs = self.get_results_unique_configurations(logger, base_results)
-        logger.debug('Retrieved base configuration: config=%s' % base_configs)
-        target_configs = self.get_results_unique_configurations(logger, target_results)
-        logger.debug('Retrieved target configuration: config=%s' % target_configs)
-        regression_pair = {}
-        for bk in base_configs:
-            base_config = base_configs[bk]
-            for tk in target_configs:
-                target_config = target_configs[tk]
-                if base_config == target_config:
-                    if bk in regression_pair:
-                        regression_pair[bk].append(tk)
-                    else:
-                        regression_pair[bk] = [tk]
-        return regression_pair
-
-    def run_regression_with_regression_pairing(self, logger, regression_pair, base_results, target_results):
-        regression = ResultsRegression()
-        for base in regression_pair:
-            for target in regression_pair[base]:
-                print('Getting regression for base=%s target=%s' % (base, target))
-                regression.run(logger, base_results[base], target_results[target])
-
-class ResultsRegression(object):
-
-    def print_regression_result(self, result):
-        if result:
-            print('============================Start Regression============================')
-            print('Only print regression if base status not equal target')
-            print('<test case> : <base status> -> <target status>')
-            print('========================================================================')
-            for k in result:
-                print(k, ':', result[k]['base'], '->', result[k]['target'])
-            print('==============================End Regression==============================')
-
-    def get_regression_result(self, logger, base_result, target_result):
-        base_result = get_dict_value(logger, base_result, 'result')
-        target_result = get_dict_value(logger, target_result, 'result')
-        result = {}
-        if base_result and target_result:
-            logger.debug('Getting regression result')
-            for k in base_result:
-                base_testcase = base_result[k]
-                base_status = get_dict_value(logger, base_testcase, 'status')
-                if base_status:
-                    target_testcase = get_dict_value(logger, target_result, k)
-                    target_status = get_dict_value(logger, target_testcase, 'status')
-                    if base_status != target_status:
-                        result[k] = {'base': base_status, 'target': target_status}
-                else:
-                    logger.error('Failed to retrieved base test case status: %s' % k)
-        return result
-
-    def run(self, logger, base_result, target_result):
-        if base_result and target_result:
-            result = self.get_regression_result(logger, base_result, target_result)
-            logger.debug('Retrieved regression result =%s' % result)
-            self.print_regression_result(result)
-        else:
-            logger.error('Input data objects must not be empty (base_result=%s, target_result=%s)' %
-                         (base_result, target_result))
-
-def get_results_from_directory(logger, source_dir):
-    from resulttool.merge import ResultsMerge
-    from resulttool.resultsutils import get_directory_files
-    result_files = get_directory_files(source_dir, ['.git'], 'testresults.json')
-    base_results = {}
-    for file in result_files:
-        merge = ResultsMerge()
-        results = merge.get_test_results(logger, file, '')
-        base_results = merge.merge_results(base_results, results)
-    return base_results
-
-def remove_testcases_to_optimize_regression_runtime(logger, results):
-    test_case_removal = ['ptestresult.rawlogs', 'ptestresult.sections']
-    for r in test_case_removal:
-        for k in results:
-            result = get_dict_value(logger, results[k], 'result')
-            pop_dict_element(logger, result, r)
-
-def regression_file(args, logger):
-    base_results = load_json_file(args.base_result_file)
-    print('Successfully loaded base test results from: %s' % args.base_result_file)
-    target_results = load_json_file(args.target_result_file)
-    print('Successfully loaded target test results from: %s' % args.target_result_file)
-    remove_testcases_to_optimize_regression_runtime(logger, base_results)
-    remove_testcases_to_optimize_regression_runtime(logger, target_results)
-    if args.base_result_id and args.target_result_id:
-        base_result = get_dict_value(logger, base_results, base_result_id)
-        print('Getting base test result with result_id=%s' % base_result_id)
-        target_result = get_dict_value(logger, target_results, target_result_id)
-        print('Getting target test result with result_id=%s' % target_result_id)
-        regression = ResultsRegression()
-        regression.run(logger, base_result, target_result)
+from oeqa.utils.git import GitRepo
+import oeqa.utils.gitarchive as gitarchive
+
+def compare_result(logger, base_name, target_name, base_result, target_result):
+    base_result = base_result.get('result')
+    target_result = target_result.get('result')
+    result = {}
+    if base_result and target_result:
+        for k in base_result:
+            base_testcase = base_result[k]
+            base_status = base_testcase.get('status')
+            if base_status:
+                target_testcase = target_result.get(k, {})
+                target_status = target_testcase.get('status')
+                if base_status != target_status:
+                    result[k] = {'base': base_status, 'target': target_status}
+            else:
+                logger.error('Failed to retrieved base test case status: %s' % k)
+    if result:
+        resultstring = "Regression: %s\n            %s\n" % (base_name, target_name)
+        for k in result:
+            resultstring += '    %s: %s -> %s\n' % (k, result[k]['base'], result[k]['target'])
     else:
-        regression = ResultsRegressionSelector()
-        regression_pair = regression.get_regression_base_target_pair(logger, base_results, target_results)
-        logger.debug('Retrieved regression pair=%s' % regression_pair)
-        regression.run_regression_with_regression_pairing(logger, regression_pair, base_results, target_results)
-    return 0
+        resultstring = "Match: %s\n       %s" % (base_name, target_name)
+    return result, resultstring
+
+def get_results(logger, source):
+    return resultutils.load_resultsdata(source, configmap=resultutils.regression_map)
+
+def regression(args, logger):
+    base_results = get_results(logger, args.base_result)
+    target_results = get_results(logger, args.target_result)
+
+    regression_common(args, logger, base_results, target_results)
+
+def regression_common(args, logger, base_results, target_results):
+    if args.base_result_id:
+        base_results = resultutils.filter_resultsdata(base_results, args.base_result_id)
+    if args.target_result_id:
+        target_results = resultutils.filter_resultsdata(target_results, args.target_result_id)
+
+    matches = []
+    regressions = []
+    notfound = []
+
+    for a in base_results:
+        if a in target_results:
+            base = list(base_results[a].keys())
+            target = list(target_results[a].keys())
+            # We may have multiple base/targets which are for different configurations. Start by 
+            # removing any pairs which match
+            for c in base.copy():
+                for b in target.copy():
+                    res, resstr = compare_result(logger, c, b, base_results[a][c], target_results[a][b])
+                    if not res:
+                        matches.append(resstr)
+                        base.remove(c)
+                        target.remove(b)
+                        break
+            # Should only now see regressions, we may not be able to match multiple pairs directly
+            for c in base:
+                for b in target:
+                    res, resstr = compare_result(logger, c, b, base_results[a][c], target_results[a][b])
+                    if res:
+                        regressions.append(resstr)
+        else:
+            notfound.append("%s not found in target" % a)
+    print("\n".join(matches))
+    print("\n".join(regressions))
+    print("\n".join(notfound))
 
-def regression_directory(args, logger):
-    base_results = get_results_from_directory(logger, args.base_result_directory)
-    target_results = get_results_from_directory(logger, args.target_result_directory)
-    remove_testcases_to_optimize_regression_runtime(logger, base_results)
-    remove_testcases_to_optimize_regression_runtime(logger, target_results)
-    regression = ResultsRegressionSelector()
-    regression_pair = regression.get_regression_base_target_pair(logger, base_results, target_results)
-    logger.debug('Retrieved regression pair=%s' % regression_pair)
-    regression.run_regression_with_regression_pairing(logger, regression_pair, base_results, target_results)
     return 0
 
 def regression_git(args, logger):
-    from resulttool.resultsutils import checkout_git_dir
     base_results = {}
     target_results = {}
-    if checkout_git_dir(args.source_dir, args.base_git_branch):
-        base_results = get_results_from_directory(logger, args.source_dir)
-    if checkout_git_dir(args.source_dir, args.target_git_branch):
-        target_results = get_results_from_directory(logger, args.source_dir)
-    if base_results and target_results:
-        remove_testcases_to_optimize_regression_runtime(logger, base_results)
-        remove_testcases_to_optimize_regression_runtime(logger, target_results)
-        regression = ResultsRegressionSelector()
-        regression_pair = regression.get_regression_base_target_pair(logger, base_results, target_results)
-        logger.debug('Retrieved regression pair=%s' % regression_pair)
-        regression.run_regression_with_regression_pairing(logger, regression_pair, base_results, target_results)
+
+    tag_name = "{branch}/{commit_number}-g{commit}/{tag_number}"
+    repo = GitRepo(args.repo)
+
+    revs = gitarchive.get_test_revs(logger, repo, tag_name, branch=args.branch)
+
+    if args.branch2:
+        revs2 = gitarchive.get_test_revs(logger, repo, tag_name, branch=args.branch2)
+        if not len(revs2):
+            logger.error("No revisions found to compare against")
+            return 1
+        if not len(revs):
+            logger.error("No revision to report on found")
+            return 1
+    else:
+        if len(revs) < 2:
+            logger.error("Only %d tester revisions found, unable to generate report" % len(revs))
+            return 1
+
+    # Pick revisions
+    if args.commit:
+        if args.commit_number:
+            logger.warning("Ignoring --commit-number as --commit was specified")
+        index1 = gitarchive.rev_find(revs, 'commit', args.commit)
+    elif args.commit_number:
+        index1 = gitarchive.rev_find(revs, 'commit_number', args.commit_number)
+    else:
+        index1 = len(revs) - 1
+
+    if args.branch2:
+        revs2.append(revs[index1])
+        index1 = len(revs2) - 1
+        revs = revs2
+
+    if args.commit2:
+        if args.commit_number2:
+            logger.warning("Ignoring --commit-number2 as --commit2 was specified")
+        index2 = gitarchive.rev_find(revs, 'commit', args.commit2)
+    elif args.commit_number2:
+        index2 = gitarchive.rev_find(revs, 'commit_number', args.commit_number2)
+    else:
+        if index1 > 0:
+            index2 = index1 - 1
+            # Find the closest matching commit number for comparision
+            # In future we could check the commit is a common ancestor and
+            # continue back if not but this good enough for now
+            while index2 > 0 and revs[index2].commit_number > revs[index1].commit_number:
+                index2 = index2 - 1
+        else:
+            logger.error("Unable to determine the other commit, use "
+                      "--commit2 or --commit-number2 to specify it")
+            return 1
+
+    logger.info("Comparing:\n%s\nto\n%s\n" % (revs[index1], revs[index2]))
+
+    base_results = resultutils.git_get_result(repo, revs[index1][2])
+    target_results = resultutils.git_get_result(repo, revs[index2][2])
+
+    regression_common(args, logger, base_results, target_results)
+
     return 0
 
 def register_commands(subparsers):
     """Register subcommands from this plugin"""
-    parser_build = subparsers.add_parser('regression-file', help='regression file analysis',
+
+    parser_build = subparsers.add_parser('regression', help='regression file/directory analysis',
+                                         description='regression analysis comparing the base set of results to the target results',
+                                         group='analysis')
+    parser_build.set_defaults(func=regression)
+    parser_build.add_argument('base_result',
+                              help='base result file/directory for the comparison')
+    parser_build.add_argument('target_result',
+                              help='target result file/directory to compare with')
+    parser_build.add_argument('-b', '--base-result-id', default='',
+                              help='(optional) filter the base results to this result ID')
+    parser_build.add_argument('-t', '--target-result-id', default='',
+                              help='(optional) filter the target results to this result ID')
+
+    parser_build = subparsers.add_parser('regression-git', help='regression git analysis',
                                          description='regression analysis comparing base result set to target '
                                                      'result set',
                                          group='analysis')
-    parser_build.set_defaults(func=regression_file)
-    parser_build.add_argument('base_result_file',
-                              help='base result file provide the base result set')
-    parser_build.add_argument('target_result_file',
-                              help='target result file provide the target result set for comparison with base result')
+    parser_build.set_defaults(func=regression_git)
+    parser_build.add_argument('repo',
+                              help='the git repository containing the data')
     parser_build.add_argument('-b', '--base-result-id', default='',
                               help='(optional) default select regression based on configurations unless base result '
                                    'id was provided')
@@ -183,26 +183,10 @@ def register_commands(subparsers):
                               help='(optional) default select regression based on configurations unless target result '
                                    'id was provided')
 
-    parser_build = subparsers.add_parser('regression-dir', help='regression directory analysis',
-                                         description='regression analysis comparing base result set to target '
-                                                     'result set',
-                                         group='analysis')
-    parser_build.set_defaults(func=regression_directory)
-    parser_build.add_argument('base_result_directory',
-                              help='base result directory provide the files for base result set')
-    parser_build.add_argument('target_result_directory',
-                              help='target result file provide the files for target result set for comparison with '
-                                   'base result')
+    parser_build.add_argument('--branch', '-B', default='master', help="Branch to find commit in")
+    parser_build.add_argument('--branch2', help="Branch to find comparision revisions in")
+    parser_build.add_argument('--commit', help="Revision to search for")
+    parser_build.add_argument('--commit-number', help="Revision number to search for, redundant if --commit is specified")
+    parser_build.add_argument('--commit2', help="Revision to compare with")
+    parser_build.add_argument('--commit-number2', help="Revision number to compare with, redundant if --commit2 is specified")
 
-    parser_build = subparsers.add_parser('regression-git', help='regression git analysis',
-                                         description='regression analysis comparing base result set to target '
-                                                     'result set',
-                                         group='analysis')
-    parser_build.set_defaults(func=regression_git)
-    parser_build.add_argument('source_dir',
-                              help='source directory that contain the git repository with test result files')
-    parser_build.add_argument('base_git_branch',
-                              help='base git branch that provide the files for base result set')
-    parser_build.add_argument('target_git_branch',
-                              help='target git branch that provide the files for target result set for comparison with '
-                                   'base result')
diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index ab5de1f3a7a..2f5ea308e21 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -1,6 +1,7 @@
 # test result tool - report text based test results
 #
 # Copyright (c) 2019, Intel Corporation.
+# Copyright (c) 2019, Linux Foundation
 #
 # This program is free software; you can redistribute it and/or modify it
 # under the terms and conditions of the GNU General Public License,
@@ -14,100 +15,120 @@
 import os
 import glob
 import json
-from resulttool.resultsutils import checkout_git_dir, load_json_file, get_dict_value, get_directory_files
+import resulttool.resultutils as resultutils
+from oeqa.utils.git import GitRepo
+import oeqa.utils.gitarchive as gitarchive
+
 
 class ResultsTextReport(object):
+    def __init__(self):
+        self.ptests = {}
+        self.result_types = {'passed': ['PASSED', 'passed'],
+                             'failed': ['FAILED', 'failed', 'ERROR', 'error', 'UNKNOWN'],
+                             'skipped': ['SKIPPED', 'skipped']}
+
+
+    def handle_ptest_result(self, k, status, result):
+        if k == 'ptestresult.sections':
+            return
+        _, suite, test = k.split(".", 2)
+        # Handle 'glib-2.0'
+        if suite not in result['ptestresult.sections']:
+            try:
+                _, suite, suite1, test = k.split(".", 3)
+                if suite + "." + suite1 in result['ptestresult.sections']:
+                    suite = suite + "." + suite1
+            except ValueError:
+                pass
+        if suite not in self.ptests:
+            self.ptests[suite] = {'passed': 0, 'failed': 0, 'skipped': 0, 'duration' : '-', 'failed_testcases': []}
+        for tk in self.result_types:
+            if status in self.result_types[tk]:
+                self.ptests[suite][tk] += 1
+        if suite in result['ptestresult.sections']:
+            if 'duration' in result['ptestresult.sections'][suite]:
+                self.ptests[suite]['duration'] = result['ptestresult.sections'][suite]['duration']
+            if 'timeout' in result['ptestresult.sections'][suite]:
+                self.ptests[suite]['duration'] += " T"
 
     def get_aggregated_test_result(self, logger, testresult):
         test_count_report = {'passed': 0, 'failed': 0, 'skipped': 0, 'failed_testcases': []}
-        result_types = {'passed': ['PASSED', 'passed'],
-                        'failed': ['FAILED', 'failed', 'ERROR', 'error', 'UNKNOWN'],
-                        'skipped': ['SKIPPED', 'skipped']}
-        result = get_dict_value(logger, testresult, 'result')
+        result = testresult.get('result', [])
         for k in result:
-            test_status = get_dict_value(logger, result[k], 'status')
-            for tk in result_types:
-                if test_status in result_types[tk]:
+            test_status = result[k].get('status', [])
+            for tk in self.result_types:
+                if test_status in self.result_types[tk]:
                     test_count_report[tk] += 1
-            if test_status in result_types['failed']:
+            if test_status in self.result_types['failed']:
                 test_count_report['failed_testcases'].append(k)
+            if k.startswith("ptestresult."):
+                self.handle_ptest_result(k, test_status, result)
         return test_count_report
 
-    def get_test_result_percentage(self, test_result_count):
-        total_tested = test_result_count['passed'] + test_result_count['failed'] + test_result_count['skipped']
-        test_percent_report = {'passed': 0, 'failed': 0, 'skipped': 0}
-        for k in test_percent_report:
-            test_percent_report[k] = format(test_result_count[k] / total_tested * 100, '.2f')
-        return test_percent_report
-
-    def add_test_configurations(self, test_report, source_dir, file, result_id):
-        test_report['file_dir'] = self._get_short_file_dir(source_dir, file)
-        test_report['result_id'] = result_id
-        test_report['test_file_dir_result_id'] = '%s_%s' % (test_report['file_dir'], test_report['result_id'])
-
-    def _get_short_file_dir(self, source_dir, file):
-        file_dir = os.path.dirname(file)
-        source_dir = source_dir[:-1] if source_dir[-1] == '/' else source_dir
-        if file_dir == source_dir:
-            return 'None'
-        return file_dir.replace(source_dir, '')
-
-    def get_max_string_len(self, test_result_list, key, default_max_len):
-        max_len = default_max_len
-        for test_result in test_result_list:
-            value_len = len(test_result[key])
-            if value_len > max_len:
-                max_len = value_len
-        return max_len
-
-    def print_test_report(self, template_file_name, test_count_reports, test_percent_reports,
-                          max_len_dir, max_len_result_id):
+    def print_test_report(self, template_file_name, test_count_reports):
         from jinja2 import Environment, FileSystemLoader
         script_path = os.path.dirname(os.path.realpath(__file__))
         file_loader = FileSystemLoader(script_path + '/template')
         env = Environment(loader=file_loader, trim_blocks=True)
         template = env.get_template(template_file_name)
-        output = template.render(test_count_reports=test_count_reports,
-                                 test_percent_reports=test_percent_reports,
-                                 max_len_dir=max_len_dir,
-                                 max_len_result_id=max_len_result_id)
-        print('Printing text-based test report:')
+        havefailed = False
+        haveptest = bool(self.ptests)
+        reportvalues = []
+        cols = ['passed', 'failed', 'skipped']
+        maxlen = {'passed' : 0, 'failed' : 0, 'skipped' : 0, 'result_id': 0, 'testseries' : 0, 'ptest' : 0 }
+        for line in test_count_reports:
+            total_tested = line['passed'] + line['failed'] + line['skipped']
+            vals = {}
+            vals['result_id'] = line['result_id']
+            vals['testseries'] = line['testseries']
+            vals['sort'] = line['testseries'] + "_" + line['result_id']
+            vals['failed_testcases'] = line['failed_testcases']
+            for k in cols:
+                vals[k] = "%d (%s%%)" % (line[k], format(line[k] / total_tested * 100, '.0f'))
+            for k in maxlen:
+                if k in vals and len(vals[k]) > maxlen[k]:
+                    maxlen[k] = len(vals[k])
+            reportvalues.append(vals)
+            if line['failed_testcases']:
+                havefailed = True
+        for ptest in self.ptests:
+            if len(ptest) > maxlen['ptest']:
+                maxlen['ptest'] = len(ptest)
+        output = template.render(reportvalues=reportvalues,
+                                 havefailed=havefailed,
+                                 haveptest=haveptest,
+                                 ptests=self.ptests,
+                                 maxlen=maxlen)
         print(output)
 
-    def view_test_report(self, logger, source_dir, git_branch):
-        if git_branch:
-            checkout_git_dir(source_dir, git_branch)
+    def view_test_report(self, logger, source_dir, tag):
         test_count_reports = []
-        test_percent_reports = []
-        for file in get_directory_files(source_dir, ['.git'], 'testresults.json'):
-            logger.debug('Computing result for test result file: %s' % file)
-            testresults = load_json_file(file)
-            for k in testresults:
-                test_count_report = self.get_aggregated_test_result(logger, testresults[k])
-                test_percent_report = self.get_test_result_percentage(test_count_report)
-                self.add_test_configurations(test_count_report, source_dir, file, k)
-                self.add_test_configurations(test_percent_report, source_dir, file, k)
+        if tag:
+            repo = GitRepo(source_dir)
+            testresults = resultutils.git_get_result(repo, [tag])
+        else:
+            testresults = resultutils.load_resultsdata(source_dir)
+        for testsuite in testresults:
+            for resultid in testresults[testsuite]:
+                result = testresults[testsuite][resultid]
+                test_count_report = self.get_aggregated_test_result(logger, result)
+                test_count_report['testseries'] = result['configuration']['TESTSERIES']
+                test_count_report['result_id'] = resultid
                 test_count_reports.append(test_count_report)
-                test_percent_reports.append(test_percent_report)
-        max_len_dir = self.get_max_string_len(test_count_reports, 'file_dir', len('file_dir'))
-        max_len_result_id = self.get_max_string_len(test_count_reports, 'result_id', len('result_id'))
-        self.print_test_report('test_report_full_text.txt', test_count_reports, test_percent_reports,
-                               max_len_dir, max_len_result_id)
+        self.print_test_report('test_report_full_text.txt', test_count_reports)
 
 def report(args, logger):
     report = ResultsTextReport()
-    report.view_test_report(logger, args.source_dir, args.git_branch)
+    report.view_test_report(logger, args.source_dir, args.tag)
     return 0
 
 def register_commands(subparsers):
     """Register subcommands from this plugin"""
-    parser_build = subparsers.add_parser('report', help='report test result summary',
-                                         description='report text-based test result summary from the source directory',
+    parser_build = subparsers.add_parser('report', help='summarise test results',
+                                         description='print a text-based summary of the test results',
                                          group='analysis')
     parser_build.set_defaults(func=report)
     parser_build.add_argument('source_dir',
-                              help='source directory that contain the test result files for reporting')
-    parser_build.add_argument('-b', '--git-branch', default='',
-                              help='(optional) default assume source directory contains all available files for '
-                                   'reporting unless a git branch was provided where it will try to checkout '
-                                   'the provided git branch assuming source directory was a git repository')
+                              help='source file/directory that contain the test result files to summarise')
+    parser_build.add_argument('-t', '--tag', default='',
+                              help='source_dir is a git repository, report on the tag specified from that repository')
diff --git a/scripts/lib/resulttool/resultsutils.py b/scripts/lib/resulttool/resultsutils.py
deleted file mode 100644
index 368786922c5..00000000000
--- a/scripts/lib/resulttool/resultsutils.py
+++ /dev/null
@@ -1,67 +0,0 @@
-# test result tool - utilities
-#
-# Copyright (c) 2019, Intel Corporation.
-#
-# This program is free software; you can redistribute it and/or modify it
-# under the terms and conditions of the GNU General Public License,
-# version 2, as published by the Free Software Foundation.
-#
-# This program is distributed in the hope it will be useful, but WITHOUT
-# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
-# more details.
-#
-import os
-import json
-import scriptpath
-scriptpath.add_oe_lib_path()
-from oeqa.utils.git import GitRepo, GitError
-
-def load_json_file(file):
-    with open(file, "r") as f:
-        return json.load(f)
-
-def dump_json_data(write_dir, file_name, json_data):
-    file_content = json.dumps(json_data, sort_keys=True, indent=4)
-    file_path = os.path.join(write_dir, file_name)
-    with open(file_path, 'w') as the_file:
-        the_file.write(file_content)
-
-def get_dict_value(logger, dict, key):
-    try:
-        return dict[key]
-    except KeyError:
-        if logger:
-            logger.debug('Faced KeyError exception: dict=%s: key=%s' % (dict, key))
-        return None
-    except TypeError:
-        if logger:
-            logger.debug('Faced TypeError exception: dict=%s: key=%s' % (dict, key))
-        return None
-
-def pop_dict_element(logger, dict, key):
-    try:
-        dict.pop(key)
-    except KeyError:
-        if logger:
-            logger.debug('Faced KeyError exception: dict=%s: key=%s' % (dict, key))
-    except AttributeError:
-        if logger:
-            logger.debug('Faced AttributeError exception: dict=%s: key=%s' % (dict, key))
-
-def checkout_git_dir(git_dir, git_branch):
-    try:
-        repo = GitRepo(git_dir, is_topdir=True)
-        repo.run_cmd('checkout %s' % git_branch)
-        return True
-    except GitError:
-        return False
-
-def get_directory_files(source_dir, excludes, file):
-    files_in_dir = []
-    for root, dirs, files in os.walk(source_dir, topdown=True):
-        [dirs.remove(d) for d in list(dirs) if d in excludes]
-        for name in files:
-            if name == file:
-                files_in_dir.append(os.path.join(root, name))
-    return files_in_dir
\ No newline at end of file
diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
new file mode 100644
index 00000000000..06cceef7968
--- /dev/null
+++ b/scripts/lib/resulttool/resultutils.py
@@ -0,0 +1,127 @@
+# resulttool - common library/utility functions
+#
+# Copyright (c) 2019, Intel Corporation.
+# Copyright (c) 2019, Linux Foundation
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
+import os
+import json
+import scriptpath
+scriptpath.add_oe_lib_path()
+
+flatten_map = {
+    "oeselftest": [],
+    "runtime": [],
+    "sdk": [],
+    "sdkext": []
+}
+regression_map = {
+    "oeselftest": ['TEST_TYPE', 'MACHINE'],
+    "runtime": ['TESTSERIES', 'TEST_TYPE', 'IMAGE_BASENAME', 'MACHINE', 'IMAGE_PKGTYPE', 'DISTRO'],
+    "sdk": ['TESTSERIES', 'TEST_TYPE', 'IMAGE_BASENAME', 'MACHINE', 'SDKMACHINE'],
+    "sdkext": ['TESTSERIES', 'TEST_TYPE', 'IMAGE_BASENAME', 'MACHINE', 'SDKMACHINE']
+}
+store_map = {
+    "oeselftest": ['TEST_TYPE'],
+    "runtime": ['TEST_TYPE', 'DISTRO', 'MACHINE', 'IMAGE_BASENAME'],
+    "sdk": ['TEST_TYPE', 'MACHINE', 'SDKMACHINE', 'IMAGE_BASENAME'],
+    "sdkext": ['TEST_TYPE', 'MACHINE', 'SDKMACHINE', 'IMAGE_BASENAME']
+}
+
+#
+# Load the json file and append the results data into the provided results dict
+#
+def append_resultsdata(results, f, configmap=store_map):
+    if type(f) is str:
+        with open(f, "r") as filedata:
+            data = json.load(filedata)
+    else:
+        data = f
+    for res in data:
+        if "configuration" not in data[res] or "result" not in data[res]:
+            raise ValueError("Test results data without configuration or result section?")
+        if "TESTSERIES" not in data[res]["configuration"]:
+            data[res]["configuration"]["TESTSERIES"] = os.path.basename(os.path.dirname(f))
+        testtype = data[res]["configuration"].get("TEST_TYPE")
+        if testtype not in configmap:
+            raise ValueError("Unknown test type %s" % testtype)
+        configvars = configmap[testtype]
+        testpath = "/".join(data[res]["configuration"].get(i) for i in configmap[testtype])
+        if testpath not in results:
+            results[testpath] = {}
+        if 'ptestresult.rawlogs' in data[res]['result']:
+            del data[res]['result']['ptestresult.rawlogs']
+        if 'ptestresult.sections' in data[res]['result']:
+            for i in data[res]['result']['ptestresult.sections']:
+                del data[res]['result']['ptestresult.sections'][i]['log']
+        results[testpath][res] = data[res]
+
+#
+# Walk a directory and find/load results data
+# or load directly from a file
+#
+def load_resultsdata(source, configmap=store_map):
+    results = {}
+    if os.path.isfile(source):
+        append_resultsdata(results, source, configmap)
+        return results
+    for root, dirs, files in os.walk(source):
+        for name in files:
+            f = os.path.join(root, name)
+            if name == "testresults.json":
+                append_resultsdata(results, f, configmap)
+    return results
+
+def filter_resultsdata(results, resultid):
+    newresults = {}
+    for r in results:
+        for i in results[r]:
+            if i == resultsid:
+                 newresults[r] = {}
+                 newresults[r][i] = results[r][i]
+    return newresults
+
+def save_resultsdata(results, destdir, fn="testresults.json"):
+    for res in results:
+        if res:
+            dst = destdir + "/" + res + "/" + fn
+        else:
+            dst = destdir + "/" + fn
+        os.makedirs(os.path.dirname(dst), exist_ok=True)
+        with open(dst, 'w') as f:
+            f.write(json.dumps(results[res], sort_keys=True, indent=4))
+
+def git_get_result(repo, tags):
+    git_objs = []
+    for tag in tags:
+        files = repo.run_cmd(['ls-tree', "--name-only", "-r", tag]).splitlines()
+        git_objs.extend([tag + ':' + f for f in files if f.endswith("testresults.json")])
+
+    def parse_json_stream(data):
+        """Parse multiple concatenated JSON objects"""
+        objs = []
+        json_d = ""
+        for line in data.splitlines():
+            if line == '}{':
+                json_d += '}'
+                objs.append(json.loads(json_d))
+                json_d = '{'
+            else:
+                json_d += line
+        objs.append(json.loads(json_d))
+        return objs
+
+    # Optimize by reading all data with one git command
+    results = {}
+    for obj in parse_json_stream(repo.run_cmd(['show'] + git_objs + ['--'])):
+        append_resultsdata(results, obj)
+
+    return results
diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index 2c6fd8492c3..6744fb3c05d 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -1,6 +1,7 @@
-# test result tool - store test results
+# resulttool - store test results
 #
 # Copyright (c) 2019, Intel Corporation.
+# Copyright (c) 2019, Linux Foundation
 #
 # This program is free software; you can redistribute it and/or modify it
 # under the terms and conditions of the GNU General Public License,
@@ -11,100 +12,81 @@
 # FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 # more details.
 #
-import datetime
 import tempfile
 import os
 import subprocess
+import json
+import shutil
 import scriptpath
 scriptpath.add_bitbake_lib_path()
 scriptpath.add_oe_lib_path()
-from resulttool.resultsutils import checkout_git_dir
-try:
-    import bb
-except ImportError:
-    pass
+import resulttool.resultutils as resultutils
+import oeqa.utils.gitarchive as gitarchive
 
-class ResultsGitStore(object):
 
-    def _get_output_dir(self):
-        basepath = os.environ['BUILDDIR']
-        return basepath + '/testresults_%s/' % datetime.datetime.now().strftime("%Y%m%d%H%M%S")
-
-    def _create_temporary_workspace_dir(self):
-        return tempfile.mkdtemp(prefix='testresults.')
-
-    def _remove_temporary_workspace_dir(self, workspace_dir):
-        return subprocess.run(["rm", "-rf",  workspace_dir])
-
-    def _oe_copy_files(self, source_dir, destination_dir):
-        from oe.path import copytree
-        copytree(source_dir, destination_dir)
+def store(args, logger):
+    tempdir = tempfile.mkdtemp(prefix='testresults.')
+    try:
+        results = {}
+        logger.info('Reading files from %s' % args.source)
+        for root, dirs, files in os.walk(args.source):
+            for name in files:
+                f = os.path.join(root, name)
+                if name == "testresults.json":
+                    resultutils.append_resultsdata(results, f)
+                elif args.all:
+                    dst = f.replace(args.source, tempdir + "/")
+                    os.makedirs(os.path.dirname(dst), exist_ok=True)
+                    shutil.copyfile(f, dst)
+        resultutils.save_resultsdata(results, tempdir)
 
-    def _copy_files(self, source_dir, destination_dir, copy_ignore=None):
-        from shutil import copytree
-        copytree(source_dir, destination_dir, ignore=copy_ignore)
+        if not results and not args.all:
+            if args.allow_empty:
+                logger.info("No results found to store")
+                return 0
+            logger.error("No results found to store")
+            return 1
 
-    def _store_files_to_git(self, logger, file_dir, git_dir, git_branch, commit_msg_subject, commit_msg_body):
-        logger.debug('Storing test result into git repository (%s) and branch (%s)'
-                     % (git_dir, git_branch))
-        return subprocess.run(["oe-git-archive",
-                               file_dir,
-                               "-g", git_dir,
-                               "-b", git_branch,
-                               "--commit-msg-subject", commit_msg_subject,
-                               "--commit-msg-body", commit_msg_body])
+        keywords = {'branch': None, 'commit': None, 'commit_count': None}
 
-    def store_to_existing(self, logger, source_dir, git_dir, git_branch):
-        logger.debug('Storing files to existing git repository and branch')
-        from shutil import ignore_patterns
-        dest_dir = self._create_temporary_workspace_dir()
-        dest_top_dir = os.path.join(dest_dir, 'top_dir')
-        self._copy_files(git_dir, dest_top_dir, copy_ignore=ignore_patterns('.git'))
-        self._oe_copy_files(source_dir, dest_top_dir)
-        self._store_files_to_git(logger, dest_top_dir, git_dir, git_branch,
-                                 'Store as existing git and branch', 'Store as existing git repository and branch')
-        self._remove_temporary_workspace_dir(dest_dir)
-        return git_dir
+        # Find the branch/commit/commit_count and ensure they all match
+        for suite in results:
+            for result in results[suite]:
+                config = results[suite][result]['configuration']['LAYERS']['meta']
+                for k in keywords:
+                    if keywords[k] is None:
+                        keywords[k] = config.get(k)
+                    if config.get(k) != keywords[k]:
+                        logger.error("Mismatched source commit/branch/count: %s vs %s" % (config.get(k), keywords[k]))
+                        return 1
 
-    def store_to_existing_with_new_branch(self, logger, source_dir, git_dir, git_branch):
-        logger.debug('Storing files to existing git repository with new branch')
-        self._store_files_to_git(logger, source_dir, git_dir, git_branch,
-                                 'Store as existing git with new branch',
-                                 'Store as existing git repository with new branch')
-        return git_dir
+        logger.info('Storing test result into git repository %s' % args.git_dir)
 
-    def store_to_new(self, logger, source_dir, git_branch):
-        logger.debug('Storing files to new git repository')
-        output_dir = self._get_output_dir()
-        self._store_files_to_git(logger, source_dir, output_dir, git_branch,
-                                 'Store as new', 'Store as new git repository')
-        return output_dir
+        gitarchive.gitarchive(tempdir, args.git_dir, False, False,
+                              "Results of {branch}:{commit}", "branch: {branch}\ncommit: {commit}", "{branch}",
+                              False, "{branch}/{commit_count}-g{commit}/{tag_number}",
+                              'Test run #{tag_number} of {branch}:{commit}', '',
+                              [], [], False, keywords, logger)
 
-    def store(self, logger, source_dir, git_dir, git_branch):
-        if git_dir:
-            if checkout_git_dir(git_dir, git_branch):
-                self.store_to_existing(logger, source_dir, git_dir, git_branch)
-            else:
-                self.store_to_existing_with_new_branch(logger, source_dir, git_dir, git_branch)
-        else:
-            self.store_to_new(logger, source_dir, git_branch)
+    finally:
+        subprocess.check_call(["rm", "-rf",  tempdir])
 
-def store(args, logger):
-    gitstore = ResultsGitStore()
-    gitstore.store(logger, args.source_dir, args.git_dir, args.git_branch)
     return 0
 
 def register_commands(subparsers):
     """Register subcommands from this plugin"""
-    parser_build = subparsers.add_parser('store', help='store test result files and directories into git repository',
-                                         description='store the testresults.json files and related directories '
-                                                     'from the source directory into the destination git repository '
-                                                     'with the given git branch',
+    parser_build = subparsers.add_parser('store', help='store test results into a git repository',
+                                         description='takes a results file or directory of results files and stores '
+                                                     'them into the destination git repository, splitting out the results '
+                                                     'files as configured',
                                          group='setup')
     parser_build.set_defaults(func=store)
-    parser_build.add_argument('source_dir',
-                              help='source directory that contain the test result files and directories to be stored')
-    parser_build.add_argument('git_branch', help='git branch used for store')
-    parser_build.add_argument('-d', '--git-dir', default='',
-                              help='(optional) default store to new <top_dir>/<build>/<testresults_datetime> '
-                                   'directory unless provided with existing git repository as destination')
+    parser_build.add_argument('source',
+                              help='source file or directory that contain the test result files to be stored')
+    parser_build.add_argument('git_dir',
+                              help='the location of the git repository to store the results in')
+    parser_build.add_argument('-a', '--all', action='store_true',
+                              help='include all files, not just testresults.json files')
+    parser_build.add_argument('-e', '--allow-empty', action='store_true',
+                              help='don\'t error if no results to store are found')
+
diff --git a/scripts/lib/resulttool/template/test_report_full_text.txt b/scripts/lib/resulttool/template/test_report_full_text.txt
index bc4874ba4bd..5081594cf27 100644
--- a/scripts/lib/resulttool/template/test_report_full_text.txt
+++ b/scripts/lib/resulttool/template/test_report_full_text.txt
@@ -1,35 +1,44 @@
 ==============================================================================================================
-Test Report (Count of passed, failed, skipped group by file_dir, result_id)
+Test Result Status Summary (Counts/Percentages sorted by testseries, ID)
 ==============================================================================================================
 --------------------------------------------------------------------------------------------------------------
-{{ 'file_dir'.ljust(max_len_dir) }} | {{ 'result_id'.ljust(max_len_result_id) }} | {{ 'passed'.ljust(10) }} | {{ 'failed'.ljust(10) }} | {{ 'skipped'.ljust(10) }}
+{{ 'Test Series'.ljust(maxlen['testseries']) }} | {{ 'ID'.ljust(maxlen['result_id']) }} | {{ 'Passed'.ljust(maxlen['passed']) }} | {{ 'Failed'.ljust(maxlen['failed']) }} | {{ 'Skipped'.ljust(maxlen['skipped']) }}
 --------------------------------------------------------------------------------------------------------------
-{% for report in test_count_reports |sort(attribute='test_file_dir_result_id') %}
-{{ report.file_dir.ljust(max_len_dir) }} | {{ report.result_id.ljust(max_len_result_id) }} | {{ (report.passed|string).ljust(10) }} | {{ (report.failed|string).ljust(10) }} | {{ (report.skipped|string).ljust(10) }}
+{% for report in reportvalues |sort(attribute='sort') %}
+{{ report.testseries.ljust(maxlen['testseries']) }} | {{ report.result_id.ljust(maxlen['result_id']) }} | {{ (report.passed|string).ljust(maxlen['passed']) }} | {{ (report.failed|string).ljust(maxlen['failed']) }} | {{ (report.skipped|string).ljust(maxlen['skipped']) }}
 {% endfor %}
 --------------------------------------------------------------------------------------------------------------
 
+{% if haveptest %}
 ==============================================================================================================
-Test Report (Percent of passed, failed, skipped group by file_dir, result_id)
+PTest Result Summary
 ==============================================================================================================
 --------------------------------------------------------------------------------------------------------------
-{{ 'file_dir'.ljust(max_len_dir) }} | {{ 'result_id'.ljust(max_len_result_id) }} | {{ 'passed_%'.ljust(10) }} | {{ 'failed_%'.ljust(10) }} | {{ 'skipped_%'.ljust(10) }}
+{{ 'Recipe'.ljust(maxlen['ptest']) }} | {{ 'Passed'.ljust(maxlen['passed']) }} | {{ 'Failed'.ljust(maxlen['failed']) }} | {{ 'Skipped'.ljust(maxlen['skipped']) }} | {{ 'Time(s)'.ljust(10) }}
 --------------------------------------------------------------------------------------------------------------
-{% for report in test_percent_reports |sort(attribute='test_file_dir_result_id') %}
-{{ report.file_dir.ljust(max_len_dir) }} | {{ report.result_id.ljust(max_len_result_id) }} | {{ (report.passed|string).ljust(10) }} | {{ (report.failed|string).ljust(10) }} | {{ (report.skipped|string).ljust(10) }}
+{% for ptest in ptests %}
+{{ ptest.ljust(maxlen['ptest']) }} | {{ (ptests[ptest]['passed']|string).ljust(maxlen['passed']) }} | {{ (ptests[ptest]['failed']|string).ljust(maxlen['failed']) }} | {{ (ptests[ptest]['skipped']|string).ljust(maxlen['skipped']) }} | {{ (ptests[ptest]['duration']|string) }}
 {% endfor %}
 --------------------------------------------------------------------------------------------------------------
 
+{% else %}
+There was no ptest data
+{% endif %}
+
 ==============================================================================================================
-Test Report (Failed test cases group by file_dir, result_id)
+Failed test cases (sorted by testseries, ID)
 ==============================================================================================================
+{% if havefailed %}
 --------------------------------------------------------------------------------------------------------------
-{% for report in test_count_reports |sort(attribute='test_file_dir_result_id') %}
+{% for report in reportvalues |sort(attribute='sort') %}
 {% if report.failed_testcases %}
-file_dir | result_id : {{ report.file_dir }} | {{ report.result_id }}
+testseries | result_id : {{ report.testseries }} | {{ report.result_id }}
 {% for testcase in report.failed_testcases %}
     {{ testcase }}
 {% endfor %}
 {% endif %}
 {% endfor %}
---------------------------------------------------------------------------------------------------------------
\ No newline at end of file
+--------------------------------------------------------------------------------------------------------------
+{% else %}
+There were no test failures
+{% endif %}
diff --git a/scripts/resulttool b/scripts/resulttool
index 13430e192a0..5a89e1c9be9 100755
--- a/scripts/resulttool
+++ b/scripts/resulttool
@@ -1,11 +1,12 @@
 #!/usr/bin/env python3
 #
-# test results tool - tool for testresults.json (merge test results, regression analysis)
+# test results tool - tool for manipulating OEQA test result json files
+# (merge results, summarise results, regression analysis, generate manual test results file)
 #
 # To look for help information.
 #    $ resulttool
 #
-# To store test result from oeqa automated tests, execute the below
+# To store test results from oeqa automated tests, execute the below
 #     $ resulttool store <source_dir> <git_branch>
 #
 # To merge test results, execute the below
@@ -58,7 +59,7 @@ def _validate_user_input_arguments(args):
     return True
 
 def main():
-    parser = argparse_oe.ArgumentParser(description="OpenEmbedded test results tool.",
+    parser = argparse_oe.ArgumentParser(description="OEQA test result manipulation tool.",
                                         epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
     parser.add_argument('-d', '--debug', help='enable debug output', action='store_true')
     parser.add_argument('-q', '--quiet', help='print only errors', action='store_true')
-- 
2.20.1


