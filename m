Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C5CC0502C
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:34 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.51891.1661624771184284628
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nGTcThHk;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id
 c16-20020a17090aa61000b001fb3286d9f7so9624150pjq.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=x30YEsZoB1khm5zR4NpGqj3IZcN7RbLbcSCiKTr/abw=;
        b=nGTcThHka5qkPtrA0Plx2sdNHhs5pyBR/3KK4NsR33sbv+QGrqUpOSSAdR+dwOt0OP
         dD0o12y1rJEknwA1ywTqu1zBrzv+1PCslwehw9i/9kHws68PxStQnabVEttoIvbG2ppA
         y8vqXpFnEdBGcfZkMsR1TjsYC9jw3vJGXuIVcHLMOsHx3zKLSaeF0mh9bLGktGUXMIMf
         nLQu0aZi4DuR72lJdfg7KdJKAlGXr4ybyhtL1XYnrtIiUHJOxBGAVcYXo15foG5AKfcM
         Tr/m45KJ+jmdCCyELU7+aQL2D8odYJt89v2RMvUYMrZdCN2K/dKB6i5Wc4LGiAPlWcbf
         bidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=x30YEsZoB1khm5zR4NpGqj3IZcN7RbLbcSCiKTr/abw=;
        b=sL0+OgJhJ+ve93dXah8tfUd6BLD0CAHN3iP8u70DDrdjRvc3dZdDSy+Wf5HNa8+a5i
         hveMOhYDat0JLZMpKMOV1xZj/xFh+UofAqw4gBGrOXiQxIEV2kuryn9K9fZfBQBQ3ejj
         Sh7tzq/y9SEk50W5TOfzizwnoeaaaVaT7pBL6S+jF1BGJEK0BCvhZYhAZRQZu9fvLZnu
         gZJEA0yyFL67RQopI8g1+siQTYQW8FfBq+gSr0riekCeH7UaT6mYPG4qJSye/TOJkNyN
         /5p8IBpknRX8nGtyiB7Tv0td+fBP0g5XY+1lJdBrMxaDIsybx/yJ+lm9jnUozBxTq1im
         SV3g==
X-Gm-Message-State: ACgBeo2ygMqgpU2aoxnniJzI/09uJL+xgXdXybh+1gGsbHHn98Ynv8Fk
	XYlpUK5UzgZzpDz5yiv2w7phiE2e3g6Qr6uq
X-Google-Smtp-Source: 
 AA6agR5tTELBVrn3LLuJmqC5L30wfCk7J81F0GH501U1g5rntjfr38MYIm/jE6uF/4eFNHAA49YioQ==
X-Received: by 2002:a17:90a:738a:b0:1fa:d930:49d1 with SMTP id
 j10-20020a17090a738a00b001fad93049d1mr10337655pjg.130.1661624786925;
        Sat, 27 Aug 2022 11:26:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/24] wireless-regdb: upgrade 2022.06.06 ->
 2022.08.12
Date: Sat, 27 Aug 2022 08:25:35 -1000
Message-Id: 
 <02ab5e72cea0b858de99cb38aabe2239de2e250a.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169952

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 75386480abd1660a50c79d5987b77ccc43295511)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2022.06.06.bb => wireless-regdb_2022.08.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.06.06.bb => wireless-regdb_2022.08.12.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.06.06.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.08.12.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.06.06.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.08.12.bb
index 2eba4f873b..357e79d7e1 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.06.06.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.08.12.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "ac00f97efecce5046ed069d1d93f3365fdf994c7c7854a8fc50831e959537230"
+SRC_URI[sha256sum] = "59c8f7d17966db71b27f90e735ee8f5b42ca3527694a8c5e6e9b56bd379c3b84"
 
 inherit bin_package allarch
 
-- 
2.25.1


