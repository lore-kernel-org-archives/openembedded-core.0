Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37902CCA48A
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:25 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.51615.1658306699694263100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X4nxjJiw;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id m13so12683363edc.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uyzE+rO666xi4bAf5cqt+bXHPaK0AEU+0g8ZdIp4BR0=;
        b=X4nxjJiwpt7Ds4BVgqlaydsdmMwRB1TCOAb88wCALDtNz/QQMLUXWBn045FoS/MZpB
         /DrwPVJAchh+sLpfdl8oUKT9lj1y+nKtPjziyIGiD0uIauGSeo58kWsHTEmidWD/rHr9
         rSBNJXk6xsEHpBAX08tE0MUhMJhOrEMxbD8dPhosI8o30gKrELMhfI9WhCfMAuw6n1hH
         viRj0qNJcA3ZVobvGYClSyEj5Uy4TrBLSQ+hBFzocTRKYrBj31SZXJUihh5OzQo9putK
         /t5B3g/atdEgW3qcV8LGC+mn0gvEsIWv5z5jpmfK8BaExvautgN0F55GKmR7/zTVhZBO
         6ykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uyzE+rO666xi4bAf5cqt+bXHPaK0AEU+0g8ZdIp4BR0=;
        b=sShAQSQv2i8AKorW//jNavgzSO0gUZDOHtdtcOOGBNkueaDglFNo5UIMQ09VjkKA9X
         MxTIBA2pJ6z0Nm1DZEbsgA5WetIYrYGwMxAoyJswEqILn7zVD1EsbHqcQKV1uWQXpY3D
         h7u3ZnFt47uLOgCiDDaLk6bwfxLOBAvDUhCn3sXls8SRjpF3Aaw4ta9/uY2bk+YABRlo
         G7fGGJlHpNCYYgVURpWdufTyV76frV5Wn9FR7T7ehX15Z9elrBgzHuwN4AjnJcBcV+7w
         +VNfgVkPTSrCn69cmrpYnmi9PmoRcL+YtGR2JV3k6ccvKqFgQ7rYPR36pcNmzSYipnCr
         eBwA==
X-Gm-Message-State: AJIora8uJsN+nmvBHX0wgwPCGjI1LlwZ6RWP1xRzf7UNP2dPcF5XluaV
	IHzeDhwLN5+JzDYFQSAwPGK1M56I6dM=
X-Google-Smtp-Source: 
 AGRyM1uDSaqTwzLvZ9sBugtm3e2DpyRgasdfwMtOYgqZJsdHz8bHc7G6Scw6IG/NdiJzOTCzVsjizA==
X-Received: by 2002:a05:6402:1914:b0:43a:d548:8adc with SMTP id
 e20-20020a056402191400b0043ad5488adcmr49718580edz.214.1658306717088;
        Wed, 20 Jul 2022 01:45:17 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 28/51] libdrm: upgrade 2.4.111 -> 2.4.112
Date: Wed, 20 Jul 2022 10:44:19 +0200
Message-Id: <20220720084442.2940187-28-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168322

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../drm/{libdrm_2.4.111.bb => libdrm_2.4.112.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.111.bb => libdrm_2.4.112.bb} (96%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.111.bb b/meta/recipes-graphics/drm/libdrm_2.4.112.bb
similarity index 96%
rename from meta/recipes-graphics/drm/libdrm_2.4.111.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.112.bb
index 17b737c556..48838245dd 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.111.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.112.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "1ad7164f77424de6f4ecba7c262bde196a214c6e19a6fbf497f0815f4d7ab2a9"
+SRC_URI[sha256sum] = "00b07710bd09b35cd8d80eaf4f4497fe27f4becf467a9830f1f5e8324f8420ff"
 
 inherit meson pkgconfig manpages
 
-- 
2.30.2


