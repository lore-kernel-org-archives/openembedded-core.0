Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92117C25B41
	for <webhook@archiver.kernel.org>; Sat, 21 Oct 2023 15:28:57 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.81325.1697902129431833555
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Oct 2023 08:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MiIIBMhk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6934202b8bdso1748718b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 08:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697902128; x=1698506928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SD98nbqs9q/5kQUtDooTuCU4oOGPbUX3OgUnavbryS0=;
        b=MiIIBMhklvHIr39H/qi7p/5bzE+xRPVVA7EnIxtvEykMzhcFrWHjfkTLpWuvt0I/cK
         HFWBGwPOM2KltVQMoIflcqf/SA9P2uk9C6kul8qFmcYsV+r+B9dQ1PgwmPvxGhKIa8Mj
         6/MV1iJpr2UReuLNDBJoNXTIimnOehZTMZSLH5fVlJYYBl99RnpXsffqEE1qISrhtsa2
         RPa3RUicKxeFOY2iqVtFJ6erayuRqZMMRF7mj7rv2qV6qyftmKThGVpwb7STUj31atBn
         OsRZRGXnzjXf4PXDdz7mHNwnw09TmtsTNUfHlNps9GTRDyJowZkF+HJru1yMbKbKpWcR
         W2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697902128; x=1698506928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SD98nbqs9q/5kQUtDooTuCU4oOGPbUX3OgUnavbryS0=;
        b=PfL1nnHHlfOrYOaYUtuHQZHQjkmzQhhjLtSc1Ky07QzhLpgagEroWonkbajbTOTHAf
         y7L9I53HsKRAnsi+d/uNvo6wQsP7XK24IyE6ZW+MMSZj02O1pNIrgPDTH2Jaa0amVTA5
         GcYWMf/HBAVCBjRnhm80+Bwa1H1pLF4qSq/ZWw3LkD8zayv4JrKupEkqNq34el/F2SLF
         r+4JHoKtZpCLpfV+7wAajuGs7b2MFIS1L+Gpvw92wC4hwt1B9eTWITt4nvDQumrM57GC
         WsfsrCo6/f/sAskTmti50qgtRn/KTw9irb3NtN6wn6uuOy/jgRjUCeCNbeyU/y6CczD3
         Ph8g==
X-Gm-Message-State: AOJu0Yy9MxcTvjXTlIzehjYgEZBmNHcCQOB+8GFLrb6yZqnhgyNk1uV3
	q8u9buDMkU2eZnSUnOONsXLYzGx16qYXMdGP6N8=
X-Google-Smtp-Source: AGHT+IGVdGnuLX7t2uVe06nOoHh/8L3LRkwclVEWLNOfHw17xi+FIK041kFWPToY3gh+2SBYKiUVZQ==
X-Received: by 2002:a05:6a20:7d86:b0:134:30a8:9df5 with SMTP id v6-20020a056a207d8600b0013430a89df5mr6265571pzj.43.1697902128138;
        Sat, 21 Oct 2023 08:28:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id by2-20020a056a02058200b0058c1383fa8bsm2876515pgb.0.2023.10.21.08.28.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 08:28:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/6] libx11: Security Fix for CVE-2023-43785, CVE-2023-43786 and CVE-2023-43787
Date: Sat, 21 Oct 2023 05:28:31 -1000
Message-Id: <8175d023c203d524d011d8947f90fbd02786c6db.1697901991.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697901991.git.steve@sakoman.com>
References: <cover.1697901991.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Oct 2023 15:28:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189592

From: Siddharth Doshi <sdoshi@mvista.com>

CVE's Fixed:
CVE-2023-43785: libX11: out-of-bounds memory access in _XkbReadKeySyms()
CVE-2023-43786: libX11: stack exhaustion from infinite recursion in PutSubImage()
CVE-2023-43787: libX11: integer overflow in XCreateImage() leading to a heap overflow

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/libx11/CVE-2023-43785.patch      | 62 ++++++++++++++++++
 .../xorg-lib/libx11/CVE-2023-43786-0001.patch | 41 ++++++++++++
 .../xorg-lib/libx11/CVE-2023-43786-0002.patch | 45 +++++++++++++
 .../xorg-lib/libx11/CVE-2023-43786-0003.patch | 51 +++++++++++++++
 .../xorg-lib/libx11/CVE-2023-43787.patch      | 63 +++++++++++++++++++
 .../xorg-lib/libx11_1.7.3.1.bb                |  5 ++
 6 files changed, 267 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43785.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-0001.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-0002.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-0003.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43787.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43785.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43785.patch
