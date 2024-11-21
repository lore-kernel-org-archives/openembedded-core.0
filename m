Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B371E64029
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:54:41 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.10474.1732226073531180587
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jh7vap2F;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso1089368a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226073; x=1732830873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ncn9TxYFGAZMD/iCV3ZNcaYuq9YHmBSzS4e22wiX23s=;
        b=jh7vap2FHzQtPwhWxLeCJgfO0JNEPRm1ObYxBDorFFzUfxc/LCrxmjHB1zcqRPBdFz
         BbCJVOd3aMkP+UYrDAx5BmqxAgPgvW89oLzdH0HX/TSY0MN51RnM3wD1pQ+WbA6uyl5g
         At0162RMOY08CmgzrpEkn1Eg8JEZkP8QaKPO1E/N/fXoY4PDycCjBJDh1tBai6u7oWrp
         WtuOj9LyNU4CAVdgYaxCihJZkZV1monHU5VjluUFH1e7x0r9Z4uchOxrfviULpvHoKCS
         bFujTN6b88T2X3KaU3NBoGLriJycf1MCf3FS+7VoaYmuLxuKPn/lU2JN9Z6KjNKEMSG2
         EeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226073; x=1732830873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncn9TxYFGAZMD/iCV3ZNcaYuq9YHmBSzS4e22wiX23s=;
        b=h4TS8kXbv04qp9hB6r0X1Q294RKy4889VWx2d7lyEd0nwgLpJ3Ery4U9ZATEC/0MtW
         fnz2iMwgq7rh/vukWOfStMo5bQT+1us331N218DRK6Pf8LQzertz39r+KEAB0m+oaNnz
         6OfXb6Dn5dPnpdN8wfOPsmgGs1U5tmXNQ+N5wGZI0daUtxonUvlfK/Z4nWKyeluPTpx5
         hzOK/ngaJ9nkiRkKiTBTx3d6kaxRvaURWjhwvrPDq/f7+BAN46bni7aaEMmd2C/lu7R0
         OVtwf29MgY9V2J25ipZMIwEf+wRZCBXQwf4BInvVFwKhjJVnrhxGB9K9tHWicrCQA1JR
         6RPw==
X-Gm-Message-State: AOJu0Yyab2l2+iVwm2OwBmbVCqYlTnigaihbSgluAx83lvjLyj2Oarn0
	/M3WUd5uu3tnPQ9NPmW7Xpsqn7rdyoIKlFIE+Z36mxqGl9OIcdFgw9NbTLwevjJx4olN4eWkDRx
	4
X-Gm-Gg: ASbGncvPdKPeMNRdrhhHXLl4Vyqs/ETvch6L4kAwpYwc5IWIS97FTCNVgH/DUMs8I/d
	X+Wo59bCxzoXxvVOxaXJ6KIK3Gf00kvkB2UEFyad/PhGokIPl/yuFuAO0HdFlOZ69A6lbrnmWsa
	r4wvh1qHRfMiqnr9QWraS/mogFSUDQD7bsH1vdtxo427WwQVp7MxyX/0ythn0MG6YjafkGDbraT
	n2N8AHOF6Ji73FkwGpTyJnFW4ljEb6K9gNF5xs=
X-Google-Smtp-Source: AGHT+IGX0HxEjpPptPZ2K30vCSmuqv3jKwUQHVFZuo+iAcmF8/RIMvqOTcLHsPoZ3+R7E9Njp35+cg==
X-Received: by 2002:a05:6a21:3399:b0:1d9:78c:dcf2 with SMTP id adf61e73a8af0-1e09e5ff718mr549597637.43.1732226072677;
        Thu, 21 Nov 2024 13:54:32 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/27] wireless-regdb: upgrade 2024.07.04 -> 2024.10.07
Date: Thu, 21 Nov 2024 13:53:57 -0800
Message-Id: <e02fa3d73d479063dac1b70c41752decb2029975.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207562

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f124bb09a798d94eca5e93387bc361b147ce53f9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2024.07.04.bb => wireless-regdb_2024.10.07.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.07.04.bb => wireless-regdb_2024.10.07.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
index daf5e6dfcd..0e4100fba7 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.10.07.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "9832a14e1be24abff7be30dee3c9a1afb5fdfcf475a0d91aafef039f8d85f5eb"
+SRC_URI[sha256sum] = "f76f2bd79a653e9f9dd50548d99d03a4a4eb157da056dfd5892f403ec28fb3d5"
 
 inherit bin_package allarch
 
-- 
2.34.1


