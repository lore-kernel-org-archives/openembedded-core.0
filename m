Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F650CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 15:48:57 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.284621.1697644129275593213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 08:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Z5CTezRD;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5ab53b230f1so3532342a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 08:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697644128; x=1698248928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mabIy/ymNkokD6kIuhebKhWh6k8I11WJO1QP6wwDjpI=;
        b=Z5CTezRDszl/Q/vIEcmdkIZo9lLypzVMqwnYn2/zFEaZ4BzGOgUWUomzl7Myy95MAR
         EZvSjZqXbo46r1bPjH+Mu0QofqfcqOCjtlYXc0nLiw76w885NuRzjTCzAozjJOkeRtpZ
         dmHAH+qkLlrD/vtAfg3D5VRDbKihB1WroOE5mwgY4fRTTgTUGiQVkcg339EVk8Nja7YJ
         PDvHHbKRxBzP9DE7n2qAcfQSgVN7EyLw3sHpCTczY9v296jlBdbPEjRydtdnu1HskmI4
         0PdAuDmujt5rmnNsAN1xdAQiQIrdeNAohR4rXznCmTnjomp5KYVApPA7TnCIhx9gUXa5
         UZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697644128; x=1698248928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mabIy/ymNkokD6kIuhebKhWh6k8I11WJO1QP6wwDjpI=;
        b=CPcdt9m57cFcOWvqx8sNAdztrHuHnKDikgXU2kcP1OmdxXagfjMjb6DUhOuU2g3UPd
         cKm5jtfUg3TWMLud4uKOWOtkN7iahAUNbcdA6TJXydS48a1Zek/GXf6Ijth0qsLCWUD3
         n5kd7LZ1volsQrgVlF8mrZ1+B0W0k47zzqlvrTv5DxqWmMsVP3HPEm1qJPQKW89qNACj
         KqjwhTtz3AYOVTmAIt+Dc1vFW54ZQVHOzqyHyQ1lhCZr/OMOZVHDJ6V35fdcgay62o5m
         ev1uCJ349ACp0DZQ7+3LUey6rxcxiAQEfoOOgi4n8+73HhJBZphBAHKaIFxBUuSpAKJ/
         khpw==
X-Gm-Message-State: AOJu0YyG89S8KagESpTvdlJW0zaPfWMYIRJjYqK3yTfJDkIAjTacLRIE
	26uWUoMz5VqhX9bpEF8aKBt7Eeu/0q78NJ7yEBc=
X-Google-Smtp-Source: AGHT+IHFEHfwnnI9hLt2jgtrRpgClnRXsJt2zwAm2SVXOdpo6Bzrm35xvnUSYsKW7on1+ks86xEDjg==
X-Received: by 2002:a17:90a:d808:b0:27d:7ebe:2ee with SMTP id a8-20020a17090ad80800b0027d7ebe02eemr5287353pjv.39.1697644128336;
        Wed, 18 Oct 2023 08:48:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o14-20020a17090ab88e00b002636dfcc6f5sm43268pjr.3.2023.10.18.08.48.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 08:48:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/10] libtiff: Add fix for tiffcrop CVE-2023-1916
Date: Wed, 18 Oct 2023 05:48:26 -1000
Message-Id: <4d3e7f9a157e56a4a8ffb4d16fd6401a22851307.1697642997.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697642997.git.steve@sakoman.com>
References: <cover.1697642997.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 15:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189406

From: Hitendra Prajapati <hprajapati@mvista.com>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


