Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7DDBC3DA63
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 18:22:50 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.321.1721240562408722317
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 11:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BqGHU/qC;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3683329f787so5223f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 11:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721240561; x=1721845361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fd9F+oHepi4Po6B9jzD0FE/KVTJ11qgndkEoPu+clp0=;
        b=BqGHU/qCIPaZQ/9vCR3EkVXCdX0PUP0E92oUHH7XURTagqUNjl0WABCWn9kirHNKiQ
         DA/Lx2ibHQgR/3lGjs7RNAEeG8vUa+xruT6JZzY5CTgC/ud+ekKA3t50lQlqzelbIyHv
         g9RLjsuHogt9LHNGqRx44UeENE+soBfaAcpP3fzrnRStvutd0wbrUQjAmB22dKW9WRoJ
         EEUFO8cb89WiNy8BseLyzt3+scjHqrBO1Vnzdul/51JoqgTLQ3jsWL0LakJT2LS5T0v3
         Ro8awdlaCuPw+U0CUNPm3nY9Wm39SmqYjAR4Tg+EBs+loVdcbLflomBeSWy+2kafdQdo
         qHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721240561; x=1721845361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fd9F+oHepi4Po6B9jzD0FE/KVTJ11qgndkEoPu+clp0=;
        b=HNMpIaU98sFgio+YHJUuqYRPYuoBYWBK4SdG8ZvDGMaFse2l5eGCQeDU0elX6ox6mh
         rf8yd2pIqmxudSPKC3pYxW+yXWTGQd7+lKS86zU4IIYi28uKjmsDzxfGzifTAPU0E52I
         fYxCTXJ/Ec678s7Ij04ZJI0SVTpfdY8Fev7ikfGqxPv1KMEttvO96dmdEgeMpULT/zLo
         9Zl+Bka3XAJ89gUlvWSAQeB2PGYFOwf2K5lwwJKyKPLY7enFKkgaHotB4NQPPnDYC2bN
         cLm2nLAALqy7oJ97qw7YgOum/FtvGsc0ifYb6VA6bEWltg5RotrbZtzRXMzItd0Itfut
         Hk4w==
X-Gm-Message-State: AOJu0YwP4Lc3RufQ5WIN9vMtFFGvU+d8jZXrTvd6N6DPKrEs1CUVOxNN
	qlrcDLeVrPxKAoCE6y/oWE6D/IDh/O4GN/bDzbnB1ZxArRVf92CyxcJfrg==
X-Google-Smtp-Source: AGHT+IFg5q8ikwbh2AVRhRRdMUrdM2SKPzfTzwBZa5hUvGDMvOGLnrROaQF4i+eYhc14AsdhflvotQ==
X-Received: by 2002:a5d:5f4b:0:b0:368:4492:eca9 with SMTP id ffacd0b85a97d-3684492f176mr748500f8f.20.1721240560766;
        Wed, 17 Jul 2024 11:22:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db0489csm12421868f8f.104.2024.07.17.11.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 11:22:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/4] devtool/upgrade: use PN instead of BPN for naming newly created upgraded recipes
Date: Wed, 17 Jul 2024 20:22:16 +0200
Message-Id: <20240717182216.1661015-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717182216.1661015-1-alex.kanavin@gmail.com>
References: <20240717182216.1661015-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 18:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202175

From: Alexander Kanavin <alex@linutronix.de>

BPN isn't correct, as it is set to 'cmake' when 'cmake-native' is being upgraded
(or libva for libva-initial etc.)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/lib/devtool/upgrade.py | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 4c268af3a7c..9ec66488516 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -76,19 +76,19 @@ def _rename_recipe_dirs(oldpv, newpv, path):
                         bb.utils.rename(os.path.join(path, oldfile),
                               os.path.join(path, newfile))
 
-def _rename_recipe_file(oldrecipe, bpn, oldpv, newpv, path):
+def _rename_recipe_file(oldrecipe, pn, oldpv, newpv, path):
     oldrecipe = os.path.basename(oldrecipe)
     if oldrecipe.endswith('_%s.bb' % oldpv):
-        newrecipe = '%s_%s.bb' % (bpn, newpv)
+        newrecipe = '%s_%s.bb' % (pn, newpv)
         if oldrecipe != newrecipe:
             shutil.move(os.path.join(path, oldrecipe), os.path.join(path, newrecipe))
     else:
         newrecipe = oldrecipe
     return os.path.join(path, newrecipe)
 
-def _rename_recipe_files(oldrecipe, bpn, oldpv, newpv, path):
+def _rename_recipe_files(oldrecipe, pn, oldpv, newpv, path):
     _rename_recipe_dirs(oldpv, newpv, path)
-    return _rename_recipe_file(oldrecipe, bpn, oldpv, newpv, path)
+    return _rename_recipe_file(oldrecipe, pn, oldpv, newpv, path)
 
 def _write_append(rc, srctreebase, srctree, same_dir, no_same_dir, revs, copied, workspace, d):
     """Writes an append file"""
@@ -335,19 +335,19 @@ def _add_license_diff_to_recipe(path, diff):
 def _create_new_recipe(newpv, checksums, srcrev, srcbranch, srcsubdir_old, srcsubdir_new, workspace, tinfoil, rd, license_diff, new_licenses, srctree, keep_failure):
     """Creates the new recipe under workspace"""
 
-    bpn = rd.getVar('BPN')
-    path = os.path.join(workspace, 'recipes', bpn)
+    pn = rd.getVar('PN')
+    path = os.path.join(workspace, 'recipes', pn)
     bb.utils.mkdirhier(path)
     copied, _ = oe.recipeutils.copy_recipe_files(rd, path, all_variants=True)
     if not copied:
-        raise DevtoolError('Internal error - no files were copied for recipe %s' % bpn)
+        raise DevtoolError('Internal error - no files were copied for recipe %s' % pn)
     logger.debug('Copied %s to %s' % (copied, path))
 
     oldpv = rd.getVar('PV')
     if not newpv:
         newpv = oldpv
     origpath = rd.getVar('FILE')
-    fullpath = _rename_recipe_files(origpath, bpn, oldpv, newpv, path)
+    fullpath = _rename_recipe_files(origpath, pn, oldpv, newpv, path)
     logger.debug('Upgraded %s => %s' % (origpath, fullpath))
 
     newvalues = {}
@@ -610,7 +610,7 @@ def upgrade(args, config, basepath, workspace):
             license_diff = _generate_license_diff(old_licenses, new_licenses)
             rf, copied = _create_new_recipe(args.version, checksums, args.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfoil, rd, license_diff, new_licenses, srctree, args.keep_failure)
         except (bb.process.CmdError, DevtoolError) as e:
-            recipedir = os.path.join(config.workspace_path, 'recipes', rd.getVar('BPN'))
+            recipedir = os.path.join(config.workspace_path, 'recipes', rd.getVar('PN'))
             _upgrade_error(e, recipedir, srctree, args.keep_failure)
         standard._add_md5(config, pn, os.path.dirname(rf))
 
-- 
2.39.2


