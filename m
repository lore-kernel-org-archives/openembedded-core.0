Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 80C9C731BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:13:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 24 Aug 2016 00:13:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,569,1464678000"; d="scan'208";a="1040620622"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2016 00:13:18 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 10:12:57 +0300
Message-Id: <1472022789-13028-8-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 07/19] oeqa.buildperf: use term commit instead of revision
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

This is basically a internal change, at this point. Term 'commit' better
represents the data we actually have. Term 'revision' is more vague and
could be understood to point to a tag object, for example.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index adc3da3..0e77aae 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -96,30 +96,30 @@ class BuildPerfTestResult(unittest.TextTestResult):
             self.repo = GitRepo('.')
         except GitError:
             self.repo = None
-        self.git_revision, self.git_branch = self.get_git_revision()
+        self.git_commit, self.git_branch = self.get_git_revision()
         self.hostname = socket.gethostname()
         self.start_time = self.elapsed_time = None
         self.successes = []
-        log.info("Using Git branch:revision %s:%s", self.git_branch,
-                 self.git_revision)
+        log.info("Using Git branch:commit %s:%s", self.git_branch,
+                 self.git_commit)
 
     def get_git_revision(self):
-        """Get git branch and revision under testing"""
-        rev = os.getenv('OE_BUILDPERFTEST_GIT_REVISION')
+        """Get git branch and commit under testing"""
+        commit = os.getenv('OE_BUILDPERFTEST_GIT_COMMIT')
         branch = os.getenv('OE_BUILDPERFTEST_GIT_BRANCH')
-        if not self.repo and (not rev or not branch):
+        if not self.repo and (not commit or not branch):
             log.info("The current working directory doesn't seem to be a Git "
-                     "repository clone. You can specify branch and revision "
-                     "used in test results with OE_BUILDPERFTEST_GIT_REVISION "
-                     "and OE_BUILDPERFTEST_GIT_BRANCH environment variables")
+                     "repository clone. You can specify branch and commit "
+                     "displayed in test results with OE_BUILDPERFTEST_GIT_BRANCH "
+                     "and OE_BUILDPERFTEST_GIT_COMMIT environment variables")
         else:
-            if not rev:
-                rev = self.repo.rev_parse('HEAD')
+            if not commit:
+                commit = self.repo.rev_parse('HEAD^0')
             if not branch:
                 branch = self.repo.get_current_branch()
                 if not branch:
                     log.debug('Currently on detached HEAD')
-        return str(rev), str(branch)
+        return str(commit), str(branch)
 
     def addSuccess(self, test):
         """Record results from successful tests"""
@@ -165,9 +165,9 @@ class BuildPerfTestResult(unittest.TextTestResult):
                   'test4': ((7, 1), (10, 2))}
 
         if self.repo:
-            git_tag_rev = self.repo.run_cmd(['describe', self.git_revision])
+            git_tag_rev = self.repo.run_cmd(['describe', self.git_commit])
         else:
-            git_tag_rev = self.git_revision
+            git_tag_rev = self.git_commit
 
         values = ['0'] * 12
         for status, (test, msg) in self.all_results():
@@ -183,7 +183,7 @@ class BuildPerfTestResult(unittest.TextTestResult):
         with open(filename, 'a') as fobj:
             fobj.write('{},{}:{},{},'.format(self.hostname,
                                              self.git_branch,
-                                             self.git_revision,
+                                             self.git_commit,
                                              git_tag_rev))
             fobj.write(','.join(values) + '\n')
 
-- 
2.6.6


