Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B68CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 08:10:26 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.49905.1697789416746070531
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 01:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kaUZ25VO;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1caa371dcd8so4011035ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 01:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1697789416; x=1698394216; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UBSJQL6QGR6SYDEIreaLOt8Ri4hu93KUf+5SMh//Mv4=;
        b=kaUZ25VOu0kqjhy66fv1mIYiu2TxHVwNhk+LHMnp/ZQj3ijq3XJOBlQaUlWpdRo/Sm
         xDEZCNiOvRnlKNdCnbbwb/SFHiEUC1Qv8IqOsthndatFW40fZ/lU9CMmGpW0yNlbNldw
         zFXYyT1w2OHAKe+wGJUbcCBu0bWBbFU2wfzbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697789416; x=1698394216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBSJQL6QGR6SYDEIreaLOt8Ri4hu93KUf+5SMh//Mv4=;
        b=EXhKl6uYK5TfDppncIIy7Ko2+VenJzrTbBSlwYenpTLtAe8kEC69VXrBHVXAGEY+Ap
         uGUZ9EaZAtsCpvV8udn89xSEgvoEiNTZrOEyXehqMYmUJS+OcazDfDMZCcv76VHl2Ou/
         6MHDFD3jpdwgRPdYksbxUtCm4LCZzBPKsEMOY6foq1fUlxwU54MoAdSpxmM4A5S5qwBb
         5a1hv2oor7AEaBomBORz8TgDV9Nzf3MNCb4nP1IVOokFzaH8gEafhJGnhQGrfk+tmUqw
         JTQD2KLBtJamVTzGpzklO76KSlX2EJbpscxRGkrW12IDtMqqWYxfeCBavCT1YM9S0JVY
         MhhA==
X-Gm-Message-State: AOJu0Yz3uTfvGIVrte++rQ9r+2uAtyeCld9Jy8yhjt4cbwaVo/ygaBcb
	n8UnddJOu7lhM3yYQ2XcVceXEY6s2rqpweA2T4DXSA==
X-Google-Smtp-Source: AGHT+IGNqICQ0cgOqMl08/gmTC24fgNEmWNl/xt3cmpnq1Z3PzgN3ue0PDfuD+qw58B9E5IyCGzRiw==
X-Received: by 2002:a17:90a:c257:b0:27d:3260:9142 with SMTP id d23-20020a17090ac25700b0027d32609142mr1145161pjx.45.1697789415350;
        Fri, 20 Oct 2023 01:10:15 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([157.32.46.237])
        by smtp.gmail.com with ESMTPSA id pd11-20020a17090b1dcb00b0027cf7818fb6sm2774985pjb.37.2023.10.20.01.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 01:10:14 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][kirkstone][PATCH] libx11: Security Fix for CVE-2023-43785, CVE-2023-43786 and CVE-2023-43787
Date: Fri, 20 Oct 2023 13:40:08 +0530
Message-Id: <20231020081008.8821-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:10:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189507

From: Siddharth Doshi <sdoshi@mvista.com>

CVE's Fixed:
CVE-2023-43785: libX11: out-of-bounds memory access in _XkbReadKeySyms()
CVE-2023-43786: libX11: stack exhaustion from infinite recursion in PutSubImage()
CVE-2023-43787: libX11: integer overflow in XCreateImage() leading to a heap overflow

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
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


