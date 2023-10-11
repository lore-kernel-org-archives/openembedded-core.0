Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3234CCD98D9
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 00:02:17 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.5189.1696982531017314847
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 17:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1WrvzVVU;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.180, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3af5fd13004so4567266b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 17:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696982530; x=1697587330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKhH69PDxcgIdiAq6nEDbobkvMnSlGtq+adE+CZgsq0=;
        b=1WrvzVVUeCKkfeMATci3CtdbSPe07v2lcit8s8q/P84qY7BoO7CPFsFEM1J1kQOHQR
         Kvtsc2PVQSyjfzG9tlb+GS5CY/lWbdZhiBqqruMGiRUyMzr27IdPy6zhvLnEDWczlUTm
         AYeVPmmc5f4IIqnh/A9BKSSL7V0e3QrYTUbqvowKNbBNlGa/XtqRR0cCzIMpcLebJ2PU
         0oo9KWIdCrobDVde/DT2/t7AtzVcJsZguIFty5qqY5YX7YsS2OFb2/N1pR676J3qYvAR
         2Yr1T1QqrC7YpG/Qj+kuMdHW9fWOpGS7e4kejUQMWZoRY0jPcsA8K7H3/fpwgYNUnbMf
         0QiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696982530; x=1697587330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKhH69PDxcgIdiAq6nEDbobkvMnSlGtq+adE+CZgsq0=;
        b=CtRadt6lb5IJvVL6LWTiTqlSdc+mgMaX+ftjuF0MAZgID8zDJziz6HaiMgPMgpequg
         3RNrS5xPf2iOJVVZBx/A134fnAXvIUQqi4I1LuQtkappdzJT1RpoDbP9MRsBbmyREeXM
         7crN3340XqPRyvmlkfLlZSztAluv+FfHlygixUci7/yf8CSpn0nGDaa2K2mZr860NAQU
         Z9jA6iwgHm49e0HcXJcvqbdKQYhig0cwLqRq6QRew48v9w4Sb6W3SrM0jhL+Q1v21b/p
         O6sJu5UltTKMt13diZO3CNvG0khVLNMLmi3V61RfMQF9XJxR9m1nxU8Rmdp6rOodBVRJ
         AFcg==
X-Gm-Message-State: AOJu0YxqiNS80O14m1m5Qx9vZNLQEjsXvXGvVUWkkJ+KwSS+w0KcP10+
	5CzUigH5SjNOerT1ifdiczXw43v2rV5ZvmVtN9g=
X-Google-Smtp-Source: AGHT+IFnFuV1+dOZfKZi9mm8GYeaBlNQE1K/ow+EJ9OnDVlEjMI+gZlIZSvymt28k+J3Ld2Y6Vm9YA==
X-Received: by 2002:a05:6808:1306:b0:3ae:1e08:4209 with SMTP id y6-20020a056808130600b003ae1e084209mr27667318oiv.39.1696982529678;
        Tue, 10 Oct 2023 17:02:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a9-20020a63bd09000000b005891f3af36asm10758222pgf.87.2023.10.10.17.02.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 17:02:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 13/20] wayland-utils: add libdrm PACKAGECONFIG
Date: Tue, 10 Oct 2023 14:01:26 -1000
Message-Id: <0ba10930f73e4b0c2896afd326229fc6ae460f51.1696982312.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696982312.git.steve@sakoman.com>
References: <cover.1696982312.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188931

From: Ross Burton <ross.burton@arm.com>

wayland-utils has optional libdrm support, so add a PACKAGECONFIG and
enable it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c6c488c259d1f38a05a71e576ca2f32d412413f1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/wayland/wayland-utils_1.1.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.1.0.bb b/meta/recipes-graphics/wayland/wayland-utils_1.1.0.bb
index dcee87e2cd..48e1409be8 100644
--- a/meta/recipes-graphics/wayland/wayland-utils_1.1.0.bb
+++ b/meta/recipes-graphics/wayland/wayland-utils_1.1.0.bb
@@ -19,3 +19,6 @@ UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 inherit meson pkgconfig
 
 DEPENDS += "wayland wayland-native wayland-protocols"
+
+PACKAGECONFIG ??= "drm"
+PACKAGECONFIG[drm] = "-Ddrm=enabled,-Ddrm=disabled,libdrm"
-- 
2.34.1


