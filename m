Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC71EC47072
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 03:48:26 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.5587.1700020098918028098
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 19:48:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dHc5vDzY;
 spf=pass (domain: mvista.com, ip: 209.85.215.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5a9bc2ec556so3933177a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 19:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1700020097; x=1700624897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3mWPixo5skyhsWNCu4E6xXB7OqF4w72kPrV3UWjewZA=;
        b=dHc5vDzYH9ggIITXunYSrOQ/86n3u1CSXh8NxtBV0uF91Tb43FzoH687+NP/ia3Vky
         0KaN5G9q89SQDuFQr3a7RAjJkMn73onBeDvRIWdz2fgExlLA7KFca8nOor/f6zOnvVH8
         2ao+myLrfcK8g8W+2m6AgB6L4zwS0ZsxRs6IE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700020097; x=1700624897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3mWPixo5skyhsWNCu4E6xXB7OqF4w72kPrV3UWjewZA=;
        b=DrKcsSAsQLobwxQRWa7QJuqbFoUDcBEUxyDJxzPSd7oDlDV0dvbtj8ahiXa1FZGCpB
         db8BitOsHQFsw6oTKAjSzxlYn4iV5w14Yw0R5JBDP+IMUTN2JSmB/UiekDwHLyfKTWP/
         mD0K7n2H3j7zYEMJl+yjrtNksYYg6egaHkguBLuKY5gN/HHdI4PwCHHStfMLZX6MVL7x
         WFW+x7yKlzzL5KFxCXm/aMmf9EOMxxjKoICCWwWXJirJ8F2IvmIOVlLhb5xsTZKx6Zvo
         pOikrhVNytiAClRaNyv4JXw5FNpOzv2Rw1ajN1Vcuxb2SsGDXeDenFmaJ1uYjrrMKXmN
         qcBw==
X-Gm-Message-State: AOJu0YxHwqS/R/64ACqDmKDf3sonB32eSbTKKdTjTUwjJQjf6Xi0UYuc
	7oG6uXF1FXe7nTZsHpA2u6ViCLnCXKVZXgBN+ik=
X-Google-Smtp-Source: AGHT+IGR5wSXPJU7F7UYUTCB3T2xrOcRD7vdTNTMex23MVHCwWUoqyWab1FEaQeqmtAfXhCW0NKXmg==
X-Received: by 2002:a05:6a20:8f27:b0:187:5684:4b82 with SMTP id b39-20020a056a208f2700b0018756844b82mr1273699pzk.10.1700020097072;
        Tue, 14 Nov 2023 19:48:17 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c01c:7c68:f9a7:2645:67b0:db49])
        by smtp.gmail.com with ESMTPSA id j24-20020a170902759800b001bdd7579b5dsm6382601pll.240.2023.11.14.19.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 19:48:16 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] libx11: backport Debian patches to fix CVE-2023-43785 CVE-43786 and CVE-2023-43787
Date: Wed, 15 Nov 2023 09:18:07 +0530
Message-Id: <20231115034807.168344-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 03:48:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190549

From: Vijay Anusuri <vanusuri@mvista.com>

import patches from ubuntu to fix
 CVE-2023-43785
 CVE-2023-43786
 CVE-2023-43787

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libx11/tree/debian/patches?h=ubuntu/focal-security
Upstream commit
https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/6858d468d9ca55fb4c5fd70b223dbc78a3358a7f
&
https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/204c3393c4c90a29ed6bef64e43849536e863a86
&
https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/73a37d5f2fcadd6540159b432a70d80f442ddf4a
&
https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/b4031fc023816aca07fbd592ed97010b9b48784b
&
https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/7916869d16bdd115ac5be30a67c3749907aea6a0]

Reference: https://launchpad.net/ubuntu/+source/libx11/2:1.6.9-2ubuntu1.6

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xorg-lib/libx11/CVE-2023-43785.patch      | 63 ++++++++++++++++++
 .../xorg-lib/libx11/CVE-2023-43786-1.patch    | 42 ++++++++++++
 .../xorg-lib/libx11/CVE-2023-43786-2.patch    | 46 +++++++++++++
 .../xorg-lib/libx11/CVE-2023-43787-1.patch    | 52 +++++++++++++++
 .../xorg-lib/libx11/CVE-2023-43787-2.patch    | 64 +++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |  5 ++
 6 files changed, 272 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43785.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-1.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-2.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43787-1.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43787-2.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43785.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43785.patch
