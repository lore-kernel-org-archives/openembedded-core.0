Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECCE9CD3439
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:59:13 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1065.1778000352039312851
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:59:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0ZC6NdDx;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so86720075e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000350; x=1778605150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pC0wmsQZctulyjQEgdRsy6j0JbfRkC7MJ5aedAjqEZs=;
        b=0ZC6NdDxcaelS0OXyGDBgYjoLY0AQto5RzSBGU+6djob2qnDdiCVVR/pSYm8ABp53m
         Wn4wwGyXgccoVpVW6ZQBjtPAVU0Cf5gJjgY91DBkTdVRXcOiDOLX01fdtksB99HNFgN8
         W72pnT/sXllsUnVDPphPdHKi+mIS4dt0xeZZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000350; x=1778605150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pC0wmsQZctulyjQEgdRsy6j0JbfRkC7MJ5aedAjqEZs=;
        b=HRa1Gxw+U1H/8DZCM0456G2btj1A4OyqdgO4Svmxgm8xyMKcsn1vorSgXk3cU9E8S8
         O1qKYYnFCvXmXdF9O119yRJz23gAJ/4IA/oWBkuL6QIYC2bDe64WWrZMMsCXfEht63e7
         O2O1N5BrrdvFyn29tmEykif62COxl+eAwPhSoYjGy5AawnhRdvrNRFBIAhU3QhXc7Ra6
         GEfwWzikMIIThG3myowGB6FHRfMUBvWeFSUF5vyGYamwFG+yj20jZT+hpida72bXbO9f
         PYruNiAtlj2lvja5FXjym+YDUI0zTVdgBUlu72X270IvNSNXncvFT9yoLqmZvnsOmK0p
         9ezA==
X-Gm-Message-State: AOJu0Yzr03Lg5NjVOXnccA2I8n6hu2HmQPOJCjEhA6cJcgqEzs88r7+K
	kWXMztfCHnjp9G+cuuanTw7YjsZSMgWNLwBF1caRCjQPDi5b/ogy6c86F75AkpyENMoYmuyooUM
	vIQhASEE=
X-Gm-Gg: AeBDiev7gDoNgY2jLqWqEKF8/fLbIkbPt+pRLKYWzP0VAQ9cTt0jOzxv60BN2EXVvXa
	Jlnw5jG5mpm/awLegQESoePgGCAWmU1FBUHqIseRM9pPPRzzNa6gGTMmtKsd4NttVj+2s65r3le
	8Vs97t430tKwOVSgqqCjb/qSjwqeRdGzBIHoM8MUpImeGpwyuKvHdZjBGfs8cdZVTqNkOdnMQDU
	EaPQob9M4y2SXtWtvkkTfTBxbFfWquuhqde29pDdWdEnjtJ21VXTUbp2G0y9n2tsmG2j9oNfmth
	SxvJ30S3tfbERTEFVlL+Ocg6wu4Tj/PieYT2r8sIxVB2xAqy2idAFB7PudBufp847mE/HFACscQ
	qtLaT8bAEi4CrqILNjYOs0mQPt7HSehSnZbq2lcmoWKh62U4BB3peB5eN8m1FYac/XXFJKPwNjG
	XExojG4nSq8VA3hD2wGpnPPQ9Ah7J9Oe+qDIkZTZMt+Bau7ohsCpB/qjjb36g1J7RCxsS7QJEDd
	hUDs5dV0sWOfC5koZbczaTULtImC7sevx7f
X-Received: by 2002:a05:600c:b8a:b0:48a:5574:3a48 with SMTP id 5b1f17b1804b1-48e51f32bf7mr727515e9.16.1778000349941;
        Tue, 05 May 2026 09:59:09 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.59.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:59:09 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/23] libsoup: fix CVE-2025-32049
Date: Tue,  5 May 2026 18:57:40 +0200
Message-ID: <3c2f2b6f7af2bb743655859b64faae4786080cb9.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777995876.git.fabien.thomas@smile.fr>
References: <cover.1777995876.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:59:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236514

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/390

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../libsoup-3.4.4/CVE-2025-32049-1.patch      | 229 ++++++++++++++
 .../libsoup-3.4.4/CVE-2025-32049-2.patch      |  34 ++
 .../libsoup-3.4.4/CVE-2025-32049-3.patch      | 134 ++++++++
 .../libsoup-3.4.4/CVE-2025-32049-4.patch      | 292 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   4 +
 5 files changed, 693 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.patch
