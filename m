Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6351DC433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 23:08:56 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.637.1666048126345212705
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 16:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=fFi/lUpf;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id b5so11775176pgb.6
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 16:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkpK5/z6J5rsCU0B9aKXkOTwJcU4KgaoIp8VeGw6OIA=;
        b=fFi/lUpfMzvxbw7GZBrgsZ/kBfttDzYjyxHU7GM0/izfL4ft1gpCeUWj5LWATKN4tL
         gXYQIEu/WK56JW3NgOV9qL5h/O4KgEy2anxhOfR3gdleln5dDMH9peiAsWvyjLcRWw5I
         +S/vlhzSwRQabQEnf6CM/rLJelzgqBDsqaGavERLAckIFOUQV55JQJijFGZiLH6HhYrV
         eVp5bRrHWaWeaeA4sYP0a7MpuDHm8qODhC/jpubw8dVDFpT/LWPYG20847QtuObrUkTX
         RYYNwQuZI1PPRg+Dqw3YtTCOzOOM0MmG2jwpJEpN0bkf4vedDj4LnQvPopUdTm7YLjP0
         1ebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkpK5/z6J5rsCU0B9aKXkOTwJcU4KgaoIp8VeGw6OIA=;
        b=n1ZLzxk3C6974467uDNxZmGpzjLa/XyVcuMruJbQFa2fDfSmm1Eus8HsKhrdeuR1UF
         QmJimX8bfC7UIwBF99qb8nf6EYME+wQksTOGeoEKxdr7wHW9WTIZ4gdwGdUKEnGvvUBV
         8FgMB5vg/oflxOVPjyvOAckbSRipmO0Cl1XI+Fr8ylH+vGId0BVZI7cARCOFAE4PS2Hi
         1UFFkrqg23qlUW1UHXSnHJ2+ZynvaJ2+Ul9eaXJDD0BBXqegb3Ne+bdlAJDtQsiA8aMv
         QjSw2EgGAA0e+dRE3O+8YclDmhax4PHDrfiE3294zsFx42WM0+dd2ZAr29KbJ/D19Nfv
         VWeg==
X-Gm-Message-State: ACrzQf0E1dw47ULM5lWplKmEdz4vE1O4873lHMuicQgFlkUdszUbMOw0
	RbAlku81fMJLMZ37aOxhLYw3DcFbN3+dxxxM
X-Google-Smtp-Source: AMsMyM6OAcpvBnvv5btgsSR8b5pmzSOrFyi+SYc1rYc+MpGnDqztjgHePjsnGb3Tg2pcSqg/4dE/nA==
X-Received: by 2002:a05:6a00:cce:b0:565:cbe0:16c6 with SMTP id b14-20020a056a000cce00b00565cbe016c6mr161153pfv.56.1666048125009;
        Mon, 17 Oct 2022 16:08:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090a694600b0020aacde1964sm10119479pjm.32.2022.10.17.16.08.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:08:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/13] tiff: Security fixes CVE-2022-2867,CVE-2022-2868 and CVE-2022-2869
Date: Mon, 17 Oct 2022 13:08:17 -1000
Message-Id: <90a65fbefee1b7f615933f1bbbf5f83b6f928e8d.1666047986.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666047986.git.steve@sakoman.com>
References: <cover.1666047986.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 23:08:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171919

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

This series of patches include fixes for CVE-2022-2867,CVE-2022-2868 and CVE-2022-2869.
These patches are modified using devtool and a review was conducted to make sure they all get applied in the correct location.

References:

https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2867
https://security-tracker.debian.org/tracker/CVE-2022-2867

https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868
https://security-tracker.debian.org/tracker/CVE-2022-2868

https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2869
https://security-tracker.debian.org/tracker/CVE-2022-2869

Merge request:

https://gitlab.com/libtiff/libtiff/-/merge_requests/294/diffs?commit_id=7d7bfa4416366ec64068ac389414241ed4730a54

Patches from:

https://gitlab.com/libtiff/libtiff/-/commit/bcf28bb7f630f24fa47701a9907013f3548092cd?merge_request_iid=294
https://gitlab.com/libtiff/libtiff/-/commit/7d7bfa4416366ec64068ac389414241ed4730a54?merge_request_iid=294
https://gitlab.com/libtiff/libtiff/-/commit/b258ed69a485a9cfb299d9f060eb2a46c54e5903?merge_request_iid=294

Notes:
These CVEs are fixed in tiff v4.4.0

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2022-2867.patch          | 129 ++++++++++++++++++
 .../libtiff/tiff/CVE-2022-2869.patch          |  84 ++++++++++++
 ...ed69a485a9cfb299d9f060eb2a46c54e5903.patch |  45 ++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   3 +
 4 files changed, 261 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-2867.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-2869.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2867.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2867.patch
