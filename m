Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F86CC54FC6
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 13:36:54 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.7109.1748093805988262252
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 May 2025 06:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rPBYarU4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3081f72c271so661478a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 06:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748093805; x=1748698605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2PuTBX9wA0/ZSbQtrNGqJ83ypNmEpSJHCsubAPECjU=;
        b=rPBYarU4ztGo2Z40BofvKcJ7phx85PrC4itesPh4kLuPgVD3ir53cJ5Nny/vL7zEXx
         Lr3J5mc79xoC1UNKACJhP0awXeL+S6/ZfanlAGmkrH6+Ps6pg3M7Ws9KBJMl4TZ8rN7U
         6U/gkVqMViGVInkU5Nkb13sQzYWGhIrIVwmQ4NJZ2kZmCjSq6B5FNL1pI1ufFSJlll2R
         gsPXaeESZZQunbaRu28kbrT6RkwjyI2UDlSTt4DbCAGRqhJyVfe+IdkDiL5p17BML+fk
         J0+8+/egRSVLCo2jm7KxbIHwspXISGHVGCFpQg/DMNZG0+NkLRE1h8PRcyk/v7FYmdeQ
         TFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748093805; x=1748698605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2PuTBX9wA0/ZSbQtrNGqJ83ypNmEpSJHCsubAPECjU=;
        b=dwR0l3btT/hwla7fQenkLVddJukkpi4iX/qSWlYSDSogk+jkoW+AmzP451anMkgq4H
         1j/r49gt4ko2eUb752XLCYIhY7V9UPauD1JXuMsvRXw+8RVESRfoMTBMyPlfJOZtJfzb
         U2/fdNKmKtQLnnYvqToLpc1dWIk7oDRrufMhgzZYB85TfpZeuvpQ8Mp8G2VrovP0TwXA
         X6o/ttS2bphYw1yE2GrdeUlgZUxQnwpysVmOeAK4BfUdVyr+DMH4PuRibWCyhPX+x9TQ
         FM8uxuZRu4qp1lzjU1V7pF+8H/TZfQ2WLORQk3pQkRkQFOJMu3317TY1/2NIjI/Of+6x
         uPTg==
X-Gm-Message-State: AOJu0Yw0JeehbXyJuVcLnVhPD6S2ALOeiSX5DnfqZTOpfqYhkcaEiLcy
	bRquqZqUJH1t3Z96ABusG33F8N96mgFzQJloUSvrTnVvcITRtMkuN/qyN2RwOxHkqHcTw7mheno
	WcRgK
X-Gm-Gg: ASbGncuAd9OpNK4BEtlJU7nTi6vj0TRE9Xz2S+n6GrmItG/p/pHvskQ2ka+ZWNe/LDt
	4VIknPdg8xaI0nY/X/V1mnGDEhSZ4N515+VNZlAbJ2twDzYjamRRI3nXglkQcvNn0NYZhsKPsVV
	A7582EQ2MSoTON8Qi9ni7l0NnaN5kGH2YdeYzjGN3U9wUVO1Q7b8fNTh21qSnPVQJir4uKO4Vz7
	qQRBtITLIr8JDyNgxU5cIwEUwuv70QoOd51w8gPZ7DWzKONSgshmDMCrcr+C6RCwOOGPwlNWr7K
	e485/v363e2s2DUjPYe/9sDK9uuJeWS5nXbilCCAUtU=
X-Google-Smtp-Source: AGHT+IEzFMakMaJN/MWwcZVIVHX+plLf8dvEv6mttYa5iRNhrb/CRHEdZdu8Tkhn3w8ol6IcSrybMA==
X-Received: by 2002:a17:90b:3ec1:b0:30c:5479:c92e with SMTP id 98e67ed59e1d1-3110f1149a4mr4070421a91.4.1748093804994;
        Sat, 24 May 2025 06:36:44 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3157:44bf:9f62:fea8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4f9csm9058913a91.20.2025.05.24.06.36.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 06:36:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/12] libsoup-2.4: Fix CVE-2025-32910
Date: Sat, 24 May 2025 06:36:21 -0700
Message-ID: <b65e3d3a4dc2375d9bb81c7a91c84139cc667a47.1748093626.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748093626.git.steve@sakoman.com>
References: <cover.1748093626.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 13:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217230

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from debian to fix
 CVE-2025-32910

