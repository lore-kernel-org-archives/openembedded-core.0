Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74EB8C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:27:10 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web08.6783.1645799229727490202
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=3xtmUtFd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id l9so4516963pls.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VPHKzmXSeTDsv+/Ho/dE8OPqTLNtKU0KPuuRUVddmAM=;
        b=3xtmUtFd0YBDQtuh01xkL/bVMsyazQDMKj/ex6L9z0ILLf8pvriz9K7Qh367x6/pRs
         q5q1X82y5fxaKewa0ftd67pjYHkSy09EBlmeGa4idIOiY1fcpQSlxuv80iamqU1oIR9j
         x98UyAn0NlD2DhQLOB252u+YtopS/znMRXsA5y2WxbP900HXXWcy4g2fcpMlyD2UNlQr
         0cpb+wsjXVfgmxDzirV5Pi0PECEapD3IrpzVQjIQhV1R5wmHUHAkWWKXvMmPw/HcyagI
         xW+IeWqj2KtHnKe9/8dFzpy28xWLjq+pLHlT5gafbr565DMoTk07/ILGc9WwirdA1hzN
         sHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VPHKzmXSeTDsv+/Ho/dE8OPqTLNtKU0KPuuRUVddmAM=;
        b=V3/UwA8F1TDp1utkcMtMJBi0r7EkINQn+wALKjgJtbtmH1Y/7kNorrevewvx05nUwj
         aaeVrirHFfwZlNMOETSy0lpL57yVduLLKIB8Bx24VRiKflNSa97V8PmWT/qIivLFv7o8
         7N/1BAYe54qYWK+4IBQvQxpqExAaqK8zGcQYDkw0QUF8ojWfFxXUFhqON4rctDr1pvm/
         knyLlTTcA9EslHEzUr07WHiaHWS7iqJh1g5Y6pM1zRxuBWUWOcxQrNfaPT8kXZ2BFnn7
         fRPMh5ZIE/JkA/RKaFz1FRdgANgtnh92dLxEjA0HAzsS4Dxo+dbFEy86VeFiGdbj3xMl
         0BhQ==
X-Gm-Message-State: AOAM532ftKusffsrl41Pf7qkbyj2CRlVN5TgBqF/seuh57G/cU6mTZLA
	dhxncvFMwhfIxUBBfNLyf1HaHWSnE3bDawEb
X-Google-Smtp-Source: 
 ABdhPJxrQzL7Vuqm751z48hSMCqdj6suk2Lgtn4b1RLQBwQtRglqAcSoSlQKMJfUCGx/KnPm68PRbQ==
X-Received: by 2002:a17:90a:bb8b:b0:1bc:f3c9:df26 with SMTP id
 v11-20020a17090abb8b00b001bcf3c9df26mr2571808pjr.128.1645799228550;
        Fri, 25 Feb 2022 06:27:08 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.27.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:27:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/50] grub: add a fix for malformed device path
 handling
Date: Fri, 25 Feb 2022 04:25:49 -1000
Message-Id: 
 <7f08d97fb6a0ff9c779f788df150b54de8af2708.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:27:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162355

From: Marta Rybczynska <rybczynska@gmail.com>

This change fixes the malformed device paths in EFI handling.
Device paths of length 4 or shorter could cause different
kinds of unexpected behaviours.

This patch is NOT a part of [1], but is a dependency of one
of the patches included in the series.

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


