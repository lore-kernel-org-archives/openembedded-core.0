Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3D14074C4D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 07:20:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Aug 2018 00:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,301,1531810800"; d="scan'208";a="68691884"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga007.jf.intel.com with ESMTP; 29 Aug 2018 00:20:30 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2018 15:05:06 +0800
Message-Id: <1535526306-26126-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] test-result-log: testcase management tool to store test result
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
X-List-Received-Date: Wed, 29 Aug 2018 07:20:32 -0000

These scripts were developed as an alternative testcase management
tool to Testopia. Using these scripts, user can store test result
from OEQA automated testcase execution.

These scripts will store test result & log in GIT repository.
To use these scripts, first source oe environment, then run the
entry point script to look for help.
    $ test-result-log

To store test result for OEQA automated testcase, execute the below
    $ test-result-log store-auto <top-folder-name> <git-branch> /
      <oeqa-log-file-location> <type-of-oeqa-testcase-executed>

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/testresultlog/__init__.py         |   1 +
 scripts/lib/testresultlog/gitstore.py         | 250 ++++++++++++++++++++++++++
 scripts/lib/testresultlog/oeqalogparser.py    |  97 ++++++++++
 scripts/lib/testresultlog/oeqatestdiscover.py |  51 ++++++
 scripts/lib/testresultlog/storeauto.py        | 125 +++++++++++++
 scripts/test-result-log                       | 108 +++++++++++
 6 files changed, 632 insertions(+)
 create mode 100644 scripts/lib/testresultlog/__init__.py
 create mode 100644 scripts/lib/testresultlog/gitstore.py
 create mode 100644 scripts/lib/testresultlog/oeqalogparser.py
 create mode 100644 scripts/lib/testresultlog/oeqatestdiscover.py
 create mode 100644 scripts/lib/testresultlog/storeauto.py
 create mode 100755 scripts/test-result-log

