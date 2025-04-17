Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8CAC369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 10:43:37 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.5683.1744886613796983656
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 03:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Q3/H7Uea;
 spf=pass (domain: mvista.com, ip: 209.85.215.174, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af9a6b3da82so380602a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 03:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744886613; x=1745491413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkpN77uIF7dm4S/FezX7mw9c2cICbOvxjHRqWJ3/FvE=;
        b=Q3/H7Uea44FvUMwOCTJ5nUSQFuShLbAZbDyhzljNCiqdkyG40jSz9VZjWAiYWaTblg
         wM/uKpxkWndpmTQVM+UL0OikWcAcGT0cgLkySHwh1NSaTBSSWiWzaHtmQcQhC65gciT3
         dwDoAyVDkSD/HLirjyg5FZhJalYjcLx5f097M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744886613; x=1745491413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KkpN77uIF7dm4S/FezX7mw9c2cICbOvxjHRqWJ3/FvE=;
        b=gIG1UbglAELuwu+IKXuYDYWfddpS0NlUVMt9YZ4y2zDkcMqXyEaTobjTipJfdpIHDb
         V0ujKMgXOeS2x/+TXNIS3OMQdjRZEHc5ZoS2GqjxxNiLjoPaReOzj/mVulhFezyuH8xf
         u40stuMr/kU9bplFeKkG0hZAnxCa20w5zZ1j2QuLhkz/QijNrSFdYh/xpPgnl9Cc4uEF
         gyx2Y/MOY6+k8U79lxoj2AIRjnMhoDPl+VR8dUxUPIHTPrL/7t6dAf1NnD9N0HITGpIi
         OlLspZbWlQvr4XX60R4aJxukDoI9PWcaqr07UdIy0tkYgP+TpM1R6E19ViV0kvh5yysq
         hWjQ==
X-Gm-Message-State: AOJu0YxtttYYrDZOLrrPRWdSYU48sntYHk5TvZaoKX0l1Kjc2yjVXcTV
	9hhgmfsv31ec5BpAKb8Xfn6bw/VaYHjR+/WwEmkpIIXn0drjDfeQb07gCzZIREUdy2hzKtEQbyO
	JRlw=
X-Gm-Gg: ASbGncufPn6wxdRNI14DnDy9I7i/PkG+sd+PFQsu0WaeXx3ggwuURmvv2RW/nMvXa2l
	R9BSMnO4eZqHbftCixTcCMS3AASYPMoc22SPwTbOyqyiZDco0EgJpMz++anyoiVXrsBxhIV1Ybx
	ik37rHNeGqzLmJ58f+cSGp9ci1V11Hd/YoHOHqFceHQIlShEEfrXCeFXoeggHQiooAtIrZnI9Hy
	C1G9zPmK64Ks7dkxwURMpnS1pzrHY2A+VnqIVOqRYwSJWRvuAbFkj12PVwdEKh4dE6cgcs6JbI2
	Ie5kB6mrKZkvBc9hCNGIdWQbuJCM4hAFXKLe/EuwidyfopyBhae+
X-Google-Smtp-Source: AGHT+IEOr+Utt/aBNMPAog/uyU8koazRDolQRZUiHLRMO//iVGFiqwdo3AsTqiZQJSnTNG6i11uftA==
X-Received: by 2002:a17:903:1a44:b0:223:5e76:637a with SMTP id d9443c01a7336-22c35909c6amr81860865ad.23.1744886612632;
        Thu, 17 Apr 2025 03:43:32 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.223.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef1025sm30346605ad.39.2025.04.17.03.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 03:43:32 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH v2 4/5] libsoup: Fix CVE-2025-32912
