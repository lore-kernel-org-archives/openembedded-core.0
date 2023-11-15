Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC070C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 09:30:48 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.9651.1700040646088206722
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 01:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Y5WII1Lw;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50a6ff9881fso8202262e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 01:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700040644; x=1700645444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PPInoyG11tWVUtTbrxgP/O0d70sUvRi1lKfFwaks5pc=;
        b=Y5WII1LwKVv2xfMS4Mu7/kFaBtoApShe6pMmj6bAN7Y1ZvykPzLCIhfkHYhEsBlSf4
         MZ0AhEIOp5Fm2n3Q75j85I+/TeddEO2GmnMNuh3Ts4DiKxKELmhtFoLCHnwE3JJ7oxI/
         PmsEFy+QEXHGZTxlzbKTx04RhQVpWuEHhgckpBnibbv/C4Z/OJx4nNlX3n0zW3Uz7o4S
         vMgJc26QdtPaul8+73M2uDne5vIwBD+ok0R5W/W2hsxecQFmfkb8bCrWEyNMrcHCkCCX
         gDLmeM2hIYbtnXjkrtd+qK5ZW1aBZOra56R1zH1SL5L/tQ5aQfvHO0CAT1r2YRdgAGqO
         IlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700040644; x=1700645444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PPInoyG11tWVUtTbrxgP/O0d70sUvRi1lKfFwaks5pc=;
        b=kUhvc9d+IxIiLqe7TYuPzjJnqvErzsxAvyHAi1GV5771y+wtODAVDMGUNCAgCHFTO0
         DIf170ZgHvbwGQfe2khNDd78qb1RkFlgKXRAyBxl42QmbAZuJMGrdODUBweLw87Pq4+5
         B5+3+6llMbCi06m8/JnXp3BWM5P/aGYtNFjjj76WWZ1OCU+WVlteIbme3N9Y7Q0VIGmm
         RlPxf5oq8lKXI4b5/L885Fw+U7+/tR4/67u2M212ZoXAiU/1OsCykbJLcXhO0Q9GChTw
         zqaGp3apR3fNcsb9acm2/iVFSBcbACxbmD4KPeH0WIcbrgHec1EweulXY/RyoKeEqZEg
         Z5CQ==
X-Gm-Message-State: AOJu0YyUGy7BRgQpbV2fmKOgZiROV0NgoA+s3V5M7zqHOrmr0ZB0aF8K
	UKkXYU+bRKeI/w/P8jJxGu1Z6ehpe0Jr80Dremg=
X-Google-Smtp-Source: AGHT+IFgGDmLZJsZ+WEwj+u6iKuQtBtXN12MlJoOI3YXfUAjGSkzqHwfmdj96qPq3BLexpfgDp+JdA==
X-Received: by 2002:a19:f807:0:b0:4ff:7004:545e with SMTP id a7-20020a19f807000000b004ff7004545emr8429573lff.4.1700040643577;
        Wed, 15 Nov 2023 01:30:43 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p8-20020a056512234800b00507cf5f9299sm1594025lfu.125.2023.11.15.01.30.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 01:30:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libdrm: upgrade 2.4.116 -> 2.4.117
Date: Wed, 15 Nov 2023 12:30:42 +0300
Message-Id: <20231115093042.1618000-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 09:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190579

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/{libdrm_2.4.116.bb => libdrm_2.4.117.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.116.bb => libdrm_2.4.117.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.116.bb b/meta/recipes-graphics/drm/libdrm_2.4.117.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.116.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.117.bb
index f0aaf314c6b7..3e6fb16e15d6 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.116.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.117.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "46c53f40735ea3d26d614297f155f6131a510624a24274f654f6469ca905339a"
+SRC_URI[sha256sum] = "a2888d69e3eb1c8a77adc08a75a60fbae01f0d208d26f034d1a12e362361242b"
 
 inherit meson pkgconfig manpages
 
-- 
2.39.2


