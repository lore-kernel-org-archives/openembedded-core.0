Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775FEC5DF94
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 06:20:45 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15928.1787638835970037680
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 23:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MDyf3hGE;
 spf=pass (domain: mvista.com, ip: 209.85.215.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc11a30a259so4553086a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 23:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787638835; x=1788243635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1N3T6VWM5TIWBKbJ6NOus4rAIn2QrEY1xRu+vHebZn0=;
        b=MDyf3hGERo7KQ2XuP9ePvLkhKkgt55O3XlBptN540bZnCtpxJbCF5GEfdRCMPbEJlv
         JLSoqK3SbkcV1E+wCTItJIXP0T8FHBhp23fzMFdFFJ/zZeSr1qiGpWW98OX4NgBizCoe
         /7FdSdr/xFJrDo9/f69kRDg3adM6IWi4nVtgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787638835; x=1788243635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1N3T6VWM5TIWBKbJ6NOus4rAIn2QrEY1xRu+vHebZn0=;
        b=VDBHoU9FRhgiO+4CE6TYMye0qA8sCE2eaWymLD3PTGQXJrpSH117yTVDQJBrGZFapG
         8bkRc/sml0tfyEHfAiT29vjpu6SgyVWjDV2qVBYrz8/gEKOtNi3NLeZGKC+Je7TmUlHT
         V761ZIIOs+ymPeOT8bqNrMJj/Nm/DXxdT5cCS+Gpx9BsZtdKAvb5L+eOzUYS4ApMjFac
         NVP7c6uytMUnyN6qCb+hlDnZGopyjm7YATk4ehIpc7f2mqxr0s2K9V0giriPtZLGAyzb
         hhXvklFUV3BJXpIHf3D0/PxkrfcqyqncPKeKlljUVKd0A0rhcDVbw03SK0s6b1qcCQdZ
         NkRA==
X-Gm-Message-State: AFuF++lhjsdnwvzCWjPhn0GciHhmgJ5hol/RWSeHPbkKJjYBvZWPdrF+
	rrlbPpDbeqjV3c27HRlooci8o6OxQQZs5zK8/SAVRPSiT5RFIsiES7pP3Fd/YNvIc8k+N2QzCeM
	5CdSC
X-Gm-Gg: AR+sD10adiUi6VpgnB0/oemOvX1gJqpmNGK0CjTp7p19ianOoll7FnIlCX13veWTaO8
	8TpCAat/oZ38XmciGDoM8EnsvCFwlqtWOBksk3h4HYroudnhOdyShM2bXHV3KqClHdaRWcKm+ao
	50Lm/Fut72gEnNf/Ie1NV+5C+6EY+AsiZ+R6XAKACWproVrXnrYx5VPkiQK+o0jZ315zSBg0vIo
	jOe2LREFoVzokMDYXdRbaw+4/JvdwObeF6b6G3JR2stfdqPc5dJu/wU/qMKqD3YiE6HBgL3yTLV
	imPI+fLiefWeEBwFBtzlskNJ2IlnfFUKp95CO+I03ZpNOhJGY4TuVdbmS5Ybe0diqLihG3Pdy/P
	mbxybDVvsdWx/LX0VKs8L1zKAUpehX24MhVIxNwr2d99CaYOtii6wm4YEPFLxrnfBuLLY2xTiCC
	1rbxx5t2j08ituvXfQmC8VbfeDFAtS9kwyjOP6Szuxw2ItjV/M2aFj+Gb9aiKUyvbt/88T8xVwe
	P1zBA==
X-Received: by 2002:a05:6a21:a93:b0:3c3:a140:9392 with SMTP id adf61e73a8af0-3cd4b6850aemr50793698637.0.1787638835181;
        Mon, 24 Aug 2026 23:20:35 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:8284:a2bd:b8ae:b7dd:5272])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f9099ce7sm30844589eec.5.2026.08.24.23.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:20:34 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 2/3] libxfont: Fix CVE-2026-56002
Date: Tue, 25 Aug 2026 11:50:11 +0530
Message-ID: <20260825062012.39336-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825062012.39336-1-vanusuri@mvista.com>
References: <20260825062012.39336-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 06:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244201

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-56002
[2] https://security-tracker.debian.org/tracker/CVE-2026-56002

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xorg-lib/libxfont/CVE-2026-56002.patch    | 147 ++++++++++++++++++
 .../xorg-lib/libxfont_1.5.4.bb                |   1 +
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56002.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56002.patch b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56002.patch
new file mode 100644
index 0000000000..a615c21a2f
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56002.patch
@@ -0,0 +1,147 @@
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
index 1173794f8d..e7a426c32a 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
@@ -20,6 +20,7 @@ XORG_EXT = "tar.bz2"
 BBCLASSEXTEND = "native"
 
 SRC_URI += "file://CVE-2026-56001.patch \
+            file://CVE-2026-56002.patch \
            "
 
 SRC_URI[md5sum] = "16eaf156edd79b68038b6a7c44aa9e9b"
-- 
2.43.0


