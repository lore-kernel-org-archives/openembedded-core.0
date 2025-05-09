Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB2FC3ABCE
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:46:23 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.1938.1746805574104153126
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WkjVXxRE;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30828fc17adso2317027a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746805573; x=1747410373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o27hlFZ76ZiWm2/8ZYZWqJ7qfY9qagoxmAgsAMz+Mco=;
        b=WkjVXxRE5PaBBXgBZCaGck7BnimWQX6/T8Io6rXBBVLoJyOjpjsgLtlOyxuXmiQ3TQ
         yZrCLymFgPPTDClALnK9uteToU33qKpwIuL4SwuLNldYcowCI8xY7AXyO0sJ9A2Hs7pC
         2T40Qdb4EFyWGoKoAcaL8eDzepyYJ/lwlhHcMKtVJb+hP3ZzrmCR6YYBr3WtP9QlOaIy
         epdnHxchwTWGPzYEqQzuIZe3MuaHyBDUNK27TC/YL6w1rpJ1Pl625Wj65D6l1b3w0T7w
         DR9ay3TZ7wCeyVzjc54zf9Gs0BwuYQbtyCqat1u68DhJAIFUmzQDIUFsT62QX4quG/Nf
         W+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805573; x=1747410373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o27hlFZ76ZiWm2/8ZYZWqJ7qfY9qagoxmAgsAMz+Mco=;
        b=u43GvR/C9jAJNxXgRg4Mwvx1mVyTaNEeFXNpxdIMDbrDJ77ICoaJz6XDxNeBgOezPk
         U5nS0muRDKKd6ITPSxihdo1Z7SJP3b81PJ1sqCa0P+32pLjHWG+bFhKvxMQVD0do+Fnq
         NCZFK2g6YqKF6UjPSwALyDiuR/2VE8B6rtmSXlYESa5+taRdJS5hTAxFPNzui1Es+xas
         Pa1GN8/B7FBV8kizHogP9nRpjQ/Hl7M0gC5uW5/vebx0AdJWtguel401TIi5fnlc8u7U
         OIPC/TG02wmWklvvW4/96fIWDkogGLiVZ6ju1oBrAtgQl53OuqgD87d6v5/ZOUbGpn0K
         x4rQ==
X-Gm-Message-State: AOJu0Yyu0jX14IvNm1iRyJawzz1mtiaOGXOyGPBkF+iaqJl7zdBxuij8
	P4yL0B5+ZStYhtBDHywFrDrOzjC0s8LxAe58RMCt5qE7DAh522Kc2JMJ1b3/DRqI3RVxluSYjQz
	p
X-Gm-Gg: ASbGncs/nIaqRD/rlYBtKFrKquYDYuwJ+9HY3r5adx6w0TtOM9BDd4wvwuQPaik7qhv
	sLSNkA3qCAb9Ik4rrjOkaN3QQOpYZ2ZKDXiD7zcUCNa4d11tbF0U8nloFOVNlBlqa7QORg9yZ8+
	DKmZ5vJih9gFfsBZl5cnitoxTJNtCwY/0SOxdQmEfSPlLhkVB2XHNUlQuQgbXgCwQzaZaDa6iPN
	RVbeJvpDCHRD1CkTfyH+yzUL0NmPfBpfznkIR1VbQ9+o9eFtzaf7wvEhyHUf06GwHV5qJ8bDZ2l
	4woSHilRKJG6h67Rh/elIcy2Dv0FSnw0
X-Google-Smtp-Source: AGHT+IHNB8F99IQyhyzWf13Ke+ZYxgQIa2HqVoXcptdTAY9COPTFH++hePFlLg5CgKGkXSEq7XhHZQ==
X-Received: by 2002:a17:90b:554d:b0:301:1d9f:4ba2 with SMTP id 98e67ed59e1d1-30c3d64998emr6292047a91.28.1746805573147;
        Fri, 09 May 2025 08:46:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39dee9aasm1983093a91.25.2025.05.09.08.46.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:46:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 7/8] libsoup: Fix CVE-2025-32914
