Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A21B6799F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 08:52:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Oct 2018 01:52:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,423,1534834800"; d="scan'208";a="275475963"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga006.fm.intel.com with ESMTP; 25 Oct 2018 01:52:55 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Oct 2018 16:37:46 +0800
Message-Id: <1540456666-60028-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] scripts/test-case-mgmt: store test result & log into git repository
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
X-List-Received-Date: Thu, 25 Oct 2018 08:52:57 -0000

These scripts were developed as an alternative testcase management
tool to Testopia. Using these scripts, user can store test result &
log from OEQA automated testcase execution.

These scripts will store test result & log in GIT repository.
To use these scripts, first source oe environment, then run the
entry point script to look for help.
    $ test-case-mgmt

To store test result for OEQA automated testcase, execute the below
    $ test-case-mgmt store <source_dir> <git_branch>

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/testcasemgmt/__init__.py |   0
 scripts/lib/testcasemgmt/gitstore.py | 129 +++++++++++++++++++++++++++++++++++
 scripts/lib/testcasemgmt/store.py    |  40 +++++++++++
 scripts/test-case-mgmt               |  92 +++++++++++++++++++++++++
 4 files changed, 261 insertions(+)
 create mode 100644 scripts/lib/testcasemgmt/__init__.py
 create mode 100644 scripts/lib/testcasemgmt/gitstore.py
 create mode 100644 scripts/lib/testcasemgmt/store.py
 create mode 100755 scripts/test-case-mgmt

