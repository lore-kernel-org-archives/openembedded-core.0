Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C49E7718B
	for <webhook@archiver.kernel.org>; Tue, 31 Dec 2024 21:26:21 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.3492.1735680378413751084
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Dec 2024 13:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=i/hfs7I9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202412312126164da020cd31a4590344-pdnhur@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202412312126164da020cd31a4590344
        for <openembedded-core@lists.openembedded.org>;
        Tue, 31 Dec 2024 22:26:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=MNFxLYzaSHnAXyELEVQoY6i1tdcKlMAgYx3HjgUN35Y=;
 b=i/hfs7I9KYKdAQBBOqekn8FCJaAFYg/371yEigjlpMIcR33kPHA3M4MU+eEf8DVqeyEiFY
 zrkgPODoHhbM0ckca52eZgoNtsqERbt6cYYW/1dDbTwGowW3Y5t8BRO5M7EGLeLSbHfgleHp
 oIyPeRGXz+lDsAZwqmHbutIvz3dA5/uFP0NEoRy6Fqn98aSkU0rv1uwuTp3+eJMnAgxsU+yX
 OIfpychWmTeNdXaPkCHH+jRF30R/ybchy2Qe1T6g1UT4Am/3n28EMLhyZGfjkTj+a5vAXl3k
 uQ19pA+HVTxO/TKTNz336NHCnpMvUowFvXJxq5+2sQvZs7qqRg35/9gQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 3/5] tiff: patch CVE-2023-3164
Date: Tue, 31 Dec 2024 22:25:09 +0100
Message-Id: <20241231212511.3649711-4-peter.marko@siemens.com>
In-Reply-To: <20241231212511.3649711-1-peter.marko@siemens.com>
References: <20241231212511.3649711-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Dec 2024 21:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209188

From: Peter Marko <peter.marko@siemens.com>

Backport fix from upstream.

There was style refactoring done in the code meanwhile, so the patch mas
assembled manually by applying each change on 4.3.0 sources.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
2.30.2


