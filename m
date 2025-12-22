Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A16AE6918C
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:15 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87671.1766434089297627794
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Djg+JeFc;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7cee045187so777576566b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434088; x=1767038888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DW77fLSsKTEJDm34UK6j+ffH/cZVcV4S2y1abFmZzU=;
        b=Djg+JeFcs1caLVK6clKtklSqopLgn9znTf1lYh+UydfUe4O5/UJuYADOV/9NN4UdIn
         2RvGQbvhhLAu/uFOTEbqXbfLeuSSWNQQDXBOvjoopGF8xDx/zTHb51l4BDbLb3t4W3uL
         uJZDIosZ3kU4/SJ3O51ebsqtSvN4VsuQjb+gBFHvyNaolhxyduHR+NAHtTAWdXpVbnYu
         d/PM+Ddz2Hp8GzvKAi3gIPaGmbMB49qtUCnbmVKoQCw/7glwRaXPz9PaiJP6D3Sy3+I7
         d0SkOPkWe9xjyMXPbgZUNjQGx0ATrRWrt8fNQbH4XxD4HopSNUHMYHHNNw1IyMkaUhx2
         3fJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434088; x=1767038888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9DW77fLSsKTEJDm34UK6j+ffH/cZVcV4S2y1abFmZzU=;
        b=wTu1iX26kGYpSA8KW2mtj/p5MmZvaP+ifxOp33KcMHpV5HrCnM/etkfiy35BosSqV1
         CMxrZBI3XyffRIIHfn6QU3Tmcb4pv+/73MnDV9Re7h/47NvtskUMDbTETq55k4jHR0Gf
         UkaUuXiwYyCRRNDlt8FXl8gLNO9CWTnI+TZJOc8xb0ctJ1rZoDmEm13ABFzogfTpsaNj
         GxyigbH/EnbzhhUs5uV6uRCxbDDPRceiIW7l5kYTU/3EkjWVA9xsj5c71RJdohRwUvq2
         IKFY1VZyvMB8h0QeSLHOI4ngoPMik4UG25w6nEac+439gissBm+6Xtj5WqX+roEdgh9T
         EKTA==
X-Gm-Message-State: AOJu0YyuMcIzcf2jhKD2PFgyU+su7a2n3j4vcdBTnnm0Tf99arVoy1iu
	DTVio7KjQgqxTe0uz7Yy7mSzHBiUVmiyzKUx4cFLey/v7+xWeZLfalpganY5lw==
X-Gm-Gg: AY/fxX6UXKWPKNyl2P/AV7oIhDaMke4rgJIxXp1Zq1XfEZ7BdZ3qimjEJWwzFehmHoJ
	ZISvQuuVl1GzuRRPzrHibqLBmr4NP+HSpZRuwINrPk5Bhxxh9pXfrN3RcJwdmXUOmCHNCDQVtP3
	eAimTnAiip2U5MVXStVooJhhVtJmwywOPCHpCIckI3JDLtQHuxQNq96jlHn8MwGegW+Y/qEbhkC
	KyNUGBeYaDECdON04DCkasbg62Yomtm4sge2uqzP3r1lranbP57Of7N5AVmZgl5SHgGZ5Y9xj8h
	LNAZ+O/mPHQXUC0+cbpX7uYfCarOe6JIjsRcc4ShrA/xsaR4wdSKjwr0BYKrB7FBhKN3ba351n3
	ZWv+RhvN8v8IjUr9763M4MXftrr0mgunmpaeV38smEjQX/SLaiamY3Omo+NuHNSzVuOCb4dLSax
	JoQahDuD/rVazaxZJUnPFwLST1+qF/cNFpV0lfC/mjMa2Il9r3CBjXY1LnVA==
X-Google-Smtp-Source: AGHT+IFDxqAaBoIGgPYwkbAX8HBXKcQGybSwb1JUyXTRBwxgH8Kbms70WPnwun3Bni/kH+wJckZfYA==
X-Received: by 2002:a17:907:97d4:b0:b80:344b:421a with SMTP id a640c23a62f3a-b8035743e21mr1512956266b.18.1766434087449;
        Mon, 22 Dec 2025 12:08:07 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 030/114] libdrm: upgrade 2.4.128 -> 2.4.131
Date: Mon, 22 Dec 2025 21:06:12 +0100
Message-ID: <20251222200739.2278706-30-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228355

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../drm/{libdrm_2.4.128.bb => libdrm_2.4.131.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.128.bb => libdrm_2.4.131.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.128.bb b/meta/recipes-graphics/drm/libdrm_2.4.131.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.128.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.131.bb
index 8796a7a3d0..1c55dd5550 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.128.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.131.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "3bb35db8700c2a0b569f2c6729a53f5495786856b310854c8de57782a22bddac"
+SRC_URI[sha256sum] = "45ba9983b51c896406a3d654de81d313b953b76e6391e2797073d543c5f617d5"
 
 inherit meson pkgconfig manpages
 
-- 
2.47.3


