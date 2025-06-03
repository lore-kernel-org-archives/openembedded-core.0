Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871C8C5B559
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 09:21:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7025.1748942475648014266
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 02:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8249232b55=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5537igCe013092
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Jun 2025 09:21:14 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9t0q2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 09:21:14 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 3 Jun 2025 02:21:16 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 3 Jun 2025 02:21:15 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 4/6] libsoup-2.4: fix do_compile failure
Date: Tue, 3 Jun 2025 17:21:05 +0800
Message-ID: <20250603092107.4053025-4-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250603092107.4053025-1-changqing.li@windriver.com>
References: <20250603092107.4053025-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: qCE2PEjUfe5UPccDHYxQdfvztv5pCADY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA4MSBTYWx0ZWRfX2Q04Kk3EyJiI AHhP1qsovR3pC6dWj5prgcqGHc4QWQzER7RBCqHyWQaWfbbHPcsFAnlw8KfjgoI9oziVt6t3Lrs zVUO4hZaEL+XEw9EVCjWsAmT9QcKRxIXQMH3Mz8FP1oLRs5PqjR2gFujnXhziNFoWlwirFHr5PI
 G+QNJeI0fd8eYXkCV83rIIlwlpUBeQWfdpbvFVwqtuB1iDll+3/GnIV8VmzcPR08HiJSI5vqOv+ 3KSe8MeHubv648ypjh2Mqm7pcdrVfL5JemUXdHmUC7QpHTBRCWo20HJpB1B+qJkTMYvdwQ+b70h nouTbd1Cbu1qpzZ95j0hveCoTcsIfKGFQj4zBUkUXtY/gvvVbyM2lp2/j9LNpGEd4gd0kzAaeqC
 hkxkKfI8d8PwwhJWco8UZ+fr1eLUzpn1Uxko4/iT4ZEISuD0ET/KW33q2nlTn1g7h5m2XN/F
X-Proofpoint-GUID: qCE2PEjUfe5UPccDHYxQdfvztv5pCADY
X-Authority-Analysis: v=2.4 cv=Q4DS452a c=1 sm=1 tr=0 ts=683ebe8a cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=xNf9USuDAAAA:8 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=fk1lIlRQAAAA:8 a=e0ImQPtS3JqyD32b5XIA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=U75ogvRika4pmaD_UPO0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=851
 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506030081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 09:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217791

From: Changqing Li <changqing.li@windriver.com>

