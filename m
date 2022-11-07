Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED1EC4167E
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:52 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.4141.1667832946639349921
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DhQbbRm8;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id a11-20020a05600c2d4b00b003cf6f5fd9f1so7318457wmg.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ny8oaMZKRVA88/kLINdSSI+uOAbdInRNPJjJ9r3z2o=;
        b=DhQbbRm8avH3qOus+Xx72dZsZtFwOVUb8lsL14OCGiB8WacdzPKZOtQEjcgB+hHgOi
         acIg93NKroi856lfzqurLGSb1i8QfZNJwa2Ey1BhREgVyLI6ft9JLPcqem2yoRNRn1kq
         XXeRQLkOCwlcaYxEZ4k6naPzr+7/SJ8iRrg56w99FS+j3dKA8CuYKayf8ddny5L8N+yw
         6PKFS5ZiG5pkKzqUJz5ElPDdv6OglXani720Dcf+oVb/wBLCcp47Hc6W/BiWA766Ito3
         lK4VRq4z9oxGAWYsZoIVvMoWyxzlOn2Z4RjPEYemcWyV7s0TPLB0kbST+79Y4GhKTd/P
         x4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Ny8oaMZKRVA88/kLINdSSI+uOAbdInRNPJjJ9r3z2o=;
        b=s5Q4+mCejoSZbehe03NFFQlSF/mpGmbQx6NE5CfpC/FCntFkSLh3vLwMgsEXl9+Ob/
         EMppxMA+u9/8dVqio6ZOjA8Oq4H3PD7/8Jim99N78XcB9bCsrmY5Tv7sneAukHnxPfKb
         EOWPECV2LzD6y5yHVctcYNz6+qDIlhxmtzGHb63+qZxbQ+n+zsNZKZKukosKQ1hW1Bia
         tUIAhQ1URu/1zsR2XdHQNfnTlaJXQFsqZXozzJdpvI4+bL/2gV/TVN6WUfTh1HhZdbbc
         JzsuHaLyErdqpenfXpgHho22m69INBq/eKtN8fW2oxcGVu/BMkT7D/oWlDH52z3rQt27
         JKYA==
X-Gm-Message-State: ACrzQf16A+zo7Gueb9q21jgd3eFNUvaSx/yRsAc3IEul4gpVatOQCXJW
	eiXQuoNCo/D3IyMatYNmziax011Fh1E=
X-Google-Smtp-Source: AMsMyM60Uq9FChZ/vY1zhqv+Xctk6K98tFR8Mv+iR5kUryXboQQ0YDjVyRlZGMwEp6FYymVS1+DocA==
X-Received: by 2002:a7b:c845:0:b0:3cf:62af:e353 with SMTP id c5-20020a7bc845000000b003cf62afe353mr34297085wml.43.1667832945102;
        Mon, 07 Nov 2022 06:55:45 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 31/48] mmc-utils: upgrade to latest revision
Date: Mon,  7 Nov 2022 15:54:51 +0100
Message-Id: <20221107145508.1051404-31-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172881

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 0bb94ab93a..d2590d400a 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "d7b343fd262880994f041ce2335442e7bd1071f5"
+SRCREV = "4a32d090dcf6fec6ef0948e59094c4de406906cd"
 
 PV = "0.1+git${SRCPV}"
 
-- 
2.30.2


