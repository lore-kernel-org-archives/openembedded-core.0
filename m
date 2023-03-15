Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92597C7618B
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:01:40 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.8781.1678888893608413072
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vrfjjGHc;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id j13so3182943pjd.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkRQ0Jgj8+AtV/QB2qqEFivOedw/erIIsu72XnXj8QI=;
        b=vrfjjGHc6XREnv2LJ3adOPl1s8gmoaUNsl/UJuuKl4NDYzKt0aGX2TLMboWQqHJnyU
         Wpm7gqaZIcKpihvCO3h30TENZ8+VzHO6eGxr8EBA7KetdN2zfRFkpjwltV3wMBg2w5Cm
         FRziRFRj9B3RNunaHV4e6xZTo6dDKJO9QHg4b4tt8iZERd0KXG8NwQNMgNnNd/8E0HEw
         8KygoxehBg7WnL2S4hkzahgKPYgzshtp+w29pTRMfwF1vLO7GI+hBrwX+mIbUAzXMVH6
         AT5yu2SwNdPZ5yR1o1ZcdAt/iN1SD90ns8aEcZV8gITtQiyAtnH12KSNQXAgYtj7CaMm
         x+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkRQ0Jgj8+AtV/QB2qqEFivOedw/erIIsu72XnXj8QI=;
        b=PANgE6dlNCHX/fy5U2muST0y4r0w/Q2npA6pnWlEDuof6c4y9XvZoKgTy4QiAhltjX
         XNZkPA2arWasq7QdO+v2jJ4eKanjbNu1zft/BGuDBInHNkv+pP7cG4vBUxSOscK/dBzn
         pdqJX+JxgeUpovs7ywx3LbvvXifnw+y5bfS+H8YXy3NR498C3DXxDT9agHesqBnLxdkC
         tPyaDCnvvNz6EeDa9XOLjfI3M96PU5Joth/kvSNB/d2gU/LzKGzquyd0wbzQcAWYbas3
         zfTSzi7rRrNr/MWS3rfpkU1zlih+iwUMQBPpHTTEOkwdhmM72MkrBgY0OE5kBTl0U1AC
         UVmw==
X-Gm-Message-State: AO0yUKXD2QdZjWmmRZxRc9Z8csIIwvdaIB3xPzJdjZwl9rr34M5WvHRd
	Cy1IY7IZnTGWGOCt80CtD5BM0C5yazxmmn1I8Xo=
X-Google-Smtp-Source: AK7set9x5tCn5ptCUzjXTsvQb216Gv4Trl7WZsEXRTN5uz8abettsj1hGzJ0HC0im4cin+H2gLmf3w==
X-Received: by 2002:a17:903:294b:b0:1a0:6852:16e9 with SMTP id li11-20020a170903294b00b001a0685216e9mr2244934plb.14.1678888892491;
        Wed, 15 Mar 2023 07:01:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.01.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:01:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/22] tiff: fix multiple CVEs
Date: Wed, 15 Mar 2023 04:00:56 -1000
Message-Id: <f2782b4cac461909cf432db13516e443fee8c3de.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678888649.git.steve@sakoman.com>
References: <cover.1678888649.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178556

From: Chee Yang Lee <chee.yang.lee@intel.com>

import patch from debian to fix
CVE-2022-48281
http://security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.2.0-1+deb11u4.debian.tar.xz

import patch from fedora to fix
CVE-2023-0800
CVE-2023-0801
CVE-2023-0802
CVE-2023-0803
CVE-2023-0804
https://src.fedoraproject.org/rpms/libtiff/c/91856895aadf3cce6353f40c2feef9bf0b486440

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit d9ce9b37236f5c16ffba4572ad720aeb50edeee9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2022-48281.patch         |  26 ++++
 .../CVE-2023-0800_0801_0802_0803_0804.patch   | 128 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   2 +
 3 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-48281.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-0800_0801_0802_0803_0804.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-48281.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-48281.patch
