Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02C8C02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 15:31:11 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.22137.1739892668968929887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 07:31:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cSByd3if;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38f325dd90eso2288878f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739892667; x=1740497467; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+uGwrsGj6Qox1hn8zR1ZPRiq0AUW3E1JelQa7fy4/E8=;
        b=cSByd3ifQKKs5puIpUgsDUrKRKPiEOjys4DlpJu2WsyAE+IzxyL3Ffo+m8+vf4M69p
         +uYoPe5ZM0cKe3wxApmEnwNHksW1t4jENvXKkhXXyKamvidADkDC4Kh40TRJtdimStqa
         AGpksbboA1N4/C3BFQnHRfXf1+UZj8n74i+hpcFf7kEl0/eN8AlVfZzRuTWcK14HkV4/
         ow4FEcLDCL8EwCd7esosNxVW27/qIeK9PAmT0qN9Opcie0iBkSm/n6aA5cJorr1ID1KD
         J2Louhazwprya3m5dRkTJ/Gd+apmlvib/XJVOWU8n6+PgZRlIH2O6I/oK/Zvcnym3GTT
         mK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739892667; x=1740497467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uGwrsGj6Qox1hn8zR1ZPRiq0AUW3E1JelQa7fy4/E8=;
        b=NsQScTqlZX5FvhkRuR/tHSgkI91AReTOOIun45cTZ284x+NYG2W4amnZ+frg36Yitw
         FkgcPWI5OuCkd7emQ2QPV8zxEdzHjFn6RjGCb1grq5+Z3wjjP2ev1rnUMcxzAtGZrhCM
         jUlcbBsbTidJBtTs8LHMvSMj7jAsR7DKb23B5DLmDfj3nSPrIhwCyvf/esCBqZlIc6Zt
         Y63Cwu6gR0yASW0FgEluzQ9lT9yKmv76dSKMpwsHV9693ozE9f9H1q9aQMRtmaI8f3/m
         GNBtxO9wH2RklXhMOaae9esex/luNcE+NuuK+Y01aTb77ClvCXVuC78hLpRCuUM1BkZ3
         0xfA==
X-Gm-Message-State: AOJu0YzCaNCuTFgBF525VUNqM8i5R8nAPX2xF2nqpBYDIHSQCfF9Lqs/
	93+3Qr6R6VeNz/t3aEeQ4Uaaim+o8S2B/R++p0Vs1rI4GdwvKeBdhvOISg==
X-Gm-Gg: ASbGnctd1F/tz4vMcyFsPaq9YVOcJcEf0deoo8OAW0lRszaTHVFJm//0J8FFOTXuruY
	vbxsQVxi2vhibiEUQ1Tegj7ZR755z6a2kyeO2RTcG6+E+TP7szmLQ0XP+hsp8LNYLidTOx+egO2
	qehWfFrceXH6tRQZCOr5J4eQyz+gzVx2wCEra5ueQKz5eJo2Qh6H9bwHvEiXAu0N7efGhofr5Sw
	ztDcmSk6hSiqyjzSKmwUBVYbAtW0aRKfSnSWRob4LjeQYP7rb5zRHohGPnR1bVNd6qBzyiZFLY5
	An+ymP+YD3oxc2CyrBQ9N+Ba9QM=
X-Google-Smtp-Source: AGHT+IG0f7Q+fjQrIcqbkNGlyvR3nfImFuIntyxOZAxadJ00VWNw4T6Z7YB4YaqWddE7OC0PNMd5dA==
X-Received: by 2002:a5d:638f:0:b0:38f:2a5e:f169 with SMTP id ffacd0b85a97d-38f33f4e45amr8880402f8f.37.1739892666437;
        Tue, 18 Feb 2025 07:31:06 -0800 (PST)
Received: from voyage.lan ([2a0d:3341:cd51:2e10:d277:cf7f:82d1:a7d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259fdb19sm15668572f8f.95.2025.02.18.07.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 07:31:05 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [PATCH] flex: update CVE_PRODUCT
Date: Tue, 18 Feb 2025 16:30:58 +0100
Message-ID: <20250218153058.59070-1-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 15:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211630

NVD uses westes:flex for recent CVEs in flex, based on the GitHub repo

Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
---
 meta/recipes-devtools/flex/flex_2.6.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index f7d4ef1f08..2236b2bc6a 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -82,4 +82,4 @@ do_install_ptest() {
 do_install_ptest[vardepsexclude] += "UNINATIVE_LOADER"
 
 # Not Apache Flex, or Adobe Flex, or IBM Flex.
-CVE_PRODUCT = "flex_project:flex"
+CVE_PRODUCT = "flex_project:flex westes:flex"
-- 
2.45.2


