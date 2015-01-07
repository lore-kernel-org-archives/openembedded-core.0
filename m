Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CF976728C9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 16:00:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 07 Jan 2015 08:00:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,715,1413270000"; d="scan'208";a="665862058"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2015 08:00:46 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jan 2015 18:00:42 +0200
Message-Id: <1420646442-28948-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1420646442-28948-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1420646442-28948-1-git-send-email-markus.lehtonen@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v2 2/2] combo-layer: support updating up to arbitrary commit
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
 scripts/combo-layer | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 37d1f47..851003d 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -26,6 +26,7 @@ import logging
 import subprocess
 import ConfigParser
 import re
+from collections import OrderedDict
 
 __version__ = "0.2.1"
 
@@ -347,7 +348,13 @@ def action_update(conf, args):
         generate the patch list
         apply the generated patches
     """
-    repos = get_repos(conf, args[1:])
+    components = [arg.split(':')[0] for arg in args[1:]]
+    revisions = []
+    for arg in args[1:]:
+        revision= arg.split(':', 1)[1] if ':' in arg else None
+        revisions.append(revision)
+    # Map commitishes to repos
+    repos = OrderedDict(zip(get_repos(conf, components), revisions))
 
     # make sure combo repo is clean
     check_repo_clean(os.getcwd())
@@ -361,9 +368,9 @@ def action_update(conf, args):
     if conf.nopull:
         logger.info("Skipping pull (-n)")
     else:
-        action_pull(conf, args)
+        action_pull(conf, ['arg0'] + components)
 
-    for name in repos:
+    for name, revision in repos.iteritems():
         repo = conf.repos[name]
         ldir = repo['local_repo_dir']
         dest_dir = repo['dest_dir']
@@ -372,18 +379,21 @@ def action_update(conf, args):
 
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


