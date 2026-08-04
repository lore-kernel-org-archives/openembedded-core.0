Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF02C55ABF
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 12:23:44 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14928.1785846219256023728
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 05:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BoI9TY4f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49557167508so28414095e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 05:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785846217; x=1786451017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYW4lpTr+OJE8tgNH4xI2nOXLj9pHLB1+ip00M+N7P8=;
        b=BoI9TY4f+bOZq0vUOU+LJDbS2x4oOcswHk75a5DWKpb/H6waLH4jIVkGR/Wi82+VQg
         bvEZu9Tr6ptQGU4olfWWyXDW8/V/ZqicHiQPpNMvmRw6b2w/3ye5/UatCy21WomsZC4F
         2fbWL1Z7oIY6aNWeMCGNah3QDRVA1bd+USQLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846217; x=1786451017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cYW4lpTr+OJE8tgNH4xI2nOXLj9pHLB1+ip00M+N7P8=;
        b=p9k5tMjsxXcZqCMBQwe66iU1BsKlse2ZLT/xbzW1q8ffSFHGXHcpwjeAGdKPan7pkM
         EutbMIQV+8X1f0OuqQfEKSw3qMsbitHesf5+9vQ4b8R3YFT/qtkOHsK0cBEKEhemTSYq
         74cCWdW5KJYTpvZVrCInSPBS6pZ2YzghBPyC1c/7Ao3BA+3eXV0ezJQBOI9RoAvdlCZP
         ZjwZLxw/fhhr6j2S6yrCFJcVI7NN7uU6Cpvv1Z1NIZxyDvjtn7Ctp3EUq25SSIlDLfJn
         MQFsiW3NFtpyCGtfoRZPSyYESxFjJ2XEsvUZjRhKSlBFEvB0+NkEl4an9jAL02Kaw7yp
         2p+Q==
X-Gm-Message-State: AOJu0YwfKj/Y3+WTsKcnzurS/LnPNimMvA1y5Ksld7wzAQC/VwIeCM5j
	r6JG2xUMnGA/YosmLRBAx8kB3L2Okc3+RP0VfgMGwOTIPuM56VrLOUTGxTC2j+4bAUT8FLqfCJr
	8WfUhhOY=
X-Gm-Gg: AR+sD11NbexWAF79W5xcUbb8Ir/OtqwBWemQAQQkifKBcPXisnRhX/NeO+PB7KPFiaI
	tCTwxwr+xb6Jc3Fd5pOOkC8MDzoZp28cmEmvo5p93pza4zdHgGEp5wJ2WSZTZD5kY1Gh+vTlCJ2
	4wygW4wCzPbK9WFRqvEx3P/4xHt51fcVkVtWxReDi0U+sdQ0gMIxjf+yMwnn20nIrMiY11B9q3r
	XqU4dl5WhIZQgyc++CZD7ymbt7ev1A8aE5y3zz4/wPj2xhR9YgldLoItRkU8DZTU2k1iLwnfvhy
	gTp9npcbBxZvRL9xi0UL0XGQURXrAKZBaTxXAszVHUTwCq/ZtGBJZqQQ5FCHWTRMGXibv7KAiPW
	hHxtfxweAxM4GX0RZqEhTA6Ido0MlMUl93gZ+26poC7lQ4jFv5IHwX48J/Y2efvJ2Y3vGSaFLVA
	XDpqRQybVmGrHKUAe/Iu8fTxjnvXNf0+wyTyad+moexsb8YYgL7KmG+VPpSk1SNgTsM7Obsa7gA
	ljA1CVP5EM1q8C8nw==
X-Received: by 2002:a05:600c:1d0a:b0:495:5dcc:52b4 with SMTP id 5b1f17b1804b1-4994d9ef0b5mr11426325e9.3.1785846217224;
        Tue, 04 Aug 2026 05:23:37 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ce15:a763:9e16:7bb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fcb0c5sm76247535e9.4.2026.08.04.05.23.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:23:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] libva-utils: 2.23.0 -> 2.24.0
Date: Tue,  4 Aug 2026 13:23:27 +0100
Message-ID: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 12:23:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242739

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libva/{libva-utils_2.23.0.bb => libva-utils_2.24.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libva/{libva-utils_2.23.0.bb => libva-utils_2.24.0.bb} (90%)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.23.0.bb b/meta/recipes-graphics/libva/libva-utils_2.24.0.bb
similarity index 90%
rename from meta/recipes-graphics/libva/libva-utils_2.23.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.24.0.bb
index 970ff50ac95..b3fd521ff13 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.23.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.24.0.bb
@@ -14,8 +14,8 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.23-branch;protocol=https;tag=${PV}"
-SRCREV = "5896b6779d36f83bf483aff62da8aae30ba8d664"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.24-branch;protocol=https;tag=${PV}"
+SRCREV = "c3ba9e07e61841f1bc2c9932d957b44e5827a852"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
 

