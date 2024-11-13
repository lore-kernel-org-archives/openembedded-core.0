Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ABCCD597CF
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 03:16:38 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.3472.1731467796853028854
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 19:16:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kqKHuSiT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e61b47c6cso5851105b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731467796; x=1732072596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcKWK77yU5IlBhowtt/LNjYNdVqBsNhoD5YVtkt4Lh0=;
        b=kqKHuSiTzxL9SVkc2xtt37GIn6GmHKdr4GyWUkOedrkLWX+Ze9FEf/MFfpJr+cGMcp
         uWah0go0Lsmg6Pq+xHe85xPOfiyVEwnZvCtathvbVoatNBqSuj+B1U4OcRiPgowas1rU
         qbAkAU6HDpl37dZ+bFflckxv9HibrOPOfgQMv1JGWURDK2bA9TTwlNqrinWBnKZ7NWmn
         DuTGBGj0qMzzSCnzqbPZQ0zrwppKI54g7UYsRUbKByQfpN8zdlMNrb+dbyssAYA4/Ene
         vYA81+k6v4U771t5NHRz7PLYeDUqMPRN4KgfZYgxS6incwDxtBs9VPQy//UrjTBzo886
         DBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467796; x=1732072596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcKWK77yU5IlBhowtt/LNjYNdVqBsNhoD5YVtkt4Lh0=;
        b=DcqANLRtNFarlhJR1Pt9HURxMrEHX2BnoRjGONRlwB0SMgqoY3U8kTBIYwNhQ8AxPq
         uq6vd2zy36eaJA8U6drsgOkVyEjf8nyrtt3dYyA2f6AF/ZrNrOMyvJkQ1lz/5jJqfc+Z
         UU4VwYuF4oriQ6ZZ2gjJ5dsabR1he/umKFfWI55wJTmHKwuxTDOvY2uefTJNeGLO1wuc
         wPkTlqBD0ACSSoSMJWyQCOcUMzXGF/RcDQWsmeUC4dvK78WjHbOUdY5QhRjSPGdvs9PD
         UvPX3W5uhAeTiX2OWAorFX5wpADCZiFILQVlEHwPJVcX3U+zAHxbz1LZ7NdsBxLCfa/N
         sj+g==
X-Gm-Message-State: AOJu0YyJXuZeJven8F+XeP03+n+J7OyCpuriHuZ8O1s7ASK3lpfhJBAS
	bb7McFNUxZ2Y47bgYiblAE2atTpYs9hgG87k16NXGrAzZW1yiz1z43FJOr7cV2B/0XovvSHl3SD
	G
X-Google-Smtp-Source: AGHT+IG2ssBuwfuEkpow5rnARXJicqZgtCdGtG5WYA+z7qRLFfUFiANcacDDRUF7Rym/SVbli2mf3Q==
X-Received: by 2002:a05:6a20:748b:b0:1d9:c78f:4207 with SMTP id adf61e73a8af0-1dc2292c2a4mr25516916637.11.1731467796053;
        Tue, 12 Nov 2024 19:16:36 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f64616csm9660213a12.64.2024.11.12.19.16.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:16:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/19] pseudo: Update to include logic fix
Date: Tue, 12 Nov 2024 19:16:04 -0800
Message-Id: <9b06d2741191333c7b11c66e9ab5848f95cb4e42.1731467662.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731467662.git.steve@sakoman.com>
References: <cover.1731467662.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 03:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207084

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The logic in the previous commit was reversed, update to fix it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index f40ad9f6f1..d38c9d79c0 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "cc1f6167cb5065daba1462056e2dce8ff72aa855"
+SRCREV = "9df045968d739ead0bebacce415d05269694de4e"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.34.1


