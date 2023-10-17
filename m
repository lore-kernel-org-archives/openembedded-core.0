Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161A9C41513
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 18:42:41 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.238781.1697568157870639745
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 11:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TArK+xDE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6be840283ceso669711b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 11:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697568157; x=1698172957; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPeUWc2nB1zFGtyemT5llTbT8HGLcz3hHpby+1nrrXE=;
        b=TArK+xDE+ny+623KBwIvKe1Uzog4GBpGwVVzx+coSsQhMDJ1UpzKVd2HyOoZabYbYC
         C2j3kLVzFZgTDIMb7iicOKuhsnrxPoSAjd+RFdCpUQboJeBFf58htb2JX9SSQJUNH6Cp
         raSg6i9PMkrovIX9s9rxK/du5W0AvSQK/Z+GLEeRuP940WZxfoWioddG+FmZDQLoge5Q
         U5cBuDb78G5xsKDzrwIzvyvdbl4ywR2X3VbMXVrQoxrvq9QVvLkwaN6J90Un9Pnv2qOq
         J2V86uBrd2jjLJh4I7LDLRjq5lWWtzYmHzc338WJRcHNNUv61J+HbpjWIYRmCl/ueeIg
         9Dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697568157; x=1698172957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPeUWc2nB1zFGtyemT5llTbT8HGLcz3hHpby+1nrrXE=;
        b=d+38BrEJwBuOene4gQG3i+BxpRrHCh7v2SgWf/7CyD5/vBZa/G3bg/i3XDwWOwbU8/
         vdt4Zjk50WHExb4/MTzrY2+R/Np4utRJWBMgUFATXs+MZjmtfwr3dKrPDcXBSI66GKfr
         ZhDM78oztNAejXwDuDWdQi7Kf1vRHyFs+SnhHnyqmHKGE/nUnjFlxa4CAhdSZw1exWiE
         Pgyaa72Buy4+lhvSUq7fc/+7yNFqmh5LRSx439o2zwab9CVOTFsg7Hyft3Imp5YH/sPv
         oSP0uYtEP6d34C7UJURifsISqL+PCUvxpAkgfSHBAjIrNjIg1ooADLn+WN5fxzdqVgJK
         bHQg==
X-Gm-Message-State: AOJu0YzzUvGihgi51GI1lFKrLlE4ARGAo7EbiU/oDoxuG9uR25hdDckO
	S8Ackr43NHSia5WBz4ox5eqYDsoxoSx6Ay7qAjo=
X-Google-Smtp-Source: AGHT+IEYkR7DkIjI+7366FgMxpGdZkZP5SZMpbCDKXD1jKIUQXOcsD4TL+Z2dK8sIroisalMxofgzQ==
X-Received: by 2002:a05:6a00:21d0:b0:6bc:ce7a:6f39 with SMTP id t16-20020a056a0021d000b006bcce7a6f39mr3515589pfj.32.1697568156656;
        Tue, 17 Oct 2023 11:42:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id w123-20020a626281000000b0066a31111cc5sm1838715pfb.152.2023.10.17.11.42.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 11:42:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/10] libtiff: Add fix for tiffcrop CVE-2023-1916
Date: Tue, 17 Oct 2023 08:42:21 -1000
Message-Id: <28ad0fdd30f490612aca6cc96ee503e5f92360a8.1697567211.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697567211.git.steve@sakoman.com>
References: <cover.1697567211.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 18:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189352