Remove test code for fixing do_compile failure:
../libsoup-2.74.3/tests/auth-test.c:1554:39: error: unknown type name 'SoupServerMessage'; did you mean 'SoupServerClass'?
 1554 |                                       SoupServerMessage *msg,
      |

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup-2.4/CVE-2025-32910-1.patch        | 79 +++----------------
 .../libsoup-2.4/CVE-2025-32910-2.patch        | 60 +++-----------
 .../libsoup-2.4/CVE-2025-32912-1.patch        | 20 ++---
 3 files changed, 24 insertions(+), 135 deletions(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
index de4faf5380..847c76c2b7 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
@@ -8,10 +8,17 @@ Upstream-Status: Backport [import from debian https://salsa.debian.org/gnome-tea
 Upstream commit https://gitlab.gnome.org/GNOME/libsoup/-/commit/e40df6d48a1cbab56f5d15016cc861a503423cfe]
 CVE: CVE-2025-32910
 Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+
+Remove test code for fixing do_compile failure of libsoup-2.4, test codes include
+new type added in 3.x version
+../libsoup-2.74.3/tests/auth-test.c:1554:39: error: unknown type name 'SoupServerMessage'; did you mean 'SoupServerClass'?
+ 1554 |                                       SoupServerMessage *msg,
+      |                                       ^~~~~~~~~~~~~~~~~
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  libsoup/soup-auth-digest.c |  3 +++
- tests/auth-test.c          | 50 ++++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 53 insertions(+)
+ 1 files changed, 3 insertions(+)
 
 diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
 index e8ba990..263a15a 100644
@@ -27,71 +34,3 @@ index e8ba990..263a15a 100644
  	g_free (priv->domain);
  	g_free (priv->nonce);
  	g_free (priv->opaque);
-diff --git a/tests/auth-test.c b/tests/auth-test.c
-index 8295ec3..dfc6b09 100644
---- a/tests/auth-test.c
-+++ b/tests/auth-test.c
-@@ -1549,6 +1549,55 @@ do_cancel_after_retry_test (void)
-         soup_test_session_abort_unref (session);
- }
- 
-+static void
-+on_request_read_for_missing_realm (SoupServer        *server,
-+                                   SoupServerMessage *msg,
-+                                   gpointer           user_data)
-+{
-+        SoupMessageHeaders *response_headers = soup_server_message_get_response_headers (msg);
-+        soup_message_headers_replace (response_headers, "WWW-Authenticate", "Digest qop=\"auth\"");
-+}
-+
-+static void
-+do_missing_realm_test (void)
-+{
-+        SoupSession *session;
-+        SoupMessage *msg;
-+        SoupServer *server;
-+        SoupAuthDomain *digest_auth_domain;
-+        gint status;
-+        GUri *uri;
-+
-+        server = soup_test_server_new (SOUP_TEST_SERVER_IN_THREAD);
-+	soup_server_add_handler (server, NULL,
-+				 server_callback, NULL, NULL);
-+	uri = soup_test_server_get_uri (server, "http", NULL);
-+
-+	digest_auth_domain = soup_auth_domain_digest_new (
-+		"realm", "auth-test",
-+		"auth-callback", server_digest_auth_callback,
-+		NULL);
-+        soup_auth_domain_add_path (digest_auth_domain, "/");
-+	soup_server_add_auth_domain (server, digest_auth_domain);
-+        g_object_unref (digest_auth_domain);
-+
-+        g_signal_connect (server, "request-read",
-+                          G_CALLBACK (on_request_read_for_missing_realm),
-+                          NULL);
-+
-+        session = soup_test_session_new (NULL);
-+        msg = soup_message_new_from_uri ("GET", uri);
-+        g_signal_connect (msg, "authenticate",
-+                          G_CALLBACK (on_digest_authenticate),
-+                          NULL);
-+
-+        status = soup_test_session_send_message (session, msg);
-+
-+        g_assert_cmpint (status, ==, SOUP_STATUS_UNAUTHORIZED);
-+	g_uri_unref (uri);
-+	soup_test_server_quit_unref (server);
-+}
-+
- int
- main (int argc, char **argv)
- {
-@@ -1576,6 +1625,7 @@ main (int argc, char **argv)
- 	g_test_add_func ("/auth/async-message-do-not-use-auth-cache", do_async_message_do_not_use_auth_cache_test);
- 	g_test_add_func ("/auth/authorization-header-request", do_message_has_authorization_header_test);
- 	g_test_add_func ("/auth/cancel-after-retry", do_cancel_after_retry_test);
-+        g_test_add_func ("/auth/missing-realm", do_missing_realm_test);
- 
- 	ret = g_test_run ();
- 
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
index 0d72afa1d6..a2168177a4 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
@@ -8,10 +8,17 @@ Upstream-Status: Backport [import from debian https://salsa.debian.org/gnome-tea
 Upstream commit https://gitlab.gnome.org/GNOME/libsoup/-/commit/405a8a34597a44bd58c4759e7d5e23f02c3b556a]
 CVE: CVE-2025-32910
 Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+
+Remove test code for fixing do_compile failure of libsoup-2.4, test codes include
+new type added in 3.x version
+../libsoup-2.74.3/tests/auth-test.c:1554:39: error: unknown type name 'SoupServerMessage'; did you mean 'SoupServerClass'?
+ 1554 |                                       SoupServerMessage *msg,
+      |                                       ^~~~~~~~~~~~~~~~~
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  libsoup/soup-auth-digest.c | 45 +++++++++++++++++++++++++++++++++++----------
- tests/auth-test.c          | 19 +++++++++++--------
- 2 files changed, 46 insertions(+), 18 deletions(-)
+ 1 files changed, 35 insertions(+), 10 deletions(-)
 
 diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
 index 263a15a..393adb6 100644
@@ -97,52 +104,3 @@ index 263a15a..393adb6 100644
  	soup_auth_digest_compute_response (msg->method, url, priv->hex_a1,
  					   priv->qop, priv->nonce,
  					   priv->cnonce, priv->nc,
-diff --git a/tests/auth-test.c b/tests/auth-test.c
-index dfc6b09..6fb1e4a 100644
---- a/tests/auth-test.c
-+++ b/tests/auth-test.c
-@@ -1550,16 +1550,17 @@ do_cancel_after_retry_test (void)
- }
- 
- static void
--on_request_read_for_missing_realm (SoupServer        *server,
--                                   SoupServerMessage *msg,
--                                   gpointer           user_data)
-+on_request_read_for_missing_params (SoupServer        *server,
-+                                      SoupServerMessage *msg,
-+                                      gpointer           user_data)
- {
-+        const char *auth_header = user_data;
-         SoupMessageHeaders *response_headers = soup_server_message_get_response_headers (msg);
--        soup_message_headers_replace (response_headers, "WWW-Authenticate", "Digest qop=\"auth\"");
-+        soup_message_headers_replace (response_headers, "WWW-Authenticate", auth_header);
- }
- 
- static void
--do_missing_realm_test (void)
-+do_missing_params_test (gconstpointer auth_header)
- {
-         SoupSession *session;
-         SoupMessage *msg;
-@@ -1582,8 +1583,8 @@ do_missing_realm_test (void)
-         g_object_unref (digest_auth_domain);
- 
-         g_signal_connect (server, "request-read",
--                          G_CALLBACK (on_request_read_for_missing_realm),
--                          NULL);
-+                          G_CALLBACK (on_request_read_for_missing_params),
-+                          (gpointer)auth_header);
- 
-         session = soup_test_session_new (NULL);
-         msg = soup_message_new_from_uri ("GET", uri);
-@@ -1625,7 +1626,9 @@ main (int argc, char **argv)
- 	g_test_add_func ("/auth/async-message-do-not-use-auth-cache", do_async_message_do_not_use_auth_cache_test);
- 	g_test_add_func ("/auth/authorization-header-request", do_message_has_authorization_header_test);
- 	g_test_add_func ("/auth/cancel-after-retry", do_cancel_after_retry_test);
--        g_test_add_func ("/auth/missing-realm", do_missing_realm_test);
-+        g_test_add_data_func ("/auth/missing-params/realm", "Digest qop=\"auth\"", do_missing_params_test);
-+        g_test_add_data_func ("/auth/missing-params/nonce", "Digest realm=\"auth-test\", qop=\"auth,auth-int\", opaque=\"5ccc069c403ebaf9f0171e9517f40e41\"", do_missing_params_test);
-+        g_test_add_data_func ("/auth/missing-params/nonce-md5-sess", "Digest realm=\"auth-test\", qop=\"auth,auth-int\", opaque=\"5ccc069c403ebaf9f0171e9517f40e41\" algorithm=\"MD5-sess\"", do_missing_params_test);
- 
- 	ret = g_test_run ();
- 
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912-1.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912-1.patch
index 2a6f37cb58..906a889c13 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912-1.patch
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912-1.patch
@@ -6,10 +6,14 @@ Subject: [PATCH 1/2] auth-digest: Handle missing nonce
 Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/cd077513f267e43ce4b659eb18a1734d8a369992]
 CVE: CVE-2025-32912
 Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+
+The test codes is based on CVE-2025-32910, test code in CVE-2025-32910
+is removed for fixing do_compile failure. So also remove this test code
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  libsoup/soup-auth-digest.c | 2 +-
- tests/auth-test.c          | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
+ 1 files changed, 1 insertions(+), 1 deletion(-)
 
 diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
 index a1db188..f0edb81 100644
@@ -24,18 +28,6 @@ index a1db188..f0edb81 100644
                  return FALSE;
  
  	g_free (priv->domain);
-diff --git a/tests/auth-test.c b/tests/auth-test.c
-index 6fb1e4a..343d7a5 100644
---- a/tests/auth-test.c
-+++ b/tests/auth-test.c
-@@ -1629,6 +1629,7 @@ main (int argc, char **argv)
-         g_test_add_data_func ("/auth/missing-params/realm", "Digest qop=\"auth\"", do_missing_params_test);
-         g_test_add_data_func ("/auth/missing-params/nonce", "Digest realm=\"auth-test\", qop=\"auth,auth-int\", opaque=\"5ccc069c403ebaf9f0171e9517f40e41\"", do_missing_params_test);
-         g_test_add_data_func ("/auth/missing-params/nonce-md5-sess", "Digest realm=\"auth-test\", qop=\"auth,auth-int\", opaque=\"5ccc069c403ebaf9f0171e9517f40e41\" algorithm=\"MD5-sess\"", do_missing_params_test);
-+	g_test_add_data_func ("/auth/missing-params/nonce-and-qop", "Digest realm=\"auth-test\"", do_missing_params_test);
- 
- 	ret = g_test_run ();
- 
 -- 
 2.25.1
 
-- 
2.34.1