diff --git a/scripts/lib/testresultlog/__init__.py b/scripts/lib/testresultlog/__init__.py
new file mode 100644
index 0000000..d3f5a12
--- /dev/null
+++ b/scripts/lib/testresultlog/__init__.py
@@ -0,0 +1 @@
+
diff --git a/scripts/lib/testresultlog/gitstore.py b/scripts/lib/testresultlog/gitstore.py
new file mode 100644
index 0000000..866d7d6
--- /dev/null
+++ b/scripts/lib/testresultlog/gitstore.py
@@ -0,0 +1,250 @@
+# test case management tool - store test result to git repository
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
+import tempfile
+import os
+import pathlib
+import json
+import subprocess
+import shutil
+import scriptpath
+scriptpath.add_bitbake_lib_path()
+scriptpath.add_oe_lib_path()
+from oeqa.utils.git import GitRepo, GitError
+
+class GitStore(object):
+
+    def __init__(self):
+        self.script_path = os.path.dirname(os.path.realpath(__file__))
+        self.base_path = self.script_path + '/../../..'
+
+    def _get_project_environment_directory_path(self, project_dir, test_environment_list):
+        project_env_dir = project_dir
+        for env in test_environment_list:
+            project_env_dir = os.path.join(project_env_dir, env)
+        return project_env_dir
+
+    def _get_testmodule_list(self, testmodule_testsuite_dict):
+        return sorted(list(testmodule_testsuite_dict.keys()))
+
+    def _get_testcase_list(self, testsuite_list, testsuite_testcase_dict):
+        testcase_list = []
+        for testsuite in sorted(testsuite_list):
+            if testsuite in testsuite_testcase_dict:
+                for testcase in testsuite_testcase_dict[testsuite]:
+                    testcase_list.append(testcase)
+        return testcase_list
+
+    def _get_testcase_status(self, testcase, testcase_status_dict):
+        if testcase in testcase_status_dict:
+            return testcase_status_dict[testcase]
+        return ""
+
+    def _create_testcase_dict(self, testcase_list, testcase_status_dict):
+        testcase_dict = {}
+        for testcase in sorted(testcase_list):
+            testcase_status = self._get_testcase_status(testcase, testcase_status_dict)
+            testcase_dict[testcase] = {"testresult": testcase_status,"bugs": ""}
+        return testcase_dict
+
+    def _create_testsuite_testcase_teststatus_json_object(self, testsuite_list, testsuite_testcase_dict, testcase_status_dict):
+        json_object = {'testsuite':{}}
+        testsuite_dict = json_object['testsuite']
+        for testsuite in sorted(testsuite_list):
+            testsuite_dict[testsuite] = {'testcase': {}}
+            testsuite_dict[testsuite]['testcase'] = self._create_testcase_dict(testsuite_testcase_dict[testsuite], testcase_status_dict)
+        return json_object
+
+    def _create_testsuite_json_formatted_string(self, testsuite_list, testsuite_testcase_dict, testcase_status_dict):
+        testsuite_testcase_list = self._create_testsuite_testcase_teststatus_json_object(testsuite_list, testsuite_testcase_dict, testcase_status_dict)
+        return json.dumps(testsuite_testcase_list, sort_keys=True, indent=4)
+
+    def _write_testsuite_testcase_json_formatted_string_to_file(self, file_path, file_content):
+        with open(file_path, 'w') as the_file:
+            the_file.write(file_content)
+
+    def _write_log_file(self, file_path, logs):
+        with open(file_path, 'w') as the_file:
+            for line in logs:
+                the_file.write(line + '\n')
+
+    def _write_test_log_files_for_list_of_testcase(self, file_dir, testcase_list, testcase_logs_dict):
+        for testcase in testcase_list:
+            if testcase in testcase_logs_dict:
+                file_path = os.path.join(file_dir, '%s.log' % testcase)
+                self._write_log_file(file_path, testcase_logs_dict[testcase])
+
+    def _copy_files_from_source_to_destination_dir(self, source_dir, destination_dir):
+        if os.path.exists(source_dir) and os.path.exists(destination_dir):
+            for item in os.listdir(source_dir):
+                s = os.path.join(source_dir, item)
+                d = os.path.join(destination_dir, item)
+                shutil.copy2(s, d)
+
+    def _load_test_module_file_with_json_into_dictionary(self, file, logger):
+        if os.path.exists(file):
+            with open(file, "r") as f:
+                return json.load(f)
+        else:
+            logger.error('Cannot find file (%s)' % file)
+            return None
+
+    def _get_testcase_log_need_removal_list(self, testcase, cur_testcase_status, next_testcase_status, testcase_log_remove_list):
+        if cur_testcase_status == 'FAILED' or cur_testcase_status == 'ERROR':
+            if next_testcase_status == 'PASSED' or next_testcase_status == 'SKIPPED':
+                testcase_log_remove_list.append(testcase)
+
+    def _update_target_testresult_dictionary_with_status(self, target_testresult_dict, testsuite_list, testsuite_testcase_dict,
+                                                         testcase_status_dict, testcase_log_remove_list):
+        for testsuite in testsuite_list:
+            testcase_list = testsuite_testcase_dict[testsuite]
+            for testcase in testcase_list:
+                if testcase in testcase_status_dict:
+                    cur_testcase_status = target_testresult_dict['testsuite'][testsuite]['testcase'][testcase]['testresult']
+                    next_testcase_status = testcase_status_dict[testcase]
+                    self._get_testcase_log_need_removal_list(testcase, cur_testcase_status, next_testcase_status, testcase_log_remove_list)
+                    target_testresult_dict['testsuite'][testsuite]['testcase'][testcase]['testresult'] = next_testcase_status
+
+    def _remove_test_log_files(self, file_dir, testcase_log_remove_list):
+        for testcase_log_remove in testcase_log_remove_list:
+            file_remove_path = os.path.join(file_dir, '%s.log' % testcase_log_remove)
+            if os.path.exists(file_remove_path):
+                os.remove(file_remove_path)
+
+    def _check_if_dir_contain_project_and_environment_directory(self, dir, project, environment_list):
+        project_env_dir = self._get_project_environment_directory(dir, project, environment_list)
+        if os.path.exists(project_env_dir):
+            return True
+        else:
+            return False
+
+    def _git_init(self, git_repo):
+        try:
+            repo = GitRepo(git_repo, is_topdir=True)
+        except GitError:
+            print("Non-empty directory that is not a Git repository "
+                   "at {}\nPlease specify an existing Git repository, "
+                   "an empty directory or a non-existing directory "
+                   "path.".format(git_repo))
+        return repo
+
+    def _run_git_cmd(self, repo, cmd):
+        try:
+            output = repo.run_cmd(cmd)
+            return True, output
+        except GitError:
+            return False, None
+
+    def _check_if_git_repo_and_git_branch_exist(self, git_repo, git_branch):
+        git_dir = '%s/.git' % git_repo
+        if not os.path.exists(git_dir):
+            return False
+        repo = self._git_init(git_repo)
+        status, output = self._git_checkout_git_repo(repo, git_branch)
+        return status
+
+    def _git_checkout_git_repo(self, repo, git_branch):
+        cmd = 'checkout %s' % git_branch
+        return self._run_git_cmd(repo, cmd)
+
+    def _create_temporary_workspace_dir(self):
+        return tempfile.mkdtemp(prefix='testresultlog.')
+
+    def _remove_temporary_workspace_dir(self, workspace_dir):
+        return subprocess.run(["rm", "-rf",  workspace_dir])
+
+    def _get_project_environment_directory(self, top_dir, project, environment_list):
+        project_dir = os.path.join(top_dir, project)
+        project_env_dir = self._get_project_environment_directory_path(project_dir, environment_list)
+        return project_env_dir
+
+    def _create_project_environment_directory_structure(self, top_dir, project, environment_list):
+        project_env_dir = self._get_project_environment_directory(top_dir, project, environment_list)
+        pathlib.Path(project_env_dir).mkdir(parents=True, exist_ok=True)
+        return project_env_dir
+
+    def _create_testmodule_and_test_log_files_to_directory(self, directory, testmodule_testsuite_dict, testsuite_testcase_dict,
+                                                           testcase_status_dict, testcase_logs_dict):
+        for testmodule in self._get_testmodule_list(testmodule_testsuite_dict):
+            testsuite_list = testmodule_testsuite_dict[testmodule]
+            testsuite_json_structure = self._create_testsuite_json_formatted_string(testsuite_list, testsuite_testcase_dict, testcase_status_dict)
+            file_name = '%s.json' % testmodule
+            file_path = os.path.join(directory, file_name)
+            self._write_testsuite_testcase_json_formatted_string_to_file(file_path, testsuite_json_structure)
+            testcase_list = self._get_testcase_list(testsuite_list, testsuite_testcase_dict)
+            self._write_test_log_files_for_list_of_testcase(directory, testcase_list, testcase_logs_dict)
+
+    def _push_testsuite_testcase_json_file_to_git_repo(self, file_dir, git_repo, git_branch):
+        return subprocess.run(["oe-git-archive", file_dir, "-g", git_repo, "-b", git_branch])
+
+    def _create_automated_test_result_from_empty_git(self, git_repo, git_branch, project, environment_list, testmodule_testsuite_dict,
+                                                     testsuite_testcase_dict, testcase_status_dict, testcase_logs_dict):
+        workspace_dir = self._create_temporary_workspace_dir()
+        project_env_dir = self._create_project_environment_directory_structure(workspace_dir, project, environment_list)
+        self._create_testmodule_and_test_log_files_to_directory(project_env_dir, testmodule_testsuite_dict, testsuite_testcase_dict,
+                                                                testcase_status_dict, testcase_logs_dict)
+        self._push_testsuite_testcase_json_file_to_git_repo(workspace_dir, git_repo, git_branch)
+        self._remove_temporary_workspace_dir(workspace_dir)
+
+    def _create_automated_test_result_from_existing_git(self, git_repo, git_branch, project, environment_list, testmodule_testsuite_dict,
+                                                        testsuite_testcase_dict, testcase_status_dict, testcase_logs_dict):
+        project_env_dir = self._create_project_environment_directory_structure(git_repo, project, environment_list)
+        self._create_testmodule_and_test_log_files_to_directory(project_env_dir, testmodule_testsuite_dict, testsuite_testcase_dict,
+                                                                testcase_status_dict, testcase_logs_dict)
+        self._push_testsuite_testcase_json_file_to_git_repo(git_repo, git_repo, git_branch)
+
+    def _load_testmodule_file_and_update_test_result(self, project_env_dir, testmodule_testsuite_dict, testsuite_testcase_dict,
+                                                     testcase_status_dict, testcase_logs_dict, testcase_log_remove_list, logger):
+        for testmodule in self._get_testmodule_list(testmodule_testsuite_dict):
+            testmodule_file = os.path.join(project_env_dir, '%s.json' % testmodule)
+            target_testresult_dict = self._load_test_module_file_with_json_into_dictionary(testmodule_file, logger)
+            testsuite_list = testmodule_testsuite_dict[testmodule]
+            self._update_target_testresult_dictionary_with_status(target_testresult_dict, testsuite_list, testsuite_testcase_dict,
+                                                                  testcase_status_dict, testcase_log_remove_list)
+            self._write_testsuite_testcase_json_formatted_string_to_file(testmodule_file, json.dumps(target_testresult_dict, sort_keys=True, indent=4))
+            testcase_list = self._get_testcase_list(testsuite_list, testsuite_testcase_dict)
+            self._write_test_log_files_for_list_of_testcase(project_env_dir, testcase_list, testcase_logs_dict)
+
+    def _update_automated_test_result(self, git_repo, git_branch, project, environment_list, testmodule_testsuite_dict,
+                                      testsuite_testcase_dict, testcase_status_dict, testcase_logs_dict, logger):
+        repo = self._git_init(git_repo)
+        self._git_checkout_git_repo(repo, git_branch)
+        project_env_dir = self._get_project_environment_directory(git_repo, project, environment_list)
+        testcase_log_remove_list = []
+        self._load_testmodule_file_and_update_test_result(project_env_dir, testmodule_testsuite_dict, testsuite_testcase_dict,
+                                                          testcase_status_dict, testcase_logs_dict, testcase_log_remove_list, logger)
+        self._remove_test_log_files(project_env_dir, testcase_log_remove_list)
+        self._push_testsuite_testcase_json_file_to_git_repo(git_repo, git_repo, git_branch)
+
+    def smart_create_update_automated_test_result(self, git_repo, git_branch, project, environment_list, testmodule_testsuite_dict,
+                                                  testsuite_testcase_dict, testcase_status_dict, testcase_logs_dict, logger):
+        logger.debug('Creating/Updating test result for environment list: %s' % environment_list)
+        if self._check_if_git_repo_and_git_branch_exist(git_repo, git_branch):
+            repo = self._git_init(git_repo)
+            self._git_checkout_git_repo(repo, git_branch)
+            logger.debug('Found existing git repository and git branch: %s %s' % (git_repo, git_branch))
+            if self._check_if_dir_contain_project_and_environment_directory(git_repo, project, environment_list):
+                logger.debug('Found existing project and environment directory inside: %s' % git_repo)
+                logger.debug('Updating test result and log files')
+                self._update_automated_test_result(git_repo, git_branch, project, environment_list, testmodule_testsuite_dict,
+                                                   testsuite_testcase_dict, testcase_status_dict, testcase_logs_dict, logger)
+            else:
+                logger.debug('Could not find project and environment directory inside: %s' % git_repo)
+                logger.debug('Creating project & environment directory and test result & log files inside: %s' % git_repo)
+                self._create_automated_test_result_from_existing_git(git_repo, git_branch, project, environment_list, testmodule_testsuite_dict,
+                                                                     testsuite_testcase_dict, testcase_status_dict, testcase_logs_dict)
+        else:
+            logger.debug('Could not find git repository and git branch: %s %s' % (git_repo, git_branch))
+            logger.debug('Creating git repository, git branch, project & environment directory and test result & log files inside: %s' % git_repo)
+            self._create_automated_test_result_from_empty_git(git_repo, git_branch, project, environment_list, testmodule_testsuite_dict,
+                                                              testsuite_testcase_dict, testcase_status_dict, testcase_logs_dict)
diff --git a/scripts/lib/testresultlog/oeqalogparser.py b/scripts/lib/testresultlog/oeqalogparser.py
new file mode 100644
index 0000000..0d7bdc6
--- /dev/null
+++ b/scripts/lib/testresultlog/oeqalogparser.py
@@ -0,0 +1,97 @@
+# test case management tool - parse test result for OEQA automated tests
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
+import re
+
+class OeqaLogParser(object):
+
+    def get_test_status(self, log_file):
+        regex = ".*RESULTS - (?P<case_name>.*) - Testcase .*: (?P<status>PASSED|FAILED|SKIPPED|ERROR|UNKNOWN).*$"
+        regex_comp = re.compile(regex)
+        results = {}
+        with open(log_file, "r") as f:
+            for line in f:
+                line = line.strip()
+                m = regex_comp.search(line)
+                if m:
+                    results[m.group('case_name')] = m.group('status')
+        return results
+
+    def get_runtime_test_image_environment(self, log_file):
+        regex = "core-image.*().*Ran.*tests in .*s"
+        regex_comp = re.compile(regex)
+        image_env = ''
+        with open(log_file, "r") as f:
+            for line in f:
+                line = line.strip()
+                m = regex_comp.search(line)
+                if m:
+                    image_env = line[:line.find("(")-1]
+                    image_env = image_env.strip()
+                    break
+        return image_env
+
+    def get_runtime_test_qemu_environment(self, log_file):
+        regex = "DEBUG: launchcmd=runqemu*"
+        regex_comp = re.compile(regex)
+        qemu_env = ''
+        with open(log_file, "r") as f:
+            for line in f:
+                line = line.strip()
+                m = regex_comp.search(line)
+                if m:
+                    qemu_list = ['qemuarm', 'qemuarm64', 'qemumips', 'qemumips64', 'qemuppc', 'qemux86', 'qemux86-64']
+                    for qemu in qemu_list:
+                        if qemu in line:
+                            qemu_env = qemu
+                            break
+        return qemu_env
+
+    def _search_log_to_capture(self, logs, line, state, regex_comp_start, regex_comp_end_fail_or, regex_comp_end_error_or, regex_comp_end):
+        if state == 'Searching':
+            m = regex_comp_start.search(line)
+            if m:
+                logs.append(line)
+                return 'Found'
+            else:
+                return 'Searching'
+        elif state == 'Found':
+            m_fail = regex_comp_end_fail_or.search(line)
+            m_error = regex_comp_end_error_or.search(line)
+            m_end = regex_comp_end.search(line)
+            if m_fail or m_error or m_end:
+                return 'End'
+            else:
+                logs.append(line)
+                return 'Found'
+
+    def get_test_log(self, log_file, test_status, testcase_name, testsuite_name):
+        if test_status == 'FAILED':
+            test_status = 'FAIL'
+        regex_search_start = ".*%s: %s \(%s\).*" % (test_status, testcase_name, testsuite_name)
+        regex_search_end_fail_or = ".*FAIL: test.*"
+        regex_search_end_error_or = ".*ERROR: test.*"
+        regex_search_end = ".*Ran.*tests in .*s"
+        regex_comp_start = re.compile(regex_search_start)
+        regex_comp_end_fail_or = re.compile(regex_search_end_fail_or)
+        regex_comp_end_error_or = re.compile(regex_search_end_error_or)
+        regex_comp_end = re.compile(regex_search_end)
+        state = 'Searching'
+        logs = []
+        with open(log_file, "r") as f:
+            for line in f:
+                line = line.strip()
+                if state == 'End':
+                    return logs
+                else:
+                    state = self._search_log_to_capture(logs, line, state, regex_comp_start, regex_comp_end_fail_or, regex_comp_end_error_or, regex_comp_end)
diff --git a/scripts/lib/testresultlog/oeqatestdiscover.py b/scripts/lib/testresultlog/oeqatestdiscover.py
new file mode 100644
index 0000000..8800a4f
--- /dev/null
+++ b/scripts/lib/testresultlog/oeqatestdiscover.py
@@ -0,0 +1,51 @@
+# test case management tool - discover automated test case
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
+import unittest
+
+class OeqaTestDiscover(object):
+
+    def _discover_unittest_testsuite_testcase(self, test_dir):
+        loader = unittest.TestLoader()
+        testsuite_testcase = loader.discover(start_dir=test_dir, pattern='*.py')
+        return testsuite_testcase
+
+    def _generate_flat_list_of_unittest_testcase(self, testsuite):
+        for test in testsuite:
+            if unittest.suite._isnotsuite(test):
+                yield test
+            else:
+                for subtest in self._generate_flat_list_of_unittest_testcase(test):
+                    yield subtest
+
+    def _get_testsuite_from_unittest_testcase(self, unittest_testcase):
+        testsuite = unittest_testcase[unittest_testcase.find("(")+1:unittest_testcase.find(")")]
+        return testsuite
+
+    def _get_testcase_from_unittest_testcase(self, unittest_testcase):
+        testcase = unittest_testcase[0:unittest_testcase.find("(")-1]
+        testsuite = self._get_testsuite_from_unittest_testcase(unittest_testcase)
+        testcase = '%s.%s' % (testsuite, testcase)
+        return testcase
+
+    def _get_testcase_list(self, unittest_testcase_list):
+        testcase_list = []
+        for unittest_testcase in unittest_testcase_list:
+            testcase_list.append(self._get_testcase_from_unittest_testcase(str(unittest_testcase)))
+        return testcase_list
+
+    def get_oeqa_testcase_list(self, testcase_dir):
+        unittest_testsuite_testcase = self._discover_unittest_testsuite_testcase(testcase_dir)
+        unittest_testcase_list = self._generate_flat_list_of_unittest_testcase(unittest_testsuite_testcase)
+        testcase_list = self._get_testcase_list(unittest_testcase_list)
+        return testcase_list
diff --git a/scripts/lib/testresultlog/storeauto.py b/scripts/lib/testresultlog/storeauto.py
new file mode 100644
index 0000000..18c9e36
--- /dev/null
+++ b/scripts/lib/testresultlog/storeauto.py
@@ -0,0 +1,125 @@
+# test case management tool - store automated test result
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
+from testresultlog.gitstore import GitStore
+from testresultlog.oeqatestdiscover import OeqaTestDiscover
+from testresultlog.oeqalogparser import OeqaLogParser
+
+class StoreAuto(object):
+
+    def _get_testsuite_from_testcase(self, testcase):
+        testsuite = testcase[0:testcase.rfind(".")]
+        return testsuite
+
+    def _get_testmodule_from_testsuite(self, testsuite):
+        testmodule = testsuite[0:testsuite.find(".")]
+        return testmodule
+
+    def _remove_testsuite_from_testcase(self, testcase, testsuite):
+        testsuite = testsuite + '.'
+        testcase_remove_testsuite = testcase.replace(testsuite, '')
+        return testcase_remove_testsuite
+
+    def _add_new_environment_to_environment_list(self, environment_list, new_environment):
+        if len(new_environment) > 0 and new_environment not in environment_list:
+            if len(environment_list) == 0:
+                environment_list = new_environment
+            else:
+                environment_list = '%s,%s' % (environment_list, new_environment)
+        return environment_list
+
+    def get_environment_list_for_test_log(self, log_file, log_file_source, environment_list, oeqa_logparser):
+        if log_file_source == 'runtime':
+            runtime_image_env = oeqa_logparser.get_runtime_test_image_environment(log_file)
+            runtime_qemu_env = oeqa_logparser.get_runtime_test_qemu_environment(log_file)
+            environment_list = self._add_new_environment_to_environment_list(environment_list, runtime_image_env)
+            environment_list = self._add_new_environment_to_environment_list(environment_list, runtime_qemu_env)
+        return environment_list.split(",")
+
+    def get_testsuite_testcase_dictionary(self, testcase_dir):
+        oeqatestdiscover = OeqaTestDiscover()
+        testcase_list = oeqatestdiscover.get_oeqa_testcase_list(testcase_dir)
+        testsuite_testcase_dict = {}
+        for testcase in testcase_list:
+            testsuite = self._get_testsuite_from_testcase(testcase)
+            if testsuite in testsuite_testcase_dict:
+                testsuite_testcase_dict[testsuite].append(testcase)
+            else:
+                testsuite_testcase_dict[testsuite] = [testcase]
+        return testsuite_testcase_dict
+
+    def get_testmodule_testsuite_dictionary(self, testsuite_testcase_dict):
+        testsuite_list = testsuite_testcase_dict.keys()
+        testmodule_testsuite_dict = {}
+        for testsuite in testsuite_list:
+            testmodule = self._get_testmodule_from_testsuite(testsuite)
+            if testmodule in testmodule_testsuite_dict:
+                testmodule_testsuite_dict[testmodule].append(testsuite)
+            else:
+                testmodule_testsuite_dict[testmodule] = [testsuite]
+        return testmodule_testsuite_dict
+
+    def get_testcase_failed_or_error_logs_dictionary(self, log_file, testcase_status_dict):
+        oeqalogparser = OeqaLogParser()
+        testcase_list = testcase_status_dict.keys()
+        testcase_failed_or_error_logs_dict = {}
+        for testcase in testcase_list:
+            test_status = testcase_status_dict[testcase]
+            if test_status == 'FAILED' or test_status == 'ERROR':
+                testsuite = self._get_testsuite_from_testcase(testcase)
+                testfunction = self._remove_testsuite_from_testcase(testcase, testsuite)
+                logs = oeqalogparser.get_test_log(log_file, test_status, testfunction, testsuite)
+                testcase_failed_or_error_logs_dict[testcase] = logs
+        return testcase_failed_or_error_logs_dict
+
+def storeauto(args, logger):
+    logger.info('Gathering test result and log data')
+    oeqa_logparser = OeqaLogParser()
+    testcase_status_dict = oeqa_logparser.get_test_status(args.log_file)
+    logger.debug('Received testcase status dictionary %s' % testcase_status_dict)
+
+    store_auto = StoreAuto()
+    logger.debug('Getting test environment and breaking down test result & log data')
+    environment_list = store_auto.get_environment_list_for_test_log(args.log_file, args.source, args.environment_list, oeqa_logparser)
+    logger.debug('Received environment list %s' % environment_list)
+    testsuite_testcase_dict = store_auto.get_testsuite_testcase_dictionary(args.case_dir)
+    logger.debug('Received testsuite testcase dictionary %s' % testsuite_testcase_dict)
+    testmodule_testsuite_dict = store_auto.get_testmodule_testsuite_dictionary(testsuite_testcase_dict)
+    logger.debug('Received testmodule testsuite dictionary %s' % testmodule_testsuite_dict)
+    test_logs_dict = store_auto.get_testcase_failed_or_error_logs_dictionary(args.log_file, testcase_status_dict)
+    logger.debug('Received test logs dictionary %s' % test_logs_dict)
+
+    git_store = GitStore()
+    logger.info('Storing test result and log data')
+    git_store.smart_create_update_automated_test_result(args.git_repo, args.git_branch, args.top_folder_name, environment_list, testmodule_testsuite_dict,
+                                                       testsuite_testcase_dict, testcase_status_dict, test_logs_dict, logger)
+    return 0
+
+def register_commands(subparsers):
+    """Register subcommands from this plugin"""
+    parser_build = subparsers.add_parser('store-auto', help='Store OEQA automated test status & log into git repository',
+                                         description='Store OEQA automated test status & log into git repository',
+                                         group='store')
+    parser_build.set_defaults(func=storeauto)
+    parser_build.add_argument('top_folder_name', help='Folder name used to create the top folder inside git repository that store the test status & log')
+    parser_build.add_argument('git_branch', help='Git branch to store the test status & log')
+    parser_build.add_argument('log_file', help='Full path to the OEQA automated test log file to be used for test result storing')
+    SOURCES = ('runtime', 'selftest', 'sdk', 'sdkext')
+    parser_build.add_argument('source', choices=SOURCES,
+    help='Selected testcase sources to be used for OEQA testcase discovery and testcases discovered will be used as the base testcases for storing test status & log. '
+         '"runtime" will search testcase available in meta/lib/oeqa/runtime/cases. '
+         '"selftest" will search testcase available in meta/lib/oeqa/selftest/cases. '
+         '"sdk" will search testcase available in meta/lib/oeqa/sdk/cases. '
+         '"sdkext" will search testcase available in meta/lib/oeqa/sdkext/cases. ')
+    parser_build.add_argument('-g', '--git_repo', default='', help='(Optional) Full path to the git repository used for storage, default will be <top_dir>/test-result-log.git')
+    parser_build.add_argument('-e', '--environment_list', default='', help='(Optional) List of environment separated by comma (",") used to create the subfolder(s) under the top_folder_name to store test status & log')
diff --git a/scripts/test-result-log b/scripts/test-result-log
new file mode 100755
index 0000000..5f36fb1
--- /dev/null
+++ b/scripts/test-result-log
@@ -0,0 +1,108 @@
+#!/usr/bin/env python3
+#
+# test case management tool - store test result and log
+#
+# As part of the initiative to provide LITE version Test Case Management System
+# with command-line and plain-text files (eg. manual test case file, test plan
+# file to specify list of test case to be executed, test result and log file)
+# to replace Testopia.
+# Test-result-log script was designed as part of the helper script for below purpose:
+# 1. To store test result & log file inside git repository
+# 2. (Future) To view text-based test summary report
+# 3. (Future) To enable planning of test cases for execution and track its completion
+#
+# To look for help information.
+#    $ test-result-log
+#
+# To store test result for OEQA automated testcase, execute the below
+#    $ test-result-log store-auto <folder-to-store> <git-branch> /
+#      <oeqa-log-file-location> <type-of-oeqa-testcase-executed>
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
+import testresultlog.storeauto
+logger = scriptutils.logger_create('test-result-log')
+
+def _validate_user_input_arguments(args):
+    if hasattr(args, "top_folder_name"):
+        if '/' in args.top_folder_name:
+            logger.error('top_folder_name argument cannot contain / : %s' % args.top_folder_name)
+            return False
+        if '\\' in r"%r" % args.top_folder_name:
+            logger.error('top_folder_name argument cannot contain \\ : %r' % args.top_folder_name)
+            return False
+    return True
+
+def _set_default_arg_value_for_git_dir(args):
+    # check if argument, git_dir, exist in the argparse from the specific subcommand
+    if hasattr(args, "git_repo"):
+        if args.git_repo == '':
+            base_path = script_path + '/..'
+            args.git_repo = os.path.join(base_path, 'test-result-log.git')
+        logger.debug('Set git_dir argument: %s' % args.git_repo)
+
+def _set_default_arg_value_for_case_dir(args):
+    # check if argument, source, exist in the argparse from the specific subcommand
+    if hasattr(args, "source"):
+        oe_dir = script_path + '/..'
+        if args.source == 'runtime':
+            case_dir = os.path.join(oe_dir, 'meta/lib/oeqa/runtime/cases')
+        elif args.source == 'selftest':
+            case_dir = os.path.join(oe_dir, 'meta/lib/oeqa/selftest/cases')
+        elif args.source == 'sdk':
+            case_dir = os.path.join(oe_dir, 'meta/lib/oeqa/sdk/cases')
+        else:
+            case_dir = os.path.join(oe_dir, 'meta/lib/oeqa/sdkext/cases')
+        args.case_dir = case_dir
+        logger.debug('Set case_dir argument: %s' % args.case_dir)
+
+def main():
+    parser = argparse_oe.ArgumentParser(description="OpenEmbedded testcase management tool, to store test result then to view test summary report.",
+                                        add_help=False,
+                                        epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
+    parser.add_argument('-h', '--help', action='help', default=argparse.SUPPRESS,
+                        help='show this help message and exit')
+    parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
+    parser.add_argument('-q', '--quiet', help='Print only errors', action='store_true')
+    subparsers = parser.add_subparsers(dest="subparser_name", title='subcommands', metavar='<subcommand>')
+    subparsers.required = True
+    subparsers.add_subparser_group('store', 'Store test result', 100)
+    testresultlog.storeauto.register_commands(subparsers)
+    args = parser.parse_args()
+    if args.debug:
+        logger.setLevel(logging.DEBUG)
+    elif args.quiet:
+        logger.setLevel(logging.ERROR)
+
+    if not _validate_user_input_arguments(args):
+        return -1
+    _set_default_arg_value_for_git_dir(args)
+    _set_default_arg_value_for_case_dir(args)
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


