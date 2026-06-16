Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A93CD98F1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:16:49 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5780.1781637401174071758
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B9md85dh;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b3637b90so38509165e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637399; x=1782242199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+qd9ZMsANNFHAZeAx/fDzvW/3dbjGsqoKsOTxU2cTw=;
        b=B9md85dhxfVwaWkEcSJ3hc5WD+R9PYqC/PRiFLv0aUkq/8zRLrzSFDACmisXUKPpg+
         vD0addGJbdXzsieNSyUM1jCusZHMz55ci5uqZGjmihew0TtVstBanJnob+zZS0nPtX7+
         IuOo03pCGNvssl0YNZ4xDgthTaBIVrKP9SmY7QsMpTpOT897b+bkEMtmFPVDrlp9HMTm
         xK/cqYu3LBLXjQAKgk33NLWu4gfRz7OBeN6G9WQh2d9FuVAwa/cE1hvczmAgJATijlx+
         rXft11yRC8aekOkD9g7reKoLHY0+V3r77odc6KofqslqQVq26a2zkndu8ftsMFQoT9hK
         ANLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637399; x=1782242199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j+qd9ZMsANNFHAZeAx/fDzvW/3dbjGsqoKsOTxU2cTw=;
        b=fs1dlGwPBQKw5PC0k/5bJlP9OGEh0QfD2joeP19zlX93jRyM6qBAVps1NyOsbJiYYN
         xf+6h+bwIuRfheeryLFUAxeT8xXUrsV9NS6Ko/wlFr2Vb48mHuHh4ijyKwKhnVtD924r
         bf9QdCNor36hOy7JniLtnGqygsf7mfyCAcB+olrnXjpHkuuCsFuavPnzFsDiEp5Ra4o/
         avPwa3j0vC07d0AAYaBPiJT/W9xTN0csiXFqpIVYEMVVw9Dv7H8Kt4887jbG8iy4/Fk9
         NS7ZzNuFtijjBSzI9oO0ZykBqaNqF0Ixr2dnDhdeykST56esHLh1GpTJoMkgAZqBlmTM
         m7IQ==
X-Gm-Message-State: AOJu0YxcMbJK55CIh58kXDwnOYnzF9hQ/36V+ci3+n+XsUuwvDR/9ECQ
	j1ZLEMwozNiKm6j1DtvBRRoy3rnTTQqC107w0NAYq9JMSGCYgaA+KLr0TlEfLPpE
X-Gm-Gg: Acq92OEPXwXmlWJQn/y2V8XjykBwivq7iFzkDX1n9kZKtKQ4EVPvrodE5MYHOUJhzQ3
	73An10scCDXZrUC5DNZ6sLfY/dvOc7YNpxmZyk5g1PjRW7+oqLrp6mX9OrNjm+RuS9ICrwpT4LK
	8NaXooRq6uQzo7tTi0crl/obAWMz4fROuAIsWV6mSYSMfGhvqlQFT6BG6ET1EknnbsJYu5SVzFh
	7BjyXJ9dKmY1Y+Rc/ZWwfYaF8nabINU2XKpfuyGN2IBoA8qPaY+P5AbGs58AG0ZcJ/Y0A1xxjqB
	ypwsM1geId8JgvBzLeiqbxWUa3dfc+fO9vFkFgeZqVaGjyHAMCLU/D5BvtLidJm69LiuwcJ8U3p
	YQPnWoKkW6YTL/iRVzQIXzwzidIeAmZsSTh2nzWglydChYnHoYRnEVnnGIgsmXx35CRvpTxmrhh
	jY2egCjbTx1OD3kb0q7wy9UNbIafIykLylkD+y08xwWJ1tXKoL9LMF6N1fc9D2Y+am94NFIg==
X-Received: by 2002:a05:600c:3b02:b0:490:6237:521d with SMTP id 5b1f17b1804b1-492333a8e2cmr13940105e9.13.1781637399416;
        Tue, 16 Jun 2026 12:16:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/30] vulkan-loader: upgrade 1.4.341.0 -> 1.4.350.0
Date: Tue, 16 Jun 2026 21:16:03 +0200
Message-ID: <20260616191628.2014553-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238932

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{vulkan-loader_1.4.341.0.bb => vulkan-loader_1.4.350.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.4.341.0.bb => vulkan-loader_1.4.350.0.bb} (97%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb
similarity index 97%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb
index e6ad8738fc..1180cdc91c 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.350.0.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "32fcb949e253cbeb40cda7ea76122b492db579ae"
+SRCREV = "a9e72c66d5cb79911eb9a9063bf4016dd0a3a123"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.47.3