new file mode 100644
index 0000000000..64f8776cc9
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43785.patch
@@ -0,0 +1,62 @@
+From 6858d468d9ca55fb4c5fd70b223dbc78a3358a7f Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Sun, 17 Sep 2023 14:19:40 -0700
+Subject: [PATCH] CVE-2023-43785: out-of-bounds memory access in
+ _XkbReadKeySyms()
+
+Make sure we allocate enough memory in the first place, and
+also handle error returns from _XkbReadBufferCopyKeySyms() when
+it detects out-of-bounds issues.
+
+Reported-by: Gregory James DUCK <gjduck@gmail.com>
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+
+Upstream-Status: Backport from [https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/6858d468d9ca55fb4c5fd70b223dbc78a3358a7f]
+CVE: CVE-2023-43785
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ src/xkb/XKBGetMap.c | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/src/xkb/XKBGetMap.c b/src/xkb/XKBGetMap.c
+index 2891d21..31199e4 100644
+--- a/src/xkb/XKBGetMap.c
++++ b/src/xkb/XKBGetMap.c
+@@ -182,7 +182,8 @@ _XkbReadKeySyms(XkbReadBufferPtr buf, XkbDescPtr xkb, xkbGetMapReply *rep)
+             if (offset + newMap->nSyms >= map->size_syms) {
+                 register int sz;
+ 
+-                sz = map->size_syms + 128;
++                sz = offset + newMap->nSyms;
++                sz = ((sz + (unsigned) 128) / 128) * 128;
+                 _XkbResizeArray(map->syms, map->size_syms, sz, KeySym);
+                 if (map->syms == NULL) {
+                     map->size_syms = 0;
+@@ -191,8 +192,9 @@ _XkbReadKeySyms(XkbReadBufferPtr buf, XkbDescPtr xkb, xkbGetMapReply *rep)
+                 map->size_syms = sz;
+             }
+             if (newMap->nSyms > 0) {
+-                _XkbReadBufferCopyKeySyms(buf, (KeySym *) &map->syms[offset],
+-                                          newMap->nSyms);
++                if (_XkbReadBufferCopyKeySyms(buf, (KeySym *) &map->syms[offset],
++                                              newMap->nSyms) == 0)
++                    return BadLength;
+                 offset += newMap->nSyms;
+             }
+             else {
+@@ -222,8 +224,10 @@ _XkbReadKeySyms(XkbReadBufferPtr buf, XkbDescPtr xkb, xkbGetMapReply *rep)
+             newSyms = XkbResizeKeySyms(xkb, i + rep->firstKeySym, tmp);
+             if (newSyms == NULL)
+                 return BadAlloc;
+-            if (newMap->nSyms > 0)
+-                _XkbReadBufferCopyKeySyms(buf, newSyms, newMap->nSyms);
++            if (newMap->nSyms > 0) {
++                if (_XkbReadBufferCopyKeySyms(buf, newSyms, newMap->nSyms) == 0)
++                    return BadLength;
++            }
+             else
+                 newSyms[0] = NoSymbol;
+             oldMap->kt_index[0] = newMap->ktIndex[0];
+-- 
+2.35.7
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-0001.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-0001.patch
new file mode 100644
index 0000000000..db5b7067aa
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-0001.patch
@@ -0,0 +1,41 @@
+From 204c3393c4c90a29ed6bef64e43849536e863a86 Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Thu, 7 Sep 2023 15:54:30 -0700
+Subject: [PATCH] CVE-2023-43786: stack exhaustion from infinite recursion in
+ PutSubImage()
+
+When splitting a single line of pixels into chunks to send to the
+X server, be sure to take into account the number of bits per pixel,
+so we don't just loop forever trying to send more pixels than fit in
+the given request size and not breaking them down into a small enough
+chunk to fix.
+
+Fixes: "almost complete rewrite" (Dec. 12, 1987) from X11R2
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+
+Upstream-Status: Backport from [https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/204c3393c4c90a29ed6bef64e43849536e863a86]
+CVE: CVE-2023-43786
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ src/PutImage.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/PutImage.c b/src/PutImage.c
+index 857ee91..a6db7b4 100644
+--- a/src/PutImage.c
++++ b/src/PutImage.c
+@@ -914,8 +914,9 @@ PutSubImage (
+ 		    req_width, req_height - SubImageHeight,
+ 		    dest_bits_per_pixel, dest_scanline_pad);
+     } else {
+-	int SubImageWidth = (((Available << 3) / dest_scanline_pad)
+-				* dest_scanline_pad) - left_pad;
++	int SubImageWidth = ((((Available << 3) / dest_scanline_pad)
++                              * dest_scanline_pad) - left_pad)
++                              / dest_bits_per_pixel;
+ 
+ 	PutSubImage(dpy, d, gc, image, req_xoffset, req_yoffset, x, y,
+ 		    (unsigned int) SubImageWidth, 1,
+-- 
+2.35.7
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-0002.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-0002.patch
new file mode 100644
index 0000000000..e46b3a2b24
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-0002.patch
@@ -0,0 +1,45 @@
+From 73a37d5f2fcadd6540159b432a70d80f442ddf4a Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Thu, 7 Sep 2023 15:55:04 -0700
+Subject: [PATCH] XPutImage: clip images to maximum height & width allowed by
+ protocol
+
+The PutImage request specifies height & width of the image as CARD16
+(unsigned 16-bit integer), same as the maximum dimensions of an X11
+Drawable, which the image is being copied to.
+
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+
+Upstream-Status: Backport from [https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/73a37d5f2fcadd6540159b432a70d80f442ddf4a]
+CVE: CVE-2023-43786
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ src/PutImage.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/PutImage.c b/src/PutImage.c
+index a6db7b4..ba411e3 100644
+--- a/src/PutImage.c
++++ b/src/PutImage.c
+@@ -30,6 +30,7 @@ in this Software without prior written authorization from The Open Group.
+ #include "Xlibint.h"
+ #include "Xutil.h"
+ #include <stdio.h>
++#include <limits.h>
+ #include "Cr.h"
+ #include "ImUtil.h"
+ #include "reallocarray.h"
+@@ -962,6 +963,10 @@ XPutImage (
+ 	height = image->height - req_yoffset;
+     if ((width <= 0) || (height <= 0))
+ 	return 0;
++    if (width > USHRT_MAX)
++        width = USHRT_MAX;
++    if (height > USHRT_MAX)
++        height = USHRT_MAX;
+ 
+     if ((image->bits_per_pixel == 1) || (image->format != ZPixmap)) {
+ 	dest_bits_per_pixel = 1;
+-- 
+2.35.7
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-0003.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-0003.patch
new file mode 100644
index 0000000000..2f47fe0bf2
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-0003.patch
@@ -0,0 +1,51 @@
+From b4031fc023816aca07fbd592ed97010b9b48784b Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Thu, 7 Sep 2023 16:12:27 -0700
+Subject: [PATCH] XCreatePixmap: trigger BadValue error for out-of-range
+ dimensions
+
+The CreatePixmap request specifies height & width of the image as CARD16
+(unsigned 16-bit integer), so if either is larger than that, set it to 0
+so the X server returns a BadValue error as the protocol requires.
+
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+
+Upstream-Status: Backport from [https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/b4031fc023816aca07fbd592ed97010b9b48784b]
+CVE: CVE-2023-43786
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ src/CrPixmap.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/src/CrPixmap.c b/src/CrPixmap.c
+index cdf3120..3cb2ca6 100644
+--- a/src/CrPixmap.c
++++ b/src/CrPixmap.c
+@@ -28,6 +28,7 @@ in this Software without prior written authorization from The Open Group.
+ #include <config.h>
+ #endif
+ #include "Xlibint.h"
++#include <limits.h>
+ 
+ #ifdef USE_DYNAMIC_XCURSOR
+ void
+@@ -47,6 +48,16 @@ Pixmap XCreatePixmap (
+     Pixmap pid;
+     register xCreatePixmapReq *req;
+ 
++    /*
++     * Force a BadValue X Error if the requested dimensions are larger
++     * than the X11 protocol has room for, since that's how callers expect
++     * to get notified of errors.
++     */
++    if (width > USHRT_MAX)
++        width = 0;
++    if (height > USHRT_MAX)
++        height = 0;
++
+     LockDisplay(dpy);
+     GetReq(CreatePixmap, req);
+     req->drawable = d;
+-- 
+2.35.7
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43787.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43787.patch
new file mode 100644
index 0000000000..4b5cd694ab
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43787.patch
@@ -0,0 +1,63 @@
+From 7916869d16bdd115ac5be30a67c3749907aea6a0 Mon Sep 17 00:00:00 2001
+From: Yair Mizrahi <yairm@jfrog.com>
+Date: Thu, 7 Sep 2023 16:15:32 -0700
+Subject: [PATCH] CVE-2023-43787: Integer overflow in XCreateImage() leading to
+ a heap overflow
+
+When the format is `Pixmap` it calculates the size of the image data as:
+    ROUNDUP((bits_per_pixel * width), image->bitmap_pad);
+There is no validation on the `width` of the image, and so this
+calculation exceeds the capacity of a 4-byte integer, causing an overflow.
+
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+
+Upstream-Status: Backport from [https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/7916869d16bdd115ac5be30a67c3749907aea6a0]
+CVE: CVE-2023-43787
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ src/ImUtil.c | 20 +++++++++++++++-----
+ 1 file changed, 15 insertions(+), 5 deletions(-)
+
+diff --git a/src/ImUtil.c b/src/ImUtil.c
+index 36f08a0..fbfad33 100644
+--- a/src/ImUtil.c
++++ b/src/ImUtil.c
+@@ -30,6 +30,7 @@ in this Software without prior written authorization from The Open Group.
+ #include <X11/Xlibint.h>
+ #include <X11/Xutil.h>
+ #include <stdio.h>
++#include <limits.h>
+ #include "ImUtil.h"
+ 
+ static int _XDestroyImage(XImage *);
+@@ -361,13 +362,22 @@ XImage *XCreateImage (
+ 	/*
+ 	 * compute per line accelerator.
+ 	 */
+-	{
+-	if (format == ZPixmap)
++	if (format == ZPixmap) {
++	    if ((INT_MAX / bits_per_pixel) < width) {
++		Xfree(image);
++		return NULL;
++	    }
++
+ 	    min_bytes_per_line =
+-	       ROUNDUP((bits_per_pixel * width), image->bitmap_pad);
+-	else
++		ROUNDUP((bits_per_pixel * width), image->bitmap_pad);
++	} else {
++	    if ((INT_MAX - offset) < width) {
++		Xfree(image);
++		return NULL;
++	    }
++
+ 	    min_bytes_per_line =
+-	        ROUNDUP((width + offset), image->bitmap_pad);
++		ROUNDUP((width + offset), image->bitmap_pad);
+ 	}
+ 	if (image_bytes_per_line == 0) {
+ 	    image->bytes_per_line = min_bytes_per_line;
+-- 
+2.35.7
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb b/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
index 19687d546b..d783f60103 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb
@@ -18,6 +18,11 @@ SRC_URI += "file://disable_tests.patch \
             file://CVE-2022-3554.patch \
             file://CVE-2022-3555.patch \
             file://CVE-2023-3138.patch \
+            file://CVE-2023-43785.patch \
+            file://CVE-2023-43786-0001.patch \
+            file://CVE-2023-43786-0002.patch \
+            file://CVE-2023-43786-0003.patch \
+            file://CVE-2023-43787.patch \
            "
 SRC_URI[sha256sum] = "2ffd417266fb875028fdc0ef349694f63dbcd76d0b0cfacfb52e6151f4b60989"
 
-- 
2.34.1


