Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBE5C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:28 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.90704.1749571765634621497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GJt04poh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2353a2bc210so49232205ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571765; x=1750176565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxhnCTXfGyGeMr9FOCqVtabOlvCxnqhzGzPbUzmBc1g=;
        b=GJt04pohMuBomdIBdlhczw/TuumaTMSPw3VAWv29ES7k1XeTAPRzPxRrs41TUMTWe2
         Mr3st49SEo76DQdOtQKwnLWAZpJDiM/N24oZXKLWpBDmTn3iOJJIHfu/bKTnLPG2Evll
         +5i68BOneIq6gwgzVVmNq2xuMDXchLBET2mqPu98qhaBR1NmwnNK0Cm+vMOMupDgcwAU
         ycor8iXWwedjSbwJH1g1CNT9ZoW1FTd6ANqJRyOj8O6QY9aJMb2Q4FZHm1WlqekC7uMK
         PHy0XmQKFeykt0W4dWCUlgToAvSDo5OeWo9Y4g/tyT1V3Kxrkv3lDR7+yIJGkSKLZRMS
         C4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571765; x=1750176565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxhnCTXfGyGeMr9FOCqVtabOlvCxnqhzGzPbUzmBc1g=;
        b=MGStH7l2P1Ec0MmwJjnchj5w+KbXSOSGNxLG8tJTiAWnrhcgYwDOoXqHY1g5rs+jgJ
         u/0waYD8WNF0NDOS/sr5+9awRJdpTmLXfDWGvzua/p8Rf3aV06c6HflcYjEXYsqf+S6x
         X9DDFzpK4SpXXiNWpXWXal8vbFv0SySSpzH582HbDO24Q9Lze4YWs4Ad2AgHNYW+5Jfn
         hmM5Ii80v5vXpjdlcY2jklGM6fCzgH1TZcphAktMAf5YdF5dmHgXEyeHAlab1zX23LSu
         OHZLqXU0g18919z7rGB2WZIVMe+z+GwdjAQs2+PSRoDjTZfh5WF5lDm7G+cYU8ePq/5V
         VDJw==
X-Gm-Message-State: AOJu0YyqjB9fN3ySONRgCOkoKdECVzO8JIketvw+srASyZEyGiPHx8+F
	x+A8z4y3z5lh5/oIX8YmFPqxKCK4tC6UcmwhnnOy6iKF3AUr9sMKrQGJsVCnvgayfywwJBC/Dal
	JX0Xw
X-Gm-Gg: ASbGncvHRlk+KZhkKdHbXhTpOkzRjxV466nB4oRUpnkwWCgt+WgLNocRgVoBWwMF1R/
	hlW+sLiV5OxtS+UtGDsbZRiHLT3I4Ms7lUzwCSV261pHYf1z4Ggg1JPKHEXcQSzeLU4efcouQ9W
	8/kuUIY5gyaCtCnpaTtpc+2KX/vFwyrxWGPrHipJ2XcYNBsD6urhYyoiIL4v96Buo6Kt08fhiG0
	AjXk5oDbNmz3fZdeW9WIQX1D6w1699IiTzQwKdCXQT2W6+UmsyoAaUoElqolfod4T5utrxUZEYV
	1PKvsfAOgKp1nx3a9zWkqLriAfRH5CNLDE5dJ/o9okt23a9XdWRbcA==
X-Google-Smtp-Source: AGHT+IE5uo9/pkN3WF9SM948OZcxq/FikltIEJr4NQqK5Ap0Y4KyT9+Xf67U5SfeqExVtE7Ss1TWRQ==
X-Received: by 2002:a17:902:f651:b0:235:225d:30a2 with SMTP id d9443c01a7336-23601dc467dmr263818305ad.48.1749571764644;
        Tue, 10 Jun 2025 09:09:24 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 20/32] libsoup: fix CVE-2025-32914
Date: Tue, 10 Jun 2025 09:08:33 -0700
Message-ID: <323ee2ba9008eb1bdcd1082ca2a8952e30a8e333.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218389

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/436

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-32914.patch      | 112 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.6.5.bb |   3 +-
 2 files changed, 114 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32914.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32914.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32914.patch
new file mode 100644
index 0000000000..c899347ebf
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32914.patch
@@ -0,0 +1,112 @@
+From 020d19f22b7e55f44febd17e237982665323e0bc Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2025-32914
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/450/diffs?commit_id=5bfcf8157597f2d327050114fb37ff600004dbcf]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-multipart.c |  2 +-
+ tests/multipart-test.c   | 58 ++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 59 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index 2421c91..102ce37 100644
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
+index 2c0e7e9..f5b9868 100644
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
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.6.5.bb b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
index fbe9a79b0f..2faf50c223 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.5.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
@@ -11,7 +11,8 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
+           file://CVE-2025-32914.patch"
 SRC_URI[sha256sum] = "6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234"
 
 PROVIDES = "libsoup-3.0"
-- 
2.43.0


