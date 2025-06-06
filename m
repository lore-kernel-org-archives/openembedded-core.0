Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCC4C61CE7
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 16:00:33 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.37087.1749225623581369466
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 09:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=B6ndhyCN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so1800181b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 09:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749225623; x=1749830423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXnbrHhRLh5+J6PxCXiCY2ukDmEGjviSlX4Z6L7k1uI=;
        b=B6ndhyCNpLJKgCTVwWZIGQ4+EjfzXUnq9uB5OiAFjhXy7wfOIjl/5VIhU5j/3awEur
         guZfsffVrspRg0aIWHN46+tjkqBmGRoyznRMfJgEaZy6ZBglNSxxeXo3CstCpWGH4rF3
         NAbeIfevgYH4cO6kWQirV+Fpb0mLxSSH8reoW6SUiy4wM7FAkWBy58XtS+gZRlHXm8jP
         jSUo1jhY3SuKtUz9Iz9AHlXrgdJcM4nqsXU/agh1fxaa3lP2rLn/i82MVreHTqrwJUrg
         4S5Y5UqNlM5UWxcBAJybcxY/kL7kJXPtmq9ah/00oj7VKRdbof9+dVLO1xoYWG+IGHYT
         VSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749225623; x=1749830423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXnbrHhRLh5+J6PxCXiCY2ukDmEGjviSlX4Z6L7k1uI=;
        b=MNtwLsE01wWXq9dDd6F4nRbQuP9tJZTTGcBHiBbhz12SRkVHmz5qX2cNSTeTDOXu/3
         9gZjBfBNZTtKcrPMjqWKMJ5ffQA83+yBOtF33eFuKp5JLwwFDH2QuI4NhLOAzkt0vrCE
         nbxmyAU/eihywegaPFYuNxh32+bJITPyQErQFjZAk/FtJ0KKhJPCopReOdQnPP4ZRNWh
         8wVCrj+T4qKn9M7rhVltQRtWoVnxcqjxiEfJKFI9ZVtBTdCGjq9jYLfHVdzcLwYzUFQi
         QI6HbY/tnROudF/HA2BpD+uyS8DAmn/h17+kgP+y1fIXMplLCfikSN91MdaQXRe9RBln
         hMIQ==
X-Gm-Message-State: AOJu0YytVr6UAAb1vvbSr8Mdai27NaU6Zh9d8U7pM1jM6O0N9MNPnITy
	Ljr7JTZhrwyvfgYJxy0U9uPE4H/sQZYTbl0ygg5XOnhztdV/tAucHuMHunJd97JMxZjL0J0Ezg4
	IGGev
X-Gm-Gg: ASbGncttj62ev/Qb8DCudI1y7vgalUjE4xnA1Ii4m5HCjfXQqHDJBPJhB3WcrijLN00
	No82xPULN4Ak1ShRPP0dgiGwX/3OoLX0n2WM215j2htwtmAcLjlPKSqISLyrhu05+cP/Vy4zb1u
	hMtsAkZVFH+kwBKB/3W04Kp5ifK+fIVo9dB1Oxn0f8ak1yhhbyJhCmCrEpnKRZ6NXDZICyJtCq8
	nZAeiNKlkAEEbKm3uIgyCpVxAXcvJyGEdccFrelnStyaAj+vPScDFAvVjFbfjb1NzBEcBSiQeFz
	Ixn2P5bkC2WP+otTH3ahPnKZUm/e3M6/2y0Rdgk6J4ZvtLZYNWlcs6Y1Mmhb0EO2
X-Google-Smtp-Source: AGHT+IHIqNCGRqbbBDocX75ds8IxqZZOX7VeGQdyGHFbi8/4E4UccYbXI9un/qcLG5CAuewVJO7DAA==
X-Received: by 2002:a05:6a00:8c9:b0:736:4ebd:e5a with SMTP id d2e1a72fcca58-74827f30414mr6062745b3a.20.1749225619756;
        Fri, 06 Jun 2025 09:00:19 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:742a:4153:2a1f:f028])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b083a9bsm1436489b3a.77.2025.06.06.09.00.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:00:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/12] libsoup: fix CVE-2025-32907
Date: Fri,  6 Jun 2025 08:59:55 -0700
Message-ID: <a729b18103081acf17420cf91ec202e86cc6be0d.1749225418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749225417.git.steve@sakoman.com>
References: <cover.1749225417.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 16:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218165

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/429

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-3.4.4/CVE-2025-32907-1.patch      | 200 ++++++++++++++++++
 .../libsoup-3.4.4/CVE-2025-32907-2.patch      |  68 ++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   2 +
 3 files changed, 270 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-1.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-1.patch
