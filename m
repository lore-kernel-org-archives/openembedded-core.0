Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0901CA1015
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 15:18:04 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.767.1756999077705569522
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 08:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aCgIlS2r;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so763205a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 08:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756999077; x=1757603877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZzHEivAGm3pfAeeJIvpHtD2wfVRL4gocmM4/xKs2Ko=;
        b=aCgIlS2rlhPmPjER+Q2rG9z/KOCJb3JkYHNqWF2kRVXk0DsOWC3YUlGGifGA2naddX
         me9NtCQ7LF2ex3imFpP+CoJ22VONbKR2i7ltfM9rbanl7DB2zYf4IC/r8eeuGypEoHYK
         cpQqFhTYGBUYYwwQF2grDSRHqL/SnSv1i+QiSbRByAyViUQT+LuRv+C8Jx82yEF5E1L2
         JsDvYMn88NeUZSRJzlWA3E51m5yCB5+v9LEUia4V4AFLID1AV7lRIayKn1QP/9gZT2/K
         d+mvK3TQANAZ1yShq68gCBCfZ/LkBlGzj4qXApEXMvq+7llPzmAGNKDMMUb7UyQahDyt
         f5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756999077; x=1757603877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZzHEivAGm3pfAeeJIvpHtD2wfVRL4gocmM4/xKs2Ko=;
        b=IHn/uVlwHD/vQUIKbUbZ/eeby2M9HNqHFtxZ9zsJ1eVNmNBm7XWYHGRb4PcF0nOfCi
         XdoTCvBi+67ouStEp98MDYpl4ae0VxqMlVsz0+9q38AoBy3tdiaOO2Ri+lEx4YJTpOG1
         AgtUqhDOFuZFp35icBL1gsfqqzt7wE0J+JRbP8fY6f3B4DIazWg3Tlz5k+Pe1+43u0Vy
         VuDSkqDDT97b4GIR93/V82f+k2DQvnxHLfc1w0nQj8nAIxOPMGJRnZNZK1FkpnlfnqJk
         fEsv+b6skB6bwkvJ2US7kgJLh0ns2QyRh9jzkfPMFtjGKXmaqEznNJQM0RvYYvaGhYIv
         oq4w==
X-Gm-Message-State: AOJu0YxnD6AOiJeWQPcO9IJ5d1DsFHu9rVSnFr3rgz7NiD9JreDzEzYb
	9JPJ47M9ta4PAAZ7tAW7anrcoiPQenpfs0VTb0JKMAkzOO+mIH0X3FpaL2hcFchaVW7ww8JLxjm
	OD76W
X-Gm-Gg: ASbGncudDYbC7zwKJELqgUkr2FN6k/IQmbDzv1vo0tP98wJUIVoujqq7PjZGZbBj3wW
	ltxnJXoLsVXbvXK66InSTnbcmCovIJJU+AD6Od3QBwZn8PG3IsxwZAJeiUDT6XyyOCItSHLEo6H
	8EK2pAmooizn2Q/WLam4XUabaiYNUYWhKtal+T0C2lJwuWa7GDz8ucrsyTVr4bfhVzl9qlCvgtu
	KEYM5SU10HeyZeOp5j06OlssLPkyDTZPNO5xPBXfJYTWUJmvffeFwfEzQi6e+cwflDwq59vw7V6
	mC49pG+5Aw4fJmCatVRcP7vLDVAxjiT24KZIpaQMn2yVlFzppqyiToCymJAGXKxMiL92oIFVxNb
	1eUcyPlo5AZXg6g==
X-Google-Smtp-Source: AGHT+IFM5C9Lp/cKY77SeAQo9rqrewlRmLl1vq8l2zL8/vUOLxs+3b2oNMG0Tvqipo9cFpPBfO4UPQ==
X-Received: by 2002:a17:903:138a:b0:24c:a9c6:d193 with SMTP id d9443c01a7336-24ca9c6d532mr76886895ad.18.1756999076834;
        Thu, 04 Sep 2025 08:17:56 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:89a7:8cc5:2043:ebe6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b0637d948sm84720845ad.30.2025.09.04.08.17.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:17:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 3/6] tiff: fix CVE-2025-8534
Date: Thu,  4 Sep 2025 08:17:41 -0700
Message-ID: <6db99609f8aeca660fa01fc9e32008a2e37aae03.1756998900.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756998900.git.steve@sakoman.com>
References: <cover.1756998900.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 15:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222951

