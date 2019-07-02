Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2BF8F7E774
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 16:13:53 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id r1so8469742pfq.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2019 09:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eXrUxKlaVRZ6KrZjHqkiCt/jUscdIuuH2JJKAMWJc8w=;
	b=fpQemEN1ex/0qCFf6Zh+OxU79Yq7ZAyfiYpIcMyDyo1lsmjfvlLidcNzAxn66g6w52
	qbaXfmVHoq4OuRJ8MOPssH/MIHSIbW39dGeBk3/6rhg6QyHyPwTZZfj3NbNl4twSeKhj
	hj96AgQjgOwmlKoNZJEQzcScZOq+zMEnUTU9nN2bH302coW+NRSG2QOPMyE10i9oG1Jp
	ga670fK60KRM4JKrkA6V30pJwwg6CLLpcfZlcNqaEenGC6N3YuVUmJ+ah8Tcdh76WUoP
	L6d9wYAaBq0P7mQnQmVHaYiul3xRoheqbRaO13RkZj4WPRObXcemCWgCeWAljo3nkDtQ
	mwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eXrUxKlaVRZ6KrZjHqkiCt/jUscdIuuH2JJKAMWJc8w=;
	b=XxhGflaTIsr4+gHNMgQln7KEoNYsyjlCGrZwLlDuHorcJOY2roWqch/uOf9ZK4rMja
	hdFYR3cnBNKLn1JgxdhGvxpty1Rn49AFaWan7gv1rEeTm4178QcZ5v+ij3vs2HGYrmTE
	g7A5jBrHVLlH0UvsBTkRV9HjqjwE2Og1EKv0HIMO5zzM0UkG4dIcpF8X/fnwpDIc7gCK
	R/rSrLbaTxyoNaX1M6xedvmdEasB7w0PeXRxiSumoNpAU0V8T/+qmalS/HSX8dBaI4fW
	dYneOCz39pdfDFQi1og8micEm3HDGQ5LZFWVoXdU94STwbR0rnUgO2aYcX7xJIs79xsY
	7tKg==
X-Gm-Message-State: APjAAAXa79KQ9UJo/lww1zBuVxe/oYCHB0qsKgCdQCBS7sApxbJUnZsM
	KOBeXn8KwnCYsXgykeMQSYctTyM9E8s=
X-Google-Smtp-Source: APXvYqyuKtwhOawv+7nMFS5iCGG7L2iQ/mHVVZ6XLQj1XmaNRaS8ST3o0L15FNnzVedqzjcPC9a3lQ==
X-Received: by 2002:a62:3103:: with SMTP id x3mr61599pfx.107.1562084034001;
	Tue, 02 Jul 2019 09:13:54 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:81e7:b32d:c93c:ae01])
	by smtp.gmail.com with ESMTPSA id
	q10sm11917083pgg.35.2019.07.02.09.13.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Jul 2019 09:13:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2019 09:13:51 -0700
Message-Id: <1562084031-15755-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH] glib: Security fix for CVE-2019-9633
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Jul 2019 16:13:53 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: gnome.org
MR: 98802
Type: Security Fix
Disposition: Backport from https://gitlab.gnome.org/GNOME/glib/commit/d553d92d6e9f53cbe5a34166fcb919ba652c6a8e
ChangeID: b73c332f27f47ddc1b1cfd7424f24778acc0c318
Description:

includes supporting patch.
Fixes CVE-2019-9633

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../glib-2.0/glib-2.0/CVE-2019-9633_p1.patch       | 316 +++++++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2019-9633_p2.patch       | 231 +++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb      |   2 +
 3 files changed, 549 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-9633_p1.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-9633_p2.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-9633_p1.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-9633_p1.patch
