Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0A3CDB465
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 01:17:08 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.1713.1697073425277957570
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 18:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=QN3veHml;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6F27F85423;
	Thu, 12 Oct 2023 03:16:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1697073415;
	bh=NrMs2Du3lvN2rgJwXnnIKNSqHAxdJdUxHC77ZGl/bR4=;
	h=From:To:Cc:Subject:Date:From;
	b=QN3veHml5C7VcsuEOT9ms45dx0khF5sxduqnvcGSFo2yieRF6RfP6vNXh7ZisPBt0
	 H+lxqIPbjBZEZoSX5Qc/9z6yqOitQ82IA5Gk9sbS6FRqvU4TI+3TZu7of8EtZ98KiE
	 OE6n6Bnnss7uxOzr/yWAo6MmMefNpZXOaJpQb019z90IMfGiz9KoQkd2Ycd95amM19
	 l7zrzxQMvJtquqI+2SCRmqrpSv4yKmrlcbKpGbQWQZ8uOre3ZNDbaMsT5hVdZlTRHH
	 d9mHcavhrdfGJodgd1nibx2jDwtybPf9d3EASo7CUgTFx0Qd4yrHgvaKS++RLKRbQh
	 QyHDxtaIcwoCQ==
From: Marek Vasut <marex@denx.de>
To: steve@sakoman.com,
	openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>
Subject: [dunfell][PATCH] libtiff: Add fix for tiffcrop CVE-2023-1916
Date: Thu, 12 Oct 2023 03:16:43 +0200
Message-Id: <20231012011643.457594-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 01:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188975

Add fix for tiffcrop tool CVE-2023-1916 [1].

A flaw was found in tiffcrop, a program distributed by the libtiff
package. A specially crafted tiff file can lead to an out-of-bounds
read in the extractImageSection function in tools/tiffcrop.c, resulting
in a denial of service and limited information disclosure. This issue
affects libtiff versions 4.x.

The tool is no longer part of newer libtiff distributions, hence the
fix is rejected by upstream in [2]. The backport is still applicable
to older versions of libtiff, pick the CVE fix from ubuntu 20.04 [3].

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-1916
[2] https://gitlab.com/libtiff/libtiff/-/merge_requests/535
[3] https://packages.ubuntu.com/source/focal-updates/tiff

Signed-off-by: Marek Vasut <marex@denx.de>
---
 .../libtiff/files/CVE-2023-1916.patch         | 91 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-1916.p=
