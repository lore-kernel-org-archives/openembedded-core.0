Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5DB9C636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:14 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.3132.1675840920649512172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TVfIePzB;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id z13so5183001wmp.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwTUq/G2BDmWtxc8ZpEt8BBkq1tx/JSfPzQjaJzLMSY=;
        b=TVfIePzBO8w6QiEturgZVfOjKk+odHowJrTQPtWw0cj5zux76Nz0I1pySYe7ITmIfM
         WCrbIRvb8+Uo+HeGVnyaqMNIRS4CmwNgRn24oZ9cTE8KjfPgb0vvORaqw2/YQqX45p68
         vMmMVC1uvtB2fUF00zqTVYsRd97bNeVDTKPRSZNfNPCkGT3wHFpNPO7Px4X4mkWlUO62
         Uz8WVizq6Rycgw5ce+VeGEcTefzwwcFjXK12C0Y4S07sME09kkjaRvwkftOJHYTwT4JZ
         7S5c9b3gLU/pig3fIhG81cqY2VkfO/6C5WlioLnkGw10CVqIyhottO/DXPCojzHvDVwk
         DXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MwTUq/G2BDmWtxc8ZpEt8BBkq1tx/JSfPzQjaJzLMSY=;
        b=dK9szSAoz+ojwwhtAomcltj+i38fOEVgYaDc3loo2UySpGaOwvXO3Jkl4i4Af7hdlq
         fW0hlKevIkbqo1Zr7+Wz1pNfW7NpXbR3Zgtm6YVqmYJMZMtPUQTjdLKGf/jB6OFDqShZ
         fmniwsz6ZlqZqHaWdKtzsxOBKCWB1lm4aWDPS1V6qWRAhydK9zcUm5zMY1O0Oj+WbHKG
         uilk1PS5mn67k67E+GpS+pSp2PwgsyiPo4TTEq5yoQ757Dd093fDS4SYKsEH1lXdtQrK
         PD6UtyR/rf14P3dqeg8r8SohXrFlzIUBfpecm5gleKo54TFzM0rxhsnW5iwKGpy/3cP1
         tSqQ==
X-Gm-Message-State: AO0yUKWRHNGx23ufnuhGdiKBlhXnsjnWLGu4BpvGSJ2HJt3+iHFoHAwZ
	rYO/wFOzh2yVxQsn0+z+nMjOislVs3E=
X-Google-Smtp-Source: AK7set+XObH6eDiTvgB/YixKxTu4TgXXGKL7MPuOUin0hcXumoz9Aaci6k4dMCoYoEomGLiO+087eg==
X-Received: by 2002:a05:600c:3085:b0:3e0:99:b59d with SMTP id g5-20020a05600c308500b003e00099b59dmr5577127wmn.21.1675840932602;
        Tue, 07 Feb 2023 23:22:12 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 43/52] piglit: upgrade to latest revision
Date: Wed,  8 Feb 2023 08:21:34 +0100
Message-Id: <20230208072143.2930292-43-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176882

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 7858fa0b08..b12dd46ea0 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "e300648a805d62101de341232d99bfec1cce78c5"
+SRCREV = "acc0e009d0f7e843148205d03fda53ad5f1b7c8c"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.30.2