diff --git a/scripts/lib/testcasemgmt/__init__.py b/scripts/lib/testcasemgmt/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/scripts/lib/testcasemgmt/gitstore.py b/scripts/lib/testcasemgmt/gitstore.py
new file mode 100644
index 0000000..2063ce8
--- /dev/null
+++ b/scripts/lib/testcasemgmt/gitstore.py
@@ -0,0 +1,129 @@
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
+    def _check_if_dir_contain_sub_dir(self, dir, sub_dir):
+        if os.path.exists(os.path.join(dir, sub_dir)):
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
+    def _make_directories(self, logger, target_dir):
+        logger.debug('Creating directories: %s' % target_dir)
+        bb.utils.mkdirhier(target_dir)
+
+    def _copy_files_from_source_to_destination_dir(self, logger, source_dir, destination_dir):
+        if os.path.exists(source_dir) and os.path.exists(destination_dir):
+            logger.debug('Copying test result & log from %s to %s' % (source_dir, destination_dir))
+            copytree(source_dir, destination_dir)
+
+    def _push_testresult_files_to_git_repo(self, logger, file_dir, git_repo, git_branch, sub_dir):
+        logger.debug('Storing test result & log inside git repository (%s) and branch (%s)'
+                     % (git_repo, git_branch))
+        commit_msg_subject = 'Store %s from {hostname}' % os.path.join(git_repo, sub_dir)
+        commit_msg_body = 'git dir: %s\nsub dir list: %s\nhostname: {hostname}' % (git_repo, sub_dir)
+        return subprocess.run(["oe-git-archive",
+                               file_dir,
+                               "-g", git_repo,
+                               "-b", git_branch,
+                               "--commit-msg-subject", commit_msg_subject,
+                               "--commit-msg-body", commit_msg_body])
+
+    def _store_test_result_from_empty_git(self, logger, source_dir, git_branch, dest_dir, dest_sub_dir):
+        workspace_dir = self._create_temporary_workspace_dir()
+        full_workspace_dir = os.path.join(workspace_dir, dest_sub_dir)
+        self._make_directories(logger, full_workspace_dir)
+        self._copy_files_from_source_to_destination_dir(logger, source_dir, full_workspace_dir)
+        self._push_testresult_files_to_git_repo(logger, workspace_dir, dest_dir, git_branch, dest_sub_dir)
+        self._remove_temporary_workspace_dir(workspace_dir)
+
+    def _store_test_result_from_existing_git(self, logger, source_dir, git_branch, dest_dir, dest_sub_dir):
+        self._make_directories(logger, os.path.join(dest_dir, dest_sub_dir))
+        self._copy_files_from_source_to_destination_dir(logger, source_dir, os.path.join(dest_dir, dest_sub_dir))
+        self._push_testresult_files_to_git_repo(logger, dest_dir, dest_dir, git_branch, dest_sub_dir)
+
+    def checkout_git_branch(self, git_dir, git_branch):
+        if self._check_if_git_repo_and_git_branch_exist(git_dir, git_branch):
+            repo = self._git_init(git_dir)
+            self._git_checkout_git_repo(repo, git_branch)
+            return True
+        else:
+            return False
+
+    def store_test_result(self, logger, source_dir, git_branch, dest_dir, dest_sub_dir, overwrite_result):
+        logger.debug('Initializing store the test result & log')
+        if self._check_if_git_repo_and_git_branch_exist(dest_dir, git_branch):
+            self.checkout_git_branch(dest_dir, git_branch)
+            logger.debug('Found destination git directory and git branch: %s %s' % (dest_dir, git_branch))
+            if self._check_if_dir_contain_sub_dir(dest_dir, dest_sub_dir):
+                logger.debug('Found existing sub (%s) directories inside: %s' % (dest_sub_dir, dest_dir))
+                if overwrite_result:
+                    logger.debug('Overwriting existing testresult inside: %s' % (os.path.join(dest_dir, dest_sub_dir)))
+                    shutil.rmtree(os.path.join(dest_dir, dest_sub_dir))
+                    self._store_test_result_from_existing_git(logger, source_dir, git_branch, dest_dir, dest_sub_dir)
+                else:
+                    logger.debug('Skipped storing test result & log as it already exist. '
+                                 'Specify overwrite if you wish to delete existing testresult and store again.')
+            else:
+                logger.debug('Could not find existing sub (%s) directories inside: %s' % (dest_sub_dir, dest_dir))
+                self._store_test_result_from_existing_git(logger, source_dir, git_branch, dest_dir, dest_sub_dir)
+        else:
+            logger.debug('Could not find destination git directory (%s) or git branch (%s)' % (dest_dir, git_branch))
+            self._store_test_result_from_empty_git(logger, source_dir, git_branch, dest_dir, dest_sub_dir)
+
diff --git a/scripts/lib/testcasemgmt/store.py b/scripts/lib/testcasemgmt/store.py
new file mode 100644
index 0000000..c6386c8a
--- /dev/null
+++ b/scripts/lib/testcasemgmt/store.py
@@ -0,0 +1,40 @@
+# test case management tool - store test result
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
+    gitstore = GitStore()
+    gitstore.store_test_result(logger, args.source_dir, args.git_branch, args.dest_dir, args.dest_sub_dir,
+                               args.overwrite_result)
+    return 0
+
+def register_commands(subparsers):
+    """Register subcommands from this plugin"""
+    parser_build = subparsers.add_parser('store', help='Store test result files into git repository.',
+                                         description='Store test result files into git repository.',
+                                         group='store')
+    parser_build.set_defaults(func=store)
+    parser_build.add_argument('source_dir',
+                              help='Source directory that contain the test result files to be stored.')
+    parser_build.add_argument('git_branch', help='Git branch used to store the test result files.')
+    parser_build.add_argument('-d', '--dest_dir', default='',
+                              help='(Optional) Destination directory to be used/created as git repository '
+                                   'to store the test result files from the source directory. '
+                                   'Default location for destination directory will be <top_dir>/testresults.git.')
+    parser_build.add_argument('-s', '--dest_sub_dir', default='',
+                              help='(Optional) Additional sub directory to be used/created under the destination '
+                                   'git repository, this sub directory will be used to hold the test result files. '
+                                   'Use sub directory if needing separate directories to hold multiple test files.')
+    parser_build.add_argument('-o', '--overwrite_result', action='store_true',
+                              help='(Optional) To overwrite existing testresult file with new file provided.')
diff --git a/scripts/test-case-mgmt b/scripts/test-case-mgmt
new file mode 100755
index 0000000..9219b8d
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
+# 1. To store test result & log inside git repository
+# 2. (Future) To provide test reporting in text-based test summary report
+# 3. (Future) To manage manual test case execution, store test result
+#
+# To look for help information.
+#    $ test-case-mgmt
+#
+# To store test result & log, execute the below
+#    $ test-case-mgmt store <source_dir> <git_branch>
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
+#import testcasemgmt.view
+logger = scriptutils.logger_create('test-case-mgmt')
+
+def _validate_user_input_arguments(args):
+    if hasattr(args, "dest_sub_dir"):
+        if '/' in args.dest_sub_dir:
+            logger.error('dest_sub_dir argument cannot contain / : %s' % args.dest_sub_dir)
+            return False
+        if '\\' in r"%r" % args.dest_sub_dir:
+            logger.error('dest_sub_dir argument cannot contain \\ : %r' % args.dest_sub_dir)
+            return False
+    return True
+
+def _set_default_arg_value_for_dest_dir(args):
+    if hasattr(args, "dest_dir"):
+        if args.dest_dir == '':
+            base_path = script_path + '/..'
+            args.dest_dir = os.path.join(os.path.abspath(base_path), 'testresults.git')
+        logger.debug('Set dest_dir argument: %s' % args.dest_dir)
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
+    _set_default_arg_value_for_dest_dir(args)
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


