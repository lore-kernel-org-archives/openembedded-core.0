Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCBCC021A1
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 22:07:14 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.1179.1738966033908458338
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 14:07:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ls5KN2tA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2165448243fso64223295ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 14:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738966033; x=1739570833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMflhEpca1HxErQ7FF03I0PUoJKdIhkOjN9xXbTC90s=;
        b=ls5KN2tAza8zFq5Zvl1UC6UI9PgxOk+i+rNhu5Su1D+0Vl7lyQceFxY4PorcdqHV1c
         Sjb1t356p9l+ZMoyFqjnH6d3nN8ldezn9gjRHB8+wAtR1h3g0lOXXZY4rq8/4TtoiV3i
         yw0kGLxmAa4UJDO7err4QVwjHMMk1LaRO0xuMuNj2iN9U6u33D+8h0AYA7gJWFDTjQG2
         Ws4RmxPr4+xVYS5xEeEqLIfOedi+MFzgH7Df8/GmsVjIP+gSb/feqOVAV3zH929wCgOK
         pCKhKA4IxH89XhDno7hlkXIk/v9VOD4Wk6YQKkAO6H8JxB7FgJz5dYIoV5y9Xfck/Tph
         NQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738966033; x=1739570833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMflhEpca1HxErQ7FF03I0PUoJKdIhkOjN9xXbTC90s=;
        b=EGM10fVh9PR1TROOlGigXXhmYJb8JhsY8hkZIBnDOP9K1UF47rgeZu/ZFCzvlLliyP
         y89kO0gWJLAeVwjJcDXcIjYImP6Vkt+2j7Ec/hWRuH8AhCsqQmk0YkiA+sVtgKKIH4Q9
         xTCCPOgfatIMqhZa+2ErCrfkS0dbEeJuFDfVe4rNnOXqeOlQE795sxzS1e1zYvG76Tyo
         2X7UrgXn+0n8gWt4bXbPmwQKW7bSQGvnjPvbAtMIWyWz8Y04ZFzWNmqUaNWZDRNG/xt8
         s+LhJtxTqsZIhvgVpOIHej4VV97QM4EsCMIjXrl2RN2EbP0Qf7waPGLwPj59WhmB09oz
         mtDw==
X-Gm-Message-State: AOJu0YzJTQQaQupiMK/WXQ4TeQwpC2CfeMVoDEOGUQWGB5CQ7U6fGXK2
	xDJvjo0JBydUfwqIliUcdPUXVUwa+OM6qzxV2ulkw4V9Zu0212ABKMf4GqBmRlUsXHkJ66iPEJz
	J
X-Gm-Gg: ASbGncupmkDBo+F/p5swEP4xfG5D0T+PoilyydySUCSz4+XVwt2j/mOFmLOzukmTXQ2
	ffVLzc+bUsOr1hljZh8hzuLBnXef7hG0THm372ZAYI4+rF2igR/lENLQXmLKJBqlpJaGxtvBFjz
	+5fSo5b4g3RaDURwToH8QV/xEVVVdnc4QltnzOp7S3KF7ynLppPTR5CmSqErHI4WZeO96QAiR3Q
	vyADl723eHak14BQWJODVjoHg38Us3mMj9WYbdmJzK6ESlQoKWRRyV+IIriMCPykATIQWfoXSED
	84F3
X-Google-Smtp-Source: AGHT+IE3QUCOxEOsWOjo1wUqLtTFOjaBlzkUATKKMhOpuU8EskuB2Uyxn2ezNAcXMD8/4s+RpFdYSw==
X-Received: by 2002:a17:902:f60a:b0:21e:feac:8b99 with SMTP id d9443c01a7336-21f4e10da1bmr84550075ad.0.1738966033186;
        Fri, 07 Feb 2025 14:07:13 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af65a31sm3586737a12.53.2025.02.07.14.07.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 14:07:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 12/12] lrzsz: update SRC_URI to avoid redirect
Date: Fri,  7 Feb 2025 14:06:53 -0800
Message-ID: <560380113be1dce9ab35ebb91835f741b5519d31.1738965898.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738965898.git.steve@sakoman.com>
References: <cover.1738965898.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 22:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211011

From: Ross Burton <ross.burton@arm.com>

This server redirects to https:, so we might as well avoid the redirect.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 244779cc4d5e46cd3611c73862e653d38c8b99dd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 3024ddcaf0..f21b936020 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -11,10 +11,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 SECTION = "console/network"
 DEPENDS = ""
 
-SRC_URI = "http://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
+SRC_URI = "https://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
            file://autotools-update.patch \
-	   file://autotools.patch \
-	   file://makefile.patch \
+           file://autotools.patch \
+           file://makefile.patch \
            file://lrzsz-check-locale.h.patch \
            file://cve-2018-10195.patch \
            file://include.patch \
-- 
2.43.0


