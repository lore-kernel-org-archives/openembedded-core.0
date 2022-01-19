Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1011C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:51 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.4717.1642588911012135456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=juLMyo2C;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so13427128wmo.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gi57KoH9idkgs5hsfoj0mdLjxFdXIgF/R4kp0PrxPsE=;
        b=juLMyo2CRQanW3teKgiC7F8MTyCNFbVY7BzTsJ0AV6nsjiVGLni/Wr/LdXSsV+3x+i
         5KsQR5c1SIDRUTCw/D15bu+a/eteXlkzFbXtO/5z+zI8n3/NOIYjrMtvdJcdwb8N9QYK
         EjFwWmeK8Gj+5RnywPfyUSu8qvWkkxL0lPP7rnhb+Pmq4ogSkGyv2ieSWveJX9djIo9Q
         AKmRL3OqiSiQDU4nJ4+0zzewijmpyQfbH4XZCKLl6Yx3a+XQaGA++K7nx2kRJ7KkWRgm
         In2qbTiTW87PMDh4YRdgqM3TsyyNpDgMnMw5awECES6CNSV1btYUL5PJ9T6X9P0/y1Ov
         Y73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gi57KoH9idkgs5hsfoj0mdLjxFdXIgF/R4kp0PrxPsE=;
        b=3o4aE9s+7yphfK8O083OtWsay2Obh0LIfI9fIAC2cydx5DDGV/7VPMndsbtpJdMdqK
         7xmMzeFoyGb9ALxcMolwr2/D/+UDGqnAiX64QsT4sD9dzPU7ca58L+sM+Dv5CAhkZQOi
         G+rCEg1U7cCBDZJTQqdAfjuWoJWnPZviF7P1J6MlZjbB08ur951TXgZqTIXgFYQYzi1c
         P3iS0SG60E5YWnYifwZLEL90goYrdwkwyFtM9JoyiFAXqi6YUnYFJ4VKi+RueryqSg3q
         EE9qB+FA5XY/OUXziZ5xdYnRo+6AJz+MmH4Iq/N5HMT62680EkQ1CUAMS4Wsd/se+uU0
         swqA==
X-Gm-Message-State: AOAM532mwjj97ae0RHm19h0tN0CxFhhFCyFXI1DsXN08hRWIYmyb81gf
	2zpVjmNsF2dOsXnB5AxlNZhtn95Gf9o=
X-Google-Smtp-Source: 
 ABdhPJxTz7VYjVtpwdNikTZBXcI7i2jRQlvXvm2abn6Esx5ZL1dD0g1JsQFqvafeyEWokhqmHg9Dcw==
X-Received: by 2002:adf:e196:: with SMTP id
 az22mr27776937wrb.637.1642588909493;
        Wed, 19 Jan 2022 02:41:49 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 32/39] xwayland: upgrade 21.1.3 -> 21.1.4
Date: Wed, 19 Jan 2022 11:41:10 +0100
Message-Id: <20220119104117.2120127-32-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160724

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xwayland/{xwayland_21.1.3.bb => xwayland_21.1.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_21.1.3.bb => xwayland_21.1.4.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_21.1.3.bb b/meta/recipes-graphics/xwayland/xwayland_21.1.4.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_21.1.3.bb
rename to meta/recipes-graphics/xwayland/xwayland_21.1.4.bb
index 5d083e8ada..029123b875 100644
--- a/meta/recipes-graphics/xwayland/xwayland_21.1.3.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_21.1.4.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ebc2757f39fd4c7db1654fd86591589c211aa20172d43a54f77ae567cedbf8a2"
+SRC_URI[sha256sum] = "19f6795f31cfa8eb352b1e5b3c379f22ee6020e98701ff2cc679da8c4f1159f7"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.20.1


