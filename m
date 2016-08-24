Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 643C2731BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:13:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 24 Aug 2016 00:13:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,569,1464678000"; d="scan'208";a="1040620609"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2016 00:13:16 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 10:12:55 +0300
Message-Id: <1472022789-13028-6-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 05/19] oeqa.utils.git: implement GitRepo.get_current_branch()
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
 meta/lib/oeqa/buildperf/base.py | 7 ++-----
 meta/lib/oeqa/utils/git.py      | 8 ++++++++
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 6a8d9fe..adc3da3 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -116,12 +116,9 @@ class BuildPerfTestResult(unittest.TextTestResult):
             if not rev:
                 rev = self.repo.rev_parse('HEAD')
             if not branch:
-                try:
-                    # Strip 11 chars, i.e. 'refs/heads' from the beginning
-                    branch = self.repo.run_cmd(['symbolic-ref', 'HEAD'])[11:]
-                except GitError:
+                branch = self.repo.get_current_branch()
+                if not branch:
                     log.debug('Currently on detached HEAD')
-                    branch = None
         return str(rev), str(branch)
 
     def addSuccess(self, test):
diff --git a/meta/lib/oeqa/utils/git.py b/meta/lib/oeqa/utils/git.py
index 6474654..0fc8112 100644
--- a/meta/lib/oeqa/utils/git.py
+++ b/meta/lib/oeqa/utils/git.py
@@ -46,4 +46,12 @@ class GitRepo(object):
             # Revision does not exist
             return None
 
+    def get_current_branch(self):
+        """Get current branch"""
+        try:
+            # Strip 11 chars, i.e. 'refs/heads' from the beginning
+            return self.run_cmd(['symbolic-ref', 'HEAD'])[11:]
+        except GitError:
+            return None
+
 
-- 
2.6.6


