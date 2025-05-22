Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B61B8C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 10:00:58 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.20541.1747908055710687319
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 03:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=j3AMsugv;
 spf=pass (domain: mvista.com, ip: 209.85.210.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso7650717b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 03:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1747908054; x=1748512854; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnHt2WnSHV9JEH8hRYQChbvSdFrmDUjk6zbLetl7cnU=;
        b=j3AMsugvfqTDEkz/XOBe2uP6rFFpdYsnspsVbNXVy3Ykdczr4AE3uVL8IfrFTiuisD
         cVUF1/Ol/qggkBEPWiCNDQnUidRZ0nuTAE987QdkDAE257sV4OuJVKFfNjHHZUVIWhZl
         dSxmRx3zT3CrR27QKXJMJGqQI5gD4OrQJ8u+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747908054; x=1748512854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cnHt2WnSHV9JEH8hRYQChbvSdFrmDUjk6zbLetl7cnU=;
        b=wlnOSsDMbZbuBTvyxWJaBSvyWNRWreSwOEf+5CsEZSmN4K4bPjo5FLV6Gy4WVCFJX+
         w7VIe5LhWUCH5I3bYJGgi7naVQBK410U1F9MW9f7jpIRzp7cBHGkiSCkHQrwqIiCbaxS
         kRRdvGBvoUP6fHQ/7kKe/ReO/WlVOLO5KzyyVwu+Qf5KXmwv3XdrC/djFEl5iM0UKmYB
         ZRxuIcEEUlrk8M06KR9KqKLTxJtcreqepIG4DI7nN2R+6Lic1n4GLJ/O9ZHsqouvlPvE
         2cUnhd0sH80z5vpPJh/h0zzifPOiHMNnp2GD2kudBJJJAgiwOPfh4UlmgxN9DVUnzFZc
         FFDQ==
X-Gm-Message-State: AOJu0YziWBf4rKni9sUQxB2foHMalM5z3Nsrwd+Zdmtw5oGMmUGNpVPg
	DnzXANKTdiIXaXW8YR4zmKRX/0zTHhfudd3KSWLqTSS3UnNvWYVCtIjdbdrLR7wqDtJ7Ev8+tCQ
	arwClX5w=
X-Gm-Gg: ASbGncsJCceDMyz0f9Ju5kOc5eSVC1GMFUQtdjeVPUUP0oBTqmwLGsxDPjWifQ/r3g4
	6bxPqD15JV3uyKhuDtA8nqKzJLAcZpANyxx8muMN1bKC63hBUZaI0yv3GajFmvukTztiZOvqv0S
	4izz2TJuFz0LB9nXNJDH4vbGFqyWUBKi0OdDElECXkii9XVGov0rhFJoMBmVZfAP2OwZAN2JnKd
	HNMtyxJbCXwxpxJtfjTPf8LsmCHt3vpIGcl9RJ9Sh4yixIAcsF3hlOzwBTFCaEJdZ4U7DmIKwHl
	fe5xHgt8k1d5+tpxGpN4NyBIa+5ZusEWAzl5QU551SV4IPFrqk16Iq4dHR5vAc0=
X-Google-Smtp-Source: AGHT+IGZSIXFgEbjz+a/5+gEoSNo8oSdjSgLJbcMj8NBSkrEOf5DPmdIv6qWZtzNVtQioCC6SuEs8Q==
X-Received: by 2002:a05:6a00:ae1c:b0:742:b3a6:db10 with SMTP id d2e1a72fcca58-742b3a6dc2bmr27030744b3a.18.1747908053981;
        Thu, 22 May 2025 03:00:53 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982b80asm11001814b3a.116.2025.05.22.03.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 03:00:53 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 4/4] libsoup-2.4: Fix CVE-2025-32914
Date: Thu, 22 May 2025 15:30:28 +0530
Message-Id: <20250522100028.76782-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250522100028.76782-1-vanusuri@mvista.com>
References: <20250522100028.76782-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 10:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217078

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from debian to fix
 CVE-2025-32914

Upstream-Status: Backport [import from debian https://salsa.debian.org/gnome-team/libsoup/-/tree/debian/bullseye/debian/patches?ref_type=heads
Upstream commit https://gitlab.gnome.org/GNOME/libsoup/-/commit/5bfcf8157597f2d327050114fb37ff600004dbcf]

Reference:
https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/450
https://security-tracker.debian.org/tracker/CVE-2025-32914

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32914.patch  | 137 ++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |   1 +
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index 848ea6eb54..46b9e10ac5 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -30,6 +30,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32911_CVE-2025-32913-2.patch \
            file://CVE-2025-32912-1.patch \
            file://CVE-2025-32912-2.patch \
+           file://CVE-2025-32914.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.25.1


