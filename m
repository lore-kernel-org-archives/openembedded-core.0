Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7139C4321E
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:23 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.7373.1651727158306038902
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qhyH8aS9;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id g23so3887368edy.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8FKH8QsXK/VjSPa2O4a50esweSFdoboXlYDge8QjmQA=;
        b=qhyH8aS9FHZ7SNXJbMB4vJnHkpauiZzVgaj8ZGSpWj68ez07ks8Pv5NgrQRRfh3dnl
         KCEn/WwpMIOb5JwLhp2QIGn0gziKlCuUUXef0Abbs4SdpeADOAGXx1Ls6Qq+ykYsDjYv
         c0LKs2Yp9v4V8Gq5WrZwv7RY6tdEgG1husmZFLrDt9n5FOVJtsRAQk5KupUZo0J6yJyB
         /hp0ptossK2NN2DLam4z5gmzQfdFjtpLnwB/PZB3BEO023yKf1Tqb1p3hH/wc+LOtG7N
         dYkH6iMqnRcM8fYB7gR5v762VFbE/SXVbaGvDkesAkEqzrMWtoLJ5pmmmy5Y2qW/ajiR
         EFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8FKH8QsXK/VjSPa2O4a50esweSFdoboXlYDge8QjmQA=;
        b=mIjzCzrua/OPyELa0ybYz0pKF2LV/4Voi/eQLsd3goFzwAoRrTMFk2zx3PTIG/w1QE
         HQEIhd7bPgP2XnZ7AFow5H9T0zUaE2CbSCy6kgoViY82+BKYbLB9khDoD4bPZTw1PD+z
         4y/M5MwFqHR4HBCQM6xXD8Z9KnS/txU/0HZE/hELUty69UhyHx05i1jQ9hlMm6mqE/r3
         Cq3TAMXusvTVPH80UNpe/8E4GRt271CI52Od0Q8UL2MfO8UzZ8HBRcvdn2p/5hOpK0VP
         lWSYYQ/lV+/jtAQPeba6lhVJGbwHtK5/OTFycQRPVY4a+RzETC3q1+E9hDIM8i9N4Vry
         k3mg==
X-Gm-Message-State: AOAM5307DlCQ4dSfH2SImgOjUTuMI+Gz9UCGNyZY49xHrb1ifmrEpVWq
	XLHV8wmS4Z8+zABr2BM0yGAf3qFn+V8=
X-Google-Smtp-Source: 
 ABdhPJwjzIWj6fuDYqN6H9E8SpYD4v1R1AcD/7kM//Lbj5IQeJrgv5iY5ZPR8/o/eoBXVwqDBzlvcA==
X-Received: by 2002:a50:ee11:0:b0:425:b5b3:a48d with SMTP id
 g17-20020a50ee11000000b00425b5b3a48dmr27903022eds.246.1651727176574;
        Wed, 04 May 2022 22:06:16 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 37/61] python3-hypothesis: upgrade 6.44.0 -> 6.46.0
Date: Thu,  5 May 2022 07:05:20 +0200
Message-Id: <20220505050544.651895-37-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165266

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ython3-hypothesis_6.44.0.bb => python3-hypothesis_6.46.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.44.0.bb => python3-hypothesis_6.46.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.44.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.44.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb
index e0f80b0e11..fb58297c27 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.44.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.46.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "620ffa1782f9cb0b732b66b811d11c3beeb678b96fae947740aaab1dfd74a996"
+SRC_URI[sha256sum] = "349e4a94926c91377fa3806ff363c6b9b65f95bec67d146066a16610501bf067"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.30.2


