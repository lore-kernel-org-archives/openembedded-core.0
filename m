Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.8878.1596639015594192880
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 07:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=itHQ5WX6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id ep8so4418156pjb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 07:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=v1Nzs7aHfZLpDhPLHx5Hs0TF/2qzn0CW8wX2AzbBGOg=;
        b=itHQ5WX6npg54Vzm9kxcSOW9oPKWLihyyfgxUG0g6Vht/TMz4CpuEW8sqBSIgvst5L
         rjcVDfn8tF2RhIZiZscgSSYgOMKdY9RPSC2SOPBZgyd/m6V/YZnpP+C7uyEIe21iCJsF
         JmsW3C6n/oGOOFj08MeGCb8MKUdFc2MCyBCRIm8MMcKlsapJ9PRmteY/ufG6JsRFkZ9/
         df86OFZdAEfRa8jHvwHpB/SmidHt9re/3gBma5S6H8ri0aI8R+lW2AzV0f/4IduY4/5i
         m9k3gvjHKOR2V9LE7E9x2s/RuELO16YAuH5LE/Gy6iMZ38VuLeHBHs0pW6KgsHaeciBu
         6q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=v1Nzs7aHfZLpDhPLHx5Hs0TF/2qzn0CW8wX2AzbBGOg=;
        b=k9dkGeFVxjS9xrErNjGIy6WKqefJcxd29odQj6RvYW1t8zKqDnxYH734XQMIhkXe45
         KRyepvI0wdqBfuAMI+VjwogL1Ff5H5AX1Vbo92SR8+sqF7zuqtfpnSIF+LtBjkO0qOxf
         wiLVAzlOZ2MA5x8tB+GHrYBYDyEQf7rhDdH/xpGS8K9YKTsY01SG3Y8xXZ3VgacgXhjH
         wk7O33YYEudesCDpbQD6bCkBaIzJvNzqVQEg028MiXUpdJqvnAnc4CrmYun4zI1Nkaub
         ClsRTfMLhYOIobafX937q05LzXlJzS4HwNcdW3GSUF5bTQ9bDCEp6TiIsRGXLn0uldTr
         olMw==
X-Gm-Message-State: AOAM531U83eszOfVvEUwY4Kue3Yl0pBtuSRvy0OGfSkbce9ord4MlsvF
	0mrMaNkq7k9Nem6Pe9NgLt+fvBnZGJQ=
X-Google-Smtp-Source: ABdhPJy0MyLod5CWV/cHawuGqyvcqhsLc74Cvh9HjP8w3kYQOdBhP+yeFtmpH65BlwszlN0wb1/7qQ==
X-Received: by 2002:a17:90a:aa8f:: with SMTP id l15mr3643754pjq.123.1596639014611;
        Wed, 05 Aug 2020 07:50:14 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d81sm3879721pfd.174.2020.08.05.07.50.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 07:50:14 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 05/11] cogl-1.0: correct X11 dependencies
Date: Wed,  5 Aug 2020 04:49:28 -1000
Message-Id: <4cbfaae7f6ecdcbb67675da6cbdcf63aed0aaf61.1596638643.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596638643.git.steve@sakoman.com>
References: <cover.1596638643.git.steve@sakoman.com>

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

