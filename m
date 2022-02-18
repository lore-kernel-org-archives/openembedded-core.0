Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8306AC433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 10:06:24 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.9076.1645178783127145607
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hx/UhNJf;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id m27so1842343wrb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 02:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ipHLwKzUJ9DDY3JSicwIJL4Yim1CBEZ6DxZrxkli7ps=;
        b=hx/UhNJfffiw0OWWCS/+wHH5dMpTOsgsTW5Tbhn2KSiGdqxsTfACnKS6XP8Kin352w
         U0aqlYvu6uNZUZAZcNEsSd9xBkLVLAw3QZuSA9E4aooJ6fZfPQVmB+VktPSz3q+tzPDj
         Ah62Xg9KC2GRUnZ2Q16ycs00NPbTeBUZ7hOj8/xSM5MDMAI6U0G2tps5bD0JZptRh9fN
         uVKge2XN4WQU+swH7VMXWBMVnvlMdbO2c5uptl5SvR9DnadKg+mNq5ifgBcmffM3/maE
         w2/a1dcy47ywffng1ueKxkPVJ2HdvM63dPeBLg5mu42swBd3ol1pTOEr981GtaiCgnTG
         UYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ipHLwKzUJ9DDY3JSicwIJL4Yim1CBEZ6DxZrxkli7ps=;
        b=wXOLWFKEg5cK/ij2MfNaPop0wbVhny9gycn0gy2VxZb3HxrQj3BX3mg4pLm9tZPv5a
         uSoYZdsIARdTQE0/5tJIDJtS3m9C/QiUZMUdu2JSICD8Ge92GwU7Qh5vZV7i75nt5nAQ
         GaU8G4sBf9vA0Kkz/0QXnALYamwtcNhFKCX1uHAR/79E+8jyjyVp/5QF93c90vdOaqS2
         isvopz6ihJh3faSTqZz1Yndc60UY88rXOMytcRgkaoQojXa29UWDaUO1ILJw+tn8MeJO
         m+Eaqb8+C5Zmf986lB2fp62iBlArEcoUwR+l5784ZfhYlRMSqICOHADKoiycNUpNlUQp
         Rm9w==
X-Gm-Message-State: AOAM5303pRhKBEgeOnzyiPDyXX+4y2x+BNfqTxjjNTaQFjrmji4PhfDi
	r+5/Ri/iHunfpYPZLSmihas=
X-Google-Smtp-Source: 
 ABdhPJxcjYWyu0TGNSfESXhBH+QP77Edw6Ub1vnKxnNe9OyIP4Hw+mP5xt2H/nEjp7cRVGxD2mxZBA==
X-Received: by 2002:adf:816c:0:b0:1e6:88a9:eb6c with SMTP id
 99-20020adf816c000000b001e688a9eb6cmr5380703wrm.645.1645178781592;
        Fri, 18 Feb 2022 02:06:21 -0800 (PST)
Received: from localhost.localdomain ([80.215.178.41])
        by smtp.gmail.com with ESMTPSA id
 z5sm4808494wmp.10.2022.02.18.02.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:06:21 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
To: anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 05/46][dunfell] grub: add a fix for malformed device path
 handling
Date: Fri, 18 Feb 2022 11:05:13 +0100
Message-Id: <20220218100554.1315511-6-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220218100554.1315511-1-rybczynska@gmail.com>
References: <20220218100554.1315511-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 10:06:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161893

This change fixes the malformed device paths in EFI handling.
Device paths of length 4 or shorter could cause different
kinds of unexpected behaviours.

This patch is NOT a part of [1], but is a dependency of one
of the patches included in the series.

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 ...formed-device-path-arithmetic-errors.patch | 235 ++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   1 +
 2 files changed, 236 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0005-efi-Fix-some-malformed-device-path-arithmetic-errors.patch

