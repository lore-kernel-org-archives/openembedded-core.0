Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4ABCDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 08:40:19 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.113128.1697445613347617579
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 01:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KjpZEa3v;
 spf=pass (domain: mvista.com, ip: 209.85.210.181, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6b6f4c118b7so1612886b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 01:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1697445612; x=1698050412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h3GdRYZrK0VmnYm4BFEo5fRc4gWCMn8lEi13YxNtzzQ=;
        b=KjpZEa3vfFxdAltJnpP1gvj1g32nLRhwQ9wexEteyM66KQP7dfab5csNYThiFK5oNW
         OlSlzmeHiSZHrLRt30mePbCPSRJFTi8Tm5J1FBLHlwzCMjHkN0c0I/cO9SwUbrd5uK/2
         OmOlp5GeCpraED1WlSOP9rxPhyeH3GK7R0OB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697445612; x=1698050412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3GdRYZrK0VmnYm4BFEo5fRc4gWCMn8lEi13YxNtzzQ=;
        b=KeiXfk/CTxLEdPZf4kvSF/r6J+5WKYf7LiqNlDYeuSO0PuXt/4TwzFoiI1Zj1CfWXt
         qNRWOjUgwd4d8wHmN131EwjM0mvUITKDB4UM3P+wK1K1A6QCDXoU3YPqtXvEVlszCUqj
         CKUPduQHZ/CIv1+g6rNGYhLqQ4Ba/dEa7XhsS75LsGDOCX0XTBERuM0+tINHQX44Sy4+
         3CEaeamxt9ZK2OH4btleRIYXqwoQVBqE9WtRY1Hlx2rJ+fF49/Qm3DE0Xm4ZC02QUiLb
         92dp2/I0wNWKS98d6cXTh+gVqu5RVd7t9WE1DhvwDPUSrCraj+T7ahFctr9PuuS3DqNp
         Af3Q==
X-Gm-Message-State: AOJu0Yx+OkU2Ht+hG1ChiudxM95SzptVw3Gizy4v3PBK9yBNJ4qiZYda
	xhQ4dlQlWioM9Ij1QXWquHwMVZguHdq+0h+H7KtarA==
X-Google-Smtp-Source: AGHT+IGZJgdBLixelvekdAvHDR+QaxUZc7GsgMY/1wmjfmDdKYW0jCc6JNR+H7WsJH58CeyEThB+kQ==
X-Received: by 2002:a05:6a20:3d1e:b0:16b:80d3:7f10 with SMTP id y30-20020a056a203d1e00b0016b80d37f10mr25882893pzi.34.1697445612360;
        Mon, 16 Oct 2023 01:40:12 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.213])
        by smtp.gmail.com with ESMTPSA id l21-20020a170902d35500b001c737950e4dsm7971374plk.2.2023.10.16.01.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 01:40:12 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>,
	Marek Vasut <marex@denx.de>
Subject: [kirkstone[PATCH] libtiff: Add fix for tiffcrop CVE-2023-1916
Date: Mon, 16 Oct 2023 14:09:59 +0530
Message-Id: <20231016083959.23959-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 08:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189277

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

Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/848434a81c443f59ec90d41218eba6e48a450a11 && https://gitlab.com/libtiff/libtiff/-/merge_requests/535
Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libtiff/tiff/CVE-2023-1916.patch          | 99 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-1916.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-1916.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-1916.patch
new file mode 100644
index 0000000000..6722781a3a
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-1916.patch
@@ -0,0 +1,99 @@
+From 848434a81c443f59ec90d41218eba6e48a450a11 Mon Sep 17 00:00:00 2001
+From: zhailiangliang <zhailiangliang@loongson.cn>
+Date: Thu, 16 Mar 2023 16:16:54 +0800
+Subject: [PATCH] Fix heap-buffer-overflow in function extractImageSection
+
+CVE: CVE-2023-1916
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/848434a81c443f59ec90d41218eba6e48a450a11 https://gitlab.com/libtiff/libtiff/-/merge_requests/535]
+Signed-off-by: Marek Vasut <marex@denx.de>
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tools/tiffcrop.c | 44 ++++++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 40 insertions(+), 4 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 05ba4d2..8a08536 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -5700,6 +5700,15 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+              crop->combined_width += (uint32_t)zwidth;
+            else
+              crop->combined_width = (uint32_t)zwidth;
++
++	   /* When the degrees clockwise rotation is 90 or 270, check the boundary */
++           if (((crop->rotation == 90) || (crop->rotation == 270))
++                && ((crop->combined_length > image->width) || (crop->combined_width > image->length)))
++           {
++                TIFFError("getCropOffsets", "The crop size exceeds the image boundary size");
++                return -1;
++           }
++
+            break;
+       case EDGE_BOTTOM: /* width from left, zones from bottom to top */
+            zwidth = offsets.crop_width;
+@@ -5735,6 +5744,15 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+            else
+              crop->combined_length = (uint32_t)zlength;
+            crop->combined_width = (uint32_t)zwidth;
++
++	   /* When the degrees clockwise rotation is 90 or 270, check the boundary */
++           if (((crop->rotation == 90) || (crop->rotation == 270))
++                && ((crop->combined_length > image->width) || (crop->combined_width > image->length)))
++           {
++                TIFFError("getCropOffsets", "The crop size exceeds the image boundary size");
++                return -1;
++           }
++
+            break;
+       case EDGE_RIGHT: /* zones from right to left, length from top */
+ 		  zlength = offsets.crop_length;
+@@ -5772,6 +5790,15 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+ 			  crop->combined_width += (uint32_t)zwidth;
+ 		  else
+ 			  crop->combined_width = (uint32_t)zwidth;
++
++		/* When the degrees clockwise rotation is 90 or 270, check the boundary */
++                if (((crop->rotation == 90) || (crop->rotation == 270))
++                    && ((crop->combined_length > image->width) || (crop->combined_width > image->length)))
++                {
++                    TIFFError("getCropOffsets", "The crop size exceeds the image boundary size");
++                    return -1;
++                }
++
+ 		  break;
+       case EDGE_TOP: /* width from left, zones from top to bottom */
+       default:
+@@ -5818,7 +5845,16 @@ getCropOffsets(struct image_data *image, struct crop_mask *crop, struct dump_opt
+            else
+              crop->combined_length = (uint32_t)zlength;
+            crop->combined_width = (uint32_t)zwidth;
+-           break;
++
++	   /* When the degrees clockwise rotation is 90 or 270, check the boundary */
++           if (((crop->rotation == 90) || (crop->rotation == 270))
++                && ((crop->combined_length > image->width) || (crop->combined_width > image->length)))
++           {
++                TIFFError("getCropOffsets", "The crop size exceeds the image boundary size");
++                return -1;
++           }
++
++	   break;
+       } /* end switch statement */
+ 
+     buffsize = (uint32_t)
+@@ -7016,9 +7052,9 @@ extractImageSection(struct image_data *image, struct pageseg *section,
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
+     TIFFError ("", "First row: %"PRIu32", last row: %"PRIu32", First col: %"PRIu32", last col: %"PRIu32"\n",
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 9e1e6fa099..8ef98fe5d0 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -44,6 +44,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-3618-2.patch \
            file://CVE-2023-26966.patch \
            file://CVE-2022-40090.patch \
+           file://CVE-2023-1916.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.25.1


