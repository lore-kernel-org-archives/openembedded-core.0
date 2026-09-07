Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46733C79FAE
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:04 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34915.1788788155783143685
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WRTkhhJu;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so36197875e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788154; x=1789392954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OtJdt73GnRvVW/GyMU1Gfg48/Zab5ZYOQ5Yb/BZIlRQ=;
        b=WRTkhhJuVWiUVsPrwLfUV2XBwxb8+GkCalUytkC0k44he/gBUXamS+Hwit/edjCnTM
         lYho6YLXLplO4Pp/k8K6Ns6M/jrDebDvZzca3VaQq/S/GeCCGrN/cYfm2HC80WAefoqa
         XgDmHDUTTpve56mKge/hfwoHeM9quA7k0TgaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788154; x=1789392954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OtJdt73GnRvVW/GyMU1Gfg48/Zab5ZYOQ5Yb/BZIlRQ=;
        b=N2ZGupNUR+20MoRFSGSM6tpxzFtXnDT++D3UB2F0/e3dIwAXNHdijFdsCl1tHCldH0
         K8TMXgyxpJhEkC55C3i1dmZQkbdkSGNwnomgl87MgLnKvXhd/EwmmHwwIRi9BnFJP9TV
         ybneTvbFZRpdTKAbYvEUrlOm+OsIZY8byCMvJNHjkXvxeX6Pon6gYIeum8tumj9EJY8m
         vTlUCjBO5YnXeeVTywWiKbJUg1zks/8B+2oVDcjmGpdlTZUtBNhUu4QtLym0vKnN5KVR
         wVV+ASK+dpKN8v06kuP3IIkz64VTl9mnjgoRV0kTkmP1nF2GJZahYxwhUeOXbfNWgSGr
         efMg==
X-Gm-Message-State: AFuF++lg7fzWrIW8C6deDI4DEaRJCD1vYjxRkOp6NhzgqpzqrJXXFFS4
	Mp261M+Ir/27WU1xwFBsEXWmt904bqqAa7aN9d9VsyDtZUdffABzo5cvOibmrNGd3kbG+tPd4zG
	A6AlIpQU=
X-Gm-Gg: AYBFou1u38VK/R9kCOJpHIPKXl8yuv/kXj57oDabYcZkQQnE+3r2JIH2Tmm352R+yn0
	pRfqtT3wIANI+jfn9CPIIexMsYjcyMumCY1XIRGKwlqAg2lHLQV40OOI7Gn1qgVtmShNHeFa5PZ
	OKtDHGIU/Eu1AH26qwkm9mSBpy7xFi45Ogx3J4ZTNdirKDfIXIoOB/adgePhOQBCPGs1/4JA2O2
	/AIKkmS8Ccc+tXs6vadOFbxozyA8ZIdtwfboZ+0socTzg6tUGsU0EDBXCyoDQUx1kYWv1rR7iHC
	buASk6+s7HJGAccZzluv7YiStviv8bzQYiD49Xe3BGnBfJuat0ej5s6MnB49jDUehBlCjwERZAW
	/+6beVhub3T7auXzTpjqvsvYj4wgXpBSeqUg0a/o0WWoHp9T07ny/o4cuTEMk0Rpwv0ZNJdU+pi
	OEJxBVwguoAt5UnU9LyGzUez1Fs+/95SE2tGHUQEuRewxKeIhTOnPG9Who5p0YPXdoLpRHbx80s
	tf5NUMXTc4Q9eE/Cd4O0OdCgWjuj1oOyn9lwn4mlRtzJFjBnHY3c0t+XiuGheNe
X-Received: by 2002:a05:600c:b93:b0:49d:17c5:8f7a with SMTP id 5b1f17b1804b1-49d17c58fa8mr1760505e9.18.1788788153621;
        Mon, 07 Sep 2026 06:35:53 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.35.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:35:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/35] libxfont2: Fix CVE-2026-56001
