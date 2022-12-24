Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA3CC46467
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 17:00:07 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.100755.1671901201574866312
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Dec 2022 09:00:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aOwQjTHY;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id w15so7038667wrl.9
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Dec 2022 09:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gomC9DY43aEhfC6+vh+ahgnqtI9gz9G9n8QKZmOyXE=;
        b=aOwQjTHYscnm/8GfWY+11gyoq28ORaTTSxOiaT7gCnpSujTNh1WVYUINfjgliiuXGj
         0pwtbtjH4D/8ndmdpVHRaTmnGTc4EdRfMaWCnYarmIzM/OZpg92LHzhpu3YTMUCBmbvW
         yriPJXoJ1FUfobUM7phKYtFjJeukLvVUv25J7tWjlnP5M5aw1H+p9nWen16Kf8Dv3w92
         /mfYW3X7UtTTvmidfjSnsoZSPH9BFfc3kJsbS+5iHU/IXY7Md81yq4YbU1+fCRwOoBU1
         8otc9oXySvWjQfRdHPXzHnQxlbXGsT6d5+VldrljbCLUAEoFh6rMcK0JeyC1at+75zS4
         BdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gomC9DY43aEhfC6+vh+ahgnqtI9gz9G9n8QKZmOyXE=;
        b=nd0yml2Fl5E2ndtkICgN+yvv8TVBKRAozkidHWYaL+EnZir2/JCWt/kCi5irdH1VHO
         y2oG+ascXY7/nzSgszJ9DnkI2SpPtkyqwgxFEmnAZwpskGkO8KtLSfPteMATFC6NwAIe
         x1MD8ekvx8Y3Hmfhv4QTXb6Oz48Xo3K6RZjk25WRwmH+JVlavxE5XONoVFcTjgAkuu9w
         JLlJ8MMKXgBtKrX6AMvA/bl4ar98gByr0XGAlvwOUquGGHBN/LAHWSPKwhuV0ZoLHdeJ
         doukX2gv3Fgcj3Uu2mEYNFo4hOlTQhQZe3juYZvTWNHW6PtIdoOqa4cqIsmVSZVZ80nh
         TMqg==
X-Gm-Message-State: AFqh2koi8xCRS/LmjvTyHDLuqE9UvJNhddyZ3DmpXbHP8yk0rmFaufJ2
	E8qCFg88uOweiSpCEgjVwHbP+MP6j1M=
X-Google-Smtp-Source: AMrXdXuhaTVdusp/jDG0tveJkRR/MbdAGQfXPD20CXVLpS+Ulwq+G6P6dXu675e/jS+Znd6cAZzNYg==
X-Received: by 2002:adf:e781:0:b0:27a:2d3a:b525 with SMTP id n1-20020adfe781000000b0027a2d3ab525mr439346wrm.15.1671901200114;
        Sat, 24 Dec 2022 09:00:00 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b2-20020adff242000000b0023662245d3csm6005622wrp.95.2022.12.24.08.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Dec 2022 08:59:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/7] devtool: process local files only for the main branch
Date: Sat, 24 Dec 2022 17:59:41 +0100
Message-Id: <20221224165943.1324800-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221224165943.1324800-1-alex@linutronix.de>
References: <20221224165943.1324800-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Dec 2022 17:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174987

devtool modify/upgrade are not currently equipped to handle conditional local files
in SRC_URI, and provide only the main no-override set in a workspace under
source/component/oe-local-files/ (this is done via meta/classes/devtool-source.bbclass).

On the other hand, updating the changes from workspace into a recipe
is run iteratively against all overrides; this works for patches (as they
all are directed into their own override branches in the workspace
git source tree), but breaks down when trying to match local files
in a workspace against local files in overridden SRC_URI lists, resulting in
bad recipe breakage.

Implementing multiple sets of local files is significant work; let's for now
simply not touch local files in recipes except when on the no-override variant.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/lib/devtool/standard.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index f46ce34ad1..f3349f98e9 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1409,6 +1409,18 @@ def _export_local_files(srctree, rd, destdir, srctreebase):
     updated = OrderedDict()
     added = OrderedDict()
     removed = OrderedDict()
+
+    # Get current branch and return early with empty lists
+    # if on one of the override branches
+    # (local files are provided only for the main branch and processing
+    # them against lists from recipe overrides will result in mismatches
+    # and broken modifications to recipes).
+    stdout, _ = bb.process.run('git rev-parse --abbrev-ref HEAD',
+                               cwd=srctree)
+    branchname = stdout.rstrip()
+    if branchname.startswith(override_branch_prefix):
+        return (updated, added, removed)
+
     local_files_dir = os.path.join(srctreebase, 'oe-local-files')
     git_files = _git_ls_tree(srctree)
     if 'oe-local-files' in git_files:
-- 
2.30.2


