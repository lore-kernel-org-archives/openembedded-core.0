Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 3802F74AFA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 07:57:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Oct 2018 00:57:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,343,1534834800"; d="scan'208";a="78931586"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008.jf.intel.com with ESMTP; 05 Oct 2018 00:57:51 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Oct 2018 15:42:36 +0800
Message-Id: <1538725356-64136-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] scripts/test-case-mgmt: store test result & log into git repository
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
X-List-Received-Date: Fri, 05 Oct 2018 07:57:52 -0000

These scripts were developed as an alternative testcase management
tool to Testopia. Using these scripts, user can store test result &
log from OEQA automated testcase execution.

These scripts will store test result & log in GIT repository.
To use these scripts, first source oe environment, then run the
entry point script to look for help.
    $ test-case-mgmt

To store test result for OEQA automated testcase, execute the below
    $ test-case-mgmt store <testresult_dir> <top_folder> <git_branch>

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/testcasemgmt/__init__.py |   0
 scripts/lib/testcasemgmt/gitstore.py | 148 +++++++++++++++++++++++++++++++++++
 scripts/lib/testcasemgmt/store.py    |  42 ++++++++++
 scripts/test-case-mgmt               |  92 ++++++++++++++++++++++
 4 files changed, 282 insertions(+)
 create mode 100644 scripts/lib/testcasemgmt/__init__.py
 create mode 100644 scripts/lib/testcasemgmt/gitstore.py
 create mode 100644 scripts/lib/testcasemgmt/store.py
 create mode 100755 scripts/test-case-mgmt

