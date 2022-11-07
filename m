Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF4AC46467
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:42 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.4221.1667832917636303752
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fj/LyPsy;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id j15so16599200wrq.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0/3pY9fGlnvKKJPhU/RYZaEAx9iszOAfFiWAkgztQg=;
        b=Fj/LyPsyCGiHWJdLlOb0fycBqErosJk5/d62Shnb0a55h7rgd7Ri4HyCzQO31ZR05G
         nuWUEJ7qEOkZ6SMNSRvuDdYjzyr3HJ5JXFsQvMGQjvGAOJFQ0883SyPdnM7vagjEYdaS
         RvPonJD1GOP2/HmKQTX1ALABfOvRrwPRajpVqTgWSysjkeTqGJiZ4MhEBw/w4ffCpbGj
         0p1U7obz/aow29uKZor8k5pLZZS99ArX4o22mvCFaL2woj1MV2WIzuQCfmBpfyuxFAiY
         PPibgQAF+ha2RsAPw++0XkjwNDqxTU37hFF01t23He4Ny6VVSxY6CUC5xNnrM0Hr4okw
         m/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0/3pY9fGlnvKKJPhU/RYZaEAx9iszOAfFiWAkgztQg=;
        b=TYpWiFRUfvnmwi7S8Lu/9glzcKxz+QVRAn/Ru+LpM3oJoukaYtVehHbR5iXDmpLu11
         Yamfks5gn58HzYZC1rqBcfet6ch9VsrihkCELUPoeyPL1bRgkHMmtexppdhvMv2eXbLE
         +cMKBRrMfbHCcEUNtESQtYU5yeANe6h6r1PY8WRnLDaxOaCeuuymVOIu489z4+FM3FEt
         ra6VQtcfRthwRDMZa91CfyGG0EvB1SDNgQ0NPiobpcnJGBKgniIFfVa/2CRPahUSvcHf
         UdmoyfOvlBCXVRLJmvTBXEfONFYPx1d496KqqKc88wWk0bJhPcOtpGM712kbJwusSZJ0
         nJMA==
X-Gm-Message-State: ACrzQf2shQ8FtyIyzuD7SV1CrvyxkyseQodNZELvWzWIDbRAODXJyCSD
	OGLJuwoYaRAcxpjYopKl2KN75aJ1Xbk=
X-Google-Smtp-Source: AMsMyM6wncnkJah46LSO7BaWxg9/y9XVDxMc/YyW4QcMW3K7NN6p9YppWUObMsP8/7GbvLliQUVAVw==
X-Received: by 2002:a5d:6a08:0:b0:236:e06b:ec19 with SMTP id m8-20020a5d6a08000000b00236e06bec19mr22788742wru.150.1667832935214;
        Mon, 07 Nov 2022 06:55:35 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/48] nghttp2: upgrade 1.49.0 -> 1.50.0
Date: Mon,  7 Nov 2022 15:54:42 +0100
Message-Id: <20221107145508.1051404-22-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172871

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../nghttp2/{nghttp2_1.49.0.bb => nghttp2_1.50.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.49.0.bb => nghttp2_1.50.0.bb} (92%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.49.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb
similarity index 92%
rename from meta/recipes-support/nghttp2/nghttp2_1.49.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.50.0.bb
index 6c3d543083..66311b2edf 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.49.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.50.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "\
     ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[sha256sum] = "b0cfd492bbf0b131c472e8f6501c9f4ee82b51b68130f47b278c0b7c9848a66e"
+SRC_URI[sha256sum] = "af24007e34c18c782393a1dc3685f8fd5b50283e90a9191d25488eb50aa2c825"
 
 inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
-- 
2.30.2


