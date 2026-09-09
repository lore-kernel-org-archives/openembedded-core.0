Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96FBC79FB5
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:11 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6444.1788939010515681758
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PDBJdrqG;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47de0093c42so5140822f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939009; x=1789543809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OrveqAv+QxJC3F62zjmWv3J1LTKtOYoS9O016HZicqI=;
        b=PDBJdrqG6HpLQYDtcZdQcE9/rgyK47jAqSGC82tJ3lH3m7QeY4CiB4sUSqorPFu6XF
         A59Bz1maThQc5ciDl79aN80xMdfoSvVFR0XqWSjwf8DFFxm3edqyBamgu6xbFmm5HZeN
         LLKPbP8om29/2U9IkVz/n3KD3WaaysqBxihWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939009; x=1789543809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OrveqAv+QxJC3F62zjmWv3J1LTKtOYoS9O016HZicqI=;
        b=g+AR/1pw4qPvsBNy6apdgd59lCqVftkRVnDLHcsma2Z4naNbzXtjr7xPdOFaAkqiR7
         g5ASgixDoyB7ewaNSqXS2jIon2vbpAL87i6uu8XMZYGv1qI5L2UOHBpEAfxgnzX+b3ZE
         cOIJfNte8gpBNYGby0wpWvoMmFsJTYKz5oXBECTp2wxMND7FOQFbll4Te7guINpYgjDA
         qF+jNm1rwLHxlohHGxGJA4uoUumzQrsQntUTCNpfDo55lxgBpv5G0DtRXl4zJi5c4BMt
         IQXgRCiDV5r8lCJKZvAF/5R/o3OrxsMMZada5WtAjqS+QGIXW+vhN+JJvgUrKm0dDYEO
         EIqg==
X-Gm-Message-State: AFuF++mb8bXmjLegVTBQsbOMzxHTrlxaaYriG8YZi+k32atQrznSyhiT
	JTQqQqPx0aMwYMu2XhqwfMcI+OtC0BEeCEeEABp/LFmFzIiPFTqcHfvFpf+fitENO8+E5zsK2Aw
	Bn2ouUVA=
X-Gm-Gg: AYBFou2YdFl4qr6Fb/nWe13vtlj7ffaIaVxOjGoq4OMWMsaq4OZco9nlPqmzknKlu55
	dgxhq9/9E9hsRVmxpR1iqBhFThTxKEH1JIj8xY0V0Q5czXYsECxjs+8Swys+RvUWBldlqLRFTmD
	N/mol50PFlRB6q2xI5WBcGXtzHXyYOvvwbGhAfmpEaX9x1ZeS/Wqp5BQWOfdBGk5vGpLHrwHtDU
	sdlff5TMPXLUZ7f/bBt1pAhYDzcUbR0EuR+NyZVhEkj4J3T/xzVmAEg+VFi8YRiIKEKraHAYMPS
	llZEf4RdlV41rl8DpzdkKbH/YGLzpYMrSGOIr526eui5YaE97jg841r1LyJf8WCE+O7+BaYcoVP
	2YpZpRvHIppn04TUaYb+0rrD0DzSO4wlFLW+MXop0uARY8CNUzAwcO4zvvyglgoNtiRGxQUJ3pQ
	P0HJRCP+x7KQzf9QEV05qv2Cf1B9FuSTtGmLRwbacbThRQpdmiuaCE2scmMn/dHzJ76coqmHoNV
	a+jp21PAmsOR6RhZkkMt7dhCY+IzDQehlv18FL6mFFsrEqKAm60NFqi8+8RNAkfU3c+cDNtDQE=
X-Received: by 2002:a05:6000:704:b0:485:8c16:5eea with SMTP id ffacd0b85a97d-4858c166202mr35355938f8f.36.1788939008573;
        Wed, 09 Sep 2026 00:30:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 22/38] libxfont: Fix CVE-2026-56001
Date: Wed,  9 Sep 2026 09:29:21 +0200
Message-ID: <cf954187d6808501f7812b22f18d240a284f05ef.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245431

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
index 9ec7cc30f58..59c489b785d 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
@@ -19,6 +19,9 @@ XORG_EXT = "tar.bz2"
 
 BBCLASSEXTEND = "native"
 
+SRC_URI += "file://CVE-2026-56001.patch \
+           "
+
 SRC_URI[sha256sum] = "1a7f7490774c87f2052d146d1e0e64518d32e6848184a18654e8d0bb57883242"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"

