Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 15DDE7319C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2016 23:08:42 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 10 Jul 2016 16:08:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,343,1464678000"; d="scan'208";a="732288693"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.164.140])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Jul 2016 16:08:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2016 11:07:54 +1200
Message-Id: <09cc9bd05347b1472216b80916fa9687c7963dc9.1468191874.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1468191874.git.paul.eggleton@linux.intel.com>
References: <cover.1468191874.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1468191874.git.paul.eggleton@linux.intel.com>
References: <cover.1468191874.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 4/7] devtool: update-recipe: fix --initial-rev option
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
X-List-Received-Date: Sun, 10 Jul 2016 23:08:42 -0000

In OE-Core revision 7baf57ad896112cf2258b3e2c2a1f8b756fb39bc I changed
the default update-recipe behaviour to only update patches for commits
that were changed; unfortunately I failed to handle the --initial-rev
option which was broken after that point. Rework how the initial
revision is passed in so that it now operates correctly.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 737ecc1..a7e365f 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -815,22 +815,19 @@ def modify(args, config, basepath, workspace):
 
     return 0
 
-def _get_patchset_revs(args, srctree, recipe_path):
+def _get_patchset_revs(srctree, recipe_path, initial_rev=None):
     """Get initial and update rev of a recipe. These are the start point of the
     whole patchset and start point for the patches to be re-generated/updated.
     """
     import bb
 
-    if args.initial_rev:
-        return args.initial_rev, args.initial_rev
-
-    # Parse initial rev from recipe
+    # Parse initial rev from recipe if not specified
     commits = []
-    initial_rev = None
     with open(recipe_path, 'r') as f:
         for line in f:
             if line.startswith('# initial_rev:'):
-                initial_rev = line.split(':')[-1].strip()
+                if not initial_rev:
+                    initial_rev = line.split(':')[-1].strip()
             elif line.startswith('# commit:'):
                 commits.append(line.split(':')[-1].strip())
 
@@ -1129,7 +1126,7 @@ def _update_recipe_patch(args, config, workspace, srctree, rd, config_data):
         raise DevtoolError('unable to find workspace bbappend for recipe %s' %
                            args.recipename)
 
-    initial_rev, update_rev, changed_revs = _get_patchset_revs(args, srctree, append)
+    initial_rev, update_rev, changed_revs = _get_patchset_revs(srctree, append, args.initial_rev)
     if not initial_rev:
         raise DevtoolError('Unable to find initial revision - please specify '
                            'it with --initial-rev')
-- 
2.5.5


