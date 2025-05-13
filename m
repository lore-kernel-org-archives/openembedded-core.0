Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A936BC3ABD7
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 10:51:51 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.73390.1747133510024126693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 03:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dP5b6w9+;
 spf=pass (domain: mvista.com, ip: 209.85.210.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7399838db7fso5278215b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 03:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1747133509; x=1747738309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrwTuhznuFfW7w8dy0NfiokEgK2zu8Bb5nUUabxZYo4=;
        b=dP5b6w9+PlDVRSP6K2X8SiS6MeZiSjCZOKidT4cjgeYwWQ/ovolmfaJqngRJBbQMoh
         oaHne4AN8nB1th11bNQ1cbqywV5VQgcyVvB7fmYBJR4K4EyJibwbEREMhpcqtsgj4LtW
         LrfpoX5HyQbtUFnAz4oGoTgjp3gASXPU9l3jE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747133509; x=1747738309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrwTuhznuFfW7w8dy0NfiokEgK2zu8Bb5nUUabxZYo4=;
        b=s/FVuiIMdXq8ml6/ByYThIqxEIhGV9l6q2RnMVarA9cNJPKOOL2cICybq9fQUfRscD
         rZzcQ/thDyRCXdbBQiY3GbAm18klaY5bg4UctgXYWQUOyDNRdGuhvRRXRhBfrLfNnTWu
         83JLk53UV/a9jlMhpHqOP4DnMLAmB2GewXE+gJoOKpyCSb4OHWinaIf+3zSczs9X8hNU
         OOjIFCDDv6VgYQHiIqoZ9MofHUJYqWkcewPoCZPTk0AfuU31rHWa1xuz2a7/p8AqjGBb
         wzX1EY9yIwRAES8ovfMbRfKqCMV+VxHKviKTZgIbYGRLu7wWUdmVSUm5Kt3x8dzlXJSl
         ZMqg==
X-Gm-Message-State: AOJu0YyZIqGksuwGXDGjuIwfq1hatWsxvuBpB2ie/aKnQo1HGxsOQIQH
	wXf53mkw/pKcLgi0OMrrmKYCvAd/2uQCXQWMjpkUi9Y/17jbi/HawY0JAXQ2Jn7song2WwmzTg5
	Xvm4=
X-Gm-Gg: ASbGncvWiYPdyvxEgvriZloUPY6cy2gj4F7GGTs7TDpYQSEUu35NqVtZ7oPJhv5vEaX
	CfyV4Wav/Fk5UY6UrM4MH4FMwFfgK4Q8g63+XgUUYKja3x2GA2Gz6EaR29DgbAb7X0drXVPxowj
	BNzjZAoyNZqVCjR2aCFe6WzZeN5V3oI8lh2HSEJUStIdk24EsQS8fSLXM9D0+Trf//hjosVTOnK
	zPIoLKabzwnsPkv1U/I5gTpWrzJCEa2DJ/f/fwBld0bNVCtzVM3KrcQ/vlKuT5F1V3OUbEpV7OB
	ZbPUTBCgSBn5PsZnDADpWbTP9ZGASq5tDBySV7OG5u9m6uABFhScE7wL6sznKvI=
X-Google-Smtp-Source: AGHT+IElXLzFmIHs3PVa+wSvuU10i3/xzqEVrObr0+yqYLJpkRrZr0nlzXeXC2p8zSjGIcT5G5GJ7g==
X-Received: by 2002:a05:6a00:a14:b0:736:b400:b58f with SMTP id d2e1a72fcca58-74278d476c0mr4769807b3a.0.1747133508580;
        Tue, 13 May 2025 03:51:48 -0700 (PDT)
Received: from localhost.localdomain ([49.207.220.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a3d861sm7796759b3a.147.2025.05.13.03.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:51:48 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 4/7] libsoup: Fix CVE-2025-32910
Date: Tue, 13 May 2025 16:21:26 +0530
Message-Id: <20250513105129.2284690-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513105129.2284690-1-vanusuri@mvista.com>
References: <20250513105129.2284690-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 10:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216413

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/e40df6d48a1cbab56f5d15016cc861a503423cfe
&
https://gitlab.gnome.org/GNOME/libsoup/-/commit/405a8a34597a44bd58c4759e7d5e23f02c3b556a
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b705e5eab34b13832

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup/libsoup/CVE-2025-32910-1.patch    |  98 ++++++++++++
 .../libsoup/libsoup/CVE-2025-32910-2.patch    | 149 ++++++++++++++++++
 .../libsoup/libsoup/CVE-2025-32910-3.patch    |  27 ++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |   3 +
 4 files changed, 277 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32910-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32910-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32910-3.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32910-1.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32910-1.patch
new file mode 100644
index 0000000000..27011f587f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32910-1.patch
@@ -0,0 +1,98 @@
+From e40df6d48a1cbab56f5d15016cc861a503423cfe Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Sun, 8 Dec 2024 20:00:35 -0600
+Subject: [PATCH] auth-digest: Handle missing realm in authenticate header
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/e40df6d48a1cbab56f5d15016cc861a503423cfe]
+CVE: CVE-2025-32910
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
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32910-2.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32910-2.patch
new file mode 100644
index 0000000000..b62e09cbdb
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32910-2.patch
@@ -0,0 +1,149 @@
+From 405a8a34597a44bd58c4759e7d5e23f02c3b556a Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Thu, 26 Dec 2024 18:18:35 -0600
+Subject: [PATCH] auth-digest: Handle missing nonce
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/405a8a34597a44bd58c4759e7d5e23f02c3b556a]
+CVE: CVE-2025-32910
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
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32910-3.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32910-3.patch
new file mode 100644
index 0000000000..32e0c86e62
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32910-3.patch
@@ -0,0 +1,27 @@
+From ea16eeacb052e423eb5c3b0b705e5eab34b13832 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Fri, 27 Dec 2024 13:52:52 -0600
+Subject: [PATCH] auth-digest: Fix leak
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b705e5eab34b13832]
+CVE: CVE-2025-32910
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/auth/soup-auth-digest.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libsoup/auth/soup-auth-digest.c b/libsoup/auth/soup-auth-digest.c
+index 350bfde6..9eb7fa0e 100644
+--- a/libsoup/auth/soup-auth-digest.c
++++ b/libsoup/auth/soup-auth-digest.c
+@@ -72,6 +72,7 @@ soup_auth_digest_finalize (GObject *object)
+ 	g_free (priv->nonce);
+ 	g_free (priv->domain);
+ 	g_free (priv->cnonce);
++        g_free (priv->opaque);
+ 
+ 	memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
+ 	memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 4fa8fce1c4..2c05ef338e 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -22,6 +22,9 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32906-1.patch \
            file://CVE-2025-32906-2.patch \
            file://CVE-2025-32909.patch \
+           file://CVE-2025-32910-1.patch \
+           file://CVE-2025-32910-2.patch \
+           file://CVE-2025-32910-3.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.25.1


