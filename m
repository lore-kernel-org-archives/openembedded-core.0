Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7681FC88E59
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 11:45:02 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5081.1789213495933145318
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2026 04:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GZ5Rt1lJ;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2db3305f94fso26262905ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 04:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789213495; x=1789818295; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/W/giLEX1H0um6HjVd+aiJIv1tD2m/eq9KfixhGlTlg=;
        b=GZ5Rt1lJV+I/9t0OuXXr+7fiIiDJbirHNDpPJtcI6VWTSE3BaZI5p/k3qv6i4jHI1o
         SDxg6F+O1S/kgrDj/NUaP7QqDU38SLGpkyy/FoYMkBhSM5F63C7fVHICyo5yDN+hh/pt
         q9o2KsXpeFsGrMHFOkhMT64/FtLumjPW7JeNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789213495; x=1789818295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/W/giLEX1H0um6HjVd+aiJIv1tD2m/eq9KfixhGlTlg=;
        b=PCiPQ9rnL13tRrTYZzWwrKrNBKcS+nonb9kZPEoGuFYxB6ska7QuoRxJzz/sgeiFyN
         SocgptnuFZUqffm+LaParnYGHDNRU5I24pgeJQE87p8AnmHHktkIEIPdC7P9v0Hsbran
         neNVtONo4UoRg2xLBeqRnZ4AZrejrCns3UvmS/2oHzVLXNoZh+Amr4mxJZH9nL7O4Atl
         BVOkBWCuFMC4n2qtpn/8bf3Nz/QNJc+MY6+4kfRxkMdEW6cszC2n3rwDTLxuXH0EcfJU
         ZohPdbwocGvIUJnqyLShFH5quoTQMbjqi8nXbI2I94Qqmn9JTOu7ZS+6f+b3lWIjNae+
         9zVA==
X-Gm-Message-State: AFuF++m4qCvpwKecU50Knb6SHPjQZtcO9QI7ThYi0FLPHm3N599H3ZB2
	Kos+O0hSnJsK3XouyIO7bBmBqtuJQoMS6ua6mFf3qdrzCw3dL6l79PnsKUgM2Ee4l60CAfE1Mxo
	YNvON
X-Gm-Gg: AYBFou3ZlnY4Y0OeYnzMM+NdzOtSvZoBfUJcABbdGZlhr/qrjO3rSWv21U4ZdqMq59Z
	sUvxzjdcyBionIJ9n552/mwpWu3otjAj19l3wWJGR3mwgLBmzhtrlI3d+dbBtwHtKtijiPFZgvD
	rrDBQwjvQcBQs5bQa0hAP3zWm+fDtMR61LskK1MDcxp3NA0wEoWHBgEMTl5JoeDlsIdxu85QIvv
	uWmCIEP7aIu+olWqphGMatUZY2NR8EcneJdqH07ylA4iayNNoYpt5KWMH7bwc/9dt7oYG/6lQPb
	EyO0mpfgcTfQgekEWh/M1GApsWxy90ydb1hZ5z11v2lHMV8Gj54k8nTCkWXz8MkABQ02SYyndlp
	CbJSLkKzqvrWXquXU8mK1s9VCAklXKQVUmWCYpQxJ4CzZs5kvu4R6K19auSWMIbeJRc65EkTUJ+
	F7xTwLFcx5lYCXoxbSvdO/tokadaccBVM7BIz7UYxT5GVyA95Jx1tNI7ZSvDngf+fLHNcMsRC7O
	akcOYWK9O06ug==
X-Received: by 2002:a17:90b:17c9:b0:396:5f7f:52f5 with SMTP id 98e67ed59e1d1-39d9bbea1c6mr13357668a91.3.1789213495183;
        Sat, 12 Sep 2026 04:44:55 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:2919:ff34:c674:1b5:9893])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed295esm15044987eec.15.2026.09.12.04.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 04:44:54 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch v2 3/4] libxfont: Fix CVE-2026-56002
Date: Sat, 12 Sep 2026 17:14:29 +0530
Message-ID: <20260912114431.357816-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912114431.357816-1-vanusuri@mvista.com>
References: <20260912114431.357816-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 11:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245698

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


