Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE27CA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 17:31:01 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.3450.1756402258979597472
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 10:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J6qTBMVq;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-61cb4370e7bso1882427a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 10:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756402257; x=1757007057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qfdZM24HmZVlWH4yWoco/DOHtN/mT1hU+qPbaYJpYV8=;
        b=J6qTBMVqOFEw4IbzBMbcvhV9oEa1TQNeuA2mbzpzXOIeB2jtEnBV5IW9amUDvY8cE3
         HwgP1kJxM4QdwhaCjaUk/qWfJMMrehbEDkS0ILFaDkvH230u1T//5G9K8wSAwYbOo2TJ
         gptAUxvR2ePjitdA0fGib/dR+nVH4k/xSMU4tRPdI8r2CGfW0x4SBv1UXkoea5DfG8eD
         HxtWA8sASQFkoHtc869r96eOL9i9puUjpYw7etGoqFD0MOh0NvahITGSeAL7GEl5MLRI
         Qt3bBtsayOpr/NkR2dP1GmQGoQuYidGYrec06o6pKg0AklJ5Sns7iLZ1BA7WfHl6nkoa
         aD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756402257; x=1757007057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qfdZM24HmZVlWH4yWoco/DOHtN/mT1hU+qPbaYJpYV8=;
        b=nDaJP7dvD2/GRE2y29/514912Rf07IoRDZBUCHEMBd4Qi5geznD6Q+vJMAAxzONhd5
         DTNB1fh9QzJWv2i9XBfE9LKZdDu4ozc9x1LTywIcZmOqXTSvP0qoSP4yUwP2wlrVDuvx
         EbumTuKwY+AewrZA72QaE4qb3DCUkhEVrxgOgwYqyaIR75lH/4B8WJlTjbUxvTXQlV4R
         PmejQZz243kbgLgEHZKPcQ85gztUfo8pn/09Gqy3Z/n+y5W5DOTc4NrrnYp07loxtkLx
         NLomOwtW/GlStNKGQ0AO54xzs1Pe6qnRdjPjStvvQLH3BrLVcaEs92WozwFbSYZleo/j
         uOcw==
X-Gm-Message-State: AOJu0YwkbsMKP0U/Y1By2I3gZRmLx9e8I/kKS66eeyBywNFZe6C5NoYy
	0M+2rj1pmeZknxshR2GQ4xHMh0n0GVIeMIC7ln6lnT8WQv/6GgfkiSjCpV6jSg==
X-Gm-Gg: ASbGncsAaSDhPOkGMcuA0k03QbjUiG9F5RLpgSRpRyqi5zwK3y50lHmw/KcVVottXZx
	RFIBd5kStgXO2s9me0+nQqJcA8LOpqINijUoU9S6WHqn+4n40mzPVTdHZdduSuKFffWXusXrssu
	qMkK7M/KHfMswhBDYZrBqIhF36OzeoFDsJN/iAP2nUZqOMDhWa8XT1BlFCiPsKQhJ3Z4DCIPj7x
	2UIkoooxBUDzvzO/ZsxWlVEnQ+4ttwi+Yfd4We/1OcY9yBICtLL9yV5DNF7tVRebVXvqa40nQVe
	NpaNxVKQfnA7gJ6D5amIfniwxmUk8PTvAg8Sx0QweW3kRbfJODj10MMDh+vRBIXJPTTQiMoh/Sa
	er/ircd0g9JQSbMKHTGAD
X-Google-Smtp-Source: AGHT+IGfS3LT3tmps8+OAqw4EU8y6d9/bgxalYUW/OAonYhZFv9T3jtQuX9uzvxM7UBzZ58jdvflxQ==
X-Received: by 2002:a05:6402:4349:b0:618:528b:7f9b with SMTP id 4fb4d7f45d1cf-61c1b6fb807mr17520534a12.31.1756402257009;
        Thu, 28 Aug 2025 10:30:57 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc4bbca5sm59655a12.31.2025.08.28.10.30.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 10:30:56 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] puzzles: upgrade to latest revision
Date: Thu, 28 Aug 2025 19:30:55 +0200
Message-ID: <20250828173055.776180-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 17:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222582

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 253bc53e77..91b5740df3 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "7fa03051562ee81e2a5371f8b3a6d0bb6e646aa0"
+SRCREV = "a7c7826bce5cbb9b9c337c11b9b7f8b278e76fba"
 PE = "2"
 PV = "0.0+git"
 

