Return-Path: <jason.stasiak@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4742DCC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 16:12:35 +0000 (UTC)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17965.1791994354293149607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 09:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FG2SeVtw;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: jason.stasiak@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-16ad92569b5so4161044c88.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 09:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791994354; x=1792599154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZMP2lliwYb0mrQ/BDX5WHAFr1rTwCJ9q2Ts7ShgEdr4=;
        b=FG2SeVtwt6QBj1bMSYHkW5mKYq/LOuPGCUmzsZA7lCyyJG5QjMX38Vv1Ht6k8ypdSG
         ijK0Om6EtfJPXBUVxcXiDO5Wa4CIPe342BVHkcHALui0kLaHAq3plG0VEIYQzUd9remG
         G3KS2GOApUGl1Z1moycpXNBT0HTXWbZn2RTMZbkQSyqkxVQfdpBtWqL8sfLilRxrVeuO
         gf8j1d+gnvhvSFL7bN0Eq8IkqFAs8miGanWpg89rVsQ2UM7XNxng4bQpdInQgsm4hpTf
         /gUWvZV44rGrusU7zLgrs6+BTye92oDq6oufHsD8hzheeM6MZ4d9LRBLd27xLgdWRvFV
         YZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994354; x=1792599154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZMP2lliwYb0mrQ/BDX5WHAFr1rTwCJ9q2Ts7ShgEdr4=;
        b=EmPNPvSx4hq7CAIylZrDt0GO/WG/GadoMJLPh7SNZKk+sK/IF0n23UW6kfS+BuTtPB
         BL7Nb9HYE4FPtSopHhMLCo2NWvKWCcQj0qetyKB1oX1v91MWv9Bjh4po+bJ72R4wzYpx
         FyjD1BkPqXEAddkAUBDCBUp1+H73IPCj6Pzx7SYcLA4PNjC2a5mlFVdXujlh/DvLA3/Y
         jnbVY0jgkuYniZQS+ZGPurzpBsMh7u4GJSQ202ZDbz+X7sb/gfAebK3tLyg7hwrupnH1
         CMPv95rYLXOj5tTkdRuW8Iu+lQ5fHkTyzEf7w9B4PVbpUh3snkAk+OG0nnz3i5KWab0o
         fMkg==
X-Gm-Message-State: AFq9FYLRv4MmvjX9vPHjD8SaUOnNmb0Kd1TRveH0Ewy1JlvGdl6tIea8
	Ko0jwktgiSbI1WcR6MDMRsEQ1ZkJWsoOjN6k/yp1171yXHMx/FgGj/zyPqV52g==
X-Gm-Gg: AYBFou15MS0W+P3ByRYFcmxN3ngLyeACNXp4QDrNAqSnrfXwfKHqAIUCTML6nEyemHN
	w+msNDO0majxz9CjZ0+7OEeEowciZXkc3U4JYF+XVgEufbn7VOZjljlhQmpWc6eQTEhrim8qChA
	bbDTc2yBexMGwHOBxa0iwSZlKz6QWQ+uIvmxx57oFZkUrA2OQUsRnmpy6TXb0sv6oLDuC2IqNae
	bhh+7Grr6eql8TbI3WUBIKia2v3Ovqv3x2YHDML6yeFqJkpEyDh7EKb1nV4aH0wd89ugr+vhNkx
	fe4CKGj52+k8kvRETNscxDxm/CWdV8YnpZihq62xPSxI6GuHiL/0jrDm5/tO1CyHshtjbpoWSdD
	dSilw7huBa/OznHCZ0pPzB7Fiv9TfngVAO+lDxhflvD5bKFwis8Rf1HuHLUZLPbSKmFBM98Csbu
	EfPBRsA++ozgQ25CZrxq/nLxFEguZyRqBKQ9KpmO15s1kO3UqS1cGKJDNLvUOTn8gJtu5PjvCMB
	cwVNCHbMkbX+XQB2V2h
X-Received: by 2002:a05:7022:285:20b0:15d:f053:18b6 with SMTP id a92af1059eb24-16a5adfbebdmr20663040c88.9.1791994353297;
        Wed, 14 Oct 2026 09:12:33 -0700 (PDT)
Received: from CHA-FQKPM83.ad.garmin.com ([65.175.40.146])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35a352d4b05sm36006426eec.19.2026.10.14.09.12.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:12:32 -0700 (PDT)
From: Jason Stasiak <jason.stasiak@gmail.com>
X-Google-Original-From: Jason Stasiak <jason.stasiak@garmin.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v2 2/5] libsoup-2.4: fix CVE-2026-1801
Date: Wed, 14 Oct 2026 09:12:06 -0700
Message-ID: <20261014161209.2227316-2-jason.stasiak@garmin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014161209.2227316-1-jason.stasiak@garmin.com>
References: <20260929205055.2403390-2-jason.stasiak@gmail.com>
 <20261014161209.2227316-1-jason.stasiak@garmin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 16:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247784

Backport fix for CVE-2026-1801 from meta-oe to OE-core. Update CVE
patch to restore the chunked server validation unit test from the
upstream libsoup3 patch (b9a1c0663ff8ab6e79715db4b35b54f560416ddd).