From: Yogita Urade <yogita.urade@windriver.com>

A vulnerability classified as problematic was found in libtiff
4.6.0. This vulnerability affects the function PS_Lvl2page of
the file tools/tiff2ps.c of the component tiff2ps. The
manipulation leads to null pointer dereference. It is possible
to launch the attack on the local host. The complexity of an
attack is rather high. The exploitation appears to be difficult.
The exploit has been disclosed to the public and may be used.
The name of the patch is 6ba36f159fd396ad11bf6b7874554197736ecc8b.
It is recommended to apply a patch to fix this issue. One of the
maintainers explains, that "[t]his error only occurs if
DEFER_STRILE_LOAD (defer-strile-load:BOOL=ON) or TIFFOpen( .. "rD")
option is used."

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-8534

Upstream patch:
https://gitlab.com/libtiff/libtiff/-/commit/6ba36f159fd396ad11bf6b7874554197736ecc8b

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2025-8534.patch          | 62 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.7.0.bb |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch
new file mode 100644
index 0000000000..b3bc0e0d94
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8534.patch
@@ -0,0 +1,62 @@
+From 6ba36f159fd396ad11bf6b7874554197736ecc8b Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Sat, 2 Aug 2025 18:55:54 +0200
+Subject: [PATCH] tiff2ps: check return of TIFFGetFiled() for 
+ TIFFTAG_STRIPBYTECOUNTS and TIFFTAG_TILEBYTECOUNTS to avoid NULL pointer 
+ dereference.
+
+Closes #718
+
+CVE: CVE-2025-8534
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/6ba36f159fd396ad11bf6b7874554197736ecc8b]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ tools/tiff2ps.c | 20 +++++++++++++++++---
+ 1 file changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/tools/tiff2ps.c b/tools/tiff2ps.c
+index e5425bf..5c54205 100644
+--- a/tools/tiff2ps.c
++++ b/tools/tiff2ps.c
+@@ -2432,12 +2432,22 @@ int PS_Lvl2page(FILE *fd, TIFF *tif, uint32_t w, uint32_t h)
+     if (tiled_image)
+     {
+         num_chunks = TIFFNumberOfTiles(tif);
+-        TIFFGetField(tif, TIFFTAG_TILEBYTECOUNTS, &bc);
++        if (!TIFFGetField(tif, TIFFTAG_TILEBYTECOUNTS, &bc))
++        {
++            TIFFError(filename,
++                      "Can't read bytecounts of tiles at PS_Lvl2page()");
++            return (FALSE);
++        }
+     }
+     else
+     {
+         num_chunks = TIFFNumberOfStrips(tif);
+-        TIFFGetField(tif, TIFFTAG_STRIPBYTECOUNTS, &bc);
++        if (!TIFFGetField(tif, TIFFTAG_STRIPBYTECOUNTS, &bc))
++        {
++            TIFFError(filename,
++                      "Can't read bytecounts of strips at PS_Lvl2page()");
++            return (FALSE);
++        }
+     }
+ 
+     if (use_rawdata)
+@@ -3107,7 +3117,11 @@ void PSRawDataBW(FILE *fd, TIFF *tif, uint32_t w, uint32_t h)
+     (void)w;
+     (void)h;
+     TIFFGetFieldDefaulted(tif, TIFFTAG_FILLORDER, &fillorder);
+-    TIFFGetField(tif, TIFFTAG_STRIPBYTECOUNTS, &bc);
++    if (!TIFFGetField(tif, TIFFTAG_STRIPBYTECOUNTS, &bc))
++    {
++        TIFFError(filename, "Can't read bytecounts of strips at PSRawDataBW()");
++        return;
++    }
+ 
+     /*
+      * Find largest strip:
+-- 
+2.40.0
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
index 26e3811ff8..2155ac8df4 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
 	   file://CVE-2025-8176_3.patch \
 	   file://CVE-2025-8177_1.patch \
 	   file://CVE-2025-8177_2.patch \
+           file://CVE-2025-8534.patch \
 	   "
 
 SRC_URI[sha256sum] = "67160e3457365ab96c5b3286a0903aa6e78bdc44c4bc737d2e486bcecb6ba976"
-- 
2.43.0