new file mode 100644
index 0000000000..41b7d276a4
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-1.patch
@@ -0,0 +1,200 @@
+From 7507b0713c2f02af1cd561ebb99477e0a099419d Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Tue, 15 Apr 2025 12:17:39 +0200
+Subject: [PATCH 1/2] soup-message-headers: Correct merge of ranges
+
+It had been skipping every second range, which generated an array
+of a lot of insane ranges, causing large memory usage by the server.
+
+Closes #428
+
+Part-of: <https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452>
+
+CVE: CVE-2025-32907
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452/commits]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-message-headers.c |   1 +
+ tests/meson.build              |   1 +
+ tests/server-mem-limit-test.c  | 144 +++++++++++++++++++++++++++++++++
+ 3 files changed, 146 insertions(+)
+ create mode 100644 tests/server-mem-limit-test.c
+
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index ee7a3cb..f101d4b 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -1244,6 +1244,7 @@ soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
+ 			if (cur->start <= prev->end) {
+ 				prev->end = MAX (prev->end, cur->end);
+ 				g_array_remove_index (array, i);
++				i--;
+ 			}
+ 		}
+ 	}
+diff --git a/tests/meson.build b/tests/meson.build
+index ee118a0..8e7b51d 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -102,6 +102,7 @@ tests = [
+   {'name': 'samesite'},
+   {'name': 'session'},
+   {'name': 'server-auth'},
++  {'name': 'server-mem-limit'},
+   {'name': 'server'},
+   {'name': 'sniffing',
+     'depends': [test_resources],
+diff --git a/tests/server-mem-limit-test.c b/tests/server-mem-limit-test.c
+new file mode 100644
+index 0000000..98f1c40
+--- /dev/null
++++ b/tests/server-mem-limit-test.c
+@@ -0,0 +1,144 @@
++/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
++/*
++ * Copyright (C) 2025 Red Hat <www.redhat.com>
++ */
++
++#include "test-utils.h"
++
++#include <sys/resource.h>
++
++/*
++ This test limits memory usage to trigger too large buffer allocation crash.
++ As restoring the limits back to what it was does not always work, it's split
++ out of the server-test.c test with copied minimal server code.
++ */
++
++typedef struct {
++	SoupServer *server;
++	GUri *base_uri, *ssl_base_uri;
++	GSList *handlers;
++} ServerData;
++
++static void
++server_setup_nohandler (ServerData *sd, gconstpointer test_data)
++{
++	sd->server = soup_test_server_new (SOUP_TEST_SERVER_IN_THREAD);
++	sd->base_uri = soup_test_server_get_uri (sd->server, "http", NULL);
++	if (tls_available)
++		sd->ssl_base_uri = soup_test_server_get_uri (sd->server, "https", NULL);
++}
++
++static void
++server_add_handler (ServerData         *sd,
++		    const char         *path,
++		    SoupServerCallback  callback,
++		    gpointer            user_data,
++		    GDestroyNotify      destroy)
++{
++	soup_server_add_handler (sd->server, path, callback, user_data, destroy);
++	sd->handlers = g_slist_prepend (sd->handlers, g_strdup (path));
++}
++
++static void
++server_setup (ServerData *sd, gconstpointer test_data)
++{
++	server_setup_nohandler (sd, test_data);
++}
++
++static void
++server_teardown (ServerData *sd, gconstpointer test_data)
++{
++	GSList *iter;
++
++	for (iter = sd->handlers; iter; iter = iter->next)
++		soup_server_remove_handler (sd->server, iter->data);
++	g_slist_free_full (sd->handlers, g_free);
++
++	g_clear_pointer (&sd->server, soup_test_server_quit_unref);
++	g_clear_pointer (&sd->base_uri, g_uri_unref);
++	g_clear_pointer (&sd->ssl_base_uri, g_uri_unref);
++}
++
++static void
++server_file_callback (SoupServer        *server,
++		      SoupServerMessage *msg,
++		      const char        *path,
++		      GHashTable        *query,
++		      gpointer           data)
++{
++	void *mem;
++
++	g_assert_cmpstr (path, ==, "/file");
++	g_assert_cmpstr (soup_server_message_get_method (msg), ==, SOUP_METHOD_GET);
++
++	mem = g_malloc0 (sizeof (char) * 1024 * 1024);
++	/* fedora-scan CI claims a warning about possibly leaked `mem` variable, thus use
++	   the copy and free it explicitly, to workaround the false positive; the g_steal_pointer()
++	   did not help for the malloc-ed memory */
++	soup_server_message_set_response (msg, "application/octet-stream", SOUP_MEMORY_COPY, mem, sizeof (char) * 1024 *1024);
++	soup_server_message_set_status (msg, SOUP_STATUS_OK, NULL);
++	g_free (mem);
++}
++
++static void
++do_ranges_overlaps_test (ServerData *sd, gconstpointer test_data)
++{
++	SoupSession *session;
++	SoupMessage *msg;
++	GString *range;
++	GUri *uri;
++	const char *chunk = ",0,0,0,0,0,0,0,0,0,0,0";
++
++	g_test_bug ("428");
++
++	#ifdef G_OS_WIN32
++	g_test_skip ("Cannot run under windows");
++	return;
++	#endif
++
++	range = g_string_sized_new (99 * 1024);
++	g_string_append (range, "bytes=1024");
++	while (range->len < 99 * 1024)
++		g_string_append (range, chunk);
++
++	session = soup_test_session_new (NULL);
++	server_add_handler (sd, "/file", server_file_callback, NULL, NULL);
++
++	uri = g_uri_parse_relative (sd->base_uri, "/file", SOUP_HTTP_URI_FLAGS, NULL);
++
++	msg = soup_message_new_from_uri ("GET", uri);
++	soup_message_headers_append (soup_message_get_request_headers (msg), "Range", range->str);
++
++	soup_test_session_send_message (session, msg);
++
++	soup_test_assert_message_status (msg, SOUP_STATUS_PARTIAL_CONTENT);
++
++	g_object_unref (msg);
++
++	g_string_free (range, TRUE);
++	g_uri_unref (uri);
++
++	soup_test_session_abort_unref (session);
++}
++
++int
++main (int argc, char **argv)
++{
++	int ret;
++
++	test_init (argc, argv, NULL);
++
++	#ifndef G_OS_WIN32
++	struct rlimit new_rlimit = { 1024 * 1024 * 64, 1024 * 1024 * 64 };
++	/* limit memory usage, to trigger too large memory allocation abort */
++	g_assert_cmpint (setrlimit (RLIMIT_DATA, &new_rlimit), ==, 0);
++	#endif
++
++	g_test_add ("/server-mem/range-overlaps", ServerData, NULL,
++		    server_setup, do_ranges_overlaps_test, server_teardown);
++
++	ret = g_test_run ();
++
++	test_cleanup ();
++	return ret;
++}
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-2.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-2.patch
new file mode 100644
index 0000000000..9c838a55af
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32907-2.patch
@@ -0,0 +1,68 @@
+From f31dfc357ffdd8d18d3593a06cd4acb888eaba70 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Tue, 13 May 2025 14:20:46 +0200
+Subject: [PATCH 2/2] server-mem-limit-test: Limit memory usage only when not
+ built witha sanitizer
+
+A build with -Db_sanitize=address crashes with failed mmap(), which is done
+inside libasan. The test requires 20.0TB of virtual memory when running with
+the sanitizer, which is beyond unsigned integer limits and may not trigger
+the bug anyway.
+
+Part-of: <https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452>
+
+CVE: CVE-2025-32907
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452/commits]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ meson.build                   |  4 ++++
+ tests/server-mem-limit-test.c | 13 +++++++++----
+ 2 files changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index d4110da..74323ea 100644
+--- a/meson.build
++++ b/meson.build
+@@ -357,6 +357,10 @@ configinc = include_directories('.')
+ 
+ prefix = get_option('prefix')
+ 
++if get_option('b_sanitize') != 'none'
++  cdata.set_quoted('B_SANITIZE_OPTION', get_option('b_sanitize'))
++endif
++
+ cdata.set_quoted('PACKAGE_VERSION', soup_version)
+ cdata.set_quoted('LOCALEDIR', join_paths(prefix, get_option('localedir')))
+ cdata.set_quoted('GETTEXT_PACKAGE', libsoup_api_name)
+diff --git a/tests/server-mem-limit-test.c b/tests/server-mem-limit-test.c
+index 98f1c40..65dc875 100644
+--- a/tests/server-mem-limit-test.c
++++ b/tests/server-mem-limit-test.c
+@@ -126,14 +126,19 @@ main (int argc, char **argv)
+ {
+ 	int ret;
+ 
+-	test_init (argc, argv, NULL);
+-
+-	#ifndef G_OS_WIN32
+-	struct rlimit new_rlimit = { 1024 * 1024 * 64, 1024 * 1024 * 64 };
++	/* a build with an address sanitizer may crash on mmap() with the limit,
++	   thus skip the limit set in such case, even it may not necessarily
++	   trigger the bug if it regresses */
++	#if !defined(G_OS_WIN32) && !defined(B_SANITIZE_OPTION)
++	struct rlimit new_rlimit = { 1024UL * 1024UL * 1024UL * 2UL, 1024UL * 1024UL * 1024UL * 2UL };
+ 	/* limit memory usage, to trigger too large memory allocation abort */
+ 	g_assert_cmpint (setrlimit (RLIMIT_DATA, &new_rlimit), ==, 0);
++	#else
++	g_message ("server-mem-limit-test: Running without memory limit");
+ 	#endif
+ 
++	test_init (argc, argv, NULL);
++
+ 	g_test_add ("/server-mem/range-overlaps", ServerData, NULL,
+ 		    server_setup, do_ranges_overlaps_test, server_teardown);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index c19be9b5f4..687b14d9d6 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -34,6 +34,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4969.patch \
            file://CVE-2025-32908-1.patch \
            file://CVE-2025-32908-2.patch \
+           file://CVE-2025-32907-1.patch \
+           file://CVE-2025-32907-2.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.43.0


