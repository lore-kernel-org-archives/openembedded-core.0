Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD300C4708E
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 07:37:42 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.177181.1672213061773846320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 23:37:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FoPpr59O;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id o5so14237595wrm.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 23:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBW7c53v3qWqBWS3mIgegEFXJQPBcvHiEgAw90kwbQU=;
        b=FoPpr59OOShRGny8qZb3FFMadUhXw3mO1P5odRiU5bTegXtAPXkkYbs0WnFoAQzbKe
         wT16WtkbjeQgUQRMFqUPNLJwwp6qicMsSd68njKt6xVs27mkryw2Eej+Tnj1PMWANdNa
         paiWF7Db9NlWn356Jzz9YskEdjxQZjLp0y8FU4E9UMhnR58x7gdJ+0D+KdPirH4bNV6Q
         C/Vs7A5TpS1q+IoEtNa7phGRR6e2tiO1+AvZaBqKMw4NON2TVYElLMDiDuvHs7ACBCVS
         t2UDbzC1xrNWRgkrQ7FHjcHr5HTJuGWgUiP8Hjz6NVxwPO+gIyrg3JzJ2MovSQrBQorv
         fA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBW7c53v3qWqBWS3mIgegEFXJQPBcvHiEgAw90kwbQU=;
        b=lKyvwRO0LNuuNutbgtxbozGVfZsCh8eCHSGN0zvrhs0VGdkErsrrlock3LjcIqrl4q
         QxhMZpsA6SfdQz5qwen2+oGHmHWSUiI8AkPalBOxsU45DI6ha+73sL72qNqjNm0cao8E
         hWGF/HlK6qtZnLIM6FnNQYSK5N35wr0dccI3bETwC/uP6xYRTrc6wEXNcIgr2CwuMhYW
         nGYXq1fvsR5Jk/1K5fQgXp/EbxywzF+9i3u5fqgzGWARlo52V2Rzl/w1RImrY8c0oB4T
         elM2c7EbamjYjHrjpBFlfOM8UST1jlS/ULc5JosfRmVydmP5pE50y4RGNho0GcUCkwY+
         T0DA==
X-Gm-Message-State: AFqh2kpRxrs9ePoiHFiws2LtFw4WMGtNoJNLqUhyxhLnM/6r5o7MyZ1m
	HlG8IizaJ4RM+eZ1/sumyYpQHM42rMI=
X-Google-Smtp-Source: AMrXdXu0Qz7Mfo6FJZa79eoS2zQ6iLf6+sMRY+HIvJDSa5wRlx5P0A0C57O6RjB6dd6dMtiknHXVqg==
X-Received: by 2002:a5d:6952:0:b0:274:3f67:470 with SMTP id r18-20020a5d6952000000b002743f670470mr14370841wrw.51.1672213060335;
        Tue, 27 Dec 2022 23:37:40 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id t15-20020a5d534f000000b002365254ea42sm14802040wrv.1.2022.12.27.23.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 23:37:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/25] libxres: update 1.2.1 -> 1.2.2
Date: Wed, 28 Dec 2022 08:37:12 +0100
Message-Id: <20221228073721.3454255-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221228073721.3454255-1-alex@linutronix.de>
References: <20221228073721.3454255-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:37:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175056

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libxres_1.2.1.bb => libxres_1.2.2.bb}            | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxres_1.2.1.bb => libxres_1.2.2.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxres_1.2.1.bb b/meta/recipes-graphics/xorg-lib/libxres_1.2.2.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxres_1.2.1.bb
rename to meta/recipes-graphics/xorg-lib/libxres_1.2.2.bb
index 29a799a328..cddecbb9d2 100644
--- a/meta/recipes-graphics/xorg-lib/libxres_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxres_1.2.2.bb
@@ -16,4 +16,5 @@ PE = "1"
 
 XORG_PN = "libXres"
 
-SRC_URI[sha256sum] = "b6e6fb1ebb61610e56017edd928fb89a5f53b3f4f990078309877468663b2b11"
+XORG_EXT = "tar.xz"
+SRC_URI[sha256sum] = "9a7446f3484b9b7538ac5ee30d2c1ce9e5b7fbbaf1440e02f6cca186a1fa745f"
-- 
2.30.2