new file mode 100644
index 0000000..f95716a
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-9633_p1.patch
@@ -0,0 +1,316 @@
+From c1e32b90576af11556c8a9178e43902f3394a4b0 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Mon, 29 Oct 2018 09:53:07 -0400
+Subject: [PATCH] gsocketclient: Improve handling of slow initial connections
+
+Currently a new connection will not be attempted until the previous
+one has timed out and as the current API only exposes a single
+timeout value in practice it often means that it will wait 30 seconds
+(or forever with 0 (the default)) on each connection.
+
+This is unacceptable so we are now trying to follow the behavior
+RFC 8305 recommends by making multiple connection attempts if
+the connection takes longer than 250ms. The first connection
+to make it to completion then wins.
+
+Upstream-Status: Backport
+CVE: CVE-2019-9633 patch 1
+Affects: < 2.59.2
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ gio/gsocketclient.c | 176 ++++++++++++++++++++++++++++++++++++++++++++--------
+ 1 file changed, 151 insertions(+), 25 deletions(-)
+
+diff --git a/gio/gsocketclient.c b/gio/gsocketclient.c
+index ddd1497..5c6513c 100644
+--- a/gio/gsocketclient.c
++++ b/gio/gsocketclient.c
+@@ -2,6 +2,7 @@
+  *
+  * Copyright © 2008, 2009 codethink
+  * Copyright © 2009 Red Hat, Inc
++ * Copyright © 2018 Igalia S.L.
+  *
+  * This library is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU Lesser General Public
+@@ -49,6 +50,10 @@
+ #include <gio/ginetaddress.h>
+ #include "glibintl.h"
+ 
++/* As recommended by RFC 8305 this is the time it waits
++ * on a connection before starting another concurrent attempt.
++ */
++#define HAPPY_EYEBALLS_CONNECTION_ATTEMPT_TIMEOUT_MS 250
+ 
+ /**
+  * SECTION:gsocketclient
+@@ -1328,28 +1333,82 @@ typedef struct
+   GSocketConnectable *connectable;
+   GSocketAddressEnumerator *enumerator;
+   GProxyAddress *proxy_addr;
+-  GSocketAddress *current_addr;
+-  GSocket *current_socket;
++  GSocket *socket;
+   GIOStream *connection;
+ 
++  GSList *connection_attempts;
+   GError *last_error;
+ } GSocketClientAsyncConnectData;
+ 
++static void connection_attempt_unref (gpointer attempt);
++
+ static void
+ g_socket_client_async_connect_data_free (GSocketClientAsyncConnectData *data)
+ {
+   g_clear_object (&data->connectable);
+   g_clear_object (&data->enumerator);
+   g_clear_object (&data->proxy_addr);
+-  g_clear_object (&data->current_addr);
+-  g_clear_object (&data->current_socket);
++  g_clear_object (&data->socket);
+   g_clear_object (&data->connection);
++  g_slist_free_full (data->connection_attempts, connection_attempt_unref);
+ 
+   g_clear_error (&data->last_error);
+ 
+   g_slice_free (GSocketClientAsyncConnectData, data);
+ }
+ 
++typedef struct
++{
++  GSocketAddress *address;
++  GSocket *socket;
++  GIOStream *connection;
++  GSocketClientAsyncConnectData *data; /* unowned */
++  GSource *timeout_source;
++  GCancellable *cancellable;
++  grefcount ref;
++} ConnectionAttempt;
++
++static ConnectionAttempt *
++connection_attempt_new (void)
++{
++  ConnectionAttempt *attempt = g_new0 (ConnectionAttempt, 1);
++  g_ref_count_init (&attempt->ref);
++  return attempt;
++}
++
++static ConnectionAttempt *
++connection_attempt_ref (ConnectionAttempt *attempt)
++{
++  g_ref_count_inc (&attempt->ref);
++  return attempt;
++}
++
++static void
++connection_attempt_unref (gpointer pointer)
++{
++  ConnectionAttempt *attempt = pointer;
++  if (g_ref_count_dec (&attempt->ref))
++    {
++      g_clear_object (&attempt->address);
++      g_clear_object (&attempt->socket);
++      g_clear_object (&attempt->connection);
++      g_clear_object (&attempt->cancellable);
++      if (attempt->timeout_source)
++        {
++          g_source_destroy (attempt->timeout_source);
++          g_source_unref (attempt->timeout_source);
++        }
++      g_free (attempt);
++    }
++}
++
++static void
++connection_attempt_remove (ConnectionAttempt *attempt)
++{
++  attempt->data->connection_attempts = g_slist_remove (attempt->data->connection_attempts, attempt);
++  connection_attempt_unref (attempt);
++}
++
+ static void
+ g_socket_client_async_connect_complete (GSocketClientAsyncConnectData *data)
+ {
+@@ -1359,8 +1418,7 @@ g_socket_client_async_connect_complete (GSocketClientAsyncConnectData *data)
+     {
+       GSocketConnection *wrapper_connection;
+ 
+-      wrapper_connection = g_tcp_wrapper_connection_new (data->connection,
+-							 data->current_socket);
++      wrapper_connection = g_tcp_wrapper_connection_new (data->connection, data->socket);
+       g_object_unref (data->connection);
+       data->connection = (GIOStream *)wrapper_connection;
+     }
+@@ -1389,8 +1447,7 @@ static void
+ enumerator_next_async (GSocketClientAsyncConnectData *data)
+ {
+   /* We need to cleanup the state */
+-  g_clear_object (&data->current_socket);
+-  g_clear_object (&data->current_addr);
++  g_clear_object (&data->socket);
+   g_clear_object (&data->proxy_addr);
+   g_clear_object (&data->connection);
+ 
+@@ -1485,34 +1542,68 @@ g_socket_client_connected_callback (GObject      *source,
+ 				    GAsyncResult *result,
+ 				    gpointer      user_data)
+ {
+-  GSocketClientAsyncConnectData *data = user_data;
++  ConnectionAttempt *attempt = user_data;
++  GSocketClientAsyncConnectData *data = attempt->data;
++  GSList *l;
+   GError *error = NULL;
+   GProxy *proxy;
+   const gchar *protocol;
+ 
+-  if (g_task_return_error_if_cancelled (data->task))
++  /* data is NULL once the task is completed */
++  if (data && g_task_return_error_if_cancelled (data->task))
+     {
+       g_object_unref (data->task);
++      connection_attempt_unref (attempt);
+       return;
+     }
+ 
++  if (attempt->timeout_source)
++    {
++      g_source_destroy (attempt->timeout_source);
++      g_clear_pointer (&attempt->timeout_source, g_source_unref);
++    }
++
+   if (!g_socket_connection_connect_finish (G_SOCKET_CONNECTION (source),
+ 					   result, &error))
+     {
+-      clarify_connect_error (error, data->connectable,
+-			     data->current_addr);
+-      set_last_error (data, error);
++      if (!g_cancellable_is_cancelled (attempt->cancellable))
++        {
++          clarify_connect_error (error, data->connectable, attempt->address);
++          set_last_error (data, error);
++        }
++      else
++        g_clear_error (&error);
++
++      if (data)
++        {
++          connection_attempt_remove (attempt);
++          enumerator_next_async (data);
++        }
++      else
++        connection_attempt_unref (attempt);
+ 
+-      /* try next one */
+-      enumerator_next_async (data);
+       return;
+     }
+ 
++  data->socket = g_steal_pointer (&attempt->socket);
++  data->connection = g_steal_pointer (&attempt->connection);
++
++  for (l = data->connection_attempts; l; l = g_slist_next (l))
++    {
++      ConnectionAttempt *attempt_entry = l->data;
++      g_cancellable_cancel (attempt_entry->cancellable);
++      attempt_entry->data = NULL;
++      connection_attempt_unref (attempt_entry);
++    }
++  g_slist_free (data->connection_attempts);
++  data->connection_attempts = NULL;
++  connection_attempt_unref (attempt);
++
+   g_socket_connection_set_cached_remote_address ((GSocketConnection*)data->connection, NULL);
+   g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_CONNECTED, data->connectable, data->connection);
+ 
+   /* wrong, but backward compatible */
+-  g_socket_set_blocking (data->current_socket, TRUE);
++  g_socket_set_blocking (data->socket, TRUE);
+ 
+   if (!data->proxy_addr)
+     {
+@@ -1565,6 +1656,26 @@ g_socket_client_connected_callback (GObject      *source,
+     }
+ }
+ 
++static gboolean
++on_connection_attempt_timeout (gpointer data)
++{
++  ConnectionAttempt *attempt = data;
++
++  enumerator_next_async (attempt->data);
++
++  g_clear_pointer (&attempt->timeout_source, g_source_unref);
++  return G_SOURCE_REMOVE;
++}
++
++static void
++on_connection_cancelled (GCancellable *cancellable,
++                         gpointer      data)
++{
++  GCancellable *attempt_cancellable = data;
++
++  g_cancellable_cancel (attempt_cancellable);
++}
++
+ static void
+ g_socket_client_enumerator_callback (GObject      *object,
+ 				     GAsyncResult *result,
+@@ -1573,6 +1684,7 @@ g_socket_client_enumerator_callback (GObject      *object,
+   GSocketClientAsyncConnectData *data = user_data;
+   GSocketAddress *address = NULL;
+   GSocket *socket;
++  ConnectionAttempt *attempt;
+   GError *error = NULL;
+ 
+   if (g_task_return_error_if_cancelled (data->task))
+@@ -1585,6 +1697,9 @@ g_socket_client_enumerator_callback (GObject      *object,
+ 						     result, &error);
+   if (address == NULL)
+     {
++      if (data->connection_attempts)
++        return;
++
+       g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_COMPLETE, data->connectable, NULL);
+       if (!error)
+ 	{
+@@ -1621,16 +1736,27 @@ g_socket_client_enumerator_callback (GObject      *object,
+       return;
+     }
+ 
+-  data->current_socket = socket;
+-  data->current_addr = address;
+-  data->connection = (GIOStream *) g_socket_connection_factory_create_connection (socket);
+-
+-  g_socket_connection_set_cached_remote_address ((GSocketConnection*)data->connection, address);
+-  g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_CONNECTING, data->connectable, data->connection);
+-  g_socket_connection_connect_async (G_SOCKET_CONNECTION (data->connection),
++  attempt = connection_attempt_new ();
++  attempt->data = data;
++  attempt->socket = socket;
++  attempt->address = address;
++  attempt->cancellable = g_cancellable_new ();
++  attempt->connection = (GIOStream *)g_socket_connection_factory_create_connection (socket);
++  attempt->timeout_source = g_timeout_source_new (HAPPY_EYEBALLS_CONNECTION_ATTEMPT_TIMEOUT_MS);
++  g_source_set_callback (attempt->timeout_source, on_connection_attempt_timeout, attempt, NULL);
++  g_source_attach (attempt->timeout_source, g_main_context_get_thread_default ());
++  data->connection_attempts = g_slist_append (data->connection_attempts, attempt);
++
++  if (g_task_get_cancellable (data->task))
++    g_cancellable_connect (g_task_get_cancellable (data->task), G_CALLBACK (on_connection_cancelled),
++                           g_object_ref (attempt->cancellable), g_object_unref);
++
++  g_socket_connection_set_cached_remote_address ((GSocketConnection *)attempt->connection, address);
++  g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_CONNECTING, data->connectable, attempt->connection);
++  g_socket_connection_connect_async (G_SOCKET_CONNECTION (attempt->connection),
+ 				     address,
+-				     g_task_get_cancellable (data->task),
+-				     g_socket_client_connected_callback, data);
++				     attempt->cancellable,
++				     g_socket_client_connected_callback, connection_attempt_ref (attempt));
+ }
+ 
+ /**
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-9633_p2.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-9633_p2.patch
new file mode 100644
index 0000000..3bb2f5d
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-9633_p2.patch
@@ -0,0 +1,231 @@
+From d553d92d6e9f53cbe5a34166fcb919ba652c6a8e Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Tue, 29 Jan 2019 10:07:06 -0500
+Subject: [PATCH] gsocketclient: Fix criticals
+
+This ensures the parent GTask is kept alive as long as an enumeration
+is running and trying to connect.
+
+Closes #1646
+Closes #1649
+
+Upstream-Status: Backport
+CVE: CVE-2019-9633 patch 2
+Affects: < 2.59.2
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ gio/gsocketclient.c            | 74 +++++++++++++++++++++++++++++-------------
+ gio/tests/gsocketclient-slow.c | 55 ++++++++++++++++++++++++++++++-
+ 2 files changed, 106 insertions(+), 23 deletions(-)
+
+Index: glib-2.58.0/gio/gsocketclient.c
+===================================================================
+--- glib-2.58.0.orig/gio/gsocketclient.c
++++ glib-2.58.0/gio/gsocketclient.c
+@@ -1327,7 +1327,7 @@ g_socket_client_connect_to_uri (GSocketC
+ 
+ typedef struct
+ {
+-  GTask *task;
++  GTask *task; /* unowned */
+   GSocketClient *client;
+ 
+   GSocketConnectable *connectable;
+@@ -1345,6 +1345,7 @@ static void connection_attempt_unref (gp
+ static void
+ g_socket_client_async_connect_data_free (GSocketClientAsyncConnectData *data)
+ {
++  data->task = NULL;
+   g_clear_object (&data->connectable);
+   g_clear_object (&data->enumerator);
+   g_clear_object (&data->proxy_addr);
+@@ -1444,13 +1445,19 @@ set_last_error (GSocketClientAsyncConnec
+ }
+ 
+ static void
+-enumerator_next_async (GSocketClientAsyncConnectData *data)
++enumerator_next_async (GSocketClientAsyncConnectData *data,
++                       gboolean                       add_task_ref)
+ {
+   /* We need to cleanup the state */
+   g_clear_object (&data->socket);
+   g_clear_object (&data->proxy_addr);
+   g_clear_object (&data->connection);
+ 
++  /* Each enumeration takes a ref. This arg just avoids repeated unrefs when
++     an enumeration starts another enumeration */
++  if (add_task_ref)
++    g_object_ref (data->task);
++
+   g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_RESOLVING, data->connectable, NULL);
+   g_socket_address_enumerator_next_async (data->enumerator,
+ 					  g_task_get_cancellable (data->task),
+@@ -1478,7 +1485,7 @@ g_socket_client_tls_handshake_callback (
+   else
+     {
+       g_object_unref (object);
+-      enumerator_next_async (data);
++      enumerator_next_async (data, FALSE);
+     }
+ }
+ 
+@@ -1509,7 +1516,7 @@ g_socket_client_tls_handshake (GSocketCl
+     }
+   else
+     {
+-      enumerator_next_async (data);
++      enumerator_next_async (data, FALSE);
+     }
+ }
+ 
+@@ -1530,13 +1537,24 @@ g_socket_client_proxy_connect_callback (
+     }
+   else
+     {
+-      enumerator_next_async (data);
++      enumerator_next_async (data, FALSE);
+       return;
+     }
+ 
+   g_socket_client_tls_handshake (data);
+ }
+ 
++static gboolean
++task_completed_or_cancelled (GTask *task)
++{
++  if (g_task_get_completed (task))
++    return TRUE;
++  else if (g_task_return_error_if_cancelled (task))
++      return TRUE;
++  else
++    return FALSE;
++}
++
+ static void
+ g_socket_client_connected_callback (GObject      *source,
+ 				    GAsyncResult *result,
+@@ -1549,8 +1567,7 @@ g_socket_client_connected_callback (GObj
+   GProxy *proxy;
+   const gchar *protocol;
+ 
+-  /* data is NULL once the task is completed */
+-  if (data && g_task_return_error_if_cancelled (data->task))
++  if (g_cancellable_is_cancelled (attempt->cancellable) || task_completed_or_cancelled (data->task))
+     {
+       g_object_unref (data->task);
+       connection_attempt_unref (attempt);
+@@ -1570,17 +1587,15 @@ g_socket_client_connected_callback (GObj
+         {
+           clarify_connect_error (error, data->connectable, attempt->address);
+           set_last_error (data, error);
++          connection_attempt_remove (attempt);
++          enumerator_next_async (data, FALSE);
+         }
+       else
+-        g_clear_error (&error);
+-
+-      if (data)
+         {
+-          connection_attempt_remove (attempt);
+-          enumerator_next_async (data);
++          g_clear_error (&error);
++          g_object_unref (data->task);
++          connection_attempt_unref (attempt);
+         }
+-      else
+-        connection_attempt_unref (attempt);
+ 
+       return;
+     }
+@@ -1592,7 +1607,6 @@ g_socket_client_connected_callback (GObj
+     {
+       ConnectionAttempt *attempt_entry = l->data;
+       g_cancellable_cancel (attempt_entry->cancellable);
+-      attempt_entry->data = NULL;
+       connection_attempt_unref (attempt_entry);
+     }
+   g_slist_free (data->connection_attempts);
+@@ -1625,7 +1639,7 @@ g_socket_client_connected_callback (GObj
+           G_IO_ERROR, G_IO_ERROR_NOT_SUPPORTED,
+           _("Proxying over a non-TCP connection is not supported."));
+ 
+-      enumerator_next_async (data);
++      enumerator_next_async (data, FALSE);
+     }
+   else if (g_hash_table_contains (data->client->priv->app_proxies, protocol))
+     {
+@@ -1652,7 +1666,7 @@ g_socket_client_connected_callback (GObj
+           _("Proxy protocol “%s” is not supported."),
+           protocol);
+ 
+-      enumerator_next_async (data);
++      enumerator_next_async (data, FALSE);
+     }
+ }
+ 
+@@ -1661,7 +1675,7 @@ on_connection_attempt_timeout (gpointer
+ {
+   ConnectionAttempt *attempt = data;
+ 
+-  enumerator_next_async (attempt->data);
++  enumerator_next_async (attempt->data, TRUE);
+ 
+   g_clear_pointer (&attempt->timeout_source, g_source_unref);
+   return G_SOURCE_REMOVE;
+@@ -1687,7 +1701,7 @@ g_socket_client_enumerator_callback (GOb
+   ConnectionAttempt *attempt;
+   GError *error = NULL;
+ 
+-  if (g_task_return_error_if_cancelled (data->task))
++  if (task_completed_or_cancelled (data->task))
+     {
+       g_object_unref (data->task);
+       return;
+@@ -1698,7 +1712,10 @@ g_socket_client_enumerator_callback (GOb
+   if (address == NULL)
+     {
+       if (data->connection_attempts)
+-        return;
++        {
++          g_object_unref (data->task);
++          return;
++        }
+ 
+       g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_COMPLETE, data->connectable, NULL);
+       if (!error)
+@@ -1732,7 +1749,7 @@ g_socket_client_enumerator_callback (GOb
+   if (socket == NULL)
+     {
+       g_object_unref (address);
+-      enumerator_next_async (data);
++      enumerator_next_async (data, FALSE);
+       return;
+     }
+ 
+@@ -1804,11 +1821,24 @@ g_socket_client_connect_async (GSocketCl
+   else
+     data->enumerator = g_socket_connectable_enumerate (connectable);
+ 
++  /* The flow and ownership here isn't quite obvious:
++    - The task starts an async attempt to connect.
++      - Each attempt holds a single ref on task.
++      - Each attempt may create new attempts by timing out (not a failure) so
++        there are multiple attempts happening in parallel.
++      - Upon failure an attempt will start a new attempt that steals its ref
++        until there are no more attempts left and it drops its ref.
++      - Upon success it will cancel all other attempts and continue on
++        to the rest of the connection (tls, proxies, etc) which do not
++        happen in parallel and at the very end drop its ref.
++      - Upon cancellation an attempt drops its ref.
++   */
++
+   data->task = g_task_new (client, cancellable, callback, user_data);
+   g_task_set_source_tag (data->task, g_socket_client_connect_async);
+   g_task_set_task_data (data->task, data, (GDestroyNotify)g_socket_client_async_connect_data_free);
+ 
+-  enumerator_next_async (data);
++  enumerator_next_async (data, FALSE);
+ }
+ 
+ /**
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
index 879bc48..f007596 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb
@@ -15,6 +15,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
            file://date-lt.patch \
            file://CVE-2019-12450.patch \
+           file://CVE-2019-9633_p1.patch \
+           file://CVE-2019-9633_p2.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.7.4


