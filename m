Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50309C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:38 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.91295.1749571768766793676
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3Wqziu40;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-235a3dd4f0dso39154315ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571768; x=1750176568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuLpLpkuw2tvTmp3ZciH1Kw+Drrs4lUluF2gpcGvh7w=;
        b=3Wqziu40BX8OI3UP3wg1ZTQlzKqo9wtkBfiUoRV4VIoWKgAn5yJwXh6wQ81Jeq19+C
         L/LWYZ89b0wE+V5+0X/hvautFTCKO7r6fssXueHYdKTbymOK1qOwyHar4ZZLqUDBpaW5
         CsNc++QAtYDx4g0/Y4MpLL4AbO+Da8xEFhOz5DsN1AMRi8fxQFnowp+GVZny/4qlShSz
         dJYThCs2Ceky0mrQg/SP5mOk51nppNGL6jdcXG9ThGVBODTGxrQbWBTSiWRtOMVlUrml
         pEeeYEBWdoqLKtpqpYLub1UshKmOfv+RX0UijZBrjYUcX1y/cqfF3OwYFchwEV4g60cm
         gj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571768; x=1750176568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iuLpLpkuw2tvTmp3ZciH1Kw+Drrs4lUluF2gpcGvh7w=;
        b=EKzzzg1SW5bpBVCo7mhVDsYePQySukKks2AIifh8pYuZ9rHD/BuI/pzaaptRTh7lbH
         zjihT8JVWPnuPhn55IR/XuPHX8awIQ6ocB51tReHJIibEXHuR5jAEJ1+qhVe3pHIemRN
         PJvu+oSinvPCxgMZ1OSKLDImS4FLgfUZbS3iDklAHfwHLlUUTfyEz63RONtozNra7RUB
         gmtPXQNPrvC0iK/vbpFmLiIaSI/6gT/lQnImgcTnBM3A02RgMdF/BkfEPCfzf3l/lIT3
         cW25BHjkQgjdjj5QMGk3eJWPdwwkFpoJNo0H2XkC9B8pdjTyHjhUVIiRnwYL9U7Dqwel
         x+vg==
X-Gm-Message-State: AOJu0YwpLIaE8JM0ey3V6AeYPmArxUOIShMh+yhQFemYgsZU8mjqfBFu
	sotCg8fVc4yCVoxcEQo5JHnu3Vfj3skrqd6licRsRYpcbgv/cC/DgygZ+fVTnmn4fpn9UBaRbCY
	V/g9Y
X-Gm-Gg: ASbGncvvz8owqzryUZXW3bDnGeXxYXaCX5zXRsJka4vpKzw825MMZLwv/Ws2eubr1sX
	U3sB1z64/jDeAmvrzTV3ZEsR2dj/fv/rggX0VSYNGBE4rxmY4qQH0Ylj/LFckJv4uVhz/o5VjoL
	VCj8Z9AkLAohGyhdVvznxAwoABni9JtfSqv1zM4MHrgbjkQp5dEJdkNyhAtchO1/HYPmmhFUn88
	6fWMwX8E0Z2iKFvo8T9U1BVjabGpW4sDvHrHIuiVztJkqFnx4mvzbjILJgHE9lzNPqxq/MwRt1H
	PlxFloVJ8Ij/IXSmC0cTl7GYIWXf1D65BQg50myiy9wW85XA8XiS8w==
X-Google-Smtp-Source: AGHT+IHsfCFugYGBYanglV5ctkQx2iRpobCIJp30fs3VAK7YutLC6J0pLBC0r64GwpN19SeHqUPnxA==
X-Received: by 2002:a17:903:19c6:b0:231:9902:1519 with SMTP id d9443c01a7336-23640cf0948mr6030535ad.39.1749571767687;
        Tue, 10 Jun 2025 09:09:27 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 22/32] libsoup: fix CVE-2025-32907
Date: Tue, 10 Jun 2025 09:08:35 -0700
Message-ID: <fd541857dddeb8cf1da03c50a1087b65deb728ed.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218391

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/429

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-32907-1.patch    | 200 ++++++++++++++++++
 .../libsoup/libsoup/CVE-2025-32907-2.patch    |  68 ++++++
 meta/recipes-support/libsoup/libsoup_3.6.5.bb |   4 +-
 3 files changed, 271 insertions(+), 1 deletion(-)
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.6.5.bb b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
index 2bed009e0a..3cd4342bd4 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.5.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
@@ -13,7 +13,9 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32914.patch \
-           file://CVE-2025-4476.patch"
+           file://CVE-2025-4476.patch \
+           file://CVE-2025-32907-1.patch \
+           file://CVE-2025-32907-2.patch"
 SRC_URI[sha256sum] = "6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234"
 
 PROVIDES = "libsoup-3.0"
-- 
2.43.0


