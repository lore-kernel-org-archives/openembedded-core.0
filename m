Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BB842767DC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 11:23:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 17 Aug 2015 04:23:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,694,1432623600"; d="scan'208";a="626925830"
Received: from jwanrooi-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.11.216])
	by orsmga003.jf.intel.com with ESMTP; 17 Aug 2015 04:23:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Aug 2015 12:23:06 +0100
Message-Id: <b9dae5dd8b94ed5eb6a5de156feaf5f5d6f5c705.1439810551.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1439810551.git.paul.eggleton@linux.intel.com>
References: <cover.1439810551.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1439810551.git.paul.eggleton@linux.intel.com>
References: <cover.1439810551.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] lib/oe/recipeutils: avoid parsing in get_var_files()
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
X-List-Received-Date: Mon, 17 Aug 2015 11:23:13 -0000

Let's have the caller do this and then the function is a bit more
flexible (e.g. we can choose to parse with bbappends or not); fix up
calls to this function appropriately (of which there are only two, both
within devtool).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py      | 3 +--
 scripts/lib/devtool/standard.py | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index cd74213..d4fa726 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -79,10 +79,9 @@ def get_var_files(fn, varlist, d):
     """Find the file in which each of a list of variables is set.
     Note: requires variable history to be enabled when parsing.
     """
-    envdata = parse_recipe(fn, [], d)
     varfiles = {}
     for v in varlist:
-        history = envdata.varhistory.variable(v)
+        history = d.varhistory.variable(v)
         files = []
         for event in history:
             if 'file' in event and not 'flag' in event:
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index e85e1ad..e1c5584 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -630,7 +630,7 @@ def _update_recipe_srcrev(args, srctree, rd, config_data):
                 rd, args.append, None, wildcardver=args.wildcard_version,
                 extralines=patchfields)
     else:
-        oe.recipeutils.patch_recipe(config_data, recipefile, patchfields)
+        oe.recipeutils.patch_recipe(rd, recipefile, patchfields)
 
     if not 'git://' in orig_src_uri:
         logger.info('You will need to update SRC_URI within the recipe to '
@@ -742,7 +742,7 @@ def _update_recipe_patch(args, config, srctree, rd, config_data):
                     updaterecipe = True
             if updaterecipe:
                 logger.info('Updating recipe %s' % os.path.basename(recipefile))
-                oe.recipeutils.patch_recipe(config_data, recipefile,
+                oe.recipeutils.patch_recipe(rd, recipefile,
                                             {'SRC_URI': ' '.join(srcuri)})
             elif not updatepatches:
                 # Neither patches nor recipe were updated
-- 
2.1.0


