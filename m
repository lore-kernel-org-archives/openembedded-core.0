Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2FA63731BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:13:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 24 Aug 2016 00:13:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,569,1464678000"; d="scan'208";a="1040620607"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2016 00:13:15 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 10:12:54 +0300
Message-Id: <1472022789-13028-5-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 04/19] oeqa.utils.git: introduce GitRepo.rev_parse()
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

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 2 +-
 meta/lib/oeqa/utils/git.py      | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 30b8e47..6a8d9fe 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -114,7 +114,7 @@ class BuildPerfTestResult(unittest.TextTestResult):
                      "and OE_BUILDPERFTEST_GIT_BRANCH environment variables")
         else:
             if not rev:
-                rev = self.repo.run_cmd(['rev-parse', 'HEAD'])
+                rev = self.repo.rev_parse('HEAD')
             if not branch:
                 try:
                     # Strip 11 chars, i.e. 'refs/heads' from the beginning
diff --git a/meta/lib/oeqa/utils/git.py b/meta/lib/oeqa/utils/git.py
index 6a2987f..6474654 100644
--- a/meta/lib/oeqa/utils/git.py
+++ b/meta/lib/oeqa/utils/git.py
@@ -38,5 +38,12 @@ class GitRepo(object):
             env.update(env_update)
         return self._run_git_cmd_at(git_args, self.top_dir, env=env)
 
+    def rev_parse(self, revision):
+        """Do git rev-parse"""
+        try:
+            return self.run_cmd(['rev-parse', revision])
+        except GitError:
+            # Revision does not exist
+            return None
 
 
-- 
2.6.6