diff --git a/scripts/lib/testcasemgmt/__init__.py b/scripts/lib/testcasemgmt/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/scripts/lib/testcasemgmt/gitstore.py b/scripts/lib/testcasemgmt/gitstore.py
new file mode 100644
index 0000000..e744615
--- /dev/null
+++ b/scripts/lib/testcasemgmt/gitstore.py
@@ -0,0 +1,148 @@
+# test case management tool - store test result & log to git repository
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
+from oe.path import copytree
+
+class GitStore(object):
+
+    def __init__(self):
+        self.script_path = os.path.dirname(os.path.realpath(__file__))
+        self.base_path = self.script_path + '/../../..'
+
+    def _get_top_dir_to_sub_dirs_path(self, top_dir, sub_dir_list):
+        for sub_dir in sub_dir_list:
+            top_dir = os.path.join(top_dir, sub_dir)
+        return top_dir
+
+    def _get_full_path_to_top_and_sub_dir(self, dir, top_dir, sub_dir_list):
+        full_path_dir = os.path.join(dir, top_dir)
+        full_path_dir = self._get_top_dir_to_sub_dirs_path(full_path_dir, sub_dir_list)
+        return full_path_dir
+
+    def _check_if_dir_contain_top_dir_and_sub_dirs(self, dir, top_dir, sub_dir_list):
+        dest_dir = self._get_full_path_to_top_and_sub_dir(dir, top_dir, sub_dir_list)
+        if os.path.exists(dest_dir):
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
+    def _make_directories(self, logger, full_path_dir):
+        logger.debug('Creating directories: %s' % full_path_dir)
+        pathlib.Path(full_path_dir).mkdir(parents=True, exist_ok=True)
+
+    def _copy_files_from_source_to_destination_dir(self, logger, source_dir, destination_dir):
+        if os.path.exists(source_dir) and os.path.exists(destination_dir):
+            logger.debug('Copying test result & log from %s to %s' % (source_dir, destination_dir))
+            copytree(source_dir, destination_dir)
+
+    def _push_testsuite_testcase_json_file_to_git_repo(self, logger, file_dir, git_repo, git_branch, top_dir, sub_dir_list):
+        logger.debug('Storing test result & log inside git repository (%s) and branch (%s)'
+                     % (git_repo, git_branch))
+        top_and_sub_dir = self._get_top_dir_to_sub_dirs_path(top_dir, sub_dir_list)
+        commit_msg_subject = 'Store %s from {hostname}' % top_and_sub_dir
+        commit_msg_body = 'top dir: %s\nsub dir list: %s\nhostname: {hostname}' % (top_dir, sub_dir_list)
+        return subprocess.run(["oe-git-archive",
+                               file_dir,
+                               "-g", git_repo,
+                               "-b", git_branch,
+                               "--commit-msg-subject", commit_msg_subject,
+                               "--commit-msg-body", commit_msg_body])
+
+    def _store_test_result_from_empty_git(self, logger, source_dir, dest_git_dir, git_branch, top_dir, sub_dir_list):
+        workspace_dir = self._create_temporary_workspace_dir()
+        full_path_dir = self._get_full_path_to_top_and_sub_dir(workspace_dir, top_dir, sub_dir_list)
+        self._make_directories(logger, full_path_dir)
+        self._copy_files_from_source_to_destination_dir(logger, source_dir, full_path_dir)
+        self._push_testsuite_testcase_json_file_to_git_repo(logger, workspace_dir, dest_git_dir, git_branch, top_dir, sub_dir_list)
+        self._remove_temporary_workspace_dir(workspace_dir)
+
+    def _store_test_result_from_existing_git(self, logger, source_dir, dest_git_dir, git_branch, top_dir, sub_dir_list):
+        full_path_dir = self._get_full_path_to_top_and_sub_dir(dest_git_dir, top_dir, sub_dir_list)
+        if not self._check_if_dir_contain_top_dir_and_sub_dirs(dest_git_dir, top_dir, sub_dir_list):
+            self._make_directories(logger, full_path_dir)
+        self._copy_files_from_source_to_destination_dir(logger, source_dir, full_path_dir)
+        self._push_testsuite_testcase_json_file_to_git_repo(logger, dest_git_dir, dest_git_dir, git_branch, top_dir, sub_dir_list)
+
+    def store_test_result(self, logger, source_dir, dest_git_dir, git_branch, top_folder, sub_folder_list, overwrite_testresult):
+        logger.debug('Initialize storing of test result & log')
+        if self._check_if_git_repo_and_git_branch_exist(dest_git_dir, git_branch):
+            repo = self._git_init(dest_git_dir)
+            self._git_checkout_git_repo(repo, git_branch)
+            logger.debug('Found destination git directory and git branch: %s %s' % (dest_git_dir, git_branch))
+            if self._check_if_dir_contain_top_dir_and_sub_dirs(dest_git_dir, top_folder, sub_folder_list):
+                logger.debug('Found existing top (%s) & sub (%s) directories inside: %s' %
+                             (top_folder, sub_folder_list, dest_git_dir))
+                if overwrite_testresult:
+                    logger.debug('Removing and overwriting existing top (%s) & sub (%s) directories inside: %s' %
+                                 (top_folder, sub_folder_list, dest_git_dir))
+                    shutil.rmtree(os.path.join(dest_git_dir, top_folder))
+                    self._store_test_result_from_existing_git(logger, source_dir, dest_git_dir, git_branch, top_folder,
+                                                              sub_folder_list)
+                else:
+                    logger.debug('Skipped storing test result & log as it already exist. '
+                                'Specify overwrite if you wish to delete existing testresult and store again.')
+            else:
+                logger.debug('Could not find top (%s) & sub (%s) directories inside: %s' %
+                             (top_folder, sub_folder_list, dest_git_dir))
+                self._store_test_result_from_existing_git(logger, source_dir, dest_git_dir, git_branch, top_folder,
+                                                          sub_folder_list)
+        else:
+            logger.debug('Could not find destination git directory (%s) or git branch (%s)' % (dest_git_dir, git_branch))
+            self._store_test_result_from_empty_git(logger, source_dir, dest_git_dir, git_branch, top_folder,
+                                                   sub_folder_list)
+
diff --git a/scripts/lib/testcasemgmt/store.py b/scripts/lib/testcasemgmt/store.py
new file mode 100644
index 0000000..60b4d8e
--- /dev/null
+++ b/scripts/lib/testcasemgmt/store.py
@@ -0,0 +1,42 @@
+# test case management tool - store test result & log
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
+from testcasemgmt.gitstore import GitStore
+
+def store(args, logger):
+    env_list = []
+    if len(args.environment_list) > 0:
+        env_list = args.environment_list.split(",")
+    gitstore = GitStore()
+    gitstore.store_test_result(logger, args.testresult_dir, args.git_repo, args.git_branch, args.top_folder, env_list, args.overwrite_testresult)
+    return 0
+
+def register_commands(subparsers):
+    """Register subcommands from this plugin"""
+    parser_build = subparsers.add_parser('store', help='Store OEQA test result & log into git repository',
+                                         description='Store OEQA test result & log into git repository',
+                                         group='store')
+    parser_build.set_defaults(func=store)
+    parser_build.add_argument('testresult_dir',
+                              help='Directory to the test result & log files to be stored')
+    parser_build.add_argument('top_folder',
+                              help='Top folder to be created inside the git repository')
+    parser_build.add_argument('git_branch', help='Git branch to store the test result & log')
+    parser_build.add_argument('-g', '--git_repo', default='',
+                              help='(Optional) Full path to the git repository used for storage, '
+                                   'default will be <top_dir>/test-result-log.git')
+    parser_build.add_argument('-e', '--environment_list', default='',
+                              help='(Optional) List of environment separated by comma (","),'
+                                   ' used to create the subfolder(s) under the top_folder_name to store test status & log')
+    parser_build.add_argument('-o', '--overwrite_testresult', action='store_true',
+                              help='(Optional) To overwrite existing testresult & log with new data provided')
diff --git a/scripts/test-case-mgmt b/scripts/test-case-mgmt
new file mode 100755
index 0000000..4ad482a
--- /dev/null
+++ b/scripts/test-case-mgmt
@@ -0,0 +1,92 @@
+#!/usr/bin/env python3
+#
+# test case management tool - store test result and log, reporting, manual test
+# execution and management
+#
+# As part of the initiative to provide LITE version Test Case Management System
+# with command-line and plain-text files (eg. manual test case file, test plan
+# file to specify list of test case to be executed, test result and log file)
+# to replace Testopia.
+# test-case-mgmt script was designed as part of the helper script for below purpose:
+# 1. To store test result & log file inside git repository
+# 2. (Future) To provide test reporting in text-based test summary report
+# 3. (Future) To manage manual test case execution, store test result
+#
+# To look for help information.
+#    $ test-case-mgmt
+#
+# To store test result for OEQA automated testcase, execute the below
+#    $ test-case-mgmt store <testresult_dir> <top_folder> <git_branch>
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
+import testcasemgmt.store
+logger = scriptutils.logger_create('test-result-log')
+
+def _validate_user_input_arguments(args):
+    if hasattr(args, "top_folder"):
+        if '/' in args.top_folder:
+            logger.error('top_folder argument cannot contain / : %s' % args.top_folder)
+            return False
+        if '\\' in r"%r" % args.top_folder:
+            logger.error('top_folder argument cannot contain \\ : %r' % args.top_folder)
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
+    subparsers.add_subparser_group('store', 'Store test result & log', 100)
+    testcasemgmt.store.register_commands(subparsers)
+    args = parser.parse_args()
+    if args.debug:
+        logger.setLevel(logging.DEBUG)
+    elif args.quiet:
+        logger.setLevel(logging.ERROR)
+
+    if not _validate_user_input_arguments(args):
+        return -1
+    _set_default_arg_value_for_git_dir(args)
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


