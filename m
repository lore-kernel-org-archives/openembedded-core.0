Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77458C5AD49
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 14:43:38 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.17587.1748443408848431237
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 07:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=u71F7/4o;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2347012f81fso37080865ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 07:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748443408; x=1749048208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Hcpk/NR3WX9Q4Sm8Bb0hd9k9Ivt2M8HXlfWkulHX0k=;
        b=u71F7/4o2e8icGmFBuiCz/RyhPF+6Z+HEPm9xLfwqCVo2UPgVyQ1MO6Y0H9ti9VDXM
         k+F2a4We1+C67Ny9CIW2tsdhOZGL4J8uEIk+TsOvAHFE+LNnvGaMXN3xjl3a+LFFIRzB
         xL8a6P7cyGtUixcAF8H/JwUKzTQvjWDSddQ8tnBBVP7u5ijPJc3AWoQLPKtq2abzFMS6
         OOlIvBzgyMp/Y9l6z3R4FNhySCYAFtuY8zgDB+COaELtkhBlsL2rsMgLOvoI9rPGLc9i
         9sNI41kXk6zbfmRrZxQ0yhIJZbugvL/oz7mfo9Tr3BhcUPKwly9PcPc/4+iETEQahKsn
         Wqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748443408; x=1749048208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Hcpk/NR3WX9Q4Sm8Bb0hd9k9Ivt2M8HXlfWkulHX0k=;
        b=hr1X2YPYKj667bG2d8he6J6pI5uFLMIkPQoiwogksNrddSJGIgBS+CVLDY4k44PH0B
         fZ1X3YDvMXsEtmrKUZfaO6TajgDzvMJIDcnMOh2mC6MtUuO7bDBAK8mqCUjxEKtZExQQ
         vdyozN8E+E2xSKlZRBkBZbaAr1crJNh5dOhjosg7TFn2XY3unQ5OvHPMR/JpHx8T+vC0
         M4ivVV8W1qCPO2X++6YPqaguLP/nQMFvu0WU+zgd+/8lYUd812LR6KJZ9Y2NQTU7kpAs
         +ukhiGQt08wNsExF9C8rwl9U7ponV2g9Fr7g4ol7SlgZvAPBwR5gr2ikVQKDnNu8eSRh
         fg+A==
X-Gm-Message-State: AOJu0YwdnDKVdwEQQpgHY1VGIwCdpUdc1WfP0eOsRvUBNMf7mVqEOasI
	V+rtQ8xlODXYbLXxh8Jvv/MnAJGLsMsGGXtg3iwDOPutimTzRyMlGYT0cSWqNPnHXf7EXN+F0NH
	hKsUV
X-Gm-Gg: ASbGncthdpKbNv2SK90gQlUajwxJuIi92bgcZwFx4CjrCeja7gPBNAeswSKluabL49A
	EIFWdPc6ZeYd6atGhNY2jG5EsO8Hv4BqXL4x9dW/CzfZHm6IxTCaQMyuPOyndMKfXMnFwW2Xos4
	meqQLqjP4Tf4R7oQ4nAqdWLlIY0L9OLoW210SoYUe/Y2hXQCMHpJ7dHebRiP4TzofERFGZ06ftE
	EeJ6gq16lCe7DrlZ95SHbtCi5K7cfJ5u/ns6v8hrVS16skottmQhccGSBnqPZYDrpXJURW3WS5M
	rXNVTO3tnTzNgFoka+OwKYKCpkU0ggtDAPR3Z+2cVFU=
X-Google-Smtp-Source: AGHT+IH1exyjMoHRz1ysldhzrKbmVJz0L0S1hsannXM5igtZG80j+Q2La9qIAlWKxckfpTWaJQ/O8A==
X-Received: by 2002:a17:902:cf0e:b0:234:de0a:b36e with SMTP id d9443c01a7336-234de0ab44cmr22223955ad.49.1748443407980;
        Wed, 28 May 2025 07:43:27 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d358f1e2sm12626285ad.140.2025.05.28.07.43.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:43:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/11] libsoup-2.4: Fix CVE-2025-32914
Date: Wed, 28 May 2025 07:43:07 -0700
Message-ID: <8eba970123aca651cbce13e52d43ddaddd76a7cc.1748443238.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748443238.git.steve@sakoman.com>
References: <cover.1748443238.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 14:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217356

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from debian to fix
 CVE-2025-32914

