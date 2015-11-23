Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DAC4F6FF01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:11:14 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Nov 2015 18:11:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,334,1444719600"; d="scan'208";a="692213530"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by orsmga003.jf.intel.com with ESMTP; 22 Nov 2015 18:11:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:09:35 +1300
Message-Id: <67351a064acfd2fd0ca374dee8112bb1298f5ffb.1448244474.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 16/18] lib/oe/recipeutils: refactor patch_recipe_file() to use edit_metadata()
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
X-List-Received-Date: Mon, 23 Nov 2015 02:11:15 -0000

Use bb.utils.edit_metadata() to replace some of the logic in this
function; this avoids us effectively having two implementations of the
same thing. In the process fix the following issues:

* Insert values before any leading comments for the next variable
  instead of after them
* Insert overridden variables (e.g. RDEPENDS_${PN}) in the correct place
* Properly handle replacing varflag settings (e.g. SRC_URI[md5sum])

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py     | 160 ++++++++++++++++++++++++-----------------
 scripts/lib/devtool/upgrade.py |  30 ++------
 2 files changed, 97 insertions(+), 93 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 8918fac..5e0fda5 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -19,9 +19,9 @@ from collections import OrderedDict, defaultdict
 
 
 # Help us to find places to insert values
-recipe_progression = ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER', 'SECTION', 'LICENSE', 'LIC_FILES_CHKSUM', 'PROVIDES', 'DEPENDS', 'PR', 'PV', 'SRCREV', 'SRC_URI', 'S', 'do_fetch', 'do_unpack', 'do_patch', 'EXTRA_OECONF', 'do_configure', 'EXTRA_OEMAKE', 'do_compile', 'do_install', 'do_populate_sysroot', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW_EMPTY', 'do_package', 'do_deploy']
+recipe_progression = ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER', 'SECTION', 'LICENSE', 'LIC_FILES_CHKSUM', 'PROVIDES', 'DEPENDS', 'PR', 'PV', 'SRCREV', 'SRC_URI', 'S', 'do_fetch()', 'do_unpack()', 'do_patch()', 'EXTRA_OECONF', 'do_configure()', 'EXTRA_OEMAKE', 'do_compile()', 'do_install()', 'do_populate_sysroot()', 'INITSCRIPT', 'USERADD', 'GROUPADD', 'PACKAGES', 'FILES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RPROVIDES', 'RREPLACES', 'RCONFLICTS', 'ALLOW_EMPTY', 'do_package()', 'do_deploy()']
 # Variables that sometimes are a bit long but shouldn't be wrapped
-nowrap_vars = ['SUMMARY', 'HOMEPAGE', 'BUGTRACKER']
+nowrap_vars = ['SUMMARY', 'HOMEPAGE', 'BUGTRACKER', 'SRC_URI[md5sum]', 'SRC_URI[sha256sum]']
 list_vars = ['SRC_URI', 'LIC_FILES_CHKSUM']
 meta_vars = ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER', 'SECTION']
 
