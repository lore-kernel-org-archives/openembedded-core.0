Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169ADC5DF93
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 14:53:05 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9141.1787323980324321152
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 07:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=URymaV30;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cab973140bso14497955ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 07:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787323980; x=1787928780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akIp6u0Sf83G0inWiEP3IEw3bqwwvPDEJkk0o0/LurM=;
        b=URymaV30d032iQYvuxeI65HDsHkL96dbyma8cdrpz9aTn13WhBLlwpuXV26tOO5UUY
         z1Nxk1X80cCXwzSckOdKNixMATvYmnj5Nl6Mrll2TU81/IQOykJQ4IN47v0o8K38xHwl
         baGui8UKSCuWSTeR5obs2dXhVCXqofcGXXHqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787323980; x=1787928780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=akIp6u0Sf83G0inWiEP3IEw3bqwwvPDEJkk0o0/LurM=;
        b=GAXCm8bFToT5OvmrCyvskzbG0HwCGF0Va2EGAEghVHBRRSB5qbb6s3LUKQjZiA5/Ii
         15KyoILoMgTE6h264vgNUQTqbOVC/duXytl00plDCkCD6mRu22hfxcDqTDBlfDkYQ9KJ
         8SGUTJJXWO1xlA7WI5JIcJrGNs+aMwPqhrBXF2KfjCA6h/N0Ug+oH9Zda7U9oDDC/gjf
         0IsZLY51hDvJHlaU1BsF42a58aa2uGjz6WV5WrdP/LLPRL+N3KuMdjruqeKh52XlBM0h
         fNILxEckTv5okjXrfZJ63fqeG+ypifUeAXirFT3Gixga+o6vm77IqD/O1NHRtSQh40yu
         qxPg==
X-Gm-Message-State: AFuF++kN9vgG+EFoJe1x3IDuxPlZ8IsTQezbvhLulISMg6/yH4Bb0Wdv
	R9s5e9xYj6ObjYt8jc5aIOAyKwsuy47kw/dV4sHJzW2FIEz6hU6kcm1buZY7QGZJioYiqRgDXHK
	Ch3r8
X-Gm-Gg: AR+sD10UQCLjjxRhDp1vyzUmjfEIu2JPDotBnaHj6qzzInN8UBO7nNd8OQHkl9bVTWk
	JHly+K3yvAuRM6DLaLI9FwMDemQPFebXbk/XRGrP+YEtRI2hsOy5OnmKPzGls5LQj7KcNqST1uw
	LYg8EV+0x/alxG5nGqZTux49n8sLfNM+zImdVV3jBAZsJwFe5hiBFhd/p6i6PdH7x2bywDdiM2i
	wdtOCxi44mD4doD+hNe9ZNr0uphu6Wnni+P3lW0X4q/QzCGsB4c+HZn98gZggEU2JFS8fmDNYQ4
	Z0WQcINtcq1KGI68XZHPNJPS3mWFC6d2hk/UTTryce8Z01BTmVyZTm0XOAtzk42LR5TcHxvE/mJ
	Fn0WIGX7aRh6V76oSNjQlxyIR9Vzl6lSy2E1Fv8UZi1/sjml+TaIU3e0M+oKtO/+dQdg/e51OxA
	BsCsrgrGgxalc9xRvb/K44h0wW2wRtaYpap9tzGImNheIF5uiIys5N68l9SE/2ZoSyDBpZZl9yV
	nJH
X-Received: by 2002:a17:902:fdb0:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2d64b0b5652mr152787175ad.14.1787323979283;
        Fri, 21 Aug 2026 07:52:59 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:8284:9dd5:5a04:5eb2:4372])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef6ec40sm29820194eec.7.2026.08.21.07.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:52:58 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 2/3] libxfont2: Fix CVE-2026-56002
Date: Fri, 21 Aug 2026 20:22:39 +0530
Message-ID: <20260821145240.137814-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821145240.137814-1-vanusuri@mvista.com>
References: <20260821145240.137814-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 14:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243944

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-56002
[2] https://security-tracker.debian.org/tracker/CVE-2026-56002

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xorg-lib/libxfont2/CVE-2026-56002.patch   | 138 ++++++++++++++++++
 .../xorg-lib/libxfont2_2.0.7.bb               |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56002.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56002.patch b/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56002.patch
new file mode 100644
index 0000000000..b2874c7c77
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56002.patch
@@ -0,0 +1,138 @@
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
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libxfont/-/commit/b4389e0b1d84a690b819bb27b1439968811a3674]
+CVE: CVE-2026-56002
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/bitmap/pcfread.c | 59 +++++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 56 insertions(+), 3 deletions(-)
+
+diff --git a/src/bitmap/pcfread.c b/src/bitmap/pcfread.c
+index 7c2e7e1..a385331 100644
+--- a/src/bitmap/pcfread.c
++++ b/src/bitmap/pcfread.c
+@@ -532,25 +532,74 @@ pcfReadFont(FontPtr pFont, FontFilePtr file,
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
+@@ -625,6 +674,10 @@ pcfReadFont(FontPtr pFont, FontFilePtr file,
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
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
index bc6990576f..e004ac044c 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
@@ -16,6 +16,7 @@ XORG_PN = "libXfont2"
 BBCLASSEXTEND = "native"
 
 SRC_URI += "file://CVE-2026-56001.patch \
+            file://CVE-2026-56002.patch \
            "
 
 SRC_URI[sha256sum] = "8b7b82fdeba48769b69433e8e3fbb984a5f6bf368b0d5f47abeec49de3e58efb"
-- 
2.43.0


