Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06C9C433FE
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 06:15:30 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.5205.1637302529328476005
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 22:15:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MmO+/9JD;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id d27so16188490wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 22:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Vc7WK/fmUaK7hXIq3jyebUEyNQa1MDhwzyI2SYMvLCY=;
        b=MmO+/9JDzaXF8ekR3Z8OV0T0+RQwN1PVGWTUoBjNYqX89yeo2DP07LkDR5tZvc/3uD
         9CmjuFeq2TywKwLPWORoy2m8nJ3U76NNJ1Pm4m/P08TAGzT90Sm0YndnSlpOgzRpF1s4
         UGVHfNC7oEfPA4P2xLczY942nlYifOcyt8AQZY00c7ewx15o8HQusBBduGciNmoz6id8
         XxPor8O31LDkfspPkUQT90bALOz6h+pykGovFabgO8PH9b8Rct6kLuNfWsOLdXVTYRT3
         z+Nl+pFHdf0f3vVcFYMHs1hpJ9dxO60mKLnVlYStSCUVLz9SOsmYecrsV/6gt5/R1AZN
         anyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vc7WK/fmUaK7hXIq3jyebUEyNQa1MDhwzyI2SYMvLCY=;
        b=amGxakmy4GIWOKf+6d5ho0F/tBHXcd++WoVzP+zvVX2Gwr2Dz1u4hwptrvN5vLKFj9
         gsO/MdSj6/oo79o1dj8oaSqVrXgnVbcBvjqmcxED2+vTbSia8MyqGL+2nzqzzNZ0ULvq
         sx2vPh3+oDsBedRuFVW2wfYimO+NJKygVJ0OjNWJPuoJ1j+mN5H/d/c6yBH7sUkSpcRO
         pEzo/7O6TaZ9ijeMwW8qJYoK610efOnwxwHhT/TCcfMzWJv5F9Nd+TceNpy8KoYCa7DX
         oUmd1JU3GXloqxC66TLVSqUFOELAQZ9elZu2UrDBpYrJiF68y1ciVwx0GT21Y08sSUrI
         uk2A==
X-Gm-Message-State: AOAM531EizrwENEyMDsOsoIyygulv4uP7XRsHaXdSBPaKAJjW5Pxv7K4
	7LcX87rbHiKB04YZHB3W84gOsouKK1iQow==
X-Google-Smtp-Source: 
 ABdhPJzFboiX/Oo8ZQegVXzr99oDrvXVk/SXqXrpLHwVTX3Ob2Tn/O/JC7fTPY9nw+mkzSpNR7PEAA==
X-Received: by 2002:adf:a389:: with SMTP id l9mr4309642wrb.121.1637302527613;
        Thu, 18 Nov 2021 22:15:27 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-197.002.205.pools.vodafone-ip.de. [2.205.7.197])
        by smtp.gmail.com with ESMTPSA id
 z14sm2039249wrp.70.2021.11.18.22.15.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 22:15:27 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] image: add overlayfs-etc image feature
Date: Fri, 19 Nov 2021 07:15:04 +0100
Message-Id: 
 <74a23ab9213378623cb76f6ad9fe4aa661b472ac.1637301667.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1637301667.git.uvv.mail@gmail.com>
References: <cover.1637301667.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 06:15:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158495

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/image.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 6c759fdf70..e198f041b1 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -15,6 +15,7 @@ IMGCLASSES += "${@bb.utils.contains('IMAGE_FSTYPES', 'container', 'image-contain
 IMGCLASSES += "image_types_wic"
 IMGCLASSES += "rootfs-postcommands"
 IMGCLASSES += "image-postinst-intercepts"
+IMGCLASSES += "overlayfs-etc"
 inherit ${IMGCLASSES}
 
 TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
@@ -33,7 +34,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 # IMAGE_FEATURES may contain any available package group
 IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
-IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs read-only-rootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empty-password allow-root-login post-install-logging"
+IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs read-only-rootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empty-password allow-root-login post-install-logging overlayfs-etc"
 
 # Generate companion debugfs?
 IMAGE_GEN_DEBUGFS ?= "0"
-- 
2.28.0


