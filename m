Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 84A8B7C80E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 16:12:37 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id z84so7337736wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 08:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=tDoV/vmYAGcAID2BV7EMVV/7l5qeb2aBjUZgNhkH+Tk=;
	b=iLsTQX/IiMcwOk1U9NO8FekVGGje2sgQdt1CwHbJh7FFKGZDsyUexUHq4La1v1usBd
	YAKjqLnNOAH+u//uhoGhuch5ZVHo9NlloUuRuQWzWUSx+sHPjWITVpKg455uoTz7/Voc
	heoO75OCUvjYQQbkbKKFLdLDjOmPN3I7etGR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=tDoV/vmYAGcAID2BV7EMVV/7l5qeb2aBjUZgNhkH+Tk=;
	b=S0LbPp7kxjyZbCJeZcpo287GFDXmpbcAdiuBa2Fa7wIlDxpUKEsf1YbikiASqaLlDW
	SqvcXwjyahr6wIEGDmPOF6dsIVLKdNDIw7PmAGBPT7CnVCjxbBt6y0P11UtvWzYfFpb2
	VJGrVGkVzJEAVnX/LuVfxqf5hKCDVpLQBE+Xgmp5DXGiwD+qoXIabYrDJRXW/sImz7Ks
	4xggT1dBjf5f7hsU1yjy6zq5qp7b9ONOGXGlxKr9QSXjCM83tJrhojMbghAfzaOfENK8
	e+Z7qP2jRzjwvLxaGr/KCDhHHgldyj2jiJ06G8ZUYh7rx3jUSz3v15QcQimRlS+PdbAO
	z+6w==
X-Gm-Message-State: AHQUAubdEE04WbkcQQkenRfXdJQdvjOG3jYylPCjLpR+jpp6Qs9hH3mM
	lKF/UfN8zLG09A3I3FpUyimnyv6ip88=
X-Google-Smtp-Source: AHgI3Ibgy38I3GxwKy0yJ1lUB1cS0+IGb4B3U1SyXMurmdNuSm6pRGygBIiRp0eI8OkD0DtrXGHzfw==
X-Received: by 2002:a1c:2e85:: with SMTP id u127mr9653973wmu.45.1550419956529; 
	Sun, 17 Feb 2019 08:12:36 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h184sm29962294wmf.0.2019.02.17.08.12.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 17 Feb 2019 08:12:35 -0800 (PST)
Message-ID: <cda3379ae836358c743a3dbde0e61cecf00e5d3b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Feb 2019 16:12:34 +0000
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: resulttool: Tweaks on top of Ee Peng's base patchset
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
X-List-Received-Date: Sun, 17 Feb 2019 16:12:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

A summary of the tweaks I think we need to make on top of the base
patchset. See the separate email for a discussion of the reasoning
behind this and a list of the work remaining.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/manualexecution.py          |   8 +-
 scripts/lib/resulttool/merge.py                    |  54 ++---
 scripts/lib/resulttool/regression.py               | 247 ++++++++-------------
 scripts/lib/resulttool/report.py                   |  86 +++----
 scripts/lib/resulttool/resultsutils.py             |  67 ------
 scripts/lib/resulttool/resultutils.py              | 104 +++++++++
 scripts/lib/resulttool/store.py                    | 109 +++------
 .../resulttool/template/test_report_full_text.txt  |  31 +--
 8 files changed, 294 insertions(+), 412 deletions(-)
 delete mode 100644 scripts/lib/resulttool/resultsutils.py
 create mode 100644 scripts/lib/resulttool/resultutils.py

diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index 64ec581a9f..ecdc4e7a7a 100755
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
index 1d9cfafd41..3a91bd8eac 100644
--- a/scripts/lib/resulttool/merge.py
+++ b/scripts/lib/resulttool/merge.py
@@ -1,4 +1,4 @@
-# test result tool - merge multiple testresults.json files
+# resulttool - merge multiple testresults.json files
 #
 # Copyright (c) 2019, Intel Corporation.
 #
