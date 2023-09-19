Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5606ACE79AD
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 21:46:33 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.22848.1695159986868874936
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 14:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=crRNWwQB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40413ccdd4cso1719555e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 14:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695159985; x=1695764785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8Q3XVSQIF+0e8TJN32t2OX8fgNt8M8XIqe3MlRZdN4=;
        b=crRNWwQBqN4Vqc/UxRFy9rrwjWEu2eKHVnOc1rcULR6e00VKkMhaw/HIyf7zf5f46K
         5eo+tmu/I8105ik1MnEIrXThRTd1YITNeevYSir5TtZF5qLks6r3EVQkP4mBM8hWXBI8
         IoVTSOuk/PggDX8RMeIYPvPs7M8+r0Ztl3zoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695159985; x=1695764785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8Q3XVSQIF+0e8TJN32t2OX8fgNt8M8XIqe3MlRZdN4=;
        b=mnaIf3k6YABcyTJpsKcHqyuM2OYfJEcyKikeVsgxEwRaTyVYojH6C0OSKygRRIe/QB
         jCx6R2VW1zGSQv2J2KoKDauKLC4e19RgVrWMzUikc3ISI/2oN4ok9KGIt6Pjdltye0Ad
         fmUHIPpGQdMifwqwtvj4TuIyEuQrffcxCj0b2LJRBLNEwXt23hEZOSO9JG4yCVcHDI41
         C6Fu3kbnsMOj/D/gRXrqdKoUia4v/r4VLeP0BuPt7ydsar8eW7txD8OR0+hrSKauSIsA
         f1cXXJGQ03d2Y1nrRmKxi7X5uHI+N0M/xEV7PPI6varaWTAN6CSjzdTGg9PP3r8p198X
         2EDw==
X-Gm-Message-State: AOJu0YxoPXb/47bQb/rAuoCqqMK1dP+vumGoz1vQiO2d+d7tU+Afc+Kg
	9znqZgS4tLcx8LUXhlE993GowGV4Z551Gc+2pao=
X-Google-Smtp-Source: AGHT+IHX4S45TOK6fwgT5hmT3nFUUxwnAkuNeqdxuUfP8zFop57FcTY8GVZFe44tO7IFXnc/gRKUWg==
X-Received: by 2002:a5d:5267:0:b0:31f:eb45:462e with SMTP id l7-20020a5d5267000000b0031feb45462emr588785wrc.28.1695159985252;
        Tue, 19 Sep 2023 14:46:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:34a6:a1c2:97a:851d])
        by smtp.gmail.com with ESMTPSA id c13-20020a5d4ccd000000b0030fd03e3d25sm16657827wrt.75.2023.09.19.14.46.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 14:46:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] sstate: Fix nativesdk entry in SSTATE_ARCHS
Date: Tue, 19 Sep 2023 22:46:18 +0100
Message-Id: <20230919214621.903967-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230919214621.903967-1-richard.purdie@linuxfoundation.org>
References: <20230919214621.903967-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 21:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187880

PACKAGE_ARCH gets refined by each target so this value isn't valid in all contexts.
Tweak to use underlying variables to build it so that it remains valid in wider
contexts and works with new usage in sdpx and license classes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index afcda2980b3..67070440a6c 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -88,7 +88,7 @@ SSTATE_ARCHS = " \
     ${BUILD_ARCH}_${ORIGNATIVELSBSTRING} \
     ${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS} \
     ${SDK_ARCH}_${SDK_OS} \
-    ${SDK_ARCH}_${PACKAGE_ARCH} \
+    ${SDK_ARCH}_${SDK_ARCH}-${SDKPKGSUFFIX} \
     allarch \
     ${PACKAGE_ARCH} \
     ${PACKAGE_EXTRA_ARCHS} \
-- 
2.39.2