new file mode 100644
index 0000000000..ae33a3b4e7
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2867.patch
@@ -0,0 +1,129 @@
+From 6ad097dac1d4908705f5a9d43dea76b7f2de89eb Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Sun, 6 Feb 2022 17:53:53 +0100
+Subject: [PATCH] tiffcrop.c: This update fixes also issues #350 and #351.
+
+ Issue 350 is fixed by checking for not allowed zone input cases like -Z 0:0
+ in getCropOffsets().
+
+CVE: CVE-2022-2867
+
+Upstream-Status: Backport
+[https://gitlab.com/libtiff/libtiff/-/commit/7d7bfa4416366ec64068ac389414241ed4730a54?merge_request_iid=294]
+
+Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
+
+---
+ tools/tiffcrop.c | 58 +++++++++++++++++++++++++++++++++---------------
+ 1 file changed, 40 insertions(+), 18 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 4a4ace8..0ef5bb2 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -5194,20 +5194,33 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+ 	y1 = _TIFFClampDoubleToUInt32(crop->corners[i].Y1);
+ 	y2 = _TIFFClampDoubleToUInt32(crop->corners[i].Y2);
+ 	}
+-      /* region needs to be within image sizes 0.. width-1; 0..length-1 
+-       * - be aware x,y are already casted to (uint32_t) and avoid (0 - 1)
++      /* a) Region needs to be within image sizes 0.. width-1; 0..length-1 
++       * b) Corners are expected to be submitted as top-left to bottom-right.
++       *    Therefore, check that and reorder input.
++       * (be aware x,y are already casted to (uint32_t) and avoid (0 - 1) )
+        */
+-     if (x1 > image->width - 1)
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
+         crop->regionlist[i].x1 = image->width - 1;
+-     else if (x1 > 0)
+-        crop->regionlist[i].x1 = (uint32_t) (x1 - 1);
++      else if (x1 > 0)
++        crop->regionlist[i].x1 = (uint32_t)(x1 - 1);
+ 
+-     if (x2 > image->width - 1)
+-       crop->regionlist[i].x2 = image->width - 1;
+-     else if (x2 > 0)
+-       crop->regionlist[i].x2 = (uint32_t)(x2 - 1);
++      if (x2 > image->width - 1)
++        crop->regionlist[i].x2 = image->width - 1;
++      else if (x2 > 0)
++        crop->regionlist[i].x2 = (uint32_t)(x2 - 1);
+ 
+-      zwidth  = crop->regionlist[i].x2 - crop->regionlist[i].x1 + 1; 
++      zwidth = crop->regionlist[i].x2 - crop->regionlist[i].x1 + 1;
+ 
+       if (y1 > image->length - 1)
+         crop->regionlist[i].y1 = image->length - 1;
+@@ -5219,8 +5232,7 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+       else if (y2 > 0)
+         crop->regionlist[i].y2 = (uint32_t)(y2 - 1);
+ 
+-      zlength = crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1; 
+-
++      zlength = crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1;
+       if (zwidth > max_width)
+         max_width = zwidth;
+       if (zlength > max_length)
+@@ -5250,7 +5262,7 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+ 	}
+       }
+     return (0);
+-    }
++    }  /* crop_mode == CROP_REGIONS */
+   
+   /* Convert crop margins into offsets into image
+    * Margins are expressed as pixel rows and columns, not bytes
+@@ -5286,7 +5298,7 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+       bmargin = (uint32_t) 0;
+       return (-1);
+       }
+-    }
++    }  /* crop_mode == CROP_MARGINS */
+   else
+     { /* no margins requested */
+     tmargin = (uint32_t) 0;
+@@ -5494,10 +5506,17 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
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
+@@ -5626,8 +5645,11 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+                     i + 1, zwidth, zlength,
+                crop->regionlist[i].x1, crop->regionlist[i].x2,
+                crop->regionlist[i].y1, crop->regionlist[i].y2);
++  /* increment regions iterator */
++  i++;
+     }
+-
++    /* set number of generated regions out of given zones */
++    crop->selections = i;
+   return (0);
+   } /* end getCropOffsets */
+ 
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2869.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2869.patch
new file mode 100644
index 0000000000..9a23e23fed
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2869.patch
@@ -0,0 +1,84 @@
+From 0ec36342df880f5ad41576cb1b03061b8697dabd Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Sun, 6 Feb 2022 10:53:45 +0100
+Subject: [PATCH] tiffcrop.c: Fix issue #352 heap-buffer-overflow by correcting
+
+ uint32_t underflow.
+
+CVE: CVE-2022-2869
+
+Upstream-Status: Backport
+[https://gitlab.com/libtiff/libtiff/-/commit/bcf28bb7f630f24fa47701a9907013f3548092cd?merge_request_iid=294]
+
+Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
+
+---
+ tools/tiffcrop.c | 34 +++++++++++++++++++---------------
+ 1 file changed, 19 insertions(+), 15 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index b9b13d8..4a4ace8 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -5194,26 +5194,30 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+ 	y1 = _TIFFClampDoubleToUInt32(crop->corners[i].Y1);
+ 	y2 = _TIFFClampDoubleToUInt32(crop->corners[i].Y2);
+ 	}
+-      if (x1 < 1)
+-        crop->regionlist[i].x1 = 0;
+-      else
++      /* region needs to be within image sizes 0.. width-1; 0..length-1 
++       * - be aware x,y are already casted to (uint32_t) and avoid (0 - 1)
++       */
++     if (x1 > image->width - 1)
++        crop->regionlist[i].x1 = image->width - 1;
++     else if (x1 > 0)
+         crop->regionlist[i].x1 = (uint32_t) (x1 - 1);
+ 
+-      if (x2 > image->width - 1)
+-        crop->regionlist[i].x2 = image->width - 1;
+-      else
+-        crop->regionlist[i].x2 = (uint32_t) (x2 - 1);
++     if (x2 > image->width - 1)
++       crop->regionlist[i].x2 = image->width - 1;
++     else if (x2 > 0)
++       crop->regionlist[i].x2 = (uint32_t)(x2 - 1);
++
+       zwidth  = crop->regionlist[i].x2 - crop->regionlist[i].x1 + 1; 
+ 
+-      if (y1 < 1)
+-        crop->regionlist[i].y1 = 0;
+-      else
+-        crop->regionlist[i].y1 = (uint32_t) (y1 - 1);
++      if (y1 > image->length - 1)
++        crop->regionlist[i].y1 = image->length - 1;
++      else if (y1 > 0)
++        crop->regionlist[i].y1 = (uint32_t)(y1 - 1);
+ 
+       if (y2 > image->length - 1)
+         crop->regionlist[i].y2 = image->length - 1;
+-      else
+-        crop->regionlist[i].y2 = (uint32_t) (y2 - 1);
++      else if (y2 > 0)
++        crop->regionlist[i].y2 = (uint32_t)(y2 - 1);
+ 
+       zlength = crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1; 
+ 
+@@ -5376,7 +5380,7 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+   crop_width  = endx - startx + 1;
+   crop_length = endy - starty + 1;
+ 
+-  if (crop_width <= 0)
++  if (endx + 1 <= startx)
+     {
+     TIFFError("computeInputPixelOffsets", 
+                "Invalid left/right margins and /or image crop width requested");
+@@ -5385,7 +5389,7 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+   if (crop_width > image->width)
+     crop_width = image->width;
+ 
+-  if (crop_length <= 0)
++  if (endy + 1 <= starty)
+     {
+     TIFFError("computeInputPixelOffsets", 
+               "Invalid top/bottom margins and /or image crop length requested");
diff --git a/meta/recipes-multimedia/libtiff/tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch b/meta/recipes-multimedia/libtiff/tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch
new file mode 100644
index 0000000000..1fa6a11104
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch
@@ -0,0 +1,45 @@
+From 740111312ca6ae718f233d914662a9969e6820ee Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Sun, 6 Feb 2022 19:52:17 +0100
+Subject: [PATCH] Move the crop_width and crop_length computation after the
+ sanity check to avoid warnings when built with
+ -fsanitize=unsigned-integer-overflow.
+
+Upstream-Status: Backport
+[https://gitlab.com/libtiff/libtiff/-/commit/b258ed69a485a9cfb299d9f060eb2a46c54e5903?merge_request_iid=294]
+
+Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
+
+---
+ tools/tiffcrop.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 0ef5bb2..99e4208 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -5389,15 +5389,13 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+   off->endx   = endx;
+   off->endy   = endy;
+ 
+-  crop_width  = endx - startx + 1;
+-  crop_length = endy - starty + 1;
+-
+   if (endx + 1 <= startx)
+     {
+     TIFFError("computeInputPixelOffsets", 
+                "Invalid left/right margins and /or image crop width requested");
+     return (-1);
+     }
++  crop_width  = endx - startx + 1;
+   if (crop_width > image->width)
+     crop_width = image->width;
+ 
+@@ -5407,6 +5405,7 @@ computeInputPixelOffsets(struct crop_mask *crop, struct image_data *image,
+               "Invalid top/bottom margins and /or image crop length requested");
+     return (-1);
+     }
++  crop_length = endy - starty + 1;
+   if (crop_length > image->length)
+     crop_length = image->length;
+ 
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index b5ccd859f3..f84057c46b 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -22,6 +22,9 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2022-1354.patch \
            file://CVE-2022-1355.patch \
            file://CVE-2022-34526.patch \
+           file://CVE-2022-2869.patch \
+           file://CVE-2022-2867.patch \
+           file://b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.25.1


