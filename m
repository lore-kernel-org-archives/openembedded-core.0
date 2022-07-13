Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40126C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 01:41:33 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.17263.1657676490654692496
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 18:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Ty+p3kxj;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 35FBC20B4774; Tue, 12 Jul 2022 18:41:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 35FBC20B4774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1657676490;
	bh=UbJIZYNfaaceP45HKhsSFjBwWw0NhSATtFo79Hw+gwg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ty+p3kxjlVE80PRbna2R0sAjGwWYg+w/BycrzPoCGD6pLDDavwig3VCI2QiHRThSF
	 VSDyWmz/hhMqOmfhzVl/x2mtyNxMVKsJ1nMqmWSkShn5eHpsm2V9cld2ZbY8V7lS4K
	 uiG/K0qLCg7anQAF72Xio5/Jj/xCO9eSYzSIr8Fo=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/3] devtool: finish: handle patching when S points to
 subdir of a git repo
Date: Tue, 12 Jul 2022 18:41:24 -0700
Message-Id: 
 <5e1709a1dc1702470e751e4f4b307fcc4865d476.1657676159.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1657676159.git.paul.eggleton@linux.microsoft.com>
References: <cover.1657676159.git.paul.eggleton@linux.microsoft.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 01:41:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167948

From: Paul Eggleton <paul.eggleton@microsoft.com>

If devtool finish needs to create a patch and have it applied to the
sources for a recipe where S points to a subdirectory of the sources,
then the patch needs to be applied at the root of the repo i.e. we need
to add a patchdir= parameter to the SRC_URI entry.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/lib/oe/recipeutils.py      |  9 +++++++--
 scripts/lib/devtool/standard.py | 25 +++++++++++++++++++------
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 872ff97..b04992c 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -666,7 +666,7 @@ def get_bbappend_path(d, destlayerdir, wildcardver=False):
     return (appendpath, pathok)
 
 
-def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False, machine=None, extralines=None, removevalues=None, redirect_output=None):
+def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False, machine=None, extralines=None, removevalues=None, redirect_output=None, params=None):
     """
     Writes a bbappend file for a recipe
     Parameters:
@@ -696,6 +696,9 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
         redirect_output:
             If specified, redirects writing the output file to the
             specified directory (for dry-run purposes)
+        params:
+            Parameters to use when adding entries to SRC_URI. If specified,
+            should be a list of dicts with the same length as srcfiles.
     """
 
     if not removevalues:
@@ -762,12 +765,14 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
     copyfiles = {}
     if srcfiles:
         instfunclines = []
-        for newfile, origsrcfile in srcfiles.items():
+        for i, (newfile, origsrcfile) in enumerate(srcfiles.items()):
             srcfile = origsrcfile
             srcurientry = None
             if not srcfile:
                 srcfile = os.path.basename(newfile)
                 srcurientry = 'file://%s' % srcfile
+                if params and params[i]:
+                    srcurientry = '%s;%s' % (srcurientry, ';'.join('%s=%s' % (k,v) for k,v in params[i].items()))
                 # Double-check it's not there already
                 # FIXME do we care if the entry is added by another bbappend that might go away?
                 if not srcurientry in rd.getVar('SRC_URI').split():
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index e53569c..c98bfe8 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1606,6 +1606,19 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
     if not os.path.exists(append):
         raise DevtoolError('unable to find workspace bbappend for recipe %s' %
                            recipename)
+    srctreebase = workspace[recipename]['srctreebase']
+    relpatchdir = os.path.relpath(srctreebase, srctree)
+    if relpatchdir == '.':
+        patchdir_params = {}
+    else:
+        patchdir_params = {'patchdir': relpatchdir}
+
+    def srcuri_entry(fname):
+        if patchdir_params:
+            paramstr = ';' + ';'.join('%s=%s' % (k,v) for k,v in patchdir_params.items())
+        else:
+            paramstr = ''
+        return 'file://%s%s' % (basepath, paramstr)
 
     initial_rev, update_rev, changed_revs, filter_patches = _get_patchset_revs(srctree, append, initial_rev, force_patch_refresh)
     if not initial_rev:
@@ -1627,7 +1640,6 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
             new_f = {}
             del_f = {}
         else:
-            srctreebase = workspace[recipename]['srctreebase']
             upd_f, new_f, del_f = _export_local_files(srctree, rd, local_files_dir, srctreebase)
 
         remove_files = []
@@ -1663,14 +1675,15 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                     removedentries, remaining = _remove_file_entries(
                                                     srcuri, remove_files)
                     if removedentries or remaining:
-                        remaining = ['file://' + os.path.basename(item) for
+                        remaining = [srcuri_entry(os.path.basename(item)) for
                                      item in remaining]
                         removevalues = {'SRC_URI': removedentries + remaining}
                 appendfile, destpath = oe.recipeutils.bbappend_recipe(
                                 rd, appendlayerdir, files,
                                 wildcardver=wildcard_version,
                                 removevalues=removevalues,
-                                redirect_output=dry_run_outdir)
+                                redirect_output=dry_run_outdir,
+                                params=[patchdir_params] * len(files))
             else:
                 logger.info('No patches or local source files needed updating')
         else:
@@ -1694,7 +1707,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                     # replace the entry in SRC_URI with our local version
                     logger.info('Replacing remote patch %s with updated local version' % basepath)
                     path = os.path.join(files_dir, basepath)
-                    _replace_srcuri_entry(srcuri, basepath, 'file://%s' % basepath)
+                    _replace_srcuri_entry(srcuri, basepath, srcuri_entry(basepath))
                     updaterecipe = True
                 else:
                     logger.info('Updating patch %s%s' % (basepath, dry_run_suffix))
@@ -1708,7 +1721,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                            os.path.join(files_dir, basepath),
                            dry_run_outdir=dry_run_outdir,
                            base_outdir=recipedir)
-                srcuri.append('file://%s' % basepath)
+                srcuri.append(srcuri_entry(basepath))
                 updaterecipe = True
             for basepath, path in new_p.items():
                 logger.info('Adding new patch %s%s' % (basepath, dry_run_suffix))
@@ -1716,7 +1729,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                            os.path.join(files_dir, basepath),
                            dry_run_outdir=dry_run_outdir,
                            base_outdir=recipedir)
-                srcuri.append('file://%s' % basepath)
+                srcuri.append(srcuri_entry(basepath))
                 updaterecipe = True
             # Update recipe, if needed
             if _remove_file_entries(srcuri, remove_files)[0]:
-- 
1.8.3.1


