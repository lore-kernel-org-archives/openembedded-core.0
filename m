Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5349FC6FA86
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 02:26:10 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.1786.1663122368980848522
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=T8row/zS;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 a5-20020a17090aa50500b002008eeb040eso2537682pjq.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=qg+0Pi3H1OFNRlfNiTt4plnAS1HUnf/PeOoeMooCJqM=;
        b=T8row/zSuWiGz+Xx3DEXZerUEUsb7bFVxxEdzFPL2CwavmUcCRFKcBQmNDaiDuMesU
         83qLfx/r3oDWZTy+8ZZ+dMCtpQTPM0wqOfI1ySsod1cnYT2otcOOmrdplnXpXGdKj/WY
         97/w7ophUwrYKn06tnn/qbph26OVejrBBg0zppxo7SLwS5Wm54orbMChcaq7ueLCoIrl
         fiVDaKxbfn+c8EPsqXjR9cYU7ZQrHirykrNVNZCvnrpo8hAGxW8ugIOjosmMyVd8/yjo
         anxyb8HFRWR6mQl3Q4VWaQHei22OABR8k+s9xCMA9M8YD5MJsBh6oC29JQ/FK2jNnW4o
         htbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qg+0Pi3H1OFNRlfNiTt4plnAS1HUnf/PeOoeMooCJqM=;
        b=kDOFP8gAsGaCzZFxm+DVN7oujFXjI14986weIaJpwY7Zc3BCkBuicGY5nTLajklLzd
         0DEFWT3p83cuFgXCEu/HqSygQtyQKPsqp1/BpzplzrTEIFv9Zw9fZe8oeU8/Fb0VjD2t
         AhoU2IQ9HsHIDg/yhvmaZoWzkob9Er73TjFNNhp++pIjzaiv3y4K9wCMqMtQQB4dRIzI
         vXXTQtT5PpOcG5kG0yKgxdEpqduj40MujzOjp7oAefMIivptvVb+z9qh+tzM6y8smCu6
         sFuA9wYSJibdItX6jVlLKHIla9AshW3SbFI8MW/6qyf42LfFs1jjQPrbOYZLk8p/OM1C
         Ycuw==
X-Gm-Message-State: ACrzQf0HXlHmbLa9S/HhWnT5Syq41E/n7FUJCJJQPzn1lTc07L2TH1Wj
	nyu29xfgVnOZpjj8W9EhqSlDVb7iC0FVgADS
X-Google-Smtp-Source: 
 AMsMyM4jzAJmDBrIs9rvfqt/rIDgjycmVrYY/knanpZ1tlzV/Vr88HrY6vQDUbBE28hl1R6tjNUMXA==
X-Received: by 2002:a17:90b:4c84:b0:203:20a:7afe with SMTP id
 my4-20020a17090b4c8400b00203020a7afemr2308293pjb.94.1663122367720;
        Tue, 13 Sep 2022 19:26:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s14-20020a65644e000000b00438fe64d61esm5259871pgv.0.2022.09.13.19.26.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 19:26:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/9] tiff: Fix for CVE-2022-2867/8/9
Date: Tue, 13 Sep 2022 16:25:12 -1000
Message-Id: 
 <67df7488bf66183ffdb9f497f00ad291b79210d3.1663122098.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663122098.git.steve@sakoman.com>
References: <cover.1663122098.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 02:26:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170620

From: Virendra Thakur <virendrak@kpit.com>

Add Patch to fix CVE-2022-2867, CVE-2022-2868
CVE-2022-2869

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...022-2867-CVE-2022-2868-CVE-2022-2869.patch | 159 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   1 +
 2 files changed, 160 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch
