Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF3FC77B7F
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:06:48 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.44373.1684310807057310413
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=4HdlFblo;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3f50020e0f8so53195955e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684310805; x=1686902805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BX7z9iEFY+/92c5yJf0ySgzT+SQ/nu+E6H540MsaVEg=;
        b=4HdlFbloMweYu2STsPNGGkBLQz5lP34jLPkDWqlmEgg9tw+eU+/c6BmEYRSuVg595S
         jW/xfAKZRzRnZoVpX7wgoxLjS8pvRUkRON4IoV/MEUaTsLqS+g3HjVz6mVhOJePn+noW
         G6iPgYgn/ywBMgIDBrALUmIJt0jP8/AGqwGOGtueI5uGDN6dqiIvncuMpqmqzRoLtjhg
         1k2l0czUhTCr1lgLMjqW1FoudmhrWCBiUq41KYraEYQdBGTbNFHsp0HYsyL7Xvxnl5Ys
         lfmeldTdGkycmehPSabLa2LttMvaJ5B27pt4h2HCs6AMDiQlZoDxdE64NhUwMSPiDWXH
         WfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684310805; x=1686902805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BX7z9iEFY+/92c5yJf0ySgzT+SQ/nu+E6H540MsaVEg=;
        b=IA7OFqQcqUs6ec7Ak9KBUwE37XQgv9QJi24ByMw8HT4WiV6p/Jfq9l3Mpc7umz2Vu9
         8l0h/rtBerYrCYO0ArzNlhSHCP+t0f5YvHEazw/LqF8k8jR2+MEJaC7IeuJyH4d65jVK
         UzYk3rVxSQsKEbXET6joTW2ognH2Tcot0hn5OW1B06JkazaLS6PVnI1D2To5TgcO8P5D
         Am8hBdE41avcvnXuJEH3MbP7XovXMxQ5J1JDEQEFWEAH4c2hy/zhsCHzDNWCCe0Wx66a
         QKC0RC9pkJdhoQrwhkSzJwZXwyttoJazOYSyvJ85cCn0Be8FH5a1LQaHczpKkLcIGNKo
         NxxA==
X-Gm-Message-State: AC+VfDxvubIop6BAx0lHHmCX2mdx0qHh+Y1cC8ysa6pqfJgMwBD4IcGu
	5sYDp3k1jRSkvpG2lpvTm0cJGA==
X-Google-Smtp-Source: ACHHUZ47P0MBYRROPw//k3iz033FBkusprbbcRl92goEasQjqucvLAc+w+Auz1HdWv8zxkktA7/FxQ==
X-Received: by 2002:adf:f3c3:0:b0:306:3163:2b76 with SMTP id g3-20020adff3c3000000b0030631632b76mr879287wrp.15.1684310805572;
        Wed, 17 May 2023 01:06:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6f0d:9301:2b67:fec])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d6746000000b003090cb7a9e6sm1919593wrw.31.2023.05.17.01.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:06:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH 03/20] python3-attrs: don't use PYTHON_PN
Date: Wed, 17 May 2023 10:06:22 +0200
Message-Id: <20230517080639.9336-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517080639.9336-1-brgl@bgdev.pl>
References: <20230517080639.9336-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181452

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2. Drop PYTHON_PN and use python3 explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta/recipes-devtools/python/python3-attrs_23.1.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-attrs_23.1.0.bb b/meta/recipes-devtools/python/python3-attrs_23.1.0.bb
index 207636d62e..ab3a08073d 100644
--- a/meta/recipes-devtools/python/python3-attrs_23.1.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_23.1.0.bb
@@ -8,13 +8,13 @@ SRC_URI[sha256sum] = "6279836d581513a26f1bf235f9acd333bc9115683f14f7e8fae46c98fc
 inherit pypi python_hatchling
 
 DEPENDS += " \
-    ${PYTHON_PN}-hatch-vcs-native \
-    ${PYTHON_PN}-hatch-fancy-pypi-readme-native \
+    python3-hatch-vcs-native \
+    python3-hatch-fancy-pypi-readme-native \
 "
 
 RDEPENDS:${PN}+= " \
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-crypt \
+    python3-ctypes \
+    python3-crypt \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


