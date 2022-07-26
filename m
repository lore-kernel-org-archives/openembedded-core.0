Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E7FC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 07:04:21 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.3742.1658819053566042442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 00:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=b1BetfpK;
 spf=pass (domain: mvista.com, ip: 209.85.215.175,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f175.google.com with SMTP id r186so12432989pgr.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 00:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S4StO9hr5slpRIoQeZhRwHny/D9wLsha418Nq2JFSlU=;
        b=b1BetfpKx19d/kTaZ7C5lXPFPnYOZBWAh8gdBkerIUYZxjctbsWg7yQ7euxW7bGju8
         YYBJo6ZC+EK3h+AgZzN6f/cIFaitH9xMo+BhNhbPJNE1R9+kq2e5U0MHHDEB6F7rNrWD
         WzcP2jjNwTPraYucl0RYtgRncLr2MKsnyOh8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S4StO9hr5slpRIoQeZhRwHny/D9wLsha418Nq2JFSlU=;
        b=8E/qoSIx8EmsZgB/yd0a/EM9M+YLjMgZaJxiXWbUDsFo4PwEXW2pS6VIV65u7qPHjQ
         WyawNzsCmh+8+qCV3zYISXW0yW/CPPHr0bur6XjBkpL8RM8a+8b6mu58zjACF+AclO2M
         YxCdtaz2gHJn97/fADVft9S0q7u/MS093mSgrNzxow8ZBhX4aO+iXxgZgwaEzvTWxmu6
         3VtIb7qXrAyL6dDu0Rx3U2RUJTFlYRy7OxFB4f2cgSxKzQYKrCTHHUpU9axzr3K7+Zsz
         g1dN4/Hvq/EYjqIbmYiKjirjnaTTkFUawiMwoD83GlqwI6dHwE7cF3nSwlA/2QYz55qP
         bTIQ==
X-Gm-Message-State: AJIora9KU2uz+ba4UQkWyin22D2AihngFSDgyymW5OJLkunc7GZUWUMX
	LK2GTewFipdbzZ+SPGDgou30Pbcwx/rxWQ==
X-Google-Smtp-Source: 
 AGRyM1vBYBxufe0uBPMz7HnPhAgyY6fylF3otkpOF6oemD5y2VfsgRvj6SkAd38PbC0hcbiR6vEXAQ==
X-Received: by 2002:a63:e258:0:b0:41a:d92b:64f9 with SMTP id
 y24-20020a63e258000000b0041ad92b64f9mr10889674pgj.148.1658819052377;
        Tue, 26 Jul 2022 00:04:12 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.158])
        by smtp.gmail.com with ESMTPSA id
 w2-20020a170902e88200b0016be96e07d1sm7396078plg.121.2022.07.26.00.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 00:04:11 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Tue, 26 Jul 2022 12:34:05 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH V2] grub2: Fix buffer underflow write in the heap
Date: Tue, 26 Jul 2022 12:34:02 +0530
Message-Id: <20220726070402.116201-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 07:04:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168496

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
 .../grub/files/CVE-2021-3695.patch            | 178 ++++++++++++++++++
 .../grub/files/CVE-2021-3696.patch            |  46 +++++
 .../grub/files/CVE-2021-3697.patch            |  82 ++++++++
 meta/recipes-bsp/grub/grub2.inc               |   5 +-
 4 files changed, 310 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3695.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3696.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3697.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2021-3695.patch b/meta/recipes-bsp/grub/files/CVE-2021-3695.patch
new file mode 100644
index 0000000000..7d6e805725
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2021-3695.patch
@@ -0,0 +1,178 @@
+From 0693d672abcf720419f86c56bda6428c540e2bb1 Mon Sep 17 00:00:00 2001
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
+ grub-core/video/readers/png.c | 89 ++++-------------------------------
+ 1 file changed, 8 insertions(+), 81 deletions(-)
+
+diff --git a/grub-core/video/readers/png.c b/grub-core/video/readers/png.c
+index 0157ff7..db4a9d4 100644
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
+@@ -917,61 +898,7 @@ grub_png_convert_image (struct grub_png_data *data)
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
+-    {
++  {
+   /* Only copy the upper 8 bit.  */
+ #ifndef GRUB_CPU_WORDS_BIGENDIAN
+       for (i = 0; i < (data->image_width * data->image_height * data->bpp >> 1);
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


