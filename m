Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91DFC433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 10:20:38 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.26986.1643278838155447845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EQoWP01V;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso5564749wmj.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3eH33DoMjASo5nqh9c8R8cC2YKoppQNrOtWre8/BYCU=;
        b=EQoWP01VrLj7Bt9NywJQtKYxTpbNfXYl3KOx9M+ZuECRs0cvyN/1oCL5KGsUqhmy+g
         YbdRig6SgUg+p7gZey9aq4eOMmCkCuCHVPg8NE4FN50Je5pPSsU60ozPn2mO3Q8yud6E
         HO0PXP+HqoyktF3wl3SoS/WCL4Kwmaf13p7PgeWThX28jDEbCuX4fVB2Sa5NqbB4XRVD
         kKLSZ0Lkh7/PAZevoDxGHSMr/8uWNLGSCHUvQyww8p2yhG9KA2hhfRJ0+Y85hmBwVLj8
         z0aRg4XtzVbzaW+zZ1MjrLVHpwyKPzbsbVG2YW0JrbgjFEJiB95QhLuymT/yNi+bkH8m
         BH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3eH33DoMjASo5nqh9c8R8cC2YKoppQNrOtWre8/BYCU=;
        b=zwMzYVvQ23yksXAL6WuGgBkMaLIPG1PuGmbEAnRq5Dpd+FnjRxqB5+pYlxFyw6qhBE
         Ung/2U1jNr8XguRDX1U5vaU5IBXlNddpYFu85akPFfxvxX2GYmTk85Lo0RA2S3aHmuHj
         bQ65+Euu9TF7tQzJLq61s5ub3ggk4QWrwfg1jGYHbm4e70jE5PoniFoRRK3uSz9Jr19Q
         cHsMmnZF673+FyR5BS1GMQz8mjzcWpsn8Cyw9JY88Krph/ESg0OX0N+SR1A+NayV8ee4
         nRCELb77YBns4Ee5FH1RpFbPIMCnrjtr/Ucdr43wDeu8Dk76pprSRThTqgL1G8yHS63W
         wIkw==
X-Gm-Message-State: AOAM5328EoFsk/maqVowEuytPzizmtZ+B+6ZAktefgYzxii4SOLgsrIN
	A5ifVgOfN+yeyfoYmmRMerrsVDx72V0=
X-Google-Smtp-Source: 
 ABdhPJwEiZrGQzOGQXZVFQUdT19LRFg6xaO/t5Bd4YEGbTr1fWOb25cmGGnW80pEIE+TjaevYKcwuA==
X-Received: by 2002:a05:600c:a4b:: with SMTP id
 c11mr11281018wmq.135.1643278836754;
        Thu, 27 Jan 2022 02:20:36 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t14sm4060849wmq.43.2022.01.27.02.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 02:20:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/17] libical: upgrade 3.0.12 -> 3.0.13
Date: Thu, 27 Jan 2022 11:19:57 +0100
Message-Id: <20220127102005.3050843-9-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127102005.3050843-1-alex@linutronix.de>
References: <20220127102005.3050843-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 10:20:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161031

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libical/{libical_3.0.12.bb => libical_3.0.13.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libical/{libical_3.0.12.bb => libical_3.0.13.bb} (96%)

diff --git a/meta/recipes-support/libical/libical_3.0.12.bb b/meta/recipes-support/libical/libical_3.0.13.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_3.0.12.bb
rename to meta/recipes-support/libical/libical_3.0.13.bb
index 832d244672..cfd62ea672 100644
--- a/meta/recipes-support/libical/libical_3.0.12.bb
+++ b/meta/recipes-support/libical/libical_3.0.13.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1910a2a76ddf6a9ba369182494170d87 \
 SECTION = "libs"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "35095a4cc1a061a3de0f332c2dc728226cf127fa0baa818e9f8856cee6d35830"
+SRC_URI[sha256sum] = "02543b08897f3b75c76c360a335900ccfb027d2f5120176c777340e67e763ad4"
 UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake pkgconfig gobject-introspection vala
-- 
2.20.1


