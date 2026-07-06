Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41C7C43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:54 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155332.1783358265228295453
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Mvmdk338;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47d6c634f45so1283791f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358263; x=1783963063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTsRyQ9WttroH55RwOgJBuVFbqWx6UiZYQsSauobAig=;
        b=Mvmdk338iMty9yEKGUh3VDAb6M/u94k1UcCW6xq2Y1tx9CDJKXhdfE30qwLdLCN0zS
         56LXCuzFFanfzW0RbTs5hGZiEKQ4TVmrk0PBwW3YYYFXVMCwzmX1FF5gMbRv/4BJJPHQ
         vS4pvvXhenN4/dKe/IDAfv05cnukB9a1czGVrSteeFeD8WvJckv8WM0tvzLNum5GWL+V
         8/TELZJM+kzAiVvQwcAsshsRbmjQ0icSljXaq30KYqqAMVoOPeZTA12wsdW6n3jWwXOp
         i8zXcSm6F6PUvBunsaj8b62+7r4JzvaP3VnSi1pdWYfHbOjbxVtUaoWmWkOB3DAbD5gF
         jahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358263; x=1783963063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tTsRyQ9WttroH55RwOgJBuVFbqWx6UiZYQsSauobAig=;
        b=J2vH2y4EiNs+ujjThB9wv2im3TlwUqW3/WHEp/1vDmKaLzqqwgIgIeS12ZVpu6m7Hj
         ZykZL6oAxYIqc1fuD4K+Aivu5sU86lLpyef1Tl/hz2u5ZfqKkZ06O11pOaGQiU5ys8G2
         9J82cPDeHLwFfYBsw4hTTqGjNX/IYToGgv2vlaErd0KGaRUPeEXvOHDwbK8yoX0Ia75p
         ul6H9KeN9uwTfSe425+D7VS7dP3mTLTcTDKeo9R2Qk47mmhpuVhDvAo6511RppP2pNJt
         laDxCkq66KPdS64Xan6b5qBTDk77dMUskWG+whbevSHsfsCe51b4kIx46XWYa602xYPp
         H4bg==
X-Gm-Message-State: AOJu0YyPvB1JwtXO/rbPQpBk7OGt67KPO09Q2zcwY1XfNtRz0cWu0jj+
	f+Z/Ed601oMjfNpE3BwOh4hRSE1WkJAYofwHnG8Yxb926AHWbr4pWfHwfU7fLw==
X-Gm-Gg: AfdE7cmvim9ZQm8ji5ylrgUbMOs2473mhEhLFz5xxqTEoQK3DDxjrs+ymmziyqPfRKq
	DQaAUXIySK2mY7BKdydUbLFTEp5Eo5Nh7yx27RZ+7vRfC4yY2ZBcOwbphCbVLj122/IO/QaMc5F
	92kypQ1Or5lQRSBf3OqfLEXaSbiLFs8nvMgU7CtNTqoRIIWv78fHl39I2RSDQ1rxpkkMmIgbT0a
	bObLWXGYilW9+LBwxzCsIPIBc4qxi27jAnrVvWllw5u1N8+8ZRwczZ/laF3GFezthsm7KrSqwKI
	AULcwM8UixL1LMErDov9LKkK0zEJM/B/B14yug2JZrzg8059MJBY2BacWa5G3Ur24ONhCbxTOUr
	feAun/zchqZsCN85dnln/0Zfye7BOSe7i+3S97aaUACsrFOGLzAyA/5WXuM6bBoJixK2TJFUAMv
	22yoP74pg4leRg/v3Gz32EChNI3GAuEnAqQOpEY1S92+saWvvkbekckaFwCok=
X-Received: by 2002:a05:600c:1f91:b0:492:70f4:8d1e with SMTP id 5b1f17b1804b1-493df04064emr17414485e9.11.1783358263343;
        Mon, 06 Jul 2026 10:17:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 45/45] xkeyboard-config: upgrade 2.47 -> 2.48
Date: Mon,  6 Jul 2026 19:16:59 +0200
Message-ID: <20260706171701.70536-45-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240331

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{xkeyboard-config_2.47.bb => xkeyboard-config_2.48.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.47.bb => xkeyboard-config_2.48.bb} (91%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb
similarity index 91%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb
index cbca31fd62..dc0d1e1677 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.47.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.48.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=faa756e04053029ddc602caf99e5ef1d"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e59984416a72d58b46a52bfec1b1361aa7d84354628227ee2783626c7a6db6b6"
+SRC_URI[sha256sum] = "b77041324f0109f77161ee43743fe04baa485866af8460d31e476ad3f7648fd5"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.47.3


