Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0964C4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 08:15:58 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.7695.1714551347932957010
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 01:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=lvUpzl+M;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2024050108154427cf5e5fc506517103-okb4hb@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2024050108154427cf5e5fc506517103
        for <openembedded-core@lists.openembedded.org>;
        Wed, 01 May 2024 10:15:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=CwajTJax3IW2QepX9GUUX9Cp6G2OMopRL7KYNzuDpz8=;
 b=lvUpzl+M7ebTC7UTCsFsC1yQcnFkBE2yyyI6UyWZAaOrZDfOAiuqYlgVpk/pRte2p7aBdO
 XR2JExS2jPmNyv5EwhQtR25TnTCejRr+3T7Uw7YTJXsrLqjVsJFLggE08IyoqbgCiEI9naIK
 lu2ndTdN9g0uLCEblo1HLPwBP9DF0=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] libarchive: fix multiple security vulnerabilities in pax writer
Date: Wed,  1 May 2024 10:14:53 +0200
Message-Id: <20240501081453.889935-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 08:15:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198789

From: Peter Marko <peter.marko@siemens.com>

There was no CVE assigned but the commit message is clear.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
2.30.2


