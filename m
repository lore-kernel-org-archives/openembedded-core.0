Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95437C79FAA
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:11 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6327.1788939011177684321
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YYiuMPPc;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso429393f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939009; x=1789543809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nP0u2NdMIYyX7OsSRPzzPwjXmLukXHr2loTU+Je+i4o=;
        b=YYiuMPPc+XS4opY1Dm0cmEP8vN505pFHTED92D2etfY3VmJMe0PtQ7d4XsdBqc8/oM
         x3AvDZ8Jk5eiR722UhMy56bcBhWF+GhyYYSaZcx4trSJ3vEOIsS9wqrAXOi4LWhzaxAH
         6bUzt3fv1GcwAX1SmGkgTjdFgIg7qVBjlxkWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939009; x=1789543809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nP0u2NdMIYyX7OsSRPzzPwjXmLukXHr2loTU+Je+i4o=;
        b=sePB4BuHfeh71CYrV/8he7cPVMlJOMgBHw3P6LTTxotkNQbWnd1Rf8EanpIufNPAlk
         oZ4d26PZ/LtB+0wSr4LrnJrzUVFeiPemQBbNIcwuzGKs0DbRtS/ZYLXa+q5R6CfX8kN4
         S9YF2vxSf2biH5ojDGzFZc12xK940MQpPr9Mi8uV7Y/8Oth3WRs7R+DNbXvm6QxERmMr
         yM77KJXwy6r4C7zeaHkgmllfQzOieq+OY0r+XG+QRdg/CTTNwpmyjyoWmUpVidwyzGQd
         8OuBihMlweDu5YUKshmSTd1+JyFB90pHynT3LVo2w3YsVf90Y3A3QzbLDsI1HXALkZC7
         Hp9Q==
X-Gm-Message-State: AFuF++nSJfzIas47eKMlr3yi2XD8RZPtuqxY7j8goABZlGo2PFsYCaN+
	ArbYmFNI5UL3mf7Z+xc79bCxe/DhAeQH1J81LDnEiuzJt912gSiRFgB9pkOpxWvZ8XKqEcmqLyy
	6kqY+D98=
X-Gm-Gg: AYBFou0v7Io6iu7LDCr3KuRrL29653xswHFDRq9+M/RzjJ4tAvUwvyaymEL9Hn7z/ju
	IYECGNyhggMXmg0A4p9MBxkd5VOsBYU17ytT9yd4TpVOGtxkqVb86KmRHwTLniT9wV+r0OSwg6+
	/OezoRljmSj994PSBVZnrywmjOm+18F/07CCkLeJjt9sByphgmEOxU6rNSeHkqAGhaHQ2tuLXXw
	GbTqoCUzWbVCJJbokj20fdCX9e+JnlArOaGsOCj3Dqm7wEIpL6jypwgq07ELTZ+W8thaEKaRyds
	+xnSMFCji4Uc5aiVQH6kRfWaypcsAx7XuVbxDMxlMmq/8yI+ELezTT5vmkGoH1DI2JtgBGfbaMK
	lgLQTpYNe0oesQ7Y1GzOejlfMzBhrhUFADK2bkMXC16mslx8qiVCtzPz8THo6G4lt0jn9MpEWuE
	pGKAy82HCnCsc/auTujWDAQRvb82j/dERY4MkWVrNYqFAn3c7vv8eIhGzRaC+AhL4o155nzACrM
	178EpD+xtIecS6mqUwMofYrw8GBt502XZQhMvER5i1uv6JAymaL/py+YBHU0RONrFtkKELoeVI=
X-Received: by 2002:a05:6000:1883:b0:482:ea08:8c97 with SMTP id ffacd0b85a97d-485aad9458dmr7923016f8f.2.1788939009290;
        Wed, 09 Sep 2026 00:30:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 23/38] libxfont: Fix CVE-2026-56002
Date: Wed,  9 Sep 2026 09:29:22 +0200
Message-ID: <c13ca79ff32a14baa47251d2e96c1bbff1d3ac9f.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245432

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
index 59c489b785d..08c96fdac87 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
@@ -20,6 +20,7 @@ XORG_EXT = "tar.bz2"
 BBCLASSEXTEND = "native"
 
 SRC_URI += "file://CVE-2026-56001.patch \
+            file://CVE-2026-56002.patch \
            "
 
 SRC_URI[sha256sum] = "1a7f7490774c87f2052d146d1e0e64518d32e6848184a18654e8d0bb57883242"

