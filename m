Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1C9C433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 02:31:02 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.333.1652841062160293073
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 19:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rXnfKXzN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id n10so635779pjh.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 19:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HMVhZMaQj7Hu+GlKbx3M66HvBNYPuUvKeu4pse5eSHQ=;
        b=rXnfKXzNO6rTPSLerzjG9QTCszInvWB/QKlmmqIsICgJPNOQxGUyzwsSNxfttMfl/L
         CxoE8MdDQiI42I5utFp+mzlz4lI4I8yGJV1QYNC+jojH9bdZXTZmOf9aXcxS6nhY0MeF
         50W9yFFr0YP9cAw3QPxJ6GswKdTFpiyTZnMssRhsS7wnqP4iz1nRMU0TqWRS8y9YcG4O
         2iAH1qqPvlpWpGhGRbsmLnXIaw3B9RwUaaJATP7O1rvf1GkeRt4Aloe3e7sbEBks4fgY
         JTHJf6EL8fovchv+Ewq8+C926nFAkLBfPyGlhjyfm9PXUoJ+iC+4Wh9s7DFqAa+dhifg
         aMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HMVhZMaQj7Hu+GlKbx3M66HvBNYPuUvKeu4pse5eSHQ=;
        b=Frb96F7okTkGN9n5sdoPtUugGAiL+qYNmFAyRaCdVuyXD6N+GJC3ntf6XI8PZGE4rm
         hCDrCGzZzDPnseptJiFE95c6NaE5P3w5D473RE/L7M5DdmWGA5Qps1nbXoSNGg4cfzbe
         KY/Ho1/6Wx4WRlxpnbZYwoU1De8tQyalqpeSGg/xVTdBZHaZUe9FFqS49tpQlbpDlj/b
         VcxX0sUYDdIrOS3LNGmPC7GpIIChUYkSWpbdauM6M1F3ohwT82ov7F1A1HHHAANDvdck
         zRzzQ4kPdwqUf6VtxcYtlQiD7nxTxvkrmb21BAGBdCsu12nRutKs8kJYo9f6dmqzVhJt
         JeIg==
X-Gm-Message-State: AOAM530ZmiNYECcnKIuQKI8JbTORKs/Yc6k1ytTZKJZxN+8b121Bp697
	d4MrWnF7imAKcUuHGpVZK/cAmMpzvq49J5Jr
X-Google-Smtp-Source: 
 ABdhPJxdDgfp9n5BVtf9epfsy+sZHQf4RCEytyfE0esXW75hwG+bw1spgape6Viu2P0LvH8amXns9A==
X-Received: by 2002:a17:90b:38d2:b0:1df:51e5:9a0b with SMTP id
 nn18-20020a17090b38d200b001df51e59a0bmr14468488pjb.101.1652841060792;
        Tue, 17 May 2022 19:31:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p25-20020a62b819000000b00512ead539casm438926pfe.113.2022.05.17.19.30.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 19:30:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/9] tiff: Add patches to fix multiple CVEs
Date: Tue, 17 May 2022 16:30:31 -1000
Message-Id: 
 <7c71434832caf6a15f8fb884d028a8c1bf4090a9.1652840866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652840866.git.steve@sakoman.com>
References: <cover.1652840866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 02:31:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165785

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add patches to fix below CVE issues
CVE-2022-0865
CVE-2022-0907
CVE-2022-0908
CVE-2022-0909
CVE-2022-0924

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/files/CVE-2022-0865.patch         | 39 ++++++++
 .../libtiff/files/CVE-2022-0907.patch         | 94 +++++++++++++++++++
 .../libtiff/files/CVE-2022-0908.patch         | 34 +++++++
 .../libtiff/files/CVE-2022-0909.patch         | 37 ++++++++
 .../libtiff/files/CVE-2022-0924.patch         | 58 ++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |  5 +
 6 files changed, 267 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-0865.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-0907.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-0908.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-0909.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-0924.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-0865.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-0865.patch
