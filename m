Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83291C25B4F
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:06:00 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.8416.1715256354766377070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sUv4E/9w;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6edc61d0ff6so710952b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715256354; x=1715861154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i4bq6JXTrphBg6o/JkCfJyvyuT5s4Y6cF3O34hk6DgU=;
        b=sUv4E/9wD1NrAxiM6GqqpTHEQylgTXtDxkWZEE8NTrfQiau/FtN3/SdVD8MpHPk3+l
         8H+Se8Nd/wdMnhEBNufdzzM3cumwKp/72+P1Rv1Gzjm9ssF50Fz2poBp70iOtHI28rOv
         7uJ+ffIGRZZ6ThuLBslG0CsqgNRLtbSjP81Ng+HVYejiqyYCJV8AfPfVgRenMGF9ZIUl
         K506iQRVDW/WTzs51fDPwKg/3C6kHPxL7+KJdAzs4+AEYOBr9wZaatUaHHSwdcDUXy3N
         lDgas+2q3rX7b4KdMsRxmSlgQQhxcafzO045obqfbHKTpqh9Po3P/lzLpkB1yxijJ1gw
         IYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256354; x=1715861154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4bq6JXTrphBg6o/JkCfJyvyuT5s4Y6cF3O34hk6DgU=;
        b=GZenGw8hRex3uuo48neQ5ghofr/BeVTSaNpM8Sj3F504y+erLQY+hsKVXJob3OBzz4
         vgA3kkk/bf5UpyOVpp+zw8KfYH6i2Ykc+2M+kV1ieLdFNSJLpCSKwmy0QOIkbDTZBSs1
         ja0wriXYk7nkaz3EXHs7QSxh5BZfFQq9KTYDKeyy07IWLEmPbSTZbVoa3pYhD2i7OK52
         OoEI8Xrxy1q4IaCSp4IANkL4s2lOX3NT2TEuo0cvz9OcOOzq5lsb1wHlRU95RTaPTwbB
         avXFZRWij6jMHB/8IccQh6/uJKXGXjXq4rP3cvSjXpt31rQm4fo9uIxao7FqmYSBh4Oi
         n3Gw==
X-Gm-Message-State: AOJu0YwEL1Gya7NpcJmDjQrRf2Sdshg2TUObUThqjr/JkR8n7V5VGhbq
	EeUB7l2BbwQHQZuqPG3EZ998BLJ0HM5KRL3cWIUxdTg1ln45Ed3lEbajGiCF4vcbbC+xIrZjDxb
	/
X-Google-Smtp-Source: AGHT+IHY5lk67YqgJLEjqDV0B9H0FwzpFXQvEvnysSk/gxpVZ2R96hLDBLstyyJSeUa+c0ErwZINcQ==
X-Received: by 2002:a05:6a20:5612:b0:1af:b1c0:c9eb with SMTP id adf61e73a8af0-1afc8d96d5cmr5059764637.45.1715256353935;
        Thu, 09 May 2024 05:05:53 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c41sm1185613b3a.172.2024.05.09.05.05.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:05:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/23] libarchive: fix multiple security vulnerabilities in pax writer
Date: Thu,  9 May 2024 05:05:00 -0700
Message-Id: <3743a82162546eceb8d54b240dc70c521c53bed8.1715256149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715256149.git.steve@sakoman.com>
References: <cover.1715256149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:06:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199169

From: Peter Marko <peter.marko@siemens.com>

There was no CVE assigned but the commit message is clear.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ix-multiple-security-vulnerabilities.patch | 107 ++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |   4 +-
 2 files changed, 110 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-pax-writer-fix-multiple-security-vulnerabilities.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-pax-writer-fix-multiple-security-vulnerabilities.patch b/meta/recipes-extended/libarchive/libarchive/0001-pax-writer-fix-multiple-security-vulnerabilities.patch