Date: Fri,  9 May 2025 08:45:54 -0700
Message-ID: <6dd125b619974c8102b3050900781c22c2db4b10.1746805404.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746805404.git.steve@sakoman.com>
References: <cover.1746805404.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:46:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216233

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/5bfcf8157597f2d327050114fb37ff600004dbcf]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-3.4.4/CVE-2025-32914.patch        | 111 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32914.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32914.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32914.patch
new file mode 100644
index 0000000000..0ada9f3134
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32914.patch
@@ -0,0 +1,111 @@
+From 5bfcf8157597f2d327050114fb37ff600004dbcf Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Tue, 15 Apr 2025 09:03:00 +0200
+Subject: [PATCH] multipart: Fix read out of buffer bounds under
+ soup_multipart_new_from_message()
+
+This is CVE-2025-32914, special crafted input can cause read out of buffer bounds
+of the body argument.
+
+Closes #436
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/5bfcf8157597f2d327050114fb37ff600004dbcf]
+CVE: CVE-2025-32914
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-multipart.c |  2 +-
+ tests/multipart-test.c   | 58 ++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 59 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index 2421c91f8..102ce3722 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -173,7 +173,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
+ 			return NULL;
+ 		}
+ 
+-		split = strstr (start, "\r\n\r\n");
++		split = g_strstr_len (start, body_end - start, "\r\n\r\n");
+ 		if (!split || split > end) {
+ 			soup_multipart_free (multipart);
+ 			return NULL;
+diff --git a/tests/multipart-test.c b/tests/multipart-test.c
+index 2c0e7e969..f5b986889 100644
+--- a/tests/multipart-test.c
++++ b/tests/multipart-test.c
+@@ -471,6 +471,62 @@ test_multipart (gconstpointer data)
+ 	loop = NULL;
+ }
+ 
++static void
++test_multipart_bounds_good (void)
++{
++	#define TEXT "line1\r\nline2"
++	SoupMultipart *multipart;
++	SoupMessageHeaders *headers, *set_headers = NULL;
++	GBytes *bytes, *set_bytes = NULL;
++	const char *raw_data = "--123\r\nContent-Type: text/plain;\r\n\r\n" TEXT "\r\n--123--\r\n";
++	gboolean success;
++
++	headers = soup_message_headers_new (SOUP_MESSAGE_HEADERS_MULTIPART);
++	soup_message_headers_append (headers, "Content-Type", "multipart/mixed; boundary=\"123\"");
++
++	bytes = g_bytes_new (raw_data, strlen (raw_data));
++
++	multipart = soup_multipart_new_from_message (headers, bytes);
++
++	g_assert_nonnull (multipart);
++	g_assert_cmpint (soup_multipart_get_length (multipart), ==, 1);
++	success = soup_multipart_get_part (multipart, 0, &set_headers, &set_bytes);
++	g_assert_true (success);
++	g_assert_nonnull (set_headers);
++	g_assert_nonnull (set_bytes);
++	g_assert_cmpint (strlen (TEXT), ==, g_bytes_get_size (set_bytes));
++	g_assert_cmpstr ("text/plain", ==, soup_message_headers_get_content_type (set_headers, NULL));
++	g_assert_cmpmem (TEXT, strlen (TEXT), g_bytes_get_data (set_bytes, NULL), g_bytes_get_size (set_bytes));
++
++	soup_message_headers_unref (headers);
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
++
++	headers = soup_message_headers_new (SOUP_MESSAGE_HEADERS_MULTIPART);
++	soup_message_headers_append (headers, "Content-Type", "multipart/mixed; boundary=\"123\"");
++
++	bytes = g_bytes_new (raw_data, strlen (raw_data));
++
++	/* it did read out of raw_data/bytes bounds */
++	multipart = soup_multipart_new_from_message (headers, bytes);
++	g_assert_null (multipart);
++
++	soup_message_headers_unref (headers);
++	g_bytes_unref (bytes);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -498,6 +554,8 @@ main (int argc, char **argv)
+ 	g_test_add_data_func ("/multipart/sync", GINT_TO_POINTER (SYNC_MULTIPART), test_multipart);
+ 	g_test_add_data_func ("/multipart/async", GINT_TO_POINTER (ASYNC_MULTIPART), test_multipart);
+ 	g_test_add_data_func ("/multipart/async-small-reads", GINT_TO_POINTER (ASYNC_MULTIPART_SMALL_READS), test_multipart);
++	g_test_add_func ("/multipart/bounds-good", test_multipart_bounds_good);
++	g_test_add_func ("/multipart/bounds-bad", test_multipart_bounds_bad);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 63e9afa6fc..8cca980faf 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -29,6 +29,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32906-1.patch \
            file://CVE-2025-32906-2.patch \
            file://CVE-2025-46420.patch \
+           file://CVE-2025-32914.patch \
           "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.43.0


