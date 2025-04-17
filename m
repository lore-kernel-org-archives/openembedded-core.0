Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DFAC369D2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 14:04:48 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.9756.1744898680737865271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 07:04:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=H2EgXRuy;
 spf=pass (domain: mvista.com, ip: 209.85.210.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7369ce5d323so677210b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 07:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744898679; x=1745503479; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qJrFfrNkkdI/tRnHSRQ6+TkmK7mUJXHrJ124RRbxSZ0=;
        b=H2EgXRuyCWmNau8IHwzDpxK5lRK4Ez0tp2NigdDcPUtiEA2Mv17Sbk1RYjjspcQWOh
         dnRWOLpkwa+VB+ugAXyKm4eDTjeG+QW38ZEoPkcQaKvGJIRTrWLvSBOGEfQie8ezqz+z
         ErAQM8KLUREAJRlIzcW80rFjO23QGVORR7pKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744898679; x=1745503479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJrFfrNkkdI/tRnHSRQ6+TkmK7mUJXHrJ124RRbxSZ0=;
        b=DwMLvdu5nuTU7f73ssPrVyPMCG8dI04P1ywdaBlD/G/zvvZ/wdIMutjnY9Gg30+SVt
         xbENW7xyupQ7kU2pcYQzaitILAS8hbqDEzpVOSA9NdX9Pg9yuYEC3WcYNwlzeGLJY3v5
         izWTvzLV2zSDtNd1MTUufpMyPY80M9CtoZavEvyyItV2oFIOIF0rl0YENIODHpRRQ0pH
         QDoOX70ooyb7wZeqXs4PSjO22nEr4dPN0smIRvA6BK0Uau/s9SRgINgGqgV98myM2iYm
         SFZtEvdlSQHvDUJqzNbHryWn/Tcfi4lbvJs+ueOmYjhbCvX+E+cG984Z/GyCf38r2QZ4
         5mUg==
X-Gm-Message-State: AOJu0YzFEuKVwz7V13HTxzaMd4C8YwQ1mwmbL7zgrsJV1sh2sXNiyMv6
	Hx7/Y4yvVlDy3/wzuHPHr7/3YAI2UPaZb9HOeuVTkAlgWUBdfHt8lvG98XxqNoub/7YL962t/P5
	NX6E=
X-Gm-Gg: ASbGncvpbpc6vVB4NgqKCPE0MILftjn9fDCnlBh47HM2bzxhq7LRUolKlKITwAUwmhr
	M/u5NPjC919gR6Gg3MHLl2NsSKfE0yYV4ZSHVAJHgBXmALrRcc7YF4fuM7Tc0W44ERdlzp/i+GF
	hQegyJ1yoC6hMi67iCoFUXivIma+H0rnB89vLPal0oNQFMIYunuggenOlZeJsj8U8J2mOdb1n7T
	JGvpxTuF2/FShjx/0BwfmtXspr4+Ncv1GfP+l7QKz9wzKyAiuU3TEU4JJ8KNrg8RHQTYS6VW0po
	wBFE5p7IdPXZJ4w6BzsVMIZ+Wxe+T4+zXDePpOxjXw4S2Apn0HfH
X-Google-Smtp-Source: AGHT+IHWT3vzTVE33lZ4zR66jmhXix7Xp/NfeXoZ9bsikmrC3WpkQtJgJGVuDlvNxJ40QDeIqtBPaA==
X-Received: by 2002:a05:6a00:328a:b0:736:32d2:aa93 with SMTP id d2e1a72fcca58-73c267fdc02mr9630746b3a.20.1744898679161;
        Thu, 17 Apr 2025 07:04:39 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.223.203])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73db4717bfasm1127812b3a.129.2025.04.17.07.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:04:38 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH v3 1/5] libsoup: Fix CVE-2025-32910
Date: Thu, 17 Apr 2025 19:34:25 +0530
Message-Id: <20250417140429.136534-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 14:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215079

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/e40df6d48a1cbab56f5d15016cc861a503423cfe
&
https://gitlab.gnome.org/GNOME/libsoup/-/commit/405a8a34597a44bd58c4759e7d5e23f02c3b556a
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b705e5eab34b13832

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup-3.4.4/CVE-2025-32910-1.patch      |  98 ++++++++++++
 .../libsoup-3.4.4/CVE-2025-32910-2.patch      | 149 ++++++++++++++++++
 .../libsoup-3.4.4/CVE-2025-32910-3.patch      |  27 ++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   3 +
 4 files changed, 277 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910-3.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910-1.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910-1.patch
new file mode 100644
index 0000000000..27011f587f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910-1.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910-2.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910-2.patch
new file mode 100644
index 0000000000..b62e09cbdb
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910-2.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910-3.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910-3.patch
new file mode 100644
index 0000000000..32e0c86e62
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32910-3.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index b2e32b892a..80cbbdf8ea 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -18,6 +18,9 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52531-1.patch \
            file://CVE-2024-52531-2.patch \
            file://CVE-2024-52531-3.patch \
+           file://CVE-2025-32910-1.patch \
+           file://CVE-2025-32910-2.patch \
+           file://CVE-2025-32910-3.patch \
           "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.25.1