Upstream-Status: Backport [import from debian https://salsa.debian.org/gnome-team/libsoup/-/tree/debian/bullseye/debian/patches?ref_type=heads
Upstream commit https://gitlab.gnome.org/GNOME/libsoup/-/commit/e40df6d48a1cbab56f5d15016cc861a503423cfe
&
https://gitlab.gnome.org/GNOME/libsoup/-/commit/405a8a34597a44bd58c4759e7d5e23f02c3b556a
&
https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b705e5eab34b13832]

Reference:
https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417
https://security-tracker.debian.org/tracker/CVE-2025-32910

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-2.4/CVE-2025-32910-1.patch        |  97 ++++++++++++
 .../libsoup-2.4/CVE-2025-32910-2.patch        | 148 ++++++++++++++++++
 .../libsoup-2.4/CVE-2025-32910-3.patch        |  26 +++
 .../libsoup/libsoup-2.4_2.74.2.bb             |   3 +
 4 files changed, 274 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
new file mode 100644
index 0000000000..de4faf5380
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
@@ -0,0 +1,97 @@
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Sun, 8 Dec 2024 20:00:35 -0600
+Subject: auth-digest: Handle missing realm in authenticate header
+
+(cherry picked from commit e40df6d48a1cbab56f5d15016cc861a503423cfe)
+
+Upstream-Status: Backport [import from debian https://salsa.debian.org/gnome-team/libsoup/-/blob/debian/bullseye/debian/patches/CVE-2025-32910-1.patch?ref_type=heads
+Upstream commit https://gitlab.gnome.org/GNOME/libsoup/-/commit/e40df6d48a1cbab56f5d15016cc861a503423cfe]
+CVE: CVE-2025-32910
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-auth-digest.c |  3 +++
+ tests/auth-test.c          | 50 ++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 53 insertions(+)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index e8ba990..263a15a 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -142,6 +142,9 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
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
+index 8295ec3..dfc6b09 100644
+--- a/tests/auth-test.c
++++ b/tests/auth-test.c
+@@ -1549,6 +1549,55 @@ do_cancel_after_retry_test (void)
+         soup_test_session_abort_unref (session);
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
+@@ -1576,6 +1625,7 @@ main (int argc, char **argv)
+ 	g_test_add_func ("/auth/async-message-do-not-use-auth-cache", do_async_message_do_not_use_auth_cache_test);
+ 	g_test_add_func ("/auth/authorization-header-request", do_message_has_authorization_header_test);
+ 	g_test_add_func ("/auth/cancel-after-retry", do_cancel_after_retry_test);
++        g_test_add_func ("/auth/missing-realm", do_missing_realm_test);
+ 
+ 	ret = g_test_run ();
+ 
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
new file mode 100644
index 0000000000..0d72afa1d6
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
@@ -0,0 +1,148 @@
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Thu, 26 Dec 2024 18:18:35 -0600
+Subject: auth-digest: Handle missing nonce
+
+(cherry picked from commit 405a8a34597a44bd58c4759e7d5e23f02c3b556a)
+
+Upstream-Status: Backport [import from debian https://salsa.debian.org/gnome-team/libsoup/-/blob/debian/bullseye/debian/patches/CVE-2025-32910-2.patch?ref_type=heads
+Upstream commit https://gitlab.gnome.org/GNOME/libsoup/-/commit/405a8a34597a44bd58c4759e7d5e23f02c3b556a]
+CVE: CVE-2025-32910
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-auth-digest.c | 45 +++++++++++++++++++++++++++++++++++----------
+ tests/auth-test.c          | 19 +++++++++++--------
+ 2 files changed, 46 insertions(+), 18 deletions(-)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index 263a15a..393adb6 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -132,6 +132,19 @@ soup_auth_digest_get_qop (SoupAuthDigestQop qop)
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
+@@ -169,16 +182,21 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
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
+@@ -269,6 +287,8 @@ soup_auth_digest_compute_hex_a1 (const char              *hex_urp,
+ 
+ 		/* In MD5-sess, A1 is hex_urp:nonce:cnonce */
+ 
++                g_assert (nonce && cnonce);
++
+ 		checksum = g_checksum_new (G_CHECKSUM_MD5);
+ 		g_checksum_update (checksum, (guchar *)hex_urp, strlen (hex_urp));
+ 		g_checksum_update (checksum, (guchar *)":", 1);
+@@ -359,6 +379,8 @@ soup_auth_digest_compute_response (const char        *method,
+ 	if (qop) {
+ 		char tmp[9];
+ 
++                g_assert (cnonce);
++
+ 		g_snprintf (tmp, 9, "%.8x", nc);
+ 		g_checksum_update (checksum, (guchar *)tmp, strlen (tmp));
+ 		g_checksum_update (checksum, (guchar *)":", 1);
+@@ -422,6 +444,9 @@ soup_auth_digest_get_authorization (SoupAuth *auth, SoupMessage *msg)
+ 	g_return_val_if_fail (uri != NULL, NULL);
+ 	url = soup_uri_to_string (uri, TRUE);
+ 
++        g_assert (priv->nonce);
++        g_assert (!priv->qop || priv->cnonce);
++
+ 	soup_auth_digest_compute_response (msg->method, url, priv->hex_a1,
+ 					   priv->qop, priv->nonce,
+ 					   priv->cnonce, priv->nc,
+diff --git a/tests/auth-test.c b/tests/auth-test.c
+index dfc6b09..6fb1e4a 100644
+--- a/tests/auth-test.c
++++ b/tests/auth-test.c
+@@ -1550,16 +1550,17 @@ do_cancel_after_retry_test (void)
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
+@@ -1582,8 +1583,8 @@ do_missing_realm_test (void)
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
+@@ -1625,7 +1626,9 @@ main (int argc, char **argv)
+ 	g_test_add_func ("/auth/async-message-do-not-use-auth-cache", do_async_message_do_not_use_auth_cache_test);
+ 	g_test_add_func ("/auth/authorization-header-request", do_message_has_authorization_header_test);
+ 	g_test_add_func ("/auth/cancel-after-retry", do_cancel_after_retry_test);
+-        g_test_add_func ("/auth/missing-realm", do_missing_realm_test);
++        g_test_add_data_func ("/auth/missing-params/realm", "Digest qop=\"auth\"", do_missing_params_test);
++        g_test_add_data_func ("/auth/missing-params/nonce", "Digest realm=\"auth-test\", qop=\"auth,auth-int\", opaque=\"5ccc069c403ebaf9f0171e9517f40e41\"", do_missing_params_test);
++        g_test_add_data_func ("/auth/missing-params/nonce-md5-sess", "Digest realm=\"auth-test\", qop=\"auth,auth-int\", opaque=\"5ccc069c403ebaf9f0171e9517f40e41\" algorithm=\"MD5-sess\"", do_missing_params_test);
+ 
+ 	ret = g_test_run ();
+ 
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
new file mode 100644
index 0000000000..ab0f650804
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
@@ -0,0 +1,26 @@
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Fri, 27 Dec 2024 13:52:52 -0600
+Subject: auth-digest: Fix leak
+
+(cherry picked from commit ea16eeacb052e423eb5c3b0b705e5eab34b13832)
+
+Upstream-Status: Backport [import from debian https://salsa.debian.org/gnome-team/libsoup/-/blob/debian/bullseye/debian/patches/CVE-2025-32910-3.patch?ref_type=heads
+Upstream commit https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b705e5eab34b13832]
+CVE: CVE-2025-32910
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-auth-digest.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index 393adb6..a1db188 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -66,6 +66,7 @@ soup_auth_digest_finalize (GObject *object)
+ 	g_free (priv->nonce);
+ 	g_free (priv->domain);
+ 	g_free (priv->cnonce);
++        g_free (priv->opaque);
+ 
+ 	memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
+ 	memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index f04d9b2966..517a8e4539 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -23,6 +23,9 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32906-2.patch \
            file://CVE-2025-32909.patch \
            file://CVE-2025-46420.patch \
+           file://CVE-2025-32910-1.patch \
+           file://CVE-2025-32910-2.patch \
+           file://CVE-2025-32910-3.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.43.0


