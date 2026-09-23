Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66563C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:55 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2923.1790154708317102070
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lxUufxj0;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso5744355e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154706; x=1790759506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZwchotgcaIhwZq85Fiuu8sJWB5nULsjhKtRbBMSf1IA=;
        b=lxUufxj0UwBCJ+Rkv7tEr0MWVR1o7dSXaEmIXn87KiUo8sn55x7eRT7llhcv2FcKqn
         6HGMnWPjZMU+sQkevw/dpapik1X596DJWVQVuNJEtS2mjXJIYQI2gwZOCu3XUpIVl1k/
         J0tEjRygMxbDGgBRvebZ1W3miHEmDKCFeH3oM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154706; x=1790759506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZwchotgcaIhwZq85Fiuu8sJWB5nULsjhKtRbBMSf1IA=;
        b=Onf6uESBaR2M5GhYaaECF+o2MsqqsaNemod59MWZpJqVDET9P0K6WQyQ5u/9ZbpulP
         7oN3j23VCgnhZoTGI0v/2bYVgsIqo1gGP1+zp7Z+9ZJKiisRRcbOGFbFNLN636G7vEp7
         UAcqvn4GIkPahiG32p4wtx1NvK8A4r+k2n5UqP4CXbtRxn4J+ppr6rZJtlGBoWMSurYG
         apF6kre0sw1MGfjd6fleFDfHuU8fd+Ft4YjTG3hMO3+Uvsei3recFtQrMcD4ovys/jNi
         cSy8jyNTzbS273K6QFMBgdDPGfffoMTtlUnQq8QlA3R78yIIQNolHp6qnXTczWRQVCMb
         VOsg==
X-Gm-Message-State: AFuF++mJFV1SyphvB+yTe7oohv3GkNZA/6uPNylZXU2NlBpuy5kca7Sg
	aHztDIoBkwRJ1PFx5JM/4EN7zKLC47QrzEgT0G0MKRZoPuFeANtWM1M2xWyDsZ6dUSHzemRTMHb
	psdp3RfA=
X-Gm-Gg: AYBFou1xm/EQB7aFoAGU1jQI+rwIDx1Zp19Jvh/2FDQhmY5In5R/KLrp1Q+o9/56x3J
	51kg44nKEyUmk9covfnwVipPLzSIzOF0eH/OVP/KPrRoQ3MzvYBDOS4qrsW9YTGp6lWaN8QvQ4K
	TClML8Vc5TPgZ5sP30cIvjZTjchPWrI7M4C/ALOFZ7d0eq4FaH306wKvWvS+PM6pvljvTocpSzH
	al3JA7FNwDsHh+8V+41niZ4yp3sh3aUvozqWCnggPRBjH06LABFo4fs5H1qPkcPqffu/2t3fY81
	A40VshiV/3un+Ph255yg2iDq89o0KrUGEZsF3gjjH+FzjKFXJLOsr4WxX2T6UBuP78GIpALl/42
	C3sH6sGm7RT1pfBFK/rn8+eQPoZrJuVAHpudNrtkc2r5QJbNCW5x40AzOEuk3Xvzr3tFMuibqr3
	8SFjbQWY/BTZkezP/0RbkwsaJh8Ow/SZXacW/GYdmtlrQ6NXuZ8fhHbnHSDEVO8MNJkcofpIr3C
	LXDDUiof+zFm89Um6lUzAuNXdnbbVwcUSKhBmvXFAwJm8zROCJcFY/8znF6FxL4fqeNi58b
X-Received: by 2002:a05:600c:8b6f:b0:49c:fff9:f684 with SMTP id 5b1f17b1804b1-49fdf13502amr26399825e9.21.1790154706407;
        Wed, 23 Sep 2026 02:11:46 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:45 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/48] libxfont: Fix CVE-2026-56002
