Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0408DC4321E
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:20 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.3077.1639000804899193356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J3x7iWP/;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id v11so6455771wrw.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=55aT3M0XyQTtg0Byfikth2//lLP01aQvC/uGyejqf8k=;
        b=J3x7iWP/shm2C9LcJ5Xc6WLQhzo/Um5bnmtcSRpvBexAuSOOQ7sXScBaaeAdLAVcF/
         3YuJaZ82NFK00LgCGbCsQe0MGYJwYAFjuzb8sFxcf9ShYXmsntnjaxL13CuQCZXEELxC
         bmQHIEcw8eqXUni1hM1AId5YQ7X4yOHF7qxrGZdR8c8u0e6EgLMi6gL0LdP51kxhiq1a
         /EP4AlOsAksNigxyfqPDbBNq4fVoi1nyOdWAZT8lHA45XGV21S7eEjzPsYFbcUesBLTX
         6v2VUJ5dyFHGbtXuIrwyiBSS3J1nGtVHJRVPl+zVSsR5URtZo7DGnwrcTrQ6/hz0N6AW
         we+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=55aT3M0XyQTtg0Byfikth2//lLP01aQvC/uGyejqf8k=;
        b=sj3Q2YaoQjwhsaxpSV4vZY0IY41dTwOHgboE3tfx9BuQL5lc4BF9GUyvNMgktNbGcs
         iRXhh8TcVaW6SAv2alTB7qy8yv6n1MsrKFt0Z7AwNG1eUh4a4b/5B0/c8UiMpbBunI5k
         XA2l22TB2JVMtXavWlKYV5ZmAblTTlWawPOKK1et+ooGElVLMRPYmER0ik8cbSh/Vxh0
         spwMXHIXow4vV9dPCZeAaStiV6OnAOmnMjCs/58ft0VrSKh0S9Rz5jGXInj070/MatFu
         l1nj5ZQlFPj9bVinepw0tSWRNO3A5jzquQ92e0Qo+CuTMIdcd80ZC86AVmovp6G8fnCs
         JquA==
X-Gm-Message-State: AOAM530NZQcaEn421tMbrH5dmiM3nODV1XaQgKaR4IZjxYi+aAPoDb9R
	YzZwN0ukeHC/lRIrXAC7yivv7vfD0zXBpA==
X-Google-Smtp-Source: 
 ABdhPJzLUFUXaJ8G58pjVjxh1DwsHEgh2k2Len2jy2K59FSCpr/5/CXFGv7P8+V+MTnQn3ig2z0MAw==
X-Received: by 2002:adf:c992:: with SMTP id f18mr1558195wrh.574.1639000803515;
        Wed, 08 Dec 2021 14:00:03 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/29] meson: upgrade 0.60.1 -> 0.60.2
Date: Wed,  8 Dec 2021 22:59:28 +0100
Message-Id: <20211208215947.1979470-10-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159376

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc                           | 2 +-
 .../recipes-devtools/meson/{meson_0.60.1.bb => meson_0.60.2.bb} | 0
 .../{nativesdk-meson_0.60.1.bb => nativesdk-meson_0.60.2.bb}    | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_0.60.1.bb => meson_0.60.2.bb} (100%)
 rename meta/recipes-devtools/meson/{nativesdk-meson_0.60.1.bb => nativesdk-meson_0.60.2.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index f383ad9f74..7fbb246b87 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0002-Support-building-allarch-recipes-again.patch \
            file://0001-is_debianlike-always-return-False.patch \
            "
-SRC_URI[sha256sum] = "5add789c953d984b500858b2851ee3d7add0460cf1a6f852f0a721af17384e13"
+SRC_URI[sha256sum] = "64e6968565bf1b8152f4f9d6ca8154efb9e14caa9aabf7b22e71e6c5d053e921"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/meson/meson_0.60.1.bb b/meta/recipes-devtools/meson/meson_0.60.2.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.60.1.bb
rename to meta/recipes-devtools/meson/meson_0.60.2.bb
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.60.1.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.60.2.bb
similarity index 100%
rename from meta/recipes-devtools/meson/nativesdk-meson_0.60.1.bb
rename to meta/recipes-devtools/meson/nativesdk-meson_0.60.2.bb
-- 
2.20.1


