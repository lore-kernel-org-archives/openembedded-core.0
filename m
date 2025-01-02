Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1B2E77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 07:49:36 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.4223.1735804168248977067
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 23:49:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i6OU3N7r;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: mail2szahir@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-216728b1836so132757445ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 23:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735804167; x=1736408967; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuWH0lOHy3vbvQ8FeOG7s31LrojaWqvCmFYdj0W532Y=;
        b=i6OU3N7r7S5UPcwGqgn94sCaqpMIFCf7EdOK1hIE62O+bxe7fHSWIJab0GYZo28WnN
         cAR9DeO5oCkVHejVVQotY/AOSnTaQQO1VUXV5HGZ9ow29o5IXv8JXT1nWgi//s+6UIVb
         njzHCaYSkXZqJPZFS0IqcXu92lIy5UEFJyB/OaZozSD9OAYBESp6Zg4R2sEck+rs52Ec
         tmuox9dXVSAhbsctHXlIc7k8HjItHkSIcyQCY6ll0DFgYnSk/kcPvYG0+jQ36LdrRoCg
         2jawuDyJbF8s1E1Ne1bqNnkPgoVBXfz3pkMEJO4gS6NxKJg9+ZTqcXrQa+yRMZcadkqo
         Q7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735804167; x=1736408967;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cuWH0lOHy3vbvQ8FeOG7s31LrojaWqvCmFYdj0W532Y=;
        b=Mh2/pbHFDJcLeoZIRlpR7152DCqAQyLBAzZN70jutYt2RcC9yxClm0vIpba/zLycpb
         Ks416BXUF9sCzMpaIaKIbi8FfOCqeprZXQKDeJz0EfdEMBDq6akIXwIW2254ZQWlFm0Y
         pGS5rXKxvy7nc6UUb2qlEIm57ykCWZhm+kDtUfgCjenqasO/YzufJIDCyz+KKqfL7Igv
         hQ6GTuY2TBLyMOfuruzq0xk6EJJFHrk66wk0jpbu+scDFJQTrqg9i6IslXO2+0UcRqCz
         GNvFoPLtPVkMx0u1GkfgCcIYPzYMQWQC+/QX5UdlCtg+fLv89HMcor9WVCAY1a+y5dPZ
         If7A==
X-Gm-Message-State: AOJu0YyA83F4DUv0qQGtzVY2eayoqkZRDl7ymEfOejkX9iLrB/xw7I2r
	XaMdFXl8fnUBHG0kOE3tARah6YKEJyqji5FdV48OXxC2y/oPJFAif1QPmg==
X-Gm-Gg: ASbGncuQkAT0YVpSMwAWTr7DzNUqGtWppiSGKq8Gw/j+WIvMsD8WcO6T6uJxJefO+Jz
	j+Ftf8mag04h3ySa+E3Qcl+0Fz700yXK4h0NiCcjVXI/T/D96NYw2RJ2FqaPm+8FpVmyc/TYdUT
	lA9CzvZ5GzafTEhF/ak+CJM5j3GR7nbOpiMsrvVPzbJzEkv2jWge8yDafswP7MosIuvCNSywT5u
	sshZ/kziya8tiJ6XkqZ2XNWYBvXuMa2+6hcTwuIXkxYqzqX2qfFEd9QLSxbWAHfXNXnDUuLfWE=
X-Google-Smtp-Source: AGHT+IHHJEJfHWu/Gxze+iLoZXNnzeYGybRmSncX6NTHs8k+VvvKgdu1pzDqNCqSmdIwr0QS2ch5JQ==
X-Received: by 2002:a05:6a20:2d21:b0:1e0:bf98:42dc with SMTP id adf61e73a8af0-1e5e07f98d0mr70523451637.28.1735804167263;
        Wed, 01 Jan 2025 23:49:27 -0800 (PST)
Received: from localhost.localdomain ([2405:201:e02e:c09b:a838:214c:8b21:28ef])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fe5fbsm24462601b3a.142.2025.01.01.23.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 23:49:26 -0800 (PST)
From: aszh07 <mail2szahir@gmail.com>
To: openembedded-core@lists.openembedded.org,
	nikhilr5@kpit.com
Cc: Nitin Wankhade <nitin.wankhade@kpit.com>
Subject: [OE-core][kirkstone][PATCH] libarchive: Fix CVE-2024-20696
Date: Thu,  2 Jan 2025 13:18:56 +0530
Message-Id: <20250102074856.29056-1-mail2szahir@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 07:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209254

Add Patch file to fix CVE-2024-20696

CVE: CVE-2024-20696

Signed-off-by: Nitin Wankhade <nitin.wankhade@kpit.com>
Signed-off-by: Nikhil R <nikhilr5@kpit.com>
---
 .../libarchive/CVE-2024-20696.patch           | 114 ++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-20696.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2024-20696.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2024-20696.patch
