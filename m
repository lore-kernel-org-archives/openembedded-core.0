Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.12748.1596464856983535308
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2020 07:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hmV0HjHf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d1so20731643plr.8
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2020 07:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=v1Nzs7aHfZLpDhPLHx5Hs0TF/2qzn0CW8wX2AzbBGOg=;
        b=hmV0HjHfjoZDrEFcz5i8ZrE2W+Z9fgkRtF3bIQPLTAWvBQSXzo4gIrUm3neYrEFItQ
         nRfeOJymFfx3kJWhXMzeSbQMGaoM1zKo9iYdKxZk3dwQD9tWe0uZE+yPdYPliQd5ZRqe
         BQJCzcrshwlAKyXaT8xhqTILDAkE8zePclPrkoBbWeUEucR7AES4Og8E/KmJqZ0Tbpuz
         OguWXlwT0pIhSepIYxuoAQcVNBjlz3iGUKXjq8SzlqdjN0RFLc2PgCPJ0VZpv9F9p+gL
         BQMTfUe2hfgVM7viSWuNzf/IIFypKQ7sjFnJxZXsXbgDIUiKoGG2A6+0lkTdK6Er4o7F
         PBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=v1Nzs7aHfZLpDhPLHx5Hs0TF/2qzn0CW8wX2AzbBGOg=;
        b=q4SRxvx8SXOb6Tggk4ORSDAvcMcFIJ6Kyv77zjn12I6XQdsERcJ/MusBT+S90swb2m
         U5kUmsspi0hbl+cRHp5crEbGzPHjwkBGWBIjmyIw0zHz29LFWxC1j0y9+YVbl4ip4vZa
         D0gypcsXf2ECsXv2f6uzakpakNsGcWFvZItot5Nq0lSTUqhLYj2NLx88PMxtfuQ2uWBw
         eG9JdMHLorUQlhpAHQmGeVXvZVITfNQrEeFhV44q4mubyFEsAsysHhkdF1MKwSUG2aJo
         GUj1OtNS0apNOM5REdxXUo2Pu0pmt3MFEGGTXeaq/FJhVFxu524MssQJDLpxA5lo4fPe
         CByA==
X-Gm-Message-State: AOAM530nk+zs/h4OtRBgkPdjLmGgUWATN+/2qwHu9F1XHJL8Am7Zywfe
	9nYaTitlS05VZ6yuKbD4Ir4qheR+zxE=
X-Google-Smtp-Source: ABdhPJyYwNZVgQLkvC8DIOiHY0xJVge3w68+K2aPU5JFC8W07Qu/JX+NyjZpEwR/WyUbI2OSvafN7w==
X-Received: by 2002:a17:902:246:: with SMTP id 64mr14927057plc.70.1596464856029;
        Mon, 03 Aug 2020 07:27:36 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r15sm10913729pfq.189.2020.08.03.07.27.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 07:27:35 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/12] cogl-1.0: correct X11 dependencies
Date: Mon,  3 Aug 2020 04:26:59 -1000
Message-Id: <c2b1db31790fc01d3cb8fd00f42d1a8b7434d35a.1596464561.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596464561.git.steve@sakoman.com>
References: <cover.1596464561.git.steve@sakoman.com>

From: Matt Madison <matt@madison.systems>

cogl depends on libxdamage when configured for X11 support.
A dependency was added for this in 2012 with
959a2f6d88d8fa6874fff83b7a1f0e7d4e36b887, but that addition
was lost when the recipe was reworked in 2013 with
b508fdd2b19ca30da8d09caf646897dc4cf195c8. That commit also
added a dependency on libxi, which is not actually needed.

The missing dependency doesn't cause problems in most cases,
since mesa also depends on libxdamage, but when an alternative
opengl implementation such as libglvnd is used, cogl fails
to configure.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7651a63c508562caf1a3732cb49af50bccc98e8b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 1c5d0b79cb..d581ad1c04 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -21,7 +21,7 @@ EDEPENDS_GL = "virtual/libgl libdrm"
 EDEPENDS_GLES2 = "virtual/libgles2"
 EDEPENDS_KMS = "libdrm virtual/egl"
 EDEPENDS_EGL = "virtual/egl"
-EDEPENDS_X11 = "virtual/libx11 libxcomposite libxfixes libxi libxrandr"
+EDEPENDS_X11 = "virtual/libx11 libxcomposite libxdamage libxfixes libxrandr"
 EDEPENDS_WAYLAND = "virtual/egl virtual/libgles2 wayland"
 
 # Extra RDEPENDS for PACKAGECONFIG
-- 
2.17.1

