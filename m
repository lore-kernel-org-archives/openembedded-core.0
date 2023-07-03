Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8882C0015E
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 12:31:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.31452.1688387457569161640
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jul 2023 05:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7377CC14;
	Mon,  3 Jul 2023 05:31:39 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 312C93F73F;
	Mon,  3 Jul 2023 05:30:56 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] tiff: upgrade to 4.5.1
Date: Mon,  3 Jul 2023 13:30:49 +0100
Message-Id: <20230703123049.525813-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703123049.525813-1-ross.burton@arm.com>
References: <20230703123049.525813-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 12:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183802

From: Ross Burton <ross.burton@arm.com>

Also remove old CVE_CHECK_IGNOREs which are no longer needed due to CPE
updates.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libtiff/files/CVE-2022-48281.patch        | 29 ------
 .../libtiff/files/CVE-2023-26965.patch        | 99 -------------------
 .../libtiff/files/CVE-2023-2731.patch         | 39 --------
 .../libtiff/{tiff_4.5.0.bb =3D> tiff_4.5.1.bb}  | 13 +--
 4 files changed, 2 insertions(+), 178 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-48281.=
patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-26965.=
patch
 delete mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-2731.p=
atch
 rename meta/recipes-multimedia/libtiff/{tiff_4.5.0.bb =3D> tiff_4.5.1.bb=
} (82%)

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch b=
/meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
deleted file mode 100644
index e356d377ead..00000000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2022-48281.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-CVE: CVE-2022-48281
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 97d65859bc29ee334012e9c73022d8a8e55ed586 Mon Sep 17 00:00:00 2001
-From: Su Laus <sulau@freenet.de>
-Date: Sat, 21 Jan 2023 15:58:10 +0000
-Subject: [PATCH] tiffcrop: Correct simple copy paste error. Fix #488.
-
----
- tools/tiffcrop.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
-index 14fa18da..7db69883 100644
---- a/tools/tiffcrop.c
-+++ b/tools/tiffcrop.c
-@@ -8591,7 +8591,7 @@ static int processCropSelections(struct image_data=
 *image,
-                     cropsize + NUM_BUFF_OVERSIZE_BYTES);
-             else
-             {
--                prev_cropsize =3D seg_buffs[0].size;
-+                prev_cropsize =3D seg_buffs[i].size;
-                 if (prev_cropsize < cropsize)
-                 {
-                     next_buff =3D _TIFFrealloc(
---=20
-GitLab
-
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch b=
/meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch
deleted file mode 100644
index 5fdc1ed0139..00000000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From ec8ef90c1f573c9eb1f17d6a056aa0015f184acf Mon Sep 17 00:00:00 2001
-From: Su_Laus <sulau@freenet.de>
-Date: Tue, 14 Feb 2023 20:43:43 +0100
-Subject: [PATCH] tiffcrop: Do not reuse input buffer for subsequent imag=
es.
- Fix issue 527
-
-Reuse of read_buff within loadImage() from previous image is quite unsaf=
e, because other functions (like rotateImage() etc.) reallocate that buff=
er with different size without updating the local prev_readsize value.
-
-Closes #527
-
-CVE: CVE-2023-26965
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/e=
c8ef90c1f573c9eb1f17d6a056aa0015f184acf]
-Signed-off-by: Natasha Bailey <nat.bailey@windriver.com>
----
- tools/tiffcrop.c | 47 +++++++++++++----------------------------------
- 1 file changed, 13 insertions(+), 34 deletions(-)
-
-diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
-index d7ad5ca8..d3e11ba2 100644
---- a/tools/tiffcrop.c
-+++ b/tools/tiffcrop.c
-@@ -6771,9 +6771,7 @@ static int loadImage(TIFF *in, struct image_data *=
image, struct dump_opts *dump,
-     uint32_t tw =3D 0, tl =3D 0; /* Tile width and length */
-     tmsize_t tile_rowsize =3D 0;
-     unsigned char *read_buff =3D NULL;
--    unsigned char *new_buff =3D NULL;
-     int readunit =3D 0;
--    static tmsize_t prev_readsize =3D 0;
-=20
-     TIFFGetFieldDefaulted(in, TIFFTAG_BITSPERSAMPLE, &bps);
-     TIFFGetFieldDefaulted(in, TIFFTAG_SAMPLESPERPIXEL, &spp);
-@@ -7097,43 +7095,25 @@ static int loadImage(TIFF *in, struct image_data=
 *image, struct dump_opts *dump,
-     }
-=20
-     read_buff =3D *read_ptr;
--    /* +3 : add a few guard bytes since reverseSamples16bits() can read=
 a bit */
--    /* outside buffer */
--    if (!read_buff)
-+    /* +3 : add a few guard bytes since reverseSamples16bits() can read=
 a bit
-+     * outside buffer */
-+    /* Reuse of read_buff from previous image is quite unsafe, because =
other
-+     * functions (like rotateImage() etc.) reallocate that buffer with =
different
-+     * size without updating the local prev_readsize value. */
-+    if (read_buff)
-     {
--        if (buffsize > 0xFFFFFFFFU - 3)
--        {
--            TIFFError("loadImage", "Unable to allocate/reallocate read =
buffer");
--            return (-1);
--        }
--        read_buff =3D
--            (unsigned char *)limitMalloc(buffsize + NUM_BUFF_OVERSIZE_B=
YTES);
-+        _TIFFfree(read_buff);
-     }
--    else
-+    if (buffsize > 0xFFFFFFFFU - 3)
-     {
--        if (prev_readsize < buffsize)
--        {
--            if (buffsize > 0xFFFFFFFFU - 3)
--            {
--                TIFFError("loadImage",
--                          "Unable to allocate/reallocate read buffer");
--                return (-1);
--            }
--            new_buff =3D
--                _TIFFrealloc(read_buff, buffsize + NUM_BUFF_OVERSIZE_BY=
TES);
--            if (!new_buff)
--            {
--                free(read_buff);
--                read_buff =3D (unsigned char *)limitMalloc(
--                    buffsize + NUM_BUFF_OVERSIZE_BYTES);
--            }
--            else
--                read_buff =3D new_buff;
--        }
-+        TIFFError("loadImage", "Required read buffer size too large");
-+        return (-1);
-     }
-+    read_buff =3D
-+        (unsigned char *)limitMalloc(buffsize + NUM_BUFF_OVERSIZE_BYTES=
);
-     if (!read_buff)
-     {
--        TIFFError("loadImage", "Unable to allocate/reallocate read buff=
er");
-+        TIFFError("loadImage", "Unable to allocate read buffer");
-         return (-1);
-     }
-=20
-@@ -7141,7 +7121,6 @@ static int loadImage(TIFF *in, struct image_data *=
image, struct dump_opts *dump,
-     read_buff[buffsize + 1] =3D 0;
-     read_buff[buffsize + 2] =3D 0;
-=20
--    prev_readsize =3D buffsize;
-     *read_ptr =3D read_buff;
-=20
-     /* N.B. The read functions used copy separate plane data into a buf=
fer as
---=20
-2.39.0
-
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch b/=
meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch
deleted file mode 100644
index 7db0a35f72b..00000000000
--- a/meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 9be22b639ea69e102d3847dca4c53ef025e9527b Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Sat, 29 Apr 2023 12:20:46 +0200
-Subject: [PATCH] LZWDecode(): avoid crash when trying to read again from=
 a
- strip whith a missing end-of-information marker (fixes #548)
-
-CVE: CVE-2023-2731
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/9=
be22b639ea69e102d3847dca4c53ef025e9527b]
-
----
- libtiff/tif_lzw.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/libtiff/tif_lzw.c b/libtiff/tif_lzw.c
-index ba75a07e..d631fa10 100644
---- a/libtiff/tif_lzw.c
-+++ b/libtiff/tif_lzw.c
-@@ -423,6 +423,10 @@ static int LZWDecode(TIFF *tif, uint8_t *op0, tmsiz=
e_t occ0, uint16_t s)
-=20
-     if (sp->read_error)
-     {
-+        TIFFErrorExtR(tif, module,
-+                      "LZWDecode: Scanline %" PRIu32 " cannot be read d=
ue to "
-+                      "previous error",
-+                      tif->tif_row);
-         return 0;
-     }
-=20
-@@ -742,6 +746,7 @@ after_loop:
-     return (1);
-=20
- no_eoi:
-+    sp->read_error =3D 1;
-     TIFFErrorExtR(tif, module,
-                   "LZWDecode: Strip %" PRIu32 " not terminated with EOI=
 code",
-                   tif->tif_curstrip);
---=20
-2.34.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.5.1.bb
similarity index 82%
rename from meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
rename to meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
index 2bde8fe9d65..5af3f842650 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb
@@ -8,13 +8,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da3e32d664d=
6db1386b4689c8121531c3"
=20
 CVE_PRODUCT =3D "libtiff"
=20
-SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
-           file://CVE-2022-48281.patch \
-           file://CVE-2023-2731.patch \
-           file://CVE-2023-26965.patch \
-"
+SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz"
=20
-SRC_URI[sha256sum] =3D "c7a1d9296649233979fa3eacffef3fa024d73d05d589cb62=
2727b5b08c423464"
+SRC_URI[sha256sum] =3D "d7f38b6788e4a8f5da7940c5ac9424f494d8a79eba53d555=
f4a507167dca5e2b"
=20
 # exclude betas
 UPSTREAM_CHECK_REGEX =3D "tiff-(?P<pver>\d+(\.\d+)+).tar"
@@ -22,11 +18,6 @@ UPSTREAM_CHECK_REGEX =3D "tiff-(?P<pver>\d+(\.\d+)+).t=
ar"
 # Tested with check from https://security-tracker.debian.org/tracker/CVE=
-2015-7313
 # and 4.3.0 doesn't have the issue
 CVE_CHECK_IGNORE +=3D "CVE-2015-7313"
-# These issues only affect libtiff post-4.3.0 but before 4.4.0,
-# caused by 3079627e and fixed by b4e79bfa.
-CVE_CHECK_IGNORE +=3D "CVE-2022-1622 CVE-2022-1623"
-# Issue is in jbig which we don't enable
-CVE_CHECK_IGNORE +=3D "CVE-2022-1210"
=20
 inherit autotools multilib_header
=20
--=20
2.34.1


