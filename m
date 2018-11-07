Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6702C79D90
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 09:09:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Nov 2018 01:09:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,475,1534834800"; d="scan'208";a="94314355"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Nov 2018 01:09:57 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Nov 2018 16:54:50 +0800
Message-Id: <1541580890-70425-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v3] scripts/test-case-mgmt: store test result file in git repository
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
X-List-Received-Date: Wed, 07 Nov 2018 09:09:57 -0000

These scripts were developed as an alternative testcase management
tool to Testopia. Using these scripts, user can store test result
& log from OEQA automated testcase execution.

These scripts will store test result & log in GIT repository.
To use these scripts, first source oe environment, then run the
entry point script to look for help.
    $ test-case-mgmt

To store test result for OEQA automated testcase, execute the below
    $ test-case-mgmt store <source_dir> <git_branch>

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/testcasemgmt/__init__.py |   0
 scripts/lib/testcasemgmt/gitstore.py | 123 +++++++++++++++++++++++++++++++++++
 scripts/lib/testcasemgmt/store.py    |  39 +++++++++++
 scripts/test-case-mgmt               |  91 ++++++++++++++++++++++++++
 4 files changed, 253 insertions(+)
 create mode 100644 scripts/lib/testcasemgmt/__init__.py
 create mode 100644 scripts/lib/testcasemgmt/gitstore.py
 create mode 100644 scripts/lib/testcasemgmt/store.py
 create mode 100755 scripts/test-case-mgmt

