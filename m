Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71995CCA472
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 16:48:13 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.908.1759510083624125140
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 09:48:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=l975TZZ6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-27edcbcd158so32267695ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 09:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759510083; x=1760114883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/RYGFvguZj0l5FdcFPbWR9F9XJzUBq8kJskSbYtiq4=;
        b=l975TZZ6uhInVaQ49hrOClN4F6GYa84XPUzt70BvB/Xr1JHO/1K/5+ylkcLWpln7FZ
         I9NhAtbBJbuTjNgI0EGyR9OgM1LmOi4E7630ceq1AJ9Q5+6pEbB5nt68k0AcGoKuDLYv
         mPgH0Nctwsyzh9J8LjN5z9Mk34mx5F5aouKCmU4OcybpeICkmRqz2J9MkguLR+suqVYO
         uAWceN3sh52NxZbWc9R2spJwcY3qs0spOeIlKfBKNtu+zUlI87rIZqa9thgpOPv0V+NK
         y8ErD/zwzIpzXyw6ADWeW1YUxlmJuFWVFbWy3EDxVjGRdkWdRPT/TUV2yX9IjMX6sh3i
         YGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759510083; x=1760114883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/RYGFvguZj0l5FdcFPbWR9F9XJzUBq8kJskSbYtiq4=;
        b=qm/4Q6nwE3sxZvmvXhZ2kqPYRYkGrzpdPP0gi0i/ADQekXA6ru3pR9CxmdRncFx547
         cHvJjbo5TXFtmzUgNbPBB0B0kGpSOP98032S+8I6XflD/5hpkF16X5FV2yW3HwmrZgV5
         XPemLlZv/j0LH9xEWUXyY49BMSI9IwTtF97kQo9+/FAwx2CLAp4VoMYjnIopK5RuqhSq
         mq7Hq4YPbi1gG5KptEQ3ce1EFYa+jmURWn9u9k/j2UE1JZGW+9IpzssTNl5bQXxGLHxB
         Z7WCu1MiCivx9dVdidsFMLQe2FdDgX3IFhha8pCGSp7hq/q45E8C0MBAt/Rk+h9anxSN
         /GlQ==
X-Gm-Message-State: AOJu0YyAVfncq/9k/iSoGD4pwBeJxu3t5I7f31D7pBkEkPcJXPQW6z35
	st2osLv+1YS3Sk6JhsJBmJA0thZoe0dxHjK/O5w+fBcoVAO8DH9RwqN4hZh2fz3sQ2cfSEfPC9g
	+A+au
X-Gm-Gg: ASbGncu57iAj8xpM/tbZL2FWzE7fZcRp64DwIP700mTiCJSHd5bjyMgn5JzX71tGWu/
	B7pZ90loo9p1eMruA22UN4vvNbf0RTEIikGX223eh5sBR1RPNl90ACGPA2wLzRP4pmMiL+eTHrr
	fedPCqBuF4LmcbXhG3/ywbq+SGDIaS1no6juyOXmW2RyKM0UFYsmeSUXXi/hyP67eD/RdBILiMa
	GsV8EA+//LLpSty1TsrFwD+fAHo6fLW8p9K2F4sxL02VN/BG0bczJD9KHYA8dbJFk/18f0YryIw
	2tgNhQkqWvOc5eH95tkM7AefRp5/NAeWi8kC6AB2w6OrppLRQ0y/rdaTDGq0BtgO7OfMMAC5th5
	GLJK0rcj2yOgRbdWjfXAbNzZgaK9ooccWkLLXCTtQwIp7Pb3n
X-Google-Smtp-Source: AGHT+IFfY1BTQ5sE2WSe3V+Uk6NHHYzEjFI1HwuPhRsdEvrj3460XeXkIQkgPh/ugnEYsiNdtdXsvQ==
X-Received: by 2002:a17:903:38d0:b0:262:d081:96c with SMTP id d9443c01a7336-28e9a546837mr47797905ad.17.1759510082832;
        Fri, 03 Oct 2025 09:48:02 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5bdb:26c8:eafe:889c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d568bsm54352445ad.100.2025.10.03.09.48.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 09:48:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/8] tiff: fix CVE-2025-9900
