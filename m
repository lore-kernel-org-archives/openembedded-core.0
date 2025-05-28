Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC83C5B552
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 14:43:28 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.17460.1748443403567543611
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 07:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GlgWsxnW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2301ac32320so40147255ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 07:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748443403; x=1749048203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WcV6RXVl2W/k8OYrFCz9d9PsMuwv9JO1cGtQOucJn9o=;
        b=GlgWsxnWHpktqJxVmwrbxi0Q0lstqMeipojov+mAuqoPUt05W9b/5i+VlbK/sPLQtb
         5Oq1IUCvlMYh1oLzKLYTLJyuAWMtNI+IB6h9prrscLZtnCLUi+sPsnOXA+VYUaQw3ZuV
         YYU9djZ+tvtLZbd3EgfxQIwikehPPPfVYXPnM/+fMmbclQEtU2xuAQ6lewbUlyrmbis0
         CiWRQ1UP83oB2ZH6+WRkOmQ/JVdgdvrl08PYjq3DTs7HbZQqIzgbXjWzcj9pC1y1hhcU
         eWPvKOZDZspNZgjMl94GdJKf2HtNbvs1w1mAGUhxdzbR4ZWzTA5Aoa3okgFWUQfIBVZw
         QyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748443403; x=1749048203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WcV6RXVl2W/k8OYrFCz9d9PsMuwv9JO1cGtQOucJn9o=;
        b=UTVpWeZIeWANMG7CLP9MQ1tlqWIwuvUm4LUAbrKkmP/WWhr5F9OvpX/L+X4BGymOBz
         1MkQHXpGFLyCyAYbGYkzFjbu9bkbzVdOVFZ1538mTD5TT8BfTGyjtjD+S9vykGnCNLKz
         dbjVutpo/6rQ/lu436Qzu3oX1g1s51OESbVV2IkFlSkZnfUSEALK7afudRHdMPaOhrnB
         59OyVBlKrMXIj4PLOfVEppcLUVCUv9JfyISw8F4FVzLWcg7AcX/XTPXzIi5N5vMd05A/
         /Ymx0lkW5TKIeR3XxGGepCcmueKCIPD9HQgqzCD/rySUuJ551i1VUuQ6FQbeRfN05wV0
         wSIA==
X-Gm-Message-State: AOJu0YxE6drf/hvs3zj1R08Rrnq8ruGEmyW6S7IZjfK1aWzbz4ft+5jp
	QqmsMSu38CQuLNFoGIwuaJ+potsi7B/t093AhS5XpNvdOs2ZcL/Wqa3jT8P/sFI5+uOEbO1urJr
	/duha
X-Gm-Gg: ASbGncvLlb4TeNc45s0omeo5/F2ftMd8+KHdTqtBPbwqYFH88aEcYuADk08DP6q/BBe
	gDnEjzPwnwQGkFLJvzPtsq8bkKf8aUy9jKgUohUpexK7hrOcFiQEcCtL18ogaPVnwvWE0Ps8+Es
	QSE/gTjnKcAefSMo8wnhVRrQgYxkZAIOv16iMSEGo84ySgZtXXNl9vrHyB4xl8Pvb1j1kZd8944
	OAdRTOTwlRCFNEa4sht3f7iWicRv8h6UIw/lK+j3Har9S9LA7WdNTexYuIy8RUcOjHIfhqKyIvg
	AH5yoy6D0ffQdnM8zP63eaLMAEdqabw49Mecu7RzSLgdp9N1F2kKUQ==
X-Google-Smtp-Source: AGHT+IEfN+8WaTtmuk5+Ytb5dPgwBwFt3VIIM/XpJigds6KK0vzG2x1IpPpu0qtNTh/r0bIlFd5HGQ==
X-Received: by 2002:a17:903:230c:b0:231:ba23:c7e5 with SMTP id d9443c01a7336-23414f55ee4mr246568135ad.6.1748443402715;
        Wed, 28 May 2025 07:43:22 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d358f1e2sm12626285ad.140.2025.05.28.07.43.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:43:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/11] libsoup-2.4: Fix CVE-2025-32910
Date: Wed, 28 May 2025 07:43:04 -0700
Message-ID: <0fc936f23e6f70021acf4e711ef49d3a5cc966fe.1748443238.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748443238.git.steve@sakoman.com>
References: <cover.1748443238.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 14:43:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217353

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
2.43.0


