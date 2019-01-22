Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 59F1D7C0BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 10:13:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jan 2019 02:13:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,505,1539673200"; d="scan'208";a="111696325"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008.jf.intel.com with ESMTP; 22 Jan 2019 02:13:27 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jan 2019 17:42:10 +0800
Message-Id: <1548150131-65036-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548150131-65036-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1548150131-65036-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 1/2 v5] resultstool: enable merge, store, report and regression analysis
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
X-List-Received-Date: Tue, 22 Jan 2019 10:13:27 -0000

OEQA outputs test results into json files and these files were
archived by Autobuilder during QA releases. Example: each oe-selftest
run by Autobuilder for different host distro generate a
testresults.json file.

These scripts were developed as a test result tools to manage
these testresults.json file.

Using the "store" operation, user can store multiple testresults.json
files as well as the pre-configured directories used to hold those files.

Using the "merge" operation, user can merge multiple testresults.json
files to a target file.

Using the "report" operation, user can view the test result summary
for all available testresults.json files inside a ordinary directory
or a git repository.

Using the "regression" operation, user can perform regression analysis
on testresults.json files specified.

These resultstool operations expect the testresults.json file to use
the json format below.
{
    "<testresult_1>": {
        "configuration": {
            "<config_name_1>": "<config_value_1>",
            "<config_name_2>": "<config_value_2>",
            ...
            "<config_name_n>": "<config_value_n>",
        },
        "result": {
            "<testcase_namespace_1>": {
                "status": "<PASSED or FAILED or ERROR or SKIPPED>",
                "log": "<failure or error logging>"
            },
            "<testcase_namespace_2>": {
                "status": "<PASSED or FAILED or ERROR or SKIPPED>",
                "log": "<failure or error logging>"
            },
            ...
            "<testcase_namespace_n>": {
                "status": "<PASSED or FAILED or ERROR or SKIPPED>",
                "log": "<failure or error logging>"
            },
        }
    },
    ...
    "<testresult_n>": {
        "configuration": {
            "<config_name_1>": "<config_value_1>",
            "<config_name_2>": "<config_value_2>",
            ...
            "<config_name_n>": "<config_value_n>",
        },
        "result": {
            "<testcase_namespace_1>": {
                "status": "<PASSED or FAILED or ERROR or SKIPPED>",
                "log": "<failure or error logging>"
            },
            "<testcase_namespace_2>": {
                "status": "<PASSED or FAILED or ERROR or SKIPPED>",
                "log": "<failure or error logging>"
            },
            ...
            "<testcase_namespace_n>": {
                "status": "<PASSED or FAILED or ERROR or SKIPPED>",
                "log": "<failure or error logging>"
            },
        }
    },
}

To use these scripts, first source oe environment, then run the
entry point script to look for help.
    $ resultstool

To store test result from oeqa automated tests, execute the below
    $ resultstool store <source_dir> <git_branch>

To merge multiple testresults.json files, execute the below
    $ resultstool merge <base_result_file> <target_result_file>

To report test report, execute the below
    $ resultstool report <source_dir>

To perform regression analysis, execute the below
    $ resultstool regression <base_result_file> <target_result_file>

