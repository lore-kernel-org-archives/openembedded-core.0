Return-Path: <JHarris@westell.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CEBC25B78
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 18:56:14 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.2442.1715799364404138194
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 11:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QG1Lzb2Z;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: jefftharris@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-439656c1b50so45555411cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 11:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715799363; x=1716404163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uYsjKb33K09h+Chno6K81zwM+VhHo5jRd/qVRKDcEo=;
        b=QG1Lzb2ZH/HQxSJH709saMCwvTdFuzcHQ13yqqCbP7t9lifDbKgTdoyuZ+fJy0N9kU
         A7FquixFXlYR1bUrWWCvGz5oT38aB5Nh3l2jtddlzEc5qkWqG+l0lyQS3RKnK/wvn0HV
         uI8wYfY/sRhOjrkn/movUoIVhHIGhiV0zBnPlWwBKmYiowXsBVZhi0GLaVeysRqzhAA6
         wAHtzR7xq+tTLlZYjOgVb7ev4gfTq5d9OiZERl9/YXYX3slQF2qkBxtzawj+7+Q3jooP
         sG5go7R4l89mygcW0XQ2of3s382CwOXEtvL6MhwfQdoEOZI+mzbvxyh6Hs+6nfgvvoh/
         8f9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715799363; x=1716404163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uYsjKb33K09h+Chno6K81zwM+VhHo5jRd/qVRKDcEo=;
        b=Q7kq6iRaH7vqvVLQoTVINC9oMIn36Rx5aBXPBHk/TJLY94OM+CKnkAsFgjrhD/Y+QO
         F/He/P5v+mrDCBC8F53nvw1ARDxruaYVuIc8yryJFBOzYc2YzJDs/aIki7r0eET3iXJO
         DZ4q5yWFY+w49zen3JVXTo6jYKNR/3Sk+4SaVctHGklGaKSl7wBPJu/gWVIhOJVAs6zZ
         2ewAYbAmxvxjElnU7ovv2aktf4mOrO5OKQQdDO3YyJ4G9hLM2NTdZZFYAPRn1M1G8RXF
         OvohmSniNTOUlZR7PXMS8ymnrl/dB7jpdzkuIIaGCjIklYwsP1h0GP4j4K0RufjHUo7J
         Cufg==
X-Gm-Message-State: AOJu0Yz4Wb0n1f1KA9A7Yp4aQwV6BrbAcqABZWzNNipvNRsxvxS88oEc
	stEexQ7aq0GdKZcP0Q8fQygeJEYEDeu4JwmcSawjmGx9j/H2cn6nd0qxQV/m
X-Google-Smtp-Source: AGHT+IHU+qjrZKYlbz7/7O958G9CHhiJvguSkYXrKZH8QytaJP06l1ZkyG2y4nw9OPwmCv68Kf8bug==
X-Received: by 2002:a05:622a:105:b0:43a:abcd:c770 with SMTP id d75a77b69052e-43dfdac276dmr197261301cf.26.1715799363283;
        Wed, 15 May 2024 11:56:03 -0700 (PDT)
Received: from clarinet.com (syn-024-160-195-130.res.spectrum.com. [24.160.195.130])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43df5516115sm86413591cf.45.2024.05.15.11.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 11:56:03 -0700 (PDT)
From: Jeff Harris <jefftharris@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jeff Harris <jefftharris@gmail.com>
Subject: [scarthgap][PATCH 1/2] devtool: standard: update-recipe/finish: fix update localfile in another layer
Date: Wed, 15 May 2024 14:55:59 -0400
Message-ID: <20240515185600.3456234-2-jefftharris@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240515185600.3456234-1-jefftharris@gmail.com>
References: <20240515185600.3456234-1-jefftharris@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 18:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199427

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
2.45.0


