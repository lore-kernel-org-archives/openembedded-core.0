Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837FCC5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 09:21:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7127.1748942471304907417
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 02:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8249232b55=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553804cE018223
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Jun 2025 09:21:10 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9q0qfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 09:21:10 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 3 Jun 2025 02:21:12 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 3 Jun 2025 02:21:11 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 1/6] libsoup: fix CVE-2025-32908
Date: Tue, 3 Jun 2025 17:21:02 +0800
Message-ID: <20250603092107.4053025-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Lsmnu544_insm5JG0R_C03Wd4gZTWaIP
X-Authority-Analysis: v=2.4 cv=X8RSKHTe c=1 sm=1 tr=0 ts=683ebe86 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=HSGOHi6-cxt6zTWKGw0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA4MSBTYWx0ZWRfX0RNrcEW6ZoQ6 A2QXhWnAT72fbaI61Iw7dh+4AQ3/0FhuLVcGux33490kLb7IejUIdDBPuutLPToSbZVtMfSTAmK 5MhdSfQXQsf3Uf1/UhJB58tPUL699qSrIelm9i4nthJdVv1fAQGPF4v79rDuvL1P5LB2z7tXIPR
 4RzeiMM7rHbg6hH6OSg+kZHfaS+KbrtlytAdl/o9svKWRYpCBw/zjVic7qYL3IYOji5lKFF3GSo cFJ+At/ll/WR8SsxDXRTq2iEv5PCJwxSxX+BFsWFxdiLRUlhIgTHtJnkrSM8fs35pS5+2jQWy9o Dq8vj/7sD5JJYwfrc3GrAmI/8uAzMokJdGOo+6ngJONk+pibfor+XM2ccv6gbES92a715qvphRK
 gd9Gju8xzsIZaxv5riZoblM64eFYA7tfgRFMNQFGJO5QdvO0OHfmCp0RWgByc4OjTunMKpym
X-Proofpoint-ORIG-GUID: Lsmnu544_insm5JG0R_C03Wd4gZTWaIP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 mlxlogscore=843 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506030081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 09:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217788

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/429

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup-3.4.4/CVE-2025-32908-1.patch      | 89 +++++++++++++++++++
 .../libsoup-3.4.4/CVE-2025-32908-2.patch      | 53 +++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  4 +-
 3 files changed, 145 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32908-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32908-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32908-1.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32908-1.patch
