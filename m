Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370DC103A98D
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 02:19:29 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13715.1774405167988063861
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 19:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ja2ctSDX;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8296dabef74so4968400b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 19:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774405167; x=1775009967; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dbNVcvnrBOWbAZp3MC8F+U60KsVa9o5DlSzpyqyT28=;
        b=Ja2ctSDXKcN6LPJOU9UYxGIHVaq1AA1NT1gRigH5OPcqe00IjAn1iPPRQjqGLNh9v9
         3x33L58nwDagRxQ/fvymz7OiR9IM1zlDLQYCIvJgkarzvthGIu469NoiO+AJ++VTcdNY
         AKMD1vhcSZDr+KppEf64Rc6BxF6syF1DjQrRJhiYzL2IdyMLcvIGo7jEYzohMo3wLq7U
         V69hzmLiAqUAO/xvM9aS1K1ivRNjx9cPKKS3BPMf7JSYwacSdWFzSrmEscAF4g/LmXcu
         AWtJAo3VmxmClrE0wddItYl78WtuxNESitwlpWJFAezZKgE6tva+tumqkhx3jZt0gI+m
         I6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774405167; x=1775009967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9dbNVcvnrBOWbAZp3MC8F+U60KsVa9o5DlSzpyqyT28=;
        b=anFsAkDT9QH50e0Z7gk+hxjExnU9EAAfZ108f7Ks2s6boBg5eNIy/NocQCpBrd/ztv
         haaKAQ1Vs7eC9vYvxSeBVHe+vayU6mU0VZze+2cqODpu2a5e/tpg8hqnfUci6lkL3u1p
         LXPeJTZZp3PpiT7Nn75z4F16RT8/pr4YjZNRM6N4QxH6vQtPH47hQLi5ZRlov6uHQVU/
         hCKXKFRHk4VcxVJ0StNSglCASLNH635rBwhCmkQ2vhfOF/E1zKSX9lHA2IX3OgB/7jGF
         sKADnaXI+5DDlnkX92T7Q2Xd6/+19qx4V0gtQiZ9r7P1ILRsG2yaSIUskG0t1MDqsJc+
         Dsmw==
X-Gm-Message-State: AOJu0Yzw4i6MixACPOaYxlRny/rDnJYb3/i/0btIYWibQEmOotTO/Gu3
	u2YQVgECzxvKgKOFM/kJVCcU92/AiPWJc2thj0HiCr9uY3QrFeJO7kq13rdq+HPN
X-Gm-Gg: ATEYQzyV5zByMGs635cM2R/09PqoAF2Hq4T1IFxAtZBVArBdQWMe4RTEdkwxqcVhBj6
	PjG1g4shROEYNgjrJOpjjyKizuN6aHvUYpIUgtIaorrF8xAqmEAPUtCxMPbHe1T1E8JB/QgFQ4Q
	yawOewAqmaO/6cezNoPd5aUqKbA5rJXEnILnZ82k0HpxcyCBZVpatFlwbODqThISW0y+NdED+J6
	hCctjVk06q5Gz7mGMSyxu8oBpcCa1Gxk4nbRKugjEYQlDd9nb8WT+arU1hHqK0Rj5qTG4GqwdFP
	HbFUbIscjgg4rNFGiwgMrRW3Of/IgUBD/WdWLNrnfE7PuN2YVRLNXIcg/yLBzSLYPd5krEmkGnm
	uYjrLe10s6v3pDOpDdUGOb0VMpT1o+ZUDtOYtQM5JBgZM4ZyzAUWncqvkYPsZKlQUgKW22X4HxN
	8UAc4sfosdTIa3ueqXKAtbrxVquePHnUaqunvAaAsrpK5xag==
X-Received: by 2002:a05:6a00:4b0a:b0:829:809e:8981 with SMTP id d2e1a72fcca58-82c6e0e616dmr1758966b3a.31.1774405166973;
        Tue, 24 Mar 2026 19:19:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409f409sm13581235b3a.31.2026.03.24.19.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 19:19:26 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 03/12] libsoup: fix CVE-2025-32049/CVE-2026-1539