Date: Fri,  3 Oct 2025 09:47:47 -0700
Message-ID: <c1303b8eb4e85a031a175867361876a256bfb763.1759509931.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759509931.git.steve@sakoman.com>
References: <cover.1759509931.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 16:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224403

From: Yogita Urade <yogita.urade@windriver.com>

A flaw was found in Libtiff. This vulnerability is a "write-what-where"
condition, triggered when the library processes a specially crafted TIFF
image file.[EOL][EOL]By providing an abnormally large image height value
in the file's metadata, an attacker can trick the library into writing
attacker-controlled color data to an arbitrary memory location. This
memory corruption can be exploited to cause a denial of service (application
crash) or to achieve arbitrary code execution with the permissions of the user.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-9900

Upstream patch:
https://gitlab.com/libtiff/libtiff/-/commit/3e0dcf0ec651638b2bd849b2e6f3124b36890d99

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2025-9900.patch          | 54 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-9900.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-9900.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-9900.patch
new file mode 100644
index 0000000000..97858163e2
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-9900.patch
@@ -0,0 +1,54 @@
+From 3e0dcf0ec651638b2bd849b2e6f3124b36890d99 Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Wed, 11 Jun 2025 19:45:19 +0000
+Subject: [PATCH] tif_getimage.c: Fix buffer underflow crash for less raster
+ rows at TIFFReadRGBAImageOriented()
+
+CVE: CVE-2025-9900
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/3e0dcf0ec651638b2bd849b2e6f3124b36890d99]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ libtiff/tif_getimage.c | 20 +++++++++++++++++---
+ 1 file changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index 3c9fc4f..fc8b22e 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -600,6 +600,22 @@ int TIFFRGBAImageGet(TIFFRGBAImage *img, uint32_t *raster, uint32_t w,
+             "No \"put\" routine setupl; probably can not handle image format");
+         return (0);
+     }
++    /* Verify raster width and height against image width and height. */
++    if (h > img->height)
++    {
++        /* Adapt parameters to read only available lines and put image at
++         * the bottom of the raster. */
++        raster += (size_t)(h - img->height) * w;
++        h = img->height;
++    }
++    if (w > img->width)
++    {
++        TIFFWarningExtR(img->tif, TIFFFileName(img->tif),
++                        "Raster width of %d shall not be larger than image "
++                        "width of %d -> raster width adapted for reading",
++                        w, img->width);
++        w = img->width;
++    }
+     return (*img->get)(img, raster, w, h);
+ }
+
+@@ -617,9 +633,7 @@ int TIFFReadRGBAImageOriented(TIFF *tif, uint32_t rwidth, uint32_t rheight,
+     if (TIFFRGBAImageOK(tif, emsg) && TIFFRGBAImageBegin(&img, tif, stop, emsg))
+     {
+         img.req_orientation = (uint16_t)orientation;
+-        /* XXX verify rwidth and rheight against width and height */
+-        ok = TIFFRGBAImageGet(&img, raster + (rheight - img.height) * rwidth,
+-                              rwidth, img.height);
++        ok = TIFFRGBAImageGet(&img, raster, rwidth, rheight);
+         TIFFRGBAImageEnd(&img);
+     }
+     else
+--
+2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
index 6bf7010ba2..1d3d08ff9d 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-52355-0002.patch \
            file://CVE-2023-52356.patch \
            file://CVE-2024-7006.patch \
+           file://CVE-2025-9900.patch \
            "
 
 SRC_URI[sha256sum] = "88b3979e6d5c7e32b50d7ec72fb15af724f6ab2cbf7e10880c360a77e4b5d99a"
-- 
2.43.0


