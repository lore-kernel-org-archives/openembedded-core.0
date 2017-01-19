Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8277F71A6B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 11:12:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2017 03:12:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,253,1477983600"; d="scan'208";a="1114934268"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 19 Jan 2017 03:12:48 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 13:12:36 +0200
Message-Id: <20170119111239.22506-9-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170119111239.22506-1-markus.lehtonen@linux.intel.com>
References: <20170119111239.22506-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 08/11] oe-build-perf-test: save test metadata in a separate file
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
X-List-Received-Date: Thu, 19 Jan 2017 11:12:48 -0000

The patch introduces a new metadata (.json or .xml) file in the output
directory. All test meta data, e.g. git revision information and tester
host information is now stored there. The JSON report format is slightly
changed as the metadata is not present in results.json anymore.

[YOCTO #10590]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 129 ----------------------------------------
 scripts/oe-build-perf-test      | 118 ++++++++++++++++++++++++++++++++++--
 2 files changed, 114 insertions(+), 133 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 92f3e45..4027fdb 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -101,40 +101,10 @@ class BuildPerfTestResult(unittest.TextTestResult):
         super(BuildPerfTestResult, self).__init__(*args, **kwargs)
 
         self.out_dir = out_dir
-        # Get Git parameters
-        try:
-            self.repo = GitRepo('.')
-        except GitError:
-            self.repo = None
-        self.git_commit, self.git_commit_count, self.git_branch = \
-                self.get_git_revision()
         self.hostname = socket.gethostname()
         self.product = os.getenv('OE_BUILDPERFTEST_PRODUCT', 'oe-core')
         self.start_time = self.elapsed_time = None
         self.successes = []
-        log.info("Using Git branch:commit %s:%s (%s)", self.git_branch,
-                 self.git_commit, self.git_commit_count)
-
-    def get_git_revision(self):
-        """Get git branch and commit under testing"""
-        commit = os.getenv('OE_BUILDPERFTEST_GIT_COMMIT')
-        commit_cnt = os.getenv('OE_BUILDPERFTEST_GIT_COMMIT_COUNT')
-        branch = os.getenv('OE_BUILDPERFTEST_GIT_BRANCH')
-        if not self.repo and (not commit or not commit_cnt or not branch):
-            log.info("The current working directory doesn't seem to be a Git "
-                     "repository clone. You can specify branch and commit "
-                     "displayed in test results with OE_BUILDPERFTEST_GIT_BRANCH, "
-                     "OE_BUILDPERFTEST_GIT_COMMIT and "
-                     "OE_BUILDPERFTEST_GIT_COMMIT_COUNT environment variables")
-        else:
-            if not commit:
-                commit = self.repo.rev_parse('HEAD^0')
-                commit_cnt = self.repo.run_cmd(['rev-list', '--count', 'HEAD^0'])
-            if not branch:
-                branch = self.repo.get_current_branch()
-                if not branch:
-                    log.debug('Currently on detached HEAD')
-        return str(commit), str(commit_cnt), str(branch)
 
     def addSuccess(self, test):
         """Record results from successful tests"""
@@ -182,48 +152,9 @@ class BuildPerfTestResult(unittest.TextTestResult):
         return sorted(compound, key=lambda info: info[1].start_time)
 
 
-    def update_globalres_file(self, filename):
-        """Write results to globalres csv file"""
-        # Map test names to time and size columns in globalres
-        # The tuples represent index and length of times and sizes
-        # respectively
-        gr_map = {'test1': ((0, 1), (8, 1)),
-                  'test12': ((1, 1), (None, None)),
-                  'test13': ((2, 1), (9, 1)),
-                  'test2': ((3, 1), (None, None)),
-                  'test3': ((4, 3), (None, None)),
-                  'test4': ((7, 1), (10, 2))}
-
-        if self.repo:
-            git_tag_rev = self.repo.run_cmd(['describe', self.git_commit])
-        else:
-            git_tag_rev = self.git_commit
-
-        values = ['0'] * 12
-        for status, test, _ in self.all_results():
-            if status in ['ERROR', 'SKIPPED']:
-                continue
-            (t_ind, t_len), (s_ind, s_len) = gr_map[test.name]
-            if t_ind is not None:
-                values[t_ind:t_ind + t_len] = test.times
-            if s_ind is not None:
-                values[s_ind:s_ind + s_len] = test.sizes
-
-        log.debug("Writing globalres log to %s", filename)
-        with open(filename, 'a') as fobj:
-            fobj.write('{},{}:{},{},'.format(self.hostname,
-                                             self.git_branch,
-                                             self.git_commit,
-                                             git_tag_rev))
-            fobj.write(','.join(values) + '\n')
-
     def write_results_json(self):
         """Write test results into a json-formatted file"""
         results = {'tester_host': self.hostname,
-                   'git_branch': self.git_branch,
-                   'git_commit': self.git_commit,
-                   'git_commit_count': self.git_commit_count,
-                   'product': self.product,
                    'start_time': self.start_time,
                    'elapsed_time': self.elapsed_time}
 
@@ -313,66 +244,6 @@ class BuildPerfTestResult(unittest.TextTestResult):
             dom_doc.writexml(fobj, addindent='  ', newl='\n', encoding='utf-8')
         return
 
-    def git_commit_results(self, repo_path, branch=None, tag=None):
-        """Commit results into a Git repository"""
-        repo = GitRepo(repo_path, is_topdir=True)
-        if not branch:
-            branch = self.git_branch
-        else:
-            # Replace keywords
-            branch = branch.format(git_branch=self.git_branch,
-                                   tester_host=self.hostname)
-
-        log.info("Committing test results into %s %s", repo_path, branch)
-        tmp_index = os.path.join(repo_path, '.git', 'index.oe-build-perf')
-        try:
-            # Create new commit object from the new results
-            env_update = {'GIT_INDEX_FILE': tmp_index,
-                          'GIT_WORK_TREE': self.out_dir}
-            repo.run_cmd('add .', env_update)
-            tree = repo.run_cmd('write-tree', env_update)
-            parent = repo.rev_parse(branch)
-            msg = "Results of {}:{}\n".format(self.git_branch, self.git_commit)
-            git_cmd = ['commit-tree', tree, '-m', msg]
-            if parent:
-                git_cmd += ['-p', parent]
-            commit = repo.run_cmd(git_cmd, env_update)
-
-            # Update branch head
-            git_cmd = ['update-ref', 'refs/heads/' + branch, commit]
-            if parent:
-                git_cmd.append(parent)
-            repo.run_cmd(git_cmd)
-
-            # Update current HEAD, if we're on branch 'branch'
-            if repo.get_current_branch() == branch:
-                log.info("Updating %s HEAD to latest commit", repo_path)
-                repo.run_cmd('reset --hard')
-
-            # Create (annotated) tag
-            if tag:
-                # Find tags matching the pattern
-                tag_keywords = dict(git_branch=self.git_branch,
-                                    git_commit=self.git_commit,
-                                    git_commit_count=self.git_commit_count,
-                                    tester_host=self.hostname,
-                                    tag_num='[0-9]{1,5}')
-                tag_re = re.compile(tag.format(**tag_keywords) + '$')
-                tag_keywords['tag_num'] = 0
-                for existing_tag in repo.run_cmd('tag').splitlines():
-                    if tag_re.match(existing_tag):
-                        tag_keywords['tag_num'] += 1
-
-                tag = tag.format(**tag_keywords)
-                msg = "Test run #{} of {}:{}\n".format(tag_keywords['tag_num'],
-                                                       self.git_branch,
-                                                       self.git_commit)
-                repo.run_cmd(['tag', '-a', '-m', msg, tag, commit])
-
-        finally:
-            if os.path.exists(tmp_index):
-                os.unlink(tmp_index)
-
 
 class BuildPerfTestCase(unittest.TestCase):
     """Base class for build performance tests"""
diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 4ec9f14..fc4ab31 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -17,8 +17,10 @@
 import argparse
 import errno
 import fcntl
+import json
 import logging
 import os
+import re
 import shutil
 import sys
 import unittest
@@ -27,11 +29,13 @@ from datetime import datetime
 sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)) + '/lib')
 import scriptpath
 scriptpath.add_oe_lib_path()