(From meta-oe rev: 07d67228162018f5f619dce7183f85e79293378d)

Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
---
Changes since v1:
   - Resolved malformed patch lines

 .../libsoup/libsoup-2.4/CVE-2026-1801.patch   | 217 ++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
 2 files changed, 218 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1801.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1801.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1801.patch
new file mode 100644
index 0000000000..f7579a9834
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1801.patch
@@ -0,0 +1,217 @@
+From f9c933e258e9ef2f221cca6395f8092a1c4b93dd Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 19 Mar 2026 17:10:36 +0800
+Subject: [PATCH 2/4] Fix CVE-2026-1801
+
+This patch merges 3 upstream patches
+
+Chery-pick the first two patches to make the context is the same as the
+third patch that fix CVE-2026-1801
+
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/commit/1e32b5e123aa1689505472bdbfcbd897eac41977,
+https://gitlab.gnome.org/GNOME/libsoup/-/commit/8a2e15c88512ae4517d2c2c887d39299725b22da,
+https://gitlab.gnome.org/GNOME/libsoup/-/commit/b9a1c0663ff8ab6e79715db4b35b54f560416ddd]
+CVE: CVE-2026-1801
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Backport the chunked server validation unit test from the upstream
+libsoup3 patch (b9a1c0663ff8ab6e79715db4b35b54f560416ddd).
+
+Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
+---
+ libsoup/soup-body-input-stream.c | 66 +++++++++++++++++++------------
+ tests/server-test.c              | 67 ++++++++++++++++++++++++++++++++
+ 2 files changed, 108 insertions(+), 25 deletions(-)
+
+diff --git a/libsoup/soup-body-input-stream.c b/libsoup/soup-body-input-stream.c
+index 6b95884..25d9312 100644
+--- a/libsoup/soup-body-input-stream.c
++++ b/libsoup/soup-body-input-stream.c
+@@ -159,15 +159,18 @@ soup_body_input_stream_read_chunked (SoupBodyInputStream  *bistream,
+ again:
+ 	switch (bistream->priv->chunked_state) {
+ 	case SOUP_BODY_INPUT_STREAM_STATE_CHUNK_SIZE:
+-		nread = soup_filter_input_stream_read_line (
+-			fstream, metabuf, sizeof (metabuf), blocking,
+-			&got_line, cancellable, error);
+-		if (nread <= 0)
++		nread = soup_filter_input_stream_read_until (
++				fstream, metabuf, sizeof (metabuf),
++				"\r\n", 2, blocking, TRUE,
++				&got_line, cancellable, error);
++		if (nread < 0)
+ 			return nread;
+-		if (!got_line) {
+-			g_set_error_literal (error, G_IO_ERROR,
+-					     G_IO_ERROR_PARTIAL_INPUT,
+-					     _("Connection terminated unexpectedly"));
++		if (nread == 0 || !got_line) {
++			if (error && *error == NULL) {
++				g_set_error_literal (error, G_IO_ERROR,
++									G_IO_ERROR_PARTIAL_INPUT,
++									("Connection terminated unexpectedly"));
++			}
+ 			return -1;
+ 		}
+ 
+@@ -180,9 +183,9 @@ again:
+ 
+ 	case SOUP_BODY_INPUT_STREAM_STATE_CHUNK:
+ 		nread = soup_body_input_stream_read_raw (
+-			bistream, buffer,
+-			MIN (count, bistream->priv->read_length),
+-			blocking, cancellable, error);
++				bistream, buffer,
++				MIN (count, bistream->priv->read_length),
++				blocking, cancellable, error);
+ 		if (nread > 0) {
+ 			bistream->priv->read_length -= nread;
+ 			if (bistream->priv->read_length == 0)
+@@ -191,16 +194,19 @@ again:
+ 		return nread;
+ 
+ 	case SOUP_BODY_INPUT_STREAM_STATE_CHUNK_END:
+-		nread = soup_filter_input_stream_read_line (
+-			SOUP_FILTER_INPUT_STREAM (bistream->priv->base_stream),
+-			metabuf, sizeof (metabuf), blocking,
+-			&got_line, cancellable, error);
+-		if (nread <= 0)
++		nread = soup_filter_input_stream_read_until (
++				SOUP_FILTER_INPUT_STREAM (bistream->priv->base_stream),
++				metabuf, sizeof (metabuf),
++				"\r\n", 2, blocking, TRUE,
++				&got_line, cancellable, error);
++		if (nread < 0)
+ 			return nread;
+-		if (!got_line) {
+-			g_set_error_literal (error, G_IO_ERROR,
+-					     G_IO_ERROR_PARTIAL_INPUT,
+-					     _("Connection terminated unexpectedly"));
++		if (nread == 0 || !got_line) {
++			if (error && *error == NULL) {
++				g_set_error_literal (error, G_IO_ERROR,
++				G_IO_ERROR_PARTIAL_INPUT,
++				_("Connection terminated unexpectedly"));
++			}
+ 			return -1;
+ 		}
+ 
+@@ -208,13 +214,23 @@ again:
+ 		break;
+ 
+ 	case SOUP_BODY_INPUT_STREAM_STATE_TRAILERS:
+-		nread = soup_filter_input_stream_read_line (
+-			fstream, buffer, count, blocking,
+-			&got_line, cancellable, error);
+-		if (nread <= 0)
++		nread = soup_filter_input_stream_read_until (
++				fstream, metabuf, sizeof (metabuf),
++				"\r\n", 2, blocking, TRUE,
++				&got_line, cancellable, error);
++		if (nread < 0)
+ 			return nread;
+ 
+-		if (strncmp (buffer, "\r\n", nread) || strncmp (buffer, "\n", nread)) {
++		if (nread == 0) {
++			if (error && *error == NULL) {
++				g_set_error_literal (error, G_IO_ERROR,
++				G_IO_ERROR_PARTIAL_INPUT,
++				_("Connection terminated unexpectedly"));
++			}
++			return -1;
++		}
++
++		if (nread == 2 && strncmp (metabuf, "\r\n", nread) == 0) {
+ 			bistream->priv->chunked_state = SOUP_BODY_INPUT_STREAM_STATE_DONE;
+ 			bistream->priv->eof = TRUE;
+ 		}
+diff --git a/tests/server-test.c b/tests/server-test.c
+index 8976103e..fbe8bdcc 100644
+--- a/tests/server-test.c
++++ b/tests/server-test.c
+@@ -1373,6 +1373,71 @@ do_steal_connect_test (ServerData *sd, gconstpointer test_data)
+ 	soup_uri_free (proxy_uri);
+ }
+ 
++static void
++server_chunked_hundler (SoupServer        *server,
++		                SoupMessage       *msg,
++		                const char        *path,
++		                GHashTable        *query,
++		                gpointer           data)
++{
++		g_assert_true (msg->method == SOUP_METHOD_POST);
++		g_assert_cmpstr (path, ==, "/valid");
++
++		soup_message_set_status (msg, SOUP_STATUS_OK);
++		soup_message_set_response (msg, "text/plain", SOUP_MEMORY_STATIC, "index", 5);
++}
++
++#define CHUNKED_FORMAT_REQUEST "POST /valid HTTP/1.1\r\nHost: 127.0.0.1\r\n%sGET /invalid HTTP/1.1\r\nHost: 127.0.0.1\r\n\r\n"
++
++static void
++do_chunked_test (ServerData *sd, gconstpointer test_data)
++{
++		gint i;
++		struct {
++				const char *description;
++				const char *test;
++		} tests[] = {
++				{ "Lone LF", "Transfer-Encoding: chunked\r\n\r\n5;ext\n data\r\n0\r\n\r\n" },
++		};
++
++		sd->server = soup_test_server_new (SOUP_TEST_SERVER_IN_THREAD);
++		sd->base_uri = soup_test_server_get_uri (sd->server, "http", NULL);
++		server_add_handler (sd, NULL, server_chunked_hundler, NULL, NULL);
++
++		for (i = 0; i < G_N_ELEMENTS (tests); i++) {
++				GSocketClient *client;
++				GSocketConnection *conn;
++				GInputStream *input;
++				GOutputStream *output;
++				char *request;
++				char buffer[4096];
++				gssize nread;
++				GError *error = NULL;
++
++				debug_printf (1, "  %s\n", tests[i].description);
++
++				client = g_socket_client_new ();
++				conn = g_socket_client_connect_to_host (client, sd->base_uri->host, sd->base_uri->port, NULL, &error);
++				g_assert_no_error (error);
++
++				request = g_strdup_printf (CHUNKED_FORMAT_REQUEST, tests[i].test);
++
++				output = g_io_stream_get_output_stream (G_IO_STREAM (conn));
++				g_output_stream_write_all (output, request, strlen (request), NULL, NULL, NULL);
++				g_output_stream_close (output, NULL, NULL);
++				g_socket_shutdown (g_socket_connection_get_socket (G_SOCKET_CONNECTION (conn)), FALSE, TRUE, &error);
++
++				input = g_io_stream_get_input_stream (G_IO_STREAM (conn));
++				do {
++						nread = g_input_stream_read (input, buffer, sizeof(buffer), NULL, NULL);
++				} while (nread > 0);
++
++				g_free (request);
++				g_object_unref (conn);
++				g_object_unref (client);
++		}
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -1411,6 +1476,8 @@ main (int argc, char **argv)
+ 		    server_setup_nohandler, do_early_multi_test, server_teardown);
+ 	g_test_add ("/server/steal/CONNECT", ServerData, NULL,
+ 		    server_setup, do_steal_connect_test, server_teardown);
++	g_test_add ("/server/chunked", ServerData, NULL,
++		    NULL, do_chunked_test, server_teardown);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+2.55.0
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 4fe1e36f03..9da2dde714 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -42,6 +42,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-2784.patch \
            file://CVE-2025-4945.patch \
            file://CVE-2026-1539.patch \
+           file://CVE-2026-1801.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.55.0


