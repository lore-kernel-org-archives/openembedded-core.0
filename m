Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A611FCCA482
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:50:52 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.28267.1658155844589278461
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ABnGfnep;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id j12so9228914plj.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3AKgjXgIJmCWXAfOmQmu1+QjMpAB628gEYBUzerptzY=;
        b=ABnGfnepHOHw4Rf1MbxVYtB0P9ueJ+/SEZllrz1UXKfgCO4CMc60GuZnyeC/7b7SNn
         rLfFIQ7UfesxQgz9S704KBo0102Zu+ppuylUvt6iuAxxnM6BTHRLssKpdnpkNqNeZa6p
         G1NY42ZovcNsMJkuD8hyWqWjKMOJ2OvgUzfV5xs4JB00ygvpYG6K4f5RpzZoJXGYHjG7
         xt61EMVGMrjmi7gVizPiHKNHXbZc5qtr6zUWuXOoVVGQ7Pl9nAnaK4K79oH4Lc94l2jX
         nJDJ1VnMgdRjbAf0ZBP5lTttjusql3BgDdkrPX6nUIRIEVHetuiYjjA5+hAxv9MbJDIh
         mjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3AKgjXgIJmCWXAfOmQmu1+QjMpAB628gEYBUzerptzY=;
        b=BARKDi/5uw663Bt2B6bcdZFdiDl2LWMAwmHY+H0asvLJAYx6xagnFO/IRegVa7qtMK
         +WqW/779EHToLqMfYS1rBz+yJEM+AEpJOK/OD5txfkPUX26Fwe5zZwt0DAH9UmQS95H4
         kcMJP2Fbv9MuJovAZi24PiDa9qeg/o5gL2OCJECvg4ZH7UO7Wlzfv7T8sSmbALBoTH9T
         BPDUZrrxZmEnZHB9ntEqsSypPpOdsbXroJWnksI0dXBd2CbXZmfFNhwyNhxG90V/Yu/w
         gvQRBvFBreCwCBE/Hpyo0WCrHGoPHiE0MAacXsBDOUxBsOnXrfiNAQip4S0dgzqJb3dP
         h+Uw==
X-Gm-Message-State: AJIora8fIFMYkNq/L4OCv6sySZfJkhEbpiYX0HQfVcBmq54giZgH67MP
	wYomGStq9xZuKwvxWTqehK1yqGd8433WStTH
X-Google-Smtp-Source: 
 AGRyM1uNXndJ3+qD+gtMi5XEQbC7pOiNGZfsQSotAjZ5xctR8WI++0KMltxgZNAGJ0zTMZMhmjxYBQ==
X-Received: by 2002:a17:903:281:b0:16c:4ccf:e46b with SMTP id
 j1-20020a170903028100b0016c4ccfe46bmr28212366plr.36.1658155843339;
        Mon, 18 Jul 2022 07:50:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.50.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:50:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 28/35] devtool: finish: handle patching when S
 points to subdir of a git repo
Date: Mon, 18 Jul 2022 04:48:53 -1000
Message-Id: 
 <7cf53810b1dc3d14c4838a610b3d53170f552c19.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:50:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168228

From: Paul Eggleton <paul.eggleton@microsoft.com>

If devtool finish needs to create a patch and have it applied to the
sources for a recipe where S points to a subdirectory of the sources,
then the patch needs to be applied at the root of the repo i.e. we need
to add a patchdir= parameter to the SRC_URI entry.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad3736d9ca14cac14a7da22c1cfdeda219665e6f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/recipeutils.py      |  9 +++++++--
 scripts/lib/devtool/standard.py | 25 +++++++++++++++++++------
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 872ff97b89..b04992c66d 100644
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
index e53569c5cc..c98bfe8195 100644
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
2.25.1


