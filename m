Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F8CCD37AF
	for <webhook@archiver.kernel.org>; Sun, 10 May 2026 09:26:58 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27225.1778405214154279933
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 May 2026 02:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=NvNJC3+5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260510092650550e785f530002077b-gk9_c3@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260510092650550e785f530002077b
        for <openembedded-core@lists.openembedded.org>;
        Sun, 10 May 2026 11:26:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=8Hpv0boaYmMqz9c7MHgTUe+LSwtD2ZQf/FSd1jUyQLo=;
 b=NvNJC3+5CX5QCxlIvntglgNY6qUvGEvhZTBgoXkFDoRv/mBnUPl8KWvV/LMyyofxifngsT
 psa6IvD1CDu9US0KxJWObTSNODzG0Hd0djPjx7/v/4x6MeVTYEYpSc6Xe0JVIPnQjcQxlYCZ
 x34dZsY1NOOydVMy4lw4t/Q17OeHOSL/beNwOwJgLyGI9hRyDo2MuFMEcu9SJWsK1YhxZh1+
 1HuHx2JB0GbElOeAkCx4vm0YvP0bymca2MoMMDweZz46qQdVKnBconES0lXWh4ubZ+oQAnUA
 3rfuc4K4Dd6ylZWrk/OdB8fvD0vUAO4b4V6kBeQeVGqLyZoBxV/qmkcA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] libsoup: patch CVE-2026-2708
Date: Sun, 10 May 2026 11:26:18 +0200
Message-ID: <20260510092621.174841-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 May 2026 09:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236767

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-2708

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libsoup/libsoup/CVE-2026-2708.patch       | 218 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.6.6.bb |   1 +
 2 files changed, 219 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2026-2708.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2026-2708.patch b/meta/recipes-support/libsoup/libsoup/CVE-2026-2708.patch
new file mode 100644
index 0000000000..479a53ae21
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
index 792cb26e93..d18a16379b 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.6.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
@@ -19,6 +19,7 @@ SRC_URI += "file://CVE-2025-32049-1.patch \
             file://CVE-2025-32049-4.patch \
             file://CVE-2026-1539.patch \
             file://CVE-2026-5119.patch \
+            file://CVE-2026-2708.patch \
 "
 
 PROVIDES = "libsoup-3.0"