new file mode 100644
index 0000000000..131ff94119
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch
@@ -0,0 +1,159 @@
+From 07d79fcac2ead271b60e32aeb80f7b4f3be9ac8c Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Wed, 9 Feb 2022 21:31:29 +0000
+Subject: [PATCH] tiffcrop.c: Fix issue #352 heap-buffer-overflow by correcting
+ uint32_t underflow.
+
+CVE: CVE-2022-2867 CVE-2022-2868 CVE-2022-2869
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/07d79fcac2ead271b60e32aeb80f7b4f3be9ac8c]
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+---
+Index: tiff-4.1.0/tools/tiffcrop.c
+===================================================================
+--- tiff-4.1.0.orig/tools/tiffcrop.c
++++ tiff-4.1.0/tools/tiffcrop.c
+@@ -5153,29 +5153,45 @@ computeInputPixelOffsets(struct crop_mas
+ 	y1 = _TIFFClampDoubleToUInt32(crop->corners[i].Y1);
+ 	y2 = _TIFFClampDoubleToUInt32(crop->corners[i].Y2);
+ 	}
+-      if (x1 < 1)
+-        crop->regionlist[i].x1 = 0;
+-      else
+-        crop->regionlist[i].x1 = (uint32) (x1 - 1);
++      /* a) Region needs to be within image sizes 0.. width-1; 0..length-1 
++       * b) Corners are expected to be submitted as top-left to bottom-right.
++       *    Therefore, check that and reorder input.
++       * (be aware x,y are already casted to (uint32_t) and avoid (0 - 1) )
++       */
++      uint32_t aux;
++      if (x1 > x2) {
++        aux = x1;
++        x1 = x2;
++        x2 = aux;
++      }
++      if (y1 > y2) {
++        aux = y1;
++        y1 = y2;
++        y2 = aux;
++      }
++      if (x1 > image->width - 1)
++        crop->regionlist[i].x1 = image->width - 1;
++      else if (x1 > 0)
++        crop->regionlist[i].x1 = (uint32_t)(x1 - 1);
+ 
+       if (x2 > image->width - 1)
+         crop->regionlist[i].x2 = image->width - 1;
+-      else
+-        crop->regionlist[i].x2 = (uint32) (x2 - 1);
+-      zwidth  = crop->regionlist[i].x2 - crop->regionlist[i].x1 + 1; 
+-
+-      if (y1 < 1)
+-        crop->regionlist[i].y1 = 0;
+-      else
+-        crop->regionlist[i].y1 = (uint32) (y1 - 1);
++      else if (x2 > 0)
++        crop->regionlist[i].x2 = (uint32_t)(x2 - 1);
++
++      zwidth = crop->regionlist[i].x2 - crop->regionlist[i].x1 + 1;
++
++      if (y1 > image->length - 1)
++        crop->regionlist[i].y1 = image->length - 1;
++      else if (y1 > 0)
++        crop->regionlist[i].y1 = (uint32_t)(y1 - 1);
+ 
+       if (y2 > image->length - 1)
+         crop->regionlist[i].y2 = image->length - 1;
+-      else
+-        crop->regionlist[i].y2 = (uint32) (y2 - 1);
+-
+-      zlength = crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1; 
++      else if (y2 > 0)
++        crop->regionlist[i].y2 = (uint32_t)(y2 - 1);
+ 
++      zlength = crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1;
+       if (zwidth > max_width)
+         max_width = zwidth;
+       if (zlength > max_length)
+@@ -5205,7 +5221,7 @@ computeInputPixelOffsets(struct crop_mas
+ 	}
+       }
+     return (0);
+-    }
++    }  /* crop_mode == CROP_REGIONS */
+   
+   /* Convert crop margins into offsets into image
+    * Margins are expressed as pixel rows and columns, not bytes
+@@ -5241,7 +5257,7 @@ computeInputPixelOffsets(struct crop_mas
+       bmargin = (uint32) 0;
+       return (-1);
+       }
+-    }
++    }  /* crop_mode == CROP_MARGINS */
+   else
+     { /* no margins requested */
+     tmargin = (uint32) 0;
+@@ -5332,24 +5348,23 @@ computeInputPixelOffsets(struct crop_mas
+   off->endx   = endx;
+   off->endy   = endy;
+ 
+-  crop_width  = endx - startx + 1;
+-  crop_length = endy - starty + 1;
+-
+-  if (crop_width <= 0)
++  if (endx + 1 <= startx)
+     {
+     TIFFError("computeInputPixelOffsets", 
+                "Invalid left/right margins and /or image crop width requested");
+     return (-1);
+     }
++  crop_width  = endx - startx + 1;
+   if (crop_width > image->width)
+     crop_width = image->width;
+ 
+-  if (crop_length <= 0)
++  if (endy + 1 <= starty)
+     {
+     TIFFError("computeInputPixelOffsets", 
+               "Invalid top/bottom margins and /or image crop length requested");
+     return (-1);
+     }
++  crop_length = endy - starty + 1;
+   if (crop_length > image->length)
+     crop_length = image->length;
+ 
+@@ -5449,10 +5464,17 @@ getCropOffsets(struct image_data *image,
+   else
+     crop->selections = crop->zones;
+ 
+-  for (i = 0; i < crop->zones; i++)
++  /* Initialize regions iterator i */
++  i = 0;
++  for (int j = 0; j < crop->zones; j++)
+     {
+-    seg = crop->zonelist[i].position;
+-    total = crop->zonelist[i].total;
++    seg = crop->zonelist[j].position;
++    total = crop->zonelist[j].total;
++
++    /* check for not allowed zone cases like 0:0; 4:3; etc. and skip that input */
++    if (seg == 0 || total == 0 || seg > total) {
++        continue;
++    }
+ 
+     switch (crop->edge_ref) 
+       {
+@@ -5581,8 +5603,11 @@ getCropOffsets(struct image_data *image,
+                     i + 1, (uint32)zwidth, (uint32)zlength,
+ 		    crop->regionlist[i].x1, crop->regionlist[i].x2, 
+                     crop->regionlist[i].y1, crop->regionlist[i].y2);
++  /* increment regions iterator */
++  i++;
+     }
+-
++    /* set number of generated regions out of given zones */
++    crop->selections = i;
+   return (0);
+   } /* end getCropOffsets */
+ 
+-- 
+GitLab
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index c061d2aaac..93a35230d6 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2022-0924.patch \
            file://CVE-2022-2056-CVE-2022-2057-CVE-2022-2058.patch \
            file://CVE-2022-34526.patch \
+           file://CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.25.1


