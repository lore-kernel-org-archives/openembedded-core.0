Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1F1C0015E
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 06:50:28 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.5656.1690354228127374651
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 23:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=baBg71Ym;
 spf=pass (domain: mvista.com, ip: 209.85.210.51, mailfrom: hprajapati@mvista.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6b9d68a7abaso5096447a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 23:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1690354227; x=1690959027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6+TmRdmFt0B7xSP5sZSjEP+NlTQmlMlDMbXjC/lrsDE=;
        b=baBg71YmYXAmUwhwkQQNqlcgkE+cy2Jby1KjhzrlxhOni83kYzaauBAhKCTpDPW7Ul
         yk/yyQDvGgP72tStfhEqx1qIrCS8KhmacxJHFrQyzkjlbBFQ1CtMzFFpiT5tdbXhW8hC
         OYi88TLw7QYHcvvWM3LcaQsXMvedJ+f4pNX84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690354227; x=1690959027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+TmRdmFt0B7xSP5sZSjEP+NlTQmlMlDMbXjC/lrsDE=;
        b=FJ/Pg3w3oYEDtnrUCx2YlcSR9FSpzdN5BA+DLndp2EJG+mPNDqWEBYHPV2tK7hcFzw
         U5nlKIm/6+zlwkbX6jfuqZX/YXIU+AXT7UvBT+MygDpZbOO9PRV7iEEKYbK3qxoGAfmB
         yjg4QZYlVe6sIKez1Oz7t9lM+Mck622Db7n0CxsrARiHHu88Ox/yr6+lhlSWDu/OdW5a
         ZvDa1dHmWsml99Zk3u0W8sP+VcrCoYNcnZMubD0Km9mwDS01DNcBV7wzppY0xH8ya+l1
         1D5WVtTQ9EhIjr4vd5lPWnRRJh0FP3eQqhcL9eElLYMWxjkSRYwT1BWrZnuWWJ4SinTU
         PZag==
X-Gm-Message-State: ABy/qLYf739XC2sE9fUB/h3u2JZKnq+nrEuS7E0SdCQpsd6z1GbEJ6Iy
	s27Y33MucGnsUh/Wu6i4bfkpwVwJQfQaF60BrmMl1Q==
X-Google-Smtp-Source: APBJJlGAuKwg6JDfa/DCkpvx7HyA9rKbqdqDMAzpXsDLDI5rHomShqtEy8wObChL6zN335NkFxR5Bg==
X-Received: by 2002:a9d:7350:0:b0:6b9:9b41:fcbf with SMTP id l16-20020a9d7350000000b006b99b41fcbfmr1427420otk.25.1690354227200;
        Tue, 25 Jul 2023 23:50:27 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.172])
        by smtp.gmail.com with ESMTPSA id x21-20020a17090aa39500b00267d9f4d340sm583442pjp.44.2023.07.25.23.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 23:50:26 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Wed, 26 Jul 2023 12:20:21 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] libtiff: fix CVE-2023-26965 heap-based use after free
Date: Wed, 26 Jul 2023 12:20:20 +0530
Message-Id: <20230726065020.55859-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 06:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184864

Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/ec8ef90c1f573c9eb1f17d6a056aa0015f184acf

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
2.25.1


