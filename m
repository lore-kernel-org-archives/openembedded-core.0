Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CBFC624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:14:17 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9824.1788513246659915020
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 02:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=j0C/Gdsb;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d9520b9155so7266165ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 02:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788513246; x=1789118046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NcccRXowwmnU1rPmY/+Ps/CYvntu/L65eo463ydbtnQ=;
        b=j0C/GdsbcH4RsG+Z1XnXb1zzXyYt51MWmIVQZmeuKzrz+wxJ3st3B+Vte5CNhbppbg
         hSpSRGakeP5aEV+JPOJfzVJj3KbCxseoU7QF4/5U7/0ECMInLGiYy6sMqrIE94lqwREu
         7k0PFb01yHKyuM6F3H2tYE3Pf9aTLL9Ufpt8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788513246; x=1789118046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NcccRXowwmnU1rPmY/+Ps/CYvntu/L65eo463ydbtnQ=;
        b=UFI6baXS7gWBHjMpwWnIp39WKSXaWPI/seNYwiLp0FThlEeoxTO3hbsqEkoQlHJljR
         Go/FxdcZn30Bd3+oBDgwI+CR7KPg/kpwAitRavvotD5rhM7cNFCBOfiAQwRySl7QbObS
         AjjVQPtVnoHXHfKaTKoHy7GQVgxb+FvyQI1ViQ7e5fBEW0aWjCyIcew8rf1CCF+rkX2K
         nfqxeDMdxtOMZM2cm0kKFcg7j9R3oPbb6IFlaTKzfMP2Agcuf+ijd+hS2R8qt5g2s6ym
         ljFgS3pAPaswSNvxuk2ndJeYVClq8i0y2u8zQ/1n3BI5qnDsgmG+g9D81ybPNGz/qWnM
         4A7w==
X-Gm-Message-State: AFuF++l05RMiap1tP1hh0aGQpVnOV+7VNT55aWfvuYatH5Q5IWH109w3
	u9qGjGxCnUP0LhIAbca93Um9P8mFNX6j/wRBYDJwApzLAA+0msakdOde4Mijpd6SSNMLs6Jo4wc
	Ad9dc
X-Gm-Gg: AYBFou0eRO8D/evp/K/fDRo4cS6sSepAQOG/FXdL/pvoVeK7FYAvM6cdPHLYNC0USh7
	KaUXdVql5d8EmuYfHL9u3By81+qnMTS2FhyKOgTUq93vpinlPbAq5wYDAyWkKuY0CbW87DqBcQq
	Pd7WznGJasDqDyZHzQQl5bEfTIFgG406DXbvtdrTcQeBKfEU9QkMNN+BGzj9HK/P07uLRoxEUkb
	UT0Ntavp6pH1BDoEBbZv0ur+kNe0dfcHKF10KTlneTZMAP8UIUu6QXDNIxLFUa+9qxAMF2dJcUd
	l9XRtBwwyy7GoBNi39mBEWvAq9CgqUJOR7CMH55Fnfll1fRhZ52GR1du7yt4Ww5vMMp8B05fvl7
	6TTs1vKEilnixHpF15ijafyrHBL4mzz6iPfFhl+WeHPOfCuEas/W+6+akbUAcW5cVpaSeaaUHU0
	lBKKdRFFfbZ0GfqFX9SimAaZt11hmWEmJtwr410e1HlxMdgYhNruJ5378iBlumslTGzB+qWvYoJ
	ZSBW9lS2vJMNB0=
X-Received: by 2002:a17:903:198e:b0:2d9:383a:30f1 with SMTP id d9443c01a7336-2db125ce07cmr83312345ad.4.1788513246026;
        Fri, 04 Sep 2026 02:14:06 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:eea0:5fcc:f172:c715:c73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b40esm7138205ad.22.2026.09.04.02.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 02:14:04 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch v2 1/3] libxfont: Fix CVE-2026-56001
Date: Fri,  4 Sep 2026 14:43:50 +0530
Message-ID: <20260904091352.93933-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 09:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245081

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-56001
[2] https://security-tracker.debian.org/tracker/CVE-2026-56001

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xorg-lib/libxfont/CVE-2026-56001.patch    | 87 +++++++++++++++++++
 .../xorg-lib/libxfont_1.5.4.bb                |  3 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch
new file mode 100644
index 0000000000..1de7f3e037
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch
@@ -0,0 +1,87 @@
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
+Note: 'SIZE_MAX' is defined in header '<stdint.h>'. Add '#include
+<stdint.h>' to fix build failure.
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
+index 13ed924..32144d6 100644
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
++		"Error: scaled bitmap size %zu exceeds limit\n", bytestoalloc);
++	goto bail;
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


