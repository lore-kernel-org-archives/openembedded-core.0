Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9A8C00528
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:11 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.78384.1690740071533614986
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=gTa3PAhL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-686efb9ee3cso3667616b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740070; x=1691344870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vz9yUlcULaVkaMu4bLB3u5o/dC51g6XmUQylq14klqQ=;
        b=gTa3PAhLG+rV3jBtZE0uMHaKeUaFyGD2/BSU1KzjE4Y6QH3hW1pXEJVDCZxWDpnsMw
         RsvAbY00BOiDX0gbNtfWDFlr8lwfGfV6FY7IiJu227FXNc+OmOnYp7oBvKQE8mFB4TQE
         pg55hZ0BLTqjBZb6e12Lg3Tf/Y0nnROagCM1FzbuKAcmsSaEfi2Ftr54ZmRxaGYp1rmo
         5BPu20ziO0Xdhzz+VEQztge12TzAlwarv5dJihfun3BBMxsuHFp3rHnpYPBTikK/x1bo
         EPcIaSYeEwb3iD/5rdZU2qZI8+ZLmOw7MY6NjLsSnk+qMPt+5CY6QsWmnj7U16S537lM
         XQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740070; x=1691344870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vz9yUlcULaVkaMu4bLB3u5o/dC51g6XmUQylq14klqQ=;
        b=D3yM6pxRZx13bF5u3N4RxX2AgKbW1gCwEeSq43BU5scgneFTDNWn/7H5WcCw+xG1ib
         tyJt1LFLMXJq9SPLCbZ2Vbj7SISNeoTNRULmnybb6V4toMzR7JhZIO3TzIJ5GaFoNYHN
         +5vHISWjPE3sS2y460m+A86AHLLkxOZv/ZPwkuFTBr/HhBxFklJN9jL6tZXgOUmtXrGo
         QrRY9lvtxFoBOgji/UGvV7NeY//pt+d3wrghztMJKWRyMsYwcrBnPk7oleZBMhKPXeuC
         iadHUqdhW5ds36IjDt+/BxjlaVl7lpEdDNfHOwzlN1zlbnX9xztaJstfonjgsx4fcEiT
         6K1A==
X-Gm-Message-State: ABy/qLZ/SeP0Z3ypzAif6YiX/DRTXtEfT0XQpAMEwtN5Pqm7KTidv8PV
	VR5S4+F2U3qnnl0ONON25cSl4kjWg/4gltuni/RnVw==
X-Google-Smtp-Source: APBJJlEbhLsDNADPL9TOwJg5ytiUUT/NciWBNczwz46K+dpSP5hKPQg7hyL9CkV7K5ltEnyE9RujAA==
X-Received: by 2002:a05:6a00:1687:b0:682:4ef7:9b0b with SMTP id k7-20020a056a00168700b006824ef79b0bmr10678897pfc.0.1690740070591;
        Sun, 30 Jul 2023 11:01:10 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/30] libtiff: fix CVE-2023-26965 heap-based use after free
