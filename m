Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BAAF8807F
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:42 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7725.1776322117168287737
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wdZgxmPD;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d7213b6ebso2682058f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322115; x=1776926915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcZ/HfQtRKtWZJsk4vppdO7Mc19rvtmmKW48HwDGObU=;
        b=wdZgxmPDNK4fDfN3HhbWvxi53xdjmrAtNrGaHYg3qDVrETGliqsRgFuVdfnnKBgF7k
         Y6UTIbTuuamtI7VZxlBpMgrC+oaWXdKFVxotr/S7UTIicmoEkhv3pBvIeC+t3ARDt99D
         FVYi0pWoEF0XpGNzE4Ichl42bRRZfVzrszmxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322115; x=1776926915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bcZ/HfQtRKtWZJsk4vppdO7Mc19rvtmmKW48HwDGObU=;
        b=PXL9/0PleFZYGgP6oQkC3Zz9xf0ThAKVxtFwuPh8Xr15iLef0YjvzSaU3kH4xkWLig
         53JPgKrxORDzE1kT2R9aa3zOHfaSd/HsTO9se1iFTDedoDHfkOO/I+nveKUhndTMjkN/
         EDtjzBSCmhBmKCNlj8hdQfJowyTbgpCGR2EFzFLJfe1biOaKePfXtR1GtGk3l3dbwaOd
         +w/0EDaPkFQssn/BHqsec2SMYJH4gqFNhs1tXmSWAijXPfK4j3LeZsV3i+A2JVXjVmCI
         YmJX9XXCALz9+BT7oixCvv4Lun1KsMr1zGeDPSTZ8LfLSy1jP2vSka2Sa3s5ZnohONek
         6+FA==
X-Gm-Message-State: AOJu0YxPrMvNCf3mZEDr0Du2BEXtekoOjeuMcTtWdz4kSSj+NMY0VkI+
	OVCzBDNqbKpzlqyec9jupsdOkGMeb6wPHmMwQrylOOOz6iG0CD8AQ1LKWvjngK0vognOhpbLcPJ
	PN3OBdz69KA==
X-Gm-Gg: AeBDietfjN1OGrdY3RMdpNaBRgAh/xhgaqCZNbn+Tiktl6fmcpgDYSp+jUiWSV91ZZ+
	JEttKKnkpH4sbG7yxwBLRcJkfcldK1fli8MbnmBMpqGI4xvA/69IaF7xatMaHzUHBiDas6Deiug
	2ZKjJO3038RXYhFtC/GPFacr+oUN59p7IrcIP+Lwf/HyqEVb+RUj2gPWln/EOV51ssXYpWmsBpz
	Mun9VqRCKnPXxIrjfyj/sesUFKk76oHV3kVpFlm1hCDbCAzwQKGOFDsN+zcqG4Ga7Be5LNGprRX
	2MByWNsY2jACwxC7kb7hVNX85MJeLLOFiizYnsJWrgdYZ29PqgQUqbXZqOEKF8kA4LGoaxz7bAc
	10h4PDqv2scRwmZbM2Ep7rqIDZ/XTNPtALJKWuXTdZnLcx8MhRfBKPMwtCzhT1g8kxY7Lt/fqdz
	eEQRr5QQYKFJsWS69lOjvVQ4IoGiQNfIpReWG5t/XlS+ePf11bp6Wo9Y1+re72jNk3DAw3jfYWf
	oeMHcXRTnCScYr2DoSySQtf18Q469bxSt1Ygw==
X-Received: by 2002:a05:6000:2f88:b0:43e:a69b:d810 with SMTP id ffacd0b85a97d-43ea69bd972mr14385354f8f.38.1776322115151;
        Wed, 15 Apr 2026 23:48:35 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 26/47] libxcrypt: avoid discarded-qualifiers build failure with glibc 2.43
Date: Thu, 16 Apr 2026 08:47:27 +0200
Message-ID: <84c2eb57c30101cc5f6acd0bd62b6af5d7e22e0f.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235368

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

With the glibc 2.43 upgrade, building nativesdk-libxcrypt triggers a
-Wdiscarded-qualifiers warning in crypt-gost-yescrypt.c and
crypt-sm3-yescrypt.c which becomes a build failure due to -Werror.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8340d4be03646f0b4b599f768ddc88f502f93615)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index da515d19270..1292f4288bc 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -19,6 +19,7 @@ PROVIDES = "virtual/crypt"
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
 TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error"
 CPPFLAGS:append:class-nativesdk = " -Wno-error"
+CFLAGS:append:class-nativesdk = " -Wno-error=discarded-qualifiers"
 
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"