diff --git a/scripts/lib/testcasemgmt/__init__.py b/scripts/lib/testcasemgmt/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/scripts/lib/testcasemgmt/gitstore.py b/scripts/lib/testcasemgmt/gitstore.py
new file mode 100644
index 0000000..7bf18db
--- /dev/null
+++ b/scripts/lib/testcasemgmt/gitstore.py
@@ -0,0 +1,123 @@
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
+    git_sub_dir = ''
+
+    def __init__(self, git_dir, git_branch):
+        self.git_dir = git_dir
+        self.git_branch = git_branch
+
+    def _git_init(self):
+        try:
+            repo = GitRepo(self.git_dir, is_topdir=True)
+        except GitError:
+            print("Non-empty directory that is not a Git repository "
+                   "at {}\nPlease specify an existing Git repository, "
+                   "an empty directory or a non-existing directory "
+                   "path.".format(self.git_dir))
+        return repo
+
+    def _run_git_cmd(self, repo, cmd):
+        try:
+            output = repo.run_cmd(cmd)
+            return True, output
+        except GitError:
+            return False, None
+
+    def _check_if_git_dir_exist(self):
+        if not os.path.exists('%s/.git' % self.git_dir):
+            return False
+        return True
+
+    def _checkout_git_dir(self):
+        repo = self._git_init()
+        cmd = 'checkout %s' % self.git_branch
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
+    def _copy_files(self, logger, source_dir, destination_dir):
+        if os.path.exists(source_dir) and os.path.exists(destination_dir):
+            logger.debug('Copying test result & log from %s to %s' % (source_dir, destination_dir))
+            copytree(source_dir, destination_dir)
+
+    def _store_files_to_git(self, logger, file_dir):
+        logger.debug('Storing test result & log inside git repository (%s) and branch (%s)'
+                     % (self.git_dir, self.git_branch))
+        commit_msg_subject = 'Store %s from {hostname}' % os.path.join(self.git_dir, self.git_sub_dir)
+        commit_msg_body = 'git dir: %s\nsub dir list: %s\nhostname: {hostname}' % (self.git_dir, self.git_sub_dir)
+        return subprocess.run(["oe-git-archive",
+                               file_dir,
+                               "-g", self.git_dir,
+                               "-b", self.git_branch,
+                               "--commit-msg-subject", commit_msg_subject,
+                               "--commit-msg-body", commit_msg_body])
+
+    def _store_files_to_empty_git(self, logger, source_dir):
+        logger.debug('Storing files to empty git')
+        dest_top_dir = self._create_temporary_workspace_dir()
+        dest_sub_dir = os.path.join(dest_top_dir, self.git_sub_dir)
+        self._make_directories(logger, dest_sub_dir)
+        self._copy_files(logger, source_dir, dest_sub_dir)
+        self._store_files_to_git(logger, dest_top_dir)
+        self._remove_temporary_workspace_dir(dest_top_dir)
+
+    def _store_files_to_existing_git(self, logger, source_dir):
+        logger.debug('Storing files to existing git')
+        dest_dir = os.path.join(self.git_dir, self.git_sub_dir)
+        self._make_directories(logger, dest_dir)
+        self._copy_files(logger, source_dir, dest_dir)
+        self._store_files_to_git(logger, self.git_dir)
+
+    def store_test_result(self, logger, source_dir, git_sub_dir, overwrite_result):
+        self.git_sub_dir = git_sub_dir
+        logger.debug('Initializing store the test result & log')
+        if self._check_if_git_dir_exist() and self._checkout_git_dir():
+            logger.debug('Found destination git directory and git branch: %s %s' % (self.git_dir, self.git_branch))
+            if os.path.exists(os.path.join(self.git_dir, self.git_sub_dir)):
+                logger.debug('Found existing sub (%s) directory inside: %s' % (self.git_sub_dir, self.git_dir))
+                if overwrite_result:
+                    logger.debug('Overwriting existing testresult inside: %s' %
+                                 (os.path.join(self.git_dir, self.git_sub_dir)))
+                    shutil.rmtree(os.path.join(self.git_dir, self.git_sub_dir))
+                    self._store_files_to_existing_git(logger, source_dir)
+                else:
+                    logger.debug('Skipped storing test result & log as it already exist. '
+                                 'Specify overwrite if you wish to delete existing testresult and store again.')
+            else:
+                logger.debug('Could not find existing sub (%s) directories inside: %s' %
+                             (self.git_sub_dir, self.git_dir))
+                self._store_files_to_existing_git(logger, source_dir)
+        else:
+            logger.debug('Could not find destination git directory (%s) or git branch (%s)' %
+                         (self.git_dir, self.git_branch))
+            self._store_files_to_empty_git(logger, source_dir)
diff --git a/scripts/lib/testcasemgmt/store.py b/scripts/lib/testcasemgmt/store.py
new file mode 100644
index 0000000..58097de
--- /dev/null
+++ b/scripts/lib/testcasemgmt/store.py
@@ -0,0 +1,39 @@
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
+    gitstore = GitStore(args.git_dir, args.git_branch)
+    gitstore.store_test_result(logger, args.source_dir, args.git_sub_dir, args.overwrite_result)
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
+    parser_build.add_argument('-d', '--git_dir', default='',
+                              help='(Optional) Destination directory to be used or created as git repository '
+                                   'to store the test result files from the source directory. '
+                                   'Default location for destination directory will be <top_dir>/testresults.git.')
+    parser_build.add_argument('-s', '--git_sub_dir', default='',
+                              help='(Optional) Additional sub directory to be used or created under the destination '
+                                   'git repository, this sub directory will be used to hold the test result files. '
+                                   'Use sub directory if need a custom directory to hold test files.')
+    parser_build.add_argument('-o', '--overwrite_result', action='store_true',
+                              help='(Optional) To overwrite existing testresult file with new file provided.')
diff --git a/scripts/test-case-mgmt b/scripts/test-case-mgmt
new file mode 100755
index 0000000..d805d88
--- /dev/null
+++ b/scripts/test-case-mgmt
@@ -0,0 +1,91 @@
+#!/usr/bin/env python3
+#
+# test case management tool - store test result and log, reporting, manual test
+# execution and management
+#
+# As part of the initiative to provide LITE version Test Case Management System
+# with command-line and plain-text files (eg. manual test case file, test result 
+# and log file) to replace Testopia.
+# test-case-mgmt script was designed as part of the helper script for below purpose:
+# 1. To store test result & log inside git repository
+# 2. (Future) To provide test reporting in text-based test summary report
+# 3. (Future) To manage manual test case execution, store manual execution test result
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
+logger = scriptutils.logger_create('test-case-mgmt')
+
+def _validate_user_input_arguments(args):
+    if hasattr(args, "git_sub_dir"):
+        if '/' in args.git_sub_dir:
+            logger.error('git_sub_dir argument cannot contain / : %s' % args.git_sub_dir)
+            return False
+        if '\\' in r"%r" % args.git_sub_dir:
+            logger.error('git_sub_dir argument cannot contain \\ : %r' % args.git_sub_dir)
+            return False
+    return True
+
+def _set_default_arg_value_for_git_dir(args):
+    if hasattr(args, "git_dir"):
+        if args.git_dir == '':
+            base_path = script_path + '/..'
+            args.git_dir = os.path.join(os.path.abspath(base_path), 'testresults.git')
+        logger.debug('Set git_dir argument: %s' % args.git_dir)
+
+def main():
+    parser = argparse_oe.ArgumentParser(description="OpenEmbedded testcase management tool, store test result, "
+                                                    "reporting, and manual test execution.",
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


