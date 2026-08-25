Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FDDC5DF94
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 06:20:35 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15926.1787638830494121392
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 23:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Zb/wg9Dk;
 spf=pass (domain: mvista.com, ip: 209.85.216.48, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3964e480f76so590664a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 23:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787638830; x=1788243630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJ4xGI57ALodFvjVeEziR8lclBBpZReLYfgJmJp/w9Q=;
        b=Zb/wg9DknCRknMIJhbyVboTVuMeo3GbRSnCdQ3VBWE8mBwUEfkKzT+2QxBklYzfvQ9
         2U+KRuzKYUbnT4+viFPhCyvSIarIa9g+sy1wUc8sUrAbsg412imck9p0bDGd8hIqm4td
         ISd8bI2S1GE10XcomFwW6FeQCuM80I8p2c59Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787638830; x=1788243630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJ4xGI57ALodFvjVeEziR8lclBBpZReLYfgJmJp/w9Q=;
        b=qhGcdozlOKF9W68ZCTAERBHYzF7N4bKJU7/vJvh9jxggUbwEfMorvsCp1vmHQqb7ss
         DR35uLvmTkrpl5Z/vAdXEJSa24Fs3+20mp/vyM0bUxuM45tgUsev/ASGpMbPvq8U/QQR
         Q454eAOnNNwVPW5h/WHqiWdGqGHgyIZUluQDl9A1NJ9mg6sZUCTZsFRN26FLiPVq91f2
         T0WyFMN6XH1oNbSm4xdMHCO9xtAkshNgE/lOFBatQU/s1UB1lC/QI/YZcFQ1wUiE9gQG
         dxRLwE0ir6vCk5mB87dlfh8Z28u2nInNH6GQ69Dx9/xe3vg9mbK6V7CJTWWvz9Mo2uHP
         BaoA==
X-Gm-Message-State: AFuF++l46J/66a26C1tTlZLlVT12zTSW/8xG96V2M3IVv9oLbA9qA6fE
	dpADCOLoghkYsrxARjbwSZWqgA8Q9bwqGjUNy/9TRFT6Z+Xzwvsq79Hv1gBV475lALxMGsyZCyM
	OOHwU
X-Gm-Gg: AR+sD12vYiEeNwTMdu0cnFtTftAudJ6rHNrqOdKkQX1vE4rS2k2dYJBcxVoeBf9bkk4
	g0S1ryOZ1zuBiXvfA8er/3y9AojBl9//Aa0M+UeFs3lNMzX3qBwDzRUKsfIKWYXwMbrtzfnAA3Z
	s7s5U8u/U9zYir+NbvVwvTDAPipZw7Z2zczLMflLbWGXVZwGsYDaBFcvDs9ZrGtzY+7vEn3UbqK
	cUZbE345glFvvdxJIAhMNtFuA+5FAMxWJpOjM7NlH8Ly/klk5sZWruDbzeWrxYHI2pq1RAATLO/
	tf0GrHinGa7BhEPs4SvhWtCASPGUauB8S/Z7DYBayIGujaxp40WW4dtOJmh1q3lLy7CPngFjk5j
	qog4B7lP7kcfrVMOlv+z4BYd7mRoanK5t5YHEwmTgdrUkolG5CZFdnySumH+fPO5rzYh6OugDS9
	dT14PzNBeXbDBZ+lh/xEZhSVdZRfj9q7eaag45cQTbFBTPBbLzOXjNKtVf8vwOEiqqRC7PTwaz9
	2Dd
X-Received: by 2002:a17:90b:3949:b0:390:b41a:b92b with SMTP id 98e67ed59e1d1-3964634a8b0mr9379377a91.4.1787638829767;
        Mon, 24 Aug 2026 23:20:29 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:8284:a2bd:b8ae:b7dd:5272])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f9099ce7sm30844589eec.5.2026.08.24.23.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:20:28 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 1/3] libxfont: Fix CVE-2026-56001
Date: Tue, 25 Aug 2026 11:50:10 +0530
Message-ID: <20260825062012.39336-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 06:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244200

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
index fa6585d6dc..1173794f8d 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
@@ -19,6 +19,9 @@ XORG_EXT = "tar.bz2"
 
 BBCLASSEXTEND = "native"
 
+SRC_URI += "file://CVE-2026-56001.patch \
+           "
+
 SRC_URI[md5sum] = "16eaf156edd79b68038b6a7c44aa9e9b"
 SRC_URI[sha256sum] = "1a7f7490774c87f2052d146d1e0e64518d32e6848184a18654e8d0bb57883242"
 
-- 
2.43.0


