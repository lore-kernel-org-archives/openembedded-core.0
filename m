Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC45731BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:13:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 24 Aug 2016 00:13:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,569,1464678000"; d="scan'208";a="1040620632"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2016 00:13:20 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 10:12:59 +0300
Message-Id: <1472022789-13028-10-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 09/19] oe-build-perf-test: implement --commit-results-branch
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

A new command line option for defining the branch where results are
commited. The value is actually a format string accepting two field
names:
- {git_branch} expands to the name of the target branch being tested
- {tester_host} expands to the hostname of the tester machine

The option has no effect if --commit-results is not used.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 5 +++++
 scripts/oe-build-perf-test      | 6 +++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 8f7d88c..119e6ed 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -193,6 +193,11 @@ class BuildPerfTestResult(unittest.TextTestResult):
         repo = GitRepo(repo_path, is_topdir=True)
         if not branch:
             branch = self.git_branch
+        else:
+            # Replace keywords
+            branch = branch.format(git_branch=self.git_branch,
+                                   tester_host=self.hostname)
+
         log.info("Committing test results into %s %s", repo_path, branch)
         tmp_index = os.path.join(repo_path, '.git', 'index.oe-build-perf')
         try:
diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index d6ea5ce..390e4c9 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -112,6 +112,9 @@ def parse_args(argv):
     parser.add_argument('--commit-results', metavar='GIT_DIR',
                         type=os.path.abspath,
                         help="Commit result data to a (local) git repository")
+    parser.add_argument('--commit-results-branch', metavar='BRANCH',
+                        default="{git_branch}",
+                        help="Commit results to branch BRANCH.")
 
     return parser.parse_args(argv)
 
@@ -162,7 +165,8 @@ def main(argv=None):
         if args.globalres_file:
             result.update_globalres_file(args.globalres_file)
         if args.commit_results:
-            result.git_commit_results(args.commit_results)
+            result.git_commit_results(args.commit_results,
+                                      args.commit_results_branch)
         return 0
 
     return 1
-- 
2.6.6


