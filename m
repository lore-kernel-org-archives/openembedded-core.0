Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1E90B731C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:13:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 24 Aug 2016 00:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,569,1464678000"; d="scan'208";a="1040620652"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2016 00:13:26 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 10:13:04 +0300
Message-Id: <1472022789-13028-15-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 14/19] oeqa.buildperf: add git commit count to result data
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
X-List-Received-Date: Wed, 24 Aug 2016 07:13:36 -0000

This number represents the number of commits since the beginning of git
history until the tested revision. This helps e.g. in ordering results.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index faa30c7..f29c167 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -96,30 +96,34 @@ class BuildPerfTestResult(unittest.TextTestResult):
             self.repo = GitRepo('.')
         except GitError:
             self.repo = None
-        self.git_commit, self.git_branch = self.get_git_revision()
+        self.git_commit, self.git_commit_count, self.git_branch = \
+                self.get_git_revision()
         self.hostname = socket.gethostname()
         self.start_time = self.elapsed_time = None
         self.successes = []
-        log.info("Using Git branch:commit %s:%s", self.git_branch,
-                 self.git_commit)
+        log.info("Using Git branch:commit %s:%s (%s)", self.git_branch,
+                 self.git_commit, self.git_commit_count)
 
     def get_git_revision(self):
         """Get git branch and commit under testing"""
         commit = os.getenv('OE_BUILDPERFTEST_GIT_COMMIT')
+        commit_cnt = os.getenv('OE_BUILDPERFTEST_GIT_COMMIT_COUNT')
         branch = os.getenv('OE_BUILDPERFTEST_GIT_BRANCH')
-        if not self.repo and (not commit or not branch):
+        if not self.repo and (not commit or not commit_cnt or not branch):
             log.info("The current working directory doesn't seem to be a Git "
                      "repository clone. You can specify branch and commit "
-                     "displayed in test results with OE_BUILDPERFTEST_GIT_BRANCH "
-                     "and OE_BUILDPERFTEST_GIT_COMMIT environment variables")
+                     "displayed in test results with OE_BUILDPERFTEST_GIT_BRANCH, "
+                     "OE_BUILDPERFTEST_GIT_COMMIT and "
+                     "OE_BUILDPERFTEST_GIT_COMMIT_COUNT environment variables")
         else:
             if not commit:
                 commit = self.repo.rev_parse('HEAD^0')
+                commit_cnt = self.repo.run_cmd(['rev-list', '--count', 'HEAD^0'])
             if not branch:
                 branch = self.repo.get_current_branch()
                 if not branch:
                     log.debug('Currently on detached HEAD')
-        return str(commit), str(branch)
+        return str(commit), str(commit_cnt), str(branch)
 
     def addSuccess(self, test):
         """Record results from successful tests"""
-- 
2.6.6


