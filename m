Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 69AA96D13A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 04:16:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2018 20:16:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,289,1539673200"; d="scan'208";a="96057602"
Received: from thivuong-mobl.ccr.corp.intel.com (HELO localhost.localdomain)
	([10.255.138.218])
	by orsmga008.jf.intel.com with ESMTP; 27 Nov 2018 20:16:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2018 17:16:14 +1300
Message-Id: <354e32f2dd673d5a9f6146f76788a3cbcee9f246.1543378296.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.1543378296.git.paul.eggleton@linux.intel.com>
References: <cover.1543378296.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] lib/oe/recipeutils: patch_recipe(): fix handling of values across includes/classes
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
X-List-Received-Date: Wed, 28 Nov 2018 04:16:31 -0000

If we were setting a variable and part of the variable's value was being
set in a class or a .inc file, we were still just setting the value
outright on the assumption that it was too hard to do otherwise. With
some careful use of the variable history we can do better for certain
situations i.e. when the recipe does not currently set the value
outright.

Additionally, correctly remove _appends for variables we are changing if
we're trying to remove the value added in the _append.

Fixes [YOCTO #12623] and partially fixes [YOCTO #9360].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 71 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 68 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index aa64553c06b..9de291f5b59 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -52,6 +52,29 @@ def parse_recipe(cooker, fn, appendfiles):
     return envdata
 
 
+def simplify_history(history, d):
+    """
+    Eliminate any irrelevant events from a variable history
+    """
+    ret_history = []
+    has_set = False
+    # Go backwards through the history and remove any immediate operations
+    # before the most recent set
+    for event in reversed(history):
+        if 'flag' in event or not 'file' in event:
+            continue
+        if event['op'] == 'set':
+            if has_set:
+                continue
+            has_set = True
+        elif event['op'] in ('append', 'prepend', 'postdot', 'predot'):
+            # Reminder: "append" and "prepend" mean += and =+ respectively, NOT _append / _prepend
+            if has_set:
+                continue
+        ret_history.insert(0, event)
+    return ret_history
+
+
 def get_var_files(fn, varlist, d):
     """Find the file in which each of a list of variables is set.
     Note: requires variable history to be enabled when parsing.
@@ -176,7 +199,14 @@ def patch_recipe_lines(fromlines, values, trailing_newline=True):
     def outputvalue(name, lines, rewindcomments=False):
         if values[name] is None:
             return
-        rawtext = '%s = "%s"%s' % (name, values[name], newline)
+        if isinstance(values[name], tuple):
+            op, value = values[name]
+            if op == '+=' and value.strip() == '':
+                return
+        else:
+            value = values[name]
+            op = '='
+        rawtext = '%s %s "%s"%s' % (name, op, value, newline)
         addlines = []
         nowrap = False
         for nowrap_re in nowrap_vars_res:
@@ -186,10 +216,10 @@ def patch_recipe_lines(fromlines, values, trailing_newline=True):
         if nowrap:
             addlines.append(rawtext)
         elif name in list_vars:
-            splitvalue = split_var_value(values[name], assignment=False)
+            splitvalue = split_var_value(value, assignment=False)
             if len(splitvalue) > 1:
                 linesplit = ' \\\n' + (' ' * (len(name) + 4))
-                addlines.append('%s = "%s%s"%s' % (name, linesplit.join(splitvalue), linesplit, newline))
+                addlines.append('%s %s "%s%s"%s' % (name, op, linesplit.join(splitvalue), linesplit, newline))
             else:
                 addlines.append(rawtext)
         else:
@@ -321,12 +351,47 @@ def patch_recipe(d, fn, varvalues, patch=False, relpath='', redirect_output=None
     """Modify a list of variable values in the specified recipe. Handles inc files if
     used by the recipe.
     """
+    overrides = d.getVar('OVERRIDES').split(':')
+    def override_applicable(hevent):
+        op = hevent['op']
+        if '[' in op:
+            opoverrides = op.split('[')[1].split(']')[0].split('_')
+            for opoverride in opoverrides:
+                if not opoverride in overrides:
+                    return False
+        return True
+
     varlist = varvalues.keys()
+    fn = os.path.abspath(fn)
     varfiles = get_var_files(fn, varlist, d)
     locs = localise_file_vars(fn, varfiles, varlist)
     patches = []
     for f,v in locs.items():
         vals = {k: varvalues[k] for k in v}
+        f = os.path.abspath(f)
+        if f == fn:
+            extravals = {}
+            for var, value in vals.items():
+                if var in list_vars:
+                    history = simplify_history(d.varhistory.variable(var), d)
+                    recipe_set = False
+                    for event in history:
+                        if os.path.abspath(event['file']) == fn:
+                            if event['op'] == 'set':
+                                recipe_set = True
+                    if not recipe_set:
+                        for event in history:
+                            if event['op'].startswith('_remove'):
+                                continue
+                            if not override_applicable(event):
+                                continue
+                            newvalue = value.replace(event['detail'], '')
+                            if newvalue == value and os.path.abspath(event['file']) == fn and event['op'].startswith('_'):
+                                op = event['op'].replace('[', '_').replace(']', '')
+                                extravals[var + op] = None
+                            value = newvalue
+                            vals[var] = ('+=', value)
+            vals.update(extravals)
         patchdata = patch_recipe_file(f, vals, patch, relpath, redirect_output)
         if patch:
             patches.append(patchdata)
-- 
2.17.2


