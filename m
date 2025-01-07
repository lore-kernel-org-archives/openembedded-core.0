Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 583ECE7719C
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:31:38 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.20163.1736256692669786093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 05:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PIcjRcx5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2164b1f05caso222616715ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 05:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736256692; x=1736861492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OfTEfDkHvpN5GlivzAVZtx24CR28gnTC6xapaFw2/tY=;
        b=PIcjRcx5YRE7VVrSmCVv1c3VT9aoC0s6UCryzJGkCUwJITGal6eS7hG1NEQ2dt4eq0
         FYY7yFpVCZxGoWXT+kyzMwRi6meMzpJD3ves3ScxfM/GlPrFhTJ+fdfEJnO4zu0G4uAa
         YTCptmFjXZjabvPYBvVsAw6HUleU3ZT4RZrCP9KR5HdpEXvZd5rBaWk14CaEmsuVsiUj
         /2W8FePJVtI2sF7dUqxUeZzx7rrRsfvaA83ifEW7uxF9oYRGFGUcIdQZf1K69faClcOS
         EzlmK8Ho5+y0Yz0zqurJQKmy/VZ9lkDHlLAm0E08iUPhTM8td467FVUzGiW4gROXQrBS
         2w5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736256692; x=1736861492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfTEfDkHvpN5GlivzAVZtx24CR28gnTC6xapaFw2/tY=;
        b=eEWpcBfaZkES5AF6h31AkvmM0gkdAWh0QSTZnW2xtFm31SjTQ5JclMuwSo2ufRDwUv
         oVfDvAsiDy1i3BTzZxxnk5w1GpmE8QPsWllakOj+6csxQ0iyT8/YaWE+u+f01bwK8Oe/
         ibadeweAzDcJqePghmF7vHDCASW5i6/6683PPyiuEZgxgZQfSqYxiiW6bEHSkVxqMRH+
         locvjbmUqIoBvW5JOonbnfLV8HrIgjAedeU0r+n2kcu1CJ9OdSi20mf7hjx5wQW8XKvx
         pN6yHtlJsXIXizbRB3Frp+Tbgni/ottKNtQwy8hHG/6gjW9L4d3fkUGVPrZTevtmumyI
         I/dQ==
X-Gm-Message-State: AOJu0Yxy4B00gLlcpdJZWxQMStFaeWdkZvPMHOLd+0IPUhF+siFbaZCe
	eoNCUUSSUbpsUiZAPcV2/JjLSyDmso9TQOChpKKfK0kzh5UB5+D1dbJPaStvhmTl6ePZH72XGF1
	2
X-Gm-Gg: ASbGncubmGqr5jcZMXHji4tAvD5croqtz85lmX+zvWNv2Fm2EgaVngUk/N1N0aNN7GO
	Vj+VJtzU3jTH5d5FjExKXBe+4GDNaDoBHNHjcuDGzVk5Oub2Wu8tlX8FHb1cHC2KQL+ExeVIjBv
	ASWka0Rtii/40TJEX+T8BMGw1NdNxPqUuwHt/oCw7HQOgl36DsYNYy3ki9H5Miqw4wHR4KQk5KE
	NJqBM5SpbyqbH7/48EZERWRagjymmMhP7cVAk3ufXBdzQ==
X-Google-Smtp-Source: AGHT+IFuu97XspS6HF9QsI15LfqfOdHYAEbm+z1XkltFFuRAhP3mC+6VQg92Hrg23+cbDBlK47j4ew==
X-Received: by 2002:aa7:888c:0:b0:72a:a9b5:ed91 with SMTP id d2e1a72fcca58-72abde0e6b7mr91640804b3a.13.1736256691127;
        Tue, 07 Jan 2025 05:31:31 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbae4sm33340197b3a.96.2025.01.07.05.31.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:31:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/13] tiff: patch CVE-2023-3164
Date: Tue,  7 Jan 2025 05:31:08 -0800
Message-ID: <fda622289ef26fac38e7dc41e6f0c9d7c866f06e.1736256495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736256495.git.steve@sakoman.com>
References: <cover.1736256495.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 13:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209457

From: Peter Marko <peter.marko@siemens.com>

Backport fix from upstream.