new file mode 100644
index 0000000000..e2d136f587
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-0865.patch
@@ -0,0 +1,39 @@
+From a1c933dabd0e1c54a412f3f84ae0aa58115c6067 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Thu, 24 Feb 2022 22:26:02 +0100
+Subject: [PATCH] tif_jbig.c: fix crash when reading a file with multiple IFD
+ in memory-mapped mode and when bit reversal is needed (fixes #385)
+
+CVE: CVE-2022-0865
+Upstream-Status: Backport [https://sources.debian.org/src/tiff/4.1.0+git191117-2%7Edeb10u4/debian/patches/CVE-2022-0865.patch/]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+Comment: No change in any hunk
+
+---
+ libtiff/tif_jbig.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/libtiff/tif_jbig.c b/libtiff/tif_jbig.c
+index 74086338..8bfa4cef 100644
+--- a/libtiff/tif_jbig.c
++++ b/libtiff/tif_jbig.c
+@@ -208,6 +208,16 @@ int TIFFInitJBIG(TIFF* tif, int scheme)
+ 	 */
+ 	tif->tif_flags |= TIFF_NOBITREV;
+ 	tif->tif_flags &= ~TIFF_MAPPED;
++	/* We may have read from a previous IFD and thus set TIFF_BUFFERMMAP and
++	 * cleared TIFF_MYBUFFER. It is necessary to restore them to their initial
++	 * value to be consistent with the state of a non-memory mapped file.
++	 */
++	if (tif->tif_flags&TIFF_BUFFERMMAP) {
++		tif->tif_rawdata = NULL;
++		tif->tif_rawdatasize = 0;
++		tif->tif_flags &= ~TIFF_BUFFERMMAP;
++		tif->tif_flags |= TIFF_MYBUFFER;
++	}
+ 
+ 	/* Setup the function pointers for encode, decode, and cleanup. */
+ 	tif->tif_setupdecode = JBIGSetupDecode;
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-0907.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-0907.patch
new file mode 100644
index 0000000000..da3ead5481
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-0907.patch
@@ -0,0 +1,94 @@
+From 40b00cfb32256d377608b4d4cd30fac338d0a0bc Mon Sep 17 00:00:00 2001
+From: Augustus <wangdw.augustus@qq.com>
+Date: Mon, 7 Mar 2022 18:21:49 +0800
+Subject: [PATCH] add checks for return value of limitMalloc (#392)
+
+CVE: CVE-2022-0907
+Upstream-Status: Backport [https://sources.debian.org/src/tiff/4.1.0+git191117-2%7Edeb10u4/debian/patches/CVE-2022-0907.patch/]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+Comment: No change in any hunk
+
+---
+ tools/tiffcrop.c | 33 +++++++++++++++++++++------------
+ 1 file changed, 21 insertions(+), 12 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index f2e5474a..9b8acc7e 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -7337,7 +7337,11 @@ createImageSection(uint32_t sectsize, unsigned char **sect_buff_ptr)
+   if (!sect_buff)
+     {
+     sect_buff = (unsigned char *)_TIFFmalloc(sectsize);
+-    *sect_buff_ptr = sect_buff;
++    if (!sect_buff)
++    {
++        TIFFError("createImageSection", "Unable to allocate/reallocate section buffer");
++        return (-1);
++    }
+     _TIFFmemset(sect_buff, 0, sectsize);
+     }
+   else
+@@ -7353,15 +7357,15 @@ createImageSection(uint32_t sectsize, unsigned char **sect_buff_ptr)
+       else
+         sect_buff = new_buff;
+ 
++      if (!sect_buff)
++      {
++          TIFFError("createImageSection", "Unable to allocate/reallocate section buffer");
++          return (-1);
++      }
+       _TIFFmemset(sect_buff, 0, sectsize);
+       }
+     }
+ 
+-  if (!sect_buff)
+-    {
+-    TIFFError("createImageSection", "Unable to allocate/reallocate section buffer");
+-    return (-1);
+-    }
+   prev_sectsize = sectsize;
+   *sect_buff_ptr = sect_buff;
+ 
+@@ -7628,7 +7632,11 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
+   if (!crop_buff)
+     {
+     crop_buff = (unsigned char *)_TIFFmalloc(cropsize);
+-    *crop_buff_ptr = crop_buff;
++    if (!crop_buff)
++    {
++        TIFFError("createCroppedImage", "Unable to allocate/reallocate crop buffer");
++        return (-1);
++    }
+     _TIFFmemset(crop_buff, 0, cropsize);
+     prev_cropsize = cropsize;
+     }
+@@ -7644,15 +7652,15 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
+         }
+       else
+         crop_buff = new_buff;
++      if (!crop_buff)
++      {
++          TIFFError("createCroppedImage", "Unable to allocate/reallocate crop buffer");
++          return (-1);
++      }
+       _TIFFmemset(crop_buff, 0, cropsize);
+       }
+     }
+ 
+-  if (!crop_buff)
+-    {
+-    TIFFError("createCroppedImage", "Unable to allocate/reallocate crop buffer");
+-    return (-1);
+-    }
+   *crop_buff_ptr = crop_buff;
+ 
+   if (crop->crop_mode & CROP_INVERT)
+@@ -9211,3 +9219,4 @@ invertImage(uint16_t photometric, uint16_t spp, uint16_t bps, uint32_t width, ui
+  * fill-column: 78
+  * End:
+  */
++
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-0908.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-0908.patch
new file mode 100644
index 0000000000..e65af6c600
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-0908.patch
@@ -0,0 +1,34 @@
+From a95b799f65064e4ba2e2dfc206808f86faf93e85 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Thu, 17 Feb 2022 15:28:43 +0100
+Subject: [PATCH] TIFFFetchNormalTag(): avoid calling memcpy() with a null
+ source pointer and size of zero (fixes #383)
+
+CVE: CVE-2022-0908
+Upstream-Status: Backport [https://sources.debian.org/src/tiff/4.1.0+git191117-2%7Edeb10u4/debian/patches/CVE-2022-0908.patch/]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+Comment: No change in any hunk
+
+---
+ libtiff/tif_dirread.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
+index 50ebf8ac..2ec44a4f 100644
+--- a/libtiff/tif_dirread.c
++++ b/libtiff/tif_dirread.c
+@@ -5021,7 +5021,10 @@ TIFFFetchNormalTag(TIFF* tif, TIFFDirEntry* dp, int recover)
+ 								_TIFFfree(data);
+ 							return(0);
+ 						}
+-						_TIFFmemcpy(o,data,(uint32)dp->tdir_count);
++						if (dp->tdir_count > 0 )
++						{
++							_TIFFmemcpy(o,data,(uint32)dp->tdir_count);
++						}
+ 						o[(uint32)dp->tdir_count]=0;
+ 						if (data!=0)
+ 							_TIFFfree(data);
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-0909.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-0909.patch
new file mode 100644
index 0000000000..d487f1bd95
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-0909.patch
@@ -0,0 +1,37 @@
+From 32ea0722ee68f503b7a3f9b2d557acb293fc8cde Mon Sep 17 00:00:00 2001
+From: 4ugustus <wangdw.augustus@qq.com>
+Date: Tue, 8 Mar 2022 16:22:04 +0000
+Subject: [PATCH] fix the FPE in tiffcrop (#393)
+
+CVE: CVE-2022-0909
+Upstream-Status: Backport [https://sources.debian.org/src/tiff/4.1.0+git191117-2%7Edeb10u4/debian/patches/CVE-2022-0909.patch/]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+Comment: No change in any hunk
+
+---
+ libtiff/tif_dir.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libtiff/tif_dir.c b/libtiff/tif_dir.c
+index 57055ca9..59b346ca 100644
+--- a/libtiff/tif_dir.c
++++ b/libtiff/tif_dir.c
+@@ -334,13 +334,13 @@ _TIFFVSetField(TIFF* tif, uint32_t tag, va_list ap)
+ 		break;
+ 	case TIFFTAG_XRESOLUTION:
+         dblval = va_arg(ap, double);
+-        if( dblval < 0 )
++        if( dblval != dblval || dblval < 0 )
+             goto badvaluedouble;
+ 		td->td_xresolution = _TIFFClampDoubleToFloat( dblval );
+ 		break;
+ 	case TIFFTAG_YRESOLUTION:
+         dblval = va_arg(ap, double);
+-        if( dblval < 0 )
++        if( dblval != dblval || dblval < 0 )
+             goto badvaluedouble;
+ 		td->td_yresolution = _TIFFClampDoubleToFloat( dblval );
+ 		break;
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-0924.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-0924.patch
new file mode 100644
index 0000000000..ddb035c972
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-0924.patch
@@ -0,0 +1,58 @@
+From 88d79a45a31c74cba98c697892fed5f7db8b963a Mon Sep 17 00:00:00 2001
+From: 4ugustus <wangdw.augustus@qq.com>
+Date: Thu, 10 Mar 2022 08:48:00 +0000
+Subject: [PATCH] fix heap buffer overflow in tiffcp (#278)
+
+CVE: CVE-2022-0924
+Upstream-Status: Backport [https://sources.debian.org/src/tiff/4.1.0+git191117-2%7Edeb10u4/debian/patches/CVE-2022-0924.patch/]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+Comment: No change in any hunk
+
+---
+ tools/tiffcp.c | 17 ++++++++++++++++-
+ 1 file changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/tools/tiffcp.c b/tools/tiffcp.c
+index 224583e0..aa32b118 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -1524,12 +1524,27 @@ DECLAREwriteFunc(writeBufferToSeparateSt
+ 	tdata_t obuf;
+ 	tstrip_t strip = 0;
+ 	tsample_t s;
++	uint16 bps = 0, bytes_per_sample;
+ 
+ 	obuf = _TIFFmalloc(stripsize);
+ 	if (obuf == NULL)
+ 		return (0);
+ 	_TIFFmemset(obuf, 0, stripsize);
+ 	(void) TIFFGetFieldDefaulted(out, TIFFTAG_ROWSPERSTRIP, &rowsperstrip);
++	(void) TIFFGetField(out, TIFFTAG_BITSPERSAMPLE, &bps);
++	if( bps == 0 )
++        {
++            TIFFError(TIFFFileName(out), "Error, cannot read BitsPerSample");
++            _TIFFfree(obuf);
++            return 0;
++        }
++        if( (bps % 8) != 0 )
++        {
++            TIFFError(TIFFFileName(out), "Error, cannot handle BitsPerSample that is not a multiple of 8");
++            _TIFFfree(obuf);
++            return 0;
++        }
++	bytes_per_sample = bps/8;
+ 	for (s = 0; s < spp; s++) {
+ 		uint32 row;
+ 		for (row = 0; row < imagelength; row += rowsperstrip) {
+@@ -1539,7 +1539,7 @@ DECLAREwriteFunc(writeBufferToSeparateSt
+ 
+ 			cpContigBufToSeparateBuf(
+ 			    obuf, (uint8*) buf + row*rowsize + s,
+-			    nrows, imagewidth, 0, 0, spp, 1);
++			    nrows, imagewidth, 0, 0, spp, bytes_per_sample);
+ 			if (TIFFWriteEncodedStrip(out, strip++, obuf, stripsize) < 0) {
+ 				TIFFError(TIFFFileName(out),
+ 				    "Error, can't write strip %u",
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index e3ffb12f9e..75bc20de78 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -18,7 +18,12 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch \
            file://561599c99f987dc32ae110370cfdd7df7975586b.patch \
            file://eecb0712f4c3a5b449f70c57988260a667ddbdef.patch \
+           file://CVE-2022-0865.patch \
+           file://CVE-2022-0908.patch \
+           file://CVE-2022-0907.patch \
+           file://CVE-2022-0909.patch \
            file://CVE-2022-0891.patch \
+           file://CVE-2022-0924.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.25.1


