Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CC07A757AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:22:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:21:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="810520206"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.23])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 09:21:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 17:21:15 +0100
Message-Id: <40d0326d6ea38f66b3dae92052df84111bb35763.1442934838.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 01/27] lib/oe/recipeutils: properly split unexpanded variable values
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
X-List-Received-Date: Tue, 22 Sep 2015 16:22:12 -0000

Variables such as SRC_URI which are space-separated may also contain
Python expressions (${@...}) which themselves contain spaces that
shouldn't be split when splitting the value into items. In order to
ensure this we need to use a custom splitting function instead of just
string.split().

This issue could be seen when doing "devtool modify sudo", adding a
commit to the resulting source repository then "devtool update-recipe" -
the Python expression in SRC_URI was being unnecessarily broken onto
multiple lines.

Fixes [YOCTO #8046].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 61 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 59 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index d4fa726..190ac3a 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -95,6 +95,63 @@ def get_var_files(fn, varlist, d):
     return varfiles
 
 
+def split_var_value(value, assignment=True):
+    """
+    Split a space-separated variable's value into a list of items,
+    taking into account that some of the items might be made up of
+    expressions containing spaces that should not be split.
+    Parameters:
+        value:
+            The string value to split
+        assignment:
+            True to assume that the value represents an assignment
+            statement, False otherwise. If True, and an assignment
+            statement is passed in the first item in
+            the returned list will be the part of the assignment
+            statement up to and including the opening quote character,
+            and the last item will be the closing quote.
+    """
+    inexpr = 0
+    lastchar = None
+    out = []
+    buf = ''
+    for char in value:
+        if char == '{':
+            if lastchar == '$':
+                inexpr += 1
+        elif char == '}':
+            inexpr -= 1
+        elif assignment and char in '"\'' and inexpr == 0:
+            if buf:
+                out.append(buf)
+            out.append(char)
+            char = ''
+            buf = ''
+        elif char.isspace() and inexpr == 0:
+            char = ''
+            if buf:
+                out.append(buf)
+            buf = ''
+        buf += char
+        lastchar = char
+    if buf:
+        out.append(buf)
+
+    # Join together assignment statement and opening quote
+    outlist = out
+    if assignment:
+        assigfound = False
+        for idx, item in enumerate(out):
+            if '=' in item:
+                assigfound = True
+            if assigfound:
+                if '"' in item or "'" in item:
+                    outlist = [' '.join(out[:idx+1])]
+                    outlist.extend(out[idx+1:])
+                    break
+    return outlist
+
+
 def patch_recipe_file(fn, values, patch=False, relpath=''):
     """Update or insert variable values into a recipe file (assuming you
        have already identified the exact file you want to update.)
@@ -112,7 +169,7 @@ def patch_recipe_file(fn, values, patch=False, relpath=''):
             if name in nowrap_vars:
                 tf.write(rawtext)
             elif name in list_vars:
-                splitvalue = values[name].split()
+                splitvalue = split_var_value(values[name], assignment=False)
                 if len(splitvalue) > 1:
                     linesplit = ' \\\n' + (' ' * (len(name) + 4))
                     tf.write('%s = "%s%s"\n' % (name, linesplit.join(splitvalue), linesplit))
@@ -518,7 +575,7 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
                             instfunclines.append(line)
                     return (instfunclines, None, 4, False)
             else:
-                splitval = origvalue.split()
+                splitval = split_var_value(origvalue, assignment=False)
                 changed = False
                 removevar = varname
                 if varname in ['SRC_URI', 'SRC_URI_append%s' % appendoverride]:
-- 
2.1.0


