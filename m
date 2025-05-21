Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F782C54E65
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:53:37 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.7383.1747821215357992079
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 02:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Pm6HJvTI;
 spf=pass (domain: mvista.com, ip: 209.85.210.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso5782644b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 02:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1747821214; x=1748426014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gVVk8cM47L0jz6xPkCs8CguKMIMEzrT6AHhT1hpBGHQ=;
        b=Pm6HJvTIWqyJwlQQSge4SclZiIVHxX+uVyVq8RanBrc37MO6nIZyKUA+G1GJbHYxSM
         oe4G/8nfiytAzo+kWk9iEHfkDtrHrOpareyTzkKRSwyLF71nF2wtj4uAL0eTRqljonR6
         6flL17uOu52D+PGxIu90v5Kqh+IniljH+fp+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747821214; x=1748426014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gVVk8cM47L0jz6xPkCs8CguKMIMEzrT6AHhT1hpBGHQ=;
        b=l54hCLTRl+hkdPHSf08B06wd4iRY8jznKJOgRz/9WVIOEdTymTjAqzaUT5oQT7A0lX
         vigsKGH7mS0EeMvyMZ1D6CXK0Xf2fqIYbZrLxwyFN9sF39kGok2YP2lDxZAcXw7osyQA
         5pVsg40hNPufRmJklaH0iLo1jE06OCn2hKBZm4d7s8xVFuCOHzoRwc1SApkOBMjB3c/l
         JS3uFyog0DkBsNnyWlAqQh2jJipYLNHB3Qn0Lsk7SAe7Qvxs8ULBveoWKoHCmbaxF0zJ
         DZEP79Ay2E+P+64ZJyDMgMM1Vk6OCYQEgYcQZ0Aa0jVCnLfgObAY1VnDHUQynLWWulN0
         16yg==
X-Gm-Message-State: AOJu0YwNnTZ9orHSc+79iTx2RZhewpqVkxQH/aS5es/+y5ko8aLRhFUa
	p19wnnNaGD0JH6qhe4Yv67ljzsODFE0VnuvOc2K5mWZa25nUJBDfA5huZqfH2u1gecYAcOFQcVB
	txfDjbgE=
X-Gm-Gg: ASbGncsRzTfldJbJwxl96XsP9CYnJLkdP6o0uCEYjAnv9AUGueLqNtBkz0uA6vwKboD
	b94swVERWP8YH9/n6UjPLKwThRcAGp9r+X1o+Ub/BBXxzJiXzE4Gguhz9gWprL67W024TCGi+2D
	sYWTL0meHR05B3BcP7Iz0kEsRNYy0N69c48y06hiV3XFIC8Azg3pt/YmQBwsvIV6EU/rGWhg4lU
	s4yXpXuqCJVXV/Mi0qszVNXxC3ACn3v6CgmXS6LJZtHp8+rJ0UQ9J3omLX8Z29VER5SRTU+vih9
	gBCLEMC69peD4V69lAawtnOjOprEKciA9ErHX4dwugUokOh+sNxOlRsiMUiSMhQ=
X-Google-Smtp-Source: AGHT+IFHwu9wHGh1h44sXs0Q5s57qELe2mPYQt0G8XYTFsoCy7q6hDakY5tU26ISpi5YVQLr+B4Iug==
X-Received: by 2002:a05:6a00:3985:b0:742:a334:466a with SMTP id d2e1a72fcca58-742a97eb677mr27931717b3a.12.1747821214137;
        Wed, 21 May 2025 02:53:34 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.212.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829cb7sm9241325b3a.111.2025.05.21.02.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 02:53:33 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH 1/4] libsoup-2.4: Fix CVE-2025-32910
Date: Wed, 21 May 2025 15:23:21 +0530
Message-Id: <20250521095324.92028-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 09:53:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217012

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
---
 .../libsoup-2.4/CVE-2025-32910-1.patch        |  97 ++++++++++++
 .../libsoup-2.4/CVE-2025-32910-2.patch        | 148 ++++++++++++++++++
 .../libsoup-2.4/CVE-2025-32910-3.patch        |  26 +++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   3 +
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index fa4dece0e9..b27c56895b 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -23,6 +23,9 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32906-2.patch \
            file://CVE-2025-32909.patch \
            file://CVE-2025-46420.patch \
+           file://CVE-2025-32910-1.patch \
+           file://CVE-2025-32910-2.patch \
+           file://CVE-2025-32910-3.patch \
           "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.25.1


