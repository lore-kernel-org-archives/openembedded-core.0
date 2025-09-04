Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92BDCA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 15:18:04 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.848.1756999074832214492
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 08:17:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=w/OP5kRj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7728a8862ccso1264776b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756999074; x=1757603874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WHXBDz9nALFfEXAyLlmwq8RBfxqj8WGqn8eZRZS2XUM=;
        b=w/OP5kRjmCcdtsUl/qGDgQaUSzv4Nm6OYEUazBvBrlH7K11EJbihVMBfcbC7y2vbsK
         lwuV3kBbBkIPOiWN6sDecDFOrSxlZ8aelC+ARAd400hkbjw5RWAmbXCfI4TVvUecQb9S
         98axx91j+OQuR2H6hzUxw58Aysst20gpynWPe/ifnqkre6RNWfUR0eI1kbuQdmEr6IoC
         cCdPbtXIXkWZyjj4d7krbzpH1DRNaiXFShOM4Bmk8nY9odeVtuqIk8J9J2/wmH/3C+Tx
         f5SfOV2ci2w2lBxjfJoZYX4Cs4HO7g5NFo29s9miH9abCEclsBGos+dJo0tPXJLJ5A8Z
         ErGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756999074; x=1757603874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHXBDz9nALFfEXAyLlmwq8RBfxqj8WGqn8eZRZS2XUM=;
        b=X5C7B7zFCCHf2J107pUKqqwWqElGlCfusZz9GuAREOz/LJkctCjxoDitfvGl82bJKT
         WnIRyBiiVViXMV/xHedBioledNmZIPSEi2CJwPY7NtrYD1SBr2kSYQdOglgp0nA0rlbV
         1T0XqH33erV/z209x1lD64ZSmFhWNpyRbyOT7sRl8PRlIljRuYVu4ryTwo5ZUaDBUgue
         ODZy7FH4vNhi470cbyZouh/xDSpRaAzxZ01fKGU6kctB/ZE0VHAmmI1R075s5LxbmkR8
         eLRFBffE1z2t2kUUugKE4E89sNzOkL5jDibMpLL9d1gMcaIiEy7GWkTk9rZGGse+RpAX
         F9Pg==
X-Gm-Message-State: AOJu0Yy9qTQ9hTiu7zWRswd/dCDzSl5sLlNpHKVC3Zb4CErlOU9ZsAMn
	NLiqGBLhmg7Ygvq6zCBPBifTu3FxRvavZQpFgpNAsWcBjTdF0OKtv3BwqhPWA+JczcYAawP4dXM
	RwPcr
X-Gm-Gg: ASbGncsY71cOdkU8MNIkfWdpveLO/jhLOnAD7+i2vSGr0AYYMdiyS91+MVY2C/GvR/H
	vGbJwOyCqaeaUoPXJnOKPTUvFXwONITFMZ4vKoZPtuIbouQlNPNrEt+KbynLWcv3Bt8hV0aTVkZ
	iM9qbiBoyTZzvVMQIpufsfIg2If+nQE247NibM1+jppyATT4RyFrykttcQj9kNMwDtRh0j2ElRl
	sZCaRcu7Lq2rMD2cDJxW6N6YJ9b6XnFFOmWq/hdOhRKO1EUAvDmbD8PJahQOKmtY20SRwWIfD6a
	MCbd4eWnFz5zMc5xKeNLjQDwuD2jR9MtJTGZTLdfTtVsXVNO8Qpr9Pcp7Abc5T8kXvYKtK9ZuEg
	queY0fv1qDIVg7g==
X-Google-Smtp-Source: AGHT+IE8vzW7Xs8cMjoHlHH3d2qb58JKRBH7EU3tuuVeH9j0yW5A6zNQvtfkpmpzi/P06SNi6oPTkg==
X-Received: by 2002:a17:902:e80d:b0:246:571:4b51 with SMTP id d9443c01a7336-24944b38b8dmr294767385ad.29.1756999073479;
        Thu, 04 Sep 2025 08:17:53 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:89a7:8cc5:2043:ebe6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b0637d948sm84720845ad.30.2025.09.04.08.17.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:17:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 2/6] tiff: Security fix for CVE-2024-13978, CVE-2025-8176, CVE-2025-8177
