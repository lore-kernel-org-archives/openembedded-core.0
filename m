Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web09.5309.1605279204509385509
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:53:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0uLHyHme;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id j19so451050pgg.5
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rlSor22mhOoXjkvMF09B9Fp1iBq71hhokFPTQHkg0WQ=;
        b=0uLHyHmexGG26R6Csv0XVrebk94sTuOzVZPUL2V2mRV9PgHakbCtFR1LHYPiP9krE9
         Ear361AsvsH858aGmLkMAyZwegf+cnnthT6IrOmrembKm2C/lAclNlOaHA44uAZ26WEz
         qFsISpktqz3zlmbemAqgYHSD+iYy00xXF7/cKBYlr6i1tkY/w9sciN3Yqlm5lUA4VFYF
         yo7JeoGHxe0aPrFJyZep6gLBMXubPeY6bhCNqo+yLswon48NiHGRu0JW+2wGEJvaJWJs
         Nwe9wCP8mF4G1E2ZgbuhyEx9s6NrCjkwQNfknMW1PM0CqWwJP+gBt94ILxRtupEN4FmD
         PNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rlSor22mhOoXjkvMF09B9Fp1iBq71hhokFPTQHkg0WQ=;
        b=O+WnO0wvNzXbZdQAP4DZveSDTGr4BwXD6inyCdBtI8hGIptUOzzdxe9jKxnrVpTR3n
         Yk2EMMySfB0oBiZLgbSQgEQr36EeDNqGlYcmcBc6FMRbZ8D2a/GStMFEEGH/h2SnYCYD
         Le6VbYOHzEw72IUQ5Q8QddP5lrJ7+48ainc/+q5gRChckhD5AHoyaBn0xCkRMwxxEWv7
         jIlIWhkIr3YfEOT+VCwTwlI8KD7HTeMpnP+kfD7QKe5Cnd2UuJrkUpPki5bvMFPmzWl8
         cT4Z45aGSqDTjtuhN3XVTWy8Rhqg0luf59a+yRNBXCtFZmrepzRsOtfv9HRj+N3Xf1it
         eg6g==
X-Gm-Message-State: AOAM5311jiAVHP/y9YEmh4t8iIcqKYPP87ovinOUY24tunvitAPf0Lk9
	rJ75kj3byLw1pjnLToSc+RG0YWrKgSwRjh+C
X-Google-Smtp-Source: ABdhPJzIthuKTKCq8n4NyKBvfzo6NhBQqj6NnP8PfL7quV/p98KGJDxftzGl5DR0qx8+GGEqfsbGqw==
X-Received: by 2002:a17:90a:c7c4:: with SMTP id gf4mr3537475pjb.18.1605279203634;
        Fri, 13 Nov 2020 06:53:23 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r134sm10370694pfc.145.2020.11.13.06.53.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:53:23 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/18] freetype: fix CVE-2020-15999, backport from 2.10.4
Date: Fri, 13 Nov 2020 04:52:22 -1000
Message-Id: <6532e49f17e6aff73ea5a732a49dbb9b2e1a3bd3.1605278902.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605278902.git.steve@sakoman.com>
References: <cover.1605278902.git.steve@sakoman.com>

From: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>

Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-sfnt-Fix-heap-buffer-overflow-59308.patch | 51 +++++++++++++++++++
 .../freetype/freetype_2.10.1.bb               |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch

diff --git a/meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch b/meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch
new file mode 100644
index 0000000000..fa8a29b798
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch
@@ -0,0 +1,51 @@
+From a3bab162b2ae616074c8877a04556932998aeacd Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Mon, 19 Oct 2020 23:45:28 +0200
+Subject: [PATCH] [sfnt] Fix heap buffer overflow (#59308).
+
+This is CVE-2020-15999.
+
+* src/sfnt/pngshim.c (Load_SBit_Png): Test bitmap size earlier.
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/?id=a3bab162b2ae616074c8877a04556932998aeacd]
+
+Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
+---
+ src/sfnt/pngshim.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/sfnt/pngshim.c b/src/sfnt/pngshim.c
+index 2e64e5846..f55016122 100644
+--- a/src/sfnt/pngshim.c
++++ b/src/sfnt/pngshim.c
+@@ -332,6 +332,13 @@
+ 
+     if ( populate_map_and_metrics )
+     {
++      /* reject too large bitmaps similarly to the rasterizer */
++      if ( imgHeight > 0x7FFF || imgWidth > 0x7FFF )
++      {
++        error = FT_THROW( Array_Too_Large );
++        goto DestroyExit;
++      }
++
+       metrics->width  = (FT_UShort)imgWidth;
+       metrics->height = (FT_UShort)imgHeight;
+ 
+@@ -340,13 +347,6 @@
+       map->pixel_mode = FT_PIXEL_MODE_BGRA;
+       map->pitch      = (int)( map->width * 4 );
+       map->num_grays  = 256;
+-
+-      /* reject too large bitmaps similarly to the rasterizer */
+-      if ( map->rows > 0x7FFF || map->width > 0x7FFF )
+-      {
+-        error = FT_THROW( Array_Too_Large );
+-        goto DestroyExit;
+-      }
+     }
+ 
+     /* convert palette/gray image to rgb */
+-- 
+2.18.4
+
diff --git a/meta/recipes-graphics/freetype/freetype_2.10.1.bb b/meta/recipes-graphics/freetype/freetype_2.10.1.bb
index d1c093054b..2d444bbf19 100644
--- a/meta/recipes-graphics/freetype/freetype_2.10.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.10.1.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
            file://use-right-libtool.patch \
+           file://0001-sfnt-Fix-heap-buffer-overflow-59308.patch \
           "
 SRC_URI[md5sum] = "bd42e75127f8431923679480efb5ba8f"
 SRC_URI[sha256sum] = "16dbfa488a21fe827dc27eaf708f42f7aa3bb997d745d31a19781628c36ba26f"
-- 
2.17.1