@@ -164,85 +164,111 @@ def patch_recipe_file(fn, values, patch=False, relpath=''):
        Note that some manual inspection/intervention may be required
        since this cannot handle all situations.
     """
+
+    import bb.utils
+
+    recipe_progression_res = []
+    recipe_progression_restrs = []
+    for item in recipe_progression:
+        if item.endswith('()'):
+            key = item[:-2]
+        else:
+            key = item
+        restr = '%s(_[a-zA-Z0-9-_$(){}]+|\[[^\]]*\])?' % key
+        if item.endswith('()'):
+            recipe_progression_restrs.append(restr + '()')
+        else:
+            recipe_progression_restrs.append(restr)
+        recipe_progression_res.append(re.compile('^%s$' % restr))
+
+    def get_recipe_pos(variable):
+        for i, p in enumerate(recipe_progression_res):
+            if p.match(variable):
+                return i
+        return -1
+
     remainingnames = {}
     for k in values.keys():
-        remainingnames[k] = recipe_progression.index(k) if k in recipe_progression else -1
+        remainingnames[k] = get_recipe_pos(k)
     remainingnames = OrderedDict(sorted(remainingnames.iteritems(), key=lambda x: x[1]))
 
-    with tempfile.NamedTemporaryFile('w', delete=False) as tf:
-        def outputvalue(name):
-            rawtext = '%s = "%s"\n' % (name, values[name])
-            if name in nowrap_vars:
-                tf.write(rawtext)
-            elif name in list_vars:
-                splitvalue = split_var_value(values[name], assignment=False)
-                if len(splitvalue) > 1:
-                    linesplit = ' \\\n' + (' ' * (len(name) + 4))
-                    tf.write('%s = "%s%s"\n' % (name, linesplit.join(splitvalue), linesplit))
-                else:
-                    tf.write(rawtext)
+    modifying = False
+
+    def outputvalue(name, lines, rewindcomments=False):
+        if values[name] is None:
+            return
+        rawtext = '%s = "%s"\n' % (name, values[name])
+        addlines = []
+        if name in nowrap_vars:
+            addlines.append(rawtext)
+        elif name in list_vars:
+            splitvalue = split_var_value(values[name], assignment=False)
+            if len(splitvalue) > 1:
+                linesplit = ' \\\n' + (' ' * (len(name) + 4))
+                addlines.append('%s = "%s%s"\n' % (name, linesplit.join(splitvalue), linesplit))
             else:
-                wrapped = textwrap.wrap(rawtext)
-                for wrapline in wrapped[:-1]:
-                    tf.write('%s \\\n' % wrapline)
-                tf.write('%s\n' % wrapped[-1])
-
-        tfn = tf.name
-        with open(fn, 'r') as f:
-            # First runthrough - find existing names (so we know not to insert based on recipe_progression)
-            # Second runthrough - make the changes
-            existingnames = []
-            for runthrough in [1, 2]:
-                currname = None
-                for line in f:
-                    if not currname:
-                        insert = False
-                        for k in remainingnames.keys():
-                            for p in recipe_progression:
-                                if re.match('^%s(_prepend|_append)*[ ?:=(]' % p, line):
-                                    if remainingnames[k] > -1 and recipe_progression.index(p) > remainingnames[k] and runthrough > 1 and not k in existingnames:
-                                        outputvalue(k)
-                                        del remainingnames[k]
-                                    break
-                        for k in remainingnames.keys():
-                            if re.match('^%s[ ?:=]' % k, line):
-                                currname = k
-                                if runthrough == 1:
-                                    existingnames.append(k)
-                                else:
-                                    del remainingnames[k]
-                                break
-                        if currname and runthrough > 1:
-                            outputvalue(currname)
-
-                    if currname:
-                        sline = line.rstrip()
-                        if not sline.endswith('\\'):
-                            currname = None
-                        continue
-                    if runthrough > 1:
-                        tf.write(line)
-                f.seek(0)
-        if remainingnames:
-            tf.write('\n')
-            for k in remainingnames.keys():
-                outputvalue(k)
-
-    with open(tfn, 'U') as f:
-        tolines = f.readlines()
+                addlines.append(rawtext)
+        else:
+            wrapped = textwrap.wrap(rawtext)
+            for wrapline in wrapped[:-1]:
+                addlines.append('%s \\\n' % wrapline)
+            addlines.append('%s\n' % wrapped[-1])
+        if rewindcomments:
+            # Ensure we insert the lines before any leading comments
+            # (that we'd want to ensure remain leading the next value)
+            for i, ln in reversed(list(enumerate(lines))):
+                if ln[0] != '#':
+                    lines[i+1:i+1] = addlines
+                    break
+            else:
+                lines.extend(addlines)
+        else:
+            lines.extend(addlines)
+
+    existingnames = []
+    def patch_recipe_varfunc(varname, origvalue, op, newlines):
+        if modifying:
+            # Insert anything that should come before this variable
+            pos = get_recipe_pos(varname)
+            for k in remainingnames.keys()[:]:
+                if remainingnames[k] > -1 and pos >= remainingnames[k] and not k in existingnames:
+                    outputvalue(k, newlines, rewindcomments=True)
+                    del remainingnames[k]
+            # Now change this variable, if it needs to be changed
+            if varname in existingnames:
+                outputvalue(varname, newlines)
+                del remainingnames[varname]
+                return None, None, 0, True
+        else:
+            if varname in values:
+                existingnames.append(varname)
+        return origvalue, None, 0, True
+
+    # First run - establish which values we want to set are already in the file
+    varlist = [re.escape(item) for item in values.keys()]
+    with open(fn, 'r') as f:
+        changed, fromlines = bb.utils.edit_metadata(f, varlist, patch_recipe_varfunc)
+    # Second run - actually set everything
+    modifying = True
+    varlist.extend(recipe_progression_restrs)
+    changed, tolines = bb.utils.edit_metadata(fromlines, varlist, patch_recipe_varfunc, match_overrides=True)
+
+    if remainingnames:
+        if tolines[-1].strip() != '':
+            tolines.append('\n')
+        for k in remainingnames.keys():
+            outputvalue(k, tolines)
+
     if patch:
-        with open(fn, 'U') as f:
-            fromlines = f.readlines()
         relfn = os.path.relpath(fn, relpath)
         diff = difflib.unified_diff(fromlines, tolines, 'a/%s' % relfn, 'b/%s' % relfn)
-        os.remove(tfn)
         return diff
     else:
         with open(fn, 'w') as f:
             f.writelines(tolines)
-        os.remove(tfn)
         return None
 
+
 def localise_file_vars(fn, varfiles, varlist):
     """Given a list of variables and variable history (fetched with get_var_files())
     find where each variable should be set/changed. This handles for example where a
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 7bbb915..6620018 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -62,26 +62,6 @@ def _get_checksums(rf):
                     checksums[cs] = m.group(1)
     return checksums
 
