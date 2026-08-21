Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CF8C5DF89
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 14:52:55 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9179.1787323974264845285
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 07:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AVv55lsJ;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84faf0fa17eso1024476b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 07:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787323973; x=1787928773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G08mCVh+i3ESNLtwlP3IFoe0N/s6HvPznGBFt9B25Ec=;
        b=AVv55lsJUXrAa9Z56KMwGXhO0o7+dfStZ8s1meWvTb66cqLnZ/u95yLb1mm21xzjxb
         n0YvF5bmxt9rliZGmsE4Kxg7uf4/T3IV3OquPxvtV7ZIEO1lPnfBAEvF5ZSgaWdrezjZ
         6HVNykT/ctN+mtq8/AfRFlbHgLPPODx/o2iSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787323973; x=1787928773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G08mCVh+i3ESNLtwlP3IFoe0N/s6HvPznGBFt9B25Ec=;
        b=R1Eqg4sseSgtEQaGtrmWn2YLekuUBv6v843Zg7/bWP0fB0q185ZdrZHLnL+IJxFvPy
         U8FqGYRwdwUcAdap9fwbCGmG8WPaQbdMErYH0rUPhhExPnKW8nNjJBSSr5afuc+qSexq
         zf/CtFPXhQK4VSKglrOZYa/z4z2ba/ZfbAfNcQePLROWc/52rKzF43f5rmkC5N0cSKKT
         yuluFfA4VE73rbPR9e/7ceb2bO8SkFVjgaGpunlYrT3Xd7i/aCXdnd0GQCwhsJFQeZrZ
         ZdQ2hOlRmnJP3oNQgT0CEXpoW0CqhWZckJuv5GB8tFUQVh05pMg9eIwfRo12d79eDqFY
         W8HA==
X-Gm-Message-State: AOJu0YwfYiQ7dwGWRmgB8TCdiCo+Zr2U7ir4NWPyRetFCJu+CV9FCDdo
	NWDoXCK4C1VzCeWXgj52TQaAlvLhxfEK5PY3eH5HH3KKCSQlD7JBpTHkVeJ4Jpqvst/1BYyCXGy
	xlskt
X-Gm-Gg: AR+sD13QeC/zXIkbc2VgLoNb7n7uL34AMls4TqW+ViURzWjbWb2pOQQ+fuMgtLKIzDQ
	njTXrdNkv0secLW5YVuZca42QLkUGaOYqsPxZNemHkdCA++bb8YVAbSob3eU/OGAw8Ama7UB4uF
	wwKQvIkH9Jh4wlpj58DAOswHyjEQ0jKAkpMIAscW0Tt2dqlPLHsbAdJvNWMyrpYqRwv0cIT5POT
	4SignTTMv5r1h6/jN7JxK9JZeg3I8k7ffchw30JqHx8lWXhV2GBpjs1uHCqtVq+3nH0OmLzrpUe
	knGpmzuqKid0xd2c8/UvmtiiFc/ZplGjAMinBzp0+2XH3hhxGiM0BOg/vQR6t2HnTwbXocGPV+7
	yHN8+JUUfig5z65FJsVWe73yVBUanRGzZZB/PD6O0wJQxQkrDZv8maZQBwe4n27nsatXumgDi3a
	ojrdTBu2VlwruiInyfHO73zlw/fWlU6h4xegDRgC7qstAbEb7TMTcrYxQpGqEj3bvP+2Z8ZulsX
	mhv
X-Received: by 2002:a05:6a21:398f:b0:3cc:927e:354c with SMTP id adf61e73a8af0-3cd2ff856eemr14096565637.9.1787323973542;
        Fri, 21 Aug 2026 07:52:53 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:8284:9dd5:5a04:5eb2:4372])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef6ec40sm29820194eec.7.2026.08.21.07.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:52:52 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 1/3] libxfont2: Fix CVE-2026-56001
Date: Fri, 21 Aug 2026 20:22:38 +0530
Message-ID: <20260821145240.137814-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 14:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243943

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-56001
[2] https://security-tracker.debian.org/tracker/CVE-2026-56001

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xorg-lib/libxfont2/CVE-2026-56001.patch   | 75 +++++++++++++++++++
 .../xorg-lib/libxfont2_2.0.7.bb               |  3 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56001.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56001.patch b/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56001.patch
new file mode 100644
index 0000000000..58a1881442
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
+index 3f3c10e..5f465d1 100644
+--- a/src/bitmap/bitscale.c
++++ b/src/bitmap/bitscale.c
+@@ -1456,7 +1456,7 @@ BitmapScaleBitmaps(FontPtr pf,          /* scaled font */
+ 		opci;
+     FontInfoPtr pfi;
+     int         glyph;
+-    unsigned    bytestoalloc = 0;
++    size_t      bytestoalloc = 0;
+     int		firstCol, lastCol, firstRow, lastRow;
+ 
+     double	xform[4], inv_xform[4];
+@@ -1483,8 +1483,25 @@ BitmapScaleBitmaps(FontPtr pf,          /* scaled font */
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
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
index bf49d728b9..bc6990576f 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
@@ -15,6 +15,9 @@ XORG_PN = "libXfont2"
 
 BBCLASSEXTEND = "native"
 
+SRC_URI += "file://CVE-2026-56001.patch \
+           "
+
 SRC_URI[sha256sum] = "8b7b82fdeba48769b69433e8e3fbb984a5f6bf368b0d5f47abeec49de3e58efb"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.43.0


