Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E887FC28B2B
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:28 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.471.1660894071213018330
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZuDzYrWS;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id n4so4155636wrp.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=os3jmGcStapVuProwqAWjoqg7qy4rmCtJQjKJv1D0ik=;
        b=ZuDzYrWS/VVlAZOTmNbFvNpFbOBQBySkVidyFXDx0ofFmp7S7g8pCNePSERoEKyp8n
         rJ5HAXSoP5OdnoOTXXPKHgyv3MprIYKCLQ0Km48pg2jNPAom0LH21es+m1EtU8s9fi/f
         D2uaF8/1kuKoeMLnIMNiqUvyRceADc8ZPFUo7FhPbYIgS4w3w0JDQ0w1Fo7IyzUMU7QW
         PrIAcVi+wV6E4S4DH6cZNTxuS/TrCtiYlo0SPWVkBTy+jY9/bYRLyLhrXz2pRTBr2ltn
         Hvbe3TID2inRJfIKQiv5NvfRm146354EfMdYqahQVq4Xh9xWPHgBnlhqRPV5EC7aL631
         JFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=os3jmGcStapVuProwqAWjoqg7qy4rmCtJQjKJv1D0ik=;
        b=4Si+RWmuVpQ0lQO3xdiYE/Rm8Dtl6hxchmIhPneulIzmbqpmdV3MD22fPsgSF6jO9r
         Iou432oG6VHfAeLAwixIZnluZjQjNLcFcz5KjPGY+7JujJ4BznWXlbvTNrS5ZxUMA8I8
         b+3EEjZ7R35gBASBUUUsw7XY/QO5EkmpNdGQlHd8Y4TlSsVbfqgNx5781ltQfMBcFhaW
         OTj8LkbLqf8mBvBNZfcBUbE5BtpVfpqXkovV0UIvcwnwYvJQ4jb7JubJGZZLWDs+CzXl
         0cP6g9Y2Y8YMQ+4SLIuwxmk3nOyhjukH5FQXoEP+sCKAK73ouQY1l4rXeqFqRiffyYJW
         PsCg==
X-Gm-Message-State: ACgBeo0tMGtmVxhACkZEsUUtsKly0cb7t6mV7yOgzbFpHn1uE4tJHdxP
	gjBKIlZr0EbxZGQ9I2oUoo28/iZIOdA=
X-Google-Smtp-Source: 
 AA6agR6N48IQZNvhEvz77zdxFq4Vi+9g0er7IS/H+x8jvjtfuowvhUojFU9BQjSCrGYjet17FJJm6w==
X-Received: by 2002:a5d:494d:0:b0:225:1bfc:6820 with SMTP id
 r13-20020a5d494d000000b002251bfc6820mr3432441wrs.473.1660894101130;
        Fri, 19 Aug 2022 00:28:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 38/42] wpebackend-fdo: upgrade 1.12.0 -> 1.12.1
Date: Fri, 19 Aug 2022 09:27:23 +0200
Message-Id: <20220819072727.2236928-38-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169609

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{wpebackend-fdo_1.12.0.bb => wpebackend-fdo_1.12.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.12.0.bb => wpebackend-fdo_1.12.1.bb} (90%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.12.1.bb
similarity index 90%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.12.1.bb
index 4a18467ea4..5f776c13e6 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.12.1.bb
@@ -13,7 +13,7 @@ inherit meson features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6239c9c15523410798d66315de6b491712ab30009ba180f3e0dd076d9b0074ac"
+SRC_URI[sha256sum] = "45aa833c44ec292f31fa943b01b8cc75e54eb623ad7ba6a66fc2f118fe69e629"
 
 # Especially helps compiling with clang which enable this as error when
 # using c++11
-- 
2.30.2


