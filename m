Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557DCC677C4
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 06:50:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.27948.1749192613988530179
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 23:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8252d755fa=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5564asUC030820
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Jun 2025 06:50:13 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9t4xsg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 06:50:12 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 5 Jun 2025 23:50:12 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 5 Jun 2025 23:50:11 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH V3 07/12] libsoup: fix CVE-2025-46421
Date: Fri, 6 Jun 2025 14:49:58 +0800
Message-ID: <20250606065003.3681416-8-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606065003.3681416-1-changqing.li@windriver.com>
References: <20250606065003.3681416-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ktHPPp0mZWDGzkeQ3tg_foW_SYSPB4Nw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA2MSBTYWx0ZWRfX2C+1mTWeS7gi mtHL2loomHDdCxXu8++iQOXaTpTL5+S4j27mral3mOfYJzQSpbiPUGQed4t/yf04qhcZzsxPjFU FzCymTFV/ApaRlrHuZVhGyvYEEVN8R5BobNfiS9sVoH3UXuly+DOqv8/D5ef7eNiwqO23QLzHJk
 Nje76V6maUZsu8ZUtTS1MJkX2MKaca16glwctWolUVL+Yy6XGXjNY/7urMdoBVRENzReZlBcUuU tJlyGNhetPagqmGF0wOu0jp8Gl1m1DNfISFUvzhjXXCzzSGREMHjG/aUdkJF6wDxLj/jDKB3IcS RjmQTuHIVv8JcaqUEMD01WEIuMMcqyZr8LZZej4zlOQFccLtpFERA+uCvp+zRwycYSt0zm2Ob/y
 4mPUD18783UMBKj8idrHjXRrrQdzCExxieVrl6jquBPbrxkVb7zgLOL2IY1vA6PRsC56aVcz
