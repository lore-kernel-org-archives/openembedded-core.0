Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E51C5AD49
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 13:36:54 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.7111.1748093810720187787
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 May 2025 06:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wKBLMQlu;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b2c02e79d31so492165a12.2
        for <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 06:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748093810; x=1748698610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cn4d33378y8wGvDEZzKk7+yza31cWMVLsDeO67lHEVo=;
        b=wKBLMQluf/ibzaNorRqp/m60qT6X2FbeYMfgTDqfu+0euQZ8sVufAhnZ+0NUL7bSfS
         YjQDaiC9+HDC0a/iY8vNooFrX27yCR3EEu4SrNQ7i3pF//mQhXWQR35PGRU3/9k4F7vs
         RYuisNCEou6m3eY4n87zvIX/xJ9en5LC/uDq3WXbhCj/tkzk70w6Ih8nTYVnkK5/V0Vx
         xbMMtOpyvQjn3VUWBobR9Cmh/fToc9xlrh7FsI74WwFQ67M3Tlzm2AMAHBbJJWvA37qk
         d9FIFPNeCqyjYAsvnGs2sfeKmAtrz8OwlYmR3R2rGDTPSZdBrBKB68jRZuejgEhVaIzc
         uLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748093810; x=1748698610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cn4d33378y8wGvDEZzKk7+yza31cWMVLsDeO67lHEVo=;
        b=bkHk2drrcxnTt+LDLDI6ZvpmZhUckA8WpZc7oE0PUIQak5bmD6AFgqq4ciDda93Vn9
         Z27Dxdcvznn452N3KJk8aBZ7saAKUJL06aq+J0LGeu07911mV9x4kbH0U4lZHV+LYyQ5
         nvVKm9mJYDUMP87o/dTAdtKKcUenoicXHj6zUGLIYHFj9OGWiJtXU5K7QJq3djHZAk0U
         ydrin7mSBR9C2nzHBp4RSmrnJRNPW+AAb8LdC9cNZJ3LsrkT98jQPETLmZ7n0cQG7yCo
         K0FlDqUuvc328Gbhk8a28XReUmpQhPsMEgzGOo5jndbjJ3kCbvJzzi1aq6MELQ70lVzx
         mWUw==
X-Gm-Message-State: AOJu0Ywlr4aOwkVWeen3nwR50GA/clqBudXWRyaVoN6fvYWD5LviJrMd
	0uaKwFDMVSOUPrUeJ+AAOvnLFFEhe15OO1BUMJfvHzO/pxPmy3rltZqOgXRksaj5ibETwcDkzrW
	mC5bB
X-Gm-Gg: ASbGncsxJnZhki36x5Zqs8gDQmq9h9NBylQVDYFquXQmxS4/fSEhAkmpKgr6A6BqZej
	PJJrZZcRRf+VhvHQRCW2kVfzJ0Oa7PTg6Ipw/9aYJ4z+Cd9X4j419P9Optw7hq63FLuq7ofBxmL
	K9s8Ome+nqKRQC6xa43ZKQOrs3HRGxVytXqIedIz6BEqT+dikFOfuVPhUbwc3jkoGWIE0eY77YF
	veEbAK26xpMN0cp6BKukujdNTvWf1w2NVXL7mtUg+MwljZnU4CWFWKe5CY6uVyoCz3ZNi3XUwsn
	eFCClSFibbdQt7VfC8tbjkJ2tWPaBXrHq3ngRp1ZBog=
X-Google-Smtp-Source: AGHT+IHFm1Sew77sMMsQympJL7Cf7BnxuWhbPIbRGwkBinjdr6njAFDswHLgeCRbfVadlMc72xXAXw==
X-Received: by 2002:a17:903:24a:b0:227:ac2a:1dd6 with SMTP id d9443c01a7336-23414f85208mr58435875ad.24.1748093809900;
        Sat, 24 May 2025 06:36:49 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3157:44bf:9f62:fea8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4f9csm9058913a91.20.2025.05.24.06.36.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 06:36:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/12] libsoup-2.4: Fix CVE-2025-32914
Date: Sat, 24 May 2025 06:36:24 -0700
Message-ID: <8996e178264cf6bf9b69365172f43a5ee8e9f727.1748093626.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748093626.git.steve@sakoman.com>
References: <cover.1748093626.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 13:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217233

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
2.43.0


