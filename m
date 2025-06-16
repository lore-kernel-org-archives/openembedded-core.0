Return-Path: <setairidis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5754C71135
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:27:43 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.26379.1750066057517649427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=icPTY5s/;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: setairidis@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad891bb0957so738643666b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750066056; x=1750670856; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l8wGTmjjLaMQC0pyZvHtRIWp46pt1iEGbAqBCgJ28hI=;
        b=icPTY5s/x4q2M17NMLFy4JXFqBRIjHSgh0U8Py1i7uD5xen4+WJM2dgJDBndMG0i39
         iHeeUdxL+udgU68u5VYeyRpYWn9EvMUDvlsxTm7Ac8jhG+b56XqiA/FBz1k2i9DOVKbf
         N7DhscEuFAi9l+uB9PBOjpXWz9fbsIMvrKpW2odOqjQlbwopj3kehh4DDKY98J6PdUWp
         kqu8qPgTnbw6Si6QoQvCk2FXjYEbY3VzdsHKCLZAnFc1Xk3WqBBK5JDtqwotEwo0O9Yd
         RavysAgZYEXFtVCX5usYSrP7koCljRjeXMfJw95IZF6y7SJWQMcvAJyzhieXI0Hx/tUS
         0jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750066056; x=1750670856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8wGTmjjLaMQC0pyZvHtRIWp46pt1iEGbAqBCgJ28hI=;
        b=Lh1EaiVMRUy/0Wa/HtfMcARMh/EwVzC1jroOXHSrKKDnVKVaQ1vqe39htIQS5tOOlS
         nx5n/vZLsDfb2pnxjOzkkDjjoQuvHwz8pefd54XDriHRoX5DNkSrx3mLtpedI7rrxvx+
         sV45vzmJD4pNdjiVKm5nUb/myOhtVq9lXFG6D0+Pl1i6yWPbaZgVYnA7gRMJRfuSW/dm
         xyv4m0q2AAABeMbCWjxDRyGVdEZDO8jNzXhANyNAR1uQ2Cimxnn/m1YslPALUYH5J/26
         jGpIuWNHgzQ84UmQQZWRUYppLO0Z9ssGtxaLsGW7iF1ivuGxNItQeZiibTK35fHqrR0N
         V0+g==
X-Gm-Message-State: AOJu0Yy4lvSKMNZGrjUE5x+gd0mNCqJJgQgwKSpSpZAybJ1NOcLqXLTz
	C4+0r7Bwvzr8Z2mUBNut9+dxduILbYQug1lMx7bwkTngZ0lc/N8yEE6cv0Z2eDJI
X-Gm-Gg: ASbGncvvSuAQJsV2Z5j7lmHMAkMX1faonmxgn1TkD6/r0zOk6QGjwFuuCsgjRojzAkt
	rKkFiEXSKkfqFFVeRtjaeI7jTOvZ5ObJrQ5ORlxV17J30+zV9/NQos1ZO4qaZlcrxPTaOoDBduy
	a7XQGhwDO1fmZvWXbE3S8iequ+f2DfOPfYQXGzq5rivoB0l9cjGYNjAuwMf8NO75YbN9y2/DBEh
	2zbaNCukVUYNhpxgIj/fL3NeaQzZSqmM/U2XzsOCPR1atb/+/0UthEqJzsPFG4IcGVJrfDHPvDf
	7dgbzHtuv77Yenre3K3lkoWKUNFnmx0OgK4Tw03TGH6KPk+YHT10VUmbnZBTKcY0X7bh/0Gmznh
	Tk7smpBPXLCQGJ96/Hngx1H1oI2zFFxKxrFHusxjWRF2cr0e70MADMjFwrA==
X-Google-Smtp-Source: AGHT+IG2DExCXsSOdzHrB33q6w5Jrp+c9dUTi0OJG8JiF58smZQNRSY6pmPXpuEjSGe3E7sVbkJVkQ==
X-Received: by 2002:a17:907:3ccb:b0:ad8:8364:d4ac with SMTP id a640c23a62f3a-adfad4feca7mr793140666b.55.1750066055400;
        Mon, 16 Jun 2025 02:27:35 -0700 (PDT)
Received: from DESKTOP-LR19VKC.localdomain (ip-095-223-185-049.um35.pools.vodafone-ip.de. [95.223.185.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec899ae45sm629740266b.179.2025.06.16.02.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:27:34 -0700 (PDT)
From: Savvas Etairidis <setairidis@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Savvas Etairidis <setairidis@gmail.com>
Subject: [scarthgap] systemd: Rename systemd_v255.21 to systemd_255.21
Date: Mon, 16 Jun 2025 11:27:20 +0200
Message-Id: <20250616092719.3158-1-setairidis@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218798

The recipe was accidentally renamed with a 'v'
prefix in 29e623b2ad00555788412fa520fbb9ffec794cbb.

Signed-off-by: Savvas Etairidis <setairidis@gmail.com>
---
 .../systemd/{systemd_v255.21.bb => systemd_255.21.bb}             | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/systemd/{systemd_v255.21.bb => systemd_255.21.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd_v255.21.bb b/meta/recipes-core/systemd/systemd_255.21.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_v255.21.bb
rename to meta/recipes-core/systemd/systemd_255.21.bb
--
2.34.1


