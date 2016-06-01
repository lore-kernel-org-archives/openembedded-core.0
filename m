Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6EB0E77338
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 12:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZeIV006852; Wed, 1 Jun 2016 13:35:56 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YLMpr7Xh2R_R; Wed,  1 Jun 2016 13:35:56 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZpBv006872
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Jun 2016 13:35:52 +0100
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1b85NH-0000kG-7a; Wed, 01 Jun 2016 13:35:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 13:35:22 +0100
Message-Id: <1464784540-2786-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 04/22] classes/lib: Update to match python3 iter requirements
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
X-List-Received-Date: Wed, 01 Jun 2016 12:35:59 -0000

python3 standardises its use of iteration operations. Update
the code to match the for python3 requires.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/buildhistory.bbclass     | 2 +-
 meta/classes/license.bbclass          | 4 ++--
 meta/classes/populate_sdk_ext.bbclass | 4 ++--
 meta/lib/oe/buildhistory_analysis.py  | 4 ++--
 meta/lib/oe/copy_buildsystem.py       | 2 +-
 meta/lib/oe/data.py                   | 2 +-
 meta/lib/oe/recipeutils.py            | 8 ++++----
 meta/lib/oe/sstatesig.py              | 2 +-
 meta/lib/oeqa/selftest/devtool.py     | 2 +-
 meta/lib/oeqa/selftest/sstatetests.py | 4 ++--
 meta/lib/oeqa/utils/decorators.py     | 2 +-
 11 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index e3b5c44..cc233b5 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -838,7 +838,7 @@ python write_srcrev() {
                         f.write('# SRCREV_%s = "%s"\n' % (name, orig_srcrev))
                     f.write('SRCREV_%s = "%s"\n' % (name, srcrev))
             else:
-                f.write('SRCREV = "%s"\n' % srcrevs.itervalues().next())
+                f.write('SRCREV = "%s"\n' % srcrevs.values())
             if len(tag_srcrevs) > 0:
                 for name, srcrev in tag_srcrevs.items():
                     f.write('# tag_%s = "%s"\n' % (name, srcrev))
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 69335d6..538ab19 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -200,7 +200,7 @@ def get_deployed_dependencies(d):
     # it might contain the bootloader.
     taskdata = d.getVar("BB_TASKDEPDATA", False)
     depends = list(set([dep[0] for dep
-                    in taskdata.itervalues()
+                    in list(taskdata.values())
                     if not dep[0].endswith("-native")]))
     extra_depends = d.getVar("EXTRA_IMAGEDEPENDS", True)
     boot_depends = get_boot_dependencies(d)
@@ -261,7 +261,7 @@ def get_boot_dependencies(d):
             depends.append(dep)
         # We need to search for the provider of the dependency
         else:
-            for taskdep in taskdepdata.itervalues():
+            for taskdep in taskdepdata.values():
                 # The fifth field contains what the task provides
                 if dep in taskdep[4]:
                     info_file = os.path.join(
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 4c3a038..a9c6fe5 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -45,7 +45,7 @@ def get_sdk_install_targets(d):
         sdk_install_targets = d.getVar('SDK_TARGETS', True)
 
         depd = d.getVar('BB_TASKDEPDATA', False)
-        for v in depd.itervalues():
+        for v in depd.values():
             if v[1] == 'do_image_complete':
                 if v[0] not in sdk_install_targets:
                     sdk_install_targets += ' {}'.format(v[0])
@@ -267,7 +267,7 @@ python copy_buildsystem () {
     # Ensure any variables set from the external environment (by way of
     # BB_ENV_EXTRAWHITE) are set in the SDK's configuration
     extralines = []
-    for name, value in env_whitelist_values.iteritems():
+    for name, value in env_whitelist_values.items():
         actualvalue = d.getVar(name, True) or ''
         if value != actualvalue:
             extralines.append('%s = "%s"\n' % (name, actualvalue))
diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 5395c76..0dcd49f 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -62,7 +62,7 @@ class ChangeRecord:
 
         def pkglist_combine(depver):
             pkglist = []
-            for k,v in depver.iteritems():
+            for k,v in depver.items():
                 if v:
                     pkglist.append("%s (%s)" % (k,v))
                 else:
@@ -220,7 +220,7 @@ def compare_file_lists(alines, blines):
     adict = file_list_to_dict(alines)
     bdict = file_list_to_dict(blines)
     filechanges = []
-    for path, splitv in adict.iteritems():
+    for path, splitv in adict.items():
         newsplitv = bdict.pop(path, None)
         if newsplitv:
             # Check type
diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 7b9a0ee..0589b7f 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -124,7 +124,7 @@ class BuildSystem(object):
 def generate_locked_sigs(sigfile, d):
     bb.utils.mkdirhier(os.path.dirname(sigfile))
     depd = d.getVar('BB_TASKDEPDATA', False)
-    tasks = ['%s.%s' % (v[2], v[1]) for v in depd.itervalues()]
+    tasks = ['%s.%s' % (v[2], v[1]) for v in depd.values()]
     bb.parse.siggen.dump_lockedsigs(sigfile, tasks)
 
 def prune_lockedsigs(excluded_tasks, excluded_targets, lockedsigs, pruned_output):
diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index 23a9067..ee48950 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -7,7 +7,7 @@ def typed_value(key, d):
     flags = d.getVarFlags(key)
     if flags is not None:
         flags = dict((flag, d.expand(value))
-                     for flag, value in flags.iteritems())
+                     for flag, value in list(flags.items()))
     else:
         flags = {}
 
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 3e17873..b437720 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -336,7 +336,7 @@ def patch_recipe(d, fn, varvalues, patch=False, relpath=''):
     varfiles = get_var_files(fn, varlist, d)
     locs = localise_file_vars(fn, varfiles, varlist)
     patches = []
-    for f,v in locs.iteritems():
+    for f,v in locs.items():
         vals = {k: varvalues[k] for k in v}
         patchdata = patch_recipe_file(f, vals, patch, relpath)
         if patch:
@@ -554,7 +554,7 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
     bbappendlines = []
     if extralines:
         if isinstance(extralines, dict):
-            for name, value in extralines.iteritems():
+            for name, value in extralines.items():
                 bbappendlines.append((name, '=', value))
         else:
             # Do our best to split it
@@ -594,7 +594,7 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
     copyfiles = {}
     if srcfiles:
         instfunclines = []
-        for newfile, origsrcfile in srcfiles.iteritems():
+        for newfile, origsrcfile in srcfiles.items():
             srcfile = origsrcfile
             srcurientry = None
             if not srcfile:
@@ -717,7 +717,7 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
     if copyfiles:
         if machine:
             destsubdir = os.path.join(destsubdir, machine)
-        for newfile, srcfile in copyfiles.iteritems():
+        for newfile, srcfile in copyfiles.items():
             filedest = os.path.join(appenddir, destsubdir, os.path.basename(srcfile))
             if os.path.abspath(newfile) != os.path.abspath(filedest):
                 bb.note('Copying %s to %s' % (newfile, filedest))
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 01dce66..500122d 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -220,7 +220,7 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         for task in range(len(sq_fn)):
             if task not in ret:
                 for pn in self.lockedsigs:
-                    if sq_hash[task] in self.lockedsigs[pn].itervalues():
+                    if sq_hash[task] in iter(self.lockedsigs[pn].values()):
                         if sq_task[task] == 'do_shared_workdir':
                             continue
                         sstate_missing_msgs.append("Locked sig is set for %s:%s (%s) yet not in sstate cache?"
diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index b64f9b3..6d2417e 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -50,7 +50,7 @@ class DevtoolBase(oeSelfTest):
 
 
         missingvars = {}
-        for var, value in checkvars.iteritems():
+        for var, value in checkvars.items():
             if value is not None:
                 missingvars[var] = value
         self.assertEqual(missingvars, {}, 'Some expected variables not found in recipe: %s' % checkvars)
diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index a1e5d33..cc64c6c 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -445,14 +445,14 @@ http_proxy = "http://example.com/"
         files1 = get_files(topdir + "/tmp-sstatesamehash/stamps/")
         files2 = get_files(topdir + "/tmp-sstatesamehash2/stamps/")
         # Remove items that are identical in both sets
-        for k,v in files1.viewitems() & files2.viewitems():
+        for k,v in files1.items() & files2.items():
             del files1[k]
             del files2[k]
         if not files1 and not files2:
             # No changes, so we're done
             return
 
-        for k in files1.viewkeys() | files2.viewkeys():
+        for k in files1.keys() | files2.keys():
             if k in files1 and k in files2:
                 print("%s differs:" % k)
                 print(subprocess.check_output(("bitbake-diffsigs",
diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index d52f326..6fb09db 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -215,7 +215,7 @@ def tag(*args, **kwargs):
     def wrap_ob(ob):
         for name in args:
             setattr(ob, __tag_prefix + name, True)
-        for name, value in kwargs.iteritems():
+        for name, value in kwargs.items():
             setattr(ob, __tag_prefix + name, value)
         return ob
     return wrap_ob
-- 
2.5.0