diff --git a/meta/recipes-bsp/grub/files/0005-efi-Fix-some-malformed-device-path-arithmetic-errors.patch b/meta/recipes-bsp/grub/files/0005-efi-Fix-some-malformed-device-path-arithmetic-errors.patch
new file mode 100644
index 0000000000..04748befc8
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0005-efi-Fix-some-malformed-device-path-arithmetic-errors.patch
@@ -0,0 +1,235 @@
+From 16a4d739b19f8680cf93a3c8fa0ae9fc1b1c310b Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Sun, 19 Jul 2020 16:53:27 -0400
+Subject: [PATCH] efi: Fix some malformed device path arithmetic errors
+
+Several places we take the length of a device path and subtract 4 from
+it, without ever checking that it's >= 4. There are also cases where
+this kind of malformation will result in unpredictable iteration,
+including treating the length from one dp node as the type in the next
+node. These are all errors, no matter where the data comes from.
+
+This patch adds a checking macro, GRUB_EFI_DEVICE_PATH_VALID(), which
+can be used in several places, and makes GRUB_EFI_NEXT_DEVICE_PATH()
+return NULL and GRUB_EFI_END_ENTIRE_DEVICE_PATH() evaluate as true when
+the length is too small. Additionally, it makes several places in the
+code check for and return errors in these cases.
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=d2cf823d0e31818d1b7a223daff6d5e006596543]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/kern/efi/efi.c           | 64 +++++++++++++++++++++++++-----
+ grub-core/loader/efi/chainloader.c | 13 +++++-
+ grub-core/loader/i386/xnu.c        |  9 +++--
+ include/grub/efi/api.h             | 14 ++++---
+ 4 files changed, 79 insertions(+), 21 deletions(-)
+
+diff --git a/grub-core/kern/efi/efi.c b/grub-core/kern/efi/efi.c
+index ad170c7..6a38080 100644
+--- a/grub-core/kern/efi/efi.c
++++ b/grub-core/kern/efi/efi.c
+@@ -360,7 +360,7 @@ grub_efi_get_filename (grub_efi_device_path_t *dp0)
+ 
+   dp = dp0;
+ 
+-  while (1)
++  while (dp)
+     {
+       grub_efi_uint8_t type = GRUB_EFI_DEVICE_PATH_TYPE (dp);
+       grub_efi_uint8_t subtype = GRUB_EFI_DEVICE_PATH_SUBTYPE (dp);
+@@ -370,9 +370,15 @@ grub_efi_get_filename (grub_efi_device_path_t *dp0)
+       if (type == GRUB_EFI_MEDIA_DEVICE_PATH_TYPE
+ 	       && subtype == GRUB_EFI_FILE_PATH_DEVICE_PATH_SUBTYPE)
+ 	{
+-	  grub_efi_uint16_t len;
+-	  len = ((GRUB_EFI_DEVICE_PATH_LENGTH (dp) - 4)
+-		 / sizeof (grub_efi_char16_t));
++	  grub_efi_uint16_t len = GRUB_EFI_DEVICE_PATH_LENGTH (dp);
++
++	  if (len < 4)
++	    {
++	      grub_error (GRUB_ERR_OUT_OF_RANGE,
++			  "malformed EFI Device Path node has length=%d", len);
++	      return NULL;
++	    }
++	  len = (len - 4) / sizeof (grub_efi_char16_t);
+ 	  filesize += GRUB_MAX_UTF8_PER_UTF16 * len + 2;
+ 	}
+ 
+@@ -388,7 +394,7 @@ grub_efi_get_filename (grub_efi_device_path_t *dp0)
+   if (!name)
+     return NULL;
+ 
+-  while (1)
++  while (dp)
+     {
+       grub_efi_uint8_t type = GRUB_EFI_DEVICE_PATH_TYPE (dp);
+       grub_efi_uint8_t subtype = GRUB_EFI_DEVICE_PATH_SUBTYPE (dp);
+@@ -404,8 +410,15 @@ grub_efi_get_filename (grub_efi_device_path_t *dp0)
+ 
+ 	  *p++ = '/';
+ 
+-	  len = ((GRUB_EFI_DEVICE_PATH_LENGTH (dp) - 4)
+-		 / sizeof (grub_efi_char16_t));
++	  len = GRUB_EFI_DEVICE_PATH_LENGTH (dp);
++	  if (len < 4)
++	    {
++	      grub_error (GRUB_ERR_OUT_OF_RANGE,
++			  "malformed EFI Device Path node has length=%d", len);
++	      return NULL;
++	    }
++
++	  len = (len - 4) / sizeof (grub_efi_char16_t);
+ 	  fp = (grub_efi_file_path_device_path_t *) dp;
+ 	  /* According to EFI spec Path Name is NULL terminated */
+ 	  while (len > 0 && fp->path_name[len - 1] == 0)
+@@ -480,7 +493,26 @@ grub_efi_duplicate_device_path (const grub_efi_device_path_t *dp)
+        ;
+        p = GRUB_EFI_NEXT_DEVICE_PATH (p))
+     {
+-      total_size += GRUB_EFI_DEVICE_PATH_LENGTH (p);
++      grub_size_t len = GRUB_EFI_DEVICE_PATH_LENGTH (p);
++
++      /*
++       * In the event that we find a node that's completely garbage, for
++       * example if we get to 0x7f 0x01 0x02 0x00 ... (EndInstance with a size
++       * of 2), GRUB_EFI_END_ENTIRE_DEVICE_PATH() will be true and
++       * GRUB_EFI_NEXT_DEVICE_PATH() will return NULL, so we won't continue,
++       * and neither should our consumers, but there won't be any error raised
++       * even though the device path is junk.
++       *
++       * This keeps us from passing junk down back to our caller.
++       */
++      if (len < 4)
++	{
++	  grub_error (GRUB_ERR_OUT_OF_RANGE,
++		      "malformed EFI Device Path node has length=%d", len);
++	  return NULL;
++	}
++
++      total_size += len;
+       if (GRUB_EFI_END_ENTIRE_DEVICE_PATH (p))
+ 	break;
+     }
+@@ -525,7 +557,7 @@ dump_vendor_path (const char *type, grub_efi_vendor_device_path_t *vendor)
+ void
+ grub_efi_print_device_path (grub_efi_device_path_t *dp)
+ {
+-  while (1)
++  while (GRUB_EFI_DEVICE_PATH_VALID (dp))
+     {
+       grub_efi_uint8_t type = GRUB_EFI_DEVICE_PATH_TYPE (dp);
+       grub_efi_uint8_t subtype = GRUB_EFI_DEVICE_PATH_SUBTYPE (dp);
+@@ -937,7 +969,10 @@ grub_efi_compare_device_paths (const grub_efi_device_path_t *dp1,
+     /* Return non-zero.  */
+     return 1;
+ 
+-  while (1)
++  if (dp1 == dp2)
++    return 0;
++
++  while (GRUB_EFI_DEVICE_PATH_VALID (dp1) && GRUB_EFI_DEVICE_PATH_VALID (dp2))
+     {
+       grub_efi_uint8_t type1, type2;
+       grub_efi_uint8_t subtype1, subtype2;
+@@ -973,5 +1008,14 @@ grub_efi_compare_device_paths (const grub_efi_device_path_t *dp1,
+       dp2 = (grub_efi_device_path_t *) ((char *) dp2 + len2);
+     }
+ 
++  /*
++   * There's no "right" answer here, but we probably don't want to call a valid
++   * dp and an invalid dp equal, so pick one way or the other.
++   */
++  if (GRUB_EFI_DEVICE_PATH_VALID (dp1) && !GRUB_EFI_DEVICE_PATH_VALID (dp2))
++    return 1;
++  else if (!GRUB_EFI_DEVICE_PATH_VALID (dp1) && GRUB_EFI_DEVICE_PATH_VALID (dp2))
++    return -1;
++
+   return 0;
+ }
+diff --git a/grub-core/loader/efi/chainloader.c b/grub-core/loader/efi/chainloader.c
+index daf8c6b..a8d7b91 100644
+--- a/grub-core/loader/efi/chainloader.c
++++ b/grub-core/loader/efi/chainloader.c
+@@ -156,9 +156,18 @@ make_file_path (grub_efi_device_path_t *dp, const char *filename)
+ 
+   size = 0;
+   d = dp;
+-  while (1)
++  while (d)
+     {
+-      size += GRUB_EFI_DEVICE_PATH_LENGTH (d);
++      grub_size_t len = GRUB_EFI_DEVICE_PATH_LENGTH (d);
++
++      if (len < 4)
++	{
++	  grub_error (GRUB_ERR_OUT_OF_RANGE,
++		      "malformed EFI Device Path node has length=%d", len);
++	  return NULL;
++	}
++
++      size += len;
+       if ((GRUB_EFI_END_ENTIRE_DEVICE_PATH (d)))
+ 	break;
+       d = GRUB_EFI_NEXT_DEVICE_PATH (d);
+diff --git a/grub-core/loader/i386/xnu.c b/grub-core/loader/i386/xnu.c
+index b7d176b..c50cb54 100644
+--- a/grub-core/loader/i386/xnu.c
++++ b/grub-core/loader/i386/xnu.c
+@@ -516,14 +516,15 @@ grub_cmd_devprop_load (grub_command_t cmd __attribute__ ((unused)),
+ 
+       devhead = buf;
+       buf = devhead + 1;
+-      dpstart = buf;
++      dp = dpstart = buf;
+ 
+-      do
++      while (GRUB_EFI_DEVICE_PATH_VALID (dp) && buf < bufend)
+ 	{
+-	  dp = buf;
+ 	  buf = (char *) buf + GRUB_EFI_DEVICE_PATH_LENGTH (dp);
++	  if (GRUB_EFI_END_ENTIRE_DEVICE_PATH (dp))
++	    break;
++	  dp = buf;
+ 	}
+-      while (!GRUB_EFI_END_ENTIRE_DEVICE_PATH (dp) && buf < bufend);
+ 
+       dev = grub_xnu_devprop_add_device (dpstart, (char *) buf
+ 					 - (char *) dpstart);
+diff --git a/include/grub/efi/api.h b/include/grub/efi/api.h
+index addcbfa..cf1355a 100644
+--- a/include/grub/efi/api.h
++++ b/include/grub/efi/api.h
+@@ -625,6 +625,7 @@ typedef struct grub_efi_device_path grub_efi_device_path_protocol_t;
+ #define GRUB_EFI_DEVICE_PATH_TYPE(dp)		((dp)->type & 0x7f)
+ #define GRUB_EFI_DEVICE_PATH_SUBTYPE(dp)	((dp)->subtype)
+ #define GRUB_EFI_DEVICE_PATH_LENGTH(dp)		((dp)->length)
++#define GRUB_EFI_DEVICE_PATH_VALID(dp)		((dp) != NULL && GRUB_EFI_DEVICE_PATH_LENGTH (dp) >= 4)
+ 
+ /* The End of Device Path nodes.  */
+ #define GRUB_EFI_END_DEVICE_PATH_TYPE			(0xff & 0x7f)
+@@ -633,13 +634,16 @@ typedef struct grub_efi_device_path grub_efi_device_path_protocol_t;
+ #define GRUB_EFI_END_THIS_DEVICE_PATH_SUBTYPE		0x01
+ 
+ #define GRUB_EFI_END_ENTIRE_DEVICE_PATH(dp)	\
+-  (GRUB_EFI_DEVICE_PATH_TYPE (dp) == GRUB_EFI_END_DEVICE_PATH_TYPE \
+-   && (GRUB_EFI_DEVICE_PATH_SUBTYPE (dp) \
+-       == GRUB_EFI_END_ENTIRE_DEVICE_PATH_SUBTYPE))
++  (!GRUB_EFI_DEVICE_PATH_VALID (dp) || \
++   (GRUB_EFI_DEVICE_PATH_TYPE (dp) == GRUB_EFI_END_DEVICE_PATH_TYPE \
++    && (GRUB_EFI_DEVICE_PATH_SUBTYPE (dp) \
++	== GRUB_EFI_END_ENTIRE_DEVICE_PATH_SUBTYPE)))
+ 
+ #define GRUB_EFI_NEXT_DEVICE_PATH(dp)	\
+-  ((grub_efi_device_path_t *) ((char *) (dp) \
+-                               + GRUB_EFI_DEVICE_PATH_LENGTH (dp)))
++  (GRUB_EFI_DEVICE_PATH_VALID (dp) \
++   ? ((grub_efi_device_path_t *) \
++      ((char *) (dp) + GRUB_EFI_DEVICE_PATH_LENGTH (dp))) \
++   : NULL)
+ 
+ /* Hardware Device Path.  */
+ #define GRUB_EFI_HARDWARE_DEVICE_PATH_TYPE		1
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 2e4e6d7ac2..f7f2aa892f 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -51,6 +51,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0002-net-net-Fix-possible-dereference-to-of-a-NULL-pointe.patch \
            file://0003-net-tftp-Fix-dangling-memory-pointer.patch \
            file://0004-kern-parser-Fix-resource-leak-if-argc-0.patch \
+           file://0005-efi-Fix-some-malformed-device-path-arithmetic-errors.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.33.0


