Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77141D2ED1B
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 11:24:34 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4157.1768908268949995878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 03:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fGEpJSdd;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso2837712f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 03:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768908267; x=1769513067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpVdgLaol2e6pe9gMBkTIgjSHdSYcksJ2/uVwqIx+U8=;
        b=fGEpJSddoF0VuzUAeHCX4w5U5oPq67MaKA+E9wq+E9vlo3ojCeLggwjA6sXhPd9zGO
         sizLdclQ61aOjje456Fa/1Vkhod5CfgCoMMBPEEDkjj8biHaKYTDK2FH1ibUDaJypxhU
         LRastC1LwJ0ERV95mAQP7sWG/gdABDlj6oaXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768908267; x=1769513067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vpVdgLaol2e6pe9gMBkTIgjSHdSYcksJ2/uVwqIx+U8=;
        b=ujtgWw2nWRORPZQDIQCuCEqOrp1+7WqYVBf3yQjlYJQHkJyUNJNZbs/DAV7DKnBHtl
         W33stlzLkneS6VPEApGsHSahrmLlSIrqKCFzBEB9N7C8/MRiJwwX9ioz03RcTNOXZuTc
         s2VCczmH3Lal4GjWdkhk8rRauI+5XLmUcbg5J9XYdIqjBQFwUptldDk/jUkg97UWJLC7
         iuekLV1Pj3ZwvU0vyyNH+kwNYMQ5Xzdf85v1UKHPmxV8BYNIWtEMjrJblONTe4Slke2/
         qbpj5DOyHYplV41elEmf84A49vmqwGaL4OJsQBB1vL1Rtz/nWPXNciQV86r0LPBs6Zwc
         XmHg==
X-Gm-Message-State: AOJu0YyRMsFeDOKlw5CL9qll2H48xk3hZBPO6hnG6cl0pHzTY1MgEpa+
	r5pfaUa04n57DHrgEzOtyjcsnjCTkMeORzCezkKALr5vUu9kfXCuim+cp2eOTMa8/5oq65L1mym
	pS3At
X-Gm-Gg: AZuq6aIMdVWroZ2SWdRK+oDrTNbn9cnZKI12BD1pwuq/uEtUa/yVE0J/Wzp4akSrGGG
	KujQo9NKpW7nQDtClzDFYkTQ0+zI9wWgP6kHlTZ0Kf2ZX36I18m7wi5Vl2tkW2KgzH3GHdq3TP/
	uU8Hd6uJCVtjY5XnwGiyXBM0U5PCumIA63fIe7GQFUGYzbihDa+EnQ9AYf5MlYZ1PYYpIXWT2Q6
	a8uj+cLOO047eG4mc/hIZPvOq/hWIQ28ZYZzqmigIe+MhhXB8uoo0jGs6CcQVRfZVYqutuP1Tck
	ArYuouPuAg3/sMOzdp0cOUMebpczvgTB7EJ3Kb6ZK8/h3XL5cA25/o5dNK2cHehE53PGP50PiUo
	SV4WWtwPZ77x93XSmF8iByKeZ4JG0TZnfcheL9SVZP3/dNCQpDPu3hTn32J9aTEE2xo5Qft/ues
	OZdmGlOF/HuLFGcvvbntR9UULwCUeBmsA7JM8LlwjN7Ta8PCPQa2fokxzxX4bp08nYmHsLkPiFL
	zkFxSuTn8NUOw8C6uUnhQ==
X-Received: by 2002:a5d:55c8:0:b0:435:95ce:84cd with SMTP id ffacd0b85a97d-43595ce8500mr672838f8f.54.1768908266968;
        Tue, 20 Jan 2026 03:24:26 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921df9sm29558435f8f.3.2026.01.20.03.24.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:24:26 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 03/15] libpng: upgrade 1.6.52 -> 1.6.53
Date: Tue, 20 Jan 2026 12:23:48 +0100
Message-ID: <c689e7db6f4a01e0c81765e112371f64c4bf8221.1768906687.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768906687.git.yoann.congal@smile.fr>
References: <cover.1768906687.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 11:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229663

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpng/{libpng_1.6.52.bb => libpng_1.6.53.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.52.bb => libpng_1.6.53.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.52.bb b/meta/recipes-multimedia/libpng/libpng_1.6.53.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.52.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.53.bb
index fba6e77b1c..956cd243b1 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.52.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.53.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "36bd726228ec93a3b6c22fdb49e94a67b16f2fe9b39b78b7cb65772966661ccc"
+SRC_URI[sha256sum] = "1d3fb8ccc2932d04aa3663e22ef5ef490244370f4e568d7850165068778d98d4"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 

