Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DAD797238C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 14:58:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 27 Nov 2014 06:58:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="422309879"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Nov 2014 06:49:03 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Nov 2014 16:58:56 +0200
Message-Id: <1417100336-16766-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
MIME-Version: 1.0
Subject: [PATCH] combo-layer: support updating up to arbitrary commit
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
X-List-Received-Date: Thu, 27 Nov 2014 14:58:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Support defining the top commit up to which to update. In other words,
this makes it possible to update up to certain point other than the
branch head. The update point (git commitish) is given on the command
line by appending the component name(s) with a colon and the commitish,
e.g.
 $ combo-layer update my_component:sha1

Only the "update" action supports this.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/combo-layer | 45 +++++++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 19d64e6..2f618bf 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -26,6 +26,7 @@ import logging
 import subprocess
 import ConfigParser
 import re
+from collections import OrderedDict
 
 __version__ = "0.2.1"
 
@@ -305,18 +306,17 @@ def check_rev_branch(component, repodir, rev, branch):
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
@@ -327,7 +327,7 @@ def action_pull(conf, args):
     """
         update the component repos only
     """
-    repos = get_repos(conf, args)
+    repos = get_repos(conf, args[1:])
 
     # make sure all repos are clean
     for name in repos:
@@ -348,7 +348,13 @@ def action_update(conf, args):
         generate the patch list
         apply the generated patches
     """
-    repos = get_repos(conf, args)
+    components = [arg.split(':')[0] for arg in args[1:]]
+    revisions = []
+    for arg in args[1:]:
+        revision= arg.split(':', 1)[1] if ':' in arg else None
+        revisions.append(revision)
+    # Map commitishes to repos
+    repos = OrderedDict(zip(get_repos(conf, components), revisions))
 
     # make sure combo repo is clean
     check_repo_clean(os.getcwd())
@@ -362,9 +368,9 @@ def action_update(conf, args):
     if conf.nopull:
         logger.info("Skipping pull (-n)")
     else:
-        action_pull(conf, args)
+        action_pull(conf, components)
 
-    for name in repos:
+    for name, revision in repos.iteritems():
         repo = conf.repos[name]
         ldir = repo['local_repo_dir']
         dest_dir = repo['dest_dir']
@@ -373,18 +379,21 @@ def action_update(conf, args):
 
         # Step 2: generate the patch list and store to patch dir
         logger.info("Generating patches from %s..." % name)
+        top_revision = revision or branch
+        if not check_rev_branch(name, ldir, top_revision, branch):
+            sys.exit(1)
         if dest_dir != ".":
             prefix = "--src-prefix=a/%s/ --dst-prefix=b/%s/" % (dest_dir, dest_dir)
         else:
             prefix = ""
         if repo['last_revision'] == "":
             logger.info("Warning: last_revision of component %s is not set, starting from the first commit" % name)
-            patch_cmd_range = "--root %s" % branch
-            rev_cmd_range = branch
+            patch_cmd_range = "--root %s" % top_revision
+            rev_cmd_range = top_revision
         else:
             if not check_rev_branch(name, ldir, repo['last_revision'], branch):
                 sys.exit(1)
-            patch_cmd_range = "%s..%s" % (repo['last_revision'], branch)
+            patch_cmd_range = "%s..%s" % (repo['last_revision'], top_revision)
             rev_cmd_range = patch_cmd_range
 
         file_filter = repo.get('file_filter',"")
-- 
1.8.4.5


