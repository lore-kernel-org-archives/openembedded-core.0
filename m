Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B85F8DFF1
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:16 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28568.1776378790195326239
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=p2yLlfCD;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488ba840146so418655e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378788; x=1776983588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xfxOUvyf5rP0+FcG6K0whv60DNj4BWFYvbItdKejKA=;
        b=p2yLlfCDfFDihVKtuCMX0baMJfq0Hw3fkv6F/Hn3Z9hpPyVceXxOKtymq/pI+/9Ewt
         u+4jraEILe2ScAH5OrT95O+PBaSi4gaAzBSpsYlHrFlbelQ6SVsy4P5SWVV4SMCB3rnp
         8Qlz15OCXFnF6vomA1floNn8kQVhpOsiW7qOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378788; x=1776983588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9xfxOUvyf5rP0+FcG6K0whv60DNj4BWFYvbItdKejKA=;
        b=krTnECLaOvGD+TrFziLa+49Jet5vJ6km215MMjBUEGH+DWt8mvrlPviAg6u8PS7IIP
         qLBufEYhrlvU4Pv/LvzBQhn6lAcYHRl/57IPMHlIJS3Ll/mqYt5+5p592A1AjyBdG+zY
         FJdl4yQoBC9ZAjKqWeHARoeeO/V4kKoWtcRURvb9+WixSiYzYTIVuSVODY5jzYspEjJW
         1oqNsUtRT4YY2L+s6M/o+5GQzJtAcYhdR+ocliKpaJ+/58dBjeKF14xFFdlf2kLr0wsi
         dWtpiqwt0odOMp2YnQghbEn94CLyYk7zqM4wVPfr9hpMoQ2Wewy266ETdB8NJqOkF5zu
         85ow==
X-Gm-Message-State: AOJu0Yx+LvZ5HTYS7yeA+h0Vp+8EpaMk3pL8rDwozhU25hL23jl52aFT
	IIW8D2ysQ939v/ZhvV93u/JQOyEn7ASwEfJJ/rIl7P3caFZuUurVkMcO4sdJecQythFxV1DfG8l
	VHydf3vYTDtLR
X-Gm-Gg: AeBDiespo0b12gQ1FB3Snoem1mkB1JC+j+aGTky2QBtCZbzbsamzsk5Kum5pj3wxNao
	JHHx9AFjpOGdMAxP8y0Vc/Hl9ZdoIAEnnQ01GW7u4Dx9gxAo87Ezb2YfMoD6Yef0PjqkO9aDpXH
	kc953Ow/9ZTk/B98Q3213bhH4+D6o6kobODBmBeNzBnOSWBUaC78psKiLoB43sdT4i13BfcJKh3
	bSMfgwoeNVU1ZgvxU7LPfU6/EcBZ/NiTOb/1rjjzxE4Sm+HO1gV7SBZDpw8qzKJoJpDBLKdEDou
	aTDidVA9Q/Yi3Tmbxgpc9m69+dVUZEJvcCABIHdsElFlZI+gO3NgCzwUwePdwamwZmfdTjJnXov
	z5knKb8jvUuJkfdSc9sRS4Ew82bDZ7yzgLMPb7JqC595YDSyvl/Kl5EmoimcvwK8Vt3jn6NR9tN
	kJmv6G7FCVolyl9rlkBH0nZW9122MxEgUXBEX7NDj9/vT3qK2crmBmxd7pWM5/LULlEbBGX82RP
	0FuBJytuxWEroHa4sX4OjSZ086p2wfDcCnMEg==
X-Received: by 2002:a05:600c:6289:b0:488:f941:aab2 with SMTP id 5b1f17b1804b1-488fb78a561mr5078725e9.30.1776378788315;
        Thu, 16 Apr 2026 15:33:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 15/51] barebox/barebox-tools: upgrade 2025.09.0 -> 2025.09.3
Date: Fri, 17 Apr 2026 00:29:58 +0200
Message-ID: <c113fff232b77e2fd03762e0c694e876933a101b.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235444

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

2025.09.3
---------
Fixed FIT image vulnerability
https://lore.barebox.org/barebox/abljJRMecNdejSD0@pengutronix.de/

Changelog:
https://github.com/barebox/barebox/compare/v2025.09.2...v2025.09.3

2025.09.2
---------
Changelog:
https://github.com/barebox/barebox/compare/v2025.09.1...v2025.09.2

2025.09.1
---------
This stable release is specifically targeted at whinlatter which is
currently at v2025.09.0
https://lore.barebox.org/barebox/aUkaSKDePHF8__LB@pengutronix.de/

Changelog:
https://github.com/barebox/barebox/compare/v2025.09.0...v2025.09.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index e41d0858fd9..91865b4d44c 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.09.0"
+PV = "2025.09.3"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "7df1aa47bb7bf1763a729137ac773e69a4052812af094475d739fc63a9295f0d"
+SRC_URI[sha256sum] = "e87eb863cbe45e4f5af8930825c8f6e20c02b82451e9e1125ea1c73c1fb49a87"

