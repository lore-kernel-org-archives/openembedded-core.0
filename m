Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314E3C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 13:22:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.30271.1647868948573061867
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 06:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 519741042
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 06:22:27 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFC363F73D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 06:22:26 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tiff: backport CVE fixes:
Date: Mon, 21 Mar 2022 13:22:25 +0000
Message-Id: <20220321132225.3349420-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 13:22:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163501

Backport fixes for the following CVEs:

- CVE-2022-0865
- CVE-2022-0891
- CVE-2022-0907
- CVE-2022-0908
- CVE-2022-0909
- CVE-2022-0924

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...rash-when-reading-a-file-with-multip.patch |  38 +++
 ...ue-380-and-382-heap-buffer-overflow-.patch | 218 ++++++++++++++++++
 ...-for-return-value-of-limitMalloc-392.patch |  93 ++++++++
 ...ag-avoid-calling-memcpy-with-a-null-.patch |  33 +++
 .../0005-fix-the-FPE-in-tiffcrop-393.patch    |  36 +++
 ...x-heap-buffer-overflow-in-tiffcp-278.patch |  57 +++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   9 +-
 7 files changed, 483 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-=
fix-crash-when-reading-a-file-with-multip.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fi=
x-issue-380-and-382-heap-buffer-overflow-.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0003-add-checks-=
for-return-value-of-limitMalloc-392.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNo=
rmalTag-avoid-calling-memcpy-with-a-null-.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE=
-in-tiffcrop-393.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-bu=
ffer-overflow-in-tiffcp-278.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-cra=
sh-when-reading-a-file-with-multip.patch b/meta/recipes-multimedia/libtif=
f/tiff/0001-tif_jbig.c-fix-crash-when-reading-a-file-with-multip.patch
new file mode 100644
index 00000000000..f1a4ab4251a
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/0001-tif_jbig.c-fix-crash-when=
-reading-a-file-with-multip.patch
@@ -0,0 +1,38 @@
+CVE: CVE-2022-0865
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 88da11ae3c4db527cb870fb1017456cc8fbac2e7 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Thu, 24 Feb 2022 22:26:02 +0100
+Subject: [PATCH 1/6] tif_jbig.c: fix crash when reading a file with mult=
iple
+ IFD in memory-mapped mode and when bit reversal is needed (fixes #385)
+
+---
+ libtiff/tif_jbig.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/libtiff/tif_jbig.c b/libtiff/tif_jbig.c
+index 74086338..8bfa4cef 100644
+--- a/libtiff/tif_jbig.c
++++ b/libtiff/tif_jbig.c
+@@ -209,6 +209,16 @@ int TIFFInitJBIG(TIFF* tif, int scheme)
+ 	 */
+ 	tif->tif_flags |=3D TIFF_NOBITREV;
+ 	tif->tif_flags &=3D ~TIFF_MAPPED;
++	/* We may have read from a previous IFD and thus set TIFF_BUFFERMMAP a=
nd
++	 * cleared TIFF_MYBUFFER. It is necessary to restore them to their ini=
tial
++	 * value to be consistent with the state of a non-memory mapped file.
++	 */
++	if (tif->tif_flags&TIFF_BUFFERMMAP) {
++		tif->tif_rawdata =3D NULL;
++		tif->tif_rawdatasize =3D 0;
++		tif->tif_flags &=3D ~TIFF_BUFFERMMAP;
++		tif->tif_flags |=3D TIFF_MYBUFFER;
++	}
+=20
+ 	/* Setup the function pointers for encode, decode, and cleanup. */
+ 	tif->tif_setupdecode =3D JBIGSetupDecode;
+--=20
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue=
-380-and-382-heap-buffer-overflow-.patch b/meta/recipes-multimedia/libtif=
f/tiff/0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overflow-.patch
new file mode 100644
index 00000000000..d31e9650d1b
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/0002-tiffcrop-fix-issue-380-an=
d-382-heap-buffer-overflow-.patch
@@ -0,0 +1,218 @@
+CVE: CVE-2022-0891
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From e46b49e60fddb2e924302fb1751f79eb9cfb2253 Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Tue, 8 Mar 2022 17:02:44 +0000
+Subject: [PATCH 2/6] tiffcrop: fix issue #380 and #382 heap buffer overf=
low in
+ extractImageSection
+
+---
+ tools/tiffcrop.c | 92 +++++++++++++++++++-----------------------------
+ 1 file changed, 36 insertions(+), 56 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index b85c2ce7..302a7e91 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -105,8 +105,8 @@
+  *                of messages to monitor progress without enabling dump=
 logs.
+  */
+=20
+-static   char tiffcrop_version_id[] =3D "2.4";
+-static   char tiffcrop_rev_date[] =3D "12-13-2010";
++static   char tiffcrop_version_id[] =3D "2.4.1";
++static   char tiffcrop_rev_date[] =3D "03-03-2010";
+=20
+ #include "tif_config.h"
+ #include "libport.h"
+@@ -6710,10 +6710,10 @@ extractImageSection(struct image_data *image, st=
ruct pageseg *section,
+ #ifdef DEVELMODE
+   uint32_t    img_length;
+ #endif
+-  uint32_t    j, shift1, shift2, trailing_bits;
++  uint32_t    j, shift1, trailing_bits;
+   uint32_t    row, first_row, last_row, first_col, last_col;
+   uint32_t    src_offset, dst_offset, row_offset, col_offset;
+-  uint32_t    offset1, offset2, full_bytes;
++  uint32_t    offset1, full_bytes;
+   uint32_t    sect_width;
+ #ifdef DEVELMODE
+   uint32_t    sect_length;
+@@ -6723,7 +6723,6 @@ extractImageSection(struct image_data *image, stru=
ct pageseg *section,
+ #ifdef DEVELMODE
+   int      k;
+   unsigned char bitset;
+-  static char *bitarray =3D NULL;
+ #endif
+=20
+   img_width =3D image->width;
+@@ -6741,17 +6740,12 @@ extractImageSection(struct image_data *image, st=
ruct pageseg *section,
+   dst_offset =3D 0;
+=20
+ #ifdef DEVELMODE
+-  if (bitarray =3D=3D NULL)
+-    {
+-    if ((bitarray =3D (char *)malloc(img_width)) =3D=3D NULL)
+-      {
+-      TIFFError ("", "DEBUG: Unable to allocate debugging bitarray");
+-      return (-1);
+-      }
+-    }
++  char bitarray[39];
+ #endif
+=20
+-  /* rows, columns, width, length are expressed in pixels */
++  /* rows, columns, width, length are expressed in pixels
++   * first_row, last_row, .. are index into image array starting at 0 t=
o width-1,
++   * last_col shall be also extracted.  */
+   first_row =3D section->y1;
+   last_row  =3D section->y2;
+   first_col =3D section->x1;
+@@ -6761,9 +6755,14 @@ extractImageSection(struct image_data *image, str=
uct pageseg *section,
+ #ifdef DEVELMODE
+   sect_length =3D last_row - first_row + 1;
+ #endif
+-  img_rowsize =3D ((img_width * bps + 7) / 8) * spp;
+-  full_bytes =3D (sect_width * spp * bps) / 8;   /* number of COMPLETE =
bytes per row in section */
+-  trailing_bits =3D (sect_width * bps) % 8;
++    /* The read function loadImage() used copy separate plane data into=
 a buffer as interleaved
++     * samples rather than separate planes so the same logic works to e=
xtract regions
++     * regardless of the way the data are organized in the input file.
++     * Furthermore, bytes and bits are arranged in buffer according to =
COMPRESSION=3D1 and FILLORDER=3D1=20
++     */
++    img_rowsize =3D (((img_width * spp * bps) + 7) / 8);    /* row size=
 in full bytes of source image */
++    full_bytes =3D (sect_width * spp * bps) / 8;            /* number o=
f COMPLETE bytes per row in section */
++    trailing_bits =3D (sect_width * spp * bps) % 8;         /* trailing=
 bits within the last byte of destination buffer */
+=20
+ #ifdef DEVELMODE
+     TIFFError ("", "First row: %"PRIu32", last row: %"PRIu32", First co=
l: %"PRIu32", last col: %"PRIu32"\n",
+@@ -6776,10 +6775,9 @@ extractImageSection(struct image_data *image, str=
uct pageseg *section,
+=20
+   if ((bps % 8) =3D=3D 0)
+     {
+-    col_offset =3D first_col * spp * bps / 8;
++    col_offset =3D (first_col * spp * bps) / 8;
+     for (row =3D first_row; row <=3D last_row; row++)
+       {
+-      /* row_offset =3D row * img_width * spp * bps / 8; */
+       row_offset =3D row * img_rowsize;
+       src_offset =3D row_offset + col_offset;
+=20
+@@ -6792,14 +6790,12 @@ extractImageSection(struct image_data *image, st=
ruct pageseg *section,
+     }
+   else
+     { /* bps !=3D 8 */
+-    shift1  =3D spp * ((first_col * bps) % 8);
+-    shift2  =3D spp * ((last_col * bps) % 8);
++    shift1 =3D ((first_col * spp * bps) % 8);           /* shift1 =3D b=
its to skip in the first byte of source buffer*/
+     for (row =3D first_row; row <=3D last_row; row++)
+       {
+       /* pull out the first byte */
+       row_offset =3D row * img_rowsize;
+-      offset1 =3D row_offset + (first_col * bps / 8);
+-      offset2 =3D row_offset + (last_col * bps / 8);
++      offset1 =3D row_offset + ((first_col * spp * bps) / 8);   /* offs=
et1 =3D offset into source of byte with first bits to be extracted */
+=20
+ #ifdef DEVELMODE
+       for (j =3D 0, k =3D 7; j < 8; j++, k--)
+@@ -6811,12 +6807,12 @@ extractImageSection(struct image_data *image, st=
ruct pageseg *section,
+       sprintf(&bitarray[9], " ");
+       for (j =3D 10, k =3D 7; j < 18; j++, k--)
+         {
+-        bitset =3D *(src_buff + offset2) & (((unsigned char)1 << k)) ? =
1 : 0;
++        bitset =3D *(src_buff + offset1 + full_bytes) & (((unsigned cha=
r)1 << k)) ? 1 : 0;
+         sprintf(&bitarray[j], (bitset) ? "1" : "0");
+         }
+       bitarray[18] =3D '\0';
+-      TIFFError ("", "Row: %3d Offset1: %"PRIu32",  Shift1: %"PRIu32", =
   Offset2: %"PRIu32",  Shift2:  %"PRIu32"\n",=20
+-                 row, offset1, shift1, offset2, shift2);=20
++      TIFFError ("", "Row: %3d Offset1: %"PRIu32",  Shift1: %"PRIu32", =
   Offset2: %"PRIu32",  Trailing_bits:  %"PRIu32"\n",=20
++                 row, offset1, shift1, offset1+full_bytes, trailing_bit=
s);=20
+ #endif
+=20
+       bytebuff1 =3D bytebuff2 =3D 0;
+@@ -6840,11 +6836,12 @@ extractImageSection(struct image_data *image, st=
ruct pageseg *section,
+=20
+         if (trailing_bits !=3D 0)
+           {
+-	  bytebuff2 =3D src_buff[offset2] & ((unsigned char)255 << (7 - shift2=
));
++      /* Only copy higher bits of samples and mask lower bits of not wa=
nted column samples to zero */
++	  bytebuff2 =3D src_buff[offset1 + full_bytes] & ((unsigned char)255 <=
< (8 - trailing_bits));
+           sect_buff[dst_offset] =3D bytebuff2;
+ #ifdef DEVELMODE
+ 	  TIFFError ("", "        Trailing bits src offset:  %8"PRIu32", Dst o=
ffset: %8"PRIu32"\n",
+-                              offset2, dst_offset);=20
++          offset1 + full_bytes, dst_offset);
+           for (j =3D 30, k =3D 7; j < 38; j++, k--)
+             {
+             bitset =3D *(sect_buff + dst_offset) & (((unsigned char)1 <=
< k)) ? 1 : 0;
+@@ -6863,8 +6860,10 @@ extractImageSection(struct image_data *image, str=
uct pageseg *section,
+ #endif
+         for (j =3D 0; j <=3D full_bytes; j++)=20
+           {
+-	  bytebuff1 =3D src_buff[offset1 + j] & ((unsigned char)255 >> shift1)=
;
+-	  bytebuff2 =3D src_buff[offset1 + j + 1] & ((unsigned char)255 << (7 =
- shift1));
++          /* Skip the first shift1 bits and shift the source up by shif=
t1 bits before save to destination.*/
++          /* Attention: src_buff size needs to be some bytes larger tha=
n image size, because could read behind image here. */
++          bytebuff1 =3D src_buff[offset1 + j] & ((unsigned char)255 >> =
shift1);
++          bytebuff2 =3D src_buff[offset1 + j + 1] & ((unsigned char)255=
 << (8 - shift1));
+           sect_buff[dst_offset + j] =3D (bytebuff1 << shift1) | (bytebu=
ff2 >> (8 - shift1));
+           }
+ #ifdef DEVELMODE
+@@ -6880,36 +6879,17 @@ extractImageSection(struct image_data *image, st=
ruct pageseg *section,
+ #endif
+         dst_offset +=3D full_bytes;
+=20
++        /* Copy the trailing_bits for the last byte in the destination =
buffer.=20
++           Could come from one ore two bytes of the source buffer. */
+         if (trailing_bits !=3D 0)
+           {
+ #ifdef DEVELMODE
+-	    TIFFError ("", "        Trailing bits   src offset: %8"PRIu32", Ds=
t offset: %8"PRIu32"\n", offset1 + full_bytes, dst_offset);
+-#endif
+-	  if (shift2 > shift1)
+-            {
+-	    bytebuff1 =3D src_buff[offset1 + full_bytes] & ((unsigned char)255=
 << (7 - shift2));
+-            bytebuff2 =3D bytebuff1 & ((unsigned char)255 << shift1);
+-            sect_buff[dst_offset] =3D bytebuff2;
+-#ifdef DEVELMODE
+-	    TIFFError ("", "        Shift2 > Shift1\n");=20
++          TIFFError("", "        Trailing bits %4"PRIu32"   src offset:=
 %8"PRIu32", Dst offset: %8"PRIu32"\n", trailing_bits, offset1 + full_byt=
es, dst_offset);
+ #endif
++          /* More than necessary bits are already copied into last dest=
ination buffer,=20
++           * only masking of last byte in destination buffer is necessa=
ry.*/=20
++          sect_buff[dst_offset] &=3D ((uint8_t)0xFF << (8 - trailing_bi=
ts));
+             }
+-          else
+-            {
+-	    if (shift2 < shift1)
+-              {
+-              bytebuff2 =3D ((unsigned char)255 << (shift1 - shift2 - 1=
));
+-	      sect_buff[dst_offset] &=3D bytebuff2;
+-#ifdef DEVELMODE
+-	      TIFFError ("", "        Shift2 < Shift1\n");=20
+-#endif
+-              }
+-#ifdef DEVELMODE
+-            else
+-	      TIFFError ("", "        Shift2 =3D=3D Shift1\n");=20
+-#endif
+-            }
+-	  }
+ #ifdef DEVELMODE
+ 	  sprintf(&bitarray[28], " ");
+ 	  sprintf(&bitarray[29], " ");
+@@ -7062,7 +7042,7 @@ writeImageSections(TIFF *in, TIFF *out, struct ima=
ge_data *image,
+     width  =3D sections[i].x2 - sections[i].x1 + 1;
+     length =3D sections[i].y2 - sections[i].y1 + 1;
+     sectsize =3D (uint32_t)
+-	    ceil((width * image->bps + 7) / (double)8) * image->spp * length;
++	    ceil((width * image->bps * image->spp + 7) / (double)8) * length;
+     /* allocate a buffer if we don't have one already */
+     if (createImageSection(sectsize, sect_buff_ptr))
+       {
+--=20
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-ret=
urn-value-of-limitMalloc-392.patch b/meta/recipes-multimedia/libtiff/tiff=
/0003-add-checks-for-return-value-of-limitMalloc-392.patch
new file mode 100644
index 00000000000..a0b856b9e19
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/0003-add-checks-for-return-val=
ue-of-limitMalloc-392.patch
@@ -0,0 +1,93 @@
+CVE: CVE-2022-0907
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From a139191cc86f4dc44c74a0f22928e0fb38ed2485 Mon Sep 17 00:00:00 2001
+From: Augustus <wangdw.augustus@qq.com>
+Date: Mon, 7 Mar 2022 18:21:49 +0800
+Subject: [PATCH 3/6] add checks for return value of limitMalloc (#392)
+
+---
+ tools/tiffcrop.c | 33 +++++++++++++++++++++------------
+ 1 file changed, 21 insertions(+), 12 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 302a7e91..e407bf51 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -7357,7 +7357,11 @@ createImageSection(uint32_t sectsize, unsigned ch=
ar **sect_buff_ptr)
+   if (!sect_buff)
+     {
+     sect_buff =3D (unsigned char *)limitMalloc(sectsize);
+-    *sect_buff_ptr =3D sect_buff;
++    if (!sect_buff)
++    {
++        TIFFError("createImageSection", "Unable to allocate/reallocate =
section buffer");
++        return (-1);
++    }
+     _TIFFmemset(sect_buff, 0, sectsize);
+     }
+   else
+@@ -7373,15 +7377,15 @@ createImageSection(uint32_t sectsize, unsigned c=
har **sect_buff_ptr)
+       else
+         sect_buff =3D new_buff;
+=20
++      if (!sect_buff)
++      {
++          TIFFError("createImageSection", "Unable to allocate/reallocat=
e section buffer");
++          return (-1);
++      }
+       _TIFFmemset(sect_buff, 0, sectsize);
+       }
+     }
+=20
+-  if (!sect_buff)
+-    {
+-    TIFFError("createImageSection", "Unable to allocate/reallocate sect=
ion buffer");
+-    return (-1);
+-    }
+   prev_sectsize =3D sectsize;
+   *sect_buff_ptr =3D sect_buff;
+=20
+@@ -7648,7 +7652,11 @@ createCroppedImage(struct image_data *image, stru=
ct crop_mask *crop,
+   if (!crop_buff)
+     {
+     crop_buff =3D (unsigned char *)limitMalloc(cropsize);
+-    *crop_buff_ptr =3D crop_buff;
++    if (!crop_buff)
++    {
++        TIFFError("createCroppedImage", "Unable to allocate/reallocate =
crop buffer");
++        return (-1);
++    }
+     _TIFFmemset(crop_buff, 0, cropsize);
+     prev_cropsize =3D cropsize;
+     }
+@@ -7664,15 +7672,15 @@ createCroppedImage(struct image_data *image, str=
uct crop_mask *crop,
+         }
+       else
+         crop_buff =3D new_buff;
++      if (!crop_buff)
++      {
++          TIFFError("createCroppedImage", "Unable to allocate/reallocat=
e crop buffer");
++          return (-1);
++      }
+       _TIFFmemset(crop_buff, 0, cropsize);
+       }
+     }
+=20
+-  if (!crop_buff)
+-    {
+-    TIFFError("createCroppedImage", "Unable to allocate/reallocate crop=
 buffer");
+-    return (-1);
+-    }
+   *crop_buff_ptr =3D crop_buff;
+=20
+   if (crop->crop_mode & CROP_INVERT)
+@@ -9231,3 +9239,4 @@ invertImage(uint16_t photometric, uint16_t spp, ui=
nt16_t bps, uint32_t width, ui
+  * fill-column: 78
+  * End:
+  */
++
+--=20
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag=
-avoid-calling-memcpy-with-a-null-.patch b/meta/recipes-multimedia/libtif=
f/tiff/0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-null-.patch
new file mode 100644
index 00000000000..719dabaecc9
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/0004-TIFFFetchNormalTag-avoid-=
calling-memcpy-with-a-null-.patch
@@ -0,0 +1,33 @@
+CVE: CVE-2022-0908
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From ef5a0bf271823df168642444d051528a68205cb0 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Thu, 17 Feb 2022 15:28:43 +0100
+Subject: [PATCH 4/6] TIFFFetchNormalTag(): avoid calling memcpy() with a=
 null
+ source pointer and size of zero (fixes #383)
+
+---
+ libtiff/tif_dirread.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
+index d84147a0..4e8ce729 100644
+--- a/libtiff/tif_dirread.c
++++ b/libtiff/tif_dirread.c
+@@ -5079,7 +5079,10 @@ TIFFFetchNormalTag(TIFF* tif, TIFFDirEntry* dp, i=
nt recover)
+ 								_TIFFfree(data);
+ 							return(0);
+ 						}
+-						_TIFFmemcpy(o,data,(uint32_t)dp->tdir_count);
++						if (dp->tdir_count > 0 )
++						{
++							_TIFFmemcpy(o,data,(uint32_t)dp->tdir_count);
++						}
+ 						o[(uint32_t)dp->tdir_count]=3D0;
+ 						if (data!=3D0)
+ 							_TIFFfree(data);
+--=20
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tif=
fcrop-393.patch b/meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-i=
n-tiffcrop-393.patch
new file mode 100644
index 00000000000..64dbe9ef92f
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/0005-fix-the-FPE-in-tiffcrop-3=
93.patch
@@ -0,0 +1,36 @@
+CVE: CVE-2022-0909
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 4768355a074d562177e0a8b551c561d1af7eb74a Mon Sep 17 00:00:00 2001
+From: 4ugustus <wangdw.augustus@qq.com>
+Date: Tue, 8 Mar 2022 16:22:04 +0000
+Subject: [PATCH 5/6] fix the FPE in tiffcrop (#393)
+
+---
+ libtiff/tif_dir.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libtiff/tif_dir.c b/libtiff/tif_dir.c
+index a6c254fc..77da6ea4 100644
+--- a/libtiff/tif_dir.c
++++ b/libtiff/tif_dir.c
+@@ -335,13 +335,13 @@ _TIFFVSetField(TIFF* tif, uint32_t tag, va_list ap=
)
+ 		break;
+ 	case TIFFTAG_XRESOLUTION:
+         dblval =3D va_arg(ap, double);
+-        if( dblval < 0 )
++        if( dblval !=3D dblval || dblval < 0 )
+             goto badvaluedouble;
+ 		td->td_xresolution =3D _TIFFClampDoubleToFloat( dblval );
+ 		break;
+ 	case TIFFTAG_YRESOLUTION:
+         dblval =3D va_arg(ap, double);
+-        if( dblval < 0 )
++        if( dblval !=3D dblval || dblval < 0 )
+             goto badvaluedouble;
+ 		td->td_yresolution =3D _TIFFClampDoubleToFloat( dblval );
+ 		break;
+--=20
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-ov=
erflow-in-tiffcp-278.patch b/meta/recipes-multimedia/libtiff/tiff/0006-fi=
x-heap-buffer-overflow-in-tiffcp-278.patch
new file mode 100644
index 00000000000..afd5e59960e
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/0006-fix-heap-buffer-overflow-=
in-tiffcp-278.patch
@@ -0,0 +1,57 @@
+CVE: CVE-2022-0924
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 1074b9691322b1e3671cd8ea0b6b3509d08978fb Mon Sep 17 00:00:00 2001
+From: 4ugustus <wangdw.augustus@qq.com>
+Date: Thu, 10 Mar 2022 08:48:00 +0000
+Subject: [PATCH 6/6] fix heap buffer overflow in tiffcp (#278)
+
+---
+ tools/tiffcp.c | 17 ++++++++++++++++-
+ 1 file changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/tools/tiffcp.c b/tools/tiffcp.c
+index 1f889516..552d8fad 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -1661,12 +1661,27 @@ DECLAREwriteFunc(writeBufferToSeparateStrips)
+ 	tdata_t obuf;
+ 	tstrip_t strip =3D 0;
+ 	tsample_t s;
++	uint16_t bps =3D 0, bytes_per_sample;
+=20
+ 	obuf =3D limitMalloc(stripsize);
+ 	if (obuf =3D=3D NULL)
+ 		return (0);
+ 	_TIFFmemset(obuf, 0, stripsize);
+ 	(void) TIFFGetFieldDefaulted(out, TIFFTAG_ROWSPERSTRIP, &rowsperstrip)=
;
++	(void) TIFFGetField(out, TIFFTAG_BITSPERSAMPLE, &bps);
++	if( bps =3D=3D 0 )
++        {
++            TIFFError(TIFFFileName(out), "Error, cannot read BitsPerSam=
ple");
++            _TIFFfree(obuf);
++            return 0;
++        }
++        if( (bps % 8) !=3D 0 )
++        {
++            TIFFError(TIFFFileName(out), "Error, cannot handle BitsPerS=
ample that is not a multiple of 8");
++            _TIFFfree(obuf);
++            return 0;
++        }
++	bytes_per_sample =3D bps/8;
+ 	for (s =3D 0; s < spp; s++) {
+ 		uint32_t row;
+ 		for (row =3D 0; row < imagelength; row +=3D rowsperstrip) {
+@@ -1676,7 +1691,7 @@ DECLAREwriteFunc(writeBufferToSeparateStrips)
+=20
+ 			cpContigBufToSeparateBuf(
+ 			    obuf, (uint8_t*) buf + row * rowsize + s,
+-			    nrows, imagewidth, 0, 0, spp, 1);
++			    nrows, imagewidth, 0, 0, spp, bytes_per_sample);
+ 			if (TIFFWriteEncodedStrip(out, strip++, obuf, stripsize) < 0) {
+ 				TIFFError(TIFFFileName(out),
+ 				    "Error, can't write strip %"PRIu32,
+--=20
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.3.0.bb
index 6b933a409b8..9c9108a6afd 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -11,7 +11,14 @@ CVE_PRODUCT =3D "libtiff"
 SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags=
-wh.patch \
            file://561599c99f987dc32ae110370cfdd7df7975586b.patch \
-           file://eecb0712f4c3a5b449f70c57988260a667ddbdef.patch"
+           file://eecb0712f4c3a5b449f70c57988260a667ddbdef.patch \
+           file://0001-tif_jbig.c-fix-crash-when-reading-a-file-with-mul=
tip.patch \
+           file://0002-tiffcrop-fix-issue-380-and-382-heap-buffer-overfl=
ow-.patch \
+           file://0003-add-checks-for-return-value-of-limitMalloc-392.pa=
tch \
+           file://0004-TIFFFetchNormalTag-avoid-calling-memcpy-with-a-nu=
ll-.patch \
+           file://0005-fix-the-FPE-in-tiffcrop-393.patch \
+           file://0006-fix-heap-buffer-overflow-in-tiffcp-278.patch \
+           "
=20
 SRC_URI[sha256sum] =3D "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daa=
ad1c2e89e1b37ac8"
=20
--=20
2.25.1


