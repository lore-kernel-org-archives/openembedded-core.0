Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3381EC3ABDD
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 19:08:34 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.84919.1747163312731938935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 12:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ADaFt0ly;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7423df563d6so4775835b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 12:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747163312; x=1747768112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKHbFvYa4jrMmqLE1HMEGpGDSjIRXbAKa5krt89Vb78=;
        b=ADaFt0lyRRBLg4wFMW1dfXRAGfNuglz17wq/Gwdn1S9aP5PYsCyTQpQ3uFU8L2CVky
         bjOaBK+7xJhEb108c4jDlzFwC1KNc/A1Y4aUSaodEbdIGW+SqLFmcFsPOGyCjVF4ox3J
         RrL8urSuAayIx6QbmWt062CrSLQi3qMITFkPqRufbjtH2kkCSYXdfs8BiV1SmmI1zESM
         gGF58pCrhYfSCqLJaeRV0Gspr6euaNrTe/sEPQsV/XBhpbqlnRWQ7l5htcd/YDK5orDV
         dHluYYm5yGctnGfC7fpriW1UeRgqiyNbCh2fteMAVGkQLMMGr24w46JoH2IOGL8u6qH6
         Pnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747163312; x=1747768112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKHbFvYa4jrMmqLE1HMEGpGDSjIRXbAKa5krt89Vb78=;
        b=jRlrLy3X401hjzAr07iypT8K6LYaTPaeu669LQ+Pg4uuTAStu+U++VE/ym7k7mZJvO
         qZf/3O610xoRPF43KYyLGRN2amGLyDAWZIhISxm2hP60tp4R9PkqTUveQYmGgymJtIOR
         kAP2pRbXoEv3ks7Z+pkaqKSiYy7EU98+i0liJiFD+gQWq/FqC9bCz/GuOjAgBW5RQ4BK
         iCVHBJQ5C8uKQw1+Z0GP6qOjJBwsL6fIBIRvyLa0VyGuVvtzU3Wb6irzYtTyofTmEYKb
         pA/f545n49kqhUhASji+uStf5IqkIx6lMIqx5iMldTz00lhuzsQJpWUtOI2MFrAhZJ/w
         bXBw==
X-Gm-Message-State: AOJu0Yz1QuyCX4pFSl5Rr9xvCnH8HG3QSF4B3wDioTyqLTJSFRoOpVii
	H4RN3h2D4BPKkcz/YcojQBxhcIfcWzRoF92gE/T1EG45RiMb76LWXN9efABuR19vEm3bvak8YO5
	N
X-Gm-Gg: ASbGncth9GP4jjReZweHSx5onrdy+jlxiMZ3g7Z2w9UlNy+QhPPx3F3eqT7KBluyEe9
	d2iGxdfBy1h2JVfgMLJi5ce2kjEn+YN1OEkWQH1zs1wPCCFlCKjnMFwNO8rRNCHP8E/8A8f3icb
	x7vA9pE19sVp3ujYiop7ZD9D6RQ9zV5fofqln5pTFixcssI8M/twfucc42gi2IFRq4nMxUoGmHF
	ajX117dHEFZ6fDHSj1PclJOt1u0yiWXS8GYrZ0IAVhKjtfNeCUQRLykbiGQn0naPVspmb6zFSOS
	cPv6I+TgQnLBOFN/I2Jhcy8NalW8dRU5TPaTWmL5CRg=
X-Google-Smtp-Source: AGHT+IGdUyJsV4JafJ4K0IDUPSLngvI0eWCQpZbwCvYEgEZmSShU6awcR0/+ew/xyf4OrWnY1WDQ3Q==
X-Received: by 2002:a17:903:3c70:b0:22e:4c98:cd8b with SMTP id d9443c01a7336-231980c96ecmr8373855ad.3.1747163311764;
        Tue, 13 May 2025 12:08:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:37ec:faaf:5b57:6b2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829d425sm84851005ad.202.2025.05.13.12.08.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 12:08:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/15] libsoup: Fix CVE-2025-32910
Date: Tue, 13 May 2025 12:08:05 -0700
Message-ID: <aeaa106595f173f5646a17adb413a85e0d01887e.1747163155.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747163155.git.steve@sakoman.com>
References: <cover.1747163155.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 19:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216441

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/e40df6d48a1cbab56f5d15016cc861a503423cfe
&
https://gitlab.gnome.org/GNOME/libsoup/-/commit/405a8a34597a44bd58c4759e7d5e23f02c3b556a
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/ea16eeacb052e423eb5c3b0b705e5eab34b13832

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


