Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02E0C61DE5
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:33 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3056.1787945905626986153
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MFabPx42;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so15266015e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945904; x=1788550704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0XTUxqvfXixoFtatcwWloyTTHk3MZRQmJRoaaMee/KM=;
        b=MFabPx42V8d+iith9LcJGZ5TQbS35olQ64DcK2Ui2BnN2zNx35rJXKGQ6ATqTWNS7V
         54FVNHo5WAIuJLAq+QQ8CLR69JOBn6hOUYWz70KCK7xm5sP/6HZ6+S7ZkR+dfrlXwkB0
         QDCBY+82rC8TMf/nqQ627CkL/+tC9QBEpH860=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945904; x=1788550704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0XTUxqvfXixoFtatcwWloyTTHk3MZRQmJRoaaMee/KM=;
        b=K3iK3ZNWDpI1gm5s9irlw2Ze+kqB96U3I3XkqUC/UmhgTwXIJ/79p8MvpQtteZxq3p
         ADqYNwDu6wDyX/USfCFnQ4aEi492oTqnkYey4oeatdJEO1sKzcZM7Iv+p2eAJ9nZz4L5
         KmQjalPPf+iRi1UlwUbFOoHxqjMr2JtcU1zIlweAsbdTkdNBrnLYZ6d/ZVls+DsBns9c
         vnRgyXx2VZrwg9Z67gMvnDx2SRW0QjO2W1iIajc0VEitpziEQZpRj77CidVgdt0w5Hwt
         OlY1Kq5xsSBynvMw0LaXcQr2iFhxyYdE2DJi7aergeAsyyTNNMYCa/MbnRqeGXrj9Rdb
         yC1Q==
X-Gm-Message-State: AFuF++luqh+lgDnhBfesEb7F1awO3wFDfmDPDNEvNwkonirwtrp7hoES
	z/Vz79sAzqsd2FCPGfTvRgx1wrsGXfozcpn9PmltgU1w/159ImQlKeD64OxdlCDSgdjcKzYTUE2
	M4hheKL4=
X-Gm-Gg: AR+sD13uNENZFSZagulPX4f28ZYrMC4srlu0MUl5+Ee7Gr2s2gqywDy1Qw071R4y823
	0dPR6nTHp5wZ06A8lHQn8HLtmIGNq5NPywzHzqcDARPzjtJh5KKRYOYaJVbfpWreYeN19f/9xQO
	diiX+GA391ZWPwtMlKFUHSv9+7JO3a9UUlhCMZhc2beQHf97w9e4yQ9U/45lXRmQ9ekTlAkBEjb
	VhVkWgTxbG5PYuSI4rA9BVWCqO9zUPZjdYfez0Bgebqkbn/jwA1ZRnw6zb21tJGRUGetBFQ9p1a
	3ur5ndIGU3kc7jWVAbZguJdhrJX/69Xsb2gmi9b0uVCWXXsAyfBE3NdWdXbJrmPgmeW1ZhoxIZL
	DbE24pvAw0KcARaW4bzXb8oNqRKheJGU+m1vH4qAp4NtHMAiX6jnjHU7Nj3AGrRub0/UMDwqGdQ
	ze3uAdfxWjv64dd3kBEiTj7KOzro+EpRuiinSqq91c3BlGJqduxfaCKP21sxRnkCtlPiAHPMDfu
	5GrK1RvGkHB23tKxiLViZvKH94kIejSvQfb9WBEUbIB0zvSXP71pu7keQlf/jqz
X-Received: by 2002:a05:600c:8411:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-49b91c279e1mr161136475e9.8.1787945903751;
        Fri, 28 Aug 2026 12:38:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 34/56] libsoup: patch CVE-2026-4271
Date: Fri, 28 Aug 2026 21:35:44 +0200
Message-ID: <517478a21511355cef67919217ec08e10b95ee90.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244595

From: Peter Marko <peter.marko@siemens.com>

Pick patch which has closed gitlab issue for the CVE [1].
The issue is also referenced in [2]

[1] https://gitlab.gnome.org/GNOME/libsoup/-/work_items/496
[2] https://security-tracker.debian.org/tracker/CVE-2026-4271

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 704a1cd0b88ddea0fa790054c3752e82d3d4403d)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libsoup/libsoup/CVE-2026-4271.patch       | 362 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.6.6.bb |   1 +
 2 files changed, 363 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2026-4271.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2026-4271.patch b/meta/recipes-support/libsoup/libsoup/CVE-2026-4271.patch