new file mode 100644
index 0000000000..4f8dc35251
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-48281.patch
@@ -0,0 +1,26 @@
+From 97d65859bc29ee334012e9c73022d8a8e55ed586 Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Sat, 21 Jan 2023 15:58:10 +0000
+Subject: [PATCH] tiffcrop: Correct simple copy paste error. Fix #488.
+
+
+Upstream-Status: Backport [import from debian http://security.debian.org/debian-security/pool/updates/main/t/tiff/tiff_4.2.0-1+deb11u4.debian.tar.xz]
+CVE: CVE-2022-48281
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ tools/tiffcrop.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: tiff-4.2.0/tools/tiffcrop.c
+===================================================================
+--- tiff-4.2.0.orig/tools/tiffcrop.c
++++ tiff-4.2.0/tools/tiffcrop.c
+@@ -7516,7 +7516,7 @@ processCropSelections(struct image_data
+       crop_buff = (unsigned char *)limitMalloc(cropsize + NUM_BUFF_OVERSIZE_BYTES);
+     else
+       {
+-      prev_cropsize = seg_buffs[0].size;
++      prev_cropsize = seg_buffs[1].size;
+       if (prev_cropsize < cropsize)
+         {
+         next_buff = _TIFFrealloc(crop_buff, cropsize + NUM_BUFF_OVERSIZE_BYTES);
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-0800_0801_0802_0803_0804.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-0800_0801_0802_0803_0804.patch
new file mode 100644
index 0000000000..8372bc35f2
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-0800_0801_0802_0803_0804.patch
@@ -0,0 +1,128 @@
+From 82a7fbb1fa7228499ffeb3a57a1d106a9626d57c Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Sun, 5 Feb 2023 15:53:15 +0000
+Subject: [PATCH] tiffcrop: added check for assumption on composite images
+ (fixes #496)
+
+tiffcrop: For composite images with more than one region, the combined_length or combined_width always needs to be equal, respectively. Otherwise, even the first section/region copy action might cause buffer overrun. This is now checked before the first copy action.
+
+Closes #496, #497, #498, #500, #501.
+
+Upstream-Status: Backport [import from fedora https://src.fedoraproject.org/rpms/libtiff/c/91856895aadf3cce6353f40c2feef9bf0b486440 ]
+CVE: CVE-2023-0800 CVE-2023-0801 CVE-2023-0802 CVE-2023-0803 CVE-2023-0804 
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ tools/tiffcrop.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 66 insertions(+), 2 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 84e26ac6..480b927c 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -5329,18 +5329,39 @@
+ 
+       crop->regionlist[i].buffsize = buffsize;
+       crop->bufftotal += buffsize;
++            /* For composite images with more than one region, the
++             * combined_length or combined_width always needs to be equal,
++             * respectively.
++             * Otherwise, even the first section/region copy
++             * action might cause buffer overrun. */
+       if (crop->img_mode == COMPOSITE_IMAGES)
+         {
+         switch (crop->edge_ref)
+           {
+           case EDGE_LEFT:
+           case EDGE_RIGHT:
++                        if (i > 0 && zlength != crop->combined_length)
++                        {
++                            TIFFError(
++                                "computeInputPixelOffsets",
++                                "Only equal length regions can be combined for "
++                                "-E left or right");
++                            return (-1);
++                        }
+                crop->combined_length = zlength;
+                crop->combined_width += zwidth;
+                break;
+           case EDGE_BOTTOM:
+           case EDGE_TOP:  /* width from left, length from top */
+           default:
++                        if (i > 0 && zwidth != crop->combined_width)
++                        {
++                            TIFFError("computeInputPixelOffsets",
++                                      "Only equal width regions can be "
++                                      "combined for -E "
++                                      "top or bottom");
++                            return (-1);
++                        }
+                crop->combined_width = zwidth;
+                crop->combined_length += zlength;
+ 	       break;
+@@ -6546,6 +6567,46 @@
+   crop->combined_width = 0;
+   crop->combined_length = 0;
+ 
++    /* If there is more than one region, check beforehand whether all the width
++     * and length values of the regions are the same, respectively. */
++    switch (crop->edge_ref)
++    {
++        default:
++        case EDGE_TOP:
++        case EDGE_BOTTOM:
++            for (i = 1; i < crop->selections; i++)
++            {
++                uint32_t crop_width0 =
++                    crop->regionlist[i - 1].x2 - crop->regionlist[i - 1].x1 + 1;
++                uint32_t crop_width1 =
++                    crop->regionlist[i].x2 - crop->regionlist[i].x1 + 1;
++                if (crop_width0 != crop_width1)
++                {
++                    TIFFError("extractCompositeRegions",
++                              "Only equal width regions can be combined for -E "
++                              "top or bottom");
++                    return (1);
++                }
++            }
++            break;
++        case EDGE_LEFT:
++        case EDGE_RIGHT:
++            for (i = 1; i < crop->selections; i++)
++            {
++                uint32_t crop_length0 =
++                    crop->regionlist[i - 1].y2 - crop->regionlist[i - 1].y1 + 1;
++                uint32_t crop_length1 =
++                    crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1;
++                if (crop_length0 != crop_length1)
++                {
++                    TIFFError("extractCompositeRegions",
++                              "Only equal length regions can be combined for "
++                              "-E left or right");
++                    return (1);
++                }
++            }
++    }
++
+   for (i = 0; i < crop->selections; i++)
+     {
+     /* rows, columns, width, length are expressed in pixels */
+@@ -6570,7 +6631,8 @@
+       default:
+       case EDGE_TOP:
+       case EDGE_BOTTOM:
+-	   if ((i > 0) && (crop_width != crop->regionlist[i - 1].width))
++                if ((crop->selections > i + 1) &&
++                    (crop_width != crop->regionlist[i + 1].width))
+              {
+ 	     TIFFError ("extractCompositeRegions", 
+                           "Only equal width regions can be combined for -E top or bottom");
+@@ -6651,7 +6713,8 @@
+ 	   break;
+       case EDGE_LEFT:  /* splice the pieces of each row together, side by side */
+       case EDGE_RIGHT:
+-	   if ((i > 0) && (crop_length != crop->regionlist[i - 1].length))
++                if ((crop->selections > i + 1) &&
++                    (crop_length != crop->regionlist[i + 1].length))
+              {
+ 	     TIFFError ("extractCompositeRegions", 
+                           "Only equal length regions can be combined for -E left or right");
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index ef4fa97585..4bd485a10a 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -32,6 +32,8 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://0001-tiffcrop-S-option-Make-decision-simpler.patch \
            file://0001-tiffcrop-disable-incompatibility-of-Z-X-Y-z-options-.patch \
            file://0001-tiffcrop-subroutines-require-a-larger-buffer-fixes-2.patch \
+           file://CVE-2022-48281.patch \
+           file://CVE-2023-0800_0801_0802_0803_0804.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.34.1


