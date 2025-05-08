Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CECEC3ABC5
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 09:54:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11592.1746698072989644456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 02:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7223240b2b=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484uS60007652
	for <openembedded-core@lists.openembedded.org>; Thu, 8 May 2025 09:54:32 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46d8c15txp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 09:54:31 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 8 May 2025 02:54:30 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 8 May 2025 02:54:29 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] libsoup-2.4: fix build failure
Date: Thu, 8 May 2025 17:54:27 +0800
Message-ID: <20250508095428.4116254-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=NIjV+16g c=1 sm=1 tr=0 ts=681c7f57 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=dt9VzEwgFbYA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=V2sgnzSHAAAA:8 a=y4dstZXFQjHuBTlO5aEA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-GUID: CukA7ePq-oU9gWkWuhWqIyPLh4l0iQL8
X-Proofpoint-ORIG-GUID: CukA7ePq-oU9gWkWuhWqIyPLh4l0iQL8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA4OSBTYWx0ZWRfXwETp79D3zMTX IZWBVV5A8MlygMLFBlYzrWDgyB61aiThrl7xxCYJL+yS84ava8hRzxY0+C67r/nzg1WkQ1AMfL9 Su5DXwURa8m8VeRe7sI+jNoyuqrz8eWbYT1v+URTSd7xdaRHfu18WKsut2UIve+IWhExt4Pmbor
 Q422K/8azAvrEs71cCINtyZWGgpwtA+OsRIr3MLem1zz+qTrACGFpUKjD8vseWe2jghbIBc/t3b elufXPalZDi4umSzegmJ2tJ4C0Ee297hFhQocsSIwtAaO4qd6p7ICkzajlBhQVP9ApKQg6rbnd0 wjULddkMKH/JRXDr+X3rTwxPcZD9YNx+eDPkuDq4tjZ4qJc+/o1uMvBH/fOPe5FIujrd4tAiCfe
 LXwq0CEcEN/zuW3//G7ABffocCrhyYt01/i2EE2ajompWYQCXL/3hqjxGBfjOkXYS22c2/NG
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_03,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505080089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 09:54:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216147

From: Changqing Li <changqing.li@windriver.com>

Backport 2 patches to fix build failures

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...-Fix-possibly-uninitialized-warnings.patch |  43 ++++++
 ...-http-and-https-aliases-support-test.patch | 145 ++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   5 +-
 3 files changed, 192 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uninitialized-warnings.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-https-aliases-support-test.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uninitialized-warnings.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uninitialized-warnings.patch
