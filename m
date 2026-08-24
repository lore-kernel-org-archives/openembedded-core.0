Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242FAC5DF9D
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 06:50:05 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11017.1787554195816831908
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 23:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AGFW8i0q;
 spf=pass (domain: mvista.com, ip: 209.85.216.47, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-383cb94f742so3202983a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 23:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787554195; x=1788158995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKJEer1BZOi3/9xxfZtl6IFAPMkeMOGuk95foBRhYgQ=;
        b=AGFW8i0qyUim6hm99ryz/b2JhOHcazA4tJmI0y+Rg247oMWcgyAeM+LeuUh86mroLo
         mqyoF6BvjHZNOzY7iwyUS0+33Gxlmvhzfm0HLOCxWjuKcvgPNo10fuT1/YB4zVrNKP4d
         cW9NwYYQqkdlagHvKPNcvWjYBBy0tOoedS0/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787554195; x=1788158995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKJEer1BZOi3/9xxfZtl6IFAPMkeMOGuk95foBRhYgQ=;
        b=qNXNtDts1FT1rlDeiuNlXu14K9CigAntseRGLYBeaNVQmvQaEPJiFpWwcMNuL8+IS6
         FqJ7JFP/iuHWQ6FliBhgnlT0o09KhKfq4A9jomKhXTnL+OgHfIE+rb356P837YoJD/3B
         lxSUrzZIJhUR+cAiWCxZpRzIBh/1K3/w2SFlHI2W0GOoVERStRgNa4rnrANW+5/5RSP9
         BpN7g5/pp+40+Db1sxyvUijdrXHqyOuTWh2jgkaeHuTHQg1GGgCM0nE4RKmHOzOHejbB
         MqZZLbvz9QzHZJs07JVag5CwyRFfxGeFXV2q7ZkO9tYidhaUx7H9EnHrPnLDkNdYkhoH
         7flw==
X-Gm-Message-State: AFuF++kx7OFCF5/pEOL98G7RiXiHxsSunOtgZJrSj6QsZawtWp2hvThd
	7+1TjLvklqkHNFXexQZDTx0LISjq8xVK2GIb87X8L3XYNKhV34OTJlFJ7zTmZG9X7OaEdGLlKx7
	mWHhC
X-Gm-Gg: AR+sD10KzLafNRRUNXeUoiM97U/1bIrtTO4S6nJrTcfdB6QWvs4izs85lVSlARzcI+l
	e4hEE20gQEY5tD/NziuE+oE+8tIbVv7Jd1xZxKvEuVkImG2N/cQWpXWLrMyiRUny8yja8Nh7NvW
	lMBU6NJrwcn5xYouRdIWfmTJ5s8ZJ+D3s523KL+EJ7pxvEJ6eJCslhwq7ShyeMoZyfpB50BkU5S
	MOEzpNZfKO/0tEupvXl5AsxNr4dPsVgd8Z+HXJJb5Su0KFxvZtTNAYcwvAVE1WE+1kF69RbD0Q7
	fuA8ARqZZdECIKHUyTnxLQBecy4W6o6WnalxtsFZT6/1zT6IFgg5S5+f3owJofdhUK1Cwb6TB2W
	qpNrlAa4bqVAScLmob+qTh3ZwohbzkhsLgnQjm2AnZ8xdIStKT+F9pFYfq9YR4q8aFseGxucjkU
	47nnvSCRj3dt3/kQE37CxX9z8NFq1xclZ9J+JxZ5s4UYkC7TcZgu62zSAPoMUCvgSM
X-Received: by 2002:a17:90b:3883:b0:380:540:d499 with SMTP id 98e67ed59e1d1-395def03e79mr27814773a91.6.1787554195054;
        Sun, 23 Aug 2026 23:49:55 -0700 (PDT)
Received: from MVIN00352.local ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860ef75esm21780215c88.7.2026.08.23.23.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 23:49:54 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 1/3] libxfont: Fix CVE-2026-56001
Date: Mon, 24 Aug 2026 12:19:42 +0530
Message-ID: <20260824064944.29802-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244066

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-56001
[2] https://security-tracker.debian.org/tracker/CVE-2026-56001

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xorg-lib/libxfont/CVE-2026-56001.patch    | 84 +++++++++++++++++++
 .../xorg-lib/libxfont_1.5.4.bb                |  3 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch
new file mode 100644
index 0000000000..506a2dc22a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch
@@ -0,0 +1,84 @@
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
+Upstream-Status: Backport [import from debian libxfont1 1.5.2-4+deb9u1
+Upstream commit https://gitlab.freedesktop.org/xorg/lib/libxfont/-/commit/be0b08e2d354138d3222b4490e2a77c6ee42f778]
+CVE: CVE-2026-56001
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/bitmap/bitscale.c | 24 +++++++++++++++++++++---
+ 1 file changed, 21 insertions(+), 3 deletions(-)
+
+diff --git a/src/bitmap/bitscale.c b/src/bitmap/bitscale.c
+index 13ed924..c87fa96 100644
+--- a/src/bitmap/bitscale.c
++++ b/src/bitmap/bitscale.c
+@@ -38,6 +38,7 @@ from The Open Group.
+ #include <X11/fonts/bitmap.h>
+ #include <X11/fonts/fontutil.h>
+ #include <math.h>
++#include <stdint.h>
+ 
+ #ifndef MAX
+ #define   MAX(a,b)    (((a)>(b)) ? a : b)
+@@ -1459,7 +1460,7 @@ BitmapScaleBitmaps(FontPtr pf,          /* scaled font */
+ 		opci;
+     FontInfoPtr pfi;
+     int         glyph;
+-    unsigned    bytestoalloc = 0;
++    size_t      bytestoalloc = 0;
+     int		firstCol, lastCol, firstRow, lastRow;
+ 
+     double	xform[4], inv_xform[4];
+@@ -1486,8 +1487,25 @@ BitmapScaleBitmaps(FontPtr pf,          /* scaled font */
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
++	       "Error: scaled bitmap size %zu exceeds limit\n", bytestoalloc);
++       goto bail;
+     }
+ 
+     /* Do we add the font malloc stuff for VALUE ADDED ? */
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
index 9ec7cc30f5..59c489b785 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
@@ -19,6 +19,9 @@ XORG_EXT = "tar.bz2"
 
 BBCLASSEXTEND = "native"
 
+SRC_URI += "file://CVE-2026-56001.patch \
+           "
+
 SRC_URI[sha256sum] = "1a7f7490774c87f2052d146d1e0e64518d32e6848184a18654e8d0bb57883242"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.43.0


