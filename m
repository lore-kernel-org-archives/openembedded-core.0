Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C25C77B62
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 15:30:56 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.1102.1680103850977946221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 08:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TZJruCsF;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so9954635wms.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680103849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKr1j1hZIjN/A0KbFl3IZ5cAZYIF8AY0qU7hY1/3eOs=;
        b=TZJruCsFHuM84iIuwxO1pua5zTrsMtzC6hmru4sZNA+vKZJKyTjulXVya5At/lcZMP
         /Aw4xnCldaQT2JzMVnhI3w9njDPrKLK9Z8Mm/7fO14jat5V5bLorS4Zm2yit5ksbAd7B
         YrEBwpyMZHdbvBi1FF19XsocUs5kMaBtmeGNjUmbUW05G7GRwVjcVZ790I9HWcsrXePv
         5pjCFTMfpM55VwEKijq/9MjYBtpcLz9RTMbXXgW6pPf1fFSNUBhs73amERraEFCf6iRG
         4uRf26mVmmN4WeQvTGqZGYAUuqC9idHh7f4LoMPrqPRZlm4e4/8HiqUSIgqg7Mcq+hEu
         JBbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680103849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKr1j1hZIjN/A0KbFl3IZ5cAZYIF8AY0qU7hY1/3eOs=;
        b=Kq3MeERI/ZztuhAaQc3OojomiqeZOo8bzm9QvFzQifyp5wo5QWzrwU95BNqkj5xTqO
         tWatInJfpz98dAEo4Di/SKx/WPJJ4xDLwzTOnxwZ2gjxnDhFZokQ09Lfmp7KeRpaRV+Z
         NQqKKnY8ax0MIpyNa7ztwi6dbt8NiE6GuiN+LwMfKW+FBRXLzUD9tnurLysM2bBLBlUZ
         ajjkKDtvTtLEgw1kKsWhXWLsWdqT5zGqPZ5lnGXOOXXPoilOdJemwmA/x+PlhdD7NxKR
         prcn6EERcuJrpxVRbMzgLGtq9O8QG3aH6X0GSPHmdlXOByGZcqABSi9C1yoVyRe04bWJ
         OdFg==
X-Gm-Message-State: AO0yUKUPrmyip0haun58sWaxGrho4VvLpXnTrxzlRbsKNN353h8oez7D
	RtOJdOAKI4GFP+7ekQT2JnlyEiqyvjE=
X-Google-Smtp-Source: AK7set+mPLE0nwI7RujFAEGHNcdqxRnHUtDBSPZHS9T7zE9nQqB+TvabX83m9fb0e+eato48xgZ4jg==
X-Received: by 2002:a05:600c:20d:b0:3ee:672d:caae with SMTP id 13-20020a05600c020d00b003ee672dcaaemr16030272wmi.36.1680103848959;
        Wed, 29 Mar 2023 08:30:48 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:f236:1d99:4c31:5762])
        by smtp.gmail.com with ESMTPSA id a13-20020a05600c224d00b003edef091b17sm2607378wmm.37.2023.03.29.08.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:30:48 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCH V4 2/5] cargo_common.bbclass: add support of user in url for patch
Date: Wed, 29 Mar 2023 17:30:31 +0200
Message-Id: <e582e08238b249a0ec7198a5918c65a6fd59aba0.1680103647.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680103647.git.frederic.martinsons@gmail.com>
References: <cover.1680103647.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 15:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179287

From: Frederic Martinsons <frederic.martinsons@gmail.com>

To handle url like git://git@repo/project

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes-recipe/cargo_common.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index 63b1382908..82ab25b59c 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -134,7 +134,10 @@ python cargo_common_do_patch_paths() {
             name = ud.parm.get('name')
             destsuffix = ud.parm.get('destsuffix')
             if name is not None and destsuffix is not None:
-                repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
+                if ud.user:
+                    repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
+                else:
+                    repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
                 path = '%s = { path = "%s" }' % (name, os.path.join(workdir, destsuffix))
                 patches.setdefault(repo, []).append(path)
 
-- 
2.34.1