+scriptpath.add_bitbake_lib_path()
 import oeqa.buildperf
 from oeqa.buildperf import (BuildPerfTestLoader, BuildPerfTestResult,
                             BuildPerfTestRunner, KernelDropCaches)
 from oeqa.utils.commands import runCmd
 from oeqa.utils.git import GitRepo, GitError
+from oeqa.utils.metadata import metadata_from_bb, write_metadata_file
 
 
 # Set-up logging
@@ -115,6 +119,100 @@ def archive_build_conf(out_dir):
     shutil.copytree(src_dir, tgt_dir)
 
 
+def git_commit_results(repo_dir, results_dir, branch, tag, metadata):
+    """Commit results into a Git repository"""
+    repo = GitRepo(repo_dir, is_topdir=True)
+    distro_branch = metadata['layers']['meta']['branch']
+    distro_commit = metadata['layers']['meta']['commit']
+    distro_commit_count = metadata['layers']['meta']['commit_count']
+
+    # Replace keywords
+    branch = branch.format(git_branch=distro_branch,
+                           tester_host=metadata['hostname'])
+
+    log.info("Committing test results into %s %s", repo_dir, branch)
+    tmp_index = os.path.join(repo_dir, '.git', 'index.oe-build-perf')
+    try:
+        # Create new commit object from the new results
+        env_update = {'GIT_INDEX_FILE': tmp_index,
+                      'GIT_WORK_TREE': results_dir}
+        repo.run_cmd('add .', env_update)
+        tree = repo.run_cmd('write-tree', env_update)
+        parent = repo.rev_parse(branch)
+        msg = "Results of {}:{}\n".format(distro_branch, distro_commit)
+        git_cmd = ['commit-tree', tree, '-m', msg]
+        if parent:
+            git_cmd += ['-p', parent]
+        commit = repo.run_cmd(git_cmd, env_update)
+
+        # Update branch head
+        git_cmd = ['update-ref', 'refs/heads/' + branch, commit]
+        if parent:
+            git_cmd.append(parent)
+        repo.run_cmd(git_cmd)
+
+        # Update current HEAD, if we're on branch 'branch'
+        if repo.get_current_branch() == branch:
+            log.info("Updating %s HEAD to latest commit", repo_dir)
+            repo.run_cmd('reset --hard')
+
+        # Create (annotated) tag
+        if tag:
+            # Find tags matching the pattern
+            tag_keywords = dict(git_branch=distro_branch,
+                                git_commit=distro_commit,
+                                git_commit_count=distro_commit_count,
+                                tester_host=metadata['hostname'],
+                                tag_num='[0-9]{1,5}')
+            tag_re = re.compile(tag.format(**tag_keywords) + '$')
+            tag_keywords['tag_num'] = 0
+            for existing_tag in repo.run_cmd('tag').splitlines():
+                if tag_re.match(existing_tag):
+                    tag_keywords['tag_num'] += 1
+
+            tag = tag.format(**tag_keywords)
+            msg = "Test run #{} of {}:{}\n".format(tag_keywords['tag_num'],
+                                                   distro_branch,
+                                                   distro_commit)
+            repo.run_cmd(['tag', '-a', '-m', msg, tag, commit])
+
+    finally:
+        if os.path.exists(tmp_index):
+            os.unlink(tmp_index)
+
+
+def update_globalres_file(result_obj, filename, metadata):
+    """Write results to globalres csv file"""
+    # Map test names to time and size columns in globalres
+    # The tuples represent index and length of times and sizes
+    # respectively
+    gr_map = {'test1': ((0, 1), (8, 1)),
+              'test12': ((1, 1), (None, None)),
+              'test13': ((2, 1), (9, 1)),
+              'test2': ((3, 1), (None, None)),
+              'test3': ((4, 3), (None, None)),
+              'test4': ((7, 1), (10, 2))}
+
+    values = ['0'] * 12
+    for status, test, _ in result_obj.all_results():
+        if status in ['ERROR', 'SKIPPED']:
+            continue
+        (t_ind, t_len), (s_ind, s_len) = gr_map[test.name]
+        if t_ind is not None:
+            values[t_ind:t_ind + t_len] = test.times
+        if s_ind is not None:
+            values[s_ind:s_ind + s_len] = test.sizes
+
+    log.debug("Writing globalres log to %s", filename)
+    rev_info = metadata['layers']['meta']
+    with open(filename, 'a') as fobj:
+        fobj.write('{},{}:{},{},'.format(metadata['hostname'],
+                                         rev_info['branch'],
+                                         rev_info['commit'],
+                                         rev_info['commit']))
+        fobj.write(','.join(values) + '\n')
+
+
 def parse_args(argv):
     """Parse command line arguments"""
     parser = argparse.ArgumentParser(
@@ -183,7 +281,19 @@ def main(argv=None):
     else:
         suite = loader.loadTestsFromModule(oeqa.buildperf)
 
+    # Save test metadata
+    metadata = metadata_from_bb()
+    log.info("Testing Git revision branch:commit %s:%s (%s)",
+             metadata['layers']['meta']['branch'],
+             metadata['layers']['meta']['commit'],
+             metadata['layers']['meta']['commit_count'])
+    if args.xml:
+        write_metadata_file(os.path.join(out_dir, 'metadata.xml'), metadata)
+    else:
+        with open(os.path.join(out_dir, 'metadata.json'), 'w') as fobj:
+            json.dump(metadata, fobj, indent=2)
     archive_build_conf(out_dir)
+
     runner = BuildPerfTestRunner(out_dir, verbosity=2)
 
     # Suppress logger output to stderr so that the output from unittest
@@ -201,11 +311,11 @@ def main(argv=None):
     else:
         result.write_results_json()
     if args.globalres_file:
-        result.update_globalres_file(args.globalres_file)
+        update_globalres_file(result, args.globalres_file, metadata)
     if args.commit_results:
-        result.git_commit_results(args.commit_results,
-                                  args.commit_results_branch,
-                                  args.commit_results_tag)
+        git_commit_results(args.commit_results, out_dir,
+                           args.commit_results_branch, args.commit_results_tag,
+                           metadata)
     if result.wasSuccessful():
         return 0
 
-- 
2.10.2


