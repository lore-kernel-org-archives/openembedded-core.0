Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA10C71153
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 03:44:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1778.1749786251501872878
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 20:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8259073970=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D2WaIX000865
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 20:44:11 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474gq46bdq-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 20:44:10 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 12 Jun 2025 20:44:06 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 12 Jun 2025 20:44:06 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 13/20] libsoup: fix CVE-2025-32907
Date: Fri, 13 Jun 2025 11:43:45 +0800
Message-ID: <20250613034352.175878-14-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613034352.175878-1-changqing.li@windriver.com>
References: <20250613034352.175878-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=684b9e8b cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=_enOPnqeAAAA:8 a=20KFwNOVAAAA:8 a=Hyvt-9qr23Gm4iXa-ggA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-GUID: QejxqMWeifVGNxvkm91-S_6FSO5_GyxY
X-Proofpoint-ORIG-GUID: QejxqMWeifVGNxvkm91-S_6FSO5_GyxY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDAyNiBTYWx0ZWRfX7nWfiAqgqsoU 3yQyJN6ntnkwBPKIIno/mpCAzpDwzxhL3dAUq3ln8BQkAHSMLO+xx/J5H//H4K0HmtF+IKCoXPj T3U3AjbLJ9bXOt5vR2xLJQHevGZIyGNbpZlfD4DSWp3548vmr62NCS/Ii8XOofBXBUGz4emU6Uh
 Gt5f0NO/X/QN75vCTDwKI47WFpTIS541zcl9FQ9i0J1JNp4SY73YWvVIyne7JTVLMBA34mVoutj OYAzgbEWlJ5nGcwKgVwd7q+BU4ShvXXAEDoFT01Snv05EMEouUrhm94u05pJorpygWF0d5T0F4B glqY2xZIi+AM0jUVpqZuXPag2nwl5L/s6bbJVcxEIJ43U/9S/mYNTtbtOohPHf+nFEF2jbGRPvD
 enyRZMcArWTP0RggH6p8JoEZp6EgWKoKZ+1fb9WsH7bWqy7LFbPPHNI9FTGsxjTRDpytstxm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506130026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 03:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218568

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
index 0000000000..f2a56febf5
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32907-1.patch
@@ -0,0 +1,200 @@
+From a10782232017aace7911bf9286081d092c4f7637 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Tue, 15 Apr 2025 12:17:39 +0200
+Subject: [PATCH] soup-message-headers: Correct merge of ranges
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
+index fc3f5e1..047d1fd 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -1213,6 +1213,7 @@ soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
+ 			if (cur->start <= prev->end) {
+ 				prev->end = MAX (prev->end, cur->end);
+ 				g_array_remove_index (array, i);
++				i--;
+ 			}
+ 		}
+ 	}
+diff --git a/tests/meson.build b/tests/meson.build
+index 7851e57..164094e 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -91,6 +91,7 @@ tests = [
+   {'name': 'samesite'},
+   {'name': 'session'},
+   {'name': 'server-auth'},
++  {'name': 'server-mem-limit'},
+   {'name': 'server'},
+   {'name': 'sniffing'},
+   {'name': 'socket'},
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
index 3076437ac4..ccfd69cd23 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -32,6 +32,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32914.patch \
            file://CVE-2025-4476.patch \
            file://CVE-2025-4969.patch \
+           file://CVE-2025-32907-1.patch \
+           file://CVE-2025-32907-2.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.34.1


