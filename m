Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFF7CCA481
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:01:44 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.31063.1654516899767587833
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Exsal7jW;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 n124-20020a1c2782000000b003972dfca96cso7795300wmn.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CCaqak2WZHkE/N34L4LImQQqH5b8jxTGpK7k0cDPmuA=;
        b=Exsal7jWL9cROW5qXdIT76oJ9541K0WhMwJPYjPVmsH2wJZUySIZeDCqT1cwEPDHAL
         Aaf+vzyLjxjebee5t2Bqk3TIGT+wHBKvquw6WLdA5G3Asw8jXq5RjqcdQyk0wJbxfmfM
         Q+qPmRMtszoUMDqqMZUgtcyPBCuGcUGKBecIpc6F8JlT3uajhmb/r9on7pC94cvSq6rO
         vlVdlLC6NgN2/h7Csd2S8Sub0wZCqaGR+ETxYxNKgMGazOwWOv1557guJHTkZTGqaSQl
         5BEK+KaSQ+NWMSCVDM7UesN4a3ACGUZXH9MX+0nRA+TjG1urgF9Ta1Ej0n3PF6aS8RcJ
         UO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CCaqak2WZHkE/N34L4LImQQqH5b8jxTGpK7k0cDPmuA=;
        b=rLcZr3XYnTBMJx13CnTCjqOO3etUy1wqT9ebhFFBnj3DOBWHJFYJjsI0cR7UfvM8lV
         PsZw9EDyLFouYDESDcLce9m25Ir95Ity4ZLcbkApfiC15b4vOvtdgLqMZPTA1VDArXhv
         RyTs9OkySx8sp8OCR55PC6GDBbTMmBTu2XyAskNTcffwvwYIW/JfrH6h7Fez7qZHAnxW
         uxJXayjmYbV0DDxOKeofIZs1uFj1lnmXPcZjB0XUI2be4X1hDAqabBOPTLgH0UWAvlwC
         BymFiTcFfxw3YwSC0/LNCSbNQwYCaRlANdOlqEnh+uNnK61pSCZDGHgulECgNccvSepS
         8AEQ==
X-Gm-Message-State: AOAM530TLmSw4bejFuHqpup0osY9c4k+yYBPglZQYh3oXXUC+AlxmAzo
	bH2jlcXtSpRdC2MgtPqqEZM2jh8TAWLY4A==
X-Google-Smtp-Source: 
 ABdhPJzThuSZRq1lYaErfxLTdilVLK5sJWICppH8AEwrvbFOKRMqTqltvxLHwd/3y0JR2NVsHhPdnw==
X-Received: by 2002:a05:600c:4ec9:b0:397:750a:798a with SMTP id
 g9-20020a05600c4ec900b00397750a798amr51172043wmq.169.1654516894375;
        Mon, 06 Jun 2022 05:01:34 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002100316b126sm15526455wru.6.2022.06.06.05.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 05:01:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/21] wayland: exclude pre-releases from version check
Date: Mon,  6 Jun 2022 14:01:09 +0200
Message-Id: <20220606120126.3381438-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220606120126.3381438-1-alex@linutronix.de>
References: <20220606120126.3381438-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:01:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166602

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/wayland/wayland_1.20.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/wayland_1.20.0.bb b/meta/recipes-graphics/wayland/wayland_1.20.0.bb
index bd437767b2..dd48a29dc4 100644
--- a/meta/recipes-graphics/wayland/wayland_1.20.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.20.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
 SRC_URI[sha256sum] = "b8a034154c7059772e0fdbd27dbfcda6c732df29cae56a82274f6ec5d7cd8725"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
+UPSTREAM_CHECK_REGEX = "wayland-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
 inherit meson pkgconfig ptest
 
-- 
2.30.2


