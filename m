Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAE4C88E53
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 11:44:52 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5176.1789213490975424493
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2026 04:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=eQWdDzFf;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso18010595ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 04:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789213490; x=1789818290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NcccRXowwmnU1rPmY/+Ps/CYvntu/L65eo463ydbtnQ=;
        b=eQWdDzFfUunOZw6k5lLPXRC/OGYJPCHh1JTVm7EqbrgzAkbyqLcTVatCqm0NUnYtwD
         6qly74pWIhGwMssmU8aYZyH33O7bUJR0lCj2VxajDnRYlbCfKA9Bw8U7kSAzOZHkgPY+
         pZzkPoqGY7xKaCVMI6f+FfzjWmry+XgiG5Fk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789213490; x=1789818290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NcccRXowwmnU1rPmY/+Ps/CYvntu/L65eo463ydbtnQ=;
        b=OaawDE8rRK66/n4MtL5voCW47WcvS/eYRZ+s/FtDmFYNhRpQZfWRB3KZVBI2Wd1fuL
         88OFP50agYPEmRF4EJ7R9SWFuCTTbcXRKsQGFACRV8mztIW1kunWLCcDlIWDmpa9dxBh
         ca6IOXtCkfvVaROuAyJzCKJInRxuLEML/TQdky9I8Ls8Z5DKBEYrJKaeotsjfBkCam7V
         VkGreYxeHIbJcZfkijlLGnDSW+vSojuT1BEbfatsxqH9mAB1BeSQbmbWkFB333ul2U4R
         ZKO/JR9GMG6IM4PrwH82ZtBJVaQPWDa9jPz4sJCNQTRsY749+QnGXmHMMV59CCrzeoTN
         /Wtg==
X-Gm-Message-State: AFuF++kmljsHuArGLjDAvKH6FojjclXx1XbGgVMSDbb8v9tWNNR+6obp
	jsxoKAES5i2/96FYY2vZ3T7FOflQ5P3BZU+7tyR7MITK0LmNCyDoOgWjCQurPaZ3EMkIdl0BXUc
	sqKbl
X-Gm-Gg: AYBFou0K4qDn7fiAJI4vHaS2D6vvNOrkfT+pwL2WpPM6zTLDyVgGTwR2a6QedhQjvQ4
	uDZM61E6mvqaJHcdqGdP6KoK1NayeEr3fY3GGGloSfrXbfmoSuWb23mVXZ9KBeJdL0U3nXo/MDZ
	5XZEQvL488as/UCoeKsN8j2Out+ke+S1eyYmFViqjH6NsLd3PbnxBXOLg4tzFy0eWii+T724qJ1
	Hu09ypkYwgLy67R11carma26nqXlwkIUZgVICGn2b5ERzWgYAz5xW8SQokTaRdgLFx8ejjrQNvy
	7UEUShU2Z80Vz8qm9E8BZiPOXEWDyb/c1ii+MgWuPhS/awG0ic9t1o5iDVoQBXWoXSwJIkRR0Ay
	182lZxGrsHongGqSyktAkCSBZtsPu19TPsmRff11SSoUcWAc5KfrnoitVDMtsKgSXZgPeLojtV1
	KEDmzAX+Clh7Hkz8pgqShBSi1z4oRPRoB2+Gw/AQylkxkDIbaV9kwvjnnmuJEfDXFg7ULw7LS7+
	bi2EvmRHYAUAw==
X-Received: by 2002:a17:902:ecd2:b0:2db:5ea1:8b04 with SMTP id d9443c01a7336-2dd2a1c3e4fmr144802025ad.5.1789213490270;
        Sat, 12 Sep 2026 04:44:50 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:2919:ff34:c674:1b5:9893])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed295esm15044987eec.15.2026.09.12.04.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 04:44:49 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch v2 2/4] libxfont: Fix CVE-2026-56001
Date: Sat, 12 Sep 2026 17:14:28 +0530
Message-ID: <20260912114431.357816-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912114431.357816-1-vanusuri@mvista.com>
References: <20260912114431.357816-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 11:44:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245697

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