new file mode 100644
index 0000000000..fcd442c13a
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uninitialized-warnings.patch
@@ -0,0 +1,43 @@
+From 1159686379184a1c899eabb2174258aba5e0fd79 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Mon, 20 Sep 2021 15:41:31 -0500
+Subject: [PATCH] Fix possibly uninitialized warnings
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/fb98e9a8c3062c75357b961543af091de2dd5459]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-websocket-connection.c | 2 +-
+ tests/samesite-test.c               | 3 +++
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
+index 65c1492..585d45c 100644
+--- a/libsoup/soup-websocket-connection.c
++++ b/libsoup/soup-websocket-connection.c
+@@ -471,7 +471,7 @@ send_message (SoupWebsocketConnection *self,
+ 	GByteArray *bytes;
+ 	gsize frame_len;
+ 	guint8 *outer;
+-	guint8 mask_offset;
++	guint8 mask_offset = 0;
+ 	GBytes *filtered_bytes;
+ 	GList *l;
+ 	GError *error = NULL;
+diff --git a/tests/samesite-test.c b/tests/samesite-test.c
+index 0b081b2..60c9b8e 100644
+--- a/tests/samesite-test.c
++++ b/tests/samesite-test.c
+@@ -60,6 +60,9 @@ assert_highest_policy_visible (GSList *cookies, SoupSameSitePolicy policy)
+ 	case SOUP_SAME_SITE_POLICY_NONE:
+ 		expected_count = 1;
+ 		break;
++	default:
++		g_assert_not_reached ();
++		break;
+ 	}
+ 
+ 	g_assert_cmpuint (size, ==, expected_count);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-https-aliases-support-test.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-https-aliases-support-test.patch
new file mode 100644
index 0000000000..0d4139ec08
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-https-aliases-support-test.patch
@@ -0,0 +1,145 @@
+From 0e3bfa22b23451531caf8cc30b1771ac6a41fcad Mon Sep 17 00:00:00 2001
+From: Carlos Garcia Campos <cgarcia@igalia.com>
+Date: Thu, 11 Feb 2021 10:47:09 +0100
+Subject: [PATCH] Remove http and https aliases support test
+
+Upstream has removed the whole function of http and https aliases
+support, this commit partially cherry pick it, only remove the test to
+mute the warning:
+| ../libsoup-2.74.3/tests/server-test.c: In function 'do_one_server_aliases_test':
+| ../libsoup-2.74.3/tests/server-test.c:180:17: warning: 'g_socket_client_set_tls_validation_flags' is deprecated [-Wdeprecated-declarations]
+|   180 |                 g_socket_client_set_tls_validation_flags (client, 0);
+|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/111ae4ebe7cc2e389573cff5b9ac76509d6cbac0]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/server-test.c | 104 --------------------------------------------
+ 1 file changed, 104 deletions(-)
+
+diff --git a/tests/server-test.c b/tests/server-test.c
+index 8976103..cb7e815 100644
+--- a/tests/server-test.c
++++ b/tests/server-test.c
+@@ -154,108 +154,6 @@ do_star_test (ServerData *sd, gconstpointer test_data)
+ 	soup_uri_free (star_uri);
+ }
+ 
+-static void
+-do_one_server_aliases_test (SoupURI    *uri,
+-			    const char *alias,
+-			    gboolean    succeed)
+-{
+-	GSocketClient *client;
+-	GSocketConnectable *addr;
+-	GSocketConnection *conn;
+-	GInputStream *in;
+-	GOutputStream *out;
+-	GError *error = NULL;
+-	GString *req;
+-	static char buf[1024];
+-
+-	debug_printf (1, "  %s via %s\n", alias, uri->scheme);
+-
+-	/* There's no way to make libsoup's client side send an absolute
+-	 * URI (to a non-proxy server), so we have to fake this.
+-	 */
+-
+-	client = g_socket_client_new ();
+-	if (uri->scheme == SOUP_URI_SCHEME_HTTPS) {
+-		g_socket_client_set_tls (client, TRUE);
+-		g_socket_client_set_tls_validation_flags (client, 0);
+-	}
+-	addr = g_network_address_new (uri->host, uri->port);
+-
+-	conn = g_socket_client_connect (client, addr, NULL, &error);
+-	g_object_unref (addr);
+-	g_object_unref (client);
+-	if (!conn) {
+-		g_assert_no_error (error);
+-		g_error_free (error);
+-		return;
+-	}
+-
+-	in = g_io_stream_get_input_stream (G_IO_STREAM (conn));
+-	out = g_io_stream_get_output_stream (G_IO_STREAM (conn));
+-
+-	req = g_string_new (NULL);
+-	g_string_append_printf (req, "GET %s://%s:%d HTTP/1.1\r\n",
+-				alias, uri->host, uri->port);
+-	g_string_append_printf (req, "Host: %s:%d\r\n",
+-				uri->host, uri->port);
+-	g_string_append (req, "Connection: close\r\n\r\n");
+-
+-	if (!g_output_stream_write_all (out, req->str, req->len, NULL, NULL, &error)) {
+-		g_assert_no_error (error);
+-		g_error_free (error);
+-		g_object_unref (conn);
+-		g_string_free (req, TRUE);
+-		return;
+-	}
+-	g_string_free (req, TRUE);
+-
+-	if (!g_input_stream_read_all (in, buf, sizeof (buf), NULL, NULL, &error)) {
+-		g_assert_no_error (error);
+-		g_error_free (error);
+-		g_object_unref (conn);
+-		return;
+-	}
+-
+-	if (succeed)
+-		g_assert_true (g_str_has_prefix (buf, "HTTP/1.1 200 "));
+-	else
+-		g_assert_true (g_str_has_prefix (buf, "HTTP/1.1 400 "));
+-
+-	g_io_stream_close (G_IO_STREAM (conn), NULL, NULL);
+-	g_object_unref (conn);
+-}
+-
+-static void
+-do_server_aliases_test (ServerData *sd, gconstpointer test_data)
+-{
+-	char *http_aliases[] = { "dav", NULL };
+-	char *https_aliases[] = { "davs", NULL };
+-	char *http_good[] = { "http", "dav", NULL };
+-	char *http_bad[] = { "https", "davs", "fred", NULL };
+-	char *https_good[] = { "https", "davs", NULL };
+-	char *https_bad[] = { "http", "dav", "fred", NULL };
+-	int i;
+-
+-	g_test_bug ("703694");
+-
+-	g_object_set (G_OBJECT (sd->server),
+-		      SOUP_SERVER_HTTP_ALIASES, http_aliases,
+-		      SOUP_SERVER_HTTPS_ALIASES, https_aliases,
+-		      NULL);
+-
+-	for (i = 0; http_good[i]; i++)
+-		do_one_server_aliases_test (sd->base_uri, http_good[i], TRUE);
+-	for (i = 0; http_bad[i]; i++)
+-		do_one_server_aliases_test (sd->base_uri, http_bad[i], FALSE);
+-
+-	if (tls_available) {
+-		for (i = 0; https_good[i]; i++)
+-			do_one_server_aliases_test (sd->ssl_base_uri, https_good[i], TRUE);
+-		for (i = 0; https_bad[i]; i++)
+-			do_one_server_aliases_test (sd->ssl_base_uri, https_bad[i], FALSE);
+-	}
+-}
+-
+ static void
+ do_dot_dot_test (ServerData *sd, gconstpointer test_data)
+ {
+@@ -1382,8 +1280,6 @@ main (int argc, char **argv)
+ 
+ 	g_test_add ("/server/OPTIONS *", ServerData, NULL,
+ 		    server_setup, do_star_test, server_teardown);
+-	g_test_add ("/server/aliases", ServerData, NULL,
+-		    server_setup, do_server_aliases_test, server_teardown);
+ 	g_test_add ("/server/..-in-path", ServerData, NULL,
+ 		    server_setup, do_dot_dot_test, server_teardown);
+ 	g_test_add ("/server/ipv6", ServerData, NULL,
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 25e0d7dcbc..5753ab2745 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -13,7 +13,10 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch \
-           file://0001-CVE-2025-32911.patch"
+           file://0001-CVE-2025-32911.patch \
+           file://0001-Fix-possibly-uninitialized-warnings.patch \
+           file://0001-Remove-http-and-https-aliases-support-test.patch"
+
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
 CVE_PRODUCT = "libsoup"
-- 
2.34.1


