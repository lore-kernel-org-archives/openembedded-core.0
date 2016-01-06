Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1DA87731E6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 11:17:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jan 2016 03:16:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,528,1444719600"; d="scan'208";a="875594457"
Received: from ngochun1-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.179])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2016 03:16:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 00:15:51 +1300
Message-Id: <9bf1f14cff6c71579742a6c46f74ec133872afa4.1452078721.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/14] devtool: reset: do clean for multiple recipes at once with -a
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
X-List-Received-Date: Wed, 06 Jan 2016 11:17:03 -0000

We need to run the clean for all recipes that are being reset before we
start deleting things from the workspace; if we don't, recipes providing
dependencies may be missing when we come to clean a recipe later (since
we don't and couldn't practically reset them in dependency order). This
also improves performance since we have the startup startup time for the
clean just once rather than for every recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index fbc49a9..741f0ea 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1196,21 +1196,24 @@ def reset(args, config, basepath, workspace):
         raise DevtoolError("Recipe must be specified, or specify -a/--all to "
                            "reset all recipes")
     if args.all:
-        recipes = workspace
+        recipes = workspace.keys()
     else:
         recipes = [args.recipename]
 
-    for pn in recipes:
-        if not args.no_clean:
-            logger.info('Cleaning sysroot for recipe %s...' % pn)
-            try:
-                exec_build_env_command(config.init_path, basepath, 'bitbake -c clean %s' % pn)
-            except bb.process.ExecutionError as e:
-                raise DevtoolError('Command \'%s\' failed, output:\n%s\nIf you '
-                                   'wish, you may specify -n/--no-clean to '
-                                   'skip running this command when resetting' %
-                                   (e.command, e.stdout))
+    if recipes and not args.no_clean:
+        if len(recipes) == 1:
+            logger.info('Cleaning sysroot for recipe %s...' % recipes[0])
+        else:
+            logger.info('Cleaning sysroot for recipes %s...' % ', '.join(recipes))
+        try:
+            exec_build_env_command(config.init_path, basepath, 'bitbake -c clean %s' % ' '.join(recipes))
+        except bb.process.ExecutionError as e:
+            raise DevtoolError('Command \'%s\' failed, output:\n%s\nIf you '
+                                'wish, you may specify -n/--no-clean to '
+                                'skip running this command when resetting' %
+                                (e.command, e.stdout))
 
+    for pn in recipes:
         _check_preserve(config, pn)
 
         preservepath = os.path.join(config.workspace_path, 'attic', pn)
-- 
2.5.0


