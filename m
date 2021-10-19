Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B33C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:30 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.11507.1634657669592650334
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IEBU6KUo;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 s198-20020a1ca9cf000000b0030d6986ea9fso3646133wme.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dsHP7vJotdd1pPvGRbtkEs/EdQkdCYolGASivh/YfLk=;
        b=IEBU6KUoapdLIvfHCfxHWxwEL4HFJ8HS5DgEg+zbpfGbz7kYv098+wktvrDR5Qy4Zh
         fG52vK9Xi9tFcwAQSRvuUuToz5MdBOXv5YoRzsUzEywDEuRyutorzDl4BjCQRjTSmmjG
         mn94Mkgw92V0h8Qry9wKllFATETAI9lCKOxQaDq2h0OWx9Q5Y5nqG2C1KLWQFxtj2f3G
         72Cgup2HkJDlzQG56H4+Bt4suj9s+4FdkTk9OxSDbqV7SH3cHOxuCGEB7NPJGhV/lvIt
         3bVH/4uidUjgqfa9AM6RITY7aFOeSfCGCr2hQ3KpCW1M7xndGNb37PutvKNzVjw3wX5z
         LKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dsHP7vJotdd1pPvGRbtkEs/EdQkdCYolGASivh/YfLk=;
        b=J1NbyQHqI7nWm98o1IRSh75MEpJVpcyZ4RAi5COY076sZ8YZS7TSwgDheSE4KnQnXq
         8PE8Su4rVorGXgmvN1hJYVZVJJGEEY6gxBpY9JLFhoBEqY9mGbJ7C6/0v4z5FSL8lpXg
         atiOljmpOYTpDLCwO13NyeD5F8GlTF10sH2+yCOiIL6Qc6bBmb14Ctid8hf4evkOL2xJ
         1AtRJYw+gRKw0ts2QwlCHPxTvjIAFGYFu5Os56Och+mO9VRjPdW//TzA4zW0GOXV/8zV
         df6mx6aX+7GXiHYWlks0j9KligRHPazkkSpKUY0tHmXnUfVQeCqXCPbo1O+FY+S294/C
         5Sxg==
X-Gm-Message-State: AOAM532Xj2XPB3voGESlNwagzeeOeX2cCTLN1DZplyKUmKlalqInMm01
	XiX8WFGtOFZhWYdjvOCrptiJGkQDq8c=
X-Google-Smtp-Source: 
 ABdhPJwkAqEX/v5eu2sBhfevPvAIvD8tshz3b2c52BL4F7DGKFeKWfV+5h7nyYeUdaicRDbppFJe/Q==
X-Received: by 2002:a5d:58c1:: with SMTP id o1mr27881428wrf.181.1634657668283;
        Tue, 19 Oct 2021 08:34:28 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/65] ovmf: update 202105 -> 202108
Date: Tue, 19 Oct 2021 17:33:21 +0200
Message-Id: <20211019153419.3319802-7-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157126

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 5d54bad473..ce3b650ddf 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -25,8 +25,8 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://0001-Fix-VLA-parameter-warning.patch \
            "
 
-PV = "edk2-stable202105"
-SRCREV = "e1999b264f1f9d7230edf2448f757c73da567832"
+PV = "edk2-stable202108"
+SRCREV = "7b4a99be8a39c12d3a7fc4b8db9f0eab4ac688d5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
 inherit deploy
-- 
2.20.1