Date: Wed, 23 Sep 2026 11:10:27 +0200
Message-ID: <9f95815832f8c2753fd6d91c4719764e81ee5b81.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246487

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-56002
[2] https://security-tracker.debian.org/tracker/CVE-2026-56002

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xorg-lib/libxfont/CVE-2026-56002.patch    | 150 ++++++++++++++++++
 .../xorg-lib/libxfont_1.5.4.bb                |   1 +
 2 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56002.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56002.patch b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56002.patch
new file mode 100644
index 00000000000..cef8a06a686
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56002.patch
@@ -0,0 +1,150 @@
+From b4389e0b1d84a690b819bb27b1439968811a3674 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon, 1 Jun 2026 16:48:40 +1000
+Subject: [PATCH] pcfread: validate bitmap sizes and offsets against per-glyph
+ metrics
+
+pcfReadFont() uses bitmapSizes[] read directly from the PCF file to
+allocate the repadded bitmap buffer. However, per-glyph metrics (also
+from the file) control how much data RepadBitmap() writes. A malicious
+PCF font can declare a small bitmapSizes[] value while having per-glyph
+metrics that require more space, causing a heap buffer overflow.
+
+A similar issue happens with the encoding offsets: pcfReadFont reads
+encoding offsets from the PCF file and uses them to index into the
+metrics array without bounds checking.  A crafted font can set an
+encoding offset larger than nmetrics, causing an out-of-bounds pointer
+that is later dereferenced when glyphs are accessed through the encoding
+table.
+
+And the no-repad bitmap path (when PCF_GLYPH_PAD matches the requested
+glyph pad) only validated that each glyph's offset was within the bitmap
+buffer, but did not check that the full glyph extent (offset +
+BYTES_PER_ROW * height) fits within the buffer.  A crafted font with a
+glyph offset near the end of a small bitmap buffer but large glyph
+metrics causes a heap buffer over-read when the glyph is later rendered.
+
+This vulnerability was discovered by:
+  Anonymous working with TrendAI Zero Day Initiative
+
+CVE-2026-56002/ZDI-CAN-30559
+
+Assisted-by: Claude:claude-opus-4-6
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/lib/libxfont/-/merge_requests/34>
+
+Note: 'INT_MAX' is defined in header '<limits.h>'. Add '#include
+<limits.h>' to fix build failure.
+
+Upstream-Status: Backport [import from debian libxfont1 1.5.2-4+deb9u1
+Upstream commit https://gitlab.freedesktop.org/xorg/lib/libxfont/-/commit/b4389e0b1d84a690b819bb27b1439968811a3674]
+CVE: CVE-2026-56002
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/bitmap/pcfread.c | 60 +++++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 57 insertions(+), 3 deletions(-)
+
+diff --git a/src/bitmap/pcfread.c b/src/bitmap/pcfread.c
+index 4a372c5..0cc9777 100644
+--- a/src/bitmap/pcfread.c
++++ b/src/bitmap/pcfread.c
+@@ -45,6 +45,7 @@ from The Open Group.
+ #include <stdarg.h>
+ #include <stdint.h>
+ #include <string.h>
++#include <limits.h>
+ 
+ void
+ pcfError(const char* message, ...)
+@@ -529,25 +530,74 @@ pcfReadFont(FontPtr pFont, FontFilePtr file,
+ 	int         old,
+ 	            new;
+ 	xCharInfo  *metric;
++	int         srcPad = PCF_GLYPH_PAD(format);
+ 
+-	sizepadbitmaps = bitmapSizes[PCF_SIZE_TO_INDEX(glyph)];
+-	padbitmaps = malloc(sizepadbitmaps);
++	/* Compute the actual required size from per-glyph metrics instead
++	 * of trusting the file's bitmapSizes[] value, which may be smaller
++	 * than the actual data written by RepadBitmap. */
++	sizepadbitmaps = 0;
++	for (i = 0; i < nbitmaps; i++) {
++	    int w, h, glyphBytes;
++	    metric = &metrics[i].metrics;
++	    w = metric->rightSideBearing - metric->leftSideBearing;
++	    h = metric->ascent + metric->descent;
++	    glyphBytes = BYTES_PER_ROW(w, glyph) * h;
++	    if (glyphBytes < 0 || (glyphBytes > 0 && sizepadbitmaps > INT_MAX - glyphBytes)) {
++		pcfError("pcfReadFont(): bitmap size overflow\n");
++		goto Bail;
++	    }
++	    sizepadbitmaps += glyphBytes;
++	}
++	padbitmaps = malloc(sizepadbitmaps ? sizepadbitmaps : 1);
+ 	if (!padbitmaps) {
+           pcfError("pcfReadFont(): Couldn't allocate padbitmaps (%d)\n", sizepadbitmaps);
+ 	    goto Bail;
+ 	}
+ 	new = 0;
+ 	for (i = 0; i < nbitmaps; i++) {
++	    int srcGlyphBytes;
++
+ 	    old = offsets[i];
+ 	    metric = &metrics[i].metrics;
++
++	    /* Validate source offset and source glyph size against the
++	     * source bitmap buffer to prevent out-of-bounds reads. */
++	    srcGlyphBytes = BYTES_PER_ROW(
++		metric->rightSideBearing - metric->leftSideBearing,
++		srcPad) * (metric->ascent + metric->descent);
++	    if (old < 0 || old > sizebitmaps ||
++		srcGlyphBytes < 0 || srcGlyphBytes > sizebitmaps - old) {
++		pcfError("pcfReadFont(): bitmap offset/size out of bounds\n");
++		free(padbitmaps);
++		goto Bail;
++	    }
++
+ 	    offsets[i] = new;
+ 	    new += RepadBitmap(bitmaps + old, padbitmaps + new,
+-			       PCF_GLYPH_PAD(format), glyph,
++			       srcPad, glyph,
+ 			  metric->rightSideBearing - metric->leftSideBearing,
+ 			       metric->ascent + metric->descent);
+ 	}
+ 	free(bitmaps);
+ 	bitmaps = padbitmaps;
++    } else {
++	/* Validate offsets and full glyph extents against bitmap buffer */
++	for (i = 0; i < nbitmaps; i++) {
++	    int glyphBytes;
++	    xCharInfo *metric = &metrics[i].metrics;
++
++	    glyphBytes = BYTES_PER_ROW(
++		metric->rightSideBearing - metric->leftSideBearing,
++		glyph) * (metric->ascent + metric->descent);
++	    if (offsets[i] >= (CARD32)sizebitmaps ||
++		glyphBytes < 0 ||
++		glyphBytes > sizebitmaps - (int)offsets[i]) {
++		pcfError("pcfReadFont(): bitmap offset/size out of bounds "
++			 "(offset %u, size %d, total %d)\n",
++			 offsets[i], glyphBytes, sizebitmaps);
++		goto Bail;
++	    }
++	}
+     }
+     for (i = 0; i < nbitmaps; i++)
+ 	metrics[i].bits = bitmaps + offsets[i];
+@@ -622,6 +672,10 @@ pcfReadFont(FontPtr pFont, FontFilePtr file,
+ 	if (IS_EOF(file)) goto Bail;
+ 	if (encodingOffset == 0xFFFF) {
+ 	    pFont->info.allExist = FALSE;
++	} else if (encodingOffset >= nmetrics) {
++	    pcfError("pcfReadFont(): encoding offset %d out of range (nmetrics=%d)\n",
++		     encodingOffset, nmetrics);
++	    goto Bail;
+ 	} else {
+             if(!encoding[SEGMENT_MAJOR(i)]) {
+                 encoding[SEGMENT_MAJOR(i)]=
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
index 1173794f8d6..e7a426c32a9 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
@@ -20,6 +20,7 @@ XORG_EXT = "tar.bz2"
 BBCLASSEXTEND = "native"
 
 SRC_URI += "file://CVE-2026-56001.patch \
+            file://CVE-2026-56002.patch \
            "
 
 SRC_URI[md5sum] = "16eaf156edd79b68038b6a7c44aa9e9b"

