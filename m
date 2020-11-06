Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.12321.1604673415235686277
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 06:36:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=godclUYw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id h6so1086256pgk.4
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 06:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=S1TiswO+mDPty4WafFxyyxN4QGkfSR8She9Z4IDtPdk=;
        b=godclUYwd7tckYXFoiUTZEO1loxphWusinqFQuWDUaV4RshFtb+chdIr+1NJYDK3jV
         moICX5f55WW5CQN3zbYUHp4f+somPb3yevtjed+hM9w8fyAPaqKhUf0l4gchpv9UCch9
         TtB5E2eTBh/XudZDwALk/sCDXB5kgcE8bxhjtWydz5aDdqIwDY2Is61akdYkNfFYsXJO
         vMIn+qWEUTVSd+H+Uw6OwEIGxdbalC/xqyT+78VU+pbHbMpNrKsmJ8jJ5TkiMT6pj+CS
         YlJgJ5zZKptfiMX4sSyIXwFSUndssdogWiuytUk+GW//6jqFmo25HJAy+BB4v8Kq4Mnn
         7fxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=S1TiswO+mDPty4WafFxyyxN4QGkfSR8She9Z4IDtPdk=;
        b=Xel6Fh7qHrh5uGGt2Y7W3HEplJ2fJmzcNk1FKUO2yCFhVxI/NiYc6SNxisuIQMCXCn
         sJqheZCnrZhRnZAzelzh8LciH4LZL0FAZlWQ8UOnrfRcCiP9PZztHFlLnj862jIh/cDz
         770k3/+8WgEC6I9jVewkfxWDpYYI4Q/1eAUIqa6J8XXbhX0dAvfRAh2+j01vgt3+150X
         DR0Z5gwc2voiTsA+/WY/BtkeZRCBpp4Vt8QqazqIqeijA27P9kDj9RLnHDMCK2d6THKa
         JikWlltCRaHrNLN7F7xAVB3OUSAnxJYZuDoBQSHo454Gzbfqe39DXI28NVS99NqLFiqB
         VcbA==
X-Gm-Message-State: AOAM530AyvcKdJq9i+E8xikqdM8ypWwJ0P/tD/wxZesLKYRRlvav/3pA
	E65JX/yxX2IdEcG1fp4q78yfTmf9X+5kHZi5
X-Google-Smtp-Source: ABdhPJxLcwIzEUzQJhefD7tsaLUoaBwe4K3FT3+WcG9plKiLkrRMG/T5RcEh0RrDNxy0ShU+sFn9oQ==
X-Received: by 2002:a17:90a:73c9:: with SMTP id n9mr2885408pjk.90.1604673414315;
        Fri, 06 Nov 2020 06:36:54 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jy19sm2765166pjb.9.2020.11.06.06.36.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:36:53 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/20] libsdl2: Fix directfb SDL_RenderFillRect
Date: Fri,  6 Nov 2020 04:35:28 -1000
Message-Id: <e0201460f7888d220555e84ce2981ff5578114d4.1604672839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604672838.git.steve@sakoman.com>
References: <cover.1604672838.git.steve@sakoman.com>

From: Mark Jonas <toertel@gmail.com>

Refactoring of SDL2 internal API has broken SDL_RenderFillRect for
DirectFB. The problem has already been fixed upstream.

Signed-off-by: Mark Jonas <toertel@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a7c8dfc1f9beebeb9da7f61b323d85fba82ec1cb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsdl2/directfb-renderfillrect-fix.patch | 33 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.12.bb                 |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch b/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch
new file mode 100644
index 0000000000..83d4f4b1ec
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/directfb-renderfillrect-fix.patch
@@ -0,0 +1,33 @@
+# HG changeset patch
+# User Sam Lantinga <slouken@libsdl.org>
+# Date 1590793369 25200
+# Node ID a90089f75990e8b07a1dcf931c5f8a580ae343bf
+# Parent  a9b4bd264f3cbedc4f3287b3ec6b32311370ba85
+Fixed bug 5146 - SDL_RenderFillRect doesn't work in DirectFB
+
+Lacky
+
+It looks like refactoring of SDL2 internal API has broken SDL_RenderFillRect for DirectFB. In new version function SDL_RenderFillRect returns 0, but rectangle is not visible.
+
+Replacing "count" with "len" in the argument list for SDL_memcpy in DirectFB_QueueFillRects fixes problem.
+
+--
+
+The patch was imported from the libsdl Mercurial repository
+(https://hg.libsdl.org/SDL) as of changeset id a90089f75990.
+
+Upstream-Status: Backport
+
+Signed-off-by: Mark Jonas <toertel@gmail.com>
+
+diff -r a9b4bd264f3c -r a90089f75990 src/video/directfb/SDL_DirectFB_render.c
+--- a/src/video/directfb/SDL_DirectFB_render.c	Thu May 21 00:06:09 2020 -0400
++++ b/src/video/directfb/SDL_DirectFB_render.c	Fri May 29 16:02:49 2020 -0700
+@@ -626,7 +626,7 @@
+     }
+
+     cmd->data.draw.count = count;
+-    SDL_memcpy(verts, rects, count);
++    SDL_memcpy(verts, rects, len);
+     return 0;
+ }
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
index 6285477921..1049aa548a 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -19,6 +19,7 @@ PROVIDES = "virtual/libsdl2"
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
            file://directfb-spurious-curly-brace-missing-e.patch \
+           file://directfb-renderfillrect-fix.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.17.1

