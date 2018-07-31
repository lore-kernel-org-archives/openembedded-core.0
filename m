Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7C8745FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 09:38:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jul 2018 02:38:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,426,1526367600"; d="scan'208";a="71983406"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga002.fm.intel.com with ESMTP; 31 Jul 2018 02:38:30 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2018 17:23:01 +0800
Message-Id: <1533028981-88677-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] test-result-log: testcase management tool to store and view test result
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
X-List-Received-Date: Tue, 31 Jul 2018 09:38:31 -0000

These scripts were developed as an alternative testcase management
tool to Testopia. Using these scripts, user can store test result
from OEQA automated testcase execution and view the test report.

These scripts will store test result & log in GIT repository and
show text-based summary report. To use these scripts, first source
oe environment, then run the entry point script to look for help
information.
    $ test-result-log

To store test result for OEQA automated testcase, execute the below
    $ test-result-log store-auto <folder-to-store> <git-branch> /
      <oeqa-log-file-location> <type-of-oeqa-testcase-executed>

To view summary test report, execute the below
    $ test-result-log view <git-branch>

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/testresultlog/gitstore.py              | 387 +++++++++++++++++++++
 scripts/lib/testresultlog/oeqalogparser.py         |  97 ++++++
 scripts/lib/testresultlog/oeqatestdiscover.py      |  65 ++++
 scripts/lib/testresultlog/storeauto.py             | 122 +++++++
 .../template/test_report_full_text.txt             |  33 ++
 .../test_report_include_idle_full_text.txt         |  33 ++
 scripts/lib/testresultlog/view.py                  | 198 +++++++++++
 scripts/test-result-log                            |  84 +++++
 8 files changed, 1019 insertions(+)
 create mode 100644 scripts/lib/testresultlog/gitstore.py
 create mode 100644 scripts/lib/testresultlog/oeqalogparser.py
 create mode 100644 scripts/lib/testresultlog/oeqatestdiscover.py
 create mode 100644 scripts/lib/testresultlog/storeauto.py
 create mode 100644 scripts/lib/testresultlog/template/test_report_full_text.txt
 create mode 100644 scripts/lib/testresultlog/template/test_report_include_idle_full_text.txt
 create mode 100644 scripts/lib/testresultlog/view.py
 create mode 100755 scripts/test-result-log