Date: Wed, 25 Mar 2026 15:18:47 +1300
Message-ID: <20260325021856.4053666-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
References: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 02:19:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233841

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/390
https://gitlab.gnome.org/GNOME/libsoup/-/issues/489

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c226dc8a4129717b433863f70fd90d66380eb571)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libsoup/libsoup/CVE-2025-32049-1.patch    | 229 ++++++++++++++
 .../libsoup/libsoup/CVE-2025-32049-2.patch    |  34 ++
 .../libsoup/libsoup/CVE-2025-32049-3.patch    | 133 ++++++++
 .../libsoup/libsoup/CVE-2025-32049-4.patch    | 291 ++++++++++++++++++
 .../libsoup/libsoup/CVE-2026-1539.patch       |  97 ++++++
 meta/recipes-support/libsoup/libsoup_3.6.6.bb |   7 +
 6 files changed, 791 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32049-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32049-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32049-3.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32049-4.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2026-1539.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-1.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-1.patch
new file mode 100644
index 0000000000..adec7b3cf0
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-1.patch
@@ -0,0 +1,229 @@
+From 46338bccc2ad9c34f892af19123f64ca2d9d866f Mon Sep 17 00:00:00 2001
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
+Change SOUP_AVAILABLE_IN_3_8 to SOUP_AVAILABLE_IN_3_6
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/db87805ab565d67533dfed2cb409dbfd63c7fdce]
+CVE: CVE-2025-32049
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/websocket/soup-websocket-connection.c | 106 +++++++++++++++++-
+ libsoup/websocket/soup-websocket-connection.h |   7 ++
+ 2 files changed, 110 insertions(+), 3 deletions(-)
+
+diff --git a/libsoup/websocket/soup-websocket-connection.c b/libsoup/websocket/soup-websocket-connection.c
+index 36e8459..a4fc36e 100644
+--- a/libsoup/websocket/soup-websocket-connection.c
++++ b/libsoup/websocket/soup-websocket-connection.c
+@@ -78,6 +78,7 @@ enum {
+ 	PROP_KEEPALIVE_INTERVAL,
+ 	PROP_KEEPALIVE_PONG_TIMEOUT,
+ 	PROP_EXTENSIONS,
++	PROP_MAX_TOTAL_MESSAGE_SIZE,
+ 
+         LAST_PROPERTY
+ };
+@@ -120,6 +121,7 @@ typedef struct {
+ 	char *origin;
+ 	char *protocol;
+ 	guint64 max_incoming_payload_size;
++	guint64 max_total_message_size;
+ 	guint keepalive_interval;
+ 	guint keepalive_pong_timeout;
+ 	guint64 last_keepalive_seq_num;
+@@ -164,6 +166,7 @@ typedef struct {
+ } SoupWebsocketConnectionPrivate;
+ 
+ #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
+ #define READ_BUFFER_SIZE 1024
+ #define MASK_LENGTH 4
+ 
+@@ -696,8 +699,8 @@ bad_data_error_and_close (SoupWebsocketConnection *self)
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
+@@ -713,6 +716,24 @@ too_big_error_and_close (SoupWebsocketConnection *self,
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
+@@ -973,6 +994,12 @@ process_contents (SoupWebsocketConnection *self,
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
+@@ -1111,7 +1138,7 @@ process_frame (SoupWebsocketConnection *self)
+ 	/* Safety valve */
+ 	if (priv->max_incoming_payload_size > 0 &&
+ 	    payload_len > priv->max_incoming_payload_size) {
+-		too_big_error_and_close (self, payload_len);
++		too_big_incoming_payload_error_and_close (self, payload_len);
+ 		return FALSE;
+ 	}
+ 
+@@ -1428,6 +1455,10 @@ soup_websocket_connection_get_property (GObject *object,
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
+@@ -1486,6 +1517,10 @@ soup_websocket_connection_set_property (GObject *object,
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
+@@ -1716,6 +1751,26 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
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
+@@ -2186,6 +2241,51 @@ soup_websocket_connection_set_max_incoming_payload_size (SoupWebsocketConnection
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
+index f047c0a..ea0cb58 100644
+--- a/libsoup/websocket/soup-websocket-connection.h
++++ b/libsoup/websocket/soup-websocket-connection.h
+@@ -88,6 +88,13 @@ SOUP_AVAILABLE_IN_ALL
+ void                soup_websocket_connection_set_max_incoming_payload_size (SoupWebsocketConnection *self,
+                                                                              guint64                  max_incoming_payload_size);
+ 
++SOUP_AVAILABLE_IN_3_6
++guint64             soup_websocket_connection_get_max_total_message_size    (SoupWebsocketConnection *self);
++
++SOUP_AVAILABLE_IN_3_6
++void                soup_websocket_connection_set_max_total_message_size    (SoupWebsocketConnection *self,
++                                                                             guint64                  max_total_message_size);
++
+ SOUP_AVAILABLE_IN_ALL
+ guint               soup_websocket_connection_get_keepalive_interval (SoupWebsocketConnection *self);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-2.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-2.patch
new file mode 100644
index 0000000000..4cb9cf201b
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-2.patch
@@ -0,0 +1,34 @@
+From c00f1e961a17c0af1cd34881f64db2948f32bb65 Mon Sep 17 00:00:00 2001
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
+index c924601..1678042 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -615,6 +615,11 @@ test_send_big_packets (Test *test,
+ 	soup_websocket_connection_set_max_incoming_payload_size (test->server, 1000 * 1000 + 1);
+ 	g_assert_true (soup_websocket_connection_get_max_incoming_payload_size (test->server) == (1000 * 1000 + 1));
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
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-3.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-3.patch
new file mode 100644
index 0000000000..b5ccf374bf
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-3.patch
@@ -0,0 +1,133 @@
+From aa189f8bf0593427c67e0becb13f60f2da2fea26 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Thu, 8 May 2025 16:16:25 -0500
+Subject: [PATCH 3/4] Set message size limit in SoupServer rather than
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
+ libsoup/server/soup-server.c                  | 24 +++++++++++++++----
+ libsoup/websocket/soup-websocket-connection.c | 24 +++++++++++++------
+ 2 files changed, 36 insertions(+), 12 deletions(-)
+
+diff --git a/libsoup/server/soup-server.c b/libsoup/server/soup-server.c
+index 63af0cf..023abed 100644
+--- a/libsoup/server/soup-server.c
++++ b/libsoup/server/soup-server.c
+@@ -188,6 +188,16 @@ static GParamSpec *properties[LAST_PROPERTY] = { NULL, };
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
+@@ -952,11 +962,15 @@ complete_websocket_upgrade (SoupServer        *server,
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
+index a4fc36e..f60297c 100644
+--- a/libsoup/websocket/soup-websocket-connection.c
++++ b/libsoup/websocket/soup-websocket-connection.c
+@@ -166,7 +166,6 @@ typedef struct {
+ } SoupWebsocketConnectionPrivate;
+ 
+ #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
+-#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
+ #define READ_BUFFER_SIZE 1024
+ #define MASK_LENGTH 4
+ 
+@@ -1681,9 +1680,10 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+ 	/**
+ 	 * SoupWebsocketConnection:max-incoming-payload-size:
+ 	 *
+-	 * The maximum payload size for incoming packets.
++	 * The maximum payload size for incoming packets, or 0 to not limit it.
+ 	 *
+-	 * The protocol expects or 0 to not limit it.
++	 * Each message may consist of multiple packets, so also refer to
++	 * [property@WebSocketConnection:max-total-message-size].
+ 	 */
+         properties[PROP_MAX_INCOMING_PAYLOAD_SIZE] =
+                 g_param_spec_uint64 ("max-incoming-payload-size",
+@@ -1754,9 +1754,19 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+ 	/**
+ 	 * SoupWebsocketConnection:max-total-message-size:
+ 	 *
+-	 * The total message size for incoming packets.
++	 * The maximum size for incoming messages.
+ 	 *
+-	 * The protocol expects or 0 to not limit it.
++	 * Set to a value to limit the total message size, or 0 to not
++	 * limit it.
++	 *
++	 * [method@Server.add_websocket_handler] will set this to a nonzero
++	 * default value to mitigate denial of service attacks. Clients must
++	 * choose their own default if they need to mitigate denial of service
++	 * attacks. You also need to set your own default if creating your own
++	 * server SoupWebsocketConnection without using SoupServer.
++	 *
++	 * Each message may consist of multiple packets, so also refer to
++	 * [property@WebSocketConnection:max-incoming-payload-size].
+ 	 *
+ 	 * Since: 3.8
+ 	 */
+@@ -1766,7 +1776,7 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+                                      "Max total message size ",
+                                      0,
+                                      G_MAXUINT64,
+-                                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++                                     0,
+                                      G_PARAM_READWRITE |
+                                      G_PARAM_CONSTRUCT |
+                                      G_PARAM_STATIC_STRINGS);
+@@ -2256,7 +2266,7 @@ soup_websocket_connection_get_max_total_message_size (SoupWebsocketConnection *s
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
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-4.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-4.patch
new file mode 100644
index 0000000000..c89637eae2
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32049-4.patch
@@ -0,0 +1,291 @@
+From 800cbde5e42131bdea3d6f30808b7e034d45d438 Mon Sep 17 00:00:00 2001
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
+ tests/websocket-test.c | 213 +++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 196 insertions(+), 17 deletions(-)
+
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c
+index 1678042..60da66f 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -591,16 +591,9 @@ test_send_big_packets (Test *test,
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
+-	g_assert_true (g_bytes_equal (sent, received));
+-	g_bytes_unref (sent);
+-	g_bytes_unref (received);
+-	received = NULL;
++	signal_id = g_signal_connect (test->client, "message", G_CALLBACK (on_text_message), &received);
+ 
+ 	sent = g_bytes_new_take (g_strnfill (100 * 1000, '?'), 100 * 1000);
+ 	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
+@@ -611,23 +604,173 @@ test_send_big_packets (Test *test,
+ 	received = NULL;
+ 
+ 	soup_websocket_connection_set_max_incoming_payload_size (test->client, 1000 * 1000 + 1);
+-	g_assert_true (soup_websocket_connection_get_max_incoming_payload_size (test->client) == (1000 * 1000 + 1));
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 1000 * 1000 + 1);
+ 	soup_websocket_connection_set_max_incoming_payload_size (test->server, 1000 * 1000 + 1);
+-	g_assert_true (soup_websocket_connection_get_max_incoming_payload_size (test->server) == (1000 * 1000 + 1));
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
+ 	g_assert_true (g_bytes_equal (sent, received));
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
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 128 * 1024);
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 0);
++
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 128 * 1024);
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 0);
++
++	test_send_big_packets (test, data);
++}
++
++static void
++test_send_big_packets_soup (Test *test,
++                            gconstpointer data)
++{
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 128 * 1024);
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 0);
++
++	/* Max total message size defaults to 0 (unlimited), but SoupServer applies its own limit by default. */
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 128 * 1024);
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 128 * 1024);
++
++	test_send_big_packets (test, data);
++}
++
++static void
++test_send_exceeding_client_max_payload_size (Test *test,
++                                             gconstpointer data)
++{
++	GBytes *sent = NULL;
++	GBytes *received = NULL;
++	gboolean close_event = FALSE;
++	GError *error = NULL;
++
++	g_signal_connect (test->server, "error", G_CALLBACK (on_error_copy), &error);
++	g_signal_connect (test->client, "closed", G_CALLBACK (on_close_set_flag), &close_event);
++
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 128 * 1024);
++
++	soup_websocket_connection_set_max_incoming_payload_size (test->server, 0);
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 0);
++
++	/* The message to the client is dropped due to the client's limit. */
++	sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
++	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
++	g_bytes_unref (sent);
++	WAIT_UNTIL (close_event);
++	g_assert_null (received);
++	g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++	g_assert_no_error (test->client_error);
++}
++
++static void
++test_send_exceeding_server_max_payload_size (Test *test,
++                                             gconstpointer data)
++{
++	GBytes *sent = NULL;
++	GBytes *received = NULL;
++	gboolean close_event = FALSE;
++	GError *error = NULL;
++
++	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
++	g_signal_connect (test->server, "closed", G_CALLBACK (on_close_set_flag), &close_event);
++
++	soup_websocket_connection_set_max_incoming_payload_size (test->client, 0);
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->client), ==, 0);
++
++	g_assert_cmpuint (soup_websocket_connection_get_max_incoming_payload_size (test->server), ==, 128 * 1024);
++
++	/* The message to the server is dropped due to the server's limit. */
++	sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
++	soup_websocket_connection_send_text (test->client, g_bytes_get_data (sent, NULL));
++	g_bytes_unref (sent);
++	WAIT_UNTIL (close_event);
++	g_assert_null (received);
++	g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++	g_assert_no_error (test->client_error);
++}
++
++static void
++test_send_exceeding_client_max_message_size (Test *test,
++                                             gconstpointer data)
++{
++	GBytes *sent = NULL;
++	GBytes *received = NULL;
++	gboolean close_event = FALSE;
++	GError *error = NULL;
++
++	g_signal_connect (test->server, "error", G_CALLBACK (on_error_copy), &error);
++	g_signal_connect (test->client, "closed", G_CALLBACK (on_close_set_flag), &close_event);
++
++	soup_websocket_connection_set_max_total_message_size (test->client, 128 * 1024);
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 128 * 1024);
++
++	soup_websocket_connection_set_max_total_message_size (test->server, 0);
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 0);
++
++	/* The message to the client is dropped due to the client's limit. */
++	sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
++	soup_websocket_connection_send_text (test->server, g_bytes_get_data (sent, NULL));
++	g_bytes_unref (sent);
++	WAIT_UNTIL (close_event);
++	g_assert_null (received);
++	g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++	g_assert_no_error (test->client_error);
++}
++
++static void
++test_send_exceeding_server_max_message_size (Test *test,
++                                             gconstpointer data)
++{
++	GBytes *sent = NULL;
++	GBytes *received = NULL;
++	gboolean close_event = FALSE;
++	GError *error = NULL;
++
++	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
++	g_signal_connect (test->server, "closed", G_CALLBACK (on_close_set_flag), &close_event);
++
++	soup_websocket_connection_set_max_total_message_size (test->client, 0);
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->client), ==, 0);
++
++	/* Set the server message total message size manually, because its
++	 * default is different for direct connection vs. soup connection.
++	 */
++	soup_websocket_connection_set_max_total_message_size (test->server, 128 * 1024);
++	g_assert_cmpuint (soup_websocket_connection_get_max_total_message_size (test->server), ==, 128 * 1024);
++
++	/* The message to the server is dropped due to the server's limit. */
++	sent = g_bytes_new_take (g_strnfill (1000 * 1000, '?'), 1000 * 1000);
++	soup_websocket_connection_send_text (test->client, g_bytes_get_data (sent, NULL));
++	g_bytes_unref (sent);
++	WAIT_UNTIL (close_event);
++	g_assert_null (received);
++	g_assert_error (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++	g_assert_no_error (test->client_error);
++}
++
+ static void
+ test_send_empty_packets (Test *test,
+ 			 gconstpointer data)
+@@ -2262,11 +2405,47 @@ main (int argc,
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
+@@ -2421,11 +2600,11 @@ main (int argc,
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
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2026-1539.patch b/meta/recipes-support/libsoup/libsoup/CVE-2026-1539.patch
new file mode 100644
index 0000000000..e887b441df
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2026-1539.patch
@@ -0,0 +1,97 @@
+From 7a70f089e13cc113032b1459286835b72a2986af Mon Sep 17 00:00:00 2001
+From: Carlos Garcia Campos <cgarcia@igalia.com>
+Date: Tue, 20 Jan 2026 13:17:42 +0100
+Subject: [PATCH] Also remove Proxy-Authorization header on cross origin
+ redirect
+
+Closes #489
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/98c1285d9d78662c38bf14b4a128af01ccfdb446]
+CVE: CVE-2026-1539
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-session.c |  1 +
+ tests/httpd.conf.in    |  1 +
+ tests/proxy-test.c     | 34 ++++++++++++++++++++++++++++++++++
+ 3 files changed, 36 insertions(+)
+
+diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
+index 2d34022..386d145 100644
+--- a/libsoup/soup-session.c
++++ b/libsoup/soup-session.c
+@@ -1234,6 +1234,7 @@ soup_session_redirect_message (SoupSession *session,
+         /* Strip all credentials on cross-origin redirect. */
+         if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) {
+                 soup_message_headers_remove_common (soup_message_get_request_headers (msg), SOUP_HEADER_AUTHORIZATION);
++                soup_message_headers_remove_common (soup_message_get_request_headers (msg), SOUP_HEADER_PROXY_AUTHORIZATION);
+                 soup_message_set_auth (msg, NULL);
+         }
+ 
+diff --git a/tests/httpd.conf.in b/tests/httpd.conf.in
+index 809dc5c..cc0a116 100644
+--- a/tests/httpd.conf.in
++++ b/tests/httpd.conf.in
+@@ -34,6 +34,7 @@ LoadModule ssl_module           @APACHE_SSL_MODULE_DIR@/mod_ssl.so
+ DirectoryIndex index.txt
+ TypesConfig /dev/null
+ Redirect permanent /redirected /index.txt
++Redirect permanent /Basic/realm1/redirected https://127.0.0.1:47525/index.txt
+ 
+ # Prefer http1 for now because most of the tests expect http1 behavior.
+ Protocols http/1.1 h2
+diff --git a/tests/proxy-test.c b/tests/proxy-test.c
+index d730c8a..68c97ac 100644
+--- a/tests/proxy-test.c
++++ b/tests/proxy-test.c
+@@ -269,6 +269,39 @@ do_proxy_redirect_test (void)
+ 	soup_test_session_abort_unref (session);
+ }
+ 
++static void proxy_auth_redirect_message_restarted (SoupMessage *msg)
++{
++        if (soup_message_get_status (msg) != SOUP_STATUS_MOVED_PERMANENTLY)
++                return;
++
++        g_assert_null (soup_message_headers_get_one (soup_message_get_request_headers (msg), "Proxy-Authorization"));
++}
++
++static void
++do_proxy_auth_redirect_test (void)
++{
++        SoupSession *session;
++        SoupMessage *msg;
++        char *url;
++
++        SOUP_TEST_SKIP_IF_NO_APACHE;
++        SOUP_TEST_SKIP_IF_NO_TLS;
++
++        session = soup_test_session_new ("proxy-resolver", proxy_resolvers[AUTH_PROXY], NULL);
++
++        url = g_strconcat (HTTP_SERVER, "/Basic/realm1/redirected", NULL);
++        msg = soup_message_new (SOUP_METHOD_GET, url);
++        g_signal_connect (msg, "authenticate", G_CALLBACK (authenticate), NULL);
++        g_signal_connect (msg, "restarted", G_CALLBACK (proxy_auth_redirect_message_restarted), NULL);
++
++        soup_test_session_send_message (session, msg);
++        soup_test_assert_message_status (msg, SOUP_STATUS_OK);
++
++        g_free (url);
++        g_object_unref (msg);
++        soup_test_session_abort_unref (session);
++}
++
+ static void
+ do_proxy_auth_request (const char *url, SoupSession *session, gboolean do_read)
+ {
+@@ -402,6 +435,7 @@ main (int argc, char **argv)
+ 
+ 	g_test_add_data_func ("/proxy/fragment", base_uri, do_proxy_fragment_test);
+ 	g_test_add_func ("/proxy/redirect", do_proxy_redirect_test);
++        g_test_add_func ("/proxy/auth-redirect", do_proxy_auth_redirect_test);
+ 	g_test_add_func ("/proxy/auth-cache", do_proxy_auth_cache_test);
+         g_test_add_data_func ("/proxy/connect-error", base_https_uri, do_proxy_connect_error_test);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.6.6.bb b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
index f9dd5311a4..981e74d816 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.6.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
@@ -11,6 +11,13 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 
 SRC_URI[archive.sha256sum] = "51ed0ae06f9d5a40f401ff459e2e5f652f9a510b7730e1359ee66d14d4872740"
 
+SRC_URI += "file://CVE-2025-32049-1.patch \
+            file://CVE-2025-32049-2.patch \
+            file://CVE-2025-32049-3.patch \
+            file://CVE-2025-32049-4.patch \
+            file://CVE-2026-1539.patch \
+"
+
 PROVIDES = "libsoup-3.0"
 
 inherit gettext gnomebase upstream-version-is-even gobject-introspection gi-docgen vala

