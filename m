Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E7BC71131
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:38 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.91296.1749571771427490042
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ppgO8x28;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-235e1d710d8so69460445ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571771; x=1750176571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/NWhtedr2ui5juI9R4moO5S9IXnbZWo8PnQCgSnTAU=;
        b=ppgO8x28K4cMYWgg+/0P28jeDzRQZl7lfnliCTR4AwII9UvH2y7ngk4maeq558RL3A
         r8no8ncy0AVLLsBt8qOe4+9n9fTC5AVL43u5Z6OQjCPAwdsGPKDVliJzUsewJ/46KLt+
         Tzwfr5TG0yMZXQcciEabxzUvsxbx++KFRaY5wgUkxP7J5KyhI4L2C3uuWv5KDLSItSIY
         PPwPoe44wEwSr//pRTCFOMjubdMQglBnuwuv51tzxR1xNnmJFj7gJhaf1vlDgtOiIxuF
         thUwLGOz77DMORco/KnMRGCJBNIbp25gcBfWGwM5lgoOoRtr1aQ2heYYBA844UQZX4p1
         Ogbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571771; x=1750176571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/NWhtedr2ui5juI9R4moO5S9IXnbZWo8PnQCgSnTAU=;
        b=MUeXPRy+QzzUnhQoTVK5xt0NApeoQxx5WIb+sWhnKaC5JLleHHA8M23jMmWqoqsSXb
         37PTq5Mptb4Q5p2kLQdi6Eo79HA4wsuLx1QqJdArXYNxIdINCiynPMwMeBkxJCSgbHGa
         1kGYDIrczSHDwX7mPAnaI8gfWl1LuHvoCc4H0ebV4iLj/Tpacu1ukYe1CtvQmIf+JRru
         42CZDI+xKCPe0SIycerfficGCQdNQMx/X6VSESAnH5HPv7XEk9agyXGHziqt7y3dOAuR
         i6n/xgnso3IdkhF3MRGBZQoIcTVIfKO3OP+Qx2h3qCbjDz/y6fCB6pVLDxE/rkyA5tCC
         KBGw==
X-Gm-Message-State: AOJu0YzU7cdKu6nbElDUSzNWcWhZ6X50WnSKSZmllNk+FVWuK8new5tI
	cKITJSHB87x6eFUOTzBzbxG1ToEfnoVofkJj1RncVi7bWcoqiGkvqzjpJUBTAWnELGiqdNJur/+
	3cMM/
X-Gm-Gg: ASbGncvVIOpbEcF3UASzb0vUvzFP6hmNJHjn1/iGT03fgnZ3tVeeZku+SCMQLa9U5m0
	9RGMagvmL/wjQamfeceB9X3MBClf88GKEp7w2eZCOktNpX9/a03K7Q17jfIph6po9J0jP2S/DNc
	Dj1CMdlumKipgwp5GgdieuZ5mtOrBKlrQsUb06w+extuUi+9Y6u2+U3Ithr7tTcumI2+LT+xiUn
	yaijlTD+/Yw+UYyWNAvIesuXVQbNoVbJ/W2d8O/4tCBzL73ZvPnQJriCsZtUofuUlkLpxSPSUO2
	jR5LhNHNjtmzGySCKJResR/etGqGgMRcRXulQEdRYuNbPRmcw4LGOw==
X-Google-Smtp-Source: AGHT+IHCoo7oo3/2OJwCqxFQ26+318iSkC2qdFCYiOPY0pJZK+uh7Ovvwu5XRDz2qf22FlKQgpcwLg==
X-Received: by 2002:a17:903:fb0:b0:234:e8db:432d with SMTP id d9443c01a7336-23640d22976mr5390135ad.39.1749571770692;
        Tue, 10 Jun 2025 09:09:30 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 24/32] libsoup: fix CVE-2025-4948
Date: Tue, 10 Jun 2025 09:08:37 -0700
Message-ID: <c6a014352ae480d90b84ca26653654814a7bda52.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218393

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/449

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-4948.patch       | 97 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.6.5.bb |  4 +-
 2 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch
new file mode 100644
index 0000000000..e0e7b7a44f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-4948.patch
@@ -0,0 +1,97 @@
+From 0076a5ef3f2a3d11805438e7fd90775f8c40569e Mon Sep 17 00:00:00 2001
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
+index 102ce37..a587fe7 100644
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
+index f5b9868..92b673e 100644
+--- a/tests/multipart-test.c
++++ b/tests/multipart-test.c
+@@ -527,6 +527,45 @@ test_multipart_bounds_bad (void)
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
+@@ -556,6 +595,7 @@ main (int argc, char **argv)
+ 	g_test_add_data_func ("/multipart/async-small-reads", GINT_TO_POINTER (ASYNC_MULTIPART_SMALL_READS), test_multipart);
+ 	g_test_add_func ("/multipart/bounds-good", test_multipart_bounds_good);
+ 	g_test_add_func ("/multipart/bounds-bad", test_multipart_bounds_bad);
++	g_test_add_func ("/multipart/too-large", test_multipart_too_large);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.6.5.bb b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
index a8c0546677..772e21e09b 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.5.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
@@ -17,7 +17,9 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32907-1.patch \
            file://CVE-2025-32907-2.patch \
            file://CVE-2025-32908-1.patch \
-           file://CVE-2025-32908-2.patch"
+           file://CVE-2025-32908-2.patch \
+           file://CVE-2025-4948.patch \
+"
 SRC_URI[sha256sum] = "6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234"
 
 PROVIDES = "libsoup-3.0"
-- 
2.43.0


