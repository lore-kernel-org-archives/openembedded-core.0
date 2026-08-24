Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A817C5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 12:57:15 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15871.1787576228538579732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 05:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=TtbkN+O6;
 spf=pass (domain: mvista.com, ip: 209.85.216.48, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so2283100a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 05:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787576228; x=1788181028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9yIpwZ/z4RHs3mpV7iu33nvCcpJgxJSTtwnHxAine+o=;
        b=TtbkN+O65IZoDfUGBkr0RXT5Et+PIID+R2zwAuA8+K40GJ/WwF0Y5DZsfvEObmk+ta
         qwooU0S9AbTS+91zgcxZzAI2ODjcDHwcsxH7ErpnfWbzy6AqvLTWYk2gUQ2Ju15khne8
         4g1MS0tcDxWFW9i63jrrT2gKM34tItFkw4yHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576228; x=1788181028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9yIpwZ/z4RHs3mpV7iu33nvCcpJgxJSTtwnHxAine+o=;
        b=mT2qsVOkfJrWhihOAMwNFw7guyQ9y1gzLCGxrEhG1b+vtNFavGSTEETbQONQUZQCwh
         okJwh88r2kcRu/f7IPUY+3qiRtPuR8MjO943/vuKnHMZN+qJsvjb+T9Ejyo2l6umFZX3
         S9VB4cbIlNf1N8WPpnPqx4i5/lfkuccVm4L6Wz4zDcIVpL1lshnyoIfUcfT31IYb6nEH
         AH5IawR6Gn3QJ+SiPrpGxjKHhOYEIMyOZmKnrNNTsdPge0Z3p3Ck/+6xrrWOa1tCWVjg
         wHlUL8Z4A04C1flUTACEBYskLWQRNbjGdgaBwhK3/y07Kcaiqj42gYD37315FAlFAI61
         7w9Q==
X-Gm-Message-State: AFuF++mszCbNehcJ1ZezELYV2YiCLviH34RlLf+rXCcmd4iStnTGQL84
	hdGnXdNN+3hU3gQuBMx25emMdKUYw6CayaCYbAaGihbh3SwI0WeyOXPNCnrS3hP7LXgwPzZlRQC
	JdDtk
X-Gm-Gg: AR+sD11glbynldFry9DOjWGdameTe7NjQYQ5MliYDP6S1CdM6wPDMOT7SEfz1CP2K65
	jWGXSETvFTj8jJ+d4Y8pyT1+1btiMKmq/U0v9QPBCyMxrkshsiAqGtg2Q/E2MPixUiO0M6SnuX4
	nCnXOvlgo7stDDKWGBS/9U6KHzyD59S6w3TgUpglbTcI1nQD3y5Wpgtf+pqOShOYnL26DH2ZFZh
	Ay5+uGPgM3oh3RU2K4L4XoPUOyR5yK2OgaFLPhNsaLXOgrnMd6yHiQRV//Mu5+3Gng4XJQCiCHF
	pzIAT9z3CAjHPKi3xDyCIAOUWZQYn7RMj+TuV6/HZdm0CU11AwFEdtwjGr+cNeIs/8sk+Zc4TVy
	GawR9QnWGYfRYa943WUNTvrrLl/teX6R4btN+OP9F4GG9EdXUzZzdRM6MAeqIZyrnGALYJhGfq0
	fhQ8pBKY1Pw1rcU2E7BwiQ+BgKKh7kH/FS9e4I/mkPkwYwAqlq+CK/DH6IR8EEfaLGHuatPtRti
	Agg/fPhLI4hvHY=
X-Received: by 2002:a17:90b:4a0d:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-395c3376963mr43212462a91.3.1787576227663;
        Mon, 24 Aug 2026 05:57:07 -0700 (PDT)
Received: from MVIN00352.local ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860df1dcsm22623583c88.4.2026.08.24.05.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:57:06 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 2/3] libxfont2: Fix CVE-2026-56002
Date: Mon, 24 Aug 2026 18:26:52 +0530
Message-ID: <20260824125653.97525-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824125653.97525-1-vanusuri@mvista.com>
References: <20260824125653.97525-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 12:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244097

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-56002
[2] https://security-tracker.debian.org/tracker/CVE-2026-56002

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xorg-lib/libxfont2/CVE-2026-56002.patch   | 138 ++++++++++++++++++
 .../xorg-lib/libxfont2_2.0.6.bb               |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56002.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56002.patch b/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56002.patch
new file mode 100644
index 0000000000..c0fbb00862
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56002.patch
@@ -0,0 +1,138 @@
+From b4389e0b1d84a690b819bb27b1439968811a3674f Mon Sep 17 00:00:00 2001
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
+index 882318b..bcb82b8 100644
+--- a/src/bitmap/pcfread.c
++++ b/src/bitmap/pcfread.c
+@@ -531,25 +531,74 @@ pcfReadFont(FontPtr pFont, FontFilePtr file,
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
+@@ -624,6 +673,10 @@ pcfReadFont(FontPtr pFont, FontFilePtr file,
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
diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
index 1a0eb42681..29e4d3298f 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
@@ -16,6 +16,7 @@ XORG_PN = "libXfont2"
 BBCLASSEXTEND = "native"
 
 SRC_URI += "file://CVE-2026-56001.patch \
+            file://CVE-2026-56002.patch \
            "
 
 SRC_URI[sha256sum] = "74ca20017eb0fb3f56d8d5e60685f560fc85e5ff3d84c61c4cb891e40c27aef4"
-- 
2.43.0


