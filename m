Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE5DC2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:53:57 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.7480.1747821231760809302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 02:53:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gldu0D/T;
 spf=pass (domain: mvista.com, ip: 209.85.210.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7426c44e014so6573716b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 02:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1747821231; x=1748426031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HyUPPXtiT4FWfga1mpHaMPGcPN+Fj3mj+A5uunqkpug=;
        b=gldu0D/TXlmIFQPEi3zPbZ55vqY2oMzwULix1y2b8QskhewR5NHr0PjTyRanNcxPjp
         kxoWvXkfSumbyjBR0nBta5+/mfVNhoEhmmZRiXra4hp2lBNp/RjUAGL/9+JDXB1GvHgj
         jxp2PusoqGXKISpheTjKpYZ8oQpMz+6TIC0TY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747821231; x=1748426031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HyUPPXtiT4FWfga1mpHaMPGcPN+Fj3mj+A5uunqkpug=;
        b=RlOL1uHpvpXpbSzNSSIz1MTISBAyW9nUa0+7oRScBpG1RhM+Sex4+npZjkrVPsAMAX
         Dtg4wdUvf+d/vL/9S9Esrqh05Lk6Wr7qql2henM1/7ngkaMhsBiHe0kWK4JYI98kg0n5
         9lffhpFyXvFmA8DFiE+AskGJ9wCLX3acqy2pvQTTnkLcqL4TDivFpZXPLVsMscL8l916
         1VT54CkXPkyM0RAIBWQFPlFFaOinT16yWw90Z1RQItErH9hWvIW6FSrOtuT4oQYfNxnZ
         6OJrzwTunjlJXgQCBslBGIpqd//2XOW5zcAVMz1Vt7EuVc5KFSzqRVJqlddYMPSB7Rkg
         qhsQ==
X-Gm-Message-State: AOJu0YzhU6M+faMqe4xMENYKemntXQYzh6eUEH4/sAHQQ7HEF5++v/hr
	bT+k/K6SNNr+ck6A1gvI55rZCCnYCsj7fIuZO6nXNfZEGOpe4pFDQFSVb/9/mFBDh8mIa0XmWjB
	ZjIUTMlk=
X-Gm-Gg: ASbGncvaYjagXeiNAe67dEHUgJFEnP3MjJQZ/NK0nNEDfPWkuj9R6s/lh6uSFjjlRiw
	WsYS5EVimLbvq6izDBKpK+VaXP53sdQ5pEvp2TGj7R0ox6kSpb8KqpPz3D0nsL3QIQKbvPmt9cE
	tT0U2fOzlQX8ymaWkYE0FASLJtl7/CLRX8CyGxrAMmPQk6VqgXeRT1+VINnOhHUTETMOuy3/y9e
	c5Xa334GB6kL3R1TamY6kwl/ouQl5g2pQ38LYATz4NWm3wOhrH0NQ7T8m25Btq5GUId3OhOOhZ9
	ILUKpwAqM4j8lCabUuK9z+o5GmkqP57PGKLo5/eXLU73lKbzret5fUcoOqfnnrI=
X-Google-Smtp-Source: AGHT+IFVC2fEZ5J+6aMuXpyxNnyN/1BOVqUgE/UnVZGHLb1M1l/InAEvWduu/F1pYVzYaG6OT2giAQ==
X-Received: by 2002:a05:6a00:3985:b0:742:a334:466a with SMTP id d2e1a72fcca58-742a97eb677mr27932502b3a.12.1747821230657;
        Wed, 21 May 2025 02:53:50 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.212.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829cb7sm9241325b3a.111.2025.05.21.02.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 02:53:50 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH 4/4] libsoup-2.4: Fix CVE-2025-32914
Date: Wed, 21 May 2025 15:23:24 +0530
Message-Id: <20250521095324.92028-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521095324.92028-1-vanusuri@mvista.com>
References: <20250521095324.92028-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 09:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217015

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
2.25.1