new file mode 100644
index 0000000000..f980f60597
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2024-20696.patch
@@ -0,0 +1,114 @@
+From eac15e252010c1189a5c0f461364dbe2cd2a68b1 Mon Sep 17 00:00:00 2001
+From: "Dustin L. Howett" <dustin@howett.net>
+Date: Thu, 9 May 2024 18:59:17 -0500
+Subject: [PATCH] rar4 reader: protect copy_from_lzss_window_to_unp() (#2172)
+
+copy_from_lzss_window_to_unp unnecessarily took an `int` parameter where
+both of its callers were holding a `size_t`.
+
+A lzss opcode chain could be constructed that resulted in a negative
+copy length, which when passed into memcpy would result in a very, very
+large positive number.
+
+Switching copy_from_lzss_window_to_unp to take a `size_t` allows it to
+properly bounds-check length.
+
+In addition, this patch also ensures that `length` is not itself larger
+than the destination buffer.
+
+CVE: CVE-2024-20696
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/eac15e252010c1189a5c0f461364dbe2cd2a68b1]
+
+Signed-off-by: Nitin Wankhade <nitin.wankhade@kpit.com>
+---
+
+--- a/libarchive/archive_read_support_format_rar.c   2024-12-11 12:33:47.566310000 +0530
++++ a/libarchive/archive_read_support_format_rar.c   2024-12-11 13:09:39.396142151 +0530
+@@ -432,7 +432,7 @@ static int make_table_recurse(struct arc
+                               struct huffman_table_entry *, int, int);
+ static int expand(struct archive_read *, int64_t *);
+ static int copy_from_lzss_window_to_unp(struct archive_read *, const void **,
+-                                        int64_t, int);
++                                        int64_t, size_t);
+ static const void *rar_read_ahead(struct archive_read *, size_t, ssize_t *);
+ static int parse_filter(struct archive_read *, const uint8_t *, uint16_t,
+                         uint8_t);
+@@ -2069,7 +2069,7 @@ read_data_compressed(struct archive_read
+         bs = rar->unp_buffer_size - rar->unp_offset;
+       else
+         bs = (size_t)rar->bytes_uncopied;
+-      ret = copy_from_lzss_window_to_unp(a, buff, rar->offset, (int)bs);
++      ret = copy_from_lzss_window_to_unp(a, buff, rar->offset, bs);
+       if (ret != ARCHIVE_OK)
+         return (ret);
+       rar->offset += bs;
+@@ -2209,7 +2209,7 @@ read_data_compressed(struct archive_read
+       bs = rar->unp_buffer_size - rar->unp_offset;
+     else
+       bs = (size_t)rar->bytes_uncopied;
+-    ret = copy_from_lzss_window_to_unp(a, buff, rar->offset, (int)bs);
++    ret = copy_from_lzss_window_to_unp(a, buff, rar->offset, bs);
+     if (ret != ARCHIVE_OK)
+       return (ret);
+     rar->offset += bs;
+@@ -3090,11 +3090,16 @@ copy_from_lzss_window(struct archive_rea
+ 
+ static int
+ copy_from_lzss_window_to_unp(struct archive_read *a, const void **buffer,
+-                             int64_t startpos, int length)
++                             int64_t startpos, size_t length)
+ {
+   int windowoffs, firstpart;
+   struct rar *rar = (struct rar *)(a->format->data);
+ 
++  if (length > rar->unp_buffer_size)
++  {
++    goto fatal;
++  }
++
+   if (!rar->unp_buffer)
+   {
+     if ((rar->unp_buffer = malloc(rar->unp_buffer_size)) == NULL)
+@@ -3106,17 +3111,17 @@ copy_from_lzss_window_to_unp(struct arch
+   }
+ 
+   windowoffs = lzss_offset_for_position(&rar->lzss, startpos);
+-  if(windowoffs + length <= lzss_size(&rar->lzss)) {
++  if(windowoffs + length <= (size_t)lzss_size(&rar->lzss)) {
+     memcpy(&rar->unp_buffer[rar->unp_offset], &rar->lzss.window[windowoffs],
+            length);
+-  } else if (length <= lzss_size(&rar->lzss)) {
++  } else if (length <= (size_t)lzss_size(&rar->lzss)) {
+     firstpart = lzss_size(&rar->lzss) - windowoffs;
+     if (firstpart < 0) {
+       archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
+                         "Bad RAR file data");
+       return (ARCHIVE_FATAL);
+     }
+-    if (firstpart < length) {
++    if ((size_t)firstpart < length) {
+       memcpy(&rar->unp_buffer[rar->unp_offset],
+              &rar->lzss.window[windowoffs], firstpart);
+       memcpy(&rar->unp_buffer[rar->unp_offset + firstpart],
+@@ -3126,9 +3131,7 @@ copy_from_lzss_window_to_unp(struct arch
+              &rar->lzss.window[windowoffs], length);
+     }
+   } else {
+-      archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
+-                        "Bad RAR file data");
+-      return (ARCHIVE_FATAL);
++      goto fatal;
+   }
+   rar->unp_offset += length;
+   if (rar->unp_offset >= rar->unp_buffer_size)
+@@ -3136,6 +3139,10 @@ copy_from_lzss_window_to_unp(struct arch
+   else
+     *buffer = NULL;
+   return (ARCHIVE_OK);
++fatal:
++  archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
++                    "Bad RAR file data");
++  return (ARCHIVE_FATAL);
+ }
+ 
+ static const void *
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index e1eca79004..6af01cf408 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2024-26256.patch \
            file://CVE-2024-48957.patch \
            file://CVE-2024-48958.patch \
+           file://CVE-2024-20696.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.17.1