new file mode 100644
index 0000000000..8ad0e16d45
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32908-1.patch
@@ -0,0 +1,89 @@
+From 56b8eb061a02c4e99644d6f1e62e601d0d814beb Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Tue, 15 Apr 2025 09:59:05 +0200
+Subject: [PATCH 1/2] soup-server-http2: Check validity of the constructed
+ connection URI
+
+The HTTP/2 pseudo-headers can contain invalid values, which the GUri rejects
+and returns NULL, but the soup-server did not check the validity and could
+abort the server itself later in the code.
+
+Closes #429
+
+CVE: CVE-2025-32908
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/451/diffs?commit_id=a792b23ab87cacbf4dd9462bf7b675fa678efbae]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ .../http2/soup-server-message-io-http2.c      |  4 +++
+ tests/http2-test.c                            | 28 +++++++++++++++++++
+ 2 files changed, 32 insertions(+)
+
+diff --git a/libsoup/server/http2/soup-server-message-io-http2.c b/libsoup/server/http2/soup-server-message-io-http2.c
+index 943ecfd..f1fe2d5 100644
+--- a/libsoup/server/http2/soup-server-message-io-http2.c
++++ b/libsoup/server/http2/soup-server-message-io-http2.c
+@@ -771,9 +771,13 @@ on_frame_recv_callback (nghttp2_session     *session,
+                 char *uri_string;
+                 GUri *uri;
+ 
++		if (msg_io->scheme == NULL || msg_io->authority == NULL || msg_io->path == NULL)
++			return NGHTTP2_ERR_TEMPORAL_CALLBACK_FAILURE;
+                 uri_string = g_strdup_printf ("%s://%s%s", msg_io->scheme, msg_io->authority, msg_io->path);
+                 uri = g_uri_parse (uri_string, SOUP_HTTP_URI_FLAGS, NULL);
+                 g_free (uri_string);
++		if (uri == NULL)
++			return NGHTTP2_ERR_TEMPORAL_CALLBACK_FAILURE;
+                 soup_server_message_set_uri (msg_io->msg, uri);
+                 g_uri_unref (uri);
+ 
+diff --git a/tests/http2-test.c b/tests/http2-test.c
+index ef097f4..df86d9b 100644
+--- a/tests/http2-test.c
++++ b/tests/http2-test.c
+@@ -1241,6 +1241,30 @@ do_connection_closed_test (Test *test, gconstpointer data)
+         g_uri_unref (uri);
+ }
+ 
++static void
++do_broken_pseudo_header_test (Test *test, gconstpointer data)
++{
++	char *path;
++	SoupMessage *msg;
++	GUri *uri;
++	GBytes *body = NULL;
++	GError *error = NULL;
++
++	uri = g_uri_parse_relative (base_uri, "/ag", SOUP_HTTP_URI_FLAGS, NULL);
++
++	/* an ugly cheat to construct a broken URI, which can be sent from other libs */
++	path = (char *) g_uri_get_path (uri);
++	path[1] = '%';
++
++	msg = soup_message_new_from_uri (SOUP_METHOD_GET, uri);
++	body = soup_test_session_async_send (test->session, msg, NULL, &error);
++	g_assert_error (error, G_IO_ERROR, G_IO_ERROR_PARTIAL_INPUT);
++	g_assert_null (body);
++	g_clear_error (&error);
++	g_object_unref (msg);
++	g_uri_unref (uri);
++}
++
+ static gboolean
+ unpause_message (SoupServerMessage *msg)
+ {
+@@ -1549,6 +1573,10 @@ main (int argc, char **argv)
+                     setup_session,
+                     do_connection_closed_test,
+                     teardown_session);
++        g_test_add ("/http2/broken-pseudo-header", Test, NULL,
++                    setup_session,
++                    do_broken_pseudo_header_test,
++                    teardown_session);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32908-2.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32908-2.patch
new file mode 100644
index 0000000000..b53c7efb7b
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32908-2.patch
@@ -0,0 +1,53 @@
+From aad0dcf22ee9fdfefa6b72055268240cceccfe4c Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Mon, 28 Apr 2025 10:55:42 +0200
+Subject: [PATCH 2/2] soup-server-http2: Correct check of the validity of the
+ constructed connection URI
+
+RFC 5740: the CONNECT has unset the "scheme" and "path", thus allow them unset.
+
+The commit a792b23ab87cacbf4dd9462bf7b675fa678efbae also missed to decrement
+the `io->in_callback` in the early returns.
+
+Related to #429
+
+CVE: CVE-2025-32908
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/453/diffs?commit_id=527428a033df573ef4558ce1106e080fd9ec5c71]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ .../server/http2/soup-server-message-io-http2.c   | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/libsoup/server/http2/soup-server-message-io-http2.c b/libsoup/server/http2/soup-server-message-io-http2.c
+index f1fe2d5..913afb4 100644
+--- a/libsoup/server/http2/soup-server-message-io-http2.c
++++ b/libsoup/server/http2/soup-server-message-io-http2.c
+@@ -771,13 +771,18 @@ on_frame_recv_callback (nghttp2_session     *session,
+                 char *uri_string;
+                 GUri *uri;
+ 
+-		if (msg_io->scheme == NULL || msg_io->authority == NULL || msg_io->path == NULL)
+-			return NGHTTP2_ERR_TEMPORAL_CALLBACK_FAILURE;
+-                uri_string = g_strdup_printf ("%s://%s%s", msg_io->scheme, msg_io->authority, msg_io->path);
++                if (msg_io->authority == NULL) {
++                        io->in_callback--;
++                        return NGHTTP2_ERR_TEMPORAL_CALLBACK_FAILURE;
++                }
++                /* RFC 5740: the CONNECT has unset the "scheme" and "path", but the GUri requires the scheme, thus let it be "(null)" */
++                uri_string = g_strdup_printf ("%s://%s%s", msg_io->scheme, msg_io->authority, msg_io->path == NULL ? "" : msg_io->path);
+                 uri = g_uri_parse (uri_string, SOUP_HTTP_URI_FLAGS, NULL);
+                 g_free (uri_string);
+-		if (uri == NULL)
+-			return NGHTTP2_ERR_TEMPORAL_CALLBACK_FAILURE;
++                if (uri == NULL) {
++                        io->in_callback--;
++                        return NGHTTP2_ERR_TEMPORAL_CALLBACK_FAILURE;
++                }
+                 soup_server_message_set_uri (msg_io->msg, uri);
+                 g_uri_unref (uri);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index d3a0840044..a3dcd50774 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -31,7 +31,9 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-46420.patch \
            file://CVE-2025-32914.patch \
            file://CVE-2025-4476.patch \
-          "
+           file://CVE-2025-32908-1.patch \
+           file://CVE-2025-32908-2.patch \
+"
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
 PROVIDES = "libsoup-3.0"
-- 
2.34.1


