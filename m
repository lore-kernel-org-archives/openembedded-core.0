Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA51BC35FF1
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:37 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.4571.1741809392731538758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=n1OGJ4nV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22580c9ee0aso4385565ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809392; x=1742414192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKH+A6TkiIAbQS8ss2jBCgemCB8K+maPmwTWN2EsumE=;
        b=n1OGJ4nVz6xCL0NYtIWNsqdO1ZAYD3+aN5ITd/kI1HBLkdeR1yqICCsH5rWeBB2IR9
         s+Ra+TvDdeDYEaSAeIvG12S0bZATXxay2KnUvjea7Z7n4VhCGMIVF3gI8NsCcg0W4LVs
         ZwURS8shikWrzt1GdYst9eqZ9oXHb8ORbDimCUFclgmI37MHqW26uWWYzytdAI3Shjfp
         we312b2g6NrmY0tNbxtzDvQA/XrwOIpypjI30ef7PCqt+W5/4qx+vn4gQsPhc80Qr+OV
         CSVWaH3VgWI74+1w0Jvm/HdJfHX35TiG2DVtAf5fqYlVA1/dj09lNYJYlJwJ6cHpFlgD
         HSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809392; x=1742414192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKH+A6TkiIAbQS8ss2jBCgemCB8K+maPmwTWN2EsumE=;
        b=DEnsvEk0iU7WANXF7vJqLY1U5zpm00eNsl83J8Hb+J31vdKPundAb7vJHcj2dd8Eyz
         NZa4twU7pWZCZpTcyQ+dHuk+sUFuMV5eYpIgYxdFCyx9AuQSQKQcBZ8Aoutx4KU5vrur
         i7bXtsedNIGohJ7kx7NLtVbeE1E2t5weVdX8zAE68gkQqGsUjaxguqNF5DVqrYYxP6aG
         54sMByuavbg+Nv37HkG7C8oqcThhGsU+GgFj2qrOtFsht4oxolCc3LmwfNKbuvE5EfvT
         K/yKoqwsFpa6BIotL6OgcFAsIIlMnDP22JedIv+I8Za3sYffg302MJrHODeF5myLoK7M
         pIfw==
X-Gm-Message-State: AOJu0YyCOaMEKaRu6bTdzd5t/gpkvyK4EFcoH59EWbNYROYprAStXgoj
	47icZgPNvJfZv0GgBGqkTKo5iIaZZLRV0ONAMYnL/RLOfbuBjmEaEs9elycSLpY5+9ribP0Cwzw
	9
X-Gm-Gg: ASbGnctIypw/7GAT3nojMSEuF/s/U6e1gGAl7d734612pS+ak9dqm84LTFkQT7/BYBf
	nU0R+B9IorQbsHfC4PEH+/0+RXz8QdCcZ5DGr5nbJsWxzqX+yslOU2tyULfiClsO8HUK2lD9n7l
	KaXhP4cWaIGXz4SId89QAQ0tzgx2TX8Wh9GDZIFaeUyVZrMjhxcageSVFr/jt6zRAIlW+cPo1eX
	9MtLYqLUIxH3D8vBKMx2Kt0vWOcgXrZysBFBQHuaomsb+cxK0Ny5vCFd0TrJxSvN4nI8htDlsu5
	XVrAhk0ZO/5y5SzepKZOaf2i1ZniYiSbxCE=
X-Google-Smtp-Source: AGHT+IH89JdWtvgDXaTtou11I1CL3Uy7fbzwYC9eceDNPMJEdAbEpUoAUzHB4XjV3OE7h6DwtFdN7Q==
X-Received: by 2002:a05:6a21:7109:b0:1f5:8179:242f with SMTP id adf61e73a8af0-1f581792752mr20885393637.30.1741809392017;
        Wed, 12 Mar 2025 12:56:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/28] xserver-xorg: upgrade 21.1.14 -> 21.1.15
Date: Wed, 12 Mar 2025 12:55:44 -0700
Message-ID: <1fdd0a6824f34ce18c4adac8f0014935896b3e21.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212716

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ba94110d70ebfb1b4798ecf05389f7ea602b1f55)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{xserver-xorg_21.1.14.bb => xserver-xorg_21.1.15.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.14.bb => xserver-xorg_21.1.15.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.14.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.14.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
index 28c98eb527..080e6d220e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.14.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.15.bb
@@ -3,7 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            "
-SRC_URI[sha256sum] = "8f2102cebdc4747d1656c1099ef610f5063c7422c24a177e300de569b354ee35"
+SRC_URI[sha256sum] = "841c82901282902725762df03adbbcd68153d4cdfb0d61df0cfd73ad677ae089"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.43.0


