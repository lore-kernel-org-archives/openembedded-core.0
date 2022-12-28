Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A87C4167B
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 15:23:55 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.182567.1672241031884907521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 07:23:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TNPfiCNz;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id o5so15231432wrm.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJq4XgxNyLcpxuGPxnxi9FqL+2Qk34NvP5k5mKawE3E=;
        b=TNPfiCNzz2ml+e/2r+GV7kMFl2SXRcXCzX8bpGaVHUAQ7Xd84jjfS2zy4et1Ske3dX
         aS1bqAgfg7ugqL53bE9/hKDtdWBN6k/tZiTakiVrsC6nODcYrYbtV199tk8ctJU4sXBS
         vqaE34HdQ0toR7Am/EjU21d2Za869YyqeE4g2j8zLD4w1PwVSq14zkqRgPKLO0ji6+Kd
         EqvFm1eh/DRxZ9ZIjB412ccHKmDXH139GgnwCCbh/M5aa032t2bgr/YWOZE0ECdJKjz8
         EXRjmiQPRBZL19RhxzjbGP5JmK5vLMYbjpWrQyZIuVfr3IEE57U5DZtIloDQplog+Ch0
         v5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJq4XgxNyLcpxuGPxnxi9FqL+2Qk34NvP5k5mKawE3E=;
        b=VsQPIzVj+0Pwp4eVJk3oo+ieExviS9xaaU0Zzy96+cXWdc72VMdgij7diplGEectMW
         lN3xAclGYfTQFm50at8NmvqEdf7c03qx6kAZcYIMZSVq2p7L0H57eSxEwMTRJf+nmGA2
         /7kdGVWStPCLOZccsNpRhcjNTEHENv3uTqaM2ROLqdwWDS+o0BXX6e3CWz8CsaWfhr46
         JhdnqGJjVGVoaLunQXzG6TLqberbCfSMALt2AqDS8Dcqrd3Tg34E5a9s8EANTyEvqVao
         Tu21JQEUrgaj4R5s7EwUt4GfN6YZtheHul6SWr/n2OkKH/x/1R/vbqez/YDXKpSyuWlS
         C6Jg==
X-Gm-Message-State: AFqh2kpvqdTt23EQyUtAAoSdBQ+Vi9HqJGf3hM6Z9g10R809KLiVAsMq
	QjBMLEPAIlWDZ8EBix4sJE4c0uY+1vs=
X-Google-Smtp-Source: AMrXdXtVgz9N427ebigk0/Ohqhv6Et4YT7cLktZzz8ZZU4aAh+VrPgx29VpZ8qtq8sQTyOutB19hgw==
X-Received: by 2002:adf:f781:0:b0:242:1ba0:208b with SMTP id q1-20020adff781000000b002421ba0208bmr20519350wrp.64.1672241032756;
        Wed, 28 Dec 2022 07:23:52 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id r17-20020adfdc91000000b0027973315213sm10884893wrj.89.2022.12.28.07.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 07:23:52 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v5 10/12] cargo: Drop exclude from world
Date: Wed, 28 Dec 2022 15:23:32 +0000
Message-Id: <20221228152334.25449-11-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228152334.25449-1-alex.kiernan@gmail.com>
References: <20221228152334.25449-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 15:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175080

On-target cargo now builds/runs.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/recipes-devtools/rust/cargo_1.66.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/cargo_1.66.0.bb b/meta/recipes-devtools/rust/cargo_1.66.0.bb
index f00c67bef5e5..37e0123ee3d0 100644
--- a/meta/recipes-devtools/rust/cargo_1.66.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.66.0.bb
@@ -21,7 +21,6 @@ export TARGET_VENDOR
 
 S = "${RUSTSRC}/src/tools/cargo"
 CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
-EXCLUDE_FROM_WORLD = "1"
 
 inherit cargo pkgconfig
 
-- 
2.39.0


