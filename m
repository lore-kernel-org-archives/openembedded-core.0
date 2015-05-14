Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AD09A7415A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 17:45:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 May 2015 10:45:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,430,1427785200"; d="scan'208";a="694963944"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.30.48])
	by orsmga001.jf.intel.com with ESMTP; 14 May 2015 10:45:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2015 18:45:10 +0100
Message-Id: <be5b4101d6cfc222def87cabf67ff512ad6c5286.1431625238.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431625238.git.paul.eggleton@linux.intel.com>
References: <cover.1431625238.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1431625238.git.paul.eggleton@linux.intel.com>
References: <cover.1431625238.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/9] lib/oe/recipeutils: add a parse_recipe_simple() function
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
X-List-Received-Date: Thu, 14 May 2015 17:45:56 -0000

Add a function that simply parses a recipe by name and optionally the
bbappends that apply to it. (Note that if you're using tinfoil you need
to have initialised it with config_only=False so that it can map the
recipe name to a recipe file.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 19d97b6..0689fb0 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -44,13 +44,36 @@ def get_unavailable_reasons(cooker, pn):
     return taskdata.get_reasons(pn)
 
 
-def parse_recipe(fn, appends, d):
-    """Parse an individual recipe"""
+def parse_recipe(fn, appendfiles, d):
+    """
+    Parse an individual recipe file, optionally with a list of
+    bbappend files.
+    """
     import bb.cache
-    envdata = bb.cache.Cache.loadDataFull(fn, appends, d)
+    envdata = bb.cache.Cache.loadDataFull(fn, appendfiles, d)
     return envdata
 
 
+def parse_recipe_simple(cooker, pn, d, appends=True):
+    """
+    Parse a recipe and optionally all bbappends that apply to it
+    in the current configuration.
+    """
+    import bb.providers
+
+    recipefile = pn_to_recipe(cooker, pn)
+    if not recipefile:
+        skipreasons = get_unavailable_reasons(cooker, pn)
+        # We may as well re-use bb.providers.NoProvider here
+        if skipreasons:
+            raise bb.providers.NoProvider(skipreasons)
+        else:
+            raise bb.providers.NoProvider('Unable to find any recipe file matching %s' % pn)
+    if appends:
+        appendfiles = cooker.collection.get_file_appends(recipefile)
+    return parse_recipe(recipefile, appendfiles, d)
+
+
 def get_var_files(fn, varlist, d):
     """Find the file in which each of a list of variables is set.
     Note: requires variable history to be enabled when parsing.
-- 
2.1.0


