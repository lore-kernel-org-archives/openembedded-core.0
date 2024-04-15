Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37C7C00A94
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 19:20:23 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.1814.1713208815203894893
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 12:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=vXp1sFqp;
 spf=pass (domain: baylibre.com, ip: 209.85.128.44, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4187481e3feso6075595e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 12:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713208813; x=1713813613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ApePUGIPYjbhaOI397eMbaG2uzIDrEOyie01VkZPnH4=;
        b=vXp1sFqpCQLbVix8I5sdvFBNJpVIsz7s75FXJW+UrzxEL1k3BLIYmZ2iSrBo0YpT7s
         Lo1dhbUpKNn4ozCdyV4lbUnnO6YsZmy06bv6MaBHDms+m3hG6Iuajcpz/abZNCJZiHwp
         xsSYhVWWXZADPJKNfhNo7kOgdw9FV8E/wIuHCPZGytpb0zSbEBZ+J95n/KN1nhj6LQEg
         1MIIMNoVJHSm/Wf4o5yrB0m5P+I7c3WamnF2gASxcTIfQoBGpn7Heig6Jfe4uT+0Cakf
         GBIYyID4KvNgPdDn7nS54pAsrtlWa7BiSsuAIRWGGZ5XDq5S04gcklI+2lXerBWcMx2a
         +07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713208813; x=1713813613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ApePUGIPYjbhaOI397eMbaG2uzIDrEOyie01VkZPnH4=;
        b=KU+xdd1MHhYjHLNGWuaf+/5JtNtEDqY05x1PBn7XHwsL6asLkuhQwoL8eagx0RzcAd
         Uf9KKc0FB+TEVXNiC7CBf4Vo7YLTAmyCpS44PTg0t1aDko6qbCgY1iq0M5lcSPSGJ6jU
         BBQuKO9rTvpG8kJv3f7h9JoU/v00/N39g8FdJhcSzcPyAKkEmGjAFN3qYEY3UlHOnpCl
         n8gLB4z5RPDZqqYAltGuSn33CGQKX92By+dDt3YAeQX92fKR86kVQgwHuupMeMjV7Q3a
         849snS8bo6oHlqhm4I5UxUW7KKjtayx1cpJak7cZbYZQANMK1bFroG6dHLar43G1zFU6
         /Ing==
X-Gm-Message-State: AOJu0YyDd7AmuiJo7ScqbHTCbHe3jv997vWAWMhSdB9FSf7trhubsTLN
	v/yFjqm2FwuCZ1rK/lnZ7kr1w+24vsfyHteKC+CUOkXa6tw38ld0k1kDoL0JGUhO1PKWFS2x1ss
	UYno=
X-Google-Smtp-Source: AGHT+IG6j7rxZxXgSEzC0ejBAvgAULo05vxM8Y0Pspbn4DmTADPROZWB2QsI1zfRF6onMS6FHxfxRQ==
X-Received: by 2002:a05:600c:35d5:b0:414:93df:bef1 with SMTP id r21-20020a05600c35d500b0041493dfbef1mr7021753wmq.39.1713208812988;
        Mon, 15 Apr 2024 12:20:12 -0700 (PDT)
Received: from localhost.localdomain ([2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id fm10-20020a05600c0c0a00b004180abdee2fsm12696885wmb.38.2024.04.15.12.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:20:12 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 1/2] devtool: standard: update-recipe/finish: fix update localfile in another layer
Date: Mon, 15 Apr 2024 21:20:09 +0200
Message-ID: <20240415192010.233966-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 19:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198244

When trying to use devtool update-recipe/finish on another layer, with modified
local file we have the following error:

  Traceback (most recent call last):
    File "<..>/poky/scripts/devtool", line 350, in <module>
      ret = main()
            ^^^^^^
    File "<..>/poky/scripts/devtool", line 337, in main
      ret = args.func(args, config, basepath, workspace)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    File "<..>/poky/scripts/lib/devtool/standard.py", line 1968, in update_recipe
      updated, _, _ = _update_recipe(args.recipename, workspace, rd, args.mode, args.append, args.wildcard_version, args.no_remove, args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides, force_patch_refresh=args.force_patch_refresh)
                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    File "<..>/poky/scripts/lib/devtool/standard.py", line 1930, in _update_recipe
      updated, appendf, removed = _update_recipe_patch(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir, force_patch_refresh)
                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    File "<..>/poky/scripts/lib/devtool/standard.py", line 1747, in _update_recipe_patch
      patchdir = param.get('patchdir', ".")
                 ^^^^^^^^^
  AttributeError: 'str' object has no attribute 'get'

This was introduced when adding support for git submodules.
No selftest case exists to catch this, so a selftest will be
added in another commit.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/lib/devtool/standard.py | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 6674e67267a..10d0cd3b7c8 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1452,8 +1452,10 @@ def _export_local_files(srctree, rd, destdir, srctreebase):
          1. updated - files that already exist in SRCURI
          2. added - new files files that don't exist in SRCURI
          3  removed - files that exist in SRCURI but not in exported files
-      In each dict the key is the 'basepath' of the URI and value is the
-      absolute path to the existing file in recipe space (if any).
+       In each dict the key is the 'basepath' of the URI and value is:
+         - for updated and added dicts, a dict with 1 optionnal key:
+           - 'path': the absolute path to the existing file in recipe space (if any)
+         - for removed dict, the absolute path to the existing file in recipe space
     """
     import oe.recipeutils
 
@@ -1535,9 +1537,9 @@ def _export_local_files(srctree, rd, destdir, srctreebase):
                 origpath = existing_files.pop(fname)
                 workpath = os.path.join(local_files_dir, fname)
                 if not filecmp.cmp(origpath, workpath):
-                    updated[fname] = origpath
+                    updated[fname] = {'path' : origpath}
             elif fname != '.gitignore':
-                added[fname] = None
+                added[fname] = {}
 
         workdir = rd.getVar('WORKDIR')
         s = rd.getVar('S')
@@ -1554,7 +1556,7 @@ def _export_local_files(srctree, rd, destdir, srctreebase):
                     if os.path.exists(fpath):
                         origpath = existing_files.pop(fname)
                         if not filecmp.cmp(origpath, fpath):
-                            updated[fpath] = origpath
+                            updated[fpath] = {'path' : origpath}
 
         removed = existing_files
     return (updated, added, removed)
@@ -1640,7 +1642,8 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
                     redirect_output=dry_run_outdir)
         else:
             files_dir = _determine_files_dir(rd)
-            for basepath, path in upd_f.items():
+            for basepath, param in upd_f.items():
+                path = param['path']
                 logger.info('Updating file %s%s' % (basepath, dry_run_suffix))
                 if os.path.isabs(basepath):
                     # Original file (probably with subdir pointing inside source tree)
@@ -1650,7 +1653,8 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
                     _move_file(os.path.join(local_files_dir, basepath), path,
                                dry_run_outdir=dry_run_outdir, base_outdir=recipedir)
                 update_srcuri= True
-            for basepath, path in new_f.items():
+            for basepath, param in new_f.items():
+                path = param['path']
                 logger.info('Adding new file %s%s' % (basepath, dry_run_suffix))
                 _move_file(os.path.join(local_files_dir, basepath),
                            os.path.join(files_dir, basepath),
@@ -1772,7 +1776,8 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
         else:
             # Update existing files
             files_dir = _determine_files_dir(rd)
-            for basepath, path in upd_f.items():
+            for basepath, param in upd_f.items():
+                path = param['path']
                 logger.info('Updating file %s' % basepath)
                 if os.path.isabs(basepath):
                     # Original file (probably with subdir pointing inside source tree)
@@ -1806,7 +1811,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
                            dry_run_outdir=dry_run_outdir, base_outdir=recipedir)
                 updatefiles = True
             # Add any new files
-            for basepath, path in new_f.items():
+            for basepath, param in new_f.items():
                 logger.info('Adding new file %s%s' % (basepath, dry_run_suffix))
                 _move_file(os.path.join(local_files_dir, basepath),
                            os.path.join(files_dir, basepath),
-- 
2.44.0


