Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DAFFCCA485
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:01:44 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.31131.1654516897486351375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yg6HoV6n;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id m26so8128357wrb.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rlcHsxVwTgOdylUAO0AC1oaAIqMX7KRnGcj/SmZjGCA=;
        b=Yg6HoV6n3+YNEVUJzNjnszyOq0odXDTogjDfPPvESbNSMQgONEtx4wrjWy21PhxS6+
         i0GDvIDUckDNalm6pk3yme19VXWQ7HaWohLMhU1o+O30Mh3uUzS/gTt0fKD/oN6hJTbk
         IlHHb+Jpctz9ltiucu4ASKdTdCDfIIsgo/+8imzH/EHybh2PAo0DoePAL8pzs8nhj0jz
         cbR6vIolvW7DkmO9PWFz/gPZePUxMoD0ZB60MQfm+/wVUqUhX36JP3B4W4jSSTuDkqcN
         b2SQtk353Hnm/JbGT9XeIAI04RCtdilPwC7YPbKEM+cU2lZiPeiNvTJUihoLJIdqxHEQ
         ICGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rlcHsxVwTgOdylUAO0AC1oaAIqMX7KRnGcj/SmZjGCA=;
        b=q4Dq34x0+kd/Fq6QXNhWY7+kPGlZNfmEuSkPK9rgHkZoIkvl6rHF2OmPHwX/t0+SIO
         4uX7RpYp60XWOFFO44eSqqQ36fdmBUC9xDKP7zYN/8fKvPhOIyiQXRV0Jt21hfPcS3Yo
         itafNSGR+xXrTcrSu+qjWcxwfFQG62uzTRK5vnG7c+g+IOl6ND9/vMHtHct2cPuX8EaH
         qwU7/pzTsm77GG/neMaHfsjW3KVMZIz1qyVdcm41QKXHPbo+tgARlU03WJx0vMdeg9PP
         ElMoHygTDFrkUnOqR8GAR3H9mPxSnX8jiZP2zy7wRo+6L4FGd9w2NlOqQXeNft9kh053
         iwbg==
X-Gm-Message-State: AOAM530dWqf4ZNI47scr4NjogMwVTn3exeB2St31VvFf/m4Ot2eV4QIN
	CtSFGnvA9gWdY4hSTDiN+tYQZiq4ZJRt6Q==
X-Google-Smtp-Source: 
 ABdhPJy01j1UwuWYvm0tz+QGWpsnb3MkGy/NjmmltnsWVAoatYokauVo9aVjzyFHBIH4NEbAQRs1bw==
X-Received: by 2002:adf:f48c:0:b0:217:9a33:967d with SMTP id
 l12-20020adff48c000000b002179a33967dmr6826073wro.598.1654516896063;
        Mon, 06 Jun 2022 05:01:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002100316b126sm15526455wru.6.2022.06.06.05.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:01:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/21] seatd: update 0.6.4 -> 0.7.0
Date: Mon,  6 Jun 2022 14:01:11 +0200
Message-Id: <20220606120126.3381438-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606120126.3381438-1-alex@linutronix.de>
References: <20220606120126.3381438-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:01:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166599

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/seatd/{seatd_0.6.4.bb => seatd_0.7.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/seatd/{seatd_0.6.4.bb => seatd_0.7.0.bb} (90%)

diff --git a/meta/recipes-core/seatd/seatd_0.6.4.bb b/meta/recipes-core/seatd/seatd_0.7.0.bb
similarity index 90%
rename from meta/recipes-core/seatd/seatd_0.6.4.bb
rename to meta/recipes-core/seatd/seatd_0.7.0.bb
index 601736adef..59ef6ad9c1 100644
--- a/meta/recipes-core/seatd/seatd_0.6.4.bb
+++ b/meta/recipes-core/seatd/seatd_0.7.0.bb
@@ -6,9 +6,9 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=715a99d2dd552e6188e74d4ed2914d5a"
 
-SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;nobranch=1 \
+SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
            file://init"
-SRCREV = "df13d03f9cfd0dc0c2b3298cd0e5eb4e4a10835e"
+SRCREV = "a803ba0502cccf147eec7fbcacd11c5b8643c0e0"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig update-rc.d
-- 
2.30.2


