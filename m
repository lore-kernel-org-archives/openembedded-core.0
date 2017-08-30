Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C6F1478371
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 23:55:11 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Aug 2017 16:55:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,450,1498546800"; d="scan'208";a="146494466"
Received: from ekooi-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.249])
	by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2017 16:55:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Aug 2017 11:54:09 +1200
Message-Id: <429f3568136772dc984473000448caac387b4e58.1504137086.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1504137086.git.paul.eggleton@linux.intel.com>
References: <cover.1504137086.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 05/13] devtool: edit-recipe: fix regression
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
X-List-Received-Date: Wed, 30 Aug 2017 23:55:11 -0000

OE-Core commit 5a16b3c804c5eca331a1c08a7ce31a54909af105 attempted to use
the same function to get the path to a recipe as the new "find-recipe"
command it implemented, except that cannot work because (a) it didn't
return anything and (b) event if it had tried, a command function can
only return an exit code and we don't want that for find-recipe if it
succeeded. Split out a separate reusable function for both commands.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/utilcmds.py | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/utilcmds.py b/scripts/lib/devtool/utilcmds.py
index c8cb760..b745116 100644
--- a/scripts/lib/devtool/utilcmds.py
+++ b/scripts/lib/devtool/utilcmds.py
@@ -30,14 +30,13 @@ from devtool import parse_recipe
 
 logger = logging.getLogger('devtool')
 
-def find_recipe(args, config, basepath, workspace):
-    """Entry point for the devtool 'find-recipe' subcommand"""
+def _find_recipe_path(args, config, basepath, workspace):
     if args.any_recipe:
         tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
         try:
             rd = parse_recipe(config, tinfoil, args.recipename, True)
             if not rd:
-                return 1
+                raise DevtoolError("Failed to find specified recipe")
             recipefile = rd.getVar('FILE')
         finally:
             tinfoil.shutdown()
@@ -47,11 +46,19 @@ def find_recipe(args, config, basepath, workspace):
         if not recipefile:
             raise DevtoolError("Recipe file for %s is not under the workspace" %
                                args.recipename)
+    return recipefile
+
+
+def find_recipe(args, config, basepath, workspace):
+    """Entry point for the devtool 'find-recipe' subcommand"""
+    recipefile = _find_recipe_path(args, config, basepath, workspace)
+    print(recipefile)
+    return 0
 
 
 def edit_recipe(args, config, basepath, workspace):
     """Entry point for the devtool 'edit-recipe' subcommand"""
-    return scriptutils.run_editor(find_recipe(args, config, basepath, workspace), logger)
+    return scriptutils.run_editor(_find_recipe_path(args, config, basepath, workspace), logger)
 
 
 def configure_help(args, config, basepath, workspace):
-- 
2.9.5


