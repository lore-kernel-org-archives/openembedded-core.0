Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593BFC98307
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:55 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2826.1790154706718536707
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=m0BVq6BY;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so2174865e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154705; x=1790759505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Fq83uRJeePn3LYxbdaxaHbmSs/6aOotf0a1MEkZKyYg=;
        b=m0BVq6BYitvlnIvfeOkurH2bKSC1Dl+TaH3CDxs7BWVgJ7JHnA+T56ABChVZLuAZ2p
         s+UbnAC+DYDxZkWfORAhOHFq/+Z2/h2rDJS+KJ8H10xZ/2+FjcPoZ4HkMzL73Q8hA4Vm
         ehwcDX+jOyByngNJv8AMZ6xFBvWhj5XRMosuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154705; x=1790759505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Fq83uRJeePn3LYxbdaxaHbmSs/6aOotf0a1MEkZKyYg=;
        b=qkurYU9PEm7Z+z1xE/c95wQGIzipWB6lAhKTgIeuHWkfyyTw60QP5ykZQABVisZBu/
         TP4t575cybMVN1xHrHr+ZSAY1aJzxoAW7nkMvkxCdFdKZUIT/cXZFANhNaLijubwvrKe
         pUsDKBhj4ncTcSr3nHDMWWt4BmJ/mdX0E4dCEFdfAkZK6ijEMr1TpJWycvPqoODM3Wp5
         iYqoJ1LmYgb2QRo6d68lhjqYIz8RT7wL5DHb0R/8nw+sTkEng06jDi9LbfNta+cw/eY2
         +EUueuJw1VubYHweBUqOYHJeQ5J2Jf7h6if62aPZ8+8FqHFkSk8FaKRwgrWj9cEIJ45z
         m/jg==
X-Gm-Message-State: AFuF++mG+y0zbplgMg6VjmpBk18D/frNXqeON9nPpbhbh9O6B8ZWSPba
	Fbi2gJhgCDFD2Aces/Tk28PosBmduD0NnvfSaPo8dQRdQXbWW52KVzXtJY69C7Y+Ae+Oo16ovcP
	JjWlQ5sA=
X-Gm-Gg: AYBFou0RrO83DQ68FxSANFWQT0HoFBeP9PXsA9OHeWY0U5rrfv9M3GXIz9opx7NjTg/
	uh3/hH8olv1vYuTpZEpR/h8zSEEGdQxdtrgJRZMRIB1E0WsyEy4rp57hUmecG+vyIgn8o2jIOt4
	exZBg4O1xTm0NLjCXhd821xpzp/6fzknGEhaNZv1Xr2ztHfk8l3sak/XccnD5Tq0rO43HvBycZZ
	PzDMOimRi2cgjZigQhfC6ccEwi0bn7EtzPVI8hmDSVxYWZNsKgXxW5HWT+ZdO0iKGMu84AWRCte
	IhX6ioQ3cYuTPNIrmuwelaVvRhZ+LnC2xIzVFaOH9a7ujsv9QAXHNOcDoSi3arCTv37LT3V4hJ4
	b2Elh7hlqstfsdcv3IxaVXx6VFHvodBYYk3E57vU2h+0lbZRjKxwkRNMsPgO2iv2UcXRw4Ekunc
	O97m/JahIIqJS6FV+xlggWzRMdl7pdyWzG8EWHntNaRYWpwIZ2Iug724Pd8jURr8aMCHHDenrQU
	RPs/NGOhsFKeh8K0BzUPx0iYXFQFf7Q7hbv8m0F2NJ4bzRnie7LCXjFSBiAyAbvcgPxgWlh
X-Received: by 2002:a05:600c:4745:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-49fde3601bdmr30087365e9.2.1790154704910;
        Wed, 23 Sep 2026 02:11:44 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/48] libxfont: Fix CVE-2026-56001
Date: Wed, 23 Sep 2026 11:10:26 +0200
Message-ID: <5a5af4e7c55a26951827622143831d89db2f4ad5.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246486

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-56001
[2] https://security-tracker.debian.org/tracker/CVE-2026-56001

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xorg-lib/libxfont/CVE-2026-56001.patch    | 87 +++++++++++++++++++
 .../xorg-lib/libxfont_1.5.4.bb                |  3 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch b/meta/recipes-graphics/xorg-lib/libxfont/CVE-2026-56001.patch
new file mode 100644
index 00000000000..1de7f3e0372
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
index fa6585d6dce..1173794f8d6 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
@@ -19,6 +19,9 @@ XORG_EXT = "tar.bz2"
 
 BBCLASSEXTEND = "native"
 
+SRC_URI += "file://CVE-2026-56001.patch \
+           "
+
 SRC_URI[md5sum] = "16eaf156edd79b68038b6a7c44aa9e9b"
 SRC_URI[sha256sum] = "1a7f7490774c87f2052d146d1e0e64518d32e6848184a18654e8d0bb57883242"
 

