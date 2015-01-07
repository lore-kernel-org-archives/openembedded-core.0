Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CD5B565CDB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 16:00:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 07 Jan 2015 08:00:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,715,1413270000"; d="scan'208";a="665862033"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2015 08:00:44 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jan 2015 18:00:41 +0200
Message-Id: <1420646442-28948-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1420646442-28948-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1420646442-28948-1-git-send-email-markus.lehtonen@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v2 1/2] combo-layer: minor refactor
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
X-List-Received-Date: Wed, 07 Jan 2015 16:00:52 -0000

Change get_repos() to assume a list of repository names instead of full
list of command line arguments.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/combo-layer | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 19d64e6..37d1f47 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -305,18 +305,17 @@ def check_rev_branch(component, repodir, rev, branch):
         return False
     return True
 
-def get_repos(conf, args):
+def get_repos(conf, repo_names):
     repos = []
-    if len(args) > 1:
-        for arg in args[1:]:
-            if arg.startswith('-'):
-                break
-            else:
-                repos.append(arg)
-        for repo in repos:
-            if not repo in conf.repos:
-                logger.error("Specified component '%s' not found in configuration" % repo)
-                sys.exit(0)
+    for name in repo_names:
+        if name.startswith('-'):
+            break
+        else:
+            repos.append(name)
+    for repo in repos:
+        if not repo in conf.repos:
+            logger.error("Specified component '%s' not found in configuration" % repo)
+            sys.exit(0)
 
     if not repos:
         repos = conf.repos
@@ -327,7 +326,7 @@ def action_pull(conf, args):
     """
         update the component repos only
     """
-    repos = get_repos(conf, args)
+    repos = get_repos(conf, args[1:])
 
     # make sure all repos are clean
     for name in repos:
@@ -348,7 +347,7 @@ def action_update(conf, args):
         generate the patch list
         apply the generated patches
     """
-    repos = get_repos(conf, args)
+    repos = get_repos(conf, args[1:])
 
     # make sure combo repo is clean
     check_repo_clean(os.getcwd())
-- 
1.8.4.5