Date: Sun, 30 Jul 2023 08:00:29 -1000
Message-Id: <9b9f88d8828ee822635ed645cc192829fecec39e.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185084

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/ec8ef90c1f573c9eb1f17d6a056aa0015f184acf

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2023-26965.patch         | 97 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-26965.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-26965.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-26965.patch
new file mode 100644
index 0000000000..2162493e34
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-26965.patch
@@ -0,0 +1,97 @@
+From ec8ef90c1f573c9eb1f17d6a056aa0015f184acf Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Tue, 14 Feb 2023 20:43:43 +0100
+Subject: [PATCH] tiffcrop: Do not reuse input buffer for subsequent images.
+ Fix issue 527
+
+Reuse of read_buff within loadImage() from previous image is quite unsafe, because other functions (like rotateImage() etc.) reallocate that buffer with different size without updating the local prev_readsize value.
+
+Closes #527
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/ec8ef90c1f573c9eb1f17d6a056aa0015f184acf]
+CVE: CVE-2023-26965
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tools/tiffcrop.c | 47 +++++++++++++++--------------------------------
+ 1 file changed, 15 insertions(+), 32 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index b811fbb..ce77c74 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -6066,9 +6066,7 @@ loadImage(TIFF* in, struct image_data *image, struct dump_opts *dump, unsigned c
+   uint32_t   tw = 0, tl = 0;       /* Tile width and length */
+   tmsize_t   tile_rowsize = 0;
+   unsigned char *read_buff = NULL;
+-  unsigned char *new_buff  = NULL;
+   int      readunit = 0;
+-  static   tmsize_t  prev_readsize = 0;
+ 
+   TIFFGetFieldDefaulted(in, TIFFTAG_BITSPERSAMPLE, &bps);
+   TIFFGetFieldDefaulted(in, TIFFTAG_SAMPLESPERPIXEL, &spp);
+@@ -6361,47 +6359,32 @@ loadImage(TIFF* in, struct image_data *image, struct dump_opts *dump, unsigned c
+     }
+  
+   read_buff = *read_ptr;
+-  /* +3 : add a few guard bytes since reverseSamples16bits() can read a bit */
+-  /* outside buffer */
+-  if (!read_buff)
+-  {
+-    if( buffsize > 0xFFFFFFFFU - 3 )
++    /* +3 : add a few guard bytes since reverseSamples16bits() can read a bit
++     * outside buffer */
++    /* Reuse of read_buff from previous image is quite unsafe, because other
++     * functions (like rotateImage() etc.) reallocate that buffer with different
++     * size without updating the local prev_readsize value. */
++   if (read_buff)
+     {
+-        TIFFError("loadImage", "Unable to allocate/reallocate read buffer");
+-        return (-1);
++        _TIFFfree(read_buff);
+     }
+-    read_buff = (unsigned char *)limitMalloc(buffsize + NUM_BUFF_OVERSIZE_BYTES);
+-  }
+-  else
++    if (buffsize > 0xFFFFFFFFU - 3)
+     {
+-    if (prev_readsize < buffsize)
+-    {
+-      if( buffsize > 0xFFFFFFFFU - 3 )
+-      {
+-          TIFFError("loadImage", "Unable to allocate/reallocate read buffer");
+-          return (-1);
+-      }
+-      new_buff = _TIFFrealloc(read_buff, buffsize + NUM_BUFF_OVERSIZE_BYTES);
+-      if (!new_buff)
+-        {
+-	free (read_buff);
+-        read_buff = (unsigned char *)limitMalloc(buffsize + NUM_BUFF_OVERSIZE_BYTES);
+-        }
+-      else
+-        read_buff = new_buff;
+-      }
++        TIFFError("loadImage", "Required read buffer size too large");
++        return (-1);
+     }
+-  if (!read_buff)
++    read_buff =
++        (unsigned char *)limitMalloc(buffsize + NUM_BUFF_OVERSIZE_BYTES);
++    if (!read_buff)
+     {
+-    TIFFError("loadImage", "Unable to allocate/reallocate read buffer");
+-    return (-1);
++        TIFFError("loadImage", "Unable to allocate read buffer");
++        return (-1);
+     }
+ 
+   read_buff[buffsize] = 0;
+   read_buff[buffsize+1] = 0;
+   read_buff[buffsize+2] = 0;
+ 
+-  prev_readsize = buffsize;
+   *read_ptr = read_buff;
+ 
+   /* N.B. The read functions used copy separate plane data into a buffer as interleaved
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 2ee10fca72..4796dfde24 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -37,6 +37,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-0795_0796_0797_0798_0799.patch \
            file://CVE-2023-25433.patch \
            file://CVE-2023-25434-CVE-2023-25435.patch \
+           file://CVE-2023-26965.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.34.1


