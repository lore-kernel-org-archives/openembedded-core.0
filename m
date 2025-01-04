Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3945E77188
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:26 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.18140.1735998146175690930
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:42:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=c14kz3Jr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2163b0c09afso181326945ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998145; x=1736602945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BuJdH/cwQZej5bRG+xuiDONKJmkjheFt4PkYScPpNs=;
        b=c14kz3Jr7yXu4PSJhi3k/NyEOv3NEnv1mxWTkBwUhWW54WaluX0mYaLSuHQduRMLsG
         y+6wHwBqu+KrVovyRuPCUfYmgKJwgNCFxKOH+NydUPhARpaXtXSk3FgGttFQ66tFIBXb
         +E71SqOH32dVfVoz9Y8OOh+AqBk7A1ValCnMBIwg6JYPc1cG7GcQdj7yL0CjlduU6oiu
         ssOsMH7+tUE4xdttqLcGVy6WV5kR+lu6DELPv5dBw/1v4rEFN437CO+rcwBK0PLxhh6f
         ZIzy3WwgJnsGLgoXWHJ5eUq6NpGFzhNOyKR8+fGo7NbSE7bESIJ6ebjyY30oLGBKSie0
         JnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998145; x=1736602945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BuJdH/cwQZej5bRG+xuiDONKJmkjheFt4PkYScPpNs=;
        b=crjBtviZ17Ot+z452lTI40/EhtnFYoshXUnKOHSKC9figVLoqxf6EAIcPBm4yfvoQq
         HmPGQ8ZYkSMkqsJ9Nv0UVksQrJguHCZPEy0DKZMNDVOYlWVd/hGNaCSda5SU64VfuR0h
         UGuFPQVEbtko5OoM/eDMHa7NTqgOib86GcEgFIFwAKfY9KreKuJ1BVJSUz+ltqO2TIuD
         tQeHLQjAO+VZeVBePwaJKXSnVifKTU7eXGKzMJv9qTJRLTQFMQvlrZ7SyHBmtkdWLC0w
         f7QgXcjy7JbVvRY6vVm3boYcvh2Gi/5euB0onvACCN53cjgq/jVX1YVnOBUpzWNpGWxE
         ztqw==
X-Gm-Message-State: AOJu0YwRGHdgByzw32MUWJTf5+ZJ+T+KM/6jEZumS3n4q+l+bv6E8yLh
	tnShyFlB5XNB5tQrQT+DsBNX/BieEbEX0VAQWmr2mrrG0SUIXPDaSdeTNn2aivzGlkpNyuCbhTV
	5
X-Gm-Gg: ASbGnctzemmsb5JQaeHDZsJjXn/uljRir299CCAv+3VOCXYx6SRlPmKj/KOSGtCny4O
	H2GN4Aw3szvnqJvYZJSA1sX6vSinxdmKEdBUeDGgVf2KVT0WQfw+cETcCfvnxaO9SaiVWfH2sMu
	OaWB0OhkvYM7zjK7HnMKy1a7ztUpuXYhJKSlKA/XYKEyvsygjxXV+GKLPAUDMXsydSP1J1lzJ1U
	VekW++E9f2y4wuQv5krOaCfScHhPBuyJVN/F+bcezpOVQ==
X-Google-Smtp-Source: AGHT+IEvYlrjqlZRGeW9NywVAAYzXbA4/aZDoQFe8UjX+O5ZuRyEZxl3mahaqRAfQ+fU0nyJzIr8Lg==
X-Received: by 2002:a05:6a21:9994:b0:1db:ef68:e505 with SMTP id adf61e73a8af0-1e5e05a9ef2mr88973689637.20.1735998145390;
        Sat, 04 Jan 2025 05:42:25 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.42.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:42:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/25] libarchive: Fix CVE-2024-20696
Date: Sat,  4 Jan 2025 05:41:41 -0800
Message-ID: <a3b0a4a53e99e4faa42a6e7be5713b12acc63dba.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735997984.git.steve@sakoman.com>
References: <cover.1735997984.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209386

From: aszh07 <mail2szahir@gmail.com>

Add Patch file to fix CVE-2024-20696

CVE: CVE-2024-20696

Signed-off-by: Nitin Wankhade <nitin.wankhade@kpit.com>
Signed-off-by: Nikhil R <nikhilr5@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/CVE-2024-20696.patch           | 115 ++++++++++++++++++
 .../libarchive/libarchive_3.7.4.bb            |   3 +-
 2 files changed, 117 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-20696.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2024-20696.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2024-20696.patch
new file mode 100644
index 0000000000..e55d58d37b
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2024-20696.patch
@@ -0,0 +1,115 @@
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
+--- a/libarchive/archive_read_support_format_rar.c	2024-04-26 14:52:59.000000000 +0530
++++ b/libarchive/archive_read_support_format_rar.c	2024-12-12 07:35:33.287412704 +0530
+@@ -432,7 +432,7 @@ static int make_table_recurse(struct arc
+                               struct huffman_table_entry *, int, int);
+ static int expand(struct archive_read *, int64_t *);
+ static int copy_from_lzss_window_to_unp(struct archive_read *, const void **,
+-                                        int64_t, int);
++                                        int64_t, size_t);
+ static const void *rar_read_ahead(struct archive_read *, size_t, ssize_t *);
+ static int parse_filter(struct archive_read *, const uint8_t *, uint16_t,
+                         uint8_t);
+@@ -2060,7 +2060,7 @@ read_data_compressed(struct archive_read
+         bs = rar->unp_buffer_size - rar->unp_offset;
+       else
+         bs = (size_t)rar->bytes_uncopied;
+-      ret = copy_from_lzss_window_to_unp(a, buff, rar->offset, (int)bs);
++      ret = copy_from_lzss_window_to_unp(a, buff, rar->offset, bs);
+       if (ret != ARCHIVE_OK)
+         return (ret);
+       rar->offset += bs;
+@@ -2213,7 +2213,7 @@ read_data_compressed(struct archive_read
+       bs = rar->unp_buffer_size - rar->unp_offset;
+     else
+       bs = (size_t)rar->bytes_uncopied;
+-    ret = copy_from_lzss_window_to_unp(a, buff, rar->offset, (int)bs);
++    ret = copy_from_lzss_window_to_unp(a, buff, rar->offset, bs);
+     if (ret != ARCHIVE_OK)
+       return (ret);
+     rar->offset += bs;
+@@ -3094,11 +3094,16 @@ copy_from_lzss_window(struct archive_rea
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
+@@ -3110,17 +3115,17 @@ copy_from_lzss_window_to_unp(struct arch
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
+@@ -3130,9 +3135,7 @@ copy_from_lzss_window_to_unp(struct arch
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
+@@ -3140,6 +3143,11 @@ copy_from_lzss_window_to_unp(struct arch
+   else
+     *buffer = NULL;
+   return (ARCHIVE_OK);
++
++fatal:
++  archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
++                    "Bad RAR file data");
++  return (ARCHIVE_FATAL);
+ }
+ 
+ static const void *
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
index 6e406611f9..80b2e49eac 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
@@ -33,7 +33,8 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 SRC_URI += "file://configurehack.patch \
             file://CVE-2024-48957.patch \
             file://CVE-2024-48958.patch \
-	"
+            file://CVE-2024-20696.patch \
+           "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
 SRC_URI[sha256sum] = "7875d49596286055b52439ed42f044bd8ad426aa4cc5aabd96bfe7abb971d5e8"
-- 
2.43.0


