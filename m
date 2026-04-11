Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DFEF45A19
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 00:29:44 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.170409.1775867377129568969
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 17:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UxUBbwax;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2cf1646bd11so4696046eec.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 17:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775867376; x=1776472176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2fAxlv0GLVNrJvroziVTocA9dUrUL0lQMlNpWFYiJo=;
        b=UxUBbwaxr9p7kVimOVHppTPfHNph6xkv8KMp7pFB9yvyH4gLGjoW7Ohv+ttjrhHfIm
         J3XJWVvBTSoaJYr5S0U3enJsSkQAjDd4bAxFP9P2I9Mbd11xSDtzEcuePB4iJRwsRpsq
         IdWzRG1bD9hy7j5cJMd1yp7LDI9br401KPhABFqwmLvRimFLgf1LvQwhCGDmtDjA+IOu
         VQp2ddsEfw0d1uz5Cf43dcXCwF8R6+8+1zut/m+Ml6e8Em3MDQ0sVfxEMSNHsWpVwp5/
         xpYXKEqq/CIiapaLDdH7MfOw85TaX0afJHJ0R0ami6dLaToNEqg3+Yw2NEAzVSfXn6bE
         8ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775867376; x=1776472176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/2fAxlv0GLVNrJvroziVTocA9dUrUL0lQMlNpWFYiJo=;
        b=nPRgHFvgR40NViUF6hR1XsNsgS7lIIyQL0nN8L4cZoH2TBJ4+ljNXbOV7HtiTZ8QIj
         yc8EddJgJ+XLryKI8HPEvD464erouZhqTkkh1Z7u44n/YSWTXTz362Iu8+A2xE+/iU0+
         huUJ4zHlmP7VImveQQoQmBonUUsLHUfcKerShsmJ9ZXnyZFfI2uS8YxXI0bbSoHi0ZIp
         11cTZ5ezXYlWxORgMsDFA2eAI9g8uXCo61cbRRiA8OYCvf/uVGZQ8wMiXdsIcyUJZbv0
         ro4c0TH9/T8xhgnYFxHuxAKuLzOOzctbzrt5SLqMCI/nIiDp5RNjdvrBxCLtJDzkGRBp
         eCfg==
X-Gm-Message-State: AOJu0Yxw4qtmnZnE0dXs3gkoJbrPzW6ATpzGGZg+V8BJPZkCAvvSWVyQ
	kvnBVsnGAhRCvl2rTu7MBfLITnt8d6kE9yikobX22MA2CgATbLSlK2paL4Kd3sTa
X-Gm-Gg: AeBDievEdjwPIWVDGfB/l1vlDrTLk1V3RrdlyTHyIXq0lRuRxxL1uGUHB4PATcjoqW4
	2CJwanE0Fo1kdOIpC9YGl0m9FG+mifRwfA1jcpg/+iYGCHxxEOzR0C6XBjLVNeO3f9BjOGLARG9
	fh1wWCr7tkcaVsigaaU4U0kbTahaUt4o61zsRl9EavZB91fVXCFOtkbtyFBFQOpSVqymdwxe0EG
	MX0dLCyqGwfIJOHvZ0aK8jvGfhiDBchK+I8tuSNvpL6lzjeMkVZJd/V3t0OSaWY/uvVlUjm5Uy+
	xRfa6Fjmz7fXraZg7ZVNxI+opVVIF0kcXCMBdJd7fXbva7ZyZf0/u9o8vBLbp/OlzVxAQ2i0R4u
	Kh0N4NIosOdJXLo4YWK6510g/L/O/LqSuDmcBRv1NfsMxDf9slbO5NLmLrd/vu5HZ6bkTe6GXwJ
	fQdeqnQq9WebYEhUOyATYC7Wf84NAddRvp6zZtvN2lSldy5peQkxQcQk/CGCFx8vIF9xR7Hes5q
	ohXJjvgyOPF+BaWLRlnLEkW8TTZkA6n1pdvIYzVrXlGDcIdlQ+ia8p6aHFf
X-Received: by 2002:a05:693c:2a03:b0:2d6:3ff4:5dbf with SMTP id 5a478bee46e88-2d63ff46040mr1599954eec.6.1775867376134;
        Fri, 10 Apr 2026 17:29:36 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561bde70csm8258009eec.15.2026.04.10.17.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 17:29:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 4/4] vulkan-samples: Upgrade to latest tip of trunk
Date: Fri, 10 Apr 2026 17:29:29 -0700
Message-ID: <20260411002929.571805-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411002929.571805-1-khem.raj@oss.qualcomm.com>
References: <20260411002929.571805-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Apr 2026 00:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235043

- A new sample demonstrating the rasterization order attachment access extension (#1492).
- Broken documentation link to GitHub repo fixed (#1506).
- Vulkan SDK updated to 1.4.341 (#1477).

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 66c034a794..f3997c4e32 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protoc
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "3abbdf8b5a3bf250f6475f9fe674567b14e9b1ad"
+SRCREV = "fa2cf45adde08778d1e8f885f21f934f56d9eb58"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 

