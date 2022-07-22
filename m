Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E5EC43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 04:31:03 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.4345.1658464259676369313
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 21:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=H9/fiWxs;
 spf=pass (domain: mvista.com, ip: 209.85.216.51,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f51.google.com with SMTP id
 b7-20020a17090a12c700b001f20eb82a08so7149840pjg.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jul 2022 21:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SnPKuQ3KBSg3VLmoaTuQ0aS5lesRt4y3gx2O/ZY88+A=;
        b=H9/fiWxsq4WrcDD5lig6Sp+0FmbYghLIooz8MmO/nnTYRt6+JnS/bZCemSFo8hvylz
         OeM5OSdzPI8SQQtTVcJZg8fVo7Y7jmjHHCHiW5xzvV0ruFWiqDZta538mf83rUSYENJw
         JmHg6XokVzmNB5XWPWXqcifOrr67ek4Lps6sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SnPKuQ3KBSg3VLmoaTuQ0aS5lesRt4y3gx2O/ZY88+A=;
        b=HfDE3eCxXtOmBfPmAFaZ5AsK7y+zuKY/YNJoVPMVX1V3Ww8nGgwxl559fHrgYZPibW
         J1UzUhheisf55/ti+AOF4Kb6/8lfxIIm7az7HDF5a7zRmY2gOtaT0FOEEr6kLQWGdhfF
         zV0IxvAoFB7+slJEi/KgGlGSsqnYopxG2R1/g/C8rGMzgNviz9y2Vg8MB4SNlIyCyl8P
         ILPAWktIYbyfHv8mCI+yNrKGrUQ9Pqp91LKOXgRmOkpR7EjWmFBZyVU/NCicS1p/E/YE
         ABnqZOsy68lAylaAd4fj5VFtRG27UC8NeX5Lt/WIYVv/P2t+UznplIbh+qNweTyzkD1J
         YS7Q==
X-Gm-Message-State: AJIora/luNtdtYfaFcsUVJUPeYut+E3C5yQliohbrIPbsIx23E8TcBLn
	CAzaqAbv3JSD5fJIhGsIFM59fAm5Ko4/TA==
X-Google-Smtp-Source: 
 AGRyM1tb/jWruC6j1eVJlTLUTjwMLecnTha4RknA1QuwKsmWxYh0xLyTtYODujvErWfppPEfeEBj4g==
X-Received: by 2002:a17:902:cecf:b0:16c:4a62:62ab with SMTP id
 d15-20020a170902cecf00b0016c4a6262abmr1627364plg.129.1658464257855;
        Thu, 21 Jul 2022 21:30:57 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.194])
        by smtp.gmail.com with ESMTPSA id
 b19-20020a62a113000000b0052ba88f2de0sm2632408pff.131.2022.07.21.21.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 21:30:57 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Fri, 22 Jul 2022 10:00:52 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] grub2: Fix buffer underflow write in the heap
Date: Fri, 22 Jul 2022 10:00:49 +0530
Message-Id: <20220722043049.6141-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 04:31:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168398

Source: https://git.savannah.gnu.org/gitweb/?p=grub.git
MR: 119719, 119733, 119689
Type: Security Fix
Disposition: Backport from https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=e623866d9286410156e8b9d2c82d6253a1b22d08 && https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=210245129c932dc9e1c2748d9d35524fb95b5042 && https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=22a3f97d39f6a10b08ad7fd1cc47c4dcd10413f6
ChangeID: 97605970cd42776fa449fd8318f2762e32bbd177
Description:
Fixed CVEs :
        CVE-2021-3695
        CVE-2021-3696
        CVE-2021-3697

Affects "grub2 < 2.06"

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../grub/files/CVE-2021-3695.patch            | 176 ++++++++++++++++++
 .../grub/files/CVE-2021-3696.patch            |  46 +++++
 .../grub/files/CVE-2021-3697.patch            |  82 ++++++++
 meta/recipes-bsp/grub/grub2.inc               |   5 +-
 4 files changed, 308 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3695.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3696.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3697.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2021-3695.patch b/meta/recipes-bsp/grub/files/CVE-2021-3695.patch
