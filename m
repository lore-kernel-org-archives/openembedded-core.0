Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C19CF9C64
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 15:58:36 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.17400.1727020710349103238
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Sep 2024 08:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GaIt7MwJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cb7a2e4d6so31599295e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 08:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727020708; x=1727625508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBMyV1tUjrGgtLiH349aXw5SZDOl/Cavs1KXCW11h9g=;
        b=GaIt7MwJNHJ7LCdvzmNZsTFkxikZFghnCa/5qt2OB7m/kO8uc6w1edjunf6Gv3fd2M
         cKfE1tgmytA5ctlbeCfGOLfjeqcho/D01alkTfJPSaRSbuJtwXySyx5UeC/2bFzFOZZ3
         /f5H8h9+vXW2mw3bDzlp483/DEA4zz4h7JaqY4feV+Pf/guErV3HoiXXHJgF/ucsoWr8
         wGfpxElWvjOz0a4D+zPcKti3ZN7LbxgpZFjxaj+fp0dTXJ84eXjOhr4oTegF8rCcDCvu
         d8MNUohS7aOqB5Rvfq7Ie2T2Yd3jOmYo+XQezWoUWoryJM68uH84mHEChfJ+rXlUYsyd
         i/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727020708; x=1727625508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBMyV1tUjrGgtLiH349aXw5SZDOl/Cavs1KXCW11h9g=;
        b=YUwoMMOU9PzgRW/a7OKpKEgR2uoWSf0B6Xace65ovAXDDDG5FwZRhAVy2ldDXUVMTg
         6nvKiIAZDQUdE9Jkwwor3nmK3GnNe0FsV1QPZb2EboYr4MJNeHYI/oPJ4v9vQvBMY90B
         2iPVQXBc+cmEurCROPQfh7BD4eKAqUXSaeGnzy2I7K4YOSLClZaD8F58W6roXr/3xCKA
         ktqHl7OytI7GRIF2WlMifZi7knCqBGgK1Eh2XfkyNuGnkdnm6welqsiFN7VYxcgsFTIp
         2rujW6Z1X3bZ+hMifx5bzNHlZViIqlJuJM8NWhz2x75qsEIECnvm10tpr33MD4iS59aU
         pmaQ==
X-Gm-Message-State: AOJu0YxWoxOX/8tGb8BxRm8qqznED1vFQrgmg7jTq5HNLnne87Q/mqpq
	oxKsclhGNqCz40O0dt6jjwIU2kF8cjl7SI6ZT9KGA83ppHKBFpGtomhR4A==
X-Google-Smtp-Source: AGHT+IFd/CeUuimRiZ3ylWZyDSmGJnx/clYezErSzxq+uL9gpLssZ7yoW/XiFiJv9lLaX/CVlQyjuQ==
X-Received: by 2002:a05:600c:3553:b0:42c:bae0:f059 with SMTP id 5b1f17b1804b1-42e7abe1274mr56013705e9.5.1727020708413;
        Sun, 22 Sep 2024 08:58:28 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7540e429sm104126405e9.3.2024.09.22.08.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 08:58:28 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/3] devtool: drop useless variables
Date: Sun, 22 Sep 2024 17:43:16 +0200
Message-ID: <20240922155810.1139539-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240922155810.1139539-1-adrian.freihofer@siemens.com>
References: <20240922155810.1139539-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 15:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204792

Drop some unused code.

The actual intention was to look for remnants of S = WORKDIR, which
required the extra complicated oe-local-files directory. The remaining
code dealing with oe-local-files still seems to be useful.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/standard.py | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index b2e1a6ca3a5..f2440ae804f 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -18,7 +18,6 @@ import argparse_oe
 import scriptutils
 import errno
 import glob
-import filecmp
 from collections import OrderedDict
 from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, recipe_to_append, get_bbclassextend_targets, update_unlockedsigs, check_prerelease_version, check_git_repo_dirty, check_git_repo_op, DevtoolError
 from devtool import parse_recipe
@@ -814,10 +813,8 @@ def modify(args, config, basepath, workspace):
             staging_kbranch = get_staging_kbranch(srcdir)
             if (os.path.exists(srcdir) and os.listdir(srcdir)) and (kernelVersion in staging_kerVer and staging_kbranch == kbranch):
                 oe.path.copyhardlinktree(srcdir, srctree)
-                workdir = rd.getVar('WORKDIR')
                 unpackdir = rd.getVar('UNPACKDIR')
                 srcsubdir = rd.getVar('S')
-                localfilesdir = os.path.join(srctree, 'oe-local-files')
 
                 # Add locally copied files to gitignore as we add back to the metadata directly
                 local_files = oe.recipeutils.get_recipe_local_files(rd)
-- 
2.46.0