new file mode 100644
index 0000000000..0fec6a9b8c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-pax-writer-fix-multiple-security-vulnerabilities.patch
@@ -0,0 +1,107 @@
+From 1b4e0d0f9d445ba3e4d0c7db7ce0b30300572fe8 Mon Sep 17 00:00:00 2001
+From: Martin Matuska <martin@matuska.de>
+Date: Fri, 18 Aug 2023 00:28:39 +0200
+Subject: [PATCH] pax writer: fix multiple security vulnerabilities
+
+Security vulnerabilities:
+1. Heap overflow in url_encode() in archive_write_set_format_pax.c
+2. NULL dereference in archive_write_pax_header_xattrs()
+3. Another NULL dereference in archive_write_pax_header_xattrs()
+4. NULL dereference in archive_write_pax_header_xattr()
+
+The vulnerabilities can be triggered when writing pax archives
+with extended attributes (SCHILY or LIBARCHIVE) by feeding attribute
+names longer than INT_MAX or attribute names that fail to be encoded
+properly.
+
+Reported-by: Bahaa Naamneh of Crosspoint Labs
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/1b4e0d0f9d445ba3e4d0c7db7ce0b30300572fe8]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libarchive/archive_write_set_format_pax.c | 35 ++++++++++++++++-------
+ 1 file changed, 25 insertions(+), 10 deletions(-)
+
+diff --git a/libarchive/archive_write_set_format_pax.c b/libarchive/archive_write_set_format_pax.c
+index c9c15916..1eb9a9a4 100644
+--- a/libarchive/archive_write_set_format_pax.c
++++ b/libarchive/archive_write_set_format_pax.c
+@@ -367,10 +367,12 @@ archive_write_pax_header_xattr(struct pax *pax, const char *encoded_name,
+ 	struct archive_string s;
+ 	char *encoded_value;
+ 
++	if (encoded_name == NULL)
++		return;
++
+ 	if (pax->flags & WRITE_LIBARCHIVE_XATTR) {
+ 		encoded_value = base64_encode((const char *)value, value_len);
+-
+-		if (encoded_name != NULL && encoded_value != NULL) {
++		if (encoded_value != NULL) {
+ 			archive_string_init(&s);
+ 			archive_strcpy(&s, "LIBARCHIVE.xattr.");
+ 			archive_strcat(&s, encoded_name);
+@@ -403,17 +405,22 @@ archive_write_pax_header_xattrs(struct archive_write *a,
+ 
+ 		archive_entry_xattr_next(entry, &name, &value, &size);
+ 		url_encoded_name = url_encode(name);
+-		if (url_encoded_name != NULL) {
++		if (url_encoded_name == NULL)
++			goto malloc_error;
++		else {
+ 			/* Convert narrow-character to UTF-8. */
+ 			r = archive_strcpy_l(&(pax->l_url_encoded_name),
+ 			    url_encoded_name, pax->sconv_utf8);
+ 			free(url_encoded_name); /* Done with this. */
+ 			if (r == 0)
+ 				encoded_name = pax->l_url_encoded_name.s;
+-			else if (errno == ENOMEM) {
+-				archive_set_error(&a->archive, ENOMEM,
+-				    "Can't allocate memory for Linkname");
+-				return (ARCHIVE_FATAL);
++			else if (r == -1)
++				goto malloc_error;
++			else {
++				archive_set_error(&a->archive,
++				    ARCHIVE_ERRNO_MISC,
++				    "Error encoding pax extended attribute");
++				return (ARCHIVE_FAILED);
+ 			}
+ 		}
+ 
+@@ -422,6 +429,9 @@ archive_write_pax_header_xattrs(struct archive_write *a,
+ 
+ 	}
+ 	return (ARCHIVE_OK);
++malloc_error:
++	archive_set_error(&a->archive, ENOMEM, "Can't allocate memory");
++	return (ARCHIVE_FATAL);
+ }
+ 
+ static int
+@@ -1904,14 +1914,19 @@ url_encode(const char *in)
+ {
+ 	const char *s;
+ 	char *d;
+-	int out_len = 0;
++	size_t out_len = 0;
+ 	char *out;
+ 
+ 	for (s = in; *s != '\0'; s++) {
+-		if (*s < 33 || *s > 126 || *s == '%' || *s == '=')
++		if (*s < 33 || *s > 126 || *s == '%' || *s == '=') {
++			if (SIZE_MAX - out_len < 4)
++				return (NULL);
+ 			out_len += 3;
+-		else
++		} else {
++			if (SIZE_MAX - out_len < 2)
++				return (NULL);
+ 			out_len++;
++		}
+ 	}
+ 
+ 	out = (char *)malloc(out_len + 1);
+-- 
+2.30.2
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index 0219ffa720..7d328a0060 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -28,7 +28,9 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 
 EXTRA_OECONF += "--enable-largefile --without-iconv"
 
-SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
+SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
+    file://0001-pax-writer-fix-multiple-security-vulnerabilities.patch \
+"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
 SRC_URI[sha256sum] = "ba6d02f15ba04aba9c23fd5f236bb234eab9d5209e95d1c4df85c44d5f19b9b3"
-- 
2.34.1