new file mode 100644
index 00000000000..ca377e03553
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2026-4271.patch
@@ -0,0 +1,362 @@
+From 489affa74c8a229b8a4dd541710d4a5debedb7b4 Mon Sep 17 00:00:00 2001
+From: Carlos Garcia Campos <cgarcia@igalia.com>
+Date: Mon, 16 Feb 2026 12:09:08 +0100
+Subject: [PATCH] server: protect message io while reading and writing
+
+Ensure the nghttp2 session is not destroyed while being used.
+
+Closes #496
+
+CVE: CVE-2026-4271
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/489affa74c8a229b8a4dd541710d4a5debedb7b4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ .../http2/soup-server-message-io-http2.c      | 117 +++++++++++++-----
+ tests/http2-test.c                            |  54 ++++++++
+ 2 files changed, 141 insertions(+), 30 deletions(-)
+
+diff --git a/libsoup/server/http2/soup-server-message-io-http2.c b/libsoup/server/http2/soup-server-message-io-http2.c
+index 913afb46..6f8d1bb6 100644
+--- a/libsoup/server/http2/soup-server-message-io-http2.c
++++ b/libsoup/server/http2/soup-server-message-io-http2.c
+@@ -69,6 +69,8 @@ typedef struct {
+         GHashTable *messages;
+ 
+         guint in_callback;
++        guint protected;
++        gboolean destroyed;
+ } SoupServerMessageIOHTTP2;
+ 
+ static void soup_server_message_io_http2_send_response (SoupServerMessageIOHTTP2 *io,
+@@ -146,6 +148,8 @@ soup_server_message_io_http2_destroy (SoupServerMessageIO *iface)
+ {
+         SoupServerMessageIOHTTP2 *io = (SoupServerMessageIOHTTP2 *)iface;
+ 
++        io->destroyed = TRUE;
++
+         if (io->read_source) {
+                 g_source_destroy (io->read_source);
+                 g_source_unref (io->read_source);
+@@ -160,10 +164,14 @@ soup_server_message_io_http2_destroy (SoupServerMessageIO *iface)
+         }
+ 
+         g_clear_object (&io->iostream);
+-        g_clear_pointer (&io->session, nghttp2_session_del);
+-        g_clear_pointer (&io->messages, g_hash_table_unref);
++        io->istream = NULL;
++        io->ostream = NULL;
+ 
+-        g_free (io);
++        if (io->protected == 0) {
++                g_clear_pointer (&io->session, nghttp2_session_del);
++                g_clear_pointer (&io->messages, g_hash_table_unref);
++                g_free (io);
++        }
+ }
+ 
+ static void
+@@ -321,7 +329,33 @@ static const SoupServerMessageIOFuncs io_funcs = {
+         soup_server_message_io_http2_is_paused
+ };
+ 
++static void
++soup_server_message_io_http2_protect (SoupServerMessageIOHTTP2 *io)
++{
++        io->protected++;
++        g_object_ref (io->conn);
++}
++
+ static gboolean
++soup_server_message_io_http2_unprotect (SoupServerMessageIOHTTP2 *io)
++{
++        g_object_unref (io->conn);
++
++        if (--io->protected > 0)
++                return FALSE;
++
++        if (io->destroyed) {
++                g_clear_pointer (&io->session, nghttp2_session_del);
++                g_clear_pointer (&io->messages, g_hash_table_unref);
++                g_free (io);
++
++                return TRUE;
++        }
++
++        return FALSE;
++}
++
++static void
+ io_write (SoupServerMessageIOHTTP2 *io,
+           GError                  **error)
+ {
+@@ -336,51 +370,57 @@ io_write (SoupServerMessageIOHTTP2 *io,
+                 if (io->write_buffer_size == 0) {
+                         /* Done */
+                         io->write_buffer = NULL;
+-                        return TRUE;
++                        return;
+                 }
+         }
+ 
++        if (!io->ostream)
++                return;
++
+         gssize ret = g_pollable_stream_write (io->ostream,
+                                               io->write_buffer + io->written_bytes,
+                                               io->write_buffer_size - io->written_bytes,
+                                               FALSE, NULL, error);
+-        if (ret < 0)
+-                return FALSE;
+-
+-        io->written_bytes += ret;
+-        return TRUE;
++        if (ret > 0)
++                io->written_bytes += ret;
+ }
+ 
+ static gboolean
+ io_write_ready (GObject                  *stream,
+                 SoupServerMessageIOHTTP2 *io)
+ {
+-        SoupServerConnection *conn = io->conn;
+         GError *error = NULL;
+ 
+-        g_object_ref (conn);
++        soup_server_message_io_http2_protect (io);
++
++        while (!error) {
++                if (io->destroyed)
++                        break;
++
++                if (!nghttp2_session_want_write (io->session))
++                        break;
+ 
+-        while (!error && soup_server_connection_get_io_data (conn) == (SoupServerMessageIO *)io && nghttp2_session_want_write (io->session))
+                 io_write (io, &error);
++        }
+ 
+         if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_WOULD_BLOCK)) {
+                 g_error_free (error);
+-                g_object_unref (conn);
++                soup_server_message_io_http2_unprotect (io);
+                 return G_SOURCE_CONTINUE;
+         }
+ 
+-        if (soup_server_connection_get_io_data (conn) == (SoupServerMessageIO *)io) {
++        if (!io->destroyed) {
+                 if (error)
+                         h2_debug (io, NULL, "[SESSION] IO error: %s", error->message);
+ 
+                 g_clear_pointer (&io->write_source, g_source_unref);
+ 
+                 if (error || (!nghttp2_session_want_read (io->session) && !nghttp2_session_want_write (io->session)))
+-                        soup_server_connection_disconnect (conn);
++                        soup_server_connection_disconnect (io->conn);
+         }
+ 
+         g_clear_error (&error);
+-        g_object_unref (conn);
++        soup_server_message_io_http2_unprotect (io);
+ 
+         return G_SOURCE_REMOVE;
+ }
+@@ -390,13 +430,12 @@ static gboolean io_write_idle_cb (SoupServerMessageIOHTTP2* io);
+ static void
+ io_try_write (SoupServerMessageIOHTTP2 *io)
+ {
+-        SoupServerConnection *conn = io->conn;
+         GError *error = NULL;
+ 
+         if (io->write_source)
+                 return;
+ 
+-        if (io->in_callback && soup_server_connection_get_io_data (conn) == (SoupServerMessageIO *)io) {
++        if (io->in_callback && !io->destroyed) {
+                 if (!nghttp2_session_want_write (io->session))
+                         return;
+ 
+@@ -416,12 +455,19 @@ io_try_write (SoupServerMessageIOHTTP2 *io)
+                 g_clear_pointer (&io->write_idle_source, g_source_unref);
+         }
+ 
+-        g_object_ref (conn);
++        soup_server_message_io_http2_protect (io);
++
++        while (!error) {
++                if (io->destroyed)
++                        break;
++
++                if (!nghttp2_session_want_write (io->session))
++                        break;
+ 
+-        while (!error && soup_server_connection_get_io_data (conn) == (SoupServerMessageIO *)io && !io->in_callback && nghttp2_session_want_write (io->session))
+                 io_write (io, &error);
++        }
+ 
+-        if (soup_server_connection_get_io_data (conn) == (SoupServerMessageIO *)io) {
++        if (!io->destroyed) {
+                 if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_WOULD_BLOCK)) {
+                         g_clear_error (&error);
+                         io->write_source = g_pollable_output_stream_create_source (G_POLLABLE_OUTPUT_STREAM (io->ostream), NULL);
+@@ -434,11 +480,11 @@ io_try_write (SoupServerMessageIOHTTP2 *io)
+                         h2_debug (io, NULL, "[SESSION] IO error: %s", error->message);
+ 
+                 if (error || (!nghttp2_session_want_read (io->session) && !nghttp2_session_want_write (io->session)))
+-                        soup_server_connection_disconnect (conn);
++                        soup_server_connection_disconnect (io->conn);
+         }
+ 
+         g_clear_error (&error);
+-        g_object_unref (conn);
++        soup_server_message_io_http2_unprotect (io);
+ }
+ 
+ static gboolean
+@@ -481,31 +527,37 @@ static gboolean
+ io_read_ready (GObject                  *stream,
+                SoupServerMessageIOHTTP2 *io)
+ {
+-        SoupServerConnection *conn = io->conn;
+         gboolean progress = TRUE;
+         GError *error = NULL;
+ 
+-        g_object_ref (conn);
++        soup_server_message_io_http2_protect (io);
++
++        while (progress) {
++                if (io->destroyed)
++                        break;
++
++                if (!nghttp2_session_want_read (io->session))
++                        break;
+ 
+-        while (progress && soup_server_connection_get_io_data (conn) == (SoupServerMessageIO *)io && nghttp2_session_want_read (io->session))
+                 progress = io_read (io, &error);
++        }
+ 
+         if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_WOULD_BLOCK)) {
+                 g_error_free (error);
+-                g_object_unref (conn);
++                soup_server_message_io_http2_unprotect (io);
+                 return G_SOURCE_CONTINUE;
+         }
+ 
+-        if (soup_server_connection_get_io_data (conn) == (SoupServerMessageIO *)io) {
++        if (!io->destroyed) {
+                 if (error)
+                         h2_debug (io, NULL, "[SESSION] IO error: %s", error->message);
+ 
+                 if (error || (!nghttp2_session_want_read (io->session) && !nghttp2_session_want_write (io->session)))
+-                        soup_server_connection_disconnect (conn);
++                        soup_server_connection_disconnect (io->conn);
+         }
+ 
+         g_clear_error (&error);
+-        g_object_unref (conn);
++        soup_server_message_io_http2_unprotect (io);
+ 
+         return G_SOURCE_REMOVE;
+ }
+@@ -931,5 +983,10 @@ soup_server_message_io_http2_new (SoupServerConnection  *conn,
+         nghttp2_submit_settings (io->session, NGHTTP2_FLAG_NONE, settings, G_N_ELEMENTS (settings));
+         io_try_write (io);
+ 
++#ifdef __clang_analyzer__
++        // Suppress false positive about io being destroyed here, since at this point we have only
++        // send the initial settings and not callback is called.
++        [[clang::suppress]]
++#endif
+         return (SoupServerMessageIO *)io;
+ }
+diff --git a/tests/http2-test.c b/tests/http2-test.c
+index 0846a0a6..d12b4bf7 100644
+--- a/tests/http2-test.c
++++ b/tests/http2-test.c
+@@ -1268,6 +1268,40 @@ do_broken_pseudo_header_test (Test *test, gconstpointer data)
+ 	g_uri_unref (uri);
+ }
+ 
++static void
++disconnect_on_got_headers (SoupServerMessage *msg, gpointer user_data)
++{
++        GUri *uri;
++        SoupServerConnection *conn;
++
++        uri = soup_server_message_get_uri (msg);
++        if (!g_str_equal (g_uri_get_path (uri), "/close-on-got-headers"))
++                return;
++
++        conn = soup_server_message_get_connection (msg);
++        soup_server_connection_disconnect (conn);
++}
++
++static void
++do_server_disconnect_on_got_headers_test (Test *test, gconstpointer data)
++{
++        SoupMessage *msg;
++        GUri *uri;
++        GBytes *response;
++        GError *error = NULL;
++
++        uri = g_uri_parse_relative (base_uri, "/close-on-got-headers", SOUP_HTTP_URI_FLAGS, NULL);
++        msg = soup_message_new_from_uri (SOUP_METHOD_GET, uri);
++
++        response = soup_test_session_async_send (test->session, msg, NULL, &error);
++        g_assert_error (error, G_IO_ERROR, G_IO_ERROR_PARTIAL_INPUT);
++
++        g_clear_error (&error);
++        g_bytes_unref (response);
++        g_object_unref (msg);
++        g_uri_unref (uri);
++}
++
+ static gboolean
+ unpause_message (SoupServerMessage *msg)
+ {
+@@ -1396,12 +1430,26 @@ server_handler (SoupServer        *server,
+                 shutdown (fd, SHUT_WR);
+ #endif
+ 
++                soup_server_message_set_response (msg, "text/plain",
++                                                  SOUP_MEMORY_STATIC,
++                                                  "Success!", 8);
++        } else if (strcmp (path, "/close-on-got-headers") == 0) {
+                 soup_server_message_set_response (msg, "text/plain",
+                                                   SOUP_MEMORY_STATIC,
+                                                   "Success!", 8);
+         }
+ }
+ 
++static void
++server_request_started (SoupServer           *server,
++                        SoupServerMessage    *msg,
++                        SoupServerConnection *conn,
++                        gpointer              user_data)
++{
++        g_signal_connect (msg, "got-headers",
++                          G_CALLBACK (disconnect_on_got_headers), NULL);
++}
++
+ static gboolean
+ server_basic_auth_callback (SoupAuthDomain    *auth_domain,
+                             SoupServerMessage *msg,
+@@ -1428,6 +1476,8 @@ main (int argc, char **argv)
+                 return 0;
+ 
+         server = soup_test_server_new (SOUP_TEST_SERVER_IN_THREAD | SOUP_TEST_SERVER_HTTP2);
++        g_signal_connect (server, "request-started",
++                          G_CALLBACK (server_request_started), NULL);
+         auth = soup_auth_domain_basic_new ("realm", "http2-test",
+                                            "auth-callback", server_basic_auth_callback,
+                                            NULL);
+@@ -1584,6 +1634,10 @@ main (int argc, char **argv)
+                     setup_session,
+                     do_broken_pseudo_header_test,
+                     teardown_session);
++        g_test_add ("/http2/server-disconnect-on-got-headers", Test, NULL,
++                    setup_session,
++                    do_server_disconnect_on_got_headers_test,
++                    teardown_session);
+ 
+ 	ret = g_test_run ();
+ 
diff --git a/meta/recipes-support/libsoup/libsoup_3.6.6.bb b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
index d18a16379b3..e5c2d18ded7 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.6.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
@@ -20,6 +20,7 @@ SRC_URI += "file://CVE-2025-32049-1.patch \
             file://CVE-2026-1539.patch \
             file://CVE-2026-5119.patch \
             file://CVE-2026-2708.patch \
+            file://CVE-2026-4271.patch \
 "
 
 PROVIDES = "libsoup-3.0"