From: Marek Vasut <marex@denx.de>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/files/CVE-2023-1916.patch         | 91 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-1916.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-1916.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-1916.patch
new file mode 100644
index 0000000000..9915b77645
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-1916.patch
@@ -0,0 +1,91 @@
+From 848434a81c443f59ec90d41218eba6e48a450a11 Mon Sep 17 00:00:00 2001
+From: zhailiangliang <zhailiangliang@loongson.cn>
+Date: Thu, 16 Mar 2023 16:16:54 +0800
+Subject: [PATCH] Fix heap-buffer-overflow in function extractImageSection
+
+CVE: CVE-2023-1916
+Upstream-Status: Submitted [https://gitlab.com/libtiff/libtiff/-/commit/848434a81c443f59ec90d41218eba6e48a450a11 https://gitlab.com/libtiff/libtiff/-/merge_requests/535]
+Signed-off-by: Marek Vasut <marex@denx.de>
+---
+ archive/tools/tiffcrop.c | 62 +++++++++++++++++++++++++++++-----------
+ 1 file changed, 45 insertions(+), 17 deletions(-)
+
+--- tiff-4.1.0+git191117.orig/tools/tiffcrop.c
++++ tiff-4.1.0+git191117/tools/tiffcrop.c
+@@ -5549,6 +5549,15 @@ getCropOffsets(struct image_data *image,
+              crop->combined_width += (uint32)zwidth;
+            else
+              crop->combined_width = (uint32)zwidth;
++
++           /* When the degrees clockwise rotation is 90 or 270, check the boundary */
++           if (((crop->rotation == 90) || (crop->rotation == 270))
++               && ((crop->combined_length > image->width) || (crop->combined_width > image->length)))
++           {
++               TIFFError("getCropOffsets", "The crop size exceeds the image boundary size");
++               return -1;
++           }
++
+            break;
+       case EDGE_BOTTOM: /* width from left, zones from bottom to top */
+            zwidth = offsets.crop_width;
+@@ -5579,6 +5588,15 @@ getCropOffsets(struct image_data *image,
+            else
+              crop->combined_length = (uint32)zlength;
+            crop->combined_width = (uint32)zwidth;
++
++           /* When the degrees clockwise rotation is 90 or 270, check the boundary */
++           if (((crop->rotation == 90) || (crop->rotation == 270))
++               && ((crop->combined_length > image->width) || (crop->combined_width > image->length)))
++           {
++               TIFFError("getCropOffsets", "The crop size exceeds the image boundary size");
++               return -1;
++           }
++
+            break;
+       case EDGE_RIGHT: /* zones from right to left, length from top */
+            zlength = offsets.crop_length;
+@@ -5606,6 +5624,15 @@ getCropOffsets(struct image_data *image,
+              crop->combined_width += (uint32)zwidth;
+            else
+              crop->combined_width = (uint32)zwidth;
++
++           /* When the degrees clockwise rotation is 90 or 270, check the boundary */
++           if (((crop->rotation == 90) || (crop->rotation == 270))
++               && ((crop->combined_length > image->width) || (crop->combined_width > image->length)))
++           {
++               TIFFError("getCropOffsets", "The crop size exceeds the image boundary size");
++               return -1;
++           }
++
+            break;
+       case EDGE_TOP: /* width from left, zones from top to bottom */
+       default:
+@@ -5632,6 +5659,15 @@ getCropOffsets(struct image_data *image,
+            else
+              crop->combined_length = (uint32)zlength;
+            crop->combined_width = (uint32)zwidth;
++
++           /* When the degrees clockwise rotation is 90 or 270, check the boundary */
++           if (((crop->rotation == 90) || (crop->rotation == 270))
++               && ((crop->combined_length > image->width) || (crop->combined_width > image->length)))
++           {
++               TIFFError("getCropOffsets", "The crop size exceeds the image boundary size");
++               return -1;
++           }
++
+            break;
+       } /* end switch statement */
+ 
+@@ -6827,9 +6863,9 @@ extractImageSection(struct image_data *i
+      * regardless of the way the data are organized in the input file.
+      * Furthermore, bytes and bits are arranged in buffer according to COMPRESSION=1 and FILLORDER=1 
+      */
+-    img_rowsize = (((img_width * spp * bps) + 7) / 8);    /* row size in full bytes of source image */
+-    full_bytes = (sect_width * spp * bps) / 8;            /* number of COMPLETE bytes per row in section */
+-    trailing_bits = (sect_width * spp * bps) % 8;         /* trailing bits within the last byte of destination buffer */
++    img_rowsize = (((img_width * spp * bps) + 7) / 8);  /* row size in full bytes of source image */
++    full_bytes = (sect_width * spp * bps) / 8;          /* number of COMPLETE bytes per row in section */
++    trailing_bits = (sect_width * spp * bps) % 8;       /* trailing bits within the last byte of destination buffer */
+ 
+ #ifdef DEVELMODE
+     TIFFError ("", "First row: %d, last row: %d, First col: %d, last col: %d\n",
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index e3daaf1007..6df4244697 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2022-48281.patch \
            file://CVE-2023-0795_0796_0797_0798_0799.patch \
            file://CVE-2023-0800_0801_0802_0803_0804.patch \
+           file://CVE-2023-1916.patch \
            file://CVE-2023-25433.patch \
            file://CVE-2023-25434-CVE-2023-25435.patch \
            file://CVE-2023-26965.patch \
-- 
2.34.1


