Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2205CC79F83
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:14:17 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9829.1788513252932324143
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 02:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=EicpjolZ;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d01663d816so5685795ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 02:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788513252; x=1789118052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/W/giLEX1H0um6HjVd+aiJIv1tD2m/eq9KfixhGlTlg=;
        b=EicpjolZt2ux7Wb3vgrDvej70MczdmYuyX/5mJsyib8CJnk6LziGdBtiieqSFWpgB2
         ndEKnb8u9M7FIQsSp0KheTo2kh/CC8rQz0h2PWiGWmf0Ia2pZGbgq9kalSUqFJLdqNXY
         kZ5oQ55H4fGz7DAT2jjeK2sSROCYiVsVto7U4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788513252; x=1789118052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/W/giLEX1H0um6HjVd+aiJIv1tD2m/eq9KfixhGlTlg=;
        b=kQfeCsvQrVRm37bBVVC9gkZ1cMNReqYPtZNdYlSWYk8BghG+NCsYu1cAO+JakUf+xa
         bNYXTqnc2iHmItAOP+pwmTu/mUtuoUXUD7ykRJXGa4rm9VDTCpf5CnlPtAQYZBgr7DHu
         IzxBiF+LopB1+pA1TXSu+aEbnKyW7zrCu8oxHUOhIYhHkevIzzVr5QNHdrHaFi4oR3WB
         mz/pZ2QZR71ewvmAJ7IMlvpSe3MVRzwNOJ3/l+FNihmPrFtoB0KSaVUC1XIoIQ38dbCz
         sXoCjBwwYJdFNdmJ/CpsYsm8BTe4nIYFGmav21Hk0A+I3XJHAjn14Q26bumksu+87coC
         W4Kg==
X-Gm-Message-State: AFuF++nhlf910ZxklTvRITTPNG/QAYk8j8NiTFsic6aEfc5dLYzIF/l1
	Bjs7teTLLXlBgIHxSz/AQ7r928V6Tc8p83BD07N4YdxUXaWgAidV8tTsV2Q8omSDClWPoIcd5P6
	3/RlB
X-Gm-Gg: AYBFou0RLJlztXDnSixltAqhvGky8x8q/g2gmtV0QdNYcnBRWAwBLonugXDBOHaay/9
	97ZVqy9GgTBpe77kjWLu8JujiA0q/TDRjxbeu1MxjFgxjHiGeGdxrUbzEAYFEu7nUd+ZmffPL75
	t0I1sRHHYRH/gTPbC0uuzWj6pc7n0GiGbrNM/iG+4veMv3QV5vQCiJJE3gAUv0iA4Nj4AWCo2Nm
	5pdAGmcxHnlBrXJITgmmaxr40s0LRIJCKH/A9H7VFdJBt7oJBFznIrgwgcI0ZDb32qWfNFDAIp2
	9Zhx9PBCs6tp3vN+j3vJlDyvfgUOTB68Rpi8yeuDfr5ur6enTO+fwhAajtPBonNxHXQ/FPdasXk
	WuJ1ZFD6FqZKEf94Kp7UzD+CJTKAftLUT7HMAHkBMZniD4n3hF4mjkf+Y5CwcG4rKeJ1sSOV02W
	S3V8iHJwIp5nYQDH7D0xWwa9gnf871Fxlge6fbBWzHrxVEQ9rs/+OH6rcS+HUlSUv2LkewI3eah
	u/TzkYuyxMlQg==
X-Received: by 2002:a17:902:ed8b:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2db126d8fc2mr46016015ad.12.1788513252189;
        Fri, 04 Sep 2026 02:14:12 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:eea0:5fcc:f172:c715:c73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b40esm7138205ad.22.2026.09.04.02.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:14:09 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch v2 2/3] libxfont: Fix CVE-2026-56002
Date: Fri,  4 Sep 2026 14:43:51 +0530
Message-ID: <20260904091352.93933-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904091352.93933-1-vanusuri@mvista.com>
References: <20260904091352.93933-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 09:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245082

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-56002
[2] https://security-tracker.debian.org/tracker/CVE-2026-56002

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xorg-lib/libxfont/CVE-2026-56002.patch    | 150 ++++++++++++++++++
 .../xorg-lib/libxfont_1.5.4.bb                |   1 +
 2 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56002.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56002.patch b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56002.patch
new file mode 100644
index 0000000000..cef8a06a68
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
index 59c489b785..08c96fdac8 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
@@ -20,6 +20,7 @@ XORG_EXT = "tar.bz2"
 BBCLASSEXTEND = "native"
 
 SRC_URI += "file://CVE-2026-56001.patch \
+            file://CVE-2026-56002.patch \
            "
 
 SRC_URI[sha256sum] = "1a7f7490774c87f2052d146d1e0e64518d32e6848184a18654e8d0bb57883242"
-- 
2.43.0


