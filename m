Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B985EC001DE
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:30:04 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.7504.1686734997525737220
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=c4frmC8+;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9745d99cfccso84812666b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734996; x=1689326996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdwEp/pP498KkIVhVeaVdG7YR6RC2L0AuSbetvqyLoo=;
        b=c4frmC8+Pz1z/xOeiPAYYAb1mSx0jmR2S/qKHmu8N+y1EdFsyChONlgLgD8YLdtB0C
         yBPVq3QLUV4fQaV0aRussesvppov0R8xqjbtVqSjxcp4Q92Z5XNRZ0ZF+r5s3wbUYk89
         SuP4btiNW+rZ0J7dzyjERVqRgPBmb5kPmq08zkAf11xV1ocaiQ/FUVwV39g6vl1u0Btv
         G4NPiSkrZYAwmwvvGBbsOdsN1cGxNgZHfXB6loS/iDSaRo+ndpjPifJLcY5vuf68XSLi
         SSOLi5Rh8jB8u7SE5bdtpKxjd7LtJYWGe+vyTCq1vlzqBp7b/ft1NizFk4EX6/dAXFFb
         wkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734996; x=1689326996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdwEp/pP498KkIVhVeaVdG7YR6RC2L0AuSbetvqyLoo=;
        b=bZiRdhHHleBezhNXUPawS9DPNUJbpqkVxb7oiGQ8NqzE3CSfiKNI7eBW70N8fdtXMm
         JcxFdN9k4+R3B/OIN1SVhf+V7wBVH15A4S1WPaw+TfC5p81o4kNoJy6vx+lsfmBbqn1+
         ju2pCIlkaEo16D6K7EbyJ07x8QzOqA94BTRV/LZGhKvrb6QGvSAXmsGIJFw8o9g2XWyl
         3sk8cfc8SkqB2jgu/b7QgZj2s1DkHt7Fhig5ruXbygYgDdvui6K/aSPzhljmZ6B/6Fge
         XyfaNn9i2Gw+hZ9/mmTyFV9O+9sTWB+bFTr3O74ylvVxbA4mH9r2MgTGBbadYujiJ9eP
         ygIg==
X-Gm-Message-State: AC+VfDyHo/TsppbOoN6cdEap1kSMy7jEE4MxEsAh2/7f1Wbr2a4LayNd
	g4v5RCH8TRofYlObPyWeyJfR9EUWkEE=
X-Google-Smtp-Source: ACHHUZ7iLBY8fNwcusn66UqhEjgvbGJ92GvNNmtvcixH7+dEcmG8TArzqZXMuCVRStI11gYKlPENZg==
X-Received: by 2002:a17:907:9806:b0:94f:5847:8ac with SMTP id ji6-20020a170907980600b0094f584708acmr18180857ejc.51.1686734995919;
        Wed, 14 Jun 2023 02:29:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 52/55] wireless-regdb: upgrade 2023.02.13 -> 2023.05.03
Date: Wed, 14 Jun 2023 11:29:15 +0200
Message-Id: <20230614092918.4065570-52-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182797

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ireless-regdb_2023.02.13.bb => wireless-regdb_2023.05.03.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2023.02.13.bb => wireless-regdb_2023.05.03.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb
index ce60154f1ea..cd3f52fc763 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.02.13.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "fe81e8a8694dc4753a45087a1c4c7e1b48dee5a59f5f796ce374ea550f0b2e73"
+SRC_URI[sha256sum] = "f254d08ab3765aeae2b856222e11a95d44aef519a6663877c71ef68fae4c8c12"
 
 inherit bin_package allarch
 
-- 
2.30.2