new file mode 100644
index 0000000000..dbdf096fc8
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43785.patch
@@ -0,0 +1,63 @@
+From 6858d468d9ca55fb4c5fd70b223dbc78a3358a7f Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Sun, 17 Sep 2023 14:19:40 -0700
+Subject: [PATCH libX11 1/5] CVE-2023-43785: out-of-bounds memory access in
+ _XkbReadKeySyms()
+
+Make sure we allocate enough memory in the first place, and
+also handle error returns from _XkbReadBufferCopyKeySyms() when
+it detects out-of-bounds issues.
+
+Reported-by: Gregory James DUCK <gjduck@gmail.com>
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libx11/tree/debian/patches/0001-CVE-2023-43785-out-of-bounds-memory-access-in-_XkbRe.patch?h=ubuntu/focal-security
+Upstream commit https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/6858d468d9ca55fb4c5fd70b223dbc78a3358a7f]
+CVE: CVE-2023-43785
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/xkb/XKBGetMap.c | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/src/xkb/XKBGetMap.c b/src/xkb/XKBGetMap.c
+index 2891d21e..31199e4a 100644
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
+2.39.3
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-1.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-1.patch
new file mode 100644
index 0000000000..31a99eb4ac
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-1.patch
@@ -0,0 +1,42 @@
+From 204c3393c4c90a29ed6bef64e43849536e863a86 Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Thu, 7 Sep 2023 15:54:30 -0700
+Subject: [PATCH libX11 2/5] CVE-2023-43786: stack exhaustion from infinite
+ recursion in PutSubImage()
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
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libx11/tree/debian/patches/0002-CVE-2023-43786-stack-exhaustion-from-infinite-recurs.patch?h=ubuntu/focal-security
+Upstream commit https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/204c3393c4c90a29ed6bef64e43849536e863a86]
+CVE: CVE-2023-43786
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/PutImage.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/PutImage.c b/src/PutImage.c
+index 857ee916..a6db7b42 100644
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
+2.39.3
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-2.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-2.patch
new file mode 100644
index 0000000000..4800bedf41
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43786-2.patch
@@ -0,0 +1,46 @@
+From 73a37d5f2fcadd6540159b432a70d80f442ddf4a Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Thu, 7 Sep 2023 15:55:04 -0700
+Subject: [PATCH libX11 3/5] XPutImage: clip images to maximum height & width
+ allowed by protocol
+
+The PutImage request specifies height & width of the image as CARD16
+(unsigned 16-bit integer), same as the maximum dimensions of an X11
+Drawable, which the image is being copied to.
+
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libx11/tree/debian/patches/0003-XPutImage-clip-images-to-maximum-height-width-allowe.patch?h=ubuntu/focal-security
+Upstream commit https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/73a37d5f2fcadd6540159b432a70d80f442ddf4a]
+CVE: CVE-2023-43786
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/PutImage.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/PutImage.c b/src/PutImage.c
+index a6db7b42..ba411e36 100644
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
+2.39.3
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43787-1.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43787-1.patch
new file mode 100644
index 0000000000..d35d96c4dc
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43787-1.patch
@@ -0,0 +1,52 @@
+From b4031fc023816aca07fbd592ed97010b9b48784b Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Thu, 7 Sep 2023 16:12:27 -0700
+Subject: [PATCH libX11 4/5] XCreatePixmap: trigger BadValue error for
+ out-of-range dimensions
+
+The CreatePixmap request specifies height & width of the image as CARD16
+(unsigned 16-bit integer), so if either is larger than that, set it to 0
+so the X server returns a BadValue error as the protocol requires.
+
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libx11/tree/debian/patches/0004-XCreatePixmap-trigger-BadValue-error-for-out-of-rang.patch?h=ubuntu/focal-security
+Upstream commit https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/b4031fc023816aca07fbd592ed97010b9b48784b]
+CVE: CVE-2023-43787
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/CrPixmap.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/src/CrPixmap.c b/src/CrPixmap.c
+index cdf31207..3cb2ca6d 100644
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
+2.39.3
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43787-2.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43787-2.patch
new file mode 100644
index 0000000000..110bd445df
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-43787-2.patch
@@ -0,0 +1,64 @@
+From 7916869d16bdd115ac5be30a67c3749907aea6a0 Mon Sep 17 00:00:00 2001
+From: Yair Mizrahi <yairm@jfrog.com>
+Date: Thu, 7 Sep 2023 16:15:32 -0700
+Subject: [PATCH libX11 5/5] CVE-2023-43787: Integer overflow in XCreateImage()
+ leading to a heap overflow
+
+When the format is `Pixmap` it calculates the size of the image data as:
+    ROUNDUP((bits_per_pixel * width), image->bitmap_pad);
+There is no validation on the `width` of the image, and so this
+calculation exceeds the capacity of a 4-byte integer, causing an overflow.
+
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libx11/tree/debian/patches/0005-CVE-2023-43787-Integer-overflow-in-XCreateImage-lead.patch?h=ubuntu/focal-security
+Upstream commit https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/7916869d16bdd115ac5be30a67c3749907aea6a0]
+CVE: CVE-2023-43787
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/ImUtil.c | 20 +++++++++++++++-----
+ 1 file changed, 15 insertions(+), 5 deletions(-)
+
+diff --git a/src/ImUtil.c b/src/ImUtil.c
+index 36f08a03..fbfad33e 100644
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
+2.39.3
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
index 568162a911..248889a1d4 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.9.bb
@@ -19,6 +19,11 @@ SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
             file://CVE-2022-3554.patch \
             file://CVE-2022-3555.patch \
             file://CVE-2023-3138.patch \
+            file://CVE-2023-43785.patch \
+            file://CVE-2023-43786-1.patch \
+            file://CVE-2023-43786-2.patch \
+            file://CVE-2023-43787-1.patch \
+            file://CVE-2023-43787-2.patch \
 "
 
 SRC_URI[md5sum] = "55adbfb6d4370ecac5e70598c4e7eed2"
-- 
2.25.1