Date: Thu,  4 Sep 2025 08:17:40 -0700
Message-ID: <f52df68fc89f0da9ea8ea8197462c9f55d0de46c.1756998900.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756998900.git.steve@sakoman.com>
References: <cover.1756998900.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 15:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222950

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/7be20ccaab97455f192de0ac561ceda7cd9e12d1, https://gitlab.com/libtiff/libtiff/-/commit/2ebfffb0e8836bfb1cd7d85c059cd285c59761a4, https://gitlab.com/libtiff/libtiff/-/commit/3994cf3b3bc6b54c32f240ca5a412cffa11633fa, https://gitlab.com/libtiff/libtiff/-/commit/ce46f002eca4148497363f80fab33f9396bcbeda, https://gitlab.com/libtiff/libtiff/-/commit/ecc4ddbf1f0fed7957d1e20361e37f01907898e0, https://gitlab.com/libtiff/libtiff/-/commit/75d8eca6f106c01aadf76b8500a7d062b12f2d82, https://gitlab.com/libtiff/libtiff/-/commit/e8c9d6c616b19438695fd829e58ae4fde5bfbc22]

CVE's Fixed:
CVE-2024-13978 libtiff: LibTIFF Null Pointer Dereference
CVE-2025-8176 libtiff: LibTIFF Use-After-Free Vulnerability
CVE-2025-8177 libtiff: LibTIFF Buffer Overflow

(From OE-Core rev: 16d8a873c57b174e4d6581b58d890f2157aa2f2c)

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2024-13978_1.patch       | 77 +++++++++++++++++++
 .../libtiff/tiff/CVE-2024-13978_2.patch       | 45 +++++++++++
 .../libtiff/tiff/CVE-2025-8176_1.patch        | 61 +++++++++++++++
 .../libtiff/tiff/CVE-2025-8176_2.patch        | 31 ++++++++
 .../libtiff/tiff/CVE-2025-8176_3.patch        | 28 +++++++
 .../libtiff/tiff/CVE-2025-8177_1.patch        | 36 +++++++++
 .../libtiff/tiff/CVE-2025-8177_2.patch        | 29 +++++++
 meta/recipes-multimedia/libtiff/tiff_4.7.0.bb | 10 ++-
 8 files changed, 316 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_3.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_2.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_1.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_1.patch
