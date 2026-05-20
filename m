Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B76CD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:23 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7285.1779265273434684805
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UeC4kD0h;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so2658832f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265272; x=1779870072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1dWAkRMLSu5nmBvj/uNRxhgcQAz50lvshtcA5pA5eg=;
        b=UeC4kD0h24BDKy12Ifvv9uvpZY/HJGY80EdqBdD4km8qpDMm3frxM+q+UxxaEudCQD
         fGWYqvjdsUlwRa8CvGQOc9cn3Cz2pm7b5CwQUZEmnRpe/tjJdmXyicomJkL1l9qaIx/U
         Dt3i9O0oBIZExcuRM/6R5pyMBZRsEUHI/pKWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265272; x=1779870072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U1dWAkRMLSu5nmBvj/uNRxhgcQAz50lvshtcA5pA5eg=;
        b=lHUMepq2s7Bjx2Bp+E67+aLNhcRH8URPi9u0sXvo4enkzgiEE2YQxpSaLsWOU803vX
         p1WIvm6UdBuQWEB616VfAaZ14M+fXJCHi0GmSwtty5U1hSSsxQSFPfioGJhQbUPhgxE6
         ju2g6B/Sr2TsKPO9FwVJ5s51Tgl7rk+wmSwoRNI1mUZeNX+rJ+vzgi1x2sBQ5p7KlK6n
         fuG5bfl4l+24ZLWQ3L/3SDuC9Z0qm5/mk9RSZ6wLN5C4f2PN9c1M0Or2KEemAgV/Ootb
         VhDeCTI/UDfissJNT4hrl4eoZqY43I0YPDfKuX6KKZCqM3pJCnHU3rirVU6Cmm7UI6JS
         JSGA==
X-Gm-Message-State: AOJu0YykQDfqKRyngLM7Np3hNDaNJvTd2AWhY+6g/fYey7nm7zplmNVZ
	y+aaAS7ciuY8a3fs/sTe/PL9EOTtXmHKsS/DoFo9iJomrJerkRajYAG/OnMQ2A6t10gYk9mPGXa
	yXTFo
X-Gm-Gg: Acq92OHIq/gNhdZXqb61oWb/3XO9aCqu9PJYsbTzSATU9a0pyErFNBf/Gx+VxT6Ykni
	CKXwxVVhUF3i8nnQsakui5T91TypKY9TjtDF+A9J5GHg/jWicvQ3ek6PGwHNENVPYXg/X/3dgnU
	6iOgjwaJFtZHsSD5/5EY8fSIVn+vpkw8qVHcnV7LuRWhAy41hf8TWMeQOdaNBrW8zNuqlVlo4/W
	+jp4T+YDxP55PZ1uXltY64cSeeQYW6Hgvdo20fMDTS3mV2IaeoJD6G23M04ZT5MqUek1HiZFr2f
	ziqwn3ydA+ooxqD8zBQ1XBg8Bl+kbnMjIx8DJa9dZjI5G+FPR3+lKJDeRz/Q3wF1pdT7p1k7WPk
	dJGQhjP/svWikLhH8rclAVswKU8N7NgREvSAm4znz97EZNiX9N/ZxKVGGRhqO4dna/ioAhi8EYZ
	G5JlW/4gq3E5znk4mWefWQ4TJGaJDzLVJz+rBANuzwhdqHtK5+QzWG2tKNB1t9I8lpt8NCKOjNM
	+J00CkCa9cfbo+S5+GNKb5GONg4
X-Received: by 2002:a05:6000:2288:b0:43d:781d:37b9 with SMTP id ffacd0b85a97d-45e5c5ae8f2mr35071942f8f.42.1779265271640;
        Wed, 20 May 2026 01:21:11 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.21.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 18/28] libsoup: patch CVE-2026-2708
Date: Wed, 20 May 2026 10:20:19 +0200
Message-ID: <65e972685daf8cd1e962df9db94ccff98905aa12.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237417

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-2708

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7f84f2e79b23546001d8aa1e4f8b36a0097c769e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libsoup/libsoup/CVE-2026-2708.patch       | 218 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.6.6.bb |   1 +
 2 files changed, 219 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2026-2708.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2026-2708.patch b/meta/recipes-support/libsoup/libsoup/CVE-2026-2708.patch
