Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968D5C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 12:05:28 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.10898.1714737924883639354
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 05:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PeVt3Xrp;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a5872b74c44so1167391266b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 05:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714737923; x=1715342723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfm0lqMUYc98Fa5jJMY/vi/pT6CuWdVsn1agFXxA8po=;
        b=PeVt3Xrpv+e/ox+eE1qv7qiFLt6p9JWL+5aDc8L8C/WXnPgZjQBJS6TTaL99IAvLYM
         GvWkZxh2s9KORazv53WoPmxBvuR9SAD8TFyoxee/YDKkdV6MV2Ib2Sp2kZ4uuWTtSIMS
         h3GbMf9OjMEUvaBjSso3WdfvOQT/y6rYV3Uhz8yf2CMG0FLm2FeB79oGTO2HJtAYvFbI
         9l7c4CyCOplCTBJ9fKY062pO1iwBre8sd7LBihX4gg/J9WOY3Wg3J+nqpz1nsB2pCyjf
         ZOFzxa1p0SqBcxtmQ4xqlhrGoMmf+9HaZJ/PlmAdjgnN70uusqvEpSU8y87qBfP7dCH/
         Jxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714737923; x=1715342723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfm0lqMUYc98Fa5jJMY/vi/pT6CuWdVsn1agFXxA8po=;
        b=w76UiI7I8fR+2jF7PpsDB6P+jRvqK9fJUf+gA3vymS+UE4XwD8kBvBL9ABW69/zzpI
         ROxGARu19q3QTWjnIMVBvvSWqUlwvXBNIFN9ThFznNK/tyDW1Mr3fsAvfboCHewrH/MD
         aiZ+U4NWjE2aCh1rHk7DU4UwjWrMhrhkh18cEHpcsoYeG1Hhe8hMIMQgCwPij+EQ+bqy
         onC3iAeg96fN4HRyJpDHlw6U7IfuNKUmpKAvjYzq7fXink3blLGEa7uzLpNQaM8HIP76
         z9PnpKDnLJcrWaSRPPWjrv02VCV/iL2ZrIX47hENfs9RA1yY5ZnytYfOLuyxSmy56Xf0
         cowA==
X-Gm-Message-State: AOJu0Yyg6SRVOczhLXr89I+DOCs0ZsHpUjpJdjSZwP3ofYWPJGgKoTBG
	Yx6zuwTzyXxBWjkT9JMvnw+Bqh8V76BdfZcE63yrlQ8YSrsDNAbdwXpvdQ==
X-Google-Smtp-Source: AGHT+IEWolZ3f92KWy7KD/871szAPPdQuuXq5c4luVo4tH/QE25ZOxDVJXUpn2antytHfhqpEqdomQ==
X-Received: by 2002:a17:906:2dd2:b0:a52:10c8:c4e2 with SMTP id h18-20020a1709062dd200b00a5210c8c4e2mr1449340eji.66.1714737922984;
        Fri, 03 May 2024 05:05:22 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id mc20-20020a170906eb5400b00a599a85777dsm306362ejb.153.2024.05.03.05.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 05:05:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] wayland: fix upstream version check
Date: Fri,  3 May 2024 14:05:15 +0200
Message-Id: <20240503120515.1428284-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503120515.1428284-1-alex.kanavin@gmail.com>
References: <20240503120515.1428284-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 12:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198982

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/wayland/wayland-protocols_1.35.bb | 1 +
 meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb    | 1 +
 meta/recipes-graphics/wayland/wayland_1.22.0.bb         | 2 +-
 meta/recipes-graphics/wayland/weston_13.0.0.bb          | 2 +-
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.35.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.35.bb
index 7e70de346cc..69378c02566 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.35.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.35.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/$
 SRC_URI[sha256sum] = "37a2716a28133dc819341c568a29d21e8cb72130e5c126a1fcfc9f42c23d95ab"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
+UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
 
 inherit meson pkgconfig allarch
 
diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
index 878c7a267e6..59d414a0a67 100644
--- a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
+++ b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/${PV}
 SRC_URI[sha256sum] = "d9278c22554586881802540751bcc42569262bf80cd9ac9b0fd12ff4bd09a9e4"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/tags"
+UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
 
 inherit meson pkgconfig
 
diff --git a/meta/recipes-graphics/wayland/wayland_1.22.0.bb b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
index 6aa76063ea2..e7babc9ec64 100644
--- a/meta/recipes-graphics/wayland/wayland_1.22.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downl
 SRC_URI[sha256sum] = "1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936ebb7e7cbc2425842"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/tags"
-UPSTREAM_CHECK_REGEX = "wayland-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
+UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
 inherit meson pkgconfig ptest
 
diff --git a/meta/recipes-graphics/wayland/weston_13.0.0.bb b/meta/recipes-graphics/wayland/weston_13.0.0.bb
index 798cf6f19ce..cb0024c5ca3 100644
--- a/meta/recipes-graphics/wayland/weston_13.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_13.0.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
 SRC_URI[sha256sum] = "52ff1d4aa2394a2e416c85a338b627ce97fa71d43eb762fd4aaf145d36fc795a"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/weston/-/tags"
-UPSTREAM_CHECK_REGEX = "weston-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
+UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
 inherit meson pkgconfig useradd
 
-- 
2.39.2