@@ -11,45 +11,23 @@
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
+    # FIXME Add -t support for  args.target_result_id
+
+    if os.path.isdir(args.target_result_file):
+        results = resultutils.load_resultsdata(args.target_result_file, configmap=resultutils.store_map)
+        resultutils.append_resultsdata(results, args.base_result_file, configmap=resultutils.store_map)
+        resultutils.save_resultsdata(results, args.target_result_file)
+    else:
+        results = resultutils.load_resultsdata(args.base_result_file, configmap=resultutils.flatten_map)
+        if os.path.exists(args.target_result_file):
+            resultutils.append_resultsdata(results, args.target_result_file, configmap=resultutils.flatten_map)
+        resultutils.save_resultsdata(results, os.path.dirname(args.target_result_file), fn=os.path.basename(args.target_result_file))
+
     return 0
 
 def register_commands(subparsers):
@@ -66,6 +44,4 @@ def register_commands(subparsers):
     parser_build.add_argument('-t', '--target-result-id', default='',
                               help='(optional) default merge all result sets available from target to base '
                                    'unless specific target result id was provided')
-    parser_build.add_argument('-o', '--output-dir', default='',
-                              help='(optional) default write merged results to <poky>/build/tmp/ unless specific  '
-                                   'output directory was provided')
+
diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index bee3fb011a..1f19c398f9 100644
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
@@ -11,171 +12,104 @@
 # FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 # more details.
 #
-from resulttool.resultsutils import load_json_file, get_dict_value, pop_dict_element
+from resulttool.resultutils import checkout_git_dir
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
     if checkout_git_dir(args.source_dir, args.base_git_branch):
-        base_results = get_results_from_directory(logger, args.source_dir)
+        base_results = get_results(logger, args.source_dir)
     if checkout_git_dir(args.source_dir, args.target_git_branch):
-        target_results = get_results_from_directory(logger, args.source_dir)
-    if base_results and target_results:
-        remove_testcases_to_optimize_regression_runtime(logger, base_results)
-        remove_testcases_to_optimize_regression_runtime(logger, target_results)
-        regression = ResultsRegressionSelector()
-        regression_pair = regression.get_regression_base_target_pair(logger, base_results, target_results)
-        logger.debug('Retrieved regression pair=%s' % regression_pair)
-        regression.run_regression_with_regression_pairing(logger, regression_pair, base_results, target_results)
+        target_results = get_results(logger, args.source_dir)
+
+    regression_common(args, logger, base_result, target_result)
     return 0
 
 def register_commands(subparsers):
     """Register subcommands from this plugin"""
