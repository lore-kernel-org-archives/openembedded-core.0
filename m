Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BA8C61CE8
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 09:21:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7128.1748942472870237235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 02:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8249232b55=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5536YxFv021779
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Jun 2025 09:21:12 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9q0qg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 09:21:11 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 3 Jun 2025 02:21:13 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 3 Jun 2025 02:21:12 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 2/6] libsoup: fix CVE-2025-32907
Date: Tue, 3 Jun 2025 17:21:03 +0800
Message-ID: <20250603092107.4053025-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603092107.4053025-1-changqing.li@windriver.com>
References: <20250603092107.4053025-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: MA6nRd9_DPp2h5EgrYAEsNQvN-rG4DzY
X-Authority-Analysis: v=2.4 cv=X8RSKHTe c=1 sm=1 tr=0 ts=683ebe87 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=Hyvt-9qr23Gm4iXa-ggA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA4MSBTYWx0ZWRfX8mtyW+wA15kU qRt46Ex/4A9vVJR7RFy+a/MujmUs7CminDmahlV1j09ET4aUBpk4RpWwb7sLrZZJO2v06oB9H3I BygFvlylCJsFg5eqTJOOacRU+PqdDNaSjxo3eBaZbULQikTnNgfeS+GzfuWimcnbhsL2q9Fx5Yh
 vrZYJlfm2UyW72kegHfaSi1k3Ymshxtlgq1aHiLeMDxNIY8dpyimGwCuFHYnb8ttPnijO3jhhKR hfFLrx93cEn2DOUacpJMhouLvVKig/WIYya/Xrd3w87bEHaY+izrcYNZldArYEemXo2nM85lLkj f7qUKiGwGTXmSvGj4sKNRcwV5G95yNdBSRRGaF0kA2qot67FzkG0GBZMkyb92mQ9YErEm3RNr4c
 lGMLx6qn2pWyewtPwnKm1STeXPl2/psY86qntPxm04JRhz7cjWomTHCOe7Db2oONTKShKFil
X-Proofpoint-ORIG-GUID: MA6nRd9_DPp2h5EgrYAEsNQvN-rG4DzY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506030081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 09:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217789

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/429

Signed-off-by: Changqing Li <changqing.li@windriver.com>
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
index a3dcd50774..34d0087f87 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -33,6 +33,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4476.patch \
            file://CVE-2025-32908-1.patch \
            file://CVE-2025-32908-2.patch \
+           file://CVE-2025-32907-1.patch \
+           file://CVE-2025-32907-2.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.34.1


