Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACEF6C43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 13:19:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.28374.1657545548073673348
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 06:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02B7A1596;
	Mon, 11 Jul 2022 06:19:08 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22FA03F70D;
	Mon, 11 Jul 2022 06:19:07 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] tiff: backport the fix for CVE-2022-2056, CVE-2022-2057,
 and CVE-2022-2058
Date: Mon, 11 Jul 2022 14:19:03 +0100
Message-Id: <20220711131905.3536120-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 13:19:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167868

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-the-FPE-in-tiffcrop-415-427-and-428.patch | 184 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |   3 +-
 2 files changed, 186 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/files/0001-fix-the-FP=
E-in-tiffcrop-415-427-and-428.patch

diff --git a/meta/recipes-multimedia/libtiff/files/0001-fix-the-FPE-in-ti=
ffcrop-415-427-and-428.patch b/meta/recipes-multimedia/libtiff/files/0001=
-fix-the-FPE-in-tiffcrop-415-427-and-428.patch
new file mode 100644
index 00000000000..c7c5f616ed0
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/0001-fix-the-FPE-in-tiffcrop-=
415-427-and-428.patch
@@ -0,0 +1,184 @@
+CVE: CVE-2022-2056 CVE-2022-2057 CVE-2022-2058
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 22a205da86ca2d038d0066e1d70752d117258fb4 Mon Sep 17 00:00:00 2001
+From: 4ugustus <wangdw.augustus@qq.com>
+Date: Sat, 11 Jun 2022 09:31:43 +0000
+Subject: [PATCH] fix the FPE in tiffcrop (#415, #427, and #428)
+
+---
+ libtiff/tif_aux.c |  9 +++++++
+ libtiff/tiffiop.h |  1 +
+ tools/tiffcrop.c  | 62 ++++++++++++++++++++++++++---------------------
+ 3 files changed, 44 insertions(+), 28 deletions(-)
+
+diff --git a/libtiff/tif_aux.c b/libtiff/tif_aux.c
+index 140f26c7..5b88c8d0 100644
+--- a/libtiff/tif_aux.c
++++ b/libtiff/tif_aux.c
+@@ -402,6 +402,15 @@ float _TIFFClampDoubleToFloat( double val )
+     return (float)val;
+ }
+=20
++uint32_t _TIFFClampDoubleToUInt32(double val)
++{
++    if( val < 0 )
++        return 0;
++    if( val > 0xFFFFFFFFU || val !=3D val )
++        return 0xFFFFFFFFU;
++    return (uint32_t)val;
++}
++
+ int _TIFFSeekOK(TIFF* tif, toff_t off)
+ {
+     /* Huge offsets, especially -1 / UINT64_MAX, can cause issues */
+diff --git a/libtiff/tiffiop.h b/libtiff/tiffiop.h
+index e3af461d..4e8bdac2 100644
+--- a/libtiff/tiffiop.h
++++ b/libtiff/tiffiop.h
+@@ -365,6 +365,7 @@ extern double _TIFFUInt64ToDouble(uint64_t);
+ extern float _TIFFUInt64ToFloat(uint64_t);
+=20
+ extern float _TIFFClampDoubleToFloat(double);
++extern uint32_t _TIFFClampDoubleToUInt32(double);
+=20
+ extern tmsize_t
+ _TIFFReadEncodedStripAndAllocBuffer(TIFF* tif, uint32_t strip,
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 1f827b2b..90286a5e 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -5268,17 +5268,17 @@ computeInputPixelOffsets(struct crop_mask *crop,=
 struct image_data *image,
+       {
+       if ((crop->res_unit =3D=3D RESUNIT_INCH) || (crop->res_unit =3D=3D=
 RESUNIT_CENTIMETER))
+         {
+-	x1 =3D (uint32_t) (crop->corners[i].X1 * scale * xres);
+-	x2 =3D (uint32_t) (crop->corners[i].X2 * scale * xres);
+-	y1 =3D (uint32_t) (crop->corners[i].Y1 * scale * yres);
+-	y2 =3D (uint32_t) (crop->corners[i].Y2 * scale * yres);
++	x1 =3D _TIFFClampDoubleToUInt32(crop->corners[i].X1 * scale * xres);
++	x2 =3D _TIFFClampDoubleToUInt32(crop->corners[i].X2 * scale * xres);
++	y1 =3D _TIFFClampDoubleToUInt32(crop->corners[i].Y1 * scale * yres);
++	y2 =3D _TIFFClampDoubleToUInt32(crop->corners[i].Y2 * scale * yres);
+         }
+       else
+         {
+-	x1 =3D (uint32_t) (crop->corners[i].X1);
+-	x2 =3D (uint32_t) (crop->corners[i].X2);
+-	y1 =3D (uint32_t) (crop->corners[i].Y1);
+-	y2 =3D (uint32_t) (crop->corners[i].Y2);
++	x1 =3D _TIFFClampDoubleToUInt32(crop->corners[i].X1);
++	x2 =3D _TIFFClampDoubleToUInt32(crop->corners[i].X2);
++	y1 =3D _TIFFClampDoubleToUInt32(crop->corners[i].Y1);
++	y2 =3D _TIFFClampDoubleToUInt32(crop->corners[i].Y2);
+ 	}
+       /* a) Region needs to be within image sizes 0.. width-1; 0..lengt=
h-1=20
+        * b) Corners are expected to be submitted as top-left to bottom-=
right.
+@@ -5357,17 +5357,17 @@ computeInputPixelOffsets(struct crop_mask *crop,=
 struct image_data *image,
+     {
+     if (crop->res_unit !=3D RESUNIT_INCH && crop->res_unit !=3D RESUNIT=
_CENTIMETER)
+       { /* User has specified pixels as reference unit */
+-      tmargin =3D (uint32_t)(crop->margins[0]);
+-      lmargin =3D (uint32_t)(crop->margins[1]);
+-      bmargin =3D (uint32_t)(crop->margins[2]);
+-      rmargin =3D (uint32_t)(crop->margins[3]);
++      tmargin =3D _TIFFClampDoubleToUInt32(crop->margins[0]);
++      lmargin =3D _TIFFClampDoubleToUInt32(crop->margins[1]);
++      bmargin =3D _TIFFClampDoubleToUInt32(crop->margins[2]);
++      rmargin =3D _TIFFClampDoubleToUInt32(crop->margins[3]);
+       }
+     else
+       { /* inches or centimeters specified */
+-      tmargin =3D (uint32_t)(crop->margins[0] * scale * yres);
+-      lmargin =3D (uint32_t)(crop->margins[1] * scale * xres);
+-      bmargin =3D (uint32_t)(crop->margins[2] * scale * yres);
+-      rmargin =3D (uint32_t)(crop->margins[3] * scale * xres);
++      tmargin =3D _TIFFClampDoubleToUInt32(crop->margins[0] * scale * y=
res);
++      lmargin =3D _TIFFClampDoubleToUInt32(crop->margins[1] * scale * x=
res);
++      bmargin =3D _TIFFClampDoubleToUInt32(crop->margins[2] * scale * y=
res);
++      rmargin =3D _TIFFClampDoubleToUInt32(crop->margins[3] * scale * x=
res);
+       }
+=20
+     if ((lmargin + rmargin) > image->width)
+@@ -5397,24 +5397,24 @@ computeInputPixelOffsets(struct crop_mask *crop,=
 struct image_data *image,
+   if (crop->res_unit !=3D RESUNIT_INCH && crop->res_unit !=3D RESUNIT_C=
ENTIMETER)
+     {
+     if (crop->crop_mode & CROP_WIDTH)
+-      width =3D (uint32_t)crop->width;
++      width =3D _TIFFClampDoubleToUInt32(crop->width);
+     else
+       width =3D image->width - lmargin - rmargin;
+=20
+     if (crop->crop_mode & CROP_LENGTH)
+-      length  =3D (uint32_t)crop->length;
++      length  =3D _TIFFClampDoubleToUInt32(crop->length);
+     else
+       length =3D image->length - tmargin - bmargin;
+     }
+   else
+     {
+     if (crop->crop_mode & CROP_WIDTH)
+-      width =3D (uint32_t)(crop->width * scale * image->xres);
++      width =3D _TIFFClampDoubleToUInt32(crop->width * scale * image->x=
res);
+     else
+       width =3D image->width - lmargin - rmargin;
+=20
+     if (crop->crop_mode & CROP_LENGTH)
+-      length  =3D (uint32_t)(crop->length * scale * image->yres);
++      length  =3D _TIFFClampDoubleToUInt32(crop->length * scale * image=
->yres);
+     else
+       length =3D image->length - tmargin - bmargin;
+     }
+@@ -5868,13 +5868,13 @@ computeOutputPixelOffsets (struct crop_mask *cro=
p, struct image_data *image,
+     {
+     if (page->res_unit =3D=3D RESUNIT_INCH || page->res_unit =3D=3D RES=
UNIT_CENTIMETER)
+       { /* inches or centimeters specified */
+-      hmargin =3D (uint32_t)(page->hmargin * scale * page->hres * ((ima=
ge->bps + 7) / 8));
+-      vmargin =3D (uint32_t)(page->vmargin * scale * page->vres * ((ima=
ge->bps + 7) / 8));
++      hmargin =3D _TIFFClampDoubleToUInt32(page->hmargin * scale * page=
->hres * ((image->bps + 7) / 8));
++      vmargin =3D _TIFFClampDoubleToUInt32(page->vmargin * scale * page=
->vres * ((image->bps + 7) / 8));
+       }
+     else
+       { /* Otherwise user has specified pixels as reference unit */
+-      hmargin =3D (uint32_t)(page->hmargin * scale * ((image->bps + 7) =
/ 8));
+-      vmargin =3D (uint32_t)(page->vmargin * scale * ((image->bps + 7) =
/ 8));
++      hmargin =3D _TIFFClampDoubleToUInt32(page->hmargin * scale * ((im=
age->bps + 7) / 8));
++      vmargin =3D _TIFFClampDoubleToUInt32(page->vmargin * scale * ((im=
age->bps + 7) / 8));
+       }
+=20
+     if ((hmargin * 2.0) > (pwidth * page->hres))
+@@ -5912,13 +5912,13 @@ computeOutputPixelOffsets (struct crop_mask *cro=
p, struct image_data *image,
+     {
+     if (page->mode & PAGE_MODE_PAPERSIZE )
+       {
+-      owidth  =3D (uint32_t)((pwidth * page->hres) - (hmargin * 2));
+-      olength =3D (uint32_t)((plength * page->vres) - (vmargin * 2));
++      owidth  =3D _TIFFClampDoubleToUInt32((pwidth * page->hres) - (hma=
rgin * 2));
++      olength =3D _TIFFClampDoubleToUInt32((plength * page->vres) - (vm=
argin * 2));
+       }
+     else
+       {
+-      owidth =3D (uint32_t)(iwidth - (hmargin * 2 * page->hres));
+-      olength =3D (uint32_t)(ilength - (vmargin * 2 * page->vres));
++      owidth =3D _TIFFClampDoubleToUInt32(iwidth - (hmargin * 2 * page-=
>hres));
++      olength =3D _TIFFClampDoubleToUInt32(ilength - (vmargin * 2 * pag=
e->vres));
+       }
+     }
+=20
+@@ -5927,6 +5927,12 @@ computeOutputPixelOffsets (struct crop_mask *crop=
, struct image_data *image,
+   if (olength > ilength)
+     olength =3D ilength;
+=20
++  if (owidth =3D=3D 0 || olength =3D=3D 0)
++  {
++    TIFFError("computeOutputPixelOffsets", "Integer overflow when calcu=
lating the number of pages");
++    exit(EXIT_FAILURE);
++  }
++
+   /* Compute the number of pages required for Portrait or Landscape */
+   switch (page->orient)
+     {
+--=20
+2.34.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.4.0.bb
index c82965ffa19..0af956a8f0f 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D34da3db46fab=
7501992f9615d7e158cf"
=20
 CVE_PRODUCT =3D "libtiff"
=20
-SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz"
+SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
+           file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch"
=20
 SRC_URI[sha256sum] =3D "917223b37538959aca3b790d2d73aa6e626b688e02dcda27=
2aec24c2f498abed"
=20
--=20
2.34.1


