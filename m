Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B72FCF537C
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:21 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.7695.1729686916098676860
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zEtYFYZR;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7e9e38dd5f1so5070004a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686915; x=1730291715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=is6aaRYO+DjHEYwc2B7IDFZ4SaO9RxhSShgVKCNzqSU=;
        b=zEtYFYZR1bQKb9kun2x32Zz/GKI0Repm6MRlzcFPhcC4SnIDphMsfNj9pKQw5khjnZ
         HqmDGVceQz5sIBOqHVl/K3SoGxcvKwwVghS9KRKJHqviPNNrl5AoE6d4E+NPbBk03Ya+
         cfRONEmf+cpa0RBtKwrEfm5LGOH7tzv5WvJhyv6HTU+JQgMU/qzQ5ahw9Fa5XTUrdM+p
         S91ymuz8F0od/bFNx7C1yuHI6IEPuYWGeQjheqOBlA4CcRQrrkXFlDGP5lIrAMd8bJeF
         bAzKGV/GCXPBacLYNbASHeCLJS4vBQRA/Ek3E3zBk52ZVsWwbjzhBpR4sGYxevF2hzIs
         Febg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686915; x=1730291715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=is6aaRYO+DjHEYwc2B7IDFZ4SaO9RxhSShgVKCNzqSU=;
        b=ovusx3I6kJb6+j/Uj9vvlfnKpZg/5T3P0dXimXxBiogk98h3tROmTgseBuvmEaHSbe
         beYCdncGO/YWCzYizaeXxHpKDv1fGZbG20iUSezbH/tYzH3u/CdvWFNHjiWqhD9yPu7o
         DaYMIgx1FHUtr2ETL6VxtSGgg+ypx1uVU+h6WEbzZkEq1T/U1KE8moD17J6qU3Hov3g+
         1Eb+LIrIAOxA1rccweYUOfFyURpecwufPv0mixf/K2B16fEZf8Cbb2KeQK5296eGF8tD
         PBXEdyivDmTlwMCvlIUIoiIzApwLwlrsluUSPgrkusiIgXRY/oT2GcSl859dt3wQHgxa
         wAVg==
X-Gm-Message-State: AOJu0YzIg9+XylqALOlJ09f2oLCwUckGlrXd2wpJ8JcDGXKgYLfmbzQY
	/RY+VA7GO9iFOharukJ0gZMGMo/yaoLV0G5qlaz4a3MV1Pm9F8rFQCxaV2Hvf9zlgOjrUFFFcCL
	f
X-Google-Smtp-Source: AGHT+IGtA2hGcWqWmPteWMGtJHSJVb1RYiyiukimbS2KtmKhAk39bP/YwqkOTQBiLFt1ckqvm7ZgJw==
X-Received: by 2002:a05:6a21:70c8:b0:1d4:e638:d066 with SMTP id adf61e73a8af0-1d978aead3emr3102245637.6.1729686915387;
        Wed, 23 Oct 2024 05:35:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.35.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:35:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 20/27] binutils: Fix binutils mingw packaging
Date: Wed, 23 Oct 2024 05:34:28 -0700
Message-Id: <3e953bbf59ed4bd08e40403fb4506dfc35a58f92.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206231

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Use SOLIBSDEV in FILES to fix nativesdk-binutils packaging on mingw
builds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cba58ab2f380252f231fc78944499ade65e32223)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index e176b5cff1..e1b903f1eb 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -18,7 +18,7 @@ inherit autotools gettext multilib_header pkgconfig texinfo
 FILES:${PN} = " \
 	${bindir}/${TARGET_PREFIX}* \
 	${libdir}/lib*.so.* \
-	${libdir}/bfd-plugins/lib*.so \
+	${libdir}/bfd-plugins/lib*${SOLIBSDEV} \
 	${libdir}/lib*-${PV}*.so \
 	${prefix}/${TARGET_SYS}/bin/* \
         ${bindir}/embedspu"
-- 
2.34.1


