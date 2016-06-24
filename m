Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EA7E5731E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:38:17 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:38:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410447"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:38:17 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:37 +0300
Message-Id: <1466764661-24544-25-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 24/28] oeqa.buildperf: add git revision and branch to result data
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
X-List-Received-Date: Fri, 24 Jun 2016 10:38:18 -0000

BuildPerfTestRunner determines these from the Git repository under which
it is being run (i.e. where the build directory exists). The branch and
revision may be defined/overridden with OE_BUILDPERFTEST_GIT_BRANCH
and OE_BUILDPERFTEST_GIT_BRANCH environment variables, if needed. This
makes it possible to run the build performance test script even if the
top directory is not a git repository clone, for example.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index c0318a1..e10cbf4 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -22,6 +22,7 @@ import traceback
 from datetime import datetime, timedelta
 
 from oeqa.utils.commands import runCmd, get_bb_vars
+from oeqa.utils.git import GitError, GitRepo
 
 # Get logger for this module
 log = logging.getLogger('build-perf')
@@ -85,10 +86,41 @@ class BuildPerfTestRunner(object):
         if not os.path.exists(self.out_dir):
             os.makedirs(self.out_dir)
 
+        # Get Git parameters
+        try:
+            self.repo = GitRepo('.')
+        except GitError:
+            self.repo = None
+        self.git_rev, self.git_branch = self.get_git_revision()
+        log.info("Using Git branch:revision %s:%s", self.git_branch,
+                 self.git_rev)
+
+    def get_git_revision(self):
+        """Get git branch and revision under testing"""
+        rev = os.getenv('OE_BUILDPERFTEST_GIT_REVISION')
+        branch = os.getenv('OE_BUILDPERFTEST_GIT_BRANCH')
+        if not self.repo and (not rev or not branch):
+            log.info("The current working directory doesn't seem to be a Git "
+                     "repository clone. You can specify branch and revision "
+                     "used in test results with OE_BUILDPERFTEST_GIT_REVISION "
+                     "and OE_BUILDPERFTEST_GIT_BRANCH environment variables")
+        else:
+            if not rev:
+                rev = self.repo.run_cmd(['rev-parse', 'HEAD'])
+            if not branch:
+                try:
+                    # Strip 11 chars, i.e. 'refs/heads' from the beginning
+                    branch = self.repo.run_cmd(['symbolic-ref', 'HEAD'])[11:]
+                except GitError:
+                    log.debug('Currently on detached HEAD')
+                    branch = None
+        return str(rev), str(branch)
 
     def run_tests(self):
         """Method that actually runs the tests"""
         self.results['schema_version'] = 1
+        self.results['git_revision'] = self.git_rev
+        self.results['git_branch'] = self.git_branch
         self.results['tester_host'] = socket.gethostname()
         start_time = datetime.utcnow()
         self.results['start_time'] = start_time
-- 
2.6.6