Upstream-Status: Backport [import from debian https://salsa.debian.org/gnome-team/libsoup/-/tree/debian/bullseye/debian/patches?ref_type=heads
Upstream commit https://gitlab.gnome.org/GNOME/libsoup/-/commit/5bfcf8157597f2d327050114fb37ff600004dbcf]

Reference:
https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/450
https://security-tracker.debian.org/tracker/CVE-2025-32914

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32914.patch  | 137 ++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
 2 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
new file mode 100644
index 0000000000..e6d4607b5e
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
@@ -0,0 +1,137 @@
+From: Milan Crha <mcrha@redhat.com>
+Date: Tue, 15 Apr 2025 09:03:00 +0200
+Subject: multipart: Fix read out of buffer bounds under
+ soup_multipart_new_from_message()
+
+This is CVE-2025-32914, special crafted input can cause read out of buffer bounds
+of the body argument.
+
+Closes #436
+
+(cherry picked from commit 5bfcf8157597f2d327050114fb37ff600004dbcf)
+
+Upstream-Status: Backport [import from debian https://salsa.debian.org/gnome-team/libsoup/-/blob/debian/bullseye/debian/patches/CVE-2025-32914.patch?ref_type=heads
+Upstream commit https://gitlab.gnome.org/GNOME/libsoup/-/commit/5bfcf8157597f2d327050114fb37ff600004dbcf]
+CVE: CVE-2025-32914
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-multipart.c |  2 +-
+ tests/multipart-test.c   | 85 ++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 86 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index a7e550f..dd93973 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -181,7 +181,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
+ 			return NULL;
+ 		}
+ 
+-		split = strstr (start, "\r\n\r\n");
++		split = g_strstr_len (start, body_end - start, "\r\n\r\n");
+ 		if (!split || split > end) {
+ 			soup_multipart_free (multipart);
+ 			soup_buffer_free (flattened);
+diff --git a/tests/multipart-test.c b/tests/multipart-test.c
+index 64a5ebf..834b181 100644
+--- a/tests/multipart-test.c
++++ b/tests/multipart-test.c
+@@ -479,6 +479,89 @@ test_multipart (gconstpointer data)
+ 	g_main_loop_unref (loop);
+ }
+ 
++static void
++test_multipart_bounds_good (void)
++{
++	#define TEXT "line1\r\nline2"
++	SoupMultipart *multipart;
++	SoupMessageHeaders *headers, *set_headers = NULL;
++	//GBytes *bytes, *set_bytes = NULL;
++	GBytes *bytes;
++	const char *raw_data = "--123\r\nContent-Type: text/plain;\r\n\r\n" TEXT "\r\n--123--\r\n";
++	gboolean success;
++	SoupMessageBody *body = soup_message_body_new ();
++	SoupBuffer *set_buffer = NULL;
++	gconstpointer data;
++	gsize size;
++
++	headers = soup_message_headers_new (SOUP_MESSAGE_HEADERS_MULTIPART);
++	soup_message_headers_append (headers, "Content-Type", "multipart/mixed; boundary=\"123\"");
++
++	bytes = g_bytes_new (raw_data, strlen (raw_data));
++
++	data = g_bytes_get_data(bytes, NULL);
++	size = g_bytes_get_size(bytes);
++
++	soup_message_body_append(body, SOUP_MEMORY_STATIC, data, size);
++
++	//multipart = soup_multipart_new_from_message (headers, bytes);
++	multipart = soup_multipart_new_from_message (headers, body);
++
++	soup_message_body_free (body);
++
++	g_assert_nonnull (multipart);
++	g_assert_cmpint (soup_multipart_get_length (multipart), ==, 1);
++	success = soup_multipart_get_part (multipart, 0, &set_headers, &set_buffer);
++	g_assert_true (success);
++	g_assert_nonnull (set_headers);
++	//g_assert_nonnull (set_bytes);
++	g_assert_nonnull (set_buffer);
++	//g_assert_cmpint (strlen (TEXT), ==, g_bytes_get_size (set_bytes));
++	g_assert_cmpint (strlen (TEXT), ==, set_buffer->length);
++	g_assert_cmpstr ("text/plain", ==, soup_message_headers_get_content_type (set_headers, NULL));
++	//g_assert_cmpmem (TEXT, strlen (TEXT), g_bytes_get_data (set_bytes, NULL), g_bytes_get_size (set_bytes));
++	g_assert_cmpmem(TEXT, strlen(TEXT), set_buffer->data, set_buffer->length);
++
++	soup_message_headers_free (headers);
++	g_bytes_unref (bytes);
++
++	soup_multipart_free (multipart);
++
++	#undef TEXT
++}
++
++static void
++test_multipart_bounds_bad (void)
++{
++	SoupMultipart *multipart;
++	SoupMessageHeaders *headers;
++	GBytes *bytes;
++	const char *raw_data = "--123\r\nContent-Type: text/plain;\r\nline1\r\nline2\r\n--123--\r\n";
++	SoupMessageBody *body = soup_message_body_new ();
++	gconstpointer data;
++	gsize size;
++
++	headers = soup_message_headers_new (SOUP_MESSAGE_HEADERS_MULTIPART);
++	soup_message_headers_append (headers, "Content-Type", "multipart/mixed; boundary=\"123\"");
++
++	bytes = g_bytes_new (raw_data, strlen (raw_data));
++
++	data = g_bytes_get_data(bytes, NULL);
++	size = g_bytes_get_size(bytes);
++
++	soup_message_body_append(body, SOUP_MEMORY_STATIC, data, size);
++
++	/* it did read out of raw_data/bytes bounds */
++	//multipart = soup_multipart_new_from_message (headers, bytes);
++	multipart = soup_multipart_new_from_message (headers, body);
++	g_assert_null (multipart);
++
++	soup_message_body_free (body);
++
++	soup_message_headers_free (headers);
++	g_bytes_unref (bytes);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -508,6 +591,8 @@ main (int argc, char **argv)
+ 	g_test_add_data_func ("/multipart/sync", GINT_TO_POINTER (SYNC_MULTIPART), test_multipart);
+ 	g_test_add_data_func ("/multipart/async", GINT_TO_POINTER (ASYNC_MULTIPART), test_multipart);
+ 	g_test_add_data_func ("/multipart/async-small-reads", GINT_TO_POINTER (ASYNC_MULTIPART_SMALL_READS), test_multipart);
++	g_test_add_func ("/multipart/bounds-good", test_multipart_bounds_good);
++	g_test_add_func ("/multipart/bounds-bad", test_multipart_bounds_bad);
+ 
+ 	ret = g_test_run ();
+ 
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 509026c4ff..b986e2eea2 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -30,6 +30,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32911_CVE-2025-32913-2.patch \
            file://CVE-2025-32912-1.patch \
            file://CVE-2025-32912-2.patch \
+           file://CVE-2025-32914.patch \
           "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


