Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50755E77199
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:31:38 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.20165.1736256696453206468
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 05:31:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OVqPm7Ro;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2163dc5155fso224173755ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 05:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736256696; x=1736861496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OTNcwNCkF0/UYl0BFC/MQH26Mczt3OjEQZaNdLDMyf8=;
        b=OVqPm7Ro+sub6bvH0I9q4JGjXG5UTy+yrsJeA4mkDoEALObV0608rbBF+4UOGNnHXP
         gg9NBBubbmvxYrjUTzPJc5Dr1+HMizu8sVYeTPmEXAiETrwARcGuHS0EMiNlSmuU7dZg
         RaRiLerV2JKyEe6o1XHrY3gHxXreDqfktYs4e5l1POf6OVCwOkAgi0cxW+dJRto6afFo
         /ayAwI7pbtI3Houlx1MrF+NxIJy0Cl1NWmRYGUarOo7E9v12AyG9S8kPg7J4zAaL92gS
         UZ3Uzl1MX53Oavwqvi4yqw0UNN0Oftx0ZXVMMM54qI4XW28q8DxS9YEr85ACyrttAop+
         gqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736256696; x=1736861496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OTNcwNCkF0/UYl0BFC/MQH26Mczt3OjEQZaNdLDMyf8=;
        b=XO9iN6fcz07L6aiK/4+VSYlnYveqYs8OTCx2Y3GC33w7TRBrJRQckHXCHFXZKZgiRV
         4MJnnXdEjob8Wyb/r75LKGgI+hOmkh+75+mqEWSAd+kxvQipB/BfjuPPIIIVq8C5L9db
         efC9LcyanYo5A70+z3PaUXKMno7kflcNjWvAN3EGJ1WKzSYTOOb34lVeuJ2Vdzwf2I+K
         OId6X56KdfLkFgiviHjkhSwvgQXiWVoYlvjTYvVcw7guaFTBkJjroSixmCGLd/FVJA/y
         qvfuSH98ZfG+VkFpt9Fs43sxy7NhdzYkoWptnY8q0nAmSV8XWL3mbA2Ap9hkXtKnlCNC
         lgVg==
X-Gm-Message-State: AOJu0YzO8Zr++6ok8gZm/Y8sn9I/BnC2i64dJEytK0JU8994dS5t0kK+
	jS9mJ4uyOSvKeCnjZ03eztn284ySwe1oTQ6QPVP8Ol9It9eK84pfBvwfq+5OLqAtob1xvbtaLjy
	r
X-Gm-Gg: ASbGncv+Va7u0s6oxtX4w6wMfcF8UipjIVRNiR+p+gjz1/wfbpnYnW8KQcWJcshLQyL
	nC/1AKv3SOZqvtUWl5gdD43IGLcXjBruCblUEF0nc5toeR8OkaodZXJtKYp+fyCmZ9sPICs9NCN
	NR6o2vMkz5jbFJvA717hesISNacBBfPzlC+66eYUSJDtgDuxC/3hxp6BP7jJiG1JMXGRENiV5h9
	/QXoGky0BpXTtwYDyhjEJ5uS/BKIKcim63sxx4nugsiPQ==
X-Google-Smtp-Source: AGHT+IFlWyP5zmqyBSgMg97VVmYMRXx+rRtI2swAE8z0jSj1B9nJI9p7cG+rL5j2pfNoFcsE22gPdw==
X-Received: by 2002:a05:6a00:4486:b0:725:eb85:f802 with SMTP id d2e1a72fcca58-72abdd5ede1mr89838420b3a.2.1736256695674;
        Tue, 07 Jan 2025 05:31:35 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbae4sm33340197b3a.96.2025.01.07.05.31.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:31:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/13] libarchive: Fix CVE-2024-20696
Date: Tue,  7 Jan 2025 05:31:11 -0800
Message-ID: <8885aa23d77fcec288a416d199e08c6eee27e027.1736256495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736256495.git.steve@sakoman.com>
References: <cover.1736256495.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 13:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209460

From: aszh07 <mail2szahir@gmail.com>

Add Patch file to fix CVE-2024-20696

CVE: CVE-2024-20696

Signed-off-by: Nitin Wankhade <nitin.wankhade@kpit.com>
Signed-off-by: Nikhil R <nikhilr5@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


