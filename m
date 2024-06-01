Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29B2C27C54
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 12:25:16 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.36165.1717244715756856858
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 05:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=y5nzAD3O;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f6559668e1so2038965ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 05:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717244715; x=1717849515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oohLTN3WdH/C+MKz7zsiLE5Yi8iOczm1p6obc2Xao/s=;
        b=y5nzAD3OzhVIr7n99GdjjEq/Enakd7foRPt9RbDghDPJusnDyHvKb4zxpl+ImmuUVH
         Xc3J+QFc7BvvJ2alPY90dtWy99JIjlhgMUP02OKX4qT6wigZQpe/9Pi3MnBktut26aDf
         BMotiFOpDbsnU5bIFDmtF/mT8Js+vztHn3k8BeeA03yJSlAOr1UmMM0CV1CCbZIzOq/m
         IggY8YuOIrgr+Q/CuzcdUCdjGLeKTOCKRDpwQGnHy3Xv4As/JXnH3yELjvYO0aO3cHfp
         49XYVbN5qgUHgYEGrRiq6RlI8guOg6wglk6LNbtb187QiPWbc+rG2uA50DLvqcnwOVXV
         jyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717244715; x=1717849515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oohLTN3WdH/C+MKz7zsiLE5Yi8iOczm1p6obc2Xao/s=;
        b=qrMu6Sl5QuG8rjw/cq+6iyKNPk9TKvqUOL4UwhF9Sj/CEyP8oK9tLKfiy5St/rlNiH
         jJwRc+M2tciVFV6HklfGMr/+FpIwgfPfadYKAnugCb1bWDB0u/wbzvC6mSTK9SEZ2UXw
         3wVQqArwTLLTq0+00FkGCzB1oOigQuZmfFCaxaczBUL0if4zyNyyKS5YZzminsVjewZb
         TKF5duJIauHYPhIg/W2dgZCbT3iceKC+hlLaNQfs+bFAD5rP4h4CETcHLxqc2oNE5mW+
         T9KihxklSoUGeIxuqMnToCulI1e0qlQAc23p1Yey1sZUxcT9KzuTaiKB1HtwWnKK30Fn
         tsrg==
X-Gm-Message-State: AOJu0YxyZJaud6e76qmlMvy/t0E/c9SUIlAo9LWhx4hLa2yNey7KJBkg
	TbD1ZDeQ3b1Ai68DSscmN7L9u4r+gK10zrqmPGYuhLVP1aXziMOQZv4cAk2ZLc+LpDBR+X4FldC
	M
X-Google-Smtp-Source: AGHT+IFsGVwy75K4rSQHlDQPwiksQTiMxWbM+Oj2oxchliNN8YBc6YqavVcznbFNmoZ8pGVmh0iIHA==
X-Received: by 2002:a17:902:c20d:b0:1f3:453f:1372 with SMTP id d9443c01a7336-1f637020480mr39873885ad.30.1717244714885;
        Sat, 01 Jun 2024 05:25:14 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d4d9sm31804165ad.296.2024.06.01.05.25.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 05:25:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/21] devtool: standard: update-recipe/finish: fix update localfile in another layer
Date: Sat,  1 Jun 2024 05:24:41 -0700
Message-Id: <b4fb19df1746d04c9534feff58a9e534705d46df.1717243719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717243719.git.steve@sakoman.com>
References: <cover.1717243719.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 12:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200111

From: Julien Stephan <jstephan@baylibre.com>

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

(From OE-Core rev: de7ca9f800e15e10271502da7e51e3ae08e0c85b)

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Jeff Harris <jefftharris@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/standard.py | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 6674e67267..10d0cd3b7c 100644
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
2.34.1