Date: Thu, 17 Apr 2025 16:12:57 +0530
Message-Id: <20250417104258.64180-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250417104258.64180-1-vanusuri@mvista.com>
References: <20250417104258.64180-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 10:43:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215062

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/e40df6d48a1cbab56f5d15016cc861a503423cfe
&
https://gitlab.gnome.org/GNOME/libsoup/-/commit/405a8a34597a44bd58c4759e7d5e23f02c3b556a
&
https://gitlab.gnome.org/GNOME/libsoup/-/commit/cd077513f267e43ce4b659eb18a1734d8a369992
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/910ebdcd3dd82386717a201c13c834f3a63eed7f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup-3.4.4/CVE-2025-32912-1.patch      |  98 ++++++++++++
 .../libsoup-3.4.4/CVE-2025-32912-2.patch      | 149 ++++++++++++++++++
 .../libsoup-3.4.4/CVE-2025-32912-3.patch      |  41 +++++
 .../libsoup-3.4.4/CVE-2025-32912-4.patch      |  30 ++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   4 +
 5 files changed, 322 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-4.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-1.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-1.patch
new file mode 100644
index 0000000000..311f3020b8
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-1.patch
@@ -0,0 +1,98 @@
+From e40df6d48a1cbab56f5d15016cc861a503423cfe Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Sun, 8 Dec 2024 20:00:35 -0600
+Subject: [PATCH] auth-digest: Handle missing realm in authenticate header
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/e40df6d48a1cbab56f5d15016cc861a503423cfe]
+CVE: CVE-2025-32912 #Dependency Patch1
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/auth/soup-auth-digest.c |  3 ++
+ tests/auth-test.c               | 50 +++++++++++++++++++++++++++++++++
+ 2 files changed, 53 insertions(+)
+
+diff --git a/libsoup/auth/soup-auth-digest.c b/libsoup/auth/soup-auth-digest.c
+index 2e81849af..4f12e87a5 100644
+--- a/libsoup/auth/soup-auth-digest.c
++++ b/libsoup/auth/soup-auth-digest.c
+@@ -148,6 +148,9 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+ 	guint qop_options;
+ 	gboolean ok = TRUE;
+ 
++        if (!soup_auth_get_realm (auth))
++                return FALSE;
++
+ 	g_free (priv->domain);
+ 	g_free (priv->nonce);
+ 	g_free (priv->opaque);
+diff --git a/tests/auth-test.c b/tests/auth-test.c
+index 158fdac10..3066e904a 100644
+--- a/tests/auth-test.c
++++ b/tests/auth-test.c
+@@ -1866,6 +1866,55 @@ do_multiple_digest_algorithms (void)
+ 	soup_test_server_quit_unref (server);
+ }
+ 
++static void
++on_request_read_for_missing_realm (SoupServer        *server,
++                                   SoupServerMessage *msg,
++                                   gpointer           user_data)
++{
++        SoupMessageHeaders *response_headers = soup_server_message_get_response_headers (msg);
++        soup_message_headers_replace (response_headers, "WWW-Authenticate", "Digest qop=\"auth\"");
++}
++
++static void
++do_missing_realm_test (void)
++{
++        SoupSession *session;
++        SoupMessage *msg;
++        SoupServer *server;
++        SoupAuthDomain *digest_auth_domain;
++        gint status;
++        GUri *uri;
++
++        server = soup_test_server_new (SOUP_TEST_SERVER_IN_THREAD);
++	soup_server_add_handler (server, NULL,
++				 server_callback, NULL, NULL);
++	uri = soup_test_server_get_uri (server, "http", NULL);
++
++	digest_auth_domain = soup_auth_domain_digest_new (
++		"realm", "auth-test",
++		"auth-callback", server_digest_auth_callback,
++		NULL);
++        soup_auth_domain_add_path (digest_auth_domain, "/");
++	soup_server_add_auth_domain (server, digest_auth_domain);
++        g_object_unref (digest_auth_domain);
++
++        g_signal_connect (server, "request-read",
++                          G_CALLBACK (on_request_read_for_missing_realm),
++                          NULL);
++
++        session = soup_test_session_new (NULL);
++        msg = soup_message_new_from_uri ("GET", uri);
++        g_signal_connect (msg, "authenticate",
++                          G_CALLBACK (on_digest_authenticate),
++                          NULL);
++
++        status = soup_test_session_send_message (session, msg);
++
++        g_assert_cmpint (status, ==, SOUP_STATUS_UNAUTHORIZED);
++	g_uri_unref (uri);
++	soup_test_server_quit_unref (server);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -1899,6 +1948,7 @@ main (int argc, char **argv)
+ 	g_test_add_func ("/auth/auth-uri", do_auth_uri_test);
+         g_test_add_func ("/auth/cancel-request-on-authenticate", do_cancel_request_on_authenticate);
+         g_test_add_func ("/auth/multiple-algorithms", do_multiple_digest_algorithms);
++        g_test_add_func ("/auth/missing-realm", do_missing_realm_test);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-2.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-2.patch
new file mode 100644
index 0000000000..5809e178d1
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-2.patch
@@ -0,0 +1,149 @@
+From 405a8a34597a44bd58c4759e7d5e23f02c3b556a Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Thu, 26 Dec 2024 18:18:35 -0600
+Subject: [PATCH] auth-digest: Handle missing nonce
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/405a8a34597a44bd58c4759e7d5e23f02c3b556a]
+CVE: CVE-2025-32912 #Dependency Patch2
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/auth/soup-auth-digest.c | 45 +++++++++++++++++++++++++--------
+ tests/auth-test.c               | 19 ++++++++------
+ 2 files changed, 46 insertions(+), 18 deletions(-)
+
+diff --git a/libsoup/auth/soup-auth-digest.c b/libsoup/auth/soup-auth-digest.c
+index 4f12e87a..350bfde6 100644
+--- a/libsoup/auth/soup-auth-digest.c
++++ b/libsoup/auth/soup-auth-digest.c
+@@ -138,6 +138,19 @@ soup_auth_digest_get_qop (SoupAuthDigestQop qop)
+ 	return g_string_free (out, FALSE);
+ }
+ 
++static gboolean
++validate_params (SoupAuthDigest *auth_digest)
++{
++        SoupAuthDigestPrivate *priv = soup_auth_digest_get_instance_private (auth_digest);
++
++        if (priv->qop || priv->algorithm == SOUP_AUTH_DIGEST_ALGORITHM_MD5_SESS) {
++                if (!priv->nonce)
++                        return FALSE;
++        }
++
++        return TRUE;
++}
++
+ static gboolean
+ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+ 			 GHashTable *auth_params)
+@@ -175,16 +188,21 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+ 	if (priv->algorithm == -1)
+ 		ok = FALSE;
+ 
+-	stale = g_hash_table_lookup (auth_params, "stale");
+-	if (stale && !g_ascii_strcasecmp (stale, "TRUE") && *priv->hex_urp)
+-		recompute_hex_a1 (priv);
+-	else {
+-		g_free (priv->user);
+-		priv->user = NULL;
+-		g_free (priv->cnonce);
+-		priv->cnonce = NULL;
+-		memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
+-		memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
++        if (!validate_params (auth_digest))
++                ok = FALSE;
++
++        if (ok) {
++                stale = g_hash_table_lookup (auth_params, "stale");
++                if (stale && !g_ascii_strcasecmp (stale, "TRUE") && *priv->hex_urp)
++                        recompute_hex_a1 (priv);
++                else {
++                        g_free (priv->user);
++                        priv->user = NULL;
++                        g_free (priv->cnonce);
++                        priv->cnonce = NULL;
++                        memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
++                        memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
++                }
+         }
+ 
+ 	return ok;
+@@ -276,6 +294,8 @@ soup_auth_digest_compute_hex_a1 (const char              *hex_urp,
+ 
+ 		/* In MD5-sess, A1 is hex_urp:nonce:cnonce */
+ 
++                g_assert (nonce && cnonce);
++
+ 		checksum = g_checksum_new (G_CHECKSUM_MD5);
+ 		g_checksum_update (checksum, (guchar *)hex_urp, strlen (hex_urp));
+ 		g_checksum_update (checksum, (guchar *)":", 1);
+@@ -366,6 +386,8 @@ soup_auth_digest_compute_response (const char        *method,
+ 	if (qop) {
+ 		char tmp[9];
+ 
++                g_assert (cnonce);
++
+ 		g_snprintf (tmp, 9, "%.8x", nc);
+ 		g_checksum_update (checksum, (guchar *)tmp, strlen (tmp));
+ 		g_checksum_update (checksum, (guchar *)":", 1);
+@@ -429,6 +451,9 @@ soup_auth_digest_get_authorization (SoupAuth *auth, SoupMessage *msg)
+ 	g_return_val_if_fail (uri != NULL, NULL);
+ 	url = soup_uri_get_path_and_query (uri);
+ 
++        g_assert (priv->nonce);
++        g_assert (!priv->qop || priv->cnonce);
++
+ 	soup_auth_digest_compute_response (soup_message_get_method (msg), url, priv->hex_a1,
+ 					   priv->qop, priv->nonce,
+ 					   priv->cnonce, priv->nc,
+diff --git a/tests/auth-test.c b/tests/auth-test.c
+index 3066e904..c651c7cd 100644
+--- a/tests/auth-test.c
++++ b/tests/auth-test.c
+@@ -1867,16 +1867,17 @@ do_multiple_digest_algorithms (void)
+ }
+ 
+ static void
+-on_request_read_for_missing_realm (SoupServer        *server,
+-                                   SoupServerMessage *msg,
+-                                   gpointer           user_data)
++on_request_read_for_missing_params (SoupServer        *server,
++                                      SoupServerMessage *msg,
++                                      gpointer           user_data)
+ {
++        const char *auth_header = user_data;
+         SoupMessageHeaders *response_headers = soup_server_message_get_response_headers (msg);
+-        soup_message_headers_replace (response_headers, "WWW-Authenticate", "Digest qop=\"auth\"");
++        soup_message_headers_replace (response_headers, "WWW-Authenticate", auth_header);
+ }
+ 
+ static void
+-do_missing_realm_test (void)
++do_missing_params_test (gconstpointer auth_header)
+ {
+         SoupSession *session;
+         SoupMessage *msg;
+@@ -1899,8 +1900,8 @@ do_missing_realm_test (void)
+         g_object_unref (digest_auth_domain);
+ 
+         g_signal_connect (server, "request-read",
+-                          G_CALLBACK (on_request_read_for_missing_realm),
+-                          NULL);
++                          G_CALLBACK (on_request_read_for_missing_params),
++                          (gpointer)auth_header);
+ 
+         session = soup_test_session_new (NULL);
+         msg = soup_message_new_from_uri ("GET", uri);
+@@ -1948,7 +1949,9 @@ main (int argc, char **argv)
+ 	g_test_add_func ("/auth/auth-uri", do_auth_uri_test);
+         g_test_add_func ("/auth/cancel-request-on-authenticate", do_cancel_request_on_authenticate);
+         g_test_add_func ("/auth/multiple-algorithms", do_multiple_digest_algorithms);
+-        g_test_add_func ("/auth/missing-realm", do_missing_realm_test);
++        g_test_add_data_func ("/auth/missing-params/realm", "Digest qop=\"auth\"", do_missing_params_test);
++        g_test_add_data_func ("/auth/missing-params/nonce", "Digest realm=\"auth-test\", qop=\"auth,auth-int\", opaque=\"5ccc069c403ebaf9f0171e9517f40e41\"", do_missing_params_test);
++        g_test_add_data_func ("/auth/missing-params/nonce-md5-sess", "Digest realm=\"auth-test\", qop=\"auth,auth-int\", opaque=\"5ccc069c403ebaf9f0171e9517f40e41\" algorithm=\"MD5-sess\"", do_missing_params_test);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-3.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-3.patch
new file mode 100644
index 0000000000..c35c599502
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-3.patch
@@ -0,0 +1,41 @@
+From cd077513f267e43ce4b659eb18a1734d8a369992 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Wed, 5 Feb 2025 14:03:05 -0600
+Subject: [PATCH] auth-digest: Handle missing nonce
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/cd077513f267e43ce4b659eb18a1734d8a369992]
+CVE: CVE-2025-32912
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/auth/soup-auth-digest.c | 2 +-
+ tests/auth-test.c               | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/auth/soup-auth-digest.c b/libsoup/auth/soup-auth-digest.c
+index 9eb7fa0e..d69a4013 100644
+--- a/libsoup/auth/soup-auth-digest.c
++++ b/libsoup/auth/soup-auth-digest.c
+@@ -162,7 +162,7 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+ 	guint qop_options;
+ 	gboolean ok = TRUE;
+ 
+-        if (!soup_auth_get_realm (auth))
++        if (!soup_auth_get_realm (auth) || !g_hash_table_contains (auth_params, "nonce"))
+                 return FALSE;
+ 
+ 	g_free (priv->domain);
+diff --git a/tests/auth-test.c b/tests/auth-test.c
+index c651c7cd..484097f1 100644
+--- a/tests/auth-test.c
++++ b/tests/auth-test.c
+@@ -1952,6 +1952,7 @@ main (int argc, char **argv)
+         g_test_add_data_func ("/auth/missing-params/realm", "Digest qop=\"auth\"", do_missing_params_test);
+         g_test_add_data_func ("/auth/missing-params/nonce", "Digest realm=\"auth-test\", qop=\"auth,auth-int\", opaque=\"5ccc069c403ebaf9f0171e9517f40e41\"", do_missing_params_test);
+         g_test_add_data_func ("/auth/missing-params/nonce-md5-sess", "Digest realm=\"auth-test\", qop=\"auth,auth-int\", opaque=\"5ccc069c403ebaf9f0171e9517f40e41\" algorithm=\"MD5-sess\"", do_missing_params_test);
++        g_test_add_data_func ("/auth/missing-params/nonce-and-qop", "Digest realm=\"auth-test\"", do_missing_params_test);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-4.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-4.patch
new file mode 100644
index 0000000000..ad6f3a8028
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-4.patch
@@ -0,0 +1,30 @@
+From 910ebdcd3dd82386717a201c13c834f3a63eed7f Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Sat, 8 Feb 2025 12:30:13 -0600
+Subject: [PATCH] digest-auth: Handle NULL nonce
+
+`contains` only handles a missing nonce, `lookup` handles both missing and empty.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/910ebdcd3dd82386717a201c13c834f3a63eed7f]
+CVE: CVE-2025-32912
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/auth/soup-auth-digest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/auth/soup-auth-digest.c b/libsoup/auth/soup-auth-digest.c
+index d69a4013..dc4dbfc5 100644
+--- a/libsoup/auth/soup-auth-digest.c
++++ b/libsoup/auth/soup-auth-digest.c
+@@ -162,7 +162,7 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+ 	guint qop_options;
+ 	gboolean ok = TRUE;
+ 
+-        if (!soup_auth_get_realm (auth) || !g_hash_table_contains (auth_params, "nonce"))
++        if (!soup_auth_get_realm (auth) || !g_hash_table_lookup (auth_params, "nonce"))
+                 return FALSE;
+ 
+ 	g_free (priv->domain);
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index a70ef87ee0..2db854baa4 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -22,6 +22,10 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32909.patch \
            file://CVE-2025-32911_CVE-2025-32913-1.patch \
            file://CVE-2025-32911_CVE-2025-32913-2.patch \
+           file://CVE-2025-32912-1.patch \
+           file://CVE-2025-32912-2.patch \
+           file://CVE-2025-32912-3.patch \
+           file://CVE-2025-32912-4.patch \
           "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.25.1


