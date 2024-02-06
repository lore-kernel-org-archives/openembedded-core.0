Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05AA2C48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 16:30:48 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.26096.1707237038580346351
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 08:30:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=ItS6KBi2;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id D1E60240101
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Feb 2024 17:30:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1707237036; bh=7DyVSG0Qu6N3LzJMTH9BP26wB0eY9SmaPwDXakLpsyI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=ItS6KBi2KtZHzOIB15p6vYeDLneQ1qi0CzpHW5ZDdI2JztIac+1BtSb+fhVgA+V8D
	 rR4359jRKTV1JpGEReBraeRTA9fUSd3y2AwvUez5+HCM3NLE8H6fy499YO6llw5PqL
	 sLA74YwQbQb5avRw63/eElKbQva2mUVuqSwGChvJxgXxP2x0M0yZZPXGWvUsqtO8a0
	 2WWzwnf7ciBIrGNLaoyhCXDtuKRs1f8Mav0IMcVPqLf732tktBS8eu25x+1bKVPXi3
	 L2ahRXcGs0VtUJKM0r9MTEhwoItTiNOIu9u8FZDShaW5a6M3LWYKTLm+EUAjqO4zX4
	 PCQ9lyCC+oWIg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TTpdR6wg4z6txX;
	Tue,  6 Feb 2024 17:30:35 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	=?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] tiff: fix CVE 2023-52356
Date: Tue,  6 Feb 2024 16:30:27 +0000
Message-Id: <20240206163027.2727885-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 16:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195011

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

fix CVE 2023-52356
A segment fault (SEGV) flaw was found in libtiff that could be triggered
by passing a crafted tiff file to the TIFFReadRGBATileExt() API.
This flaw allows a remote attacker to cause a heap-buffer overflow, leadi=
ng
to a denial of service.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-52356
https://gitlab.com/libtiff/libtiff/-/commit/51558511bdbbcffdce534db21dbaf=
5d54b31638a

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 .../libtiff/tiff/CVE-2023-52356.patch         | 50 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |  3 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.p=
atch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch b/=
meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch
new file mode 100644
index 0000000000..9a6d9a39d9
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch
@@ -0,0 +1,50 @@
+From 51558511bdbbcffdce534db21dbaf5d54b31638a Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Tue, 31 Oct 2023 15:58:41 +0100
+Subject: [PATCH] TIFFReadRGBAStrip/TIFFReadRGBATile: add more validation=
 of
+ col/row (fixes #622)
+
+CVE: CVE-2023-52356
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/5=
1558511bdbbcffdce534db21dbaf5d54b31638a]
+
+Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
+
+---
+ libtiff/tif_getimage.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index 41f7dfd77..6fee35db2 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -3224,6 +3224,13 @@ int TIFFReadRGBAStripExt(TIFF *tif, uint32_t row,=
 uint32_t *raster,
+     if (TIFFRGBAImageOK(tif, emsg) &&
+         TIFFRGBAImageBegin(&img, tif, stop_on_error, emsg))
+     {
++        if (row >=3D img.height)
++        {
++            TIFFErrorExtR(tif, TIFFFileName(tif),
++                          "Invalid row passed to TIFFReadRGBAStrip().")=
;
++            TIFFRGBAImageEnd(&img);
++            return (0);
++        }
+=20
+         img.row_offset =3D row;
+         img.col_offset =3D 0;
+@@ -3301,6 +3308,14 @@ int TIFFReadRGBATileExt(TIFF *tif, uint32_t col, =
uint32_t row, uint32_t *raster,
+         return (0);
+     }
+=20
++    if (col >=3D img.width || row >=3D img.height)
++    {
++        TIFFErrorExtR(tif, TIFFFileName(tif),
++                      "Invalid row/col passed to TIFFReadRGBATile().");
++        TIFFRGBAImageEnd(&img);
++        return (0);
++    }
++
+     /*
+      * The TIFFRGBAImageGet() function doesn't allow us to get off the
+      * edge of the image, even to fill an otherwise valid tile.  So we
+--
+2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.6.0.bb
index eb8a096f19..ab658a2a03 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
@@ -13,7 +13,8 @@ SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${P=
V}.tar.gz \
            file://CVE-2023-6277-At-image-reading-compare-data-size-of-so=
me-tags-data-2.patch \
            file://CVE-2023-6277-Apply-1-suggestion-s-to-1-file-s.patch \
            file://CVE-2023-6228.patch \
-           "
+           file://CVE-2023-52356.patch \
+"
=20
 SRC_URI[sha256sum] =3D "88b3979e6d5c7e32b50d7ec72fb15af724f6ab2cbf7e1088=
0c360a77e4b5d99a"
=20
--=20
2.39.2