-    parser_build = subparsers.add_parser('regression-file', help='regression file analysis',
+
+    parser_build = subparsers.add_parser('regression', help='regression file/directory analysis',
                                          description='regression analysis comparing base result set to target '
                                                      'result set',
                                          group='analysis')
-    parser_build.set_defaults(func=regression_file)
-    parser_build.add_argument('base_result_file',
-                              help='base result file provide the base result set')
-    parser_build.add_argument('target_result_file',
-                              help='target result file provide the target result set for comparison with base result')
+    parser_build.set_defaults(func=regression)
+    parser_build.add_argument('base_result',
+                              help='base result file/directory provide the files for base result set')
+    parser_build.add_argument('target_result',
+                              help='target result file/directory provide the files for target result set for comparison with '
+                                   'base result')
     parser_build.add_argument('-b', '--base-result-id', default='',
                               help='(optional) default select regression based on configurations unless base result '
                                    'id was provided')
@@ -183,16 +117,6 @@ def register_commands(subparsers):
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
 
     parser_build = subparsers.add_parser('regression-git', help='regression git analysis',
                                          description='regression analysis comparing base result set to target '
@@ -206,3 +130,10 @@ def register_commands(subparsers):
     parser_build.add_argument('target_git_branch',
                               help='target git branch that provide the files for target result set for comparison with '
                                    'base result')
+    parser_build.add_argument('-b', '--base-result-id', default='',
+                              help='(optional) default select regression based on configurations unless base result '
+                                   'id was provided')
+    parser_build.add_argument('-t', '--target-result-id', default='',
+                              help='(optional) default select regression based on configurations unless target result '
+                                   'id was provided')
+
diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index ab5de1f3a7..bdb49ce4be 100644
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
@@ -14,7 +15,8 @@
 import os
 import glob
 import json
-from resulttool.resultsutils import checkout_git_dir, load_json_file, get_dict_value, get_directory_files
+from resulttool.resultutils import checkout_git_dir
+import resulttool.resultutils as resultutils
 
 class ResultsTextReport(object):
 
@@ -23,9 +25,9 @@ class ResultsTextReport(object):
         result_types = {'passed': ['PASSED', 'passed'],
                         'failed': ['FAILED', 'failed', 'ERROR', 'error', 'UNKNOWN'],
                         'skipped': ['SKIPPED', 'skipped']}
-        result = get_dict_value(logger, testresult, 'result')
+        result = testresult.get('result', [])
         for k in result:
-            test_status = get_dict_value(logger, result[k], 'status')
+            test_status = result[k].get('status', [])
             for tk in result_types:
                 if test_status in result_types[tk]:
                     test_count_report[tk] += 1
@@ -33,66 +35,48 @@ class ResultsTextReport(object):
                 test_count_report['failed_testcases'].append(k)
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
+        reportvalues = []
+        cols = ['passed', 'failed', 'skipped']
+        maxlen = {'passed' : 0, 'failed' : 0, 'skipped' : 0, 'result_id': 0, 'testseries' :0 }
+        for line in test_count_reports:
+            total_tested = line['passed'] + line['failed'] + line['skipped']
+            vals = {}
+            vals['result_id'] = line['result_id']
+            vals['testseries'] = line['testseries']
+            vals['sort'] = line['testseries'] + "_" + line['result_id']
+            for k in cols:
+                vals[k] = "%d (%s%%)" % (line[k], format(line[k] / total_tested * 100, '.0f'))
+            for k in maxlen:
+                if len(vals[k]) > maxlen[k]:
+                    maxlen[k] = len(vals[k])
+            reportvalues.append(vals)
+            if line['failed_testcases']:
+                havefailed = True
+        output = template.render(reportvalues=reportvalues,
+                                 havefailed=havefailed,
+                                 maxlen=maxlen)
         print(output)
 
     def view_test_report(self, logger, source_dir, git_branch):
         if git_branch:
             checkout_git_dir(source_dir, git_branch)
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
+        testresults = resultutils.load_resultsdata(source_dir)
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
diff --git a/scripts/lib/resulttool/resultsutils.py b/scripts/lib/resulttool/resultsutils.py
deleted file mode 100644
index 368786922c..0000000000
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
index 0000000000..54f8dd1bfa
--- /dev/null
+++ b/scripts/lib/resulttool/resultutils.py
@@ -0,0 +1,104 @@
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
+from oeqa.utils.git import GitRepo, GitError
+
+def checkout_git_dir(git_dir, git_branch):
+    try:
+        repo = GitRepo(git_dir, is_topdir=True)
+        repo.run_cmd('checkout %s' % git_branch)
+        return True
+    except GitError:
+        return False
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
+    with open(f, "r") as filedata:
+        data = json.load(filedata)
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
+        for i in ['ptestresult.rawlogs', 'ptestresult.sections']:
+            if i in data[res]['result']:
+                del data[res]['result'][i]
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
diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index 2c6fd8492c..236bfdf64d 100644
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
@@ -11,87 +12,44 @@
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
-
-    def _copy_files(self, source_dir, destination_dir, copy_ignore=None):
-        from shutil import copytree
-        copytree(source_dir, destination_dir, ignore=copy_ignore)
-
-    def _store_files_to_git(self, logger, file_dir, git_dir, git_branch, commit_msg_subject, commit_msg_body):
-        logger.debug('Storing test result into git repository (%s) and branch (%s)'
-                     % (git_dir, git_branch))
-        return subprocess.run(["oe-git-archive",
-                               file_dir,
-                               "-g", git_dir,
-                               "-b", git_branch,
-                               "--commit-msg-subject", commit_msg_subject,
-                               "--commit-msg-body", commit_msg_body])
-
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
-
-    def store_to_existing_with_new_branch(self, logger, source_dir, git_dir, git_branch):
-        logger.debug('Storing files to existing git repository with new branch')
-        self._store_files_to_git(logger, source_dir, git_dir, git_branch,
-                                 'Store as existing git with new branch',
-                                 'Store as existing git repository with new branch')
-        return git_dir
-
-    def store_to_new(self, logger, source_dir, git_branch):
-        logger.debug('Storing files to new git repository')
-        output_dir = self._get_output_dir()
-        self._store_files_to_git(logger, source_dir, output_dir, git_branch,
-                                 'Store as new', 'Store as new git repository')
-        return output_dir
+def store(args, logger):
+    tempdir = tempfile.mkdtemp(prefix='testresults.')
+    try:
+        results = {}
+        logger.info('Reading files from %s' % args.source_dir)
+        for root, dirs, files in os.walk(args.source_dir):
+            for name in files:
+                f = os.path.join(root, name)
+                if name == "testresults.json":
+                    resultutils.append_resultsdata(results, f)
+                else:
+                    dst = f.replace(args.source_dir, tempdir + "/")
+                    os.makedirs(os.path.dirname(dst), exist_ok=True)
+                    shutil.copyfile(f, dst)
+        resultutils.save_resultsdata(results, tempdir)
 
-    def store(self, logger, source_dir, git_dir, git_branch):
-        if git_dir:
-            if checkout_git_dir(git_dir, git_branch):
-                self.store_to_existing(logger, source_dir, git_dir, git_branch)
-            else:
-                self.store_to_existing_with_new_branch(logger, source_dir, git_dir, git_branch)
-        else:
-            self.store_to_new(logger, source_dir, git_branch)
+        logger.info('Storing test result into git repository %s' % args.git_dir)
+        subprocess.check_call(["oe-git-archive",
+                               tempdir,
+                               "-g", args.git_dir,
+                               "-b", "{branch}",
+                               "--tag-name", "{branch}/{commit_count}-g{commit}/{tag_number}",
+                               "--commit-msg-subject", "Results of {branch}:{commit}",
+                               "--commit-msg-body", "branch: {branch}\ncommit: {commit}"])
+    finally:
+        subprocess.check_call(["rm", "-rf",  tempdir])
 
-def store(args, logger):
-    gitstore = ResultsGitStore()
-    gitstore.store(logger, args.source_dir, args.git_dir, args.git_branch)
     return 0
 
 def register_commands(subparsers):
@@ -104,7 +62,6 @@ def register_commands(subparsers):
     parser_build.set_defaults(func=store)
     parser_build.add_argument('source_dir',
                               help='source directory that contain the test result files and directories to be stored')
-    parser_build.add_argument('git_branch', help='git branch used for store')
-    parser_build.add_argument('-d', '--git-dir', default='',
-                              help='(optional) default store to new <top_dir>/<build>/<testresults_datetime> '
-                                   'directory unless provided with existing git repository as destination')
+    parser_build.add_argument('git_dir',
+                              help='the location of the git repository to store the results in')
+
diff --git a/scripts/lib/resulttool/template/test_report_full_text.txt b/scripts/lib/resulttool/template/test_report_full_text.txt
index bc4874ba4b..1c7484dc0e 100644
--- a/scripts/lib/resulttool/template/test_report_full_text.txt
+++ b/scripts/lib/resulttool/template/test_report_full_text.txt
@@ -1,35 +1,28 @@
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
 
 ==============================================================================================================
-Test Report (Percent of passed, failed, skipped group by file_dir, result_id)
+Failed test cases (sorted by testseries, ID)
 ==============================================================================================================
+{% if havefailed %}
 --------------------------------------------------------------------------------------------------------------
-{{ 'file_dir'.ljust(max_len_dir) }} | {{ 'result_id'.ljust(max_len_result_id) }} | {{ 'passed_%'.ljust(10) }} | {{ 'failed_%'.ljust(10) }} | {{ 'skipped_%'.ljust(10) }}
---------------------------------------------------------------------------------------------------------------
-{% for report in test_percent_reports |sort(attribute='test_file_dir_result_id') %}
-{{ report.file_dir.ljust(max_len_dir) }} | {{ report.result_id.ljust(max_len_result_id) }} | {{ (report.passed|string).ljust(10) }} | {{ (report.failed|string).ljust(10) }} | {{ (report.skipped|string).ljust(10) }}
-{% endfor %}
---------------------------------------------------------------------------------------------------------------
-
-==============================================================================================================
-Test Report (Failed test cases group by file_dir, result_id)
-==============================================================================================================
---------------------------------------------------------------------------------------------------------------
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
-- 
cgit v1.2.1



