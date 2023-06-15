Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48040EB64DC
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 19:23:43 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.27512.1686856848623937876
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 12:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=zGKOyyTq;
 spf=pass (domain: baylibre.com, ip: 209.85.221.41, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-31109cd8d8cso1853046f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 12:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686856847; x=1689448847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYI37Ye5Q+SfaHAyPB6pIRZPSIDBYuN7b6dqMBbfGvM=;
        b=zGKOyyTqBYGkZtS1Iw5tMpOmtikIzrJWfbrfUyM2gNsTHlUCVFslzqWH7tNComyMVc
         mG3dxG6prE+23q7cWjlF1As2H55rJAijKWyiR4rvXp08iIYu2xtPVj9DJEXdegFQjCa8
         Rkpt5lbaN3h/4OMA2s4Zm2rmdfRX9HQjnZoslhS++14Bn0qX/iPCDSUtmYTWTwI3ruRk
         SxNtrui+xtu6cpIcPhdMlZbA6BBZ9rENlLyxngWEmu5DhrZ+Wmjg9YmIQhwvuYQX3Hxq
         PatIpj8ax9ZOp7qcqOKcEUPMKE2ylKDmcM0ESrBKwHv/WYR6A6auH+8+z+q16l9/PYap
         TpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686856847; x=1689448847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYI37Ye5Q+SfaHAyPB6pIRZPSIDBYuN7b6dqMBbfGvM=;
        b=bdgxSLyI7wHZB82mOv4CVahvHMmT6jX3AT1MeO/roqarbDR4x7YpagYcM/4UO3NLzj
         BwVuYWqVbZQST8Rfi4QiKz7XIjjPBHe7hoyF8zQJTtXyu5QUbSaaMsPGithg7Cqr5fHz
         QNWjygPttvpi+/dXCx7dz1LNQTDfrq5satGKXaT80ZuSv1xz3lYR490PYpLK/einO3Ng
         ErotC8Ev3ZHJcnbak5hJCcSfg0rTSzbFLukODLXFOtXgmHVWS2y2qm5vi2jPpKgq1bnB
         KPeGEYLiNrKzy5f98ek+yKiQpXaYg+wz/nXVmUf22Ab6uwlHkt+XY+PoirnxQDqB+9l/
         RJtA==
X-Gm-Message-State: AC+VfDx9Qn+0joiU6MrRbVEoZOgMG5j+IR4T8+rbQroFluxUDRckUA78
	uwT6iRPQN6rSi5nBZIUOkmF+trEnTERhrjuSV/M=
X-Google-Smtp-Source: ACHHUZ7X7AiF3DnI+ChijVGUxYRDWxoQ1IeDkOzJmbb2IESV9P1ccrs9ztsDRDuFdDVW+5Vd3L7rmg==
X-Received: by 2002:a5d:514d:0:b0:30f:b65a:e5a1 with SMTP id u13-20020a5d514d000000b0030fb65ae5a1mr11287705wrt.38.1686856847205;
        Thu, 15 Jun 2023 12:20:47 -0700 (PDT)
Received: from tapa.fritz.box ([194.110.145.180])
        by smtp.gmail.com with ESMTPSA id e3-20020a056000194300b0030ae901bc54sm21788097wry.62.2023.06.15.12.20.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 12:20:46 -0700 (PDT)
From: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] xwayland: Upgrade 23.1.1 -> 23.1.2
Date: Thu, 15 Jun 2023 20:20:40 +0100
Message-Id: <43c31d7b183d4b37942b60b0dd496743fb71f9ee.1686856412.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686856412.git.pidge@baylibre.com>
References: <cover.1686856412.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 19:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182870

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 .../xwayland/{xwayland_23.1.1.bb => xwayland_23.1.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_23.1.1.bb => xwayland_23.1.2.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_23.1.1.bb b/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_23.1.1.bb
rename to meta/recipes-graphics/xwayland/xwayland_23.1.2.bb
index a065e92f01..de516536d1 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.1.1.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.1.2.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "fb9461f5cb9fea5e07e91882311b0c88b43e8843b017ebac05eb5af69aa34c15"
+SRC_URI[sha256sum] = "bd25d8498ee4d77874fda125127e2db37fc332531febc966231ea06fae8cf77f"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.34.1