new file mode 100644
index 0000000000..b8c81c604a
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2021-3695.patch
@@ -0,0 +1,176 @@
+From 2b62d4d1cc22ac47c9126101083a3086514d0bf0 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 20 Jul 2022 10:01:35 +0530
+Subject: [PATCH] CVE-2021-3695
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=e623866d9286410156e8b9d2c82d6253a1b22d08]
+CVE: CVE-2021-3695
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+ video/readers/png: Drop greyscale support to fix heap out-of-bounds write
+
+A 16-bit greyscale PNG without alpha is processed in the following loop:
+
+      for (i = 0; i < (data->image_width * data->image_height);
+   i++, d1 += 4, d2 += 2)
+{
+  d1[R3] = d2[1];
+  d1[G3] = d2[1];
+  d1[B3] = d2[1];
+}
+
+The increment of d1 is wrong. d1 is incremented by 4 bytes per iteration,
+but there are only 3 bytes allocated for storage. This means that image
+data will overwrite somewhat-attacker-controlled parts of memory - 3 bytes
+out of every 4 following the end of the image.
+
+This has existed since greyscale support was added in 2013 in commit
+3ccf16dff98f (grub-core/video/readers/png.c: Support grayscale).
+
+Saving starfield.png as a 16-bit greyscale image without alpha in the gimp
+and attempting to load it causes grub-emu to crash - I don't think this code
+has ever worked.
+
+Delete all PNG greyscale support.
+
+Fixes: CVE-2021-3695
+
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+---
+ grub-core/video/readers/png.c | 87 +++--------------------------------
+ 1 file changed, 7 insertions(+), 80 deletions(-)
+
+diff --git a/grub-core/video/readers/png.c b/grub-core/video/readers/png.c
+index 0157ff7..36b3f10 100644
+--- a/grub-core/video/readers/png.c
++++ b/grub-core/video/readers/png.c
+@@ -100,7 +100,7 @@ struct grub_png_data
+ 
+   unsigned image_width, image_height;
+   int bpp, is_16bit;
+-  int raw_bytes, is_gray, is_alpha, is_palette;
++  int raw_bytes, is_alpha, is_palette;
+   int row_bytes, color_bits;
+   grub_uint8_t *image_data;
+ 
+@@ -280,13 +280,13 @@ grub_png_decode_image_header (struct grub_png_data *data)
+     data->bpp = 3;
+   else
+     {
+-      data->is_gray = 1;
+-      data->bpp = 1;
++      return grub_error (GRUB_ERR_BAD_FILE_TYPE,
++			 "png: color type not supported");
+     }
+ 
+   if ((color_bits != 8) && (color_bits != 16)
+       && (color_bits != 4
+-	  || !(data->is_gray || data->is_palette)))
++	  || !data->is_palette))
+     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
+                        "png: bit depth must be 8 or 16");
+ 
+@@ -315,7 +315,7 @@ grub_png_decode_image_header (struct grub_png_data *data)
+     }
+ 
+ #ifndef GRUB_CPU_WORDS_BIGENDIAN
+-  if (data->is_16bit || data->is_gray || data->is_palette)
++  if (data->is_16bit || data->is_palette)
+ #endif
+     {
+       data->image_data = grub_calloc (data->image_height, data->row_bytes);
+@@ -859,27 +859,8 @@ grub_png_convert_image (struct grub_png_data *data)
+       int shift;
+       int mask = (1 << data->color_bits) - 1;
+       unsigned j;
+-      if (data->is_gray)
+-	{
+-	  /* Generic formula is
+-	     (0xff * i) / ((1U << data->color_bits) - 1)
+-	     but for allowed bit depth of 1, 2 and for it's
+-	     equivalent to
+-	     (0xff / ((1U << data->color_bits) - 1)) * i
+-	     Precompute the multipliers to avoid division.
+-	  */
+-
+-	  const grub_uint8_t multipliers[5] = { 0xff, 0xff, 0x55, 0x24, 0x11 };
+-	  for (i = 0; i < (1U << data->color_bits); i++)
+-	    {
+-	      grub_uint8_t col = multipliers[data->color_bits] * i;
+-	      palette[i][0] = col;
+-	      palette[i][1] = col;
+-	      palette[i][2] = col;
+-	    }
+-	}
+-      else
+-	grub_memcpy (palette, data->palette, 3 << data->color_bits);
++
++      grub_memcpy (palette, data->palette, 3 << data->color_bits);
+       d1c = d1;
+       d2c = d2;
+       for (j = 0; j < data->image_height; j++, d1c += data->image_width * 3,
+@@ -917,60 +898,6 @@ grub_png_convert_image (struct grub_png_data *data)
+       return;
+     }
+
+-  if (data->is_gray)
+-    {
+-      switch (data->bpp)
+-	{
+-	case 4:
+-	  /* 16-bit gray with alpha.  */
+-	  for (i = 0; i < (data->image_width * data->image_height);
+-	       i++, d1 += 4, d2 += 4)
+-	    {
+-	      d1[R4] = d2[3];
+-	      d1[G4] = d2[3];
+-	      d1[B4] = d2[3];
+-	      d1[A4] = d2[1];
+-	    }
+-	  break;
+-	case 2:
+-	  if (data->is_16bit)
+-	    /* 16-bit gray without alpha.  */
+-	    {
+-	      for (i = 0; i < (data->image_width * data->image_height);
+-		   i++, d1 += 4, d2 += 2)
+-		{
+-		  d1[R3] = d2[1];
+-		  d1[G3] = d2[1];
+-		  d1[B3] = d2[1];
+-		}
+-	    }
+-	  else
+-	    /* 8-bit gray with alpha.  */
+-	    {
+-	      for (i = 0; i < (data->image_width * data->image_height);
+-		   i++, d1 += 4, d2 += 2)
+-		{
+-		  d1[R4] = d2[1];
+-		  d1[G4] = d2[1];
+-		  d1[B4] = d2[1];
+-		  d1[A4] = d2[0];
+-		}
+-	    }
+-	  break;
+-	  /* 8-bit gray without alpha.  */
+-	case 1:
+-	  for (i = 0; i < (data->image_width * data->image_height);
+-	       i++, d1 += 3, d2++)
+-	    {
+-	      d1[R3] = d2[0];
+-	      d1[G3] = d2[0];
+-	      d1[B3] = d2[0];
+-	    }
+-	  break;
+-	}
+-      return;
+-    }
+-
+     {
+   /* Only copy the upper 8 bit.  */
+ #ifndef GRUB_CPU_WORDS_BIGENDIAN
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2021-3696.patch b/meta/recipes-bsp/grub/files/CVE-2021-3696.patch
new file mode 100644
index 0000000000..ef6da945c4
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2021-3696.patch
@@ -0,0 +1,46 @@
+From b18ce59d6496a9313d75f9497a0efac61dcf4191 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 20 Jul 2022 10:05:42 +0530
+Subject: [PATCH] CVE-2021-3696
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=210245129c932dc9e1c2748d9d35524fb95b5042]
+CVE: CVE-2021-3696
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+video/readers/png: Avoid heap OOB R/W inserting huff table items
+
+In fuzzing we observed crashes where a code would attempt to be inserted
+into a huffman table before the start, leading to a set of heap OOB reads
+and writes as table entries with negative indices were shifted around and
+the new code written in.
+
+Catch the case where we would underflow the array and bail.
+
+Fixes: CVE-2021-3696
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+---
+ grub-core/video/readers/png.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/grub-core/video/readers/png.c b/grub-core/video/readers/png.c
+index 36b3f10..3c05951 100644
+--- a/grub-core/video/readers/png.c
++++ b/grub-core/video/readers/png.c
+@@ -416,6 +416,13 @@ grub_png_insert_huff_item (struct huff_table *ht, int code, int len)
+   for (i = len; i < ht->max_length; i++)
+     n += ht->maxval[i];
+ 
++  if (n > ht->num_values)
++    {
++      grub_error (GRUB_ERR_BAD_FILE_TYPE,
++		  "png: out of range inserting huffman table item");
++      return;
++    }
++
+   for (i = 0; i < n; i++)
+     ht->values[ht->num_values - i] = ht->values[ht->num_values - i - 1];
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2021-3697.patch b/meta/recipes-bsp/grub/files/CVE-2021-3697.patch
new file mode 100644
index 0000000000..be15e7d1f2
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2021-3697.patch
@@ -0,0 +1,82 @@
+From 4de9de9d14f4ac27229e45514627534e32cc4406 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Tue, 19 Jul 2022 11:13:02 +0530
+Subject: [PATCH] CVE-2021-3697
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=grub.git;a=commit;h=22a3f97d39f6a10b08ad7fd1cc47c4dcd10413f6]
+CVE: CVE-2021-3697
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+video/readers/jpeg: Block int underflow -> wild pointer write
+
+Certain 1 px wide images caused a wild pointer write in
+grub_jpeg_ycrcb_to_rgb(). This was caused because in grub_jpeg_decode_data(),
+we have the following loop:
+
+for (; data->r1 < nr1 && (!data->dri || rst);
+     data->r1++, data->bitmap_ptr += (vb * data->image_width - hb * nc1) * 3)
+
+We did not check if vb * width >= hb * nc1.
+
+On a 64-bit platform, if that turns out to be negative, it will underflow,
+be interpreted as unsigned 64-bit, then be added to the 64-bit pointer, so
+we see data->bitmap_ptr jump, e.g.:
+
+0x6180_0000_0480 to
+0x6181_0000_0498
+     ^
+     ~--- carry has occurred and this pointer is now far away from
+          any object.
+
+On a 32-bit platform, it will decrement the pointer, creating a pointer
+that won't crash but will overwrite random data.
+
+Catch the underflow and error out.
+
+Fixes: CVE-2021-3697
+
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+---
+ grub-core/video/readers/jpeg.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/video/readers/jpeg.c b/grub-core/video/readers/jpeg.c
+index 31359a4..545a60b 100644
+--- a/grub-core/video/readers/jpeg.c
++++ b/grub-core/video/readers/jpeg.c
+@@ -23,6 +23,7 @@
+ #include <grub/mm.h>
+ #include <grub/misc.h>
+ #include <grub/bufio.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -617,6 +618,7 @@ static grub_err_t
+ grub_jpeg_decode_data (struct grub_jpeg_data *data)
+ {
+   unsigned c1, vb, hb, nr1, nc1;
++  unsigned stride_a, stride_b, stride;
+   int rst = data->dri;
+ 
+   vb = 8 << data->log_vs;
+@@ -624,8 +626,14 @@ grub_jpeg_decode_data (struct grub_jpeg_data *data)
+   nr1 = (data->image_height + vb - 1) >> (3 + data->log_vs);
+   nc1 = (data->image_width + hb - 1)  >> (3 + data->log_hs);
+ 
++  if (grub_mul(vb, data->image_width, &stride_a) ||
++      grub_mul(hb, nc1, &stride_b) ||
++      grub_sub(stride_a, stride_b, &stride))
++    return grub_error (GRUB_ERR_BAD_FILE_TYPE,
++		       "jpeg: cannot decode image with these dimensions");
++
+   for (; data->r1 < nr1 && (!data->dri || rst);
+-       data->r1++, data->bitmap_ptr += (vb * data->image_width - hb * nc1) * 3)
++       data->r1++, data->bitmap_ptr += stride * 3)
+     for (c1 = 0;  c1 < nc1 && (!data->dri || rst);
+ 	c1++, rst--, data->bitmap_ptr += hb * 3)
+       {
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 9e98d8249d..0b7ca6d3d6 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -95,7 +95,10 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0044-script-execute-Fix-NULL-dereference-in-grub_script_e.patch \
            file://0045-commands-ls-Require-device_name-is-not-NULL-before-p.patch \
            file://0046-script-execute-Avoid-crash-when-using-outside-a-func.patch \
-           file://CVE-2021-3981.patch\
+           file://CVE-2021-3981.patch \
+           file://CVE-2021-3695.patch \
+           file://CVE-2021-3696.patch \
+           file://CVE-2021-3697.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


