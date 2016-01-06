Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B48B3731EE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 11:17:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jan 2016 03:17:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,528,1444719600"; d="scan'208";a="875594547"
Received: from ngochun1-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.179])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2016 03:17:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 00:15:53 +1300
Message-Id: <fff5573c4feba4a957df536db4a4732445680f0e.1452078721.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 12/14] devtool: refactor code for getting local recipe file
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
X-List-Received-Date: Wed, 06 Jan 2016 11:17:04 -0000

We're doing this in a couple of places, let's just find the recipe file
if it exists within the workspace (which it will if it's been added
through "devtool add") when we read in the workspace.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/devtool                 | 12 +++++++++++-
 scripts/lib/devtool/standard.py | 19 ++++---------------
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index bda05e1..2d57da0b 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -112,8 +112,18 @@ def read_workspace():
                 res = externalsrc_re.match(line.rstrip())
                 if res:
                     pn = res.group(2) or os.path.splitext(os.path.basename(fn))[0].split('_')[0]
+                    # Find the recipe file within the workspace, if any
+                    bbfile = os.path.basename(fn).replace('.bbappend', '.bb').replace('%', '*')
+                    recipefile = glob.glob(os.path.join(config.workspace_path,
+                                                        'recipes',
+                                                        pn,
+                                                        bbfile))
+                    if recipefile:
+                        recipefile = recipefile[0]
                     workspace[pn] = {'srctree': res.group(3),
-                                     'bbappend': fn}
+                                     'bbappend': fn,
+                                     'recipefile': recipefile}
+                    logger.debug('Found recipe %s' % workspace[pn])
 
 def create_workspace(args, config, basepath, workspace):
     if args.layerpath:
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 7ef0ab8..e26ce5a 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1171,13 +1171,9 @@ def status(args, config, basepath, workspace):
     """Entry point for the devtool 'status' subcommand"""
     if workspace:
         for recipe, value in workspace.iteritems():
-            bbfile = os.path.basename(value['bbappend']).replace('.bbappend', '.bb').replace('%', '*')
-            recipefile = glob.glob(os.path.join(config.workspace_path,
-                                                'recipes',
-                                                recipe,
-                                                bbfile))
+            recipefile = value['recipefile']
             if recipefile:
-                recipestr = ' (%s)' % recipefile[0]
+                recipestr = ' (%s)' % recipefile
             else:
                 recipestr = ''
             print("%s: %s%s" % (recipe, value['srctree'], recipestr))
@@ -1261,15 +1257,8 @@ def edit_recipe(args, config, basepath, workspace):
             tinfoil.shutdown()
     else:
         check_workspace_recipe(workspace, args.recipename)
-        bbappend = workspace[args.recipename]['bbappend']
-        bbfile = os.path.basename(bbappend).replace('.bbappend', '.bb').replace('%', '*')
-        recipefile = glob.glob(os.path.join(config.workspace_path,
-                                            'recipes',
-                                            args.recipename,
-                                            bbfile))
-        if recipefile:
-            recipefile = recipefile[0]
-        else:
+        recipefile = workspace[args.recipename]['recipefile']
+        if not recipefile:
             raise DevtoolError("Recipe file for %s is not under the workspace" %
                                args.recipename)
 
-- 
2.5.0


