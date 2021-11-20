Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F30C433F5
	for <webhook@archiver.kernel.org>; Sat, 20 Nov 2021 18:11:16 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.1213.1637431875715272549
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Nov 2021 10:11:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QyADEvUv;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id g28so11459655pgg.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Nov 2021 10:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0TMe5Swd+NVP21K5VDucnGrD2c3q8wIRgLXqq+3KrhY=;
        b=QyADEvUv2E/AByvW+tZdpTgA3J2JHnp4tSrCoSsmAMK3CetmWfmN/vWYqUWhQFqb3w
         reYh1fbJGH/dCoQeMw9lbcTb3sbhzk/DGbWrqqh1rZr/5QkfEHCLNaFB8IUb0WjFqWaP
         VXEy6xaNagPyXOJ+W0XZ4BgZjtVPdzrREPSBYaj1Zy54u2xPNSf+rEWg5BTO2af/mIz5
         3X0HCS9zqkspWpgHyx2eDwXZN/R1FhiX0PUK1e+4Xepq+z/zjFOKNSzKaBXdQ52Xt+yC
         6b+BXD8Pgmjc6aI574LpY5FEjU5fbqFjCnPMJPIpcEZFGYppCeNpluyfBbjBfWBxgOWD
         yE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0TMe5Swd+NVP21K5VDucnGrD2c3q8wIRgLXqq+3KrhY=;
        b=KtmJtjOeOPnqvvRQo9WMa9KSpz8+Lop8mYz5f4e/8cwobcDbJ9EX2PcsDTk9v2RkR+
         A+lYHdAEJwOlccefZsQzfRR/oUx0PZEKXSYMaQbm5fw8yRdex0sDgtUuiAAZsXhaJ933
         CUb41PB6A8t1Bt1XgBq0Xnx57MjlP1rF1jmdg2zrY8/TfGbnznuyLFgBIpEKEo9y9E2e
         F5UXsClwBZzb8mbY4k74ess5BQzTOKx7AYVw+/A3oVUY+aiIfW785Aub3zj7WM3H7HBP
         FYkuRYal6n+ygdrwaM3t81KFFPA3t0zZ3J2ci6+lpZkrIYawroOq7ZXgq6zr1I/ahobU
         SM3Q==
X-Gm-Message-State: AOAM532h62/SU+l4v5gqCVqwZfY3aa0QDvE7bzHXEMeV2x6L64Kjftvz
	8ZEG6UTcf4b5CUiyy+YBkSPo1vRu2YIaKQ==
X-Google-Smtp-Source: 
 ABdhPJzVBP5gT45bOyX1bdLIroUsZUOoDkth9enJlFjfSDdt5Wyu1Tf4STtt7r6augFX9VgNtupxEA==
X-Received: by 2002:a63:85c1:: with SMTP id
 u184mr23986015pgd.55.1637431875034;
        Sat, 20 Nov 2021 10:11:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 g17sm3519492pfv.136.2021.11.20.10.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 10:11:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] core-image-base: Remove psplash from required features
Date: Sat, 20 Nov 2021 10:05:07 -0800
Message-Id: <20211120180507.1970003-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211120180507.1970003-1-raj.khem@gmail.com>
References: <20211120180507.1970003-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Nov 2021 18:11:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158530

base-image boots in degraded mode when using systems without display
system since there is no fb device detected and pslash service would
fail to start. Removing this image feature means that core-image-base is
complete for headless devices

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/images/core-image-base.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/images/core-image-base.bb b/meta/recipes-core/images/core-image-base.bb
index 75a08cfc92a..ced8de6c14f 100644
--- a/meta/recipes-core/images/core-image-base.bb
+++ b/meta/recipes-core/images/core-image-base.bb
@@ -1,8 +1,6 @@
 SUMMARY = "A console-only image that fully supports the target device \
 hardware."
 
-IMAGE_FEATURES += "splash"
-
 LICENSE = "MIT"
 
 inherit core-image
-- 
2.34.0