diff --git a/scripts/lib/testresultlog/gitstore.py b/scripts/lib/testresultlog/gitstore.py
new file mode 100644
index 0000000..67f2749
--- /dev/null
+++ b/scripts/lib/testresultlog/gitstore.py
@@ -0,0 +1,387 @@
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
+    def _create_temporary_workspace_dir(self):
+        return tempfile.mkdtemp(prefix='testresultlog.')
+
+    def _remove_temporary_workspace_dir(self, workspace_dir):
+        return subprocess.run(["rm", "-rf",  workspace_dir])
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
+            #testcase_key = '%s.%s' % (testsuite_name, testcase)
+            testcase_status = self._get_testcase_status(testcase, testcase_status_dict)
+            testcase_dict[testcase] = {"testresult": testcase_status,"bugs": ""}
+        #print('DEBUG: testcase_dict: %s' % testcase_dict)
+        return testcase_dict
+
+    def _create_testsuite_testcase_teststatus_json_object(self, testsuite_list, testsuite_testcase_dict, testcase_status_dict):
+        #print('DEBUG: creating testsuite testcase for testsuite list: %s' % testsuite_list)
+        json_object = {'testsuite':{}}
+        testsuite_dict = json_object['testsuite']
+        for testsuite in sorted(testsuite_list):
+            testsuite_dict[testsuite] = {'testcase': {}}
+            #print('DEBUG: testsuite: %s' % testsuite)
+            #print('DEBUG: testsuite_testcase_dict[testsuite]: %s' % testsuite_testcase_dict[testsuite])
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
+    def _write_test_log_files(self, file_dir, testcase_list, testcase_logs_dict):
+        for testcase in testcase_list:
+            #print('testcase : %s' % testcase)
+            if testcase in testcase_logs_dict:
+                #print('testcase: %s' % testcase)
+                #print('testcase logs: %s' % testcase_logs_dict[testcase])
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
+    def _create_automated_test_result_from_empty_git(self, git_dir, git_branch, project, environment_list, testmodule_testsuite_dict, testsuite_testcase_dict, testcase_status_dict, testcase_logs_dict):
+        workspace_dir = self._create_temporary_workspace_dir()
+        project_dir = os.path.join(workspace_dir, project)
+        project_env_dir = self._get_project_environment_directory_path(project_dir, environment_list)
+        pathlib.Path(project_env_dir).mkdir(parents=True, exist_ok=True)
+        for testmodule in self._get_testmodule_list(testmodule_testsuite_dict):
+            testsuite_list = testmodule_testsuite_dict[testmodule]
+            module_json_structure = self._create_testsuite_json_formatted_string(testsuite_list, testsuite_testcase_dict, testcase_status_dict)
+            file_name = '%s.json' % testmodule
+            file_path = os.path.join(project_env_dir, file_name)
+            self._write_testsuite_testcase_json_formatted_string_to_file(file_path, module_json_structure)
+            testcase_list = self._get_testcase_list(testsuite_list, testsuite_testcase_dict)
+            self._write_test_log_files(project_env_dir, testcase_list, testcase_logs_dict)
+        self._push_testsuite_testcase_json_file_to_git_repo(workspace_dir, git_dir, git_branch)
+        self._remove_temporary_workspace_dir(workspace_dir)
+
+    def _create_automated_test_result_from_existing_git(self, git_dir, git_branch, project, environment_list, testmodule_testsuite_dict, testsuite_testcase_dict, testcase_status_dict, testcase_logs_dict):
+        project_dir = os.path.join(git_dir, project)
+        project_env_dir = self._get_project_environment_directory_path(project_dir, environment_list)
+        pathlib.Path(project_env_dir).mkdir(parents=True, exist_ok=True)
+        for testmodule in self._get_testmodule_list(testmodule_testsuite_dict):
+            testsuite_list = testmodule_testsuite_dict[testmodule]
+            module_json_formatted_string = self._create_testsuite_json_formatted_string(testsuite_list, testsuite_testcase_dict, testcase_status_dict)
+            file_name = '%s.json' % testmodule
+            file_path = os.path.join(project_env_dir, file_name)
+            self._write_testsuite_testcase_json_formatted_string_to_file(file_path, module_json_formatted_string)
+            testcase_list = self._get_testcase_list(testsuite_list, testsuite_testcase_dict)
+            self._write_test_log_files(project_env_dir, testcase_list, testcase_logs_dict)
+        self._push_testsuite_testcase_json_file_to_git_repo(git_dir, git_dir, git_branch)
+
+    def _create_manual_test_result_from_empty_git(self, git_dir, git_branch, project, environment_list, manual_test_report_dir):
+        workspace_dir = self._create_temporary_workspace_dir()
+        project_dir = os.path.join(workspace_dir, project)
+        project_env_dir = self._get_project_environment_directory_path(project_dir, environment_list)
+        pathlib.Path(project_env_dir).mkdir(parents=True, exist_ok=True)
+        # cp files from manual_test_report_dir to project_env_dir
+        # Not yet implement
+        self._copy_files_from_source_to_destination_dir(manual_test_report_dir, project_env_dir)
+        self._push_testsuite_testcase_json_file_to_git_repo(workspace_dir, git_dir, git_branch)
+        self._remove_temporary_workspace_dir(workspace_dir)
+
+    def _create_manual_test_result_from_exiting_git(self, git_dir, git_branch, project, environment_list, manual_test_report_dir):
+        project_dir = os.path.join(git_dir, project)
+        project_env_dir = self._get_project_environment_directory_path(project_dir, environment_list)
+        if not self._check_if_git_dir_contain_project_and_environment_directory(git_dir, project, environment_list):
+            pathlib.Path(project_env_dir).mkdir(parents=True, exist_ok=True)
+        # cp files from manual_test_report_dir to existing project_env_dir
+        # Not yet implement
+        self._copy_files_from_source_to_destination_dir(manual_test_report_dir, project_env_dir)
+        self._push_testsuite_testcase_json_file_to_git_repo(git_dir, git_dir, git_branch)
+
+    def _load_test_module_file_with_json_into_dictionary(self, file):
+        if os.path.exists(file):
+            with open(file, "r") as f:
+                return json.load(f)
+        else:
+            print('Cannot find file (%s)' % file)
+            return None
+
+    def _get_testcase_log_need_removal_list(self, testcase, cur_testcase_status, next_testcase_status, testcase_log_remove_list):
+        if cur_testcase_status == 'FAILED' or cur_testcase_status == 'ERROR':
+            if next_testcase_status == 'PASSED' or next_testcase_status == 'SKIPPED':
+                testcase_log_remove_list.append(testcase)
+
+    def _update_target_testresult_dictionary_with_status(self, target_testresult_dict, testsuite_list, testsuite_testcase_dict, testcase_status_dict, testcase_log_remove_list):
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
+    def _check_if_git_dir_contain_project_and_environment_directory(self, git_dir, project, environment_list):
+        project_dir = os.path.join(git_dir, project)
+        project_env_dir = self._get_project_environment_directory_path(project_dir, environment_list)
+        completed_process = subprocess.run(["ls", project_env_dir])
+        if completed_process.returncode == 0:
+            return True
+        else:
+            return False
+
+    def _git_check_if_git_dir_and_git_branch_exist(self, git_dir, git_branch):
+        completed_process = subprocess.run(["ls", '%s/.git' % git_dir])
+        if not completed_process.returncode == 0:
+            return False
+        repo = self._git_init(git_dir)
+        try:
+            repo.run_cmd('checkout %s' % git_branch)
+            return True
+        except GitError:
+            return False
+
+    def _git_init(self, git_dir):
+        try:
+            repo = GitRepo(git_dir, is_topdir=True)
+        except GitError:
+            print("Non-empty directory that is not a Git repository "
+                   "at {}\nPlease specify an existing Git repository, "
+                   "an empty directory or a non-existing directory "
+                   "path.".format(git_dir))
+        return repo
+
+    def _git_checkout_git_repo(self, repo, git_branch):
+        repo.run_cmd('checkout %s' % git_branch)
+
+    def _git_checkout_git_repo(self, repo, git_branch):
+        repo.run_cmd('checkout %s' % git_branch)
+
+    def _git_check_if_local_repo_contain_remote_origin(self, repo):
+        try:
+            repo.run_cmd('remote get-url origin')
+            return True
+        except GitError:
+            return False
+
+    def _git_check_if_local_repo_remote_origin_url_match(self, repo, git_remote):
+        try:
+            origin_url = repo.run_cmd('remote get-url origin')
+            if origin_url == git_remote:
+                return True
+            else:
+                return False
+        except GitError:
+            return False
+
+    def _git_fetch_remote_origin(self, repo):
+        print('Fetching remote origin to local repo')
+        try:
+            repo.run_cmd('fetch origin')
+            return True
+        except GitError:
+            return False
+
+    def _git_check_if_remote_origin_has_branch(self, repo, git_branch):
+        try:
+            output = repo.run_cmd('show-branch remotes/origin/%s' % git_branch)
+            print(output)
+            return True
+        except GitError:
+            return False
+
+    def _git_add_local_repo_remote_origin(self, repo, git_remote):
+        print('Adding remote origin to local repo')
+        try:
+            repo.run_cmd('remote add origin %s' % git_remote)
+        except GitError:
+            print("The remote add origin failed inside the Git repository")
+
+    def _git_remove_local_repo_remote_origin(self, repo):
+        print('Removing outdated remote origin from local repo')
+        try:
+            repo.run_cmd('remote remove origin')
+        except GitError:
+            print("The remote remove origin failed inside the Git repository")
+
+    def _git_fetch_remote_origin_branch(self, repo, git_branch):
+        print('Fetch remote origin %s' % git_branch)
+        try:
+            repo.run_cmd('fetch origin %s' % git_branch)
+        except GitError:
+            print("The fetch origin % failed inside the Git repository" % git_branch)
+
+    def _git_rebase_remote_origin(self, repo, git_branch):
+        print('Rebasing origin/%s' % git_branch)
+        try:
+            repo.run_cmd('rebase origin/%s' % git_branch)
+        except GitError:
+            print("The rebase origin/% failed inside the Git repository" % git_branch)
+
+    def _git_push_local_branch_to_remote_origin(self, repo, git_branch):
+        print('Pushing origin %s' % git_branch)
+        try:
+            repo.run_cmd('push origin %s' % git_branch)
+        except GitError:
+            print("The push origin % failed inside the Git repository" % git_branch)
+
+    def _push_testsuite_testcase_json_file_to_git_repo(self, file_dir, git_repo, git_branch):
+        return subprocess.run(["oe-git-archive", file_dir, "-g", git_repo, "-b", git_branch])
+
+    def create_automated_test_result(self, git_dir, git_branch, project, environment_list, testmodule_testsuite_dict, testsuite_testcase_dict, force_create):
+        print('Creating test result for environment list: %s' % environment_list)
+        if self._git_check_if_git_dir_and_git_branch_exist(git_dir, git_branch):
+            repo = self._git_init(git_dir)
+            self._git_checkout_git_repo(repo, git_branch)
+            print('Found git_dir and git_branch: %s %s' % (git_dir, git_branch))
+            print('Entering git_dir: %s' % git_dir)
+            if self._check_if_git_dir_contain_project_and_environment_directory(git_dir, project, environment_list):
+                print('Found project and environment inside git_dir: %s' % git_dir)
+                print('Since project and environment already exist, could not proceed to create.')
+                if force_create:
+                    print('Force create activated: proceed to create.')
+                    self._create_automated_test_result_from_existing_git(git_dir, git_branch, project, environment_list, testmodule_testsuite_dict, testsuite_testcase_dict, {}, {})
+            else:
+                print('Could not find project and environment inside git_dir: %s' % git_dir)
+                print('Creating project and environment inside git_dir: %s' % git_dir)
+                self._create_automated_test_result_from_existing_git(git_dir, git_branch, project, environment_list, testmodule_testsuite_dict, testsuite_testcase_dict, {}, {})
+        else:
+            print('Could not find git_dir or git_branch: %s %s' % (git_dir, git_branch))
+            print('Creating git_dir, git_branch, project, and environment: %s' % git_dir)
+            self._create_automated_test_result_from_empty_git(git_dir, git_branch, project, environment_list, testmodule_testsuite_dict, testsuite_testcase_dict, {}, {})
+
+    def update_automated_test_result(self, git_dir, git_branch, project, environment_list, testmodule_testsuite_dict, testsuite_testcase_dict, testcase_status_dict, testcase_logs_dict):
+        print('Updating test result for environment list: %s' % environment_list)
+        repo = self._git_init(git_dir)
+        self._git_checkout_git_repo(repo, git_branch)
+        project_dir = os.path.join(git_dir, project)
+        project_env_dir = self._get_project_environment_directory_path(project_dir, environment_list)
+        testcase_log_remove_list = []
+        for testmodule in self._get_testmodule_list(testmodule_testsuite_dict):
+            testmodule_file = os.path.join(project_env_dir, '%s.json' % testmodule)
+            target_testresult_dict = self._load_test_module_file_with_json_into_dictionary(testmodule_file)
+            testsuite_list = testmodule_testsuite_dict[testmodule]
+            self._update_target_testresult_dictionary_with_status(target_testresult_dict, testsuite_list, testsuite_testcase_dict, testcase_status_dict, testcase_log_remove_list)
+            self._write_testsuite_testcase_json_formatted_string_to_file(testmodule_file, json.dumps(target_testresult_dict, sort_keys=True, indent=4))
+            testcase_list = self._get_testcase_list(testsuite_list, testsuite_testcase_dict)
+            self._write_test_log_files(project_env_dir, testcase_list, testcase_logs_dict)
+        self._remove_test_log_files(project_env_dir, testcase_log_remove_list)
+        self._push_testsuite_testcase_json_file_to_git_repo(git_dir, git_dir, git_branch)
+
+    def smart_update_automated_test_result(self, git_dir, git_branch, project, environment_list, testmodule_testsuite_dict, testsuite_testcase_dict, testcase_status_dict, testcase_logs_dict):
+        print('Creating/Updating test result for environment list: %s' % environment_list)
+        if self._git_check_if_git_dir_and_git_branch_exist(git_dir, git_branch):
+            repo = self._git_init(git_dir)
+            self._git_checkout_git_repo(repo, git_branch)
+            print('Found git_dir and git_branch: %s %s' % (git_dir, git_branch))
+            print('Entering git_dir: %s' % git_dir)
+            if self._check_if_git_dir_contain_project_and_environment_directory(git_dir, project, environment_list):
+                print('Found project and environment inside git_dir: %s' % git_dir)
+                print('Updating test result')
+                self.update_automated_test_result(git_dir, git_branch, project, environment_list, testmodule_testsuite_dict, testsuite_testcase_dict, testcase_status_dict, testcase_logs_dict)
+            else:
+                print('Could not find project and environment inside git_dir: %s' % git_dir)
+                print('Creating project and environment inside git_dir: %s' % git_dir)
+                self._create_automated_test_result_from_existing_git(git_dir, git_branch, project, environment_list, testmodule_testsuite_dict, testsuite_testcase_dict, testcase_status_dict, testcase_logs_dict)
+        else:
+            print('Could not find git_dir or git_branch: %s %s' % (git_dir, git_branch))
+            print('Creating git_dir, git_branch, project, and environment: %s' % git_dir)
+            self._create_automated_test_result_from_empty_git(git_dir, git_branch, project, environment_list, testmodule_testsuite_dict, testsuite_testcase_dict, testcase_status_dict, testcase_logs_dict)
+
+    def create_manual_test_result(self, git_dir, git_branch, project, environment_list, manual_test_report_dir):
+        print('Creating test result for environment list: %s' % environment_list)
+        if self._git_check_if_git_dir_and_git_branch_exist(git_dir, git_branch):
+            repo = self._git_init(git_dir)
+            self._git_checkout_git_repo(repo, git_branch)
+            print('Found git_dir and git_branch: %s %s' % (git_dir, git_branch))
+            print('Entering git_dir: %s' % git_dir)
+            if self._check_if_git_dir_contain_project_and_environment_directory(git_dir, project, environment_list):
+                print('Found project and environment inside git_dir: %s' % git_dir)
+                print('Since project and environment already exist, could not proceed to create.')
+            else:
+                print('Could not find project and environment inside git_dir: %s' % git_dir)
+                print('Creating project and environment inside git_dir: %s' % git_dir)
+                self._create_manual_test_result_from_exiting_git(git_dir, git_branch, project, environment_list, manual_test_report_dir)
+        else:
+            print('Could not find git_dir or git_branch: %s %s' % (git_dir, git_branch))
+            print('Creating git_dir, git_branch, project, and environment: %s' % git_dir)
+            self._create_manual_test_result_from_empty_git(git_dir, git_branch, project, environment_list, manual_test_report_dir)
+
+    def git_remote_fetch_rebase_push(self, git_dir, git_branch, git_remote):
+        print('Pushing test result to remote git ...')
+        repo = self._git_init(git_dir)
+        print('Fetching, Rebasing, Pushing to remote')
+        if self._git_check_if_local_repo_contain_remote_origin(repo):
+            if not self._git_check_if_local_repo_remote_origin_url_match(repo, git_remote):
+                self._git_remove_local_repo_remote_origin(repo)
+                self._git_add_local_repo_remote_origin(repo, git_remote)
+        else:
+            self._git_add_local_repo_remote_origin(repo, git_remote)
+        if self._git_fetch_remote_origin(repo):
+            if self._git_check_if_remote_origin_has_branch(repo, git_branch):
+                self._git_fetch_remote_origin_branch(repo, git_branch)
+                self._git_rebase_remote_origin(repo, git_branch)
+            self._git_push_local_branch_to_remote_origin(repo, git_branch)
+        else:
+            print('Git fetch origin failed. Stop proceeding to git push.')
+
+    def checkout_git_branch(self, git_dir, git_branch):
+        print('Checkout git branch ...')
+        if self._git_check_if_git_dir_and_git_branch_exist(git_dir, git_branch):
+            repo = self._git_init(git_dir)
+            self._git_checkout_git_repo(repo, git_branch)
+            return True
+        else:
+            print('Could not find git_dir or git_branch: %s %s' % (git_dir, git_branch))
+            return False
diff --git a/scripts/lib/testresultlog/oeqalogparser.py b/scripts/lib/testresultlog/oeqalogparser.py
new file mode 100644
index 0000000..0afba18
--- /dev/null
+++ b/scripts/lib/testresultlog/oeqalogparser.py
@@ -0,0 +1,97 @@
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
+    def get_failed_tests(self, log_file):
+        regex = ".*RESULTS - (?P<case_name>.*) - Testcase (?P<case_id>\d+): (?P<status>FAILED)$"
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
+
diff --git a/scripts/lib/testresultlog/oeqatestdiscover.py b/scripts/lib/testresultlog/oeqatestdiscover.py
new file mode 100644
index 0000000..b1b6cca
--- /dev/null
+++ b/scripts/lib/testresultlog/oeqatestdiscover.py
@@ -0,0 +1,65 @@
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
+    def _get_testcase_remove_pattern_list(self, testcase_remove_source_file):
+        testcase_remove_pattern_list = []
+        with open(testcase_remove_source_file, "r") as f:
+            for line in f:
+                line = line.strip()
+                if not line.find('#') == 0:
+                    testcase_remove_pattern_list.append(line)
+        return testcase_remove_pattern_list
+
+    def _remove_test_case_from_removal_pattern_list(self, testcase_list, testcase_remove_pattern_list):
+        print('testcase remove pattern list: %s' % testcase_remove_pattern_list)
+        testcase_remove_list = []
+        for testcase_remove_pattern in testcase_remove_pattern_list:
+            for testcase in testcase_list:
+                #print('Find testcase (%s) for %s' % (testcase, testcase_remove_pattern))
+                if testcase.find(testcase_remove_pattern) == 0:
+                    testcase_remove_list.append(testcase)
+        print('testcase remove list: %s' % testcase_remove_list)
+        for testcase_remove in testcase_remove_list:
+            print('testcase_remove: %s' % testcase_remove)
+            if testcase_remove in testcase_list:
+                testcase_list.remove(testcase_remove)
+
+    def get_oeqa_testcase_list(self, testcase_dir, testcase_remove_file):
+        unittest_testsuite_testcase = self._discover_unittest_testsuite_testcase(testcase_dir)
+        unittest_testcase_list = self._generate_flat_list_of_unittest_testcase(unittest_testsuite_testcase)
+        testcase_list = self._get_testcase_list(unittest_testcase_list)
+        if len(testcase_remove_file) > 0:
+            testcase_remove_pattern_list = self._get_testcase_remove_pattern_list(testcase_remove_file)
+            self._remove_test_case_from_removal_pattern_list(testcase_list, testcase_remove_pattern_list)
+        return testcase_list
+
diff --git a/scripts/lib/testresultlog/storeauto.py b/scripts/lib/testresultlog/storeauto.py
new file mode 100644
index 0000000..58622ed
--- /dev/null
+++ b/scripts/lib/testresultlog/storeauto.py
@@ -0,0 +1,122 @@
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
+    def _get_testsuite_from_testcase(self, testcase):
+        testsuite = testcase[0:testcase.rfind(".")]
+        return testsuite
+
+    def _get_testmodule_from_testsuite(self, testsuite):
+        testmodule = testsuite[0:testsuite.find(".")]
+        return testmodule
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
+        print('Getting test environment information from test log at %s' % log_file)
+        if log_file_source == 'runtime':
+            runtime_image_env = oeqa_logparser.get_runtime_test_image_environment(log_file)
+            print('runtime image environment: %s' % runtime_image_env)
+            runtime_qemu_env = oeqa_logparser.get_runtime_test_qemu_environment(log_file)
+            print('runtime qemu environment: %s' % runtime_qemu_env)
+            environment_list = self._add_new_environment_to_environment_list(environment_list, runtime_image_env)
+            environment_list = self._add_new_environment_to_environment_list(environment_list, runtime_qemu_env)
+        return environment_list.split(",")
+
+    def get_testsuite_testcase_dictionary(self, testcase_dir, testcase_remove_file):
+        print('Getting testsuite testcase information from oeqa directory at %s' % testcase_dir)
+        oeqatestdiscover = OeqaTestDiscover()
+        testcase_list = oeqatestdiscover.get_oeqa_testcase_list(testcase_dir, testcase_remove_file)
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
+        print('Getting testmodule testsuite information')
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
+        print('Getting testcase failed or error log from %s' % log_file)
+        testresultlogparser = OeqaLogParser()
+        testcase_list = testcase_status_dict.keys()
+        testcase_failed_or_error_logs_dict = {}
+        for testcase in testcase_list:
+            test_status = testcase_status_dict[testcase]
+            if test_status == 'FAILED' or test_status == 'ERROR':
+                testsuite = self._get_testsuite_from_testcase(testcase)
+                testfunction = self._remove_testsuite_from_testcase(testcase, testsuite)
+                logs = testresultlogparser.get_test_log(log_file, test_status, testfunction, testsuite)
+                testcase_failed_or_error_logs_dict[testcase] = logs
+        return testcase_failed_or_error_logs_dict
+
+def main(args):
+    oeqa_logparser = OeqaLogParser()
+    testcase_status_dict = oeqa_logparser.get_test_status(args.log_file)
+
+    store_auto = StoreAuto()
+    environment_list = store_auto.get_environment_list_for_test_log(args.log_file, args.source, args.environment_list, oeqa_logparser)
+    testsuite_testcase_dict = store_auto.get_testsuite_testcase_dictionary(args.case_dir, args.testcase_remove_file)
+    testmodule_testsuite_dict = store_auto.get_testmodule_testsuite_dictionary(testsuite_testcase_dict)
+    test_logs_dict = store_auto.get_testcase_failed_or_error_logs_dictionary(args.log_file, testcase_status_dict)
+
+    gitstore = GitStore()
+    gitstore.smart_update_automated_test_result(args.git_repo, args.git_branch, args.component, environment_list, testmodule_testsuite_dict, testsuite_testcase_dict, testcase_status_dict, test_logs_dict)
+    if (len(args.git_remote) > 0):
+        gitstore.git_remote_fetch_rebase_push(args.git_repo, args.git_branch, args.git_remote)
+    return 0
+
+def register_commands(subparsers):
+    """Register subcommands from this plugin"""
+    parser_build = subparsers.add_parser('store-auto', help='Store OEQA automated test status & log into git repository',
+                                         description='Store OEQA automated test status & log into git repository',
+                                         group='store')
+    parser_build.set_defaults(func=main)
+    parser_build.add_argument('component', help='Component folder (as the top folder) to store the test status & log')
+    parser_build.add_argument('git_branch', help='Git branch to store the test status & log')
+    parser_build.add_argument('log_file', help='Full path to the OEQA automated test log file to be used for test result storing')
+    SOURCE = ('runtime', 'selftest', 'sdk', 'sdkext')
+    parser_build.add_argument('source', choices=SOURCE,
+    help='Selected testcase sources to be used for OEQA testcase discovery and testcases discovered will be used as the base testcases for storing test status & log. '
+         '"runtime" will search testcase available in meta/lib/oeqa/runtime/cases. '
+         '"selftest" will search testcase available in meta/lib/oeqa/selftest/cases. '
+         '"sdk" will search testcase available in meta/lib/oeqa/sdk/cases. '
+         '"sdkext" will search testcase available in meta/lib/oeqa/sdkext/cases. ')
+    parser_build.add_argument('-g', '--git_repo', default='default', help='(Optional) Full path to the git repository used for storage, default will be <top_dir>/test-result-log.git')
+    parser_build.add_argument('-e', '--environment_list', default='default', help='(Optional) List of environment seperated by comma (",") used to label the test environments for the stored test status & log')
+    parser_build.add_argument('-r', '--git_remote', default='default', help='(Optional) Git remote repository used for storage')
+    parser_build.add_argument('-o', '--oe_dir', default='default', help='(Optional) OE top directory to be used for OEQA testcase discovery, default will use current <top_dir> directory')
+    parser_build.add_argument('-m', '--testcase_remove_file', default='default', help='(Optional) Full path to the file (created during test planning) used to define list of testcases to be excluded from storage')
diff --git a/scripts/lib/testresultlog/template/test_report_full_text.txt b/scripts/lib/testresultlog/template/test_report_full_text.txt
new file mode 100644
index 0000000..78c49ea
--- /dev/null
+++ b/scripts/lib/testresultlog/template/test_report_full_text.txt
@@ -0,0 +1,33 @@
+==============================================================================================================
+Test Report (Count of passed, failed, skipped group by test_component, test_environment)
+==============================================================================================================
+--------------------------------------------------------------------------------------------------------------
+{{ 'test_component'.ljust(max_len_component) }} | {{ 'test_environment'.ljust(max_len_environment) }} | {{ 'passed'.ljust(10) }} | {{ 'failed'.ljust(10) }} | {{ 'skipped'.ljust(10) }}
+--------------------------------------------------------------------------------------------------------------
+{% for report in test_reports |sort(attribute='test_component_environment') %}
+{{ report.test_component.ljust(max_len_component) }} | {{ report.test_environment.ljust(max_len_environment) }} | {{ report.passed.ljust(10) }} | {{ report.failed.ljust(10) }} | {{ report.skipped.ljust(10) }}
+{% endfor %}
+--------------------------------------------------------------------------------------------------------------
+
+==============================================================================================================
+Test Report (Percent of passed, failed, skipped group by test_component, test_environment)
+==============================================================================================================
+--------------------------------------------------------------------------------------------------------------
+{{ 'test_component'.ljust(max_len_component) }} | {{ 'test_environment'.ljust(max_len_environment) }} | {{ 'passed_%'.ljust(10) }} | {{ 'failed_%'.ljust(10) }} | {{ 'skipped_%'.ljust(10) }}
+--------------------------------------------------------------------------------------------------------------
+{% for report in test_reports |sort(attribute='test_component_environment') %}
+{{ report.test_component.ljust(max_len_component) }} | {{ report.test_environment.ljust(max_len_environment) }} | {{ report.passed_percent.ljust(10) }} | {{ report.failed_percent.ljust(10) }} | {{ report.skipped_percent.ljust(10) }}
+{% endfor %}
+--------------------------------------------------------------------------------------------------------------
+
+==============================================================================================================
+Test Report (Failed test cases group by test_component, test_environment)
+==============================================================================================================
+--------------------------------------------------------------------------------------------------------------
+{% for report in test_reports |sort(attribute='test_component_environment') %}
+test_component | test_environment : {{ report.test_component }} | {{ report.test_environment }}
+{% for testcase in report.failed_testcases %}
+    {{ testcase }}
+{% endfor %}
+{% endfor %}
+--------------------------------------------------------------------------------------------------------------
\ No newline at end of file
diff --git a/scripts/lib/testresultlog/template/test_report_include_idle_full_text.txt b/scripts/lib/testresultlog/template/test_report_include_idle_full_text.txt
new file mode 100644
index 0000000..0328973
--- /dev/null
+++ b/scripts/lib/testresultlog/template/test_report_include_idle_full_text.txt
@@ -0,0 +1,33 @@
+==============================================================================================================
+Test Report (Count of complete (passed, failed, skipped) vs idle group by test_component, test_environment)
+==============================================================================================================
+--------------------------------------------------------------------------------------------------------------
+{{ 'test_component'.ljust(max_len_component) }} | {{ 'test_environment'.ljust(max_len_environment) }} | {{ 'complete'.ljust(10) }} | {{ 'passed'.ljust(10) }} | {{ 'failed'.ljust(10) }} | {{ 'skipped'.ljust(10) }} | {{ 'idle'.ljust(10) }}
+--------------------------------------------------------------------------------------------------------------
+{% for report in test_reports |sort(attribute='test_component_environment') %}
+{{ report.test_component.ljust(max_len_component) }} | {{ report.test_environment.ljust(max_len_environment) }} | {{ report.complete.ljust(10) }} | {{ report.passed.ljust(10) }} | {{ report.failed.ljust(10) }} | {{ report.skipped.ljust(10) }} | {{ report.idle.ljust(10) }}
+{% endfor %}
+--------------------------------------------------------------------------------------------------------------
+
+==============================================================================================================
+Test Report (Percent of complete (passed, failed, skipped) vs idle group by test_component, test_environment)
+==============================================================================================================
+--------------------------------------------------------------------------------------------------------------
+{{ 'test_component'.ljust(max_len_component) }} | {{ 'test_environment'.ljust(max_len_environment) }} | {{ 'complete_%'.ljust(10) }} | {{ 'passed_%'.ljust(10) }} | {{ 'failed_%'.ljust(10) }} | {{ 'skipped_%'.ljust(10) }} | {{ 'idle_%'.ljust(10) }}
+--------------------------------------------------------------------------------------------------------------
+{% for report in test_reports |sort(attribute='test_component_environment') %}
+{{ report.test_component.ljust(max_len_component) }} | {{ report.test_environment.ljust(max_len_environment) }} | {{ report.complete_percent.ljust(10) }} | {{ report.passed_percent.ljust(10) }} | {{ report.failed_percent.ljust(10) }} | {{ report.skipped_percent.ljust(10) }} | {{ report.idle_percent.ljust(10) }}
+{% endfor %}
+--------------------------------------------------------------------------------------------------------------
+
+==============================================================================================================
+Test Report (Failed test cases group by test_component, test_environment)
+==============================================================================================================
+--------------------------------------------------------------------------------------------------------------
+{% for report in test_reports |sort(attribute='test_component_environment') %}
+test_component | test_environment : {{ report.test_component }} | {{ report.test_environment }}
+{% for testcase in report.failed_testcases %}
+    {{ testcase }}
+{% endfor %}
+{% endfor %}
+--------------------------------------------------------------------------------------------------------------
\ No newline at end of file
diff --git a/scripts/lib/testresultlog/view.py b/scripts/lib/testresultlog/view.py
new file mode 100644
index 0000000..9edd3ec
--- /dev/null
+++ b/scripts/lib/testresultlog/view.py
@@ -0,0 +1,198 @@
+import glob
+import os
+import json
+from jinja2 import Environment, FileSystemLoader
+from testresultlog.gitstore import GitStore
+
+class TestResultView(object):
+
+    def _check_if_existing_dir_list_contain_parent_for_new_dir(self, dir_list, new_dir):
+        for existing_dir in dir_list:
+            if existing_dir in new_dir:
+                return True
+        return False
+
+    def _replace_existing_parent_dir_with_new_dir(self, dir_list, new_dir):
+        return [new_dir if dir in new_dir else dir for dir in dir_list]
+
+    def _get_test_report_directory_list(self, git_dir):
+        exclude = ['.git']
+        report_dir_list = []
+        for root, dirs, files in os.walk(git_dir, topdown=True):
+            for dir in dirs:
+                [dirs.remove(d) for d in list(dirs) if d in exclude]
+
+            for dir in dirs:
+                dirname = os.path.join(root, dir)
+                if self._check_if_existing_dir_list_contain_parent_for_new_dir(report_dir_list, dirname):
+                    report_dir_list = self._replace_existing_parent_dir_with_new_dir(report_dir_list, dirname)
+                else:
+                    report_dir_list.append(dirname)
+        return report_dir_list
+
+    def _get_list_of_test_result_files(self, report_dir):
+        path_pattern = os.path.join(report_dir, '*.json')
+        return glob.glob(path_pattern)
+
+    def _load_test_module_file_with_json_into_dictionary(self, file):
+        with open(file, "r") as f:
+            return json.load(f)
+
+    def _get_test_result_and_failed_error_testcase(self, test_result_dict, show_idle):
+        count_idle = 0
+        count_passed = 0
+        count_failed = 0
+        count_skipped = 0
+        test_suites_dict = test_result_dict['testsuite']
+        test_suites_list = test_suites_dict.keys()
+        for suite in test_suites_list:
+            test_cases_dict = test_suites_dict[suite]['testcase']
+            test_cases_list = test_cases_dict.keys()
+            failed_error_test_case_list = []
+            for test_case in test_cases_list:
+                test_status = test_cases_dict[test_case]['testresult']
+                if test_status == 'FAILED' or test_status == 'ERROR':
+                    failed_error_test_case_list.append(test_case)
+                    count_failed += 1
+                elif test_status == 'PASSED':
+                    count_passed += 1
+                elif test_status == 'SKIPPED':
+                    count_skipped += 1
+                elif test_status == "":
+                    count_idle += 1
+        if show_idle:
+            return count_idle, count_passed, count_failed, count_skipped, failed_error_test_case_list
+        else:
+            return count_passed, count_failed, count_skipped, failed_error_test_case_list
+
+    def _compute_test_result_percent_indicator(self, test_result):
+        total_tested = test_result['passed'] + test_result['failed'] + test_result['skipped']
+        test_result['passed_percent'] = 0
+        test_result['failed_percent'] = 0
+        test_result['skipped_percent'] = 0
+        if total_tested > 0:
+            test_result['passed_percent'] = format(test_result['passed']/total_tested * 100, '.2f')
+            test_result['failed_percent'] = format(test_result['failed']/total_tested * 100, '.2f')
+            test_result['skipped_percent'] = format(test_result['skipped']/total_tested * 100, '.2f')
+
+    def _compute_test_result_include_idle_percent_indicator(self, test_result):
+        total_tested = test_result['idle'] + test_result['passed'] + test_result['failed'] + test_result['skipped']
+        test_result['complete_percent'] = 0
+        test_result['idle_percent'] = 0
+        test_result['passed_percent'] = 0
+        test_result['failed_percent'] = 0
+        test_result['skipped_percent'] = 0
+        if total_tested > 0:
+            test_result['complete_percent'] = format(test_result['complete']/total_tested * 100, '.2f')
+            test_result['idle_percent'] = format(test_result['idle']/total_tested * 100, '.2f')
+            test_result['passed_percent'] = format(test_result['passed']/total_tested * 100, '.2f')
+            test_result['failed_percent'] = format(test_result['failed']/total_tested * 100, '.2f')
+            test_result['skipped_percent'] = format(test_result['skipped']/total_tested * 100, '.2f')
+
+    def _convert_test_result_value_to_string(self, test_result):
+        test_result['passed_percent'] = str(test_result['passed_percent'])
+        test_result['failed_percent'] = str(test_result['failed_percent'])
+        test_result['skipped_percent'] = str(test_result['skipped_percent'])
+        test_result['passed'] = str(test_result['passed'])
+        test_result['failed'] = str(test_result['failed'])
+        test_result['skipped'] = str(test_result['skipped'])
+        if 'idle' in test_result:
+            test_result['idle'] = str(test_result['idle'])
+        if 'idle_percent' in test_result:
+            test_result['idle_percent'] = str(test_result['idle_percent'])
+        if 'complete' in test_result:
+            test_result['complete'] = str(test_result['complete'])
+        if 'complete_percent' in test_result:
+            test_result['complete_percent'] = str(test_result['complete_percent'])
+
+    def _get_max_string_len_from_test_result_list(self, test_result_list, key, default_max_len):
+        max_len = default_max_len
+        for test_result in test_result_list:
+            value_len = len(test_result[key])
+            if value_len > max_len:
+                max_len = value_len
+        return max_len
+
+    def _compile_test_result_for_test_report_directory(self, report_dir):
+        test_result_files = self._get_list_of_test_result_files(report_dir)
+        test_result = {'passed':0, 'failed':0, 'skipped':0, 'failed_testcases':[]}
+        for file in test_result_files:
+            test_result_dict = self._load_test_module_file_with_json_into_dictionary(file)
+            count_passed, count_failed, count_skipped, failed_error_test_case_list = self._get_test_result_and_failed_error_testcase(test_result_dict, False)
+            test_result['passed'] += count_passed
+            test_result['failed'] += count_failed
+            test_result['skipped'] += count_skipped
+            test_result['failed_testcases'] += failed_error_test_case_list
+        self._compute_test_result_percent_indicator(test_result)
+        self._convert_test_result_value_to_string(test_result)
+        return test_result
+
+    def _compile_test_result_include_idle_for_test_report_directory(self, report_dir):
+        test_result_files = self._get_list_of_test_result_files(report_dir)
+        test_result = {'complete':0, 'idle':0, 'passed':0, 'failed':0, 'skipped':0, 'failed_testcases':[]}
+        for file in test_result_files:
+            test_result_dict = self._load_test_module_file_with_json_into_dictionary(file)
+            count_idle, count_passed, count_failed, count_skipped, failed_error_test_case_list = self._get_test_result_and_failed_error_testcase(test_result_dict, True)
+            count_complete = count_passed + count_failed + count_skipped
+            test_result['complete'] += count_complete
+            test_result['idle'] += count_idle
+            test_result['passed'] += count_passed
+            test_result['failed'] += count_failed
+            test_result['skipped'] += count_skipped
+            test_result['failed_testcases'] += failed_error_test_case_list
+        self._compute_test_result_include_idle_percent_indicator(test_result)
+        self._convert_test_result_value_to_string(test_result)
+        return test_result
+
+    def _get_test_component_environment_from_test_report_dir(self, git_repo, report_dir):
+        test_component_environment = report_dir.replace(git_repo + '/', '')
+        test_component = test_component_environment[:test_component_environment.find("/")]
+        test_environment = test_component_environment.replace(test_component + '/', '')
+        return test_component, test_environment, test_component_environment
+
+    def _rendering_text_based_test_report(self, template_file_name, test_result_list, max_len_component, max_len_environment):
+        script_path = os.path.dirname(os.path.realpath(__file__))
+        file_loader = FileSystemLoader(script_path + '/template')
+        env = Environment(loader=file_loader, trim_blocks=True)
+        #template = env.get_template('test_report_full_text.txt')
+        template = env.get_template(template_file_name)
+        output = template.render(test_reports=test_result_list, max_len_component=max_len_component, max_len_environment=max_len_environment)
+        print('Printing text-based test report:')
+        print(output)
+
+    def create_text_based_test_report(self, git_repo, show_completion):
+        report_dir_list = self._get_test_report_directory_list(git_repo)
+        test_result_list = []
+        for report_dir in report_dir_list:
+            print('Compiling test result for %s:' % report_dir)
+            if show_completion:
+                template_file_name = 'test_report_include_idle_full_text.txt'
+                test_result = self._compile_test_result_include_idle_for_test_report_directory(report_dir)
+            else:
+                template_file_name = 'test_report_full_text.txt'
+                test_result = self._compile_test_result_for_test_report_directory(report_dir)
+            test_component, test_environment, test_component_environment = self._get_test_component_environment_from_test_report_dir(git_repo, report_dir)
+            test_result['test_component'] = test_component
+            test_result['test_environment'] = test_environment
+            test_result['test_component_environment'] = test_component_environment
+            test_result_list.append(test_result)
+        max_len_component = self._get_max_string_len_from_test_result_list(test_result_list, 'test_component', len('test_component'))
+        max_len_environment = self._get_max_string_len_from_test_result_list(test_result_list, 'test_environment', len('test_environment'))
+        self._rendering_text_based_test_report(template_file_name, test_result_list, max_len_component, max_len_environment)
+
+def main(args):
+    gitstore = GitStore()
+    if gitstore.checkout_git_branch(args.git_repo, args.git_branch):
+        testresultview = TestResultView()
+        testresultview.create_text_based_test_report(args.git_repo, args.show_completion)
+    return 0
+
+def register_commands(subparsers):
+    """Register subcommands from this plugin"""
+    parser_build = subparsers.add_parser('view', help='View text-based summary test report',
+                                         description='View text-based summary test report',
+                                         group='view')
+    parser_build.set_defaults(func=main)
+    parser_build.add_argument('git_branch', help='Git branch to be used to compute test summary report')
+    parser_build.add_argument('-g', '--git_repo', default='default', help='(Optional) Full path to the git repository to be used to compute the test summary report, default will be <top_dir>/test-result-log.git')
+    parser_build.add_argument('-i', '--show_completion', action='store_true', help='(Optional) To show completion test case and its statistic')
diff --git a/scripts/test-result-log b/scripts/test-result-log
new file mode 100755
index 0000000..bea4324
--- /dev/null
+++ b/scripts/test-result-log
@@ -0,0 +1,84 @@
+#!/usr/bin/python3
+# As part of the initiative to provide LITE version Test Case Management System
+# with command-line and plain-text files (eg. manual test case file, test plan
+# file to specify list of test case to be executed, test result and log file)
+# to replace Testopia.
+# Test-result-log script was designed as part of the helper script for below purpose:
+# 1. To store test result & log file inside git repository
+# 2. To view text-based test summary report
+#
+import os
+import sys
+import argparse
+script_path = os.path.dirname(os.path.realpath(__file__))
+lib_path = script_path + '/lib'
+sys.path = sys.path + [lib_path]
+import argparse_oe
+import testresultlog.storeauto
+import testresultlog.view
+
+def _get_git_dir(git_dir):
+    base_path = script_path + '/..'
+    if git_dir == 'default':
+        git_dir = os.path.join(base_path, 'test-result-log.git')
+    return git_dir
+
+def _get_oe_dir(oe_dir):
+    base_path = script_path + '/..'
+    if oe_dir == 'default':
+        oe_dir = base_path
+    return oe_dir
+
+def _get_oeqa_case_dir(oe_dir, source):
+    if source == 'runtime':
+        case_dir = os.path.join(oe_dir, 'meta/lib/oeqa/runtime/cases')
+    elif source == 'selftest':
+        case_dir = os.path.join(oe_dir, 'meta/lib/oeqa/selftest/cases')
+    elif source == 'sdk':
+        case_dir = os.path.join(oe_dir, 'meta/lib/oeqa/sdk/cases')
+    else:
+        case_dir = os.path.join(oe_dir, 'meta/lib/oeqa/sdkext/cases')
+    return case_dir
+
+def _get_default_attribute_value(attribute_value):
+    if attribute_value == 'default':
+        attribute_value = ''
+    return attribute_value
+
+def _set_args_attribute_default_value(args):
+    if getattr(args, "environment_list", False):
+        args.environment_list = _get_default_attribute_value(args.environment_list)
+    if getattr(args, "git_remote", False):
+        args.git_remote = _get_default_attribute_value(args.git_remote)
+    if getattr(args, "testcase_remove_file", False):
+        args.testcase_remove_file = _get_default_attribute_value(args.testcase_remove_file)
+
+def main():
+    parser = argparse_oe.ArgumentParser(description="OpenEmbedded testcase management tool, to store test result then to view test summary report.",
+                                        add_help=False,
+                                        epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
+    parser.add_argument('-h', '--help', action='help', default=argparse.SUPPRESS,
+                        help='show this help message and exit')
+    subparsers = parser.add_subparsers(dest="subparser_name", title='subcommands', metavar='<subcommand>')
+    subparsers.required = True
+    subparsers.add_subparser_group('store', 'Store test result', 100)
+    subparsers.add_subparser_group('view', 'Analyze test result', -1)
+    subparsers.add_subparser_group('testplan', 'Plan test', 1000)
+    testresultlog.storeauto.register_commands(subparsers)
+    testresultlog.view.register_commands(subparsers)
+    args = parser.parse_args()
+    if getattr(args, "git_repo", False):
+        args.git_repo = _get_git_dir(args.git_repo)
+    if getattr(args, "oe_dir", False):
+        args.oe_dir = _get_oe_dir(args.oe_dir)
+        args.case_dir = _get_oeqa_case_dir(args.oe_dir, args.source)
+    _set_args_attribute_default_value(args)
+
+    try:
+        ret = args.func(args)
+    except argparse_oe.ArgumentUsageError as ae:
+        parser.error_subcommand(ae.message, ae.subcommand)
+    return ret
+
+if __name__ == "__main__":
+    sys.exit(main())
-- 
2.7.4