-def _replace_checksums(rf, md5, sha256):
-    if not md5 and not sha256:
-        return
-    checksums = {'md5sum':md5, 'sha256sum':sha256}
-    with open(rf + ".tmp", "w+") as tmprf:
-        with open(rf) as f:
-            for line in f:
-                m = None
-                for cs in checksums.keys():
-                    m = re.match("^SRC_URI\[%s\].*=.*\"(.*)\"" % cs, line)
-                    if m:
-                        if checksums[cs]:
-                            oldcheck = m.group(1)
-                            newcheck = checksums[cs]
-                            line = line.replace(oldcheck, newcheck)
-                        break
-                tmprf.write(line)
-    os.rename(rf + ".tmp", rf)
-
-
 def _remove_patch_dirs(recipefolder):
     for root, dirs, files in os.walk(recipefolder):
         for d in dirs:
@@ -297,16 +277,14 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, workspace, tinfoil
         if changed:
             newvalues['SRC_URI'] = ' '.join(new_src_uri)
 
+    if md5 and sha256:
+        newvalues['SRC_URI[md5sum]'] = md5
+        newvalues['SRC_URI[sha256sum]'] = sha256
+
     if newvalues:
         rd = oe.recipeutils.parse_recipe(fullpath, None, tinfoil.config_data)
         oe.recipeutils.patch_recipe(rd, fullpath, newvalues)
 
-    if md5 and sha256:
-        # Unfortunately, oe.recipeutils.patch_recipe cannot update flags.
-        # once the latter feature is implemented, we should call patch_recipe
-        # instead of the following function
-        _replace_checksums(fullpath, md5, sha256)
-
     return fullpath
 
 def upgrade(args, config, basepath, workspace):
-- 
2.1.0


