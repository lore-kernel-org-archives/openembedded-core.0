Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B727FC677C4
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:34:49 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.96411.1749584080780082671
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zXnxsQHG;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3127cc662e2so178142a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584080; x=1750188880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCX4aQ7Fp8wmuY9OL4SHc5gYNxpV34FwxydZ7vPYrng=;
        b=zXnxsQHGwZ9fZohDIxMklZ86SU8m+qFY569NrZOOsxZNUlbky956WSTIprMyfJUuJ1
         PJ/3m9t21jdu/G0PPJd2zCkyqCXqYH281Ii7b8XHdeiJDU5XUyfxoPD4/IpPUyDL3WTy
         tGOYgII1K2Oq4FjAStencH26MbYm4m1ISY1zZZ8y8NNvgAkCtdG9pWL0X8xVf1goqmrj
         HNRfz4RBGuNs5ffPR0/hLG2t/vItA6PHEH61pJqP/uBqbdyC6uzbX6c0Q4DSa6wH3duH
         vv+yww/39bGyWDHzAfttbGkWT3Sdzp2K/7G8lI0uDr000AVkuIkx2Czed03Yf0LkwvQl
         HqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584080; x=1750188880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sCX4aQ7Fp8wmuY9OL4SHc5gYNxpV34FwxydZ7vPYrng=;
        b=LECltGzIoqqbXguEVrFyFDSFo9Vqn/aJLVXwq7PVKVkuegt6RDxyueimY5h1WkrscK
         s6Yqh9Q7HcdAK9HI6SS8t4jNnabcHAG/zlrSv9yqmEsBiys6diYKos5htc4IHoX7nuPy
         Aosk90C+w4w8FQg3MxFZO0XhpR8/ENTr/lAbiFBL6NSSLVcRbvZVCuPFxkucceteTIcZ
         agfBXw6VnXZBehDJkbRSrJKsT6eDRBUxR50nVCA4n9+GlG4vX5im2B4jGhTt2YOIApzJ
         Yq9oAl8xlNCtGGlparETXWPy7ZytG1vrpg30F2LL3BhYL4kSxM5tonoIiumR0HBoOxmI
         AnTQ==
X-Gm-Message-State: AOJu0YwpyhNMjWjxfNcdOjyhbzNEDkjKSBulelbvb0lV5cR913hGB0DT
	68sqvN9bNOkQX/BzjG6Ufu8FawsamYuqrRv3ISARit8Zo4g4ksD64ePCf9qHqtZA/53B7VWNvK7
	b8hhz
X-Gm-Gg: ASbGncsVpkKtFvDrrc9CyDTLheas5S9uEWhnBLXtGfEULxvbu6Jauh//cqSmCrevUUO
	eDWoSvRAR/otNVutFz4Zg+wSwjMjyozmaxoVLO8dWtxKeAI8xW9Lzmr/xEWwYhi9I9hqMjXqLqN
	WS9dEehupWT6SKlJ9fvb/yOWnJcG+az7aOrwa9eysj99oaEJjuT+mAeT3eySisDzOdJlK6FRvJA
	NTJ/PQHxFqtYJpwtIDPfMuV2kdTYexHFBcLg3lwnPXiDNYbti6uNGN21ytcylAhuAVC1u6/w/8T
	uPF2P+V70JL6US9Nl7edNpLXoUcCWGSK2texlg2YsAnzl8DIMjMp/g==
X-Google-Smtp-Source: AGHT+IH1cuXaMaEgvS9P2fzXBQNMzqYHHZAybETf3y8UgkcBXD0ljYxBCxuF/dDadmDVqSPLqgXYKA==
X-Received: by 2002:a17:90b:2702:b0:311:a5ab:3d47 with SMTP id 98e67ed59e1d1-313af7e0b2amr828762a91.1.1749584079881;
        Tue, 10 Jun 2025 12:34:39 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b10c7a88sm73897a91.33.2025.06.10.12.34.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:34:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/16] libsoup: fix CVE-2025-4948
