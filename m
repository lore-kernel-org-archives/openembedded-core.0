Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3E2731D0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 May 2016 22:21:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 29 May 2016 15:21:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,386,1459839600"; d="scan'208";a="976886709"
Received: from jialelim-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.83])
	by fmsmga001.fm.intel.com with ESMTP; 29 May 2016 15:21:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 May 2016 10:20:56 +1200
Message-Id: <142712e0682b7b6b92a4d15199677370e453df25.1464560316.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1464560316.git.paul.eggleton@linux.intel.com>
References: <cover.1464560316.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1464560316.git.paul.eggleton@linux.intel.com>
References: <cover.1464560316.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/7] lib/oe/recipeutils: split out patch_recipe_lines()
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
X-List-Received-Date: Sun, 29 May 2016 22:21:29 -0000

Split out a function from patch_recipe_file() that takes just the lines
as input so we can edit recipe lines in memory. This will be used within
recipetool to ensure we insert new values in the right place.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 6c7adb5..ef82755 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -158,9 +158,8 @@ def split_var_value(value, assignment=True):
     return outlist
 
 
-def patch_recipe_file(fn, values, patch=False, relpath=''):
-    """Update or insert variable values into a recipe file (assuming you
-       have already identified the exact file you want to update.)
+def patch_recipe_lines(fromlines, values):
+    """Update or insert variable values into lines from a recipe.
        Note that some manual inspection/intervention may be required
        since this cannot handle all situations.
     """
@@ -247,8 +246,7 @@ def patch_recipe_file(fn, values, patch=False, relpath=''):
 
     # First run - establish which values we want to set are already in the file
     varlist = [re.escape(item) for item in values.keys()]
-    with open(fn, 'r') as f:
-        changed, fromlines = bb.utils.edit_metadata(f, varlist, patch_recipe_varfunc)
+    bb.utils.edit_metadata(fromlines, varlist, patch_recipe_varfunc)
     # Second run - actually set everything
     modifying = True
     varlist.extend(recipe_progression_restrs)
@@ -260,6 +258,21 @@ def patch_recipe_file(fn, values, patch=False, relpath=''):
         for k in remainingnames.keys():
             outputvalue(k, tolines)
 
+    return changed, tolines
+
+
+def patch_recipe_file(fn, values, patch=False, relpath=''):
+    """Update or insert variable values into a recipe file (assuming you
+       have already identified the exact file you want to update.)
+       Note that some manual inspection/intervention may be required
+       since this cannot handle all situations.
+    """
+
+    with open(fn, 'r') as f:
+        fromlines = f.readlines()
+
+    _, tolines = patch_recipe_lines(fromlines, values)
+
     if patch:
         relfn = os.path.relpath(fn, relpath)
         diff = difflib.unified_diff(fromlines, tolines, 'a/%s' % relfn, 'b/%s' % relfn)
-- 
2.5.5


