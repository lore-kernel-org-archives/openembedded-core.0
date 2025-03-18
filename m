Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EB7C35FF8
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:01 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.4306.1742272738690513678
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CF9BS3Lb;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2232aead377so114972965ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272738; x=1742877538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8le/Z1ps8+P5NGFWEipToC9oMxO784khj5mFtyqm+8=;
        b=CF9BS3LbwoDDT5+40svb7xFUhKCnps/XQNg96YYVDrDeiAolIQk9eYGOzQQNeRRhbk
         sAecgy1/F8/xjT/hohjbjpIh9iUL7i+C7HpGWDT91jTEtzMU2Zw5D0u82eRtECRYrSUS
         tYnCIZ2kA2gz7jsuPypjbnHq3KvLhBVtdtgHieDx0WwXcg5hckPm3DAKa1P+PYGzKEYB
         13x88lgDajNMzxpXx2TxgwtYBQJmUVL8NqC6D+krxj2xP/CM/MWZEH1CjhQi8pv0GT4i
         TRMB21Nsiz1ULIGUmsADslI5pOc1HwjCyqQV537X6SIR4EuuaxkKX9hAIbaAwvPHWE5J
         0+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272738; x=1742877538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8le/Z1ps8+P5NGFWEipToC9oMxO784khj5mFtyqm+8=;
        b=i2Bg2GMMsrVdZ8kOR0vXnt5J8UFrSmAGn/uN+xPKyGtq2wO+q1NdCIMsvHtjDhhHtK
         SbitLpuReVsKMto9DWKmxJTIPGY8QC7Lrg046TUlJbofV00sSseYO/6LImz7UK/bX2Jm
         4D3UbiVsAbgzX5sqfNoxhFxwg63S5VjPfPAwuCFbmg3LP1PneK1F0kK5s2p3olx0qGba
         aIY8q0n6PNGuX5rmyuoTKNvz0HrkE8wBeUcZPLsWUQYpgd4FsTyRMWsh1m2h/IunpiQc
         4IjuOWz3/PoNZ7BZEeOPEQiWXwbwhxZpNEPIh8N5B8GstWmw0IDvVYGa3nq53s82ivOp
         yCjw==
X-Gm-Message-State: AOJu0Yz3VUhZH5wbtpkMsiy5AOeqmPAKCI8QxAH8Id/1BcNoF+ZujQ9c
	q11N/1UjN888wR1TxcNNnpVbKOcZ9cJ/xGV0zZq6yvQuUYjzJ4widN90ggfg
X-Gm-Gg: ASbGncvvBt9rd4dYs+V6IJYsc0j6smoldZ2SwCdPGf8rEDfbhagm2PQq/DJPDoooNhY
	Zgwcv0KQwW/X026T5tqieqvKe/IxMnuMf5wluS1qVMWYsswU6mGozJO7GcwmtdiRnysefBi7vDI
	gRQdx1WRhJ31b5N0B7yQ7sAZ7ztGuQO1Lkfw/Dh7tWPTiW5hX6nRk75RFdPeHyiSFIJsHHAmEVQ
	5J7UvRNwj1tO7FxGylGHAhxy2SBFgkB42kh1wtRufNQYsyhphUwyWSOP7MAzah0w+oXd+j7xoGX
	bDRLym8ttAfHti66K865u1dGHfUguZlu7JAi
X-Google-Smtp-Source: AGHT+IHgooFhBi62scRbo81toKGDIUuDVTpijpJnPY1x6xY5aEOfD99uitCTOuScrMrqLP5rUinMRg==
X-Received: by 2002:a17:902:e784:b0:220:e9ef:ec98 with SMTP id d9443c01a7336-225e0a58949mr175320445ad.19.1742272737678;
        Mon, 17 Mar 2025 21:38:57 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:38:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 09/24] bash: Stick to C17 std
Date: Mon, 17 Mar 2025 21:38:29 -0700
Message-ID: <20250318043846.2422141-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213143

GCC 15 defaults to C23 and bash is not yet ready for that
so keep using C17 like GCC 14 for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/bash/bash_5.2.37.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/bash/bash_5.2.37.bb b/meta/recipes-extended/bash/bash_5.2.37.bb
index 20c51ecdbc9..9f02ea17b5b 100644
--- a/meta/recipes-extended/bash/bash_5.2.37.bb
+++ b/meta/recipes-extended/bash/bash_5.2.37.bb
@@ -20,4 +20,6 @@ SRC_URI[tarball.sha256sum] = "9599b22ecd1d5787ad7d3b7bf0c59f312b3396d1e281175dd1
 DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 
+CFLAGS += "-std=gnu17"
+
 BBCLASSEXTEND = "nativesdk"

