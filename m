Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8366AC5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 12:57:05 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15868.1787576224484804418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 05:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=NkKJCzwV;
 spf=pass (domain: mvista.com, ip: 209.85.216.49, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso2437903a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 05:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787576224; x=1788181024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mo5j98CimFtAVOV1tyJHeoYmciXqqAQK2n0zcNs+2L8=;
        b=NkKJCzwVQULGMDtlgC7ge80cOmSl3CPkAXNh5DEz2fA0zDYHnq023JgnUXatXP1dWr
         V/x5fFip1hrgDoxh57B+KdGH1HL6nK8aaowwfyOODBVtHowdK59KmeFArxfz3VGN8sQE
         hQMR3BK3EvzBglBWGmTcjh24R2s3cxD5Ycb20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576224; x=1788181024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mo5j98CimFtAVOV1tyJHeoYmciXqqAQK2n0zcNs+2L8=;
        b=Qy9rakzzZdJ6q1Qm4/e2n8e/QyvEZ02wwdKPa9B8RuJ+jmlj3w8CwB4u9p0MwvrSGs
         USphBIEjwKjM4IwB4KO2Y1XcutV/BMB7gHl1uk0i+oLtvvxzB0tYEydCD6MBifho7MRH
         cX95YJN1MRhQ0Yw0u16tvMO4L3t0F4DuWnkoxXuWhzReiP42ClNJhpHAsI6IOZFbq8K6
         8vOcsaKQILupDa2MF+PFEVQ+0Sv/qBiAGBn1Pt22dLGpmejPr+PEMmhBGSDHyBQ5/w8U
         G448cwDXOUBNZExB3nLfNJq9QJ/SrP4fhgwSziX+LhgwiNBKsasQn9LW+tycbRApaCre
         l5Uw==
X-Gm-Message-State: AFuF++lTu4GMoaxkXsFsgjYLHZoWSGDCzNvAnzWWFrh0Y8v2Kob5iuQb
	J/qKNwrNXSiQnZwnY2BlFuyAY8/kJKIecFptP2c8wIZR4gKi41ax70JUbBV/AfGU97XbeueOhMr
	YoTV+
X-Gm-Gg: AR+sD102mfgYrzHuCaXPjjaYMhcwk0z1pY7nwhSdbM/0KM8dlUF9TF8HL38PmTEV8d9
	rWKImA4fXcqAz2K5HxoNCb36P33Rfuu9RzwoCEXsuhDgQ2zx7WVMTdgpuaP/kFPSntiDZTGrRx7
	T3yHZzkxP8CH43hBQUHno7W6soOasAH1XgCApmpp3zkQUoWupOCK1TLD+MhDh+VON/+4wTpOkW3
	JovTzDDfOtJRTh5jd+o4Yxas8MXl5vmRz+QulEMu+U0ZvAnQZTxypCdiy8Fp9czg+ic31KjLSl8
	QcGja15Asa5gxcFkVl4dTkZYiicm67HWI/7+F2taEBOb5sR5t3qtV0NzhsTkZkf7gODlGUZ6F2V
	1U/fZkaB1RdjAMADKrCKnqhgTDaeXc4ftJhbwHsB+6GbJ3PMsPDeYELZI/Nt+7OmeOMVWt6ZqA7
	Kb9qXkjx0a8IMC9K+mjntRweNm1uQ+/dXZGPmcjOlfMn5ap7P6GGBpWumEdswa+0o1
X-Received: by 2002:a17:90b:580f:b0:380:f389:447b with SMTP id 98e67ed59e1d1-395c386d163mr53029631a91.11.1787576223714;
        Mon, 24 Aug 2026 05:57:03 -0700 (PDT)
Received: from MVIN00352.local ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860df1dcsm22623583c88.4.2026.08.24.05.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:57:02 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 1/3] libxfont2: Fix CVE-2026-56001
Date: Mon, 24 Aug 2026 18:26:51 +0530
Message-ID: <20260824125653.97525-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 12:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244096

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-56001
[2] https://security-tracker.debian.org/tracker/CVE-2026-56001

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../xorg-lib/libxfont2/CVE-2026-56001.patch   | 75 +++++++++++++++++++
 .../xorg-lib/libxfont2_2.0.6.bb               |  3 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56001.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56001.patch b/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56001.patch
new file mode 100644
index 0000000000..831547df29
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
+index e29ba96..7100138 100644
+--- a/src/bitmap/bitscale.c
++++ b/src/bitmap/bitscale.c
+@@ -1460,7 +1460,7 @@ BitmapScaleBitmaps(FontPtr pf,          /* scaled font */
+ 		opci;
+     FontInfoPtr pfi;
+     int         glyph;
+-    unsigned    bytestoalloc = 0;
++    size_t      bytestoalloc = 0;
+     int		firstCol, lastCol, firstRow, lastRow;
+ 
+     double	xform[4], inv_xform[4];
+@@ -1487,8 +1487,25 @@ BitmapScaleBitmaps(FontPtr pf,          /* scaled font */
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
diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
index 535e7f629e..1a0eb42681 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.6.bb
@@ -15,6 +15,9 @@ XORG_PN = "libXfont2"
 
 BBCLASSEXTEND = "native"
 
+SRC_URI += "file://CVE-2026-56001.patch \
+           "
+
 SRC_URI[sha256sum] = "74ca20017eb0fb3f56d8d5e60685f560fc85e5ff3d84c61c4cb891e40c27aef4"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.43.0