Date: Mon,  7 Sep 2026 15:35:01 +0200
Message-ID: <78e09979d47a03846afa7c52758e6f24ac659627.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245263

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-56001
[2] https://security-tracker.debian.org/tracker/CVE-2026-56001

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xorg-lib/libxfont2/CVE-2026-56001.patch   | 75 +++++++++++++++++++
 .../xorg-lib/libxfont2_2.0.6.bb               |  3 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56001.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56001.patch b/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56001.patch
new file mode 100644
index 00000000000..831547df296
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56001.patch
@@ -0,0 +1,75 @@
+From be0b08e2d354138d3222b4490e2a77c6ee42f778 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon, 1 Jun 2026 16:46:10 +1000
+Subject: [PATCH] bitscale: fix integer overflow in BitmapScaleBitmaps
+ bytestoalloc
+
+bytestoalloc is declared as unsigned int (32-bit). When the sum of
+per-glyph byte counts exceeds 2^32, the value wraps around and calloc()
+allocates a buffer that is too small. The subsequent ScaleBitmap loop
+then writes past the end of the allocated buffer.
+
+Change bytestoalloc from unsigned int to size_t to match the actual
+allocation size type, and add an explicit overflow check in the
+accumulation loop to bail out if the total would exceed SIZE_MAX.
+
+This vulnerability was discovered by:
+Anonymous working with TrendAI Zero Day Initiative
+
+CVE-2026-56001/ZDI-CAN-30558
+
+Assisted-by: Claude:claude-opus-4-6
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/lib/libxfont/-/merge_requests/34>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libxfont/-/commit/be0b08e2d354138d3222b4490e2a77c6ee42f778]
+CVE: CVE-2026-56001
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/bitmap/bitscale.c | 23 ++++++++++++++++++++---
+ 1 file changed, 20 insertions(+), 3 deletions(-)
+
+diff --git a/src/bitmap/bitscale.c b/src/bitmap/bitscale.c
+index e29ba96..7100138 100644
+--- a/src/bitmap/bitscale.c
++++ b/src/bitmap/bitscale.c
+@@ -1460,7 +1460,7 @@ BitmapScaleBitmaps(FontPtr pf,          /* scaled font */
+ 		opci;
+     FontInfoPtr pfi;
+     int         glyph;
+-    unsigned    bytestoalloc = 0;
++    size_t      bytestoalloc = 0;
+     int		firstCol, lastCol, firstRow, lastRow;
+ 
+     double	xform[4], inv_xform[4];
+@@ -1487,8 +1487,25 @@ BitmapScaleBitmaps(FontPtr pf,          /* scaled font */
+     glyph = pf->glyph;
+     for (i = 0; i < nchars; i++)
+     {
+-	if ((pci = ACCESSENCODING(bitmapFont->encoding, i)))
+-	    bytestoalloc += BYTES_FOR_GLYPH(pci, glyph);
++	if ((pci = ACCESSENCODING(bitmapFont->encoding, i))) {
++	    size_t glyphsize = BYTES_FOR_GLYPH(pci, glyph);
++	    if (bytestoalloc > SIZE_MAX - glyphsize) {
++		fprintf(stderr,
++			"Error: bitmap allocation overflow for scaled font\n");
++		goto bail;
++	    }
++	    bytestoalloc += glyphsize;
++	}
++    }
++
++    /* Reject unreasonably large bitmap allocations that could result
++     * from malicious fonts with extreme scale factors.  256 MiB is
++     * far beyond any legitimate scaled bitmap font. */
++#define BITMAP_SCALE_MAX_ALLOC	(256 * 1024 * 1024)
++    if (bytestoalloc > BITMAP_SCALE_MAX_ALLOC) {
++	fprintf(stderr,
++		"Error: scaled bitmap size %zu exceeds limit\n", bytestoalloc);
++	goto bail;
+     }
+ 
+     /* Do we add the font malloc stuff for VALUE ADDED ? */
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
index 535e7f629ee..1a0eb42681d 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
@@ -15,6 +15,9 @@ XORG_PN = "libXfont2"
 
 BBCLASSEXTEND = "native"
 
+SRC_URI += "file://CVE-2026-56001.patch \
+           "
+
 SRC_URI[sha256sum] = "74ca20017eb0fb3f56d8d5e60685f560fc85e5ff3d84c61c4cb891e40c27aef4"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"

