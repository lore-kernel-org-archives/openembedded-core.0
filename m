Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 022F97711B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 May 2016 22:21:31 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 29 May 2016 15:21:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,386,1459839600"; d="scan'208";a="976886714"
Received: from jialelim-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.83])
	by fmsmga001.fm.intel.com with ESMTP; 29 May 2016 15:21:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 May 2016 10:20:57 +1200
Message-Id: <b61b85fc47b18f125dcf8da1bcd7e6cf6f51185e.1464560316.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1464560316.git.paul.eggleton@linux.intel.com>
References: <cover.1464560316.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1464560316.git.paul.eggleton@linux.intel.com>
References: <cover.1464560316.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/7] lib/oe/recipeutils: patch_recipe_lines: allow omitting trailing newlines
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
X-List-Received-Date: Sun, 29 May 2016 22:21:32 -0000

This function was assuming that what you wanted was that output lines
had trailing newline characters. If you're just outputting each line
verbatim to a text file then that's fine, but sometimes you start with
the assumption that the lines don't have trailing newlines; thus we
shouldn't allow for the possibility that the caller doesn't want them
and add a parameter to control it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index ef82755..b9f6ada 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -158,7 +158,7 @@ def split_var_value(value, assignment=True):
     return outlist
 
 
-def patch_recipe_lines(fromlines, values):
+def patch_recipe_lines(fromlines, values, trailing_newline=True):
     """Update or insert variable values into lines from a recipe.
        Note that some manual inspection/intervention may be required
        since this cannot handle all situations.
@@ -166,6 +166,11 @@ def patch_recipe_lines(fromlines, values):
 
     import bb.utils
 
+    if trailing_newline:
+        newline = '\n'
+    else:
+        newline = ''
+
     recipe_progression_res = []
     recipe_progression_restrs = []
     for item in recipe_progression:
@@ -196,7 +201,7 @@ def patch_recipe_lines(fromlines, values):
     def outputvalue(name, lines, rewindcomments=False):
         if values[name] is None:
             return
-        rawtext = '%s = "%s"\n' % (name, values[name])
+        rawtext = '%s = "%s"%s' % (name, values[name], newline)
         addlines = []
         if name in nowrap_vars:
             addlines.append(rawtext)
@@ -204,19 +209,19 @@ def patch_recipe_lines(fromlines, values):
             splitvalue = split_var_value(values[name], assignment=False)
             if len(splitvalue) > 1:
                 linesplit = ' \\\n' + (' ' * (len(name) + 4))
-                addlines.append('%s = "%s%s"\n' % (name, linesplit.join(splitvalue), linesplit))
+                addlines.append('%s = "%s%s"%s' % (name, linesplit.join(splitvalue), linesplit, newline))
             else:
                 addlines.append(rawtext)
         else:
             wrapped = textwrap.wrap(rawtext)
             for wrapline in wrapped[:-1]:
-                addlines.append('%s \\\n' % wrapline)
-            addlines.append('%s\n' % wrapped[-1])
+                addlines.append('%s \\%s' % (wrapline, newline))
+            addlines.append('%s%s' % (wrapped[-1], newline))
         if rewindcomments:
             # Ensure we insert the lines before any leading comments
             # (that we'd want to ensure remain leading the next value)
             for i, ln in reversed(list(enumerate(lines))):
-                if ln[0] != '#':
+                if not ln.startswith('#'):
                     lines[i+1:i+1] = addlines
                     break
             else:
-- 
2.5.5


