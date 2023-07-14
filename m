Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6C2C001DF
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:33:48 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.825.1689374019368591397
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=d0TrvCr5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-55b1238a024so1825463a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689374018; x=1691966018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W99OV+x8px9ybF2H0flbTSA8Fi9qwUEeLs+5W+fhgXM=;
        b=d0TrvCr5RBWQWqW75ijtap+0/dQhDIOef1ePUc8vxA5oRtVS1odkFKFPwv7VrpierR
         +/KYPCa+E6m4Oiie0vSPl8UvQt3qPFH7GtllfsXKDMnnDRWQLPPeIUNhs8d6cfzXWZTQ
         SEJ8yaEiiFk76bnG03lUViOdRzy0QYmgWSp0LmhjB6Ad4vK7VIoNUzUU4fvfQ7RLFPvr
         YGCOmyX6rzOP+wkDdgFa7XXkgsuYXtIOqzSDVjRflhnVif8R6oo7W9Dpa4i5fE0SPahe
         EI4dSLPJB7cKv1umRMi2HDVHUwkJ6wtqxhlRAtq19kQSIzgWw2mHvnkmzxVl0JnS+z4O
         hkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689374018; x=1691966018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W99OV+x8px9ybF2H0flbTSA8Fi9qwUEeLs+5W+fhgXM=;
        b=fF9tD1ewUpl9mzuQJElWrzuGGdCha0ksmactEFNA7UjrlQHQ0yjT+e3JsccaaXNnXK
         sP9YQWm0hW4itk358fawb3OZJoZFT/4veq78wqz+cuRj2J3mpJ9BdoX94NeNSWqWDnFt
         bwWmMXaHA7B4ZBNGKJVrtDBdTI7v+cKmmvHfcmagLXfbKthrEF8GHC13a8lzYP2pOGnu
         Nyf2i/uppX0dEaGrZSKO74XlFv0ivQA2FeqahVAeT3fI/NHtb9K7IcwD9JvOdh9FNGtw
         AcbQhlSl/JzDHqzoZsSCQ93IYxWGOoe+p14zloqG76kkf8OxSskwV4ngk2f4+zF9gNBj
         7LvQ==
X-Gm-Message-State: ABy/qLazBUK/HZQtsFj9/XJQxwc0CgB6DBBbH0tlbUf4L1LFlplBuaBS
	5DxJuvSJ9Jr/jMRnbjjafXu1ShjAi6r/SyQ30lk=
X-Google-Smtp-Source: APBJJlFcptxUfgOHzpILfgeluQ91J4SOXZuFSvxcGVQsEeZy5sZVUaLod89YwVP5jU+bivCRzhnsRw==
X-Received: by 2002:a17:903:22c4:b0:1b8:88c5:2d2f with SMTP id y4-20020a17090322c400b001b888c52d2fmr6049494plg.64.1689374018344;
        Fri, 14 Jul 2023 15:33:38 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 13/26] weston: Cleanup and fix x11 and xwayland dependencies
Date: Fri, 14 Jul 2023 12:32:47 -1000
Message-Id: <d8d60e0a0e838c332f044ecee89b8ad2acae9567.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184295

From: Tom Hochstein <tom.hochstein@nxp.com>

For the x11 backend package config, drop the redundant dependencies
libxcb and cairo. The former is listed twice in the package config,
while the latter is also listed globally.

For the xwayland package config, add the missing dependencies libxcb
and libxcursor. These dependencies are hidden when the x11 backend is
enabled by default. When the default setting is overridden to disable
the x11 backend, the following error occurs:
```
| Run-time dependency xcursor found: NO (tried pkgconfig and cmake)
|
| ../git/xwayland/meson.build:34:2: ERROR: Problem encountered: xwayland requires xcursor which was not found. Or, you can use '-Dxwayland=false'.
```

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 49f4dd391b408a850d13010c90492c621b7912c3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/wayland/weston_11.0.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_11.0.1.bb b/meta/recipes-graphics/wayland/weston_11.0.1.bb
index 4f6ce19915..0838791a6b 100644
--- a/meta/recipes-graphics/wayland/weston_11.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_11.0.1.bb
@@ -57,7 +57,7 @@ PACKAGECONFIG[kms] = "-Dbackend-drm=true,-Dbackend-drm=false,drm udev virtual/eg
 # Weston on Wayland (nested Weston)
 PACKAGECONFIG[wayland] = "-Dbackend-wayland=true,-Dbackend-wayland=false,virtual/egl virtual/libgles2"
 # Weston on X11
-PACKAGECONFIG[x11] = "-Dbackend-x11=true,-Dbackend-x11=false,virtual/libx11 libxcb libxcb libxcursor cairo"
+PACKAGECONFIG[x11] = "-Dbackend-x11=true,-Dbackend-x11=false,virtual/libx11 libxcb libxcursor"
 # Headless Weston
 PACKAGECONFIG[headless] = "-Dbackend-headless=true,-Dbackend-headless=false"
 # Weston on RDP
@@ -73,7 +73,7 @@ PACKAGECONFIG[webp] = "-Dimage-webp=true,-Dimage-webp=false,libwebp"
 # Weston with systemd-login support
 PACKAGECONFIG[systemd] = "-Dsystemd=true -Dlauncher-logind=true,-Dsystemd=false -Dlauncher-logind=false,systemd dbus"
 # Weston with Xwayland support (requires X11 and Wayland)
-PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,xwayland"
+PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,libxcb libxcursor xwayland"
 # colord CMS support
 PACKAGECONFIG[colord] = "-Ddeprecated-color-management-colord=true,-Ddeprecated-color-management-colord=false,colord"
 # Clients support
-- 
2.34.1


