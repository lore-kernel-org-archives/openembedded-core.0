Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070BDC7115D
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 15:02:32 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.27632.1750604544948674306
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 08:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=oAC8OMk3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso3773449b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 08:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750604544; x=1751209344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bhxQ4/xszM9bBSdN1AtVmV3/EAgJxWu/PVDYdh5S6Qk=;
        b=oAC8OMk3YNm0eMeebC4XGyUzQwduAiV2oppNHGTDHUOB1Vf8JOcL82/yZXDDmp2dTw
         X4I89YTda60CoyA6PFlzWLG3zbVGka7sfof7TQkhr2mvRCj0CwuEcNKpMXC9e9ACkalC
         MOP/lgTbSxtQQFPRqR2QCJnQOLwaZqst4+li/9O3B82vhnFPhflNG0w89sVy6MoqPPA7
         On+B9HzJlzve8QezGPDki4UYT6xLtsadGQzwgflAL5XNl7/L1vDTqmsq+BqWyn3RJahB
         sIqN46SkaTZIJm0CKL/8cgbPlZnkGO7Kjjej2+TdPkjxOTCgaJpxO2jf5VEs37OuqyOz
         Py8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750604544; x=1751209344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhxQ4/xszM9bBSdN1AtVmV3/EAgJxWu/PVDYdh5S6Qk=;
        b=Lpxh3l2jgB+f71gNK8+547rFDPQBLN0nX0Ocy5caqvlu/1jg291nVJxaz2Mya2fuWj
         vOxp36eYEPDmF/tsTReVsXtR1f1EJLb6Wx9sfocPougGptvyoBcJIUCkxOvYW2Ua2oYu
         VWkbxN3nWqinTy96RJB1PmyVC/EWFBPGN+hFwJkWurakpbslU2spHHxAzRelI6PDKfMa
         uYtTEYxKZJBnmBs4POGZb8HTUU/9wxDiktt68kyAw/cNdhfvEaIG0LLkYnGzOCRjdLu/
         uvSMNY/pjpHpeTdsAn4O/eNn6cspIX8MeZl1VaYMmnNf6XjOTH+uzD+UpsLL6DvoEygo
         I/sA==
X-Gm-Message-State: AOJu0YyzRMcSt26T671bdTDUyJIUt/n6Q6bKriC+dN9hm1mLSt2mnFXE
	vP1lC1FRqKRll70ydSjTmhwvlNquk0KnxFJ0hfc3lv5cJJdtqX1aqM/sx37/1A+2x6mtexzUZrz
	zxtS2yCI=
X-Gm-Gg: ASbGncuc4TmDhcWKPrs6+pnchU5OfQC1qebUQC+g4DBNVgqwW9mt0QvBZUi2MrFTCJJ
	GDAsNO/QY/ZDN67TtqtTbZxTc1WKooEixNe3uYA4USCRem8Jdqx1XYZ2aTLDfMiPIO8KUKvXQN1
	Gf2V4BfFZP/DSTqBntx3Ehxk/5ikoLy8NJEWIYnV2QMj8He0/HRHjj6uDozCnniHqjFEBV5dGtQ
	I2lE7hS+PsHtqph1rkKlkeryFdivaDd8OCPBAqrUlbS/L+VcKBjvq2O0r343udLzMkx3ZQpVTTW
	HPu60Erz93y4Lm5YZDiLUKnhLwNtzpw36GsUcQSx7c2uy1JmmANBGg==
X-Google-Smtp-Source: AGHT+IGukdH3yoUqipdv8xSFQcK45JSLV8qd6sbg+qTKCv3xGhLeKv+zQ5OOMI3YB3tspPKNpsWHHw==
X-Received: by 2002:a05:6a00:198e:b0:748:2ff7:5e22 with SMTP id d2e1a72fcca58-7490d6bc974mr10716778b3a.10.1750604543915;
        Sun, 22 Jun 2025 08:02:23 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a75:9ad8:d661:8bd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46eb71sm6222521b3a.22.2025.06.22.08.02.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 08:02:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/14] libsoup: fix CVE-2025-32907
Date: Sun, 22 Jun 2025 07:59:58 -0700
Message-ID: <e31c9f12193d040480eca6a4be6a9ec6675b19f8.1750604257.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750604257.git.steve@sakoman.com>
References: <cover.1750604257.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 15:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219182

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/429

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-32907-1.patch    | 200 ++++++++++++++++++
 .../libsoup/libsoup/CVE-2025-32907-2.patch    |  68 ++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |   2 +
 3 files changed, 270 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32907-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32907-1.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32907-1.patch
new file mode 100644
index 0000000000..41b7d276a4
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32907-1.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32907-2.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32907-2.patch
new file mode 100644
index 0000000000..9c838a55af
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32907-2.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index d0cd1f436a..90733a73e8 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -38,6 +38,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-46420.patch \
            file://CVE-2025-4476.patch \
            file://CVE-2025-4969.patch \
+           file://CVE-2025-32907-1.patch \
+           file://CVE-2025-32907-2.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.43.0


