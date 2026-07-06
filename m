Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E91A4C44500
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:43 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156327.1783358262376645577
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cRHheLRi;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so22918355e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358261; x=1783963061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=efRp3ZvQTPAbyRQBPN1zm62AGExsKo1S7JkUPhe1/KM=;
        b=cRHheLRiswid8bKR4O6fDY+iYItRkmpW3C9/4PdUc1Quiyd59E2vq2K4rhSsdVV0r3
         emM20AoK/UCeqrd+JVpPjsx6LYgbaGMKRAf2iE9FG0RwRimWjuSVjw4x9/59cmTXBxwW
         jizBbtLSxx7LpxT8I3+tIuVbPp1mpVRr2I5Nycilgo8PPN1Z8hS6YzXBN794kgUfAqJe
         McVnxFloM8yh5/05d57qCfU3k4bD2yvzi+6+n6Yd08lPEkz27emM89j3bkHdjV61bqjJ
         EZ4I9KjJxRr1GxEJweM/OV88GG2tLdbT6u5PKU0dW4einM/EpDfwF9lSWeygtegXB1jQ
         dpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358261; x=1783963061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=efRp3ZvQTPAbyRQBPN1zm62AGExsKo1S7JkUPhe1/KM=;
        b=bTaRL3CAxE/+5H5fBq0+e6ti9M5/AD4vVyUec+3vXby5IWIKUbonygiXdwkSV9Ucjr
         mQ5ykw/xPV741Z+LLQGwLnRiJ2FBVs5I/lGT6HeykDrjwKvt+EsQax47JkDxjmXVOwbO
         uaDs7DKsLGKraXnjiGQFGUprqeBieqtNLks3uCqeQz8Rk46j76Iu5iq6kgWurvavcMtk
         Tjoc9nHfJ8KMgwAkVy4RNACN3D8VpOzbBvnJiR8o1tXz2rOhlf2yvijcMHJyiauB+pOq
         EeNEUDONHTSukDJ9od2HyFlc+f2h7ZUt27LIIHDoH9Klf8zu0zc7MldPAT6KVPBCi6QH
         mQTQ==
X-Gm-Message-State: AOJu0YyhyZdEPp/2iVQDFEwJy2gxGAlbqp9ENo4RDQvnnC/FHjP4B1o1
	xS4s3um7ugFrneT7NudOFOnDnWkVqkampSOUJt0DLOXu9SdL2uZelBdDEbK9JQ==
X-Gm-Gg: AfdE7ck1MOzOQ0NSIa90nFY64CiQNUN5PrdV3vOfWcwIHyMrunm3A1Q6bFgeqQPykV1
	AuGZW4VCmSAGRkoNVfpPo7pHEytcUTjB+aWUaBJgo2dVMwCdRYeUCJUfvB9A+bbm8yhlXRUioXs
	JCOW1NB3RxYgVWpBA2kzUpgBnYmpsvShjGvYmg1Uq1lBspArczPeCacXT2vS11avElRAXE/woXN
	gJe9q6o6UugrvvUgSTGh7Z3IL6qtax1d6uKFkujUlYRaZAhoI4siHCVaSjlHv8ChDwE8rnitPjA
	WHXEWNCrLqAov4zIocURLEtbuaaEqTTtpNLg1BGcnb5NOS13jMyNA9PNfXYP7X7x94+ZIKNS3qd
	pBS9/BqOFL4HQVlcl6pnZY+RyQeJrdLpl6VR0J+8vSFRDc8hTMUg5Uy/GmOBJnsB6y/5Uz/aeyq
	hv3UEbmuhQ56f+YDGVbB4sGmS0hCTjjv3p1YcjFw4v9e6nlmHO
X-Received: by 2002:a05:600c:6385:b0:493:bfea:2780 with SMTP id 5b1f17b1804b1-493df4af8d1mr8666895e9.9.1783358260547;
        Mon, 06 Jul 2026 10:17:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 41/45] vulkan-samples: upgrade to latest revision
Date: Mon,  6 Jul 2026 19:16:55 +0200
Message-ID: <20260706171701.70536-41-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240327

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index c7e09b4b7d..75d7a39eb6 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protoc
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "ab1e93d4a5dadf4c804fb6abbbe0b27dfa912b5a"
+SRCREV = "383471195757abdd43339c464db60449619d4f84"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 
-- 
2.47.3