atch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-1916.patch b/=
meta/recipes-multimedia/libtiff/files/CVE-2023-1916.patch
new file mode 100644
index 0000000000..9915b77645
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-1916.patch
@@ -0,0 +1,91 @@
+From 848434a81c443f59ec90d41218eba6e48a450a11 Mon Sep 17 00:00:00 2001
+From: zhailiangliang <zhailiangliang@loongson.cn>
+Date: Thu, 16 Mar 2023 16:16:54 +0800
+Subject: [PATCH] Fix heap-buffer-overflow in function extractImageSectio=
n
+
+CVE: CVE-2023-1916
+Upstream-Status: Submitted [https://gitlab.com/libtiff/libtiff/-/commit/=
848434a81c443f59ec90d41218eba6e48a450a11 https://gitlab.com/libtiff/libti=
ff/-/merge_requests/535]
+Signed-off-by: Marek Vasut <marex@denx.de>
+---
+ archive/tools/tiffcrop.c | 62 +++++++++++++++++++++++++++++-----------
+ 1 file changed, 45 insertions(+), 17 deletions(-)
+
+--- tiff-4.1.0+git191117.orig/tools/tiffcrop.c
++++ tiff-4.1.0+git191117/tools/tiffcrop.c
+@@ -5549,6 +5549,15 @@ getCropOffsets(struct image_data *image,
+              crop->combined_width +=3D (uint32)zwidth;
+            else
+              crop->combined_width =3D (uint32)zwidth;
++
++           /* When the degrees clockwise rotation is 90 or 270, check t=
he boundary */
++           if (((crop->rotation =3D=3D 90) || (crop->rotation =3D=3D 27=
0))
++               && ((crop->combined_length > image->width) || (crop->com=
bined_width > image->length)))
++           {
++               TIFFError("getCropOffsets", "The crop size exceeds the i=
mage boundary size");
++               return -1;
++           }
++
+            break;
+       case EDGE_BOTTOM: /* width from left, zones from bottom to top */
+            zwidth =3D offsets.crop_width;
+@@ -5579,6 +5588,15 @@ getCropOffsets(struct image_data *image,
+            else
+              crop->combined_length =3D (uint32)zlength;
+            crop->combined_width =3D (uint32)zwidth;
++
++           /* When the degrees clockwise rotation is 90 or 270, check t=
he boundary */
++           if (((crop->rotation =3D=3D 90) || (crop->rotation =3D=3D 27=
0))
++               && ((crop->combined_length > image->width) || (crop->com=
bined_width > image->length)))
++           {
++               TIFFError("getCropOffsets", "The crop size exceeds the i=
mage boundary size");
++               return -1;
++           }
++
+            break;
+       case EDGE_RIGHT: /* zones from right to left, length from top */
+            zlength =3D offsets.crop_length;
+@@ -5606,6 +5624,15 @@ getCropOffsets(struct image_data *image,
+              crop->combined_width +=3D (uint32)zwidth;
+            else
+              crop->combined_width =3D (uint32)zwidth;
++
++           /* When the degrees clockwise rotation is 90 or 270, check t=
he boundary */
++           if (((crop->rotation =3D=3D 90) || (crop->rotation =3D=3D 27=
0))
++               && ((crop->combined_length > image->width) || (crop->com=
bined_width > image->length)))
++           {
++               TIFFError("getCropOffsets", "The crop size exceeds the i=
mage boundary size");
++               return -1;
++           }
++
+            break;
+       case EDGE_TOP: /* width from left, zones from top to bottom */
+       default:
+@@ -5632,6 +5659,15 @@ getCropOffsets(struct image_data *image,
+            else
+              crop->combined_length =3D (uint32)zlength;
+            crop->combined_width =3D (uint32)zwidth;
++
++           /* When the degrees clockwise rotation is 90 or 270, check t=
he boundary */
++           if (((crop->rotation =3D=3D 90) || (crop->rotation =3D=3D 27=
0))
++               && ((crop->combined_length > image->width) || (crop->com=
bined_width > image->length)))
++           {
++               TIFFError("getCropOffsets", "The crop size exceeds the i=
mage boundary size");
++               return -1;
++           }
++
+            break;
+       } /* end switch statement */
+=20
+@@ -6827,9 +6863,9 @@ extractImageSection(struct image_data *i
+      * regardless of the way the data are organized in the input file.
+      * Furthermore, bytes and bits are arranged in buffer according to =
COMPRESSION=3D1 and FILLORDER=3D1=20
+      */
+-    img_rowsize =3D (((img_width * spp * bps) + 7) / 8);    /* row size=
 in full bytes of source image */
+-    full_bytes =3D (sect_width * spp * bps) / 8;            /* number o=
f COMPLETE bytes per row in section */
+-    trailing_bits =3D (sect_width * spp * bps) % 8;         /* trailing=
 bits within the last byte of destination buffer */
++    img_rowsize =3D (((img_width * spp * bps) + 7) / 8);  /* row size i=
n full bytes of source image */
++    full_bytes =3D (sect_width * spp * bps) / 8;          /* number of =
COMPLETE bytes per row in section */
++    trailing_bits =3D (sect_width * spp * bps) % 8;       /* trailing b=
its within the last byte of destination buffer */
+=20
+ #ifdef DEVELMODE
+     TIFFError ("", "First row: %d, last row: %d, First col: %d, last co=
l: %d\n",
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.1.0.bb
index e3daaf1007..6df4244697 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -36,6 +36,7 @@ SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${P=
V}.tar.gz \
            file://CVE-2022-48281.patch \
            file://CVE-2023-0795_0796_0797_0798_0799.patch \
            file://CVE-2023-0800_0801_0802_0803_0804.patch \
+           file://CVE-2023-1916.patch \
            file://CVE-2023-25433.patch \
            file://CVE-2023-25434-CVE-2023-25435.patch \
            file://CVE-2023-26965.patch \
--=20
2.40.1


