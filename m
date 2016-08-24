Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B45B9731C9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:13:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 24 Aug 2016 00:13:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,569,1464678000"; d="scan'208";a="1040620643"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2016 00:13:23 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 10:13:02 +0300
Message-Id: <1472022789-13028-13-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 12/19] oe-build-perf-test: tag results committed to Git
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
X-List-Received-Date: Wed, 24 Aug 2016 07:13:26 -0000

Create a Git tag when committing results to a Git repository. This patch
also implements --commit-results-tag command line option for controlling
the tag name. The value
is a format string where the following fields may be used:
- {git_branch} - target branch being tested
- {git_commit} - target commit being tested
- {tester_host} - hostname of the tester machine

Tagging can be disabled by giving an empty string to
--commit-results-tag. The option has no effect if --commit-results is
not defined.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 11 ++++++++++-
 scripts/oe-build-perf-test      |  6 +++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 119e6ed..a3cd3f3 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -188,7 +188,7 @@ class BuildPerfTestResult(unittest.TextTestResult):
             fobj.write(','.join(values) + '\n')
 
 
-    def git_commit_results(self, repo_path, branch=None):
+    def git_commit_results(self, repo_path, branch=None, tag=None):
         """Commit results into a Git repository"""
         repo = GitRepo(repo_path, is_topdir=True)
         if not branch:
@@ -223,6 +223,15 @@ class BuildPerfTestResult(unittest.TextTestResult):
             if repo.get_current_branch() == branch:
                 log.info("Updating %s HEAD to latest commit", repo_path)
                 repo.run_cmd('reset --hard')
+
+            # Create (annotated) tag
+            if tag:
+                # Replace keywords
+                tag = tag.format(git_branch=self.git_branch,
+                                 git_commit=self.git_commit,
+                                 tester_host=self.hostname)
+                repo.run_cmd(['tag', '-a', '-m', msg, tag, commit])
+
         finally:
             if os.path.exists(tmp_index):
                 os.unlink(tmp_index)
diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 437611c..1ed5bdb 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -139,6 +139,9 @@ def parse_args(argv):
     parser.add_argument('--commit-results-branch', metavar='BRANCH',
                         default="{git_branch}",
                         help="Commit results to branch BRANCH.")
+    parser.add_argument('--commit-results-tag', metavar='TAG',
+                        default="{git_branch}/{git_commit}",
+                        help="Tag results commit with TAG.")
 
     return parser.parse_args(argv)
 
@@ -193,7 +196,8 @@ def main(argv=None):
             result.update_globalres_file(args.globalres_file)
         if args.commit_results:
             result.git_commit_results(args.commit_results,
-                                      args.commit_results_branch)
+                                      args.commit_results_branch,
+                                      args.commit_results_tag)
         return 0
 
     return 1
-- 
2.6.6