X-Proofpoint-GUID: ktHPPp0mZWDGzkeQ3tg_foW_SYSPB4Nw
X-Authority-Analysis: v=2.4 cv=Q4DS452a c=1 sm=1 tr=0 ts=68428fa4 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=V2sgnzSHAAAA:8 a=QbgcUSsBnVzo0aMhA2UA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=930
 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 06:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218105

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/439

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup-3.4.4/CVE-2025-46421.patch        | 139 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   1 +
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-46421.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-46421.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-46421.patch
new file mode 100644
index 00000000000..72683d8fce5
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-46421.patch
@@ -0,0 +1,139 @@
+From 85c5227eef7370832044eb918e8a99c0bcbab86f Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Wed, 5 Feb 2025 16:18:10 -0600
+Subject: [PATCH] session: Strip authentication credentails on cross-origin
+ redirect
+
+This should match the behavior of Firefox and Safari but not of Chromium.
+
+CVE: CVE-2025-46421
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/436/diffs?commit_id=3e5c26415811f19e7737238bb23305ffaf96f66b]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-session.c |  6 ++++
+ tests/auth-test.c      | 77 ++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 83 insertions(+)
+
+diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
+index 631bec0..9f00b05 100644
+--- a/libsoup/soup-session.c
++++ b/libsoup/soup-session.c
+@@ -1230,6 +1230,12 @@ soup_session_redirect_message (SoupSession *session,
+ 						   SOUP_ENCODING_NONE);
+ 	}
+ 
++        /* Strip all credentials on cross-origin redirect. */
++        if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) {
++                soup_message_headers_remove_common (soup_message_get_request_headers (msg), SOUP_HEADER_AUTHORIZATION);
++                soup_message_set_auth (msg, NULL);
++        }
++
+         soup_message_set_request_host_from_uri (msg, new_uri);
+ 	soup_message_set_uri (msg, new_uri);
+ 	g_uri_unref (new_uri);
+diff --git a/tests/auth-test.c b/tests/auth-test.c
+index 484097f..7c3b551 100644
+--- a/tests/auth-test.c
++++ b/tests/auth-test.c
+@@ -1,6 +1,7 @@
+ /* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
+ 
+ #include "test-utils.h"
++#include "soup-uri-utils-private.h"
+ 
+ static const char *base_uri;
+ static GMainLoop *loop;
+@@ -1916,6 +1917,81 @@ do_missing_params_test (gconstpointer auth_header)
+ 	soup_test_server_quit_unref (server);
+ }
+ 
++static void
++redirect_server_callback (SoupServer        *server,
++                          SoupServerMessage *msg,
++                          const char        *path,
++                          GHashTable        *query,
++                          gpointer           user_data)
++{
++    static gboolean redirected = FALSE;
++
++    if (!redirected) {
++        char *redirect_uri = g_uri_to_string (user_data);
++        soup_server_message_set_redirect (msg, SOUP_STATUS_MOVED_PERMANENTLY, redirect_uri);
++        g_free (redirect_uri);
++        redirected = TRUE;
++        return;
++    }
++
++    g_assert_not_reached ();
++}
++
++static gboolean
++auth_for_redirect_callback (SoupMessage *msg, SoupAuth *auth, gboolean retrying, gpointer user_data)
++{
++    GUri *known_server_uri = user_data;
++
++    if (!soup_uri_host_equal (known_server_uri, soup_message_get_uri (msg)))
++        return FALSE;
++
++    soup_auth_authenticate (auth, "user", "good-basic");
++
++    return TRUE;
++}
++
++static void
++do_strip_on_crossorigin_redirect (void)
++{
++    SoupSession *session;
++    SoupMessage *msg;
++    SoupServer *server1, *server2;
++    SoupAuthDomain *auth_domain;
++    GUri *uri;
++    gint status;
++
++    server1 = soup_test_server_new (SOUP_TEST_SERVER_IN_THREAD);
++    server2 = soup_test_server_new (SOUP_TEST_SERVER_IN_THREAD);
++
++    /* Both servers have the same credentials. */
++    auth_domain = soup_auth_domain_basic_new ("realm", "auth-test", "auth-callback", server_basic_auth_callback, NULL);
++    soup_auth_domain_add_path (auth_domain, "/");
++    soup_server_add_auth_domain (server1, auth_domain);
++    soup_server_add_auth_domain (server2, auth_domain);
++    g_object_unref (auth_domain);
++
++    /* Server 1 asks for auth, then redirects to Server 2. */
++    soup_server_add_handler (server1, NULL,
++                    redirect_server_callback,
++                   soup_test_server_get_uri (server2, "http", NULL), (GDestroyNotify)g_uri_unref);
++    /* Server 2 requires auth. */
++    soup_server_add_handler (server2, NULL, server_callback, NULL, NULL);
++
++    session = soup_test_session_new (NULL);
++    uri = soup_test_server_get_uri (server1, "http", NULL);
++    msg = soup_message_new_from_uri ("GET", uri);
++    /* The client only sends credentials for the host it knows. */
++    g_signal_connect (msg, "authenticate", G_CALLBACK (auth_for_redirect_callback), uri);
++
++    status = soup_test_session_send_message (session, msg);
++
++    g_assert_cmpint (status, ==, SOUP_STATUS_UNAUTHORIZED);
++
++    g_uri_unref (uri);
++    soup_test_server_quit_unref (server1);
++    soup_test_server_quit_unref (server2);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -1949,6 +2025,7 @@ main (int argc, char **argv)
+ 	g_test_add_func ("/auth/auth-uri", do_auth_uri_test);
+         g_test_add_func ("/auth/cancel-request-on-authenticate", do_cancel_request_on_authenticate);
+         g_test_add_func ("/auth/multiple-algorithms", do_multiple_digest_algorithms);
++        g_test_add_func ("/auth/strip-on-crossorigin-redirect", do_strip_on_crossorigin_redirect);
+         g_test_add_data_func ("/auth/missing-params/realm", "Digest qop=\"auth\"", do_missing_params_test);
+         g_test_add_data_func ("/auth/missing-params/nonce", "Digest realm=\"auth-test\", qop=\"auth,auth-int\", opaque=\"5ccc069c403ebaf9f0171e9517f40e41\"", do_missing_params_test);
+         g_test_add_data_func ("/auth/missing-params/nonce-md5-sess", "Digest realm=\"auth-test\", qop=\"auth,auth-int\", opaque=\"5ccc069c403ebaf9f0171e9517f40e41\" algorithm=\"MD5-sess\"", do_missing_params_test);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 23d44d15725..473a980b1aa 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -41,6 +41,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32051-1.patch \
            file://CVE-2025-32051-2.patch \
            file://CVE-2025-32050.patch \
+           file://CVE-2025-46421.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.34.1