new file mode 100644
index 0000000000..0772c759dc
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-1.patch
@@ -0,0 +1,229 @@
+From 176cb31003252a69d3fc7908e8f505c0ee006b7a Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Wed, 24 Jul 2024 15:20:35 +0200
+Subject: [PATCH 1/4] websocket: add a way to restrict the total message size
+
+Otherwise a client could send small packages smaller than
+total-incoming-payload-size but still to break the server
+with a big allocation
+
+Fixes: #390
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/db87805ab565d67533dfed2cb409dbfd63c7fdce]
+CVE: CVE-2025-32049
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/websocket/soup-websocket-connection.c | 107 +++++++++++++++++-
+ libsoup/websocket/soup-websocket-connection.h |   7 ++
+ 2 files changed, 110 insertions(+), 4 deletions(-)
+
+diff --git a/libsoup/websocket/soup-websocket-connection.c b/libsoup/websocket/soup-websocket-connection.c
+index 5eb8150..19bdd39 100644
+--- a/libsoup/websocket/soup-websocket-connection.c
++++ b/libsoup/websocket/soup-websocket-connection.c
+@@ -84,7 +84,7 @@ enum {
+ 	PROP_MAX_INCOMING_PAYLOAD_SIZE,
+ 	PROP_KEEPALIVE_INTERVAL,
+ 	PROP_EXTENSIONS,
+-
++	PROP_MAX_TOTAL_MESSAGE_SIZE,
+         LAST_PROPERTY
+ };
+ 
+@@ -126,6 +126,7 @@ typedef struct {
+ 	char *origin;
+ 	char *protocol;
+ 	guint64 max_incoming_payload_size;
++	guint64 max_total_message_size;
+ 	guint keepalive_interval;
+ 
+ 	gushort peer_close_code;
+@@ -156,6 +157,7 @@ typedef struct {
+ } SoupWebsocketConnectionPrivate;
+ 
+ #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
+ #define READ_BUFFER_SIZE 1024
+ #define MASK_LENGTH 4
+ 
+@@ -670,8 +672,8 @@ bad_data_error_and_close (SoupWebsocketConnection *self)
+ }
+ 
+ static void
+-too_big_error_and_close (SoupWebsocketConnection *self,
+-                         guint64 payload_len)
++too_big_incoming_payload_error_and_close (SoupWebsocketConnection *self,
++                                          guint64 payload_len)
+ {
+         SoupWebsocketConnectionPrivate *priv = soup_websocket_connection_get_instance_private (self);
+ 	GError *error;
+@@ -687,6 +689,24 @@ too_big_error_and_close (SoupWebsocketConnection *self,
+ 	emit_error_and_close (self, error, TRUE);
+ }
+ 
++static void
++too_big_message_error_and_close (SoupWebsocketConnection *self,
++                                 guint64 len)
++{
++	SoupWebsocketConnectionPrivate *priv = soup_websocket_connection_get_instance_private (self);
++	GError *error;
++
++	error = g_error_new_literal (SOUP_WEBSOCKET_ERROR,
++				     SOUP_WEBSOCKET_CLOSE_TOO_BIG,
++				     priv->connection_type == SOUP_WEBSOCKET_CONNECTION_SERVER ?
++				     "Received WebSocket payload from the client larger than configured max-total-message-size" :
++				     "Received WebSocket payload from the server larger than configured max-total-message-size");
++	g_debug ("%s received message of size %" G_GUINT64_FORMAT " or greater, but max supported size is %" G_GUINT64_FORMAT,
++	         priv->connection_type == SOUP_WEBSOCKET_CONNECTION_SERVER ? "server" : "client",
++	         len, priv->max_total_message_size);
++	emit_error_and_close (self, error, TRUE);
++}
++
+ static void
+ close_connection (SoupWebsocketConnection *self,
+                   gushort                  code,
+@@ -918,6 +938,12 @@ process_contents (SoupWebsocketConnection *self,
+ 		switch (priv->message_opcode) {
+ 		case 0x01:
+ 		case 0x02:
++			/* Safety valve */
++			if (priv->max_total_message_size > 0 &&
++			    (priv->message_data->len + payload_len) > priv->max_total_message_size) {
++				too_big_message_error_and_close (self, (priv->message_data->len + payload_len));
++				return;
++			}
+ 			g_byte_array_append (priv->message_data, payload, payload_len);
+ 			break;
+ 		default:
+@@ -1056,7 +1082,7 @@ process_frame (SoupWebsocketConnection *self)
+ 	/* Safety valve */
+ 	if (priv->max_incoming_payload_size > 0 &&
+ 	    payload_len > priv->max_incoming_payload_size) {
+-		too_big_error_and_close (self, payload_len);
++		too_big_incoming_payload_error_and_close (self, payload_len);
+ 		return FALSE;
+ 	}
+ 
+@@ -1363,6 +1389,10 @@ soup_websocket_connection_get_property (GObject *object,
+ 		g_value_set_pointer (value, priv->extensions);
+ 		break;
+ 
++        case PROP_MAX_TOTAL_MESSAGE_SIZE:
++		g_value_set_uint64 (value, priv->max_total_message_size);
++		break;
++
+ 	default:
+ 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+ 		break;
+@@ -1416,6 +1446,10 @@ soup_websocket_connection_set_property (GObject *object,
+ 		priv->extensions = g_value_get_pointer (value);
+ 		break;
+ 
++	case PROP_MAX_TOTAL_MESSAGE_SIZE:
++		priv->max_total_message_size = g_value_get_uint64 (value);
++		break;
++
+ 	default:
+ 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+ 		break;
+@@ -1628,6 +1662,26 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+                                       G_PARAM_CONSTRUCT_ONLY |
+                                       G_PARAM_STATIC_STRINGS);
+ 
++	/**
++	 * SoupWebsocketConnection:max-total-message-size:
++	 *
++	 * The total message size for incoming packets.
++	 *
++	 * The protocol expects or 0 to not limit it.
++	 *
++	 * Since: 3.8
++	 */
++        properties[PROP_MAX_TOTAL_MESSAGE_SIZE] =
++                g_param_spec_uint64 ("max-total-message-size",
++                                     "Max total message size",
++                                     "Max total message size ",
++                                     0,
++                                     G_MAXUINT64,
++                                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++                                     G_PARAM_READWRITE |
++                                     G_PARAM_CONSTRUCT |
++                                     G_PARAM_STATIC_STRINGS);
++
+         g_object_class_install_properties (gobject_class, LAST_PROPERTY, properties);
+ 
+ 	/**
+@@ -2111,6 +2165,51 @@ soup_websocket_connection_set_max_incoming_payload_size (SoupWebsocketConnection
+ 	}
+ }
+ 
++/**
++ * soup_websocket_connection_get_max_total_message_size:
++ * @self: the WebSocket
++ *
++ * Gets the maximum total message size allowed for packets.
++ *
++ * Returns: the maximum total message size.
++ *
++ * Since: 3.8
++ */
++guint64
++soup_websocket_connection_get_max_total_message_size (SoupWebsocketConnection *self)
++{
++	SoupWebsocketConnectionPrivate *priv = soup_websocket_connection_get_instance_private (self);
++
++	g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL_MESSAGE_SIZE_DEFAULT);
++
++	return priv->max_total_message_size;
++}
++
++/**
++ * soup_websocket_connection_set_max_total_message_size:
++ * @self: the WebSocket
++ * @max_total_message_size: the maximum total message size
++ *
++ * Sets the maximum total message size allowed for packets.
++ *
++ * It does not limit the outgoing packet size.
++ *
++ * Since: 3.8
++ */
++void
++soup_websocket_connection_set_max_total_message_size (SoupWebsocketConnection *self,
++                                                      guint64                  max_total_message_size)
++{
++	SoupWebsocketConnectionPrivate *priv = soup_websocket_connection_get_instance_private (self);
++
++	g_return_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self));
++
++	if (priv->max_total_message_size != max_total_message_size) {
++		priv->max_total_message_size = max_total_message_size;
++		g_object_notify_by_pspec (G_OBJECT (self), properties[PROP_MAX_TOTAL_MESSAGE_SIZE]);
++	}
++}
++
+ /**
+  * soup_websocket_connection_get_keepalive_interval:
+  * @self: the WebSocket
+diff --git a/libsoup/websocket/soup-websocket-connection.h b/libsoup/websocket/soup-websocket-connection.h
+index eeb093d..922de56 100644
+--- a/libsoup/websocket/soup-websocket-connection.h
++++ b/libsoup/websocket/soup-websocket-connection.h
+@@ -88,6 +88,13 @@ SOUP_AVAILABLE_IN_ALL
+ void                soup_websocket_connection_set_max_incoming_payload_size (SoupWebsocketConnection *self,
+                                                                              guint64                  max_incoming_payload_size);
+ 
++SOUP_AVAILABLE_IN_3_0
++guint64             soup_websocket_connection_get_max_total_message_size    (SoupWebsocketConnection *self);
++
++SOUP_AVAILABLE_IN_3_0
++void                soup_websocket_connection_set_max_total_message_size    (SoupWebsocketConnection *self,
++                                                                             guint64                  max_total_message_size);
++
+ SOUP_AVAILABLE_IN_ALL
+ guint               soup_websocket_connection_get_keepalive_interval (SoupWebsocketConnection *self);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.patch
new file mode 100644
index 0000000000..6f00fabfdb
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-2.patch
@@ -0,0 +1,34 @@
+From 81eb7cf7422878f0b78b833a3b741f734502921f Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Fri, 20 Sep 2024 12:12:38 +0200
+Subject: [PATCH 2/4] websocket-test: set the total message size
+
+This is required when sending a big amount of data
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/4904a46a2d9a014efa6be01a186ac353dbf5047b]
+CVE: CVE-2025-32049
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/websocket-test.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c
+index a0b8334..827b041 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -567,6 +567,11 @@ test_send_big_packets (Test *test,
+ 	soup_websocket_connection_set_max_incoming_payload_size (test->server, 1000 * 1000 + 1);
+ 	g_assert (soup_websocket_connection_get_max_incoming_payload_size (test->server) == (1000 * 1000 + 1));
+ 
++	soup_websocket_connection_set_max_total_message_size (test->client, 1000 * 1000 + 1);
++	g_assert (soup_websocket_connection_get_max_total_message_size (test->client) == (1000 * 1000 + 1));
++	soup_websocket_connection_set_max_total_message_size (test->server, 1000 * 1000 + 1);
++	g_assert (soup_websocket_connection_get_max_total_message_size (test->server) == (1000 * 1000 + 1));
++
+ 	sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
+ 	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
+ 	WAIT_UNTIL (received != NULL);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.patch
new file mode 100644
index 0000000000..29fb0d7ddb
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-3.patch
@@ -0,0 +1,134 @@
+From 25616e1a958bc1503cc24d6845a6e80ffc287727 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Thu, 8 May 2025 16:16:25 -0500
+Subject: [PATCH] Set message size limit in SoupServer rather than
+ SoupWebsocketConnection
+
+We're not sure about the compatibility implications of having a default
+size limit for clients.
+
+Also not sure whether the server limit is actually set appropriately,
+but there is probably very little server usage of
+SoupWebsocketConnection in the wild, so it's not so likely to break
+things.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/2df34d9544cabdbfdedd3b36f098cf69233b1df7]
+CVE: CVE-2025-32049
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/server/soup-server.c                  | 24 +++++++++++++----
+ libsoup/websocket/soup-websocket-connection.c | 26 +++++++++++++------
+ 2 files changed, 37 insertions(+), 13 deletions(-)
+
+diff --git a/libsoup/server/soup-server.c b/libsoup/server/soup-server.c
+index 6b486f5..c779f7d 100644
+--- a/libsoup/server/soup-server.c
++++ b/libsoup/server/soup-server.c
+@@ -186,6 +186,16 @@ static GParamSpec *properties[LAST_PROPERTY] = { NULL, };
+ 
+ G_DEFINE_TYPE_WITH_PRIVATE (SoupServer, soup_server, G_TYPE_OBJECT)
+ 
++/* SoupWebsocketConnection by default limits only maximum packet size. But a
++ * message may consist of multiple packets, so SoupServer additionally restricts
++ * total message size to mitigate denial of service attacks on the server.
++ * SoupWebsocketConnection does not do this by default because I don't know
++ * whether that would or would not cause compatibility problems for websites.
++ *
++ * This size is in bytes and it is arbitrary.
++ */
++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
++
+ static void request_finished (SoupServerMessage      *msg,
+                               SoupMessageIOCompletion completion,
+                               SoupServer             *server);
+@@ -937,11 +947,15 @@ complete_websocket_upgrade (SoupServer        *server,
+ 
+ 	g_object_ref (msg);
+ 	stream = soup_server_message_steal_connection (msg);
+-	conn = soup_websocket_connection_new (stream, uri,
+-					      SOUP_WEBSOCKET_CONNECTION_SERVER,
+-					      soup_message_headers_get_one_common (soup_server_message_get_request_headers (msg), SOUP_HEADER_ORIGIN),
+-					      soup_message_headers_get_one_common (soup_server_message_get_response_headers (msg), SOUP_HEADER_SEC_WEBSOCKET_PROTOCOL),
+-					      handler->websocket_extensions);
++	conn = SOUP_WEBSOCKET_CONNECTION (g_object_new (SOUP_TYPE_WEBSOCKET_CONNECTION,
++					  "io-stream", stream,
++					  "uri", uri,
++					  "connection-type", SOUP_WEBSOCKET_CONNECTION_SERVER,
++					  "origin", soup_message_headers_get_one_common (soup_server_message_get_request_headers (msg), SOUP_HEADER_ORIGIN),
++					  "protocol", soup_message_headers_get_one_common (soup_server_message_get_response_headers (msg), SOUP_HEADER_SEC_WEBSOCKET_PROTOCOL),
++					  "extensions", handler->websocket_extensions,
++					  "max-total-message-size", (guint64)MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++					  NULL));
+ 	handler->websocket_extensions = NULL;
+ 	g_object_unref (stream);
+ 
+diff --git a/libsoup/websocket/soup-websocket-connection.c b/libsoup/websocket/soup-websocket-connection.c
+index 26476df..cbb1b72 100644
+--- a/libsoup/websocket/soup-websocket-connection.c
++++ b/libsoup/websocket/soup-websocket-connection.c
+@@ -149,7 +149,6 @@ typedef struct {
+ } SoupWebsocketConnectionPrivate;
+ 
+ #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
+-#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
+ #define READ_BUFFER_SIZE 1024
+ #define MASK_LENGTH 4
+ 
+@@ -1612,9 +1611,10 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+ 	/**
+ 	 * SoupWebsocketConnection:max-incoming-payload-size:
+ 	 *
+-	 * The maximum payload size for incoming packets.
+-	 *
+-	 * The protocol expects or 0 to not limit it.
++     * The maximum payload size for incoming packets, or 0 to not limit it.
++     *
++     * Each message may consist of multiple packets, so also refer to
++     * [property@WebSocketConnection:max-total-message-size].
+ 	 */
+         properties[PROP_MAX_INCOMING_PAYLOAD_SIZE] =
+                 g_param_spec_uint64 ("max-incoming-payload-size",
+@@ -1662,9 +1662,19 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+ 	/**
+ 	 * SoupWebsocketConnection:max-total-message-size:
+ 	 *
+-	 * The total message size for incoming packets.
++	 * The maximum size for incoming messages.
++	 *
++	 * Set to a value to limit the total message size, or 0 to not
++	 * limit it.
++	 *
++	 * [method@Server.add_websocket_handler] will set this to a nonzero
++	 * default value to mitigate denial of service attacks. Clients must
++	 * choose their own default if they need to mitigate denial of service
++	 * attacks. You also need to set your own default if creating your own
++	 * server SoupWebsocketConnection without using SoupServer.
+ 	 *
+-	 * The protocol expects or 0 to not limit it.
++	 * Each message may consist of multiple packets, so also refer to
++	 * [property@WebSocketConnection:max-incoming-payload-size].
+ 	 *
+ 	 * Since: 3.8
+ 	 */
+@@ -1674,7 +1684,7 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+                                      "Max total message size ",
+                                      0,
+                                      G_MAXUINT64,
+-                                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++                                     0,
+                                      G_PARAM_READWRITE |
+                                      G_PARAM_CONSTRUCT |
+                                      G_PARAM_STATIC_STRINGS);
+@@ -2164,7 +2174,7 @@ soup_websocket_connection_get_max_total_message_size (SoupWebsocketConnection *s
+ {
+ 	SoupWebsocketConnectionPrivate *priv = soup_websocket_connection_get_instance_private (self);
+ 
+-	g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL_MESSAGE_SIZE_DEFAULT);
++	g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), 0);
+ 
+ 	return priv->max_total_message_size;
+ }
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.patch
new file mode 100644
index 0000000000..6f391e98e2
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32049-4.patch
@@ -0,0 +1,292 @@
+From 3c87790a4ba141125e6ba165c478f0440e8e693e Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Fri, 16 May 2025 16:55:40 -0500
+Subject: [PATCH 4/4] Add tests for max-incoming-packet-size and
+ max-total-message-size
+
+An even better test would verify that it's possible to send big messages
+containing small packets, but libsoup doesn't offer control over packet
+size, and I don't want to take the time to learn how WebSockets work to
+figure out how to do that manually. Instead, I just check that both
+limits work, for both client and server.
+
+I didn't add deflate variants of these tests because I doubt that would
+add valuable coverage.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/4d00b45b7eebdcfa0706b58e34c40b8a0a16015b]
+CVE: CVE-2025-32049
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/websocket-test.c | 214 +++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 197 insertions(+), 17 deletions(-)
+
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c
+index 827b041..ec1324c 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -543,16 +543,9 @@ test_send_big_packets (Test *test,
+ {
+ 	GBytes *sent = NULL;
+ 	GBytes *received = NULL;
++	gulong signal_id;
+ 
+-	g_signal_connect (test->client, "message", G_CALLBACK (on_text_message), &received);
+-
+-	sent = g_bytes_new_take (g_strnfill (400, '!'), 400);
+-	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
+-	WAIT_UNTIL (received != NULL);
+-	g_assert (g_bytes_equal (sent, received));
+-	g_bytes_unref (sent);
+-	g_bytes_unref (received);
+-	received = NULL;
++	signal_id = g_signal_connect (test->client, "message", G_CALLBACK (on_text_message), &received);
+ 
+ 	sent = g_bytes_new_take (g_strnfill (100 * 1000, '?'), 100 * 1000);
+ 	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
+@@ -563,23 +556,174 @@ test_send_big_packets (Test *test,
+ 	received = NULL;
+ 
+ 	soup_websocket_connection_set_max_incoming_payload_size (test->client, 1000 * 1000 + 1);
+-	g_assert (soup_websocket_connection_get_max_incoming_payload_size (test->client) == (1000 * 1000 + 1));
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 1000 * 1000 + 1);
+ 	soup_websocket_connection_set_max_incoming_payload_size (test->server, 1000 * 1000 + 1);
+-	g_assert (soup_websocket_connection_get_max_incoming_payload_size (test->server) == (1000 * 1000 + 1));
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 1000 * 1000 + 1);
+ 
+ 	soup_websocket_connection_set_max_total_message_size (test->client, 1000 * 1000 + 1);
+-	g_assert (soup_websocket_connection_get_max_total_message_size (test->client) == (1000 * 1000 + 1));
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 1000 * 1000 + 1);
+ 	soup_websocket_connection_set_max_total_message_size (test->server, 1000 * 1000 + 1);
+-	g_assert (soup_websocket_connection_get_max_total_message_size (test->server) == (1000 * 1000 + 1));
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 1000 * 1000 + 1);
+ 
+ 	sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
+ 	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
+ 	WAIT_UNTIL (received != NULL);
+ 	g_assert (g_bytes_equal (sent, received));
++	g_bytes_unref (received);
++	received = NULL;
++
++	/* Reverse the test and send the big message to the server. */
++	g_signal_handler_disconnect (test->client, signal_id);
++	g_signal_connect (test->server, "message", G_CALLBACK (on_text_message), &received);
++
++	soup_websocket_connection_send_text (test->client, g_bytes_get_data (sent, NULL));
++	WAIT_UNTIL (received != NULL);
++	g_assert_true (g_bytes_equal (sent, received));
+ 	g_bytes_unref (sent);
+ 	g_bytes_unref (received);
+ }
+ 
++static void
++test_send_big_packets_direct (Test *test,
++                              gconstpointer data)
++{
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 128 * 1024);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 0);
++
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 128 * 1024);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 0);
++
++   test_send_big_packets (test, data);
++}
++
++static void
++test_send_big_packets_soup (Test *test,
++                            gconstpointer data)
++{
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 128 * 1024);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 0);
++
++   /* Max total message size defaults to 0 (unlimited), but SoupServer applies its own limit by default. */
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 128 * 1024);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 128 * 1024);
++
++   test_send_big_packets (test, data);
++}
++
++static void
++test_send_exceeding_client_max_payload_size (Test *test,
++                                             gconstpointer data)
++{
++   GBytes *sent = NULL;
++   GBytes *received = NULL;
++   gboolean close_event = FALSE;
++   GError *error = NULL;
++
++   g_signal_connect (test->server, "error", G_CALLBACK (on_error_copy), &error);
++   g_signal_connect (test->client, "closed", G_CALLBACK (on_close_set_flag), &close_event);
++
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 128 * 1024);
++
++   soup_websocket_connection_set_max_incoming_payload_size (test->server, 0);
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 0);
++
++   /* The message to the client is dropped due to the client's limit. */
++   sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
++   soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
++   g_bytes_unref (sent);
++   WAIT_UNTIL (close_event);
++   g_assert_null (received);
++   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++   g_assert_no_error (test->client_error);
++}
++
++static void
++test_send_exceeding_server_max_payload_size (Test *test,
++                                             gconstpointer data)
++{
++   GBytes *sent = NULL;
++   GBytes *received = NULL;
++   gboolean close_event = FALSE;
++   GError *error = NULL;
++
++   g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
++   g_signal_connect (test->server, "closed", G_CALLBACK (on_close_set_flag), &close_event);
++
++   soup_websocket_connection_set_max_incoming_payload_size (test->client, 0);
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 0);
++
++   g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 128 * 1024);
++
++   /* The message to the server is dropped due to the server's limit. */
++   sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
++   soup_websocket_connection_send_text (test->client, g_bytes_get_data (sent, NULL));
++   g_bytes_unref (sent);
++   WAIT_UNTIL (close_event);
++   g_assert_null (received);
++   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++   g_assert_no_error (test->client_error);
++}
++
++static void
++test_send_exceeding_client_max_message_size (Test *test,
++                                             gconstpointer data)
++{
++   GBytes *sent = NULL;
++   GBytes *received = NULL;
++   gboolean close_event = FALSE;
++   GError *error = NULL;
++
++   g_signal_connect (test->server, "error", G_CALLBACK (on_error_copy), &error);
++   g_signal_connect (test->client, "closed", G_CALLBACK (on_close_set_flag), &close_event);
++
++   soup_websocket_connection_set_max_total_message_size (test->client, 128 * 1024);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 128 * 1024);
++
++   soup_websocket_connection_set_max_total_message_size (test->server, 0);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 0);
++
++   /* The message to the client is dropped due to the client's limit. */
++   sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
++   soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
++   g_bytes_unref (sent);
++   WAIT_UNTIL (close_event);
++   g_assert_null (received);
++   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++   g_assert_no_error (test->client_error);
++}
++
++static void
++test_send_exceeding_server_max_message_size (Test *test,
++                                             gconstpointer data)
++{
++   GBytes *sent = NULL;
++   GBytes *received = NULL;
++   gboolean close_event = FALSE;
++   GError *error = NULL;
++
++   g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
++   g_signal_connect (test->server, "closed", G_CALLBACK (on_close_set_flag), &close_event);
++
++   soup_websocket_connection_set_max_total_message_size (test->client, 0);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 0);
++
++   /* Set the server message total message size manually, because its
++    * default is different for direct connection vs. soup connection.
++    */
++   soup_websocket_connection_set_max_total_message_size (test->server, 128 * 1024);
++   g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 128 * 1024);
++
++   /* The message to the server is dropped due to the server's limit. */
++   sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
++   soup_websocket_connection_send_text (test->client, g_bytes_get_data (sent, NULL));
++   g_bytes_unref (sent);
++   WAIT_UNTIL (close_event);
++   g_assert_null (received);
++   g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++   g_assert_no_error (test->client_error);
++}
++
++
+ static void
+ test_send_empty_packets (Test *test,
+ 			 gconstpointer data)
+@@ -2064,11 +2208,47 @@ main (int argc,
+ 
+ 	g_test_add ("/websocket/direct/send-big-packets", Test, NULL,
+ 		    setup_direct_connection,
+-		    test_send_big_packets,
++		    test_send_big_packets_direct,
+ 		    teardown_direct_connection);
+ 	g_test_add ("/websocket/soup/send-big-packets", Test, NULL,
+ 		    setup_soup_connection,
+-		    test_send_big_packets,
++		    test_send_big_packets_soup,
++		    teardown_soup_connection);
++
++	g_test_add ("/websocket/direct/send-exceeding-client-max-payload-size", Test, NULL,
++		    setup_direct_connection,
++		    test_send_exceeding_client_max_payload_size,
++		    teardown_direct_connection);
++	g_test_add ("/websocket/soup/send-exceeding-client-max-payload-size", Test, NULL,
++		    setup_soup_connection,
++		    test_send_exceeding_client_max_payload_size,
++		    teardown_soup_connection);
++
++	g_test_add ("/websocket/direct/send-exceeding-server-max-payload-size", Test, NULL,
++		    setup_direct_connection,
++		    test_send_exceeding_server_max_payload_size,
++		    teardown_direct_connection);
++	g_test_add ("/websocket/soup/send-exceeding-server-max-payload-size", Test, NULL,
++		    setup_soup_connection,
++		    test_send_exceeding_server_max_payload_size,
++		    teardown_soup_connection);
++
++	g_test_add ("/websocket/direct/send-exceeding-client-max-message-size", Test, NULL,
++		    setup_direct_connection,
++		    test_send_exceeding_client_max_message_size,
++		    teardown_direct_connection);
++	g_test_add ("/websocket/soup/send-exceeding-client-max-message-size", Test, NULL,
++		    setup_soup_connection,
++		    test_send_exceeding_client_max_message_size,
++		    teardown_soup_connection);
++
++	g_test_add ("/websocket/direct/send-exceeding-server-max-message-size", Test, NULL,
++		    setup_direct_connection,
++		    test_send_exceeding_server_max_message_size,
++		    teardown_direct_connection);
++	g_test_add ("/websocket/soup/send-exceeding-server-max-message-size", Test, NULL,
++		    setup_soup_connection,
++		    test_send_exceeding_server_max_message_size,
+ 		    teardown_soup_connection);
+ 
+ 	g_test_add ("/websocket/direct/send-empty-packets", Test, NULL,
+@@ -2217,11 +2397,11 @@ main (int argc,
+ 
+ 	g_test_add ("/websocket/direct/deflate-send-big-packets", Test, NULL,
+ 		    setup_direct_connection_with_extensions,
+-		    test_send_big_packets,
++		    test_send_big_packets_direct,
+ 		    teardown_direct_connection);
+ 	g_test_add ("/websocket/soup/deflate-send-big-packets", Test, NULL,
+ 		    setup_soup_connection_with_extensions,
+-		    test_send_big_packets,
++		    test_send_big_packets_soup,
+ 		    teardown_soup_connection);
+ 
+ 	g_test_add ("/websocket/direct/deflate-send-empty-packets", Test, NULL,
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 6be31806f1..fc4a286dcf 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -47,6 +47,10 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4945.patch \
            file://CVE-2025-12105.patch \
            file://CVE-2025-14523.patch \
+           file://CVE-2025-32049-1.patch \
+           file://CVE-2025-32049-2.patch \
+           file://CVE-2025-32049-3.patch \
+           file://CVE-2025-32049-4.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 

