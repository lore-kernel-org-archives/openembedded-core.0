Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8CE09731C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:13:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 24 Aug 2016 00:13:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,569,1464678000"; d="scan'208";a="1040620627"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2016 00:13:19 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 10:12:58 +0300
Message-Id: <1472022789-13028-9-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 08/19] oe-build-perf-test: support committing results data to Git
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
X-List-Received-Date: Wed, 24 Aug 2016 07:13:25 -0000

Implement a new command line option '--commit-results' which commits the
test results data into a Git repository. The given path must be an
existing initialized local Git repository.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 35 +++++++++++++++++++++++++++++++++++
 scripts/oe-build-perf-test      |  5 +++++
 2 files changed, 40 insertions(+)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 0e77aae..8f7d88c 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -188,6 +188,41 @@ class BuildPerfTestResult(unittest.TextTestResult):
             fobj.write(','.join(values) + '\n')
 
 
+    def git_commit_results(self, repo_path, branch=None):
+        """Commit results into a Git repository"""
+        repo = GitRepo(repo_path, is_topdir=True)
+        if not branch:
+            branch = self.git_branch
+        log.info("Committing test results into %s %s", repo_path, branch)
+        tmp_index = os.path.join(repo_path, '.git', 'index.oe-build-perf')
+        try:
+            # Create new commit object from the new results
+            env_update = {'GIT_INDEX_FILE': tmp_index,
+                          'GIT_WORK_TREE': self.out_dir}
+            repo.run_cmd('add .', env_update)
+            tree = repo.run_cmd('write-tree', env_update)
+            parent = repo.rev_parse(branch)
+            msg = "Results of {}:{}\n".format(self.git_branch, self.git_commit)
+            git_cmd = ['commit-tree', tree, '-m', msg]
+            if parent:
+                git_cmd += ['-p', parent]
+            commit = repo.run_cmd(git_cmd, env_update)
+
+            # Update branch head
+            git_cmd = ['update-ref', 'refs/heads/' + branch, commit]
+            if parent:
+                git_cmd.append(parent)
+            repo.run_cmd(git_cmd)
+
+            # Update current HEAD, if we're on branch 'branch'
+            if repo.get_current_branch() == branch:
+                log.info("Updating %s HEAD to latest commit", repo_path)
+                repo.run_cmd('reset --hard')
+        finally:
+            if os.path.exists(tmp_index):
+                os.unlink(tmp_index)
+
+
 class BuildPerfTestCase(unittest.TestCase):
     """Base class for build performance tests"""
     SYSRES = 'sysres'
diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 21759c6..d6ea5ce 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -109,6 +109,9 @@ def parse_args(argv):
                         help="Output directory for test results")
     parser.add_argument('--run-tests', nargs='+', metavar='TEST',
                         help="List of tests to run")
+    parser.add_argument('--commit-results', metavar='GIT_DIR',
+                        type=os.path.abspath,
+                        help="Commit result data to a (local) git repository")
 
     return parser.parse_args(argv)
 
@@ -158,6 +161,8 @@ def main(argv=None):
     if result.wasSuccessful():
         if args.globalres_file:
             result.update_globalres_file(args.globalres_file)
+        if args.commit_results:
+            result.git_commit_results(args.commit_results)
         return 0
 
     return 1
-- 
2.6.6