[YOCTO# 13012]
[YOCTO# 12654]

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/files/testresults/testresults.json   |  40 ++++++
 meta/lib/oeqa/selftest/cases/resultstooltests.py   | 104 ++++++++++++++++
 scripts/lib/resultstool/__init__.py                |   0
 scripts/lib/resultstool/merge.py                   |  71 +++++++++++
 scripts/lib/resultstool/regression.py              | 134 +++++++++++++++++++++
 scripts/lib/resultstool/report.py                  | 122 +++++++++++++++++++
 scripts/lib/resultstool/resultsutils.py            |  47 ++++++++
 scripts/lib/resultstool/store.py                   | 110 +++++++++++++++++
 .../resultstool/template/test_report_full_text.txt |  35 ++++++
 scripts/resultstool                                |  84 +++++++++++++
 10 files changed, 747 insertions(+)
 create mode 100644 meta/lib/oeqa/files/testresults/testresults.json
 create mode 100644 meta/lib/oeqa/selftest/cases/resultstooltests.py
 create mode 100644 scripts/lib/resultstool/__init__.py
 create mode 100644 scripts/lib/resultstool/merge.py
 create mode 100644 scripts/lib/resultstool/regression.py
 create mode 100644 scripts/lib/resultstool/report.py
 create mode 100644 scripts/lib/resultstool/resultsutils.py
 create mode 100644 scripts/lib/resultstool/store.py
 create mode 100644 scripts/lib/resultstool/template/test_report_full_text.txt
 create mode 100755 scripts/resultstool

diff --git a/meta/lib/oeqa/files/testresults/testresults.json b/meta/lib/oeqa/files/testresults/testresults.json
new file mode 100644
index 0000000..1a62155
--- /dev/null
+++ b/meta/lib/oeqa/files/testresults/testresults.json
@@ -0,0 +1,40 @@
+{
+    "runtime_core-image-minimal_qemuarm_20181225195701": {
+        "configuration": {
+            "DISTRO": "poky",
+            "HOST_DISTRO": "ubuntu-16.04",
+            "IMAGE_BASENAME": "core-image-minimal",
+            "IMAGE_PKGTYPE": "rpm",
+            "LAYERS": {
+                "meta": {
+                    "branch": "master",
+                    "commit": "801745d918e83f976c706f29669779f5b292ade3",
+                    "commit_count": 52782
+                },
+                "meta-poky": {
+                    "branch": "master",
+                    "commit": "801745d918e83f976c706f29669779f5b292ade3",
+                    "commit_count": 52782
+                },
+                "meta-yocto-bsp": {
+                    "branch": "master",
+                    "commit": "801745d918e83f976c706f29669779f5b292ade3",
+                    "commit_count": 52782
+                }
+            },
+            "MACHINE": "qemuarm",
+            "STARTTIME": "20181225195701",
+            "TEST_TYPE": "runtime"
+        },
+        "result": {
+            "apt.AptRepoTest.test_apt_install_from_repo": {
+                "log": "Test requires apt to be installed",
+                "status": "PASSED"
+            },
+            "buildcpio.BuildCpioTest.test_cpio": {
+                "log": "Test requires autoconf to be installed",
+                "status": "ERROR"
+            }            
+        }
+    }
+}
\ No newline at end of file
diff --git a/meta/lib/oeqa/selftest/cases/resultstooltests.py b/meta/lib/oeqa/selftest/cases/resultstooltests.py
new file mode 100644
index 0000000..28bfa94
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/resultstooltests.py
@@ -0,0 +1,104 @@
+import os
+import sys
+basepath = os.path.abspath(os.path.dirname(__file__) + '/../../../../../')
+lib_path = basepath + '/scripts/lib'
+sys.path = sys.path + [lib_path]
+from resultstool.report import ResultsTextReport
+from resultstool.regression import ResultsRegressionSelector, ResultsRegression
+from resultstool.merge import ResultsMerge
+from resultstool.store import ResultsGitStore
+from resultstool.resultsutils import checkout_git_dir
+from oeqa.selftest.case import OESelftestTestCase
+
+class ResultsToolTests(OESelftestTestCase):
+
+    def test_report_can_aggregate_test_result(self):
+        result_data = {'result': {'test1': {'status':'PASSED'},
+                                  'test2': {'status': 'PASSED'},
+                                  'test3': {'status': 'FAILED'},
+                                  'test4': {'status': 'ERROR'},
+                                  'test5': {'status': 'SKIPPED'}}}
+        report = ResultsTextReport()
+        result_report = report.get_aggregated_test_result(None, result_data)
+        self.assertTrue(result_report['passed'] == 2, msg="Passed count not correct:%s" % result_report['passed'])
+        self.assertTrue(result_report['failed'] == 2, msg="Failed count not correct:%s" % result_report['failed'])
+        self.assertTrue(result_report['skipped'] == 1, msg="Skipped count not correct:%s" % result_report['skipped'])
+
+    def test_regression_can_get_regression_base_target_pair(self):
+        base_results_data = {'base_result1': {'configuration': {"TEST_TYPE": "oeselftest",
+                                                                "HOST": "centos-7"}},
+                             'base_result2': {'configuration': {"TEST_TYPE": "oeselftest",
+                                                                "HOST": "centos-7",
+                                                                "MACHINE": "qemux86-64"}}}
+        target_results_data = {'target_result1': {'configuration': {"TEST_TYPE": "oeselftest",
+                                                                    "HOST": "centos-7"}},
+                               'target_result2': {'configuration': {"TEST_TYPE": "oeselftest",
+                                                                    "HOST": "centos-7",
+                                                                    "MACHINE": "qemux86"}},
+                               'target_result3': {'configuration': {"TEST_TYPE": "oeselftest",
+                                                                    "HOST": "centos-7",
+                                                                    "MACHINE": "qemux86-64"}}}
+        regression = ResultsRegressionSelector()
+        pair = regression.get_regression_base_target_pair(self.logger, base_results_data, target_results_data)
+        self.assertTrue(pair['base_result1'] == 'target_result1', msg="Pair not correct:%s" % pair['base_result1'])
+        self.assertTrue(pair['base_result2'] == 'target_result3', msg="Pair not correct:%s" % pair['base_result2'])
+
+    def test_regrresion_can_get_regression_result(self):
+        base_result_data = {'result': {'test1': {'status': 'PASSED'},
+                                       'test2': {'status': 'PASSED'},
+                                       'test3': {'status': 'FAILED'},
+                                       'test4': {'status': 'ERROR'},
+                                       'test5': {'status': 'SKIPPED'}}}
+        target_result_data = {'result': {'test1': {'status': 'PASSED'},
+                                         'test2': {'status': 'FAILED'},
+                                         'test3': {'status': 'PASSED'},
+                                         'test4': {'status': 'ERROR'},
+                                         'test5': {'status': 'SKIPPED'}}}
+        regression = ResultsRegression()
+        result = regression.get_regression_result(self.logger, base_result_data, target_result_data)
+        self.assertTrue(result['test2']['base'] == 'PASSED',
+                        msg="regression not correct:%s" % result['test2']['base'])
+        self.assertTrue(result['test2']['target'] == 'FAILED',
+                        msg="regression not correct:%s" % result['test2']['target'])
+        self.assertTrue(result['test3']['base'] == 'FAILED',
+                        msg="regression not correct:%s" % result['test3']['base'])
+        self.assertTrue(result['test3']['target'] == 'PASSED',
+                        msg="regression not correct:%s" % result['test3']['target'])
+
+    def test_merge_can_merged_results(self):
+        base_results_data = {'base_result1': {},
+                             'base_result2': {}}
+        target_results_data = {'target_result1': {},
+                               'target_result2': {},
+                               'target_result3': {}}
+
+        merge = ResultsMerge()
+        results = merge.merge_results(base_results_data, target_results_data)
+        self.assertTrue(len(results.keys()) == 5, msg="merge not correct:%s" % len(results.keys()))
+
+    def test_store_can_store_to_new_git_repository(self):
+        basepath = os.path.abspath(os.path.dirname(__file__) + '/../../')
+        source_dir = basepath + '/files/testresults'
+        git_branch = 'qa-cycle-2.7'
+        store = ResultsGitStore()
+        output_dir = store.store_to_new(self.logger, source_dir, git_branch)
+        self.assertTrue(checkout_git_dir(output_dir, git_branch), msg="store to new git repository failed:%s" %
+                                                                      output_dir)
+        store._remove_temporary_workspace_dir(output_dir)
+
+    def test_store_can_store_to_existing(self):
+        basepath = os.path.abspath(os.path.dirname(__file__) + '/../../')
+        source_dir = basepath + '/files/testresults'
+        git_branch = 'qa-cycle-2.6'
+        store = ResultsGitStore()
+        output_dir = store.store_to_new(self.logger, source_dir, git_branch)
+        self.assertTrue(checkout_git_dir(output_dir, git_branch), msg="store to new git repository failed:%s" %
+                                                                      output_dir)
+        git_branch = 'qa-cycle-2.7'
+        output_dir = store.store_to_existing_with_new_branch(self.logger, source_dir, output_dir, git_branch)
+        self.assertTrue(checkout_git_dir(output_dir, git_branch), msg="store to existing git repository failed:%s" %
+                                                                      output_dir)
+        output_dir = store.store_to_existing(self.logger, source_dir, output_dir, git_branch)
+        self.assertTrue(checkout_git_dir(output_dir, git_branch), msg="store to existing git repository failed:%s" %
+                                                                      output_dir)
+        store._remove_temporary_workspace_dir(output_dir)
diff --git a/scripts/lib/resultstool/__init__.py b/scripts/lib/resultstool/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/scripts/lib/resultstool/merge.py b/scripts/lib/resultstool/merge.py
new file mode 100644
index 0000000..0b7c7dc
--- /dev/null
+++ b/scripts/lib/resultstool/merge.py
@@ -0,0 +1,71 @@
+# test results tool - merge multiple testresults.json files
+#
+# Copyright (c) 2019, Intel Corporation.
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
+from resultstool.resultsutils import load_json_file, get_dict_value, dump_json_data
+import os
+import json
+
+class ResultsMerge(object):
+
+    def get_test_results(self, logger, file, result_id):
+        results = load_json_file(file)
+        if result_id:
+            result = get_dict_value(logger, results, result_id)
+            if result:
+                return {result_id: result}
+            return result
+        return results
+
+    def merge_results(self, base_results, target_results):
+        for k in target_results:
+            base_results[k] = target_results[k]
+        return base_results
+
+    def _get_write_dir(self):
+        basepath = os.environ['BUILDDIR']
+        return basepath + '/tmp/'
+
+    def dump_merged_results(self, results, output_dir):
+        file_output_dir = output_dir if output_dir else self._get_write_dir()
+        dump_json_data(file_output_dir, 'testresults.json', results)
+        print('Successfully merged results to: %s' % os.path.join(file_output_dir, 'testresults.json'))
+
+    def run(self, logger, base_result_file, target_result_file, target_result_id, output_dir):
+        base_results = self.get_test_results(logger, base_result_file, '')
+        target_results = self.get_test_results(logger, target_result_file, target_result_id)
+        if base_results and target_results:
+            merged_results = self.merge_results(base_results, target_results)
+            self.dump_merged_results(merged_results, output_dir)
+
+def merge(args, logger):
+    merge = ResultsMerge()
+    merge.run(logger, args.base_result_file, args.target_result_file, args.target_result_id, args.output_dir)
+    return 0
+
+def register_commands(subparsers):
+    """Register subcommands from this plugin"""
+    parser_build = subparsers.add_parser('merge', help='merge test results',
+                                         description='merge results from multiple files',
+                                         group='setup')
+    parser_build.set_defaults(func=merge)
+    parser_build.add_argument('base_result_file',
+                              help='base result file provide the base result set')
+    parser_build.add_argument('target_result_file',
+                              help='target result file provide the target result set for merging into the '
+                                   'base result set')
+    parser_build.add_argument('-t', '--target-result-id', default='',
+                              help='(optional) default merge all result sets available from target to base '
+                                   'unless specific target result id was provided')
+    parser_build.add_argument('-o', '--output-dir', default='',
+                              help='(optional) default write merged results to <poky>/build/tmp/ unless specific  '
+                                   'output directory was provided')
diff --git a/scripts/lib/resultstool/regression.py b/scripts/lib/resultstool/regression.py
new file mode 100644
index 0000000..a1cd144
--- /dev/null
+++ b/scripts/lib/resultstool/regression.py
@@ -0,0 +1,134 @@
+# test results tool - regression analysis
+#
+# Copyright (c) 2019, Intel Corporation.
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
+from resultstool.resultsutils import load_json_file, get_dict_value
+import json
+
+class ResultsRegressionSelector(object):
+
+    def get_results_unique_configurations(self, logger, results):
+        unique_configurations_map = {"oeselftest": ['TEST_TYPE', 'HOST_DISTRO', 'MACHINE'],
+                                     "runtime": ['TEST_TYPE', 'IMAGE_BASENAME', 'MACHINE'],
+                                     "sdk": ['TEST_TYPE', 'IMAGE_BASENAME', 'MACHINE', 'SDKMACHINE'],
+                                     "sdkext": ['TEST_TYPE', 'IMAGE_BASENAME', 'MACHINE', 'SDKMACHINE']}
+        results_unique_configs = {}
+        for k in results:
+            result = results[k]
+            result_configs = get_dict_value(logger, result, 'configuration')
+            result_test_type = get_dict_value(logger, result_configs, 'TEST_TYPE')
+            unique_configuration_keys = get_dict_value(logger, unique_configurations_map, result_test_type)
+            result_unique_config = {}
+            for ck in unique_configuration_keys:
+                config_value = get_dict_value(logger, result_configs, ck)
+                if config_value:
+                    result_unique_config[ck] = config_value
+            results_unique_configs[k] = result_unique_config
+        return results_unique_configs
+
+    def get_regression_base_target_pair(self, logger, base_results, target_results):
+        base_configs = self.get_results_unique_configurations(logger, base_results)
+        logger.debug('Retrieved base configuration: config=%s' % base_configs)
+        target_configs = self.get_results_unique_configurations(logger, target_results)
+        logger.debug('Retrieved target configuration: config=%s' % target_configs)
+        regression_pair = {}
+        for bk in base_configs:
+            base_config = base_configs[bk]
+            for tk in target_configs:
+                target_config = target_configs[tk]
+                if base_config == target_config:
+                    regression_pair[bk] = tk
+        return regression_pair
+
+    def run_regression_with_regression_pairing(self, logger, regression_pair, base_results, target_results):
+        regression = ResultsRegression()
+        for base in regression_pair:
+            print('Getting regression for base=%s target=%s' % (base, regression_pair[base]))
+            regression.run(logger, base_results[base], target_results[regression_pair[base]])
+
+    def run(self, logger, base_result_file, target_result_file, base_result_id, target_result_id):
+        base_results = load_json_file(base_result_file)
+        print('Successfully loaded base test results from: %s' % base_result_file)
+        target_results = load_json_file(target_result_file)
+        print('Successfully loaded target test results from: %s' % target_result_file)
+        if base_result_id and target_result_id:
+            base_result = get_dict_value(logger, base_results, base_result_id)
+            print('Getting base test result with result_id=%s' % base_result_id)
+            target_result = get_dict_value(logger, target_results, target_result_id)
+            print('Getting target test result with result_id=%s' % target_result_id)
+            regression = ResultsRegression()
+            regression.run(logger, base_result, target_result)
+        else:
+            regression_pair = self.get_regression_base_target_pair(logger, base_results, target_results)
+            logger.debug('Retrieved regression pair=%s' % regression_pair)
+            self.run_regression_with_regression_pairing(logger, regression_pair, base_results, target_results)
+
+class ResultsRegression(object):
+
+    def print_regression_result(self, result):
+        print('============================Start Regression============================')
+        print('Only print regression if base status not equal target')
+        print('<test case> : <base status> -> <target status>')
+        print('========================================================================')
+        for k in result:
+            print(k, ':', result[k]['base'], '->', result[k]['target'])
+        print('==============================End Regression==============================')
+
+    def get_regression_result(self, logger, base_result, target_result):
+        base_result = get_dict_value(logger, base_result, 'result')
+        target_result = get_dict_value(logger, target_result, 'result')
+        result = {}
+        if base_result and target_result:
+            logger.debug('Getting regression result')
+            for k in base_result:
+                base_testcase = base_result[k]
+                base_status = get_dict_value(logger, base_testcase, 'status')
+                if base_status:
+                    target_testcase = get_dict_value(logger, target_result, k)
+                    target_status = get_dict_value(logger, target_testcase, 'status')
+                    if base_status != target_status:
+                        result[k] = {'base': base_status, 'target': target_status}
+                else:
+                    logger.error('Failed to retrieved base test case status')
+        return result
+
+    def run(self, logger, base_result, target_result):
+        if base_result and target_result:
+            result = self.get_regression_result(logger, base_result, target_result)
+            logger.debug('Retrieved regression result =%s' % result)
+            self.print_regression_result(result)
+        else:
+            logger.error('Input data objects must not be empty (base_result=%s, target_result=%s)' %
+                         (base_result, target_result))
+
+def regression(args, logger):
+    regression = ResultsRegressionSelector()
+    regression.run(logger, args.base_result_file, args.target_result_file, args.base_result_id, args.target_result_id)
+    return 0
+
+def register_commands(subparsers):
+    """Register subcommands from this plugin"""
+    parser_build = subparsers.add_parser('regression', help='regression analysis',
+                                         description='regression analysis comparing base result set to target '
+                                                     'result set',
+                                         group='analysis')
+    parser_build.set_defaults(func=regression)
+    parser_build.add_argument('base_result_file',
+                              help='base result file provide the base result set')
+    parser_build.add_argument('target_result_file',
+                              help='target result file provide the target result set for comparison with base result')
+    parser_build.add_argument('-b', '--base-result-id', default='',
+                              help='(optional) default select regression based on configurations unless base result '
+                                   'id was provided')
+    parser_build.add_argument('-t', '--target-result-id', default='',
+                              help='(optional) default select regression based on configurations unless target result '
+                                   'id was provided')
diff --git a/scripts/lib/resultstool/report.py b/scripts/lib/resultstool/report.py
new file mode 100644
index 0000000..c1c4f83
--- /dev/null
+++ b/scripts/lib/resultstool/report.py
@@ -0,0 +1,122 @@
+# test results tool - report text based test results
+#
+# Copyright (c) 2019, Intel Corporation.
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
+import glob
+import json
+from resultstool.resultsutils import checkout_git_dir, load_json_file, get_dict_value
+
+class ResultsTextReport(object):
+
+    def get_test_result_files(self, source_dir, excludes, test_result_file):
+        testresults = []
+        for root, dirs, files in os.walk(source_dir, topdown=True):
+            [dirs.remove(d) for d in list(dirs) if d in excludes]
+            for name in files:
+                if name == test_result_file:
+                    testresults.append(os.path.join(root, name))
+        return testresults
+
+    def get_aggregated_test_result(self, logger, testresult):
+        test_count_report = {'passed': 0, 'failed': 0, 'skipped': 0, 'failed_testcases': []}
+        result_types = {'passed': ['PASSED', 'passed'],
+                        'failed': ['FAILED', 'failed', 'ERROR', 'error', 'UNKNOWN'],
+                        'skipped': ['SKIPPED', 'skipped']}
+        result = testresult["result"]
+        for k in result:
+            test_status = get_dict_value(logger, result[k], 'status')
+            for tk in result_types:
+                if test_status in result_types[tk]:
+                    test_count_report[tk] += 1
+            if test_status in result_types['failed']:
+                test_count_report['failed_testcases'].append(k)
+        return test_count_report
+
+    def get_test_result_percentage(self, test_result_count):
+        total_tested = test_result_count['passed'] + test_result_count['failed'] + test_result_count['skipped']
+        test_percent_report = {'passed': 0, 'failed': 0, 'skipped': 0}
+        for k in test_percent_report:
+            test_percent_report[k] = format(test_result_count[k] / total_tested * 100, '.2f')
+        return test_percent_report
+
+    def add_test_configurations(self, test_report, source_dir, file, result_id):
+        test_report['file_dir'] = self._get_short_file_dir(source_dir, file)
+        test_report['result_id'] = result_id
+        test_report['test_file_dir_result_id'] = '%s_%s' % (test_report['file_dir'], test_report['result_id'])
+
+    def _get_short_file_dir(self, source_dir, file):
+        file_dir = os.path.dirname(file)
+        source_dir = source_dir[:-1] if source_dir[-1] == '/' else source_dir
+        if file_dir == source_dir:
+            return 'None'
+        return file_dir.replace(source_dir, '')
+
+    def get_max_string_len(self, test_result_list, key, default_max_len):
+        max_len = default_max_len
+        for test_result in test_result_list:
+            value_len = len(test_result[key])
+            if value_len > max_len:
+                max_len = value_len
+        return max_len
+
+    def print_test_report(self, template_file_name, test_count_reports, test_percent_reports,
+                          max_len_dir, max_len_result_id):
+        from jinja2 import Environment, FileSystemLoader
+        script_path = os.path.dirname(os.path.realpath(__file__))
+        file_loader = FileSystemLoader(script_path + '/template')
+        env = Environment(loader=file_loader, trim_blocks=True)
+        template = env.get_template(template_file_name)
+        output = template.render(test_count_reports=test_count_reports,
+                                 test_percent_reports=test_percent_reports,
+                                 max_len_dir=max_len_dir,
+                                 max_len_result_id=max_len_result_id)
+        print('Printing text-based test report:')
+        print(output)
+
+    def view_test_report(self, logger, source_dir, git_branch):
+        if git_branch:
+            checkout_git_dir(source_dir, git_branch)
+        test_count_reports = []
+        test_percent_reports = []
+        for file in self.get_test_result_files(source_dir, ['.git'], 'testresults.json'):
+            logger.debug('Computing result for test result file: %s' % file)
+            testresults = load_json_file(file)
+            for k in testresults:
+                test_count_report = self.get_aggregated_test_result(logger, testresults[k])
+                test_percent_report = self.get_test_result_percentage(test_count_report)
+                self.add_test_configurations(test_count_report, source_dir, file, k)
+                self.add_test_configurations(test_percent_report, source_dir, file, k)
+                test_count_reports.append(test_count_report)
+                test_percent_reports.append(test_percent_report)
+        max_len_dir = self.get_max_string_len(test_count_reports, 'file_dir', len('file_dir'))
+        max_len_result_id = self.get_max_string_len(test_count_reports, 'result_id', len('result_id'))
+        self.print_test_report('test_report_full_text.txt', test_count_reports, test_percent_reports,
+                               max_len_dir, max_len_result_id)
+
+def report(args, logger):
+    report = ResultsTextReport()
+    report.view_test_report(logger, args.source_dir, args.git_branch)
+    return 0
+
+def register_commands(subparsers):
+    """Register subcommands from this plugin"""
+    parser_build = subparsers.add_parser('report', help='report test result summary',
+                                         description='report text-based test result summary from the source directory',
+                                         group='analysis')
+    parser_build.set_defaults(func=report)
+    parser_build.add_argument('source_dir',
+                              help='source directory that contain the test result files for reporting')
+    parser_build.add_argument('-b', '--git-branch', default='',
+                              help='(optional) default assume source directory contains all available files for '
+                                   'reporting unless a git branch was provided where it will try to checkout '
+                                   'the provided git branch assuming source directory was a git repository')
diff --git a/scripts/lib/resultstool/resultsutils.py b/scripts/lib/resultstool/resultsutils.py
new file mode 100644
index 0000000..a85327c
--- /dev/null
+++ b/scripts/lib/resultstool/resultsutils.py
@@ -0,0 +1,47 @@
+# test results tool - utilities
+#
+# Copyright (c) 2019, Intel Corporation.
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
+import json
+import scriptpath
+scriptpath.add_oe_lib_path()
+from oeqa.utils.git import GitRepo, GitError
+
+def load_json_file(file):
+    with open(file, "r") as f:
+        return json.load(f)
+
+def dump_json_data(write_dir, file_name, json_data):
+    file_content = json.dumps(json_data, sort_keys=True, indent=4)
+    file_path = os.path.join(write_dir, file_name)
+    with open(file_path, 'w') as the_file:
+        the_file.write(file_content)
+
+def get_dict_value(logger, dict, key):
+    try:
+        return dict[key]
+    except KeyError:
+        if logger:
+            logger.debug('Faced KeyError exception: dict=%s: key=%s' % (dict, key))
+        return None
+    except TypeError:
+        if logger:
+            logger.debug('Faced TypeError exception: dict=%s: key=%s' % (dict, key))
+        return None
+
+def checkout_git_dir(git_dir, git_branch):
+    try:
+        repo = GitRepo(git_dir, is_topdir=True)
+        repo.run_cmd('checkout %s' % git_branch)
+        return True
+    except GitError:
+        return False
\ No newline at end of file
diff --git a/scripts/lib/resultstool/store.py b/scripts/lib/resultstool/store.py
new file mode 100644
index 0000000..e28159f
--- /dev/null
+++ b/scripts/lib/resultstool/store.py
@@ -0,0 +1,110 @@
+# test results tool - store test results
+#
+# Copyright (c) 2019, Intel Corporation.
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
+import datetime
+import tempfile
+import os
+import subprocess
+import scriptpath
+scriptpath.add_bitbake_lib_path()
+scriptpath.add_oe_lib_path()
+from resultstool.resultsutils import checkout_git_dir
+try:
+    import bb
+except ImportError:
+    pass
+
+class ResultsGitStore(object):
+
+    def _get_output_dir(self):
+        basepath = os.environ['BUILDDIR']
+        return basepath + '/testresults_%s/' % datetime.datetime.now().strftime("%Y%m%d%H%M%S")
+
+    def _create_temporary_workspace_dir(self):
+        return tempfile.mkdtemp(prefix='testresults.')
+
+    def _remove_temporary_workspace_dir(self, workspace_dir):
+        return subprocess.run(["rm", "-rf",  workspace_dir])
+
+    def _oe_copy_files(self, source_dir, destination_dir):
+        from oe.path import copytree
+        copytree(source_dir, destination_dir)
+
+    def _copy_files(self, source_dir, destination_dir, copy_ignore=None):
+        from shutil import copytree
+        copytree(source_dir, destination_dir, ignore=copy_ignore)
+
+    def _store_files_to_git(self, logger, file_dir, git_dir, git_branch, commit_msg_subject, commit_msg_body):
+        logger.debug('Storing test result into git repository (%s) and branch (%s)'
+                     % (git_dir, git_branch))
+        return subprocess.run(["oe-git-archive",
+                               file_dir,
+                               "-g", git_dir,
+                               "-b", git_branch,
+                               "--commit-msg-subject", commit_msg_subject,
+                               "--commit-msg-body", commit_msg_body])
+
+    def store_to_existing(self, logger, source_dir, git_dir, git_branch):
+        logger.debug('Storing files to existing git repository and branch')
+        from shutil import ignore_patterns
+        dest_dir = self._create_temporary_workspace_dir()
+        dest_top_dir = os.path.join(dest_dir, 'top_dir')
+        self._copy_files(git_dir, dest_top_dir, copy_ignore=ignore_patterns('.git'))
+        self._oe_copy_files(source_dir, dest_top_dir)
+        self._store_files_to_git(logger, dest_top_dir, git_dir, git_branch,
+                                 'Store as existing git and branch', 'Store as existing git repository and branch')
+        self._remove_temporary_workspace_dir(dest_dir)
+        return git_dir
+
+    def store_to_existing_with_new_branch(self, logger, source_dir, git_dir, git_branch):
+        logger.debug('Storing files to existing git repository with new branch')
+        self._store_files_to_git(logger, source_dir, git_dir, git_branch,
+                                 'Store as existing git with new branch',
+                                 'Store as existing git repository with new branch')
+        return git_dir
+
+    def store_to_new(self, logger, source_dir, git_branch):
+        logger.debug('Storing files to new git repository')
+        output_dir = self._get_output_dir()
+        self._store_files_to_git(logger, source_dir, output_dir, git_branch,
+                                 'Store as new', 'Store as new git repository')
+        return output_dir
+
+    def store(self, logger, source_dir, git_dir, git_branch):
+        if git_dir:
+            if checkout_git_dir(git_dir, git_branch):
+                self.store_to_existing(logger, source_dir, git_dir, git_branch)
+            else:
+                self.store_to_existing_with_new_branch(logger, source_dir, git_dir, git_branch)
+        else:
+            self.store_to_new(logger, source_dir, git_branch)
+
+def store(args, logger):
+    gitstore = ResultsGitStore()
+    gitstore.store(logger, args.source_dir, args.git_dir, args.git_branch)
+    return 0
+
+def register_commands(subparsers):
+    """Register subcommands from this plugin"""
+    parser_build = subparsers.add_parser('store', help='store test result files and directories into git repository',
+                                         description='store the testresults.json files and related directories '
+                                                     'from the source directory into the destination git repository '
+                                                     'with the given git branch',
+                                         group='setup')
+    parser_build.set_defaults(func=store)
+    parser_build.add_argument('source_dir',
+                              help='source directory that contain the test result files and directories to be stored')
+    parser_build.add_argument('git_branch', help='git branch used for store')
+    parser_build.add_argument('-d', '--git-dir', default='',
+                              help='(optional) default store to new <top_dir>/<build>/<testresults_datetime> '
+                                   'directory unless provided with existing git repository as destination')
diff --git a/scripts/lib/resultstool/template/test_report_full_text.txt b/scripts/lib/resultstool/template/test_report_full_text.txt
new file mode 100644
index 0000000..2e80d59
--- /dev/null
+++ b/scripts/lib/resultstool/template/test_report_full_text.txt
@@ -0,0 +1,35 @@
+==============================================================================================================
+Test Report (Count of passed, failed, skipped group by file_dir, result_id)
+==============================================================================================================
+--------------------------------------------------------------------------------------------------------------
+{{ 'file_dir'.ljust(max_len_dir) }} | {{ 'result_id'.ljust(max_len_result_id) }} | {{ 'passed'.ljust(10) }} | {{ 'failed'.ljust(10) }} | {{ 'skipped'.ljust(10) }}
+--------------------------------------------------------------------------------------------------------------
+{% for report in test_count_reports |sort(attribute='test_file_dir_result_id') %}
+{{ report.file_dir.ljust(max_len_dir) }} | {{ report.result_id.ljust(max_len_result_id) }} | {{ (report.passed|string).ljust(10) }} | {{ (report.failed|string).ljust(10) }} | {{ (report.skipped|string).ljust(10) }}
+{% endfor %}
+--------------------------------------------------------------------------------------------------------------
+
+==============================================================================================================
+Test Report (Percent of passed, failed, skipped group by file_dir, result_id)
+==============================================================================================================
+--------------------------------------------------------------------------------------------------------------
+{{ 'file_dir'.ljust(max_len_dir) }} | {{ 'result_id'.ljust(max_len_result_id) }} | {{ 'passed_%'.ljust(10) }} | {{ 'failed_%'.ljust(10) }} | {{ 'skipped_%'.ljust(10) }}
+--------------------------------------------------------------------------------------------------------------
+{% for report in test_percent_reports |sort(attribute='test_file_dir_result_id') %}
+{{ report.file_dir.ljust(max_len_dir) }} | {{ report.result_id.ljust(max_len_result_id) }} | {{ (report.passed|string).ljust(10) }} | {{ (report.failed|string).ljust(10) }} | {{ (report.skipped|string).ljust(10) }}
+{% endfor %}
+--------------------------------------------------------------------------------------------------------------
+
+==============================================================================================================
+Test Report (Failed test cases group by file_dir, result_id)
+==============================================================================================================
+--------------------------------------------------------------------------------------------------------------
+{% for report in test_count_reports |sort(attribute='test_file_dir_result_id') %}
+{% if report.failed_testcases %}
+file_dir | result_id : {{ report.file_dir }} | {{ report.result_id }}
+{% for testcase in report.failed_testcases %}
+    {{ testcase }}
+{% endfor %}
+{% endif %}
+{% endfor %}
+--------------------------------------------------------------------------------------------------------------
\ No newline at end of file
diff --git a/scripts/resultstool b/scripts/resultstool
new file mode 100755
index 0000000..35cf080
--- /dev/null
+++ b/scripts/resultstool
@@ -0,0 +1,84 @@
+#!/usr/bin/env python3
+#
+# test results tool - tool for testresults.json (merge test results, regression analysis)
+#
+# To look for help information.
+#    $ resultstool
+#
+# To store test result from oeqa automated tests, execute the below
+#     $ resultstool store <source_dir> <git_branch>
+#
+# To merge test results, execute the below
+#    $ resultstool merge <base_result_file> <target_result_file>
+#
+# To report test report, execute the below
+#     $ resultstool report <source_dir>
+#
+# To perform regression analysis, execute the below
+#     $ resultstool regression <base_result_file> <target_result_file>
+#
+# Copyright (c) 2019, Intel Corporation.
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
+
+import os
+import sys
+import argparse
+import logging
+script_path = os.path.dirname(os.path.realpath(__file__))
+lib_path = script_path + '/lib'
+sys.path = sys.path + [lib_path]
+import argparse_oe
+import scriptutils
+import resultstool.merge
+import resultstool.store
+import resultstool.regression
+import resultstool.report
+logger = scriptutils.logger_create('resultstool')
+
+def _validate_user_input_arguments(args):
+    if hasattr(args, "source_dir"):
+        if not os.path.isdir(args.source_dir):
+            logger.error('source_dir argument need to be a directory : %s' % args.source_dir)
+            return False
+    return True
+
+def main():
+    parser = argparse_oe.ArgumentParser(description="OpenEmbedded test results tool.",
+                                        epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
+    parser.add_argument('-d', '--debug', help='enable debug output', action='store_true')
+    parser.add_argument('-q', '--quiet', help='print only errors', action='store_true')
+    subparsers = parser.add_subparsers(dest="subparser_name", title='subcommands', metavar='<subcommand>')
+    subparsers.required = True
+    subparsers.add_subparser_group('setup', 'setup', 200)
+    resultstool.merge.register_commands(subparsers)
+    resultstool.store.register_commands(subparsers)
+    subparsers.add_subparser_group('analysis', 'analysis', 100)
+    resultstool.regression.register_commands(subparsers)
+    resultstool.report.register_commands(subparsers)
+
+    args = parser.parse_args()
+    if args.debug:
+        logger.setLevel(logging.DEBUG)
+    elif args.quiet:
+        logger.setLevel(logging.ERROR)
+
+    if not _validate_user_input_arguments(args):
+        return -1
+
+    try:
+        ret = args.func(args, logger)
+    except argparse_oe.ArgumentUsageError as ae:
+        parser.error_subcommand(ae.message, ae.subcommand)
+    return ret
+
+if __name__ == "__main__":
+    sys.exit(main())
-- 
2.7.4


