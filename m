Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F2DC64EC7
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:04 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.3132.1675840920649512172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fYY3za9A;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id z13so5182667wmp.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECtvUpopIhyZojZ/gLQCLSaaoIePzS6hNb0IFhImDM4=;
        b=fYY3za9AeW4YMw+ehXoAMB/XgCsV0b0LIAGQfaPVvL0Xy812hun2noPSAxUKEaiIM3
         Hnx4mLZrTn/rSocy9/WDwfSwx2uDnkB2C1pMxzlA74hmQ2znOinQHGT0Rsq2TC9GlU8r
         bCwV8WXW9nb4ZJ6nvZZekUIoFE0Tu4BiSMdhfjXl5EhzzEcGbUbwO54ht3Kv/Z2akr7J
         MTjUfl2SmpzILLZYYstFoZGfm2o7G0MB2guAEklyculgK08oT5mab5meEXt8zO52k6jC
         ycC94WacKIb1W+40yFUbYI5pttrOvsjN0X0o4WcR1qzu5LIvf9m8NHO7Okj2LqBVATBc
         tGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECtvUpopIhyZojZ/gLQCLSaaoIePzS6hNb0IFhImDM4=;
        b=S7Y6bOGDSlzoxVK9Lid0kGNqA9qnLf4ooQY4MSIYFYI/Pl5FZYzuJBh4UFBPc726xQ
         qdGKCFZZ6w+Gn9SHXf8X9AFaIzNYlrsDG4AZV+7uG4w5Q3p6Fc3jq/TvTiuprtZCF5YE
         lxfH8AkDAa6fET7eXj/R4vO8j4dMcVY5CJQSliU5xIThRlgvuZZ1w3ivsjkIfavqR3Kw
         3Ckn0Xf7KPW+6yo6kZuc4Mso9HhTLewNzhijbHqHmC4Gv0FMSBZvOI7quFQtqWLpsIue
         +TNfSSaGnBj9GIOqP+9FPf6NQg7FCQKL3LoyFp3FyI/WG5mnfOFIX3BUb94HAO0JgPeP
         cggA==
X-Gm-Message-State: AO0yUKUeUhgLvd2ZLQON/edWZwokkjZPBIG3iV3nDHIBi9TIdfV0JuFo
	e/Mq1eb5tUyruD+1R1Qkxo5OmbPDjIc=
X-Google-Smtp-Source: AK7set9CaMHyziTVHBODCc17+VPB1Vtqk5yf8NEKFDvVijp79OLiz36Ubt3DsLLQV6NK2WId7YSDvw==
X-Received: by 2002:a05:600c:30d2:b0:3dc:4fd7:31f7 with SMTP id h18-20020a05600c30d200b003dc4fd731f7mr5192422wmn.41.1675840919129;
        Tue, 07 Feb 2023 23:21:59 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:21:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/52] spirv-tools: upgrade 1.3.236.0 -> 1.3.239.0
Date: Wed,  8 Feb 2023 08:21:11 +0100
Message-Id: <20230208072143.2930292-20-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176860

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{spirv-tools_1.3.236.0.bb => spirv-tools_1.3.239.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.236.0.bb => spirv-tools_1.3.239.0.bb} (94%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.239.0.bb
similarity index 94%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.239.0.bb
index 1099925cf0..5109bb5333 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.236.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.239.0.bb
@@ -7,8 +7,8 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "40f5bf59c6acb4754a0bffd3c53a715732883a12"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=sdk-1.3.236;protocol=https"
+SRCREV = "63de608daeb7e91fbea6d7477a50debe7cac57ce"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https"
 PE = "1"
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
 S = "${WORKDIR}/git"
-- 
2.30.2