There was style refactoring done in the code meanwhile, so the patch mas
assembled manually by applying each change on 4.3.0 sources.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2023-3164.patch          | 114 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-3164.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3164.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3164.patch
new file mode 100644
index 0000000000..4a47db8789
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3164.patch
@@ -0,0 +1,114 @@
+From a20298c4785c369469510613dfbc5bf230164fed Mon Sep 17 00:00:00 2001
+From: Lee Howard <faxguy@howardsilvan.com>
+Date: Fri, 17 May 2024 15:11:10 +0000
+Subject: [PATCH] tiffcrop: fixes #542, #550, #552 (buffer overflows, use after
+ free)
+
+CVE: CVE-2023-3164
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/commit/a20298c4785c369469510613dfbc5bf230164fed]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tools/tiffcrop.c | 31 +++++++++++++++++++++++++++++--
+ 1 file changed, 29 insertions(+), 2 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index b11fec93a..aaf6bb280 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -449,6 +449,7 @@ static uint16_t defcompression = (uint16_t) -1;
+ static uint16_t defpredictor = (uint16_t) -1;
+ static int    pageNum = 0;
+ static int    little_endian = 1;
++static tmsize_t check_buffsize = 0;
+ 
+ /* Functions adapted from tiffcp with additions or significant modifications */
+ static int  readContigStripsIntoBuffer   (TIFF*, uint8_t*);
+@@ -2081,6 +2082,11 @@ void  process_command_opts (int argc, char *argv[], char *mp, char *mode, uint32
+ 		  TIFFError ("Limit for subdivisions, ie rows x columns, exceeded", "%d", MAX_SECTIONS);
+ 		  exit (EXIT_FAILURE);
+                   }
++                if ((page->cols * page->rows) < 1)
++                {
++                    TIFFError("No subdivisions", "%d", (page->cols * page->rows));
++                    exit(EXIT_FAILURE);
++                }
+                 page->mode |= PAGE_MODE_ROWSCOLS;
+ 		break;
+       case 'U':	/* units for measurements and offsets */
+@@ -4433,7 +4439,7 @@ combineSeparateTileSamplesBytes (unsigned char *srcbuffs[], unsigned char *out,
+     dst = out + (row * dst_rowsize);
+     src_offset = row * src_rowsize;
+ #ifdef DEVELMODE
+-    TIFFError("","Tile row %4d, Src offset %6d   Dst offset %6d", 
++    TIFFError("","Tile row %4d, Src offset %6d   Dst offset %6zd", 
+               row, src_offset, dst - out);
+ #endif
+     for (col = 0; col < cols; col++)
+@@ -5028,7 +5034,7 @@ static int readSeparateStripsIntoBuffer (TIFF *in, uint8_t *obuf, uint32_t lengt
+         break;
+         }
+ #ifdef DEVELMODE
+-      TIFFError("", "Strip %2"PRIu32", read %5"PRId32" bytes for %4"PRIu32" scanlines, shift width %d",
++      TIFFError("", "Strip %2"PRIu32", read %5zd bytes for %4"PRIu32" scanlines, shift width %d",
+ 		strip, bytes_read, rows_this_strip, shift_width);
+ #endif
+       }
+@@ -6446,6 +6452,7 @@ loadImage(TIFF* in, struct image_data *image, struct dump_opts *dump, unsigned c
+         TIFFError("loadImage", "Unable to allocate read buffer");
+         return (-1);
+     }
++    check_buffsize = buffsize + NUM_BUFF_OVERSIZE_BYTES;
+ 
+   read_buff[buffsize] = 0;
+   read_buff[buffsize+1] = 0;
+@@ -7076,6 +7083,11 @@ extractImageSection(struct image_data *image, struct pageseg *section,
+ #ifdef DEVELMODE
+         TIFFError ("", "Src offset: %8"PRIu32", Dst offset: %8"PRIu32, src_offset, dst_offset); 
+ #endif
++      if (src_offset + full_bytes >= check_buffsize)
++      {
++        printf("Bad input. Preventing reading outside of input buffer.\n");
++        return(-1);
++      }
+       _TIFFmemcpy (sect_buff + dst_offset, src_buff + src_offset, full_bytes);
+       dst_offset += full_bytes;
+       }        
+@@ -7110,6 +7122,11 @@ extractImageSection(struct image_data *image, struct pageseg *section,
+       bytebuff1 = bytebuff2 = 0;
+       if (shift1 == 0) /* the region is byte and sample aligned */
+         {
++          if (offset1 + full_bytes >= check_buffsize)
++          {
++            printf("Bad input. Preventing reading outside of input buffer.\n");
++            return(-1);
++          }
+ 	_TIFFmemcpy (sect_buff + dst_offset, src_buff + offset1, full_bytes);
+ 
+ #ifdef DEVELMODE
+@@ -7129,6 +7146,11 @@ extractImageSection(struct image_data *image, struct pageseg *section,
+         if (trailing_bits != 0)
+           {
+       /* Only copy higher bits of samples and mask lower bits of not wanted column samples to zero */
++      if (offset1 + full_bytes >= check_buffsize)
++      {
++        printf("Bad input. Preventing reading outside of input buffer.\n");
++        return(-1);
++      }
+ 	  bytebuff2 = src_buff[offset1 + full_bytes] & ((unsigned char)255 << (8 - trailing_bits));
+           sect_buff[dst_offset] = bytebuff2;
+ #ifdef DEVELMODE
+@@ -7154,6 +7176,11 @@ extractImageSection(struct image_data *image, struct pageseg *section,
+           {
+           /* Skip the first shift1 bits and shift the source up by shift1 bits before save to destination.*/
+           /* Attention: src_buff size needs to be some bytes larger than image size, because could read behind image here. */
++          if (offset1 + j + 1 >= check_buffsize)
++          {
++            printf("Bad input. Preventing reading outside of input buffer.\n");
++            return(-1);
++          }
+           bytebuff1 = src_buff[offset1 + j] & ((unsigned char)255 >> shift1);
+           bytebuff2 = src_buff[offset1 + j + 1] & ((unsigned char)255 << (8 - shift1));
+           sect_buff[dst_offset + j] = (bytebuff1 << shift1) | (bytebuff2 >> (8 - shift1));
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index a47fc4bd34..5ec7b20e61 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -54,6 +54,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-6277-3.patch \
            file://CVE-2023-6277-4.patch \
            file://CVE-2024-7006.patch \
+           file://CVE-2023-3164.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.43.0


