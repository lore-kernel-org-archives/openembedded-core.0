Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B00AC61DB8
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 16:00:33 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.37121.1749225625398386240
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 09:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HdV27uWA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742caef5896so2010856b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 09:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749225624; x=1749830424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7zt3/5XvscrIN2qIfbrQ3J7bEt54VZN4EBliE66Ry3M=;
        b=HdV27uWASJawL4Etli1JI8T+nJ2WMu+e8UUWpKzyZT5W3Jf3heM4+J/s0zvd2GWQsl
         QWd89byVRxwz3+8HJS9vCeGvCVIUjK5ZxTObuHFtBauRnROnsOhw13n13T5o/cpQWUhx
         KBTb12i6tiDmc054sTXjusgDhD8ZXAFW50Mf9hW4VkgoxCXgCjKVBh83clAkNukCuA19
         zFtS+NOnXlRpB1oTx9F++x0Leq0qzFvbmRehq2OfTK18LpbpXHGl1SRPRSqDYtrGZ0Fv
         eUnuPYcfxae5EU8HhaBKpxg3IH4TuhhcAOqKX34eSCLjhfpWa9GIpo2AzeG7d2rT/4w9
         uh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749225624; x=1749830424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zt3/5XvscrIN2qIfbrQ3J7bEt54VZN4EBliE66Ry3M=;
        b=W9vedJQDF3hq3XQPqATU0+5nefpTsTfavTlL9HUojQB4x+OYeMcgLdGVj2Re5j1CCd
         vkHUehGeC/lgFxo57zn+VXGV8VGTkhMmZ+6uu7O0fprUM9YKrYmml2xJPObc6zUWrvn9
         /zmNfRTHIIOduTNLTrQn7wggaNkryzATmUNobIA1yEh3A7kQwqrn4khKRyx0zRCc3EOM
         N1HRZG0VYXJtLzV9cK3wMphVjURLhS0Zj/cZHO115ZT8v5/ni1vmswnRD31CKb0ruF0p
         NsJmzN1afNThOyLBI+U+sJwFiK7goPRekPiD+wQ19UFysadPLppvEXRJqwScsC0ZO/pC
         vqwA==
X-Gm-Message-State: AOJu0YxK7yzLfE65qBv7pE5zU2qXS5hG+aTMwkGn1lLHPje/Jum5kRH+
	rmMI5uiRv30/ge88KFayprUpJF/Cjjnh1kR/ueH8LEuvXzS3BRDJAbhwMd6Il5tHy3tQrvEL1E4
	aoy+q
X-Gm-Gg: ASbGncsjlqUWRoxMpRGJuR2oD+mqTJNC2Sv+1kxYLzE9T+tBEahKlK53NEv06MmGTyB
	McoHdWjmRy3giQYPNt8tus8qVMty79Ihset8f8mQcbUAq3U6YXHxtvfyWW7TInSoTpwqjnjoIfP
	VBCAOOr91jyCyzmeeMyU7a9G7XsxBP26zwrbckTlxaTyfNwxd09OtCvJ/J3RFwedcvTt4NmPKyn
	SjZsTEHmfpa75wwAcVQWy/DjSf+yCOPVnpZNtXZEbRZ8ajwBk3uRVEMw4lQEchpdqfujaZt+gsw
	gXfmGQ98vErXAtCa/GMLr99/QDZ0X2XLPXVh7xp5yo5ri7SiP5FX0A==
X-Google-Smtp-Source: AGHT+IHPxpZbMiBvGq9I3Wg2keTiu7XNH6jG1C3vwbWoOji1b2XSuJT813LTAwZIOxQJL0ksd7DJAg==
X-Received: by 2002:a05:6a00:9169:b0:748:2fa4:14c0 with SMTP id d2e1a72fcca58-7482fa42483mr3178933b3a.0.1749225622914;
        Fri, 06 Jun 2025 09:00:22 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:742a:4153:2a1f:f028])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b083a9bsm1436489b3a.77.2025.06.06.09.00.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:00:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/12] libsoup-2.4: fix do_compile failure
Date: Fri,  6 Jun 2025 08:59:57 -0700
Message-ID: <f14a6c98e4cbf4ee2a243387b018e29beab3b56a.1749225418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749225417.git.steve@sakoman.com>
References: <cover.1749225417.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 16:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218166

From: Changqing Li <changqing.li@windriver.com>

Remove test code for fixing do_compile failure:
../libsoup-2.74.3/tests/auth-test.c:1554:39: error: unknown type name 'SoupServerMessage'; did you mean 'SoupServerClass'?
 1554 |                                       SoupServerMessage *msg,
      |

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


