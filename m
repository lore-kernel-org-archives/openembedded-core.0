Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73664C54E51
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 20:48:03 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.5942.1708894073972112854
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 12:47:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TjLf04yG;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-412a4378151so3064395e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 12:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708894072; x=1709498872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMduACdAe5MS2CLrgwBpMwG5rsygi0htGVwHAvgeYPs=;
        b=TjLf04yGaSeENS/am7/5KcYXTNOBVf/6zgsRl6hQyFcayhQZfcQAGfrs5OzusGMF9P
         da+4i2lYtDSr/HUdmNcAKkxISzSTD2AtvhhGn6KBfrqNlJCtuXVsIq3Dblh/X1WbReVQ
         5986OjDNG09tK5gxId2vbgey6FWrJ3RbY4KToNTwPrMuqEa5hxxNsHMw76pOXsvf5wS9
         PX88nEDdYbR3XP+L1/xSR4EjmUqPQc5bHNFesNkz3C5XqXY5n62lgmzNRNEEqqtAirik
         fL6eAxXSkf6bFc6G1F7c03rzis3iCvH9v2MVCS5cxc+BzBXmKT3WwRy3dRBN1UXD4zyi
         zKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708894072; x=1709498872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMduACdAe5MS2CLrgwBpMwG5rsygi0htGVwHAvgeYPs=;
        b=rRETc8veCP+blnt+ObbjOxUoMMSqicS+bEzwt04g5PzvWkPIY1U6biAE89wn7zxTgH
         qFi59K7bnBp3We2DxabEmYl2YJokt4s/+wcQn50s/IaRGm4KMzNvzwmnisbBW7zXcYwH
         VWkTaJ4rIY2bIF7kqmDndFmWPKvwVzslpwIt4L8X2H0gfGM7lJ7fGaDuxZ501bpyRGli
         PlqBF4VZeAQRUB+h62LaiD73Dq1rAWFWswEwtsV5fjtTV49ko7YeiFtrKHi7jlmNg9ul
         qIVLyv3T4cMCFzC+dFT/9PD6x2PcEcFVSnZu77ifxBpB9y1keyeQo+RZlH1Hx4glpSnu
         tGdw==
X-Gm-Message-State: AOJu0YymWzwcjibeBumtftORwvOqMHPWK5VQ5fT0rQQKO2+Nx6Ikbpo9
	zjAlB9ZDlXhyyBr537MTJgA9BKNHdv67HNOHqV1N4iZAKlKCsIsYKrYArJnW
X-Google-Smtp-Source: AGHT+IH9Qk24BWMwCz1HexJ7dusfdGYe1VTrVuL1qmBCll9SVJLaR7R84/4DkYA089UcLOH4c1ogVg==
X-Received: by 2002:adf:dd81:0:b0:33d:22f4:179b with SMTP id x1-20020adfdd81000000b0033d22f4179bmr3266807wrl.21.1708894072239;
        Sun, 25 Feb 2024 12:47:52 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id dq2-20020a0560000cc200b0033b483d1abcsm6005989wrb.53.2024.02.25.12.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 12:47:51 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Subject: [PATCH 2/4] devtool: ide-sdk source mapping for vscode
Date: Sun, 25 Feb 2024 21:47:01 +0100
Message-ID: <20240225204741.650070-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240225204741.650070-1-adrian.freihofer@siemens.com>
References: <20240225204741.650070-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 20:48:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196148

From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>

When launching the debug configuration, the source files from the debug
rootfs were openened in the editor instead of the local workspace files.
We add an exception to properly map them to the file being developed and
compiled by the IDE integration. This also more closely matches what the
user would expect compared to native development.

This is also true for the devtool fallback mode.

Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 scripts/lib/devtool/ide_plugins/ide_code.py | 1 +
 scripts/lib/devtool/ide_sdk.py              | 1 +
 2 files changed, 2 insertions(+)

diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
index d58d0bdc539..09f0bb2a07e 100644
--- a/scripts/lib/devtool/ide_plugins/ide_code.py
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -242,6 +242,7 @@ class IdeVSCode(IdeBase):
         if gdb_cross_config.image_recipe.rootfs_dbg:
             launch_config['additionalSOLibSearchPath'] = modified_recipe.solib_search_path_str(
                 gdb_cross_config.image_recipe)
+            src_file_map[os.path.join("/usr/src/debug", modified_recipe.pn, modified_recipe.pv)] = "${workspaceFolder}"
             src_file_map["/usr/src/debug"] = os.path.join(
                 gdb_cross_config.image_recipe.rootfs_dbg, "usr", "src", "debug")
         else:
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 3bfeb5a3fce..289bbbf47c2 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -357,6 +357,7 @@ class RecipeModified:
             'PACKAGE_DEBUG_SPLIT_STYLE')
         self.path = recipe_d.getVar('PATH')
         self.pn = recipe_d.getVar('PN')
+        self.pv = recipe_d.getVar('PV')
         self.recipe_sysroot = os.path.realpath(
             recipe_d.getVar('RECIPE_SYSROOT'))
         self.recipe_sysroot_native = os.path.realpath(
-- 
2.43.1


