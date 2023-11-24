Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F7B2C61DF4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 12:31:57 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.134325.1700829116295301861
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 04:31:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KLigFvd6;
 spf=pass (domain: linaro.org, ip: 209.85.208.179, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c8879a1570so23868021fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 04:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700829114; x=1701433914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3x7/UGbdXzVpA7qq+juNj+J8m/gzSGGJexVkN369yA=;
        b=KLigFvd6gQbu+V5bKWRBcJgjAsUMo8DMe7S9YBDZYeteYKXOMZU/06nUklIcZSSEwp
         99PyPt3tBEZkBBrJAbK3WUItrUIWEFRwRy2ATHWVIQTtNEAhl9lFxOdtl/yu96Yyqmhl
         zVFOfNh9pspzoqUiLd4xJYe/oA39qKQpUbCZbY5RiZ0QKb4FArpb3s9DSWiYC8840Wkp
         WBKcfRgF4/kwy/ZqrFmf8L/DSiIEfGngIjf4sHKmIzcdAR5FxyHHHuUa20NM6E/nnhtT
         cDdbaugnMlMyRCYkCWZx9PrZy5cRxTD2yQTuQO47bW9FPkKyep4B/ji/oWwg5JuxBlu8
         wsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700829114; x=1701433914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3x7/UGbdXzVpA7qq+juNj+J8m/gzSGGJexVkN369yA=;
        b=Zv2JY7onyErMJneVsZGHKvNqPK2tz9sE0WYPpPSdkreGct0lfGUHn4QedCrwyRfY6m
         gNJVL3b7+AXYmsv6sRGjztz8WixMHkyF9+i5vxKK77hfVG5tlVD32YVwMjM5Q/rBBb2D
         ZuH4BAEYmkATechBmoPyvEjAr/QebiOK37i3abBCPB4IVzPCQepy6515/8ytq3dmEmd/
         6/Dkr6isE97bMCwe8h/si1ukCboMJQQTPvhnrUuZ/DLpxjhyDT6m8qpkTBTvvGpIqrIP
         7T4oeVKOHQGcmg9ib35NK4Q405xdbKIwb0Tw2+oM3bCaBPQhmlcLMTXu7hlnCCJhUB8l
         p7nw==
X-Gm-Message-State: AOJu0Yxc/mqK5kyNaI1vtWsNdy9RZhAHk0ee+cpKnaoMxDRhwasa45Mk
	M4FlSHJrbmJzzCowO+KJIu0RkldKAsi9tSmX0Q8=
X-Google-Smtp-Source: AGHT+IHpPExdLMlDcKDOA3xDNUpVLLIluKH3OGZrvGu4e2m4WROLKhQaqEocot45v7RVgjumvVz1hg==
X-Received: by 2002:a2e:96c9:0:b0:2c5:31e6:e8e2 with SMTP id d9-20020a2e96c9000000b002c531e6e8e2mr1856173ljj.25.1700829114184;
        Fri, 24 Nov 2023 04:31:54 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e86c9000000b002c123b976a5sm478210ljj.123.2023.11.24.04.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 04:31:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [nanbield][PATCH 03/10] linux-firmware: upgrade 20230804 -> 20231030
Date: Fri, 24 Nov 2023 15:31:44 +0300
Message-Id: <20231124123151.1091665-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231124123151.1091665-1-dmitry.baryshkov@linaro.org>
References: <20231124123151.1091665-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 12:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191186

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

License-Update: additional firmwares

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7c725d1f2ed9a271d39d899ac2534558c2d103fc)
---
 ...{linux-firmware_20230804.bb => linux-firmware_20231030.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230804.bb => linux-firmware_20231030.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
index 33be741a0a56..fd38253dfd29 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
@@ -151,7 +151,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "41f9a48bf27971b126a36f9344594dcd"
+WHENCE_CHKSUM  = "ceb5248746d24d165b603e71b288cf75"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -237,7 +237,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "88d46c543847ee3b03404d4941d91c92974690ee1f6fdcbee9cef3e5f97db688"
+SRC_URI[sha256sum] = "c98d200fc4a3120de1a594713ce34e135819dff23e883a4ed387863ba25679c7"
 
 inherit allarch
 
-- 
2.39.2