Date: Tue, 10 Jun 2025 12:34:04 -0700
Message-ID: <737d50288a37f51f17cf3fef0422e27dbd115cce.1749583904.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749583904.git.steve@sakoman.com>
References: <cover.1749583904.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218414

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/449

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-3.4.4/CVE-2025-4948.patch | 97 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4948.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4948.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4948.patch
new file mode 100644
index 0000000000..07c85f5381
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4948.patch
@@ -0,0 +1,97 @@
+From a23ce8f8e60e79990e26376c8b0d40841aed4b81 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Thu, 15 May 2025 17:49:11 +0200
+Subject: [PATCH] soup-multipart: Verify boundary limits for multipart body
+
+It could happen that the boundary started at a place which resulted into
+a negative number, which in an unsigned integer is a very large value.
+Check the body size is not a negative value before setting it.
+
+Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/449
+
+Part-of: <https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463>
+
+CVE: CVE-2025-4948
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/463/diffs?commit_id=f2f28afe0b3b2b3009ab67d6874457ec6bac70c0]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-multipart.c |  2 +-
+ tests/multipart-test.c   | 40 ++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 41 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index e1c442e..27257e4 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -204,7 +204,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
+ 		 */
+ 		part_body = g_bytes_new_from_bytes (body, // FIXME
+ 						    split - body_data,
+-						    end - 2 - split);
++						    end - 2 >= split ? end - 2 - split : 0);
+ 		g_ptr_array_add (multipart->bodies, part_body);
+ 
+ 		start = end;
+diff --git a/tests/multipart-test.c b/tests/multipart-test.c
+index 84852e2..2ae888c 100644
+--- a/tests/multipart-test.c
++++ b/tests/multipart-test.c
+@@ -548,6 +548,45 @@ test_multipart_bounds_bad_2 (void)
+ 	g_bytes_unref (bytes);
+ }
+ 
++static void
++test_multipart_too_large (void)
++{
++	const char *raw_body =
++		"-------------------\r\n"
++		"-\n"
++		"Cont\"\r\n"
++		"Content-Tynt----e:n\x8erQK\r\n"
++		"Content-Disposition:   name=  form-; name=\"file\"; filename=\"ype:i/  -d; ----\xae\r\n"
++		"Content-Typimag\x01/png--\\\n"
++		"\r\n"
++		"---:\n\r\n"
++		"\r\n"
++		"-------------------------------------\r\n"
++		"---------\r\n"
++		"----------------------";
++	GBytes *body;
++	GHashTable *params;
++	SoupMessageHeaders *headers;
++	SoupMultipart *multipart;
++
++	params = g_hash_table_new (g_str_hash, g_str_equal);
++	g_hash_table_insert (params, (gpointer) "boundary", (gpointer) "-----------------");
++	headers = soup_message_headers_new (SOUP_MESSAGE_HEADERS_MULTIPART);
++	soup_message_headers_set_content_type (headers, "multipart/form-data", params);
++	g_hash_table_unref (params);
++
++	body = g_bytes_new_static (raw_body, strlen (raw_body));
++	multipart = soup_multipart_new_from_message (headers, body);
++	soup_message_headers_unref (headers);
++	g_bytes_unref (body);
++
++	g_assert_nonnull (multipart);
++	g_assert_cmpint (soup_multipart_get_length (multipart), ==, 1);
++	g_assert_true (soup_multipart_get_part (multipart, 0, &headers, &body));
++	g_assert_cmpint (g_bytes_get_size (body), ==, 0);
++	soup_multipart_free (multipart);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -578,6 +617,7 @@ main (int argc, char **argv)
+ 	g_test_add_func ("/multipart/bounds-good", test_multipart_bounds_good);
+ 	g_test_add_func ("/multipart/bounds-bad", test_multipart_bounds_bad);
+ 	g_test_add_func ("/multipart/bounds-bad-2", test_multipart_bounds_bad_2);
++	g_test_add_func ("/multipart/too-large", test_multipart_too_large);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 473a980b1a..9b8bf5b9a2 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -42,6 +42,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32051-2.patch \
            file://CVE-2025-32050.patch \
            file://CVE-2025-46421.patch \
+           file://CVE-2025-4948.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.43.0