new file mode 100644
index 0000000000..8bb7cf280d
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_1.patch
@@ -0,0 +1,77 @@
+From 6dd7006103f9612fbd22e9c7c1b93d16691370a4 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Fri, 27 Sep 2024 11:21:57 -0700
+Subject: [PATCH 1/7] Fix issue #649 in fax2ps caused by regression in commit
+ https://gitlab.com/libtiff/libtiff/-/commit/28c38d648b64a66c3218778c4745225fe3e3a06d
+ where TIFFTAG_FAXFILLFUNC is being used rather than an output buffer.
+
+CVE: CVE-2024-13978
+Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/7be20ccaab97455f192de0ac561ceda7cd9e12d1]
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ libtiff/tif_read.c | 21 ++++++++++++++++-----
+ 1 file changed, 16 insertions(+), 5 deletions(-)
+
+diff --git a/libtiff/tif_read.c b/libtiff/tif_read.c
+index 7efab59..964f119 100644
+--- a/libtiff/tif_read.c
++++ b/libtiff/tif_read.c
+@@ -466,7 +466,9 @@ int TIFFReadScanline(TIFF *tif, void *buf, uint32_t row, uint16_t sample)
+     }
+     else
+     {
+-        memset(buf, 0, (size_t)tif->tif_scanlinesize);
++        /* See TIFFReadEncodedStrip comment regarding TIFFTAG_FAXFILLFUNC. */
++        if (buf)
++            memset(buf, 0, (size_t)tif->tif_scanlinesize);
+     }
+     return (e > 0 ? 1 : -1);
+ }
+@@ -554,7 +556,10 @@ tmsize_t TIFFReadEncodedStrip(TIFF *tif, uint32_t strip, void *buf,
+         stripsize = size;
+     if (!TIFFFillStrip(tif, strip))
+     {
+-        memset(buf, 0, (size_t)stripsize);
++        /* The output buf may be NULL, in particular if TIFFTAG_FAXFILLFUNC
++           is being used. Thus, memset must be conditional on buf not NULL. */
++        if (buf)
++            memset(buf, 0, (size_t)stripsize);
+         return ((tmsize_t)(-1));
+     }
+     if ((*tif->tif_decodestrip)(tif, buf, stripsize, plane) <= 0)
+@@ -976,7 +981,9 @@ tmsize_t TIFFReadEncodedTile(TIFF *tif, uint32_t tile, void *buf, tmsize_t size)
+         size = tilesize;
+     if (!TIFFFillTile(tif, tile))
+     {
+-        memset(buf, 0, (size_t)size);
++        /* See TIFFReadEncodedStrip comment regarding TIFFTAG_FAXFILLFUNC. */
++        if (buf)
++            memset(buf, 0, (size_t)size);
+         return ((tmsize_t)(-1));
+     }
+     else if ((*tif->tif_decodetile)(tif, (uint8_t *)buf, size,
+@@ -1569,7 +1576,9 @@ int TIFFReadFromUserBuffer(TIFF *tif, uint32_t strile, void *inbuf,
+         if (!TIFFStartTile(tif, strile))
+         {
+             ret = 0;
+-            memset(outbuf, 0, (size_t)outsize);
++            /* See related TIFFReadEncodedStrip comment. */
++            if (outbuf)
++                memset(outbuf, 0, (size_t)outsize);
+         }
+         else if (!(*tif->tif_decodetile)(
+                      tif, (uint8_t *)outbuf, outsize,
+@@ -1596,7 +1605,9 @@ int TIFFReadFromUserBuffer(TIFF *tif, uint32_t strile, void *inbuf,
+             if (!TIFFStartStrip(tif, strile))
+             {
+                 ret = 0;
+-                memset(outbuf, 0, (size_t)outsize);
++                /* See related TIFFReadEncodedStrip comment. */
++                if (outbuf)
++                    memset(outbuf, 0, (size_t)outsize);
+             }
+             else if (!(*tif->tif_decodestrip)(
+                          tif, (uint8_t *)outbuf, outsize,
+-- 
+2.47.3
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_2.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_2.patch
new file mode 100644
index 0000000000..a022fd41e2
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2024-13978_2.patch
@@ -0,0 +1,45 @@
+From a80b9eb70a8137e2571b2f32bd05d1a22a5603c4 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Sat, 5 Oct 2024 09:45:30 -0700
+Subject: [PATCH 2/7] Check TIFFTAG_TILELENGTH and TIFFTAGTILEWIDTH for valid
+ input, addresses issue #650
+
+CVE: CVE-2024-13978
+Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/2ebfffb0e8836bfb1cd7d85c059cd285c59761a4]
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ tools/tiff2pdf.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/tools/tiff2pdf.c b/tools/tiff2pdf.c
+index 6dfc239..2010fee 100644
+--- a/tools/tiff2pdf.c
++++ b/tools/tiff2pdf.c
+@@ -1371,8 +1371,24 @@ void t2p_read_tiff_init(T2P *t2p, TIFF *input)
+             t2p->pdf_xrefcount += (t2p->tiff_tiles[i].tiles_tilecount - 1) * 2;
+             TIFFGetField(input, TIFFTAG_TILEWIDTH,
+                          &(t2p->tiff_tiles[i].tiles_tilewidth));
++            if (t2p->tiff_tiles[i].tiles_tilewidth < 1)
++            {
++                TIFFError(TIFF2PDF_MODULE, "Invalid tile width (%d), %s",
++                          t2p->tiff_tiles[i].tiles_tilewidth,
++                          TIFFFileName(input));
++                t2p->t2p_error = T2P_ERR_ERROR;
++                return;
++            }
+             TIFFGetField(input, TIFFTAG_TILELENGTH,
+                          &(t2p->tiff_tiles[i].tiles_tilelength));
++            if (t2p->tiff_tiles[i].tiles_tilelength < 1)
++            {
++                TIFFError(TIFF2PDF_MODULE, "Invalid tile length (%d), %s",
++                          t2p->tiff_tiles[i].tiles_tilelength,
++                          TIFFFileName(input));
++                t2p->t2p_error = T2P_ERR_ERROR;
++                return;
++            }
+             t2p->tiff_tiles[i].tiles_tiles = (T2P_TILE *)_TIFFmalloc(
+                 TIFFSafeMultiply(tmsize_t, t2p->tiff_tiles[i].tiles_tilecount,
+                                  sizeof(T2P_TILE)));
+-- 
+2.47.3
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_1.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_1.patch
new file mode 100644
index 0000000000..14d3cb445e
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_1.patch
@@ -0,0 +1,61 @@
+From ed35364de1e3ad444e6f954514ee68eb9be496d2 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Mon, 19 May 2025 10:53:30 -0700
+Subject: [PATCH 3/7] Don't skip the first line of the input image. Addresses
+ issue #703
+
+CVE: CVE-2025-8176
+Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/3994cf3b3bc6b54c32f240ca5a412cffa11633fa]
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ tools/tiffdither.c | 4 ++--
+ tools/tiffmedian.c | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tools/tiffdither.c b/tools/tiffdither.c
+index 714fe03..bfed6df 100644
+--- a/tools/tiffdither.c
++++ b/tools/tiffdither.c
+@@ -98,7 +98,7 @@ static int fsdither(TIFF *in, TIFF *out)
+     nextptr = nextline;
+     for (j = 0; j < imagewidth; ++j)
+         *nextptr++ = *inptr++;
+-    for (i = 1; i < imagelength; ++i)
++    for (i = 0; i < imagelength; ++i)
+     {
+         tmpptr = thisline;
+         thisline = nextline;
+@@ -146,7 +146,7 @@ static int fsdither(TIFF *in, TIFF *out)
+                     nextptr[0] += v / 16;
+             }
+         }
+-        if (TIFFWriteScanline(out, outline, i - 1, 0) < 0)
++        if (TIFFWriteScanline(out, outline, i, 0) < 0)
+             goto skip_on_error;
+     }
+     goto exit_label;
+diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
+index 02b0bc2..f6cf26c 100644
+--- a/tools/tiffmedian.c
++++ b/tools/tiffmedian.c
+@@ -917,7 +917,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
+     outline = (unsigned char *)_TIFFmalloc(TIFFScanlineSize(out));
+ 
+     GetInputLine(in, 0, goto bad); /* get first line */
+-    for (i = 1; i <= imagelength; ++i)
++    for (i = 0; i <= imagelength; ++i)
+     {
+         SWAP(short *, thisline, nextline);
+         lastline = (i >= imax);
+@@ -997,7 +997,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
+                 nextptr += 3;
+             }
+         }
+-        if (TIFFWriteScanline(out, outline, i - 1, 0) < 0)
++        if (TIFFWriteScanline(out, outline, i, 0) < 0)
+             break;
+     }
+ bad:
+-- 
+2.47.3
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_2.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_2.patch
new file mode 100644
index 0000000000..74cf5ae277
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_2.patch
@@ -0,0 +1,31 @@
+From c090daf37e7f2ad09ec7e9cfabd1c5fde3dee6eb Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Sat, 24 May 2025 21:25:16 -0700
+Subject: [PATCH 4/7] Fix tiffmedian bug #707
+
+CVE: CVE-2025-8176
+Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/ce46f002eca4148497363f80fab33f9396bcbeda]
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ tools/tiffmedian.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
+index f6cf26c..8c9978b 100644
+--- a/tools/tiffmedian.c
++++ b/tools/tiffmedian.c
+@@ -414,7 +414,10 @@ static void get_histogram(TIFF *in, Colorbox *box)
+     for (i = 0; i < imagelength; i++)
+     {
+         if (TIFFReadScanline(in, inputline, i, 0) <= 0)
+-            break;
++        {
++            fprintf(stderr, "Error reading scanline\n");
++            exit(EXIT_FAILURE);
++        }
+         inptr = inputline;
+         for (j = imagewidth; j-- > 0;)
+         {
+-- 
+2.47.3
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_3.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_3.patch
new file mode 100644
index 0000000000..e0f41f8d71
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8176_3.patch
@@ -0,0 +1,28 @@
+From bd645550275963797343e8e91a9a8fee318428e0 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Sat, 24 May 2025 21:38:09 -0700
+Subject: [PATCH 5/7] conflict resolution
+
+CVE: CVE-2025-8176
+Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/ecc4ddbf1f0fed7957d1e20361e37f01907898e0]
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ tools/tiffmedian.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/tiffmedian.c b/tools/tiffmedian.c
+index 8c9978b..47e0524 100644
+--- a/tools/tiffmedian.c
++++ b/tools/tiffmedian.c
+@@ -920,7 +920,7 @@ static void quant_fsdither(TIFF *in, TIFF *out)
+     outline = (unsigned char *)_TIFFmalloc(TIFFScanlineSize(out));
+ 
+     GetInputLine(in, 0, goto bad); /* get first line */
+-    for (i = 0; i <= imagelength; ++i)
++    for (i = 0; i < imagelength; ++i)
+     {
+         SWAP(short *, thisline, nextline);
+         lastline = (i >= imax);
+-- 
+2.47.3
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_1.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_1.patch
new file mode 100644
index 0000000000..9437ffcc20
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_1.patch
@@ -0,0 +1,36 @@
+From 01bf5ba7f4a27c5e28ce467a66b13e066556e545 Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Thu, 19 Jun 2025 11:51:33 -0700
+Subject: [PATCH 6/7] Fix for thumbnail issue #715
+
+CVE: CVE-2025-8177
+Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/75d8eca6f106c01aadf76b8500a7d062b12f2d82]
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ tools/thumbnail.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/tools/thumbnail.c b/tools/thumbnail.c
+index b4cb114..432d172 100644
+--- a/tools/thumbnail.c
++++ b/tools/thumbnail.c
+@@ -620,7 +620,15 @@ static void setrow(uint8_t *row, uint32_t nrows, const uint8_t *rows[])
+             }
+             acc += bits[*src & mask1];
+         }
+-        *row++ = cmap[(255 * acc) / area];
++        if (255 * acc / area < 256)
++        {
++            *row++ = cmap[(255 * acc) / area];
++        }
++        else
++        {
++            fprintf(stderr, "acc=%d, area=%d\n", acc, area);
++            row++;
++        }
+     }
+ }
+ 
+-- 
+2.47.3
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_2.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_2.patch
new file mode 100644
index 0000000000..356e3ba402
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8177_2.patch
@@ -0,0 +1,29 @@
+From c3ad38afb9986b9ddcd7d95367ded152488260cd Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Mon, 23 Jun 2025 10:09:07 -0700
+Subject: [PATCH 7/7] set a default value - assumes cmap[0] was not, itself,
+ uninitialized
+
+CVE: CVE-2025-8177
+Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/e8c9d6c616b19438695fd829e58ae4fde5bfbc22]
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ tools/thumbnail.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/thumbnail.c b/tools/thumbnail.c
+index 432d172..110ea42 100644
+--- a/tools/thumbnail.c
++++ b/tools/thumbnail.c
+@@ -627,7 +627,7 @@ static void setrow(uint8_t *row, uint32_t nrows, const uint8_t *rows[])
+         else
+         {
+             fprintf(stderr, "acc=%d, area=%d\n", acc, area);
+-            row++;
++            *row++ = cmap[0];
+         }
+     }
+ }
+-- 
+2.47.3
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
index 5a6939d584..26e3811ff8 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
@@ -8,7 +8,15 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a3e32d664d6db1386b4689c8121531c3"
 
 CVE_PRODUCT = "libtiff"
 
-SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz"
+SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
+	   file://CVE-2024-13978_1.patch \
+	   file://CVE-2024-13978_2.patch \
+	   file://CVE-2025-8176_1.patch \
+	   file://CVE-2025-8176_2.patch \
+	   file://CVE-2025-8176_3.patch \
+	   file://CVE-2025-8177_1.patch \
+	   file://CVE-2025-8177_2.patch \
+	   "
 
 SRC_URI[sha256sum] = "67160e3457365ab96c5b3286a0903aa6e78bdc44c4bc737d2e486bcecb6ba976"
 
-- 
2.43.0


