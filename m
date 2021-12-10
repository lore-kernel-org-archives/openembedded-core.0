Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D10C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 13:05:55 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.6760.1639141553998593732
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 05:05:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oaqAYhuQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso8981182wml.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 05:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F9WddLt36Db8dQVobI/US3k/j5FkGZBtZ2s5mgOCaoE=;
        b=oaqAYhuQqhq1VAmdCBLRqlY/rTL6TaA9qCNwrR0oCzWP9wIlU2P16cEW4FNFxKVmpW
         rOXIKHRyk16GTpSf9ndx/UEalmiXHPKXIEware3dtcM0IgLrOSccN0GNGQgUa3e8bs8x
         oglvrzyGUELOYxQVplEXmZheMgDGKb6do8qVKF9+TgcAHIEqAH0aCM1hIZ81LfPPmUib
         Suac7A0YyyNsJ5bhX+7/DlkTQa+IrUrPPgyVKQWStuU12nAfeYA8VGb2h49wxZwS1zcf
         O7ouFdU/LccHVemeMDHrTnOLq5oZoEaZ0VaAtV8EQjinI3/EcdVmlkSzZW/KGyshupM1
         rvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F9WddLt36Db8dQVobI/US3k/j5FkGZBtZ2s5mgOCaoE=;
        b=jSN+xB3x24EsQviY4dhIx5P2UfV0MHNnvRDZQ4THq89jsfhEiDrvXpqBpxaDxpHcCo
         B82Q2Mh8t7Mu7ODNx4Mbe0gba2JFEsReKtoGciempzJdUdmvU+v+8cN0NzRQqCCFn+iL
         4MJb1wVjZHcPqIcVRfMmVKRDPwV/iCrQuPxTjbKAENJvLZAL51FUaWAbfbK0/4hGZ6V3
         TRhAA4XAsw18uBT5lYVqNWZN0oCEKfAw3aZVWdaUF0km9yOS5uHBRqD9MeqHhh451/5F
         J3Dwvl7eLkanj3U7YL3WLbxPZPAciYvFVpqcsslQYaJOqcVhqAIjxzywGit79mfgrpfE
         YvMA==
X-Gm-Message-State: AOAM532k+imainPSjKFxCWRsKdGPzHlltXXzY2OfemRfTfnxXbSi/5DA
	CyteaTmk4ttdUmgzA5ID+JiKGJO7UO8PJA==
X-Google-Smtp-Source: 
 ABdhPJwum6B0dEY2yPll+JsDzb8Q+lr3vGkaPV+XOtnU5tf1UfeGz8UkOaDKnNwaqOrdcMpFZU21gA==
X-Received: by 2002:a1c:7f56:: with SMTP id a83mr16371441wmd.32.1639141552405;
        Fri, 10 Dec 2021 05:05:52 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch.
 [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id
 v15sm2649214wro.35.2021.12.10.05.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 05:05:52 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [oe][OE-core][Patch 2/2] lib/oe/recipeutils.py: follow changed method
 argument list
Date: Fri, 10 Dec 2021 14:04:58 +0100
Message-Id: <20211210130458.39716-3-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211210130458.39716-1-max.krummenacher@toradex.com>
References: <20211210130458.39716-1-max.krummenacher@toradex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 13:05:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159520

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index a0c6974f04..7b5b6bf10e 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -467,7 +467,7 @@ def get_recipe_local_files(d, patches=False, archives=False):
     for uri in uris:
         if fetch.ud[uri].type == 'file':
             if (not patches and
-                    oe.patch.patch_path(uri, fetch, '', expand=False)):
+                    oe.patch.patch_path(fetch.localpath(uri), fetch.ud[uri], fetch, '', expand=False)):
                 continue
             # Skip files that are referenced by absolute path
             fname = fetch.ud[uri].basepath
-- 
2.20.1


