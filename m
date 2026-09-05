Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB28CC79FAB
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:25 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2483.1788641124383408759
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OHbkKHim;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482e4998d28so1639603f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641123; x=1789245923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vtbwRHNefZ/g8bc7f3MjPzhux7YspU8IbHzmEaFLDZ0=;
        b=OHbkKHimNCPCgoliH1G/FAITacIIBI0Huf4jbHLC9IYzZ+JKrHtX75gFY7exNxzLzq
         8z5/uA013+cWJuJWMfYSgvkHkA9rxTyzUIx0AcbWqUk7jzwmZ4TaiZQwawrbL0Xq726M
         1FH3dc5a+XCwuoq3NiFpYzUaJXMd7lDxZHnX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641123; x=1789245923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vtbwRHNefZ/g8bc7f3MjPzhux7YspU8IbHzmEaFLDZ0=;
        b=SWosW8GaknZnElB1tzkOv22NDo2+m6ydv/H93NmPD3q6Zbm9Avp0L4xtSH2ROnvw67
         n0LDYrEY5oI8oWxOXvy0o3BZh0dSlr+JDtEVhBeHHHNgw57yd9oKTeLmt3l2tBRNUMrg
         qlFfqzfpFiiPh+6TNW0MVP/KwnwK9FJjP0PKUI8N9EWybQ+I6sxsBipHSHtS6JCoRrNp
         4vf/YzpIryc8WtqF6NV3CCqr/J3r8bG/PVPMXWnPCsP/T2wDsE7x9EIPbt5YajnIOMLc
         i/1XncgRxhOviQ6OJrmRxTu3aEPwS60+SceKCnOhQOTmlFobKu5nwUDHdX+8NJQnQroQ
         Zg4g==
X-Gm-Message-State: AFuF++lojGQTfyScVb9CmhdVIhOxpvG4DFx6chZAafDSwzDDssWJXc4i
	32vQyS5l172ZNiNfuWJaYJQPvaXARPPeOZvpTptgVWpt/+zHzrYqwUuI9JAkm3HeoOeEMCldl/c
	ebpAdqYY=
X-Gm-Gg: AYBFou30sZ8/VAcK+0wLyxXZQqdZXqEX9U0j614/kGzv/w+b6BDFxoV/HF69OB3VRuQ
	0JcvGRnCUnzVI/2/3uEHhX2YmHhAxzxQI849V/vb9IYicBEJ+ehmadEYjTi/pBxTZUDybQuImxa
	SqXfBS8Xcr/bpQSSSGvMp9ilCPzYrbM9spe2nYTdNneyoJ1QVK5aZ4wdsbzVJRDa+ERj1tUCnbI
	Cr2IgWCavFzlhzDCwgGyIwQmb/cA9uL6VbWpPOtsemP5QTW8wz14EbbLPRbDeKKKhxC2HM2rskK
	HE+GtzORrvF2baE2jqDkVJ5TEyD70BUmWC+V9madZR+scTAP0Ns6empB+uVgAvgkWNx8I08aoqL
	pkIbSD0QiKZJTA3H26WoQuh/7fpkWzfU6JoUNenxv9VqxZpMFUsVwo6j2G3JU9mjWEnou04g8Re
	A975om6k46uyKwuI7SaQ++ilqthpYWsT5IB36c8GhuHum4x05dpDVEajgO+JzopWAVGoOgkNXZ4
	cQ0LMSn6J0IMcssMZt675WACO+xOL5lercLwJlxVNHysBa6y8UGXzMYJV2n3xRXmPpDxo2nmMvF
X-Received: by 2002:a05:6000:25fe:b0:485:8cb8:b838 with SMTP id ffacd0b85a97d-4858cb8b900mr9651586f8f.7.1788641122609;
        Sat, 05 Sep 2026 13:45:22 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 21/40] libxfont2: Fix CVE-2026-56001
Date: Sat,  5 Sep 2026 22:44:22 +0200
Message-ID: <5d9fe1c8aa1c403701ca029e9c89286a10131651.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245173

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-56001
[2] https://security-tracker.debian.org/tracker/CVE-2026-56001

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xorg-lib/libxfont2/CVE-2026-56001.patch   | 75 +++++++++++++++++++
 .../xorg-lib/libxfont2_2.0.7.bb               |  3 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56001.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56001.patch b/meta/recipes-graphics/xorg-lib/libxfont2/CVE-2026-56001.patch
new file mode 100644
index 00000000000..58a1881442c
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
index bf49d728b92..bc6990576fd 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
@@ -15,6 +15,9 @@ XORG_PN = "libXfont2"
 
 BBCLASSEXTEND = "native"
 
+SRC_URI += "file://CVE-2026-56001.patch \
+           "
+
 SRC_URI[sha256sum] = "8b7b82fdeba48769b69433e8e3fbb984a5f6bf368b0d5f47abeec49de3e58efb"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"