new file mode 100644
index 00000000000..479a53ae212
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2026-2708.patch
@@ -0,0 +1,218 @@
+From e032d3e9b0a27d10597398023532dd8f9b6654cf Mon Sep 17 00:00:00 2001
+From: Carlos Garcia Campos <cgarcia@igalia.com>
+Date: Tue, 17 Feb 2026 16:39:26 +0100
+Subject: [PATCH] Do not allow adding multiple content length values to headers
+
+Closes #500
+
+CVE: CVE-2026-2708
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/e032d3e9b0a27d10597398023532dd8f9b6654cf]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libsoup/soup-message-headers.c | 27 ++++++++++++++
+ tests/header-parsing-test.c    | 50 +++++++++++++++++++++++++-
+ tests/server-test.c            | 64 ++++++++++++++++++++++++++++++++++
+ 3 files changed, 140 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index ca7719db..34cd2d8f 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -269,6 +269,33 @@ soup_message_headers_append_common (SoupMessageHeaders    *hdrs,
+                 return FALSE;
+         }
+ 
++        if (name == SOUP_HEADER_CONTENT_LENGTH) {
++                /* RFC 9110 - 7.7. Content-Length
++                 * If a message is received that has a Content-Length header field value consisting of
++                 * the same decimal value as a comma-separated list (Section 5.7.1) — for example,
++                 * "Content-Length: 42, 42" — indicating that duplicate Content-Length header fields have
++                 * been generated or combined by an upstream message processor, then the recipient must either
++                 * reject the message as invalid or replace the duplicated field values with a single valid
++                 * Content-Length field containing that decimal value prior to determining the message body
++                 * length or forwarding the message.
++                 */
++                const char *content_length = soup_message_headers_get_one_common (hdrs, SOUP_HEADER_CONTENT_LENGTH);
++                if (content_length) {
++                        guint64 decimal_value1, decimal_value2;
++                        char *end;
++
++                        decimal_value1 = g_ascii_strtoull (content_length, &end, 10);
++                        if (*end)
++                                return FALSE;
++
++                        decimal_value2 = g_ascii_strtoull (value, &end, 10);
++                        if (*end)
++                                return FALSE;
++
++                        return decimal_value1 == decimal_value2;
++                }
++        }
++
+         if (trusted_value == SOUP_HEADER_VALUE_UNTRUSTED && !is_valid_header_value (value)) {
+                 g_warning ("soup_message_headers_append: Rejecting bad value '%s'", value);
+                 return FALSE;
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
+index ebdc3246..5a3c92eb 100644
+--- a/tests/header-parsing-test.c
++++ b/tests/header-parsing-test.c
+@@ -368,6 +368,22 @@ static struct RequestTest {
+ 	  }, 0
+ 	},
+ 
++        { "Duplicate Content-Length with the same value", NULL,
++          "POST / HTTP/1.1\r\nContent-Length: 4\r\nContent-Length: 4\r\n",
++          -1,
++          SOUP_STATUS_OK,
++          "POST", "/", SOUP_HTTP_1_1,
++          { { "Content-Length", "4" } }, 0
++        },
++
++        { "Duplicate Content-Length with the same decimal value", NULL,
++          "POST / HTTP/1.1\r\nContent-Length: 04\r\nContent-Length: 4\r\n",
++          -1,
++          SOUP_STATUS_OK,
++          "POST", "/", SOUP_HTTP_1_1,
++          { { "Content-Length", "04" } }, 0
++        },
++
+ 	/************************/
+ 	/*** INVALID REQUESTS ***/
+ 	/************************/
+@@ -507,7 +523,16 @@ static struct RequestTest {
+ 	  NULL, NULL, -1,
+ 	  { { NULL } },
+ 	  G_LOG_LEVEL_WARNING
+-	}
++	},
++
++        { "Duplicate Content-Length with different value",
++          "https://gitlab.gnome.org/GNOME/libsoup/-/issues/500",
++          "POST / HTTP/1.1\r\nContent-Length: 2\r\nContent-Length: 4\r\n",
++          -1,
++          SOUP_STATUS_BAD_REQUEST,
++          NULL, NULL, -1,
++          { { NULL } }, 0
++        }
+ };
+ static const int num_reqtests = G_N_ELEMENTS (reqtests);
+ 
+@@ -1475,6 +1500,28 @@ do_append_duplicate_host_test (void)
+ 	soup_message_headers_unref (hdrs);
+ }
+ 
++static void
++do_append_duplicate_content_length_test (void)
++{
++        SoupMessageHeaders *hdrs;
++        const char *list_value;
++
++        hdrs = soup_message_headers_new (SOUP_MESSAGE_HEADERS_REQUEST);
++        soup_message_headers_append (hdrs, "Content-Length", "42");
++
++        /* Inserting the same value doesn't generate a list */
++        soup_message_headers_append (hdrs, "Content-Length", "42");
++        list_value = soup_message_headers_get_list (hdrs, "Content-Length");
++        g_assert_cmpstr (list_value, ==, "42");
++
++        /* Inserting a different value does nothing */
++        soup_message_headers_append (hdrs, "Content-Length", "45");
++        list_value = soup_message_headers_get_list (hdrs, "Content-Length");
++        g_assert_cmpstr (list_value, ==, "42");
++
++        soup_message_headers_unref (hdrs);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -1491,6 +1538,7 @@ main (int argc, char **argv)
+ 	g_test_add_func ("/header-parsing/append-param", do_append_param_tests);
+ 	g_test_add_func ("/header-parsing/bad", do_bad_header_tests);
+ 	g_test_add_func ("/header-parsing/append-duplicate-host", do_append_duplicate_host_test);
++        g_test_add_func ("/header-parsing/append-duplicate-content-length", do_append_duplicate_content_length_test);
+ 
+ 	ret = g_test_run ();
+ 
+diff --git a/tests/server-test.c b/tests/server-test.c
+index 09ea03b3..59230444 100644
+--- a/tests/server-test.c
++++ b/tests/server-test.c
+@@ -1422,6 +1422,68 @@ do_chunked_test (ServerData *sd, gconstpointer test_data)
+         }
+ }
+ 
++static void
++do_multiple_content_length_test (ServerData *sd, gconstpointer test_data)
++{
++        gint i;
++        struct {
++                const char *description;
++                const char *test;
++                const char *expected_response;
++        } tests[] = {
++                { "Double Content-Length with different value", "POST / HTTP/1.1\r\nHost: 127.0.0.1\r\nContent-Length: 0\r\nContent-Length: 4\r\nConnection: close\r\n\r\n\r\nABCD", "HTTP/1.0 400 Bad Request" },
++                { "Double Content-Length with the same value", "POST / HTTP/1.1\r\nHost: 127.0.0.1\r\nContent-Length: 4\r\nContent-Length: 4\r\nConnection: close\r\n\r\n\r\nABCD", "HTTP/1.1 200 OK" },
++        };
++
++        sd->server = soup_test_server_new (SOUP_TEST_SERVER_IN_THREAD);
++        sd->base_uri = soup_test_server_get_uri (sd->server, "http", NULL);
++        server_add_handler (sd, NULL, server_callback, NULL, NULL);
++
++        for (i = 0; i < G_N_ELEMENTS (tests); i++) {
++                GSocketClient *client;
++                GSocketConnection *conn;
++                GInputStream *input;
++                GOutputStream *output;
++                gsize nwritten;
++                char buffer[4096];
++                gssize nread;
++                GString *response;
++                const char *boundary;
++                GError *error = NULL;
++
++                debug_printf (1, "  %s\n", tests[i].description);
++
++                client = g_socket_client_new ();
++                conn = g_socket_client_connect_to_host (client, g_uri_get_host (sd->base_uri), g_uri_get_port (sd->base_uri), NULL, &error);
++                g_assert_no_error (error);
++
++                output = g_io_stream_get_output_stream (G_IO_STREAM (conn));
++                g_output_stream_write_all (output, tests[i].test, strlen (tests[i].test), &nwritten, NULL, &error);
++                g_assert_no_error (error);
++                g_assert_cmpuint (nwritten, ==, strlen (tests[i].test));
++                g_output_stream_flush (output, NULL, &error);
++                g_assert_no_error (error);
++
++                response = g_string_new (NULL);
++
++                input = g_io_stream_get_input_stream (G_IO_STREAM (conn));
++                do {
++                        nread = g_input_stream_read (input, buffer, sizeof(buffer), NULL, NULL);
++                        if (nread >= 0)
++                                response = g_string_append_len (response, (const char *)buffer, nread);
++                } while (nread > 0);
++
++                boundary = strstr (response->str, "\r\n");
++                g_assert_nonnull (boundary);
++                response = g_string_truncate (response, response->len - strlen (boundary));
++                g_assert_cmpstr (response->str, ==, tests[i].expected_response);
++                g_string_free (response, TRUE);
++
++                g_object_unref (conn);
++                g_object_unref (client);
++        }
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -1464,6 +1526,8 @@ main (int argc, char **argv)
+ 		    server_setup, do_steal_connect_test, server_teardown);
+         g_test_add ("/server/chunked", ServerData, NULL,
+                     NULL, do_chunked_test, server_teardown);
++        g_test_add ("/server/multiple-content-length", ServerData, NULL,
++                    NULL, do_multiple_content_length_test, server_teardown);
+ 
+ 	ret = g_test_run ();
+ 
diff --git a/meta/recipes-support/libsoup/libsoup_3.6.6.bb b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
index 792cb26e930..d18a16379b3 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.6.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
@@ -19,6 +19,7 @@ SRC_URI += "file://CVE-2025-32049-1.patch \
             file://CVE-2025-32049-4.patch \
             file://CVE-2026-1539.patch \
             file://CVE-2026-5119.patch \
+            file://CVE-2026-2708.patch \
 "
 
 PROVIDES = "libsoup-3.0"

