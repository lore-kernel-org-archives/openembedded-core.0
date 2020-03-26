Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.31445.1585200465895723149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 22:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: haiqing.bai@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 02Q5RjLl006025
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2020 22:27:45 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Wed, 25 Mar 2020
 22:27:44 -0700
From: "haiqing" <haiqing.bai@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <haiqing.bai@windriver.com>
Subject: [OE-core][zeus][PATCH] glib-2.0: fix CVE-2020-6750
Date: Thu, 26 Mar 2020 13:27:12 +0800
Message-ID: <20200326052713.261929-1-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id 02Q5RjLl006025
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

GSocketClient in GNOME GLib through 2.62.4 may occasionally connect direc=
tly
to a target address instead of connecting via a proxy server when configu=
red
to do so, because the proxy_addr field is mishandled. This bug is timing-=
dependent
and may occur only sporadically depending on network delays. The greatest=
 security
relevance is in use cases where a proxy is used to help with privacy/anon=
ymity,
even though there is no technical barrier to a direct connection.

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 .../glib-2.0/glib-2.0/CVE-2020-6750.patch     | 741 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb |   1 +
 2 files changed, 742 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2020-6750.pat=
ch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2020-6750.patch b/me=
ta/recipes-core/glib-2.0/glib-2.0/CVE-2020-6750.patch
new file mode 100644
index 0000000000..6db3934978
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2020-6750.patch
@@ -0,0 +1,741 @@
+From 747f2c646f5a86ac58ad59be08036e81388e971d Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <tingping@tingping.se>
+Date: Thu, 23 Jan 2020 19:58:41 -0800
+Subject: [PATCH] Refactor g_socket_client_connect_async()
+
+This is a fairly large refactoring. The highlights are:
+
+- Removing in-progress connections/addresses from GSocketClientAsyncConn=
ectData:
+
+  This caused issues where multiple ConnectionAttempt's would step over =
eachother
+  and modify shared state causing bugs like accidentally bypassing a set=
 proxy.
+
+  Fixes #1871
+  Fixes #1989
+  Fixes #1902
+
+- Cancelling address enumeration on error/completion
+
+- Queuing successful TCP connections and doing application layer work se=
rially:
+
+  This is more in the spirit of Happy Eyeballs but it also greatly simpl=
ifies
+  the flow of connection handling so fewer tasks are happening in parall=
el
+  when they don't need to be.
+
+  The behavior also should more closely match that of g_socket_client_co=
nnect().
+
+- Better track the state of address enumeration:
+
+  Previously we were over eager to treat enumeration finishing as an err=
or.
+
+  Fixes #1872
+  See also #1982
+
+- Add more detailed documentation and logging.
+
+Closes #1995
+
+CVE: CVE-2020-6750
+
+Upstream-Status: Backport [ https://gitlab.gnome.org/GNOME/glib.git;
+commit=3D2722620e3291b930a3a228100d7c0e07b69534e3 ]
+
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ gio/gsocketclient.c | 459 ++++++++++++++++++++++++++++----------------
+ 1 file changed, 296 insertions(+), 163 deletions(-)
+
+diff --git a/gio/gsocketclient.c b/gio/gsocketclient.c
+index 81767c0..b1d5f6c 100644
+--- a/gio/gsocketclient.c
++++ b/gio/gsocketclient.c
+@@ -1332,13 +1332,15 @@ typedef struct
+=20
+   GSocketConnectable *connectable;
+   GSocketAddressEnumerator *enumerator;
+-  GProxyAddress *proxy_addr;
+-  GSocket *socket;
+-  GIOStream *connection;
++  GCancellable *enumeration_cancellable;
+=20
+   GSList *connection_attempts;
++  GSList *successful_connections;
+   GError *last_error;
+=20
++  gboolean enumerated_at_least_once;
++  gboolean enumeration_completed;
++  gboolean connection_in_progress;
+   gboolean completed;
+ } GSocketClientAsyncConnectData;
+=20
+@@ -1350,10 +1352,9 @@ g_socket_client_async_connect_data_free (GSocketC=
lientAsyncConnectData *data)
+   data->task =3D NULL;
+   g_clear_object (&data->connectable);
+   g_clear_object (&data->enumerator);
+-  g_clear_object (&data->proxy_addr);
+-  g_clear_object (&data->socket);
+-  g_clear_object (&data->connection);
++  g_clear_object (&data->enumeration_cancellable);
+   g_slist_free_full (data->connection_attempts, connection_attempt_unre=
f);
++  g_slist_free_full (data->successful_connections, connection_attempt_u=
nref);
+=20
+   g_clear_error (&data->last_error);
+=20
+@@ -1365,6 +1366,7 @@ typedef struct
+   GSocketAddress *address;
+   GSocket *socket;
+   GIOStream *connection;
++  GProxyAddress *proxy_addr;
+   GSocketClientAsyncConnectData *data; /* unowned */
+   GSource *timeout_source;
+   GCancellable *cancellable;
+@@ -1396,6 +1398,7 @@ connection_attempt_unref (gpointer pointer)
+       g_clear_object (&attempt->socket);
+       g_clear_object (&attempt->connection);
+       g_clear_object (&attempt->cancellable);
++      g_clear_object (&attempt->proxy_addr);
+       if (attempt->timeout_source)
+         {
+           g_source_destroy (attempt->timeout_source);
+@@ -1413,37 +1416,59 @@ connection_attempt_remove (ConnectionAttempt *at=
tempt)
+ }
+=20
+ static void
+-g_socket_client_async_connect_complete (GSocketClientAsyncConnectData *=
data)
++cancel_all_attempts (GSocketClientAsyncConnectData *data)
+ {
+-  g_assert (data->connection);
++  GSList *l;
+=20
+-  if (!G_IS_SOCKET_CONNECTION (data->connection))
++  for (l =3D data->connection_attempts; l; l =3D g_slist_next (l))
+     {
+-      GSocketConnection *wrapper_connection;
+-
+-      wrapper_connection =3D g_tcp_wrapper_connection_new (data->connec=
tion, data->socket);
+-      g_object_unref (data->connection);
+-      data->connection =3D (GIOStream *)wrapper_connection;
++      ConnectionAttempt *attempt_entry =3D l->data;
++      g_cancellable_cancel (attempt_entry->cancellable);
++      connection_attempt_unref (attempt_entry);
+     }
++  g_slist_free (data->connection_attempts);
++  data->connection_attempts =3D NULL;
+=20
+-  if (!data->completed)
++  g_slist_free_full (data->successful_connections, connection_attempt_u=
nref);
++  data->successful_connections =3D NULL;
++
++  g_cancellable_cancel (data->enumeration_cancellable);
++}
++
++static void
++g_socket_client_async_connect_complete (ConnectionAttempt *attempt)
++{
++  GSocketClientAsyncConnectData *data =3D attempt->data;
++  GError *error =3D NULL;
++  g_assert (attempt->connection);
++  g_assert (!data->completed);
++
++  if (!G_IS_SOCKET_CONNECTION (attempt->connection))
+     {
+-      GError *error =3D NULL;
++      GSocketConnection *wrapper_connection;
+=20
+-      if (g_cancellable_set_error_if_cancelled (g_task_get_cancellable =
(data->task), &error))
+-        {
+-          g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_COM=
PLETE, data->connectable, NULL);
+-          g_task_return_error (data->task, g_steal_pointer (&error));
+-        }
+-      else
+-        {
+-          g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_COM=
PLETE, data->connectable, data->connection);
+-          g_task_return_pointer (data->task, g_steal_pointer (&data->co=
nnection), g_object_unref);
+-        }
++      wrapper_connection =3D g_tcp_wrapper_connection_new (attempt->con=
nection, attempt->socket);
++      g_object_unref (attempt->connection);
++      attempt->connection =3D (GIOStream *)wrapper_connection;
++    }
+=20
+-      data->completed =3D TRUE;
++  data->completed =3D TRUE;
++  cancel_all_attempts (data);
++
++  if (g_cancellable_set_error_if_cancelled (g_task_get_cancellable (dat=
a->task), &error))
++    {
++      g_debug ("GSocketClient: Connection cancelled!");
++      g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_COMPLET=
E, data->connectable, NULL);
++      g_task_return_error (data->task, g_steal_pointer (&error));
++    }
++  else
++    {
++      g_debug ("GSocketClient: Connection successful!");
++      g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_COMPLET=
E, data->connectable, attempt->connection);
++      g_task_return_pointer (data->task, g_steal_pointer (&attempt->con=
nection), g_object_unref);
+     }
+=20
++  connection_attempt_unref (attempt);
+   g_object_unref (data->task);
+ }
+=20
+@@ -1465,59 +1490,63 @@ static void
+ enumerator_next_async (GSocketClientAsyncConnectData *data,
+                        gboolean                       add_task_ref)
+ {
+-  /* We need to cleanup the state */
+-  g_clear_object (&data->socket);
+-  g_clear_object (&data->proxy_addr);
+-  g_clear_object (&data->connection);
+-
+   /* Each enumeration takes a ref. This arg just avoids repeated unrefs=
 when
+      an enumeration starts another enumeration */
+   if (add_task_ref)
+     g_object_ref (data->task);
+=20
+   g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_RESOLVING, =
data->connectable, NULL);
++  g_debug ("GSocketClient: Starting new address enumeration");
+   g_socket_address_enumerator_next_async (data->enumerator,
+-					  g_task_get_cancellable (data->task),
++					  data->enumeration_cancellable,
+ 					  g_socket_client_enumerator_callback,
+ 					  data);
+ }
+=20
++static void try_next_connection_or_finish (GSocketClientAsyncConnectDat=
a *, gboolean);
++
+ static void
+ g_socket_client_tls_handshake_callback (GObject      *object,
+ 					GAsyncResult *result,
+ 					gpointer      user_data)
+ {
+-  GSocketClientAsyncConnectData *data =3D user_data;
++  ConnectionAttempt *attempt =3D user_data;
++  GSocketClientAsyncConnectData *data =3D attempt->data;
+=20
+   if (g_tls_connection_handshake_finish (G_TLS_CONNECTION (object),
+ 					 result,
+ 					 &data->last_error))
+     {
+-      g_object_unref (data->connection);
+-      data->connection =3D G_IO_STREAM (object);
++      g_object_unref (attempt->connection);
++      attempt->connection =3D G_IO_STREAM (object);
+=20
+-      g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_TLS_HAN=
DSHAKED, data->connectable, data->connection);
+-      g_socket_client_async_connect_complete (data);
++      g_debug ("GSocketClient: TLS handshake succeeded");
++      g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_TLS_HAN=
DSHAKED, data->connectable, attempt->connection);
++      g_socket_client_async_connect_complete (attempt);
+     }
+   else
+     {
+       g_object_unref (object);
+-      enumerator_next_async (data, FALSE);
++      connection_attempt_unref (attempt);
++      g_debug ("GSocketClient: TLS handshake failed: %s", data->last_er=
ror->message);
++      try_next_connection_or_finish (data, TRUE);
+     }
+ }
+=20
+ static void
+-g_socket_client_tls_handshake (GSocketClientAsyncConnectData *data)
++g_socket_client_tls_handshake (ConnectionAttempt *attempt)
+ {
++  GSocketClientAsyncConnectData *data =3D attempt->data;
+   GIOStream *tlsconn;
+=20
+   if (!data->client->priv->tls)
+     {
+-      g_socket_client_async_connect_complete (data);
++      g_socket_client_async_connect_complete (attempt);
+       return;
+     }
+=20
+-  tlsconn =3D g_tls_client_connection_new (data->connection,
++  g_debug ("GSocketClient: Starting TLS handshake");
++  tlsconn =3D g_tls_client_connection_new (attempt->connection,
+ 					 data->connectable,
+ 					 &data->last_error);
+   if (tlsconn)
+@@ -1529,11 +1558,12 @@ g_socket_client_tls_handshake (GSocketClientAsyn=
cConnectData *data)
+ 					G_PRIORITY_DEFAULT,
+ 					g_task_get_cancellable (data->task),
+ 					g_socket_client_tls_handshake_callback,
+-					data);
++					attempt);
+     }
+   else
+     {
+-      enumerator_next_async (data, FALSE);
++      connection_attempt_unref (attempt);
++      try_next_connection_or_finish (data, TRUE);
+     }
+ }
+=20
+@@ -1542,23 +1572,38 @@ g_socket_client_proxy_connect_callback (GObject =
     *object,
+ 					GAsyncResult *result,
+ 					gpointer      user_data)
+ {
+-  GSocketClientAsyncConnectData *data =3D user_data;
++  ConnectionAttempt *attempt =3D user_data;
++  GSocketClientAsyncConnectData *data =3D attempt->data;
+=20
+-  g_object_unref (data->connection);
+-  data->connection =3D g_proxy_connect_finish (G_PROXY (object),
+-					     result,
+-					     &data->last_error);
+-  if (data->connection)
++  g_object_unref (attempt->connection);
++  attempt->connection =3D g_proxy_connect_finish (G_PROXY (object),
++                                                result,
++                                                &data->last_error);
++  if (attempt->connection)
+     {
+-      g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_PROXY_N=
EGOTIATED, data->connectable, data->connection);
++      g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_PROXY_N=
EGOTIATED, data->connectable, attempt->connection);
+     }
+   else
+     {
+-      enumerator_next_async (data, FALSE);
++      connection_attempt_unref (attempt);
++      try_next_connection_or_finish (data, TRUE);
+       return;
+     }
+=20
+-  g_socket_client_tls_handshake (data);
++  g_socket_client_tls_handshake (attempt);
++}
++
++static void
++complete_connection_with_error (GSocketClientAsyncConnectData *data,
++                                GError                        *error)
++{
++  g_debug ("GSocketClient: Connection failed: %s", error->message);
++  g_assert (!data->completed);
++
++  g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_COMPLETE, d=
ata->connectable, NULL);
++  data->completed =3D TRUE;
++  cancel_all_attempts (data);
++  g_task_return_error (data->task, error);
+ }
+=20
+ static gboolean
+@@ -1572,15 +1617,114 @@ task_completed_or_cancelled (GSocketClientAsync=
ConnectData *data)
+     return TRUE;
+   else if (g_cancellable_set_error_if_cancelled (cancellable, &error))
+     {
+-      g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_COMPLET=
E, data->connectable, NULL);
+-      g_task_return_error (task, g_steal_pointer (&error));
+-      data->completed =3D TRUE;
++      complete_connection_with_error (data, g_steal_pointer (&error));
+       return TRUE;
+     }
+   else
+     return FALSE;
+ }
+=20
++static gboolean
++try_next_successful_connection (GSocketClientAsyncConnectData *data)
++{
++  ConnectionAttempt *attempt;
++  const gchar *protocol;
++  GProxy *proxy;
++
++  if (data->connection_in_progress)
++    return FALSE;
++
++  g_assert (data->successful_connections !=3D NULL);
++  attempt =3D data->successful_connections->data;
++  g_assert (attempt !=3D NULL);
++  data->successful_connections =3D g_slist_remove (data->successful_con=
nections, attempt);
++  data->connection_in_progress =3D TRUE;
++
++  g_debug ("GSocketClient: Starting application layer connection");
++
++  if (!attempt->proxy_addr)
++    {
++      g_socket_client_tls_handshake (g_steal_pointer (&attempt));
++      return TRUE;
++    }
++
++  protocol =3D g_proxy_address_get_protocol (attempt->proxy_addr);
++
++  /* The connection should not be anything other than TCP,
++   * but let's put a safety guard in case
++   */
++  if (!G_IS_TCP_CONNECTION (attempt->connection))
++    {
++      g_critical ("Trying to proxy over non-TCP connection, this is "
++          "most likely a bug in GLib IO library.");
++
++      g_set_error_literal (&data->last_error,
++          G_IO_ERROR, G_IO_ERROR_NOT_SUPPORTED,
++          _("Proxying over a non-TCP connection is not supported."));
++    }
++  else if (g_hash_table_contains (data->client->priv->app_proxies, prot=
ocol))
++    {
++      /* Simply complete the connection, we don't want to do TLS handsh=
ake
++       * as the application proxy handling may need proxy handshake fir=
st */
++      g_socket_client_async_connect_complete (g_steal_pointer (&attempt=
));
++      return TRUE;
++    }
++  else if ((proxy =3D g_proxy_get_default_for_protocol (protocol)))
++    {
++      GIOStream *connection =3D attempt->connection;
++      GProxyAddress *proxy_addr =3D attempt->proxy_addr;
++
++      g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_PROXY_N=
EGOTIATING, data->connectable, attempt->connection);
++      g_debug ("GSocketClient: Starting proxy connection");
++      g_proxy_connect_async (proxy,
++                             connection,
++                             proxy_addr,
++                             g_task_get_cancellable (data->task),
++                             g_socket_client_proxy_connect_callback,
++                             g_steal_pointer (&attempt));
++      g_object_unref (proxy);
++      return TRUE;
++    }
++  else
++    {
++      g_clear_error (&data->last_error);
++
++      g_set_error (&data->last_error, G_IO_ERROR, G_IO_ERROR_NOT_SUPPOR=
TED,
++          _("Proxy protocol =E2=80=9C%s=E2=80=9D is not supported."),
++          protocol);
++    }
++
++  data->connection_in_progress =3D FALSE;
++  g_clear_pointer (&attempt, connection_attempt_unref);
++  return FALSE; /* All non-return paths are failures */
++}
++
++static void
++try_next_connection_or_finish (GSocketClientAsyncConnectData *data,
++                               gboolean                       end_curre=
nt_connection)
++{
++  if (end_current_connection)
++    data->connection_in_progress =3D FALSE;
++
++  if (data->connection_in_progress)
++    return;
++
++  /* Keep trying successful connections until one works, each iteration=
 pops one */
++  while (data->successful_connections)
++    {
++      if (try_next_successful_connection (data))
++        return;
++    }
++
++  if (!data->enumeration_completed)
++    {
++      enumerator_next_async (data, FALSE);
++      return;
++    }
++
++  complete_connection_with_error (data, data->last_error);
++}
++
+ static void
+ g_socket_client_connected_callback (GObject      *source,
+ 				    GAsyncResult *result,
+@@ -1588,10 +1732,7 @@ g_socket_client_connected_callback (GObject      =
*source,
+ {
+   ConnectionAttempt *attempt =3D user_data;
+   GSocketClientAsyncConnectData *data =3D attempt->data;
+-  GSList *l;
+   GError *error =3D NULL;
+-  GProxy *proxy;
+-  const gchar *protocol;
+=20
+   if (task_completed_or_cancelled (data) || g_cancellable_is_cancelled =
(attempt->cancellable))
+     {
+@@ -1613,11 +1754,12 @@ g_socket_client_connected_callback (GObject     =
 *source,
+         {
+           clarify_connect_error (error, data->connectable, attempt->add=
ress);
+           set_last_error (data, error);
++          g_debug ("GSocketClient: Connection attempt failed: %s", erro=
r->message);
+           connection_attempt_remove (attempt);
+-          enumerator_next_async (data, FALSE);
+           connection_attempt_unref (attempt);
++          try_next_connection_or_finish (data, FALSE);
+         }
+-      else
++      else /* Silently ignore cancelled attempts */
+         {
+           g_clear_error (&error);
+           g_object_unref (data->task);
+@@ -1627,74 +1769,21 @@ g_socket_client_connected_callback (GObject     =
 *source,
+       return;
+     }
+=20
+-  data->socket =3D g_steal_pointer (&attempt->socket);
+-  data->connection =3D g_steal_pointer (&attempt->connection);
+-
+-  for (l =3D data->connection_attempts; l; l =3D g_slist_next (l))
+-    {
+-      ConnectionAttempt *attempt_entry =3D l->data;
+-      g_cancellable_cancel (attempt_entry->cancellable);
+-      connection_attempt_unref (attempt_entry);
+-    }
+-  g_slist_free (data->connection_attempts);
+-  data->connection_attempts =3D NULL;
+-  connection_attempt_unref (attempt);
+-
+-  g_socket_connection_set_cached_remote_address ((GSocketConnection*)da=
ta->connection, NULL);
+-  g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_CONNECTED, =
data->connectable, data->connection);
++  g_socket_connection_set_cached_remote_address ((GSocketConnection*)at=
tempt->connection, NULL);
++  g_debug ("GSocketClient: TCP connection successful");
++  g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_CONNECTED, =
data->connectable, attempt->connection);
+=20
+   /* wrong, but backward compatible */
+-  g_socket_set_blocking (data->socket, TRUE);
++  g_socket_set_blocking (attempt->socket, TRUE);
+=20
+-  if (!data->proxy_addr)
+-    {
+-      g_socket_client_tls_handshake (data);
+-      return;
+-    }
+-
+-  protocol =3D g_proxy_address_get_protocol (data->proxy_addr);
+-
+-  /* The connection should not be anything other than TCP,
+-   * but let's put a safety guard in case
++  /* This ends the parallel "happy eyeballs" portion of connecting.
++     Now that we have a successful tcp connection we will attempt to co=
nnect
++     at the TLS/Proxy layer. If those layers fail we will move on to th=
e next
++     connection.
+    */
+-  if (!G_IS_TCP_CONNECTION (data->connection))
+-    {
+-      g_critical ("Trying to proxy over non-TCP connection, this is "
+-          "most likely a bug in GLib IO library.");
+-
+-      g_set_error_literal (&data->last_error,
+-          G_IO_ERROR, G_IO_ERROR_NOT_SUPPORTED,
+-          _("Proxying over a non-TCP connection is not supported."));
+-
+-      enumerator_next_async (data, FALSE);
+-    }
+-  else if (g_hash_table_contains (data->client->priv->app_proxies, prot=
ocol))
+-    {
+-      /* Simply complete the connection, we don't want to do TLS handsh=
ake
+-       * as the application proxy handling may need proxy handshake fir=
st */
+-      g_socket_client_async_connect_complete (data);
+-    }
+-  else if ((proxy =3D g_proxy_get_default_for_protocol (protocol)))
+-    {
+-      g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_PROXY_N=
EGOTIATING, data->connectable, data->connection);
+-      g_proxy_connect_async (proxy,
+-                             data->connection,
+-                             data->proxy_addr,
+-                             g_task_get_cancellable (data->task),
+-                             g_socket_client_proxy_connect_callback,
+-                             data);
+-      g_object_unref (proxy);
+-    }
+-  else
+-    {
+-      g_clear_error (&data->last_error);
+-
+-      g_set_error (&data->last_error, G_IO_ERROR, G_IO_ERROR_NOT_SUPPOR=
TED,
+-          _("Proxy protocol =E2=80=9C%s=E2=80=9D is not supported."),
+-          protocol);
+-
+-      enumerator_next_async (data, FALSE);
+-    }
++  connection_attempt_remove (attempt);
++  data->successful_connections =3D g_slist_append (data->successful_con=
nections, g_steal_pointer (&attempt));
++  try_next_connection_or_finish (data, FALSE);
+ }
+=20
+ static gboolean
+@@ -1702,7 +1791,11 @@ on_connection_attempt_timeout (gpointer data)
+ {
+   ConnectionAttempt *attempt =3D data;
+=20
+-  enumerator_next_async (attempt->data, TRUE);
++  if (!attempt->data->enumeration_completed)
++    {
++      g_debug ("GSocketClient: Timeout reached, trying another enumerat=
ion");
++      enumerator_next_async (attempt->data, TRUE);
++    }
+=20
+   g_clear_pointer (&attempt->timeout_source, g_source_unref);
+   return G_SOURCE_REMOVE;
+@@ -1712,9 +1805,9 @@ static void
+ on_connection_cancelled (GCancellable *cancellable,
+                          gpointer      data)
+ {
+-  GCancellable *attempt_cancellable =3D data;
++  GCancellable *linked_cancellable =3D G_CANCELLABLE (data);
+=20
+-  g_cancellable_cancel (attempt_cancellable);
++  g_cancellable_cancel (linked_cancellable);
+ }
+=20
+ static void
+@@ -1738,39 +1831,49 @@ g_socket_client_enumerator_callback (GObject    =
  *object,
+ 						     result, &error);
+   if (address =3D=3D NULL)
+     {
+-      if (data->connection_attempts)
++      if (G_UNLIKELY (data->enumeration_completed))
++        return;
++
++      data->enumeration_completed =3D TRUE;
++      g_debug ("GSocketClient: Address enumeration completed (out of ad=
dresses)");
++
++      /* As per API docs: We only care about error if its the first cal=
l,
++         after that the enumerator is done.
++
++         Note that we don't care about cancellation errors because
++         task_completed_or_cancelled() above should handle that.
++
++         If this fails and nothing is in progress then we will complete=
 task here.
++       */
++      if ((data->enumerated_at_least_once && !data->connection_attempts=
 && !data->connection_in_progress) ||
++          !data->enumerated_at_least_once)
+         {
+-          g_object_unref (data->task);
+-          return;
++          g_debug ("GSocketClient: Address enumeration failed: %s", err=
or ? error->message : NULL);
++          if (data->last_error)
++            {
++              g_clear_error (&error);
++              error =3D data->last_error;
++              data->last_error =3D NULL;
++            }
++          else if (!error)
++            {
++              g_set_error_literal (&error, G_IO_ERROR, G_IO_ERROR_FAILE=
D,
++                _("Unknown error on connect"));
++            }
++
++          complete_connection_with_error (data, error);
+         }
+=20
+-      g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_COMPLET=
E, data->connectable, NULL);
+-      data->completed =3D TRUE;
+-      if (!error)
+-	{
+-	  if (data->last_error)
+-	    {
+-	      error =3D data->last_error;
+-	      data->last_error =3D NULL;
+-	    }
+-	  else
+-	    {
+-	      g_set_error_literal (&error, G_IO_ERROR, G_IO_ERROR_FAILED,
+-				   _("Unknown error on connect"));
+-	    }
+-	}
+-      g_task_return_error (data->task, error);
++      /* Enumeration should never trigger again, drop our ref */
+       g_object_unref (data->task);
+       return;
+     }
+=20
++  data->enumerated_at_least_once =3D TRUE;
++  g_debug ("GSocketClient: Address enumeration succeeded");
+   g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_RESOLVED,
+ 			      data->connectable, NULL);
+=20
+-  if (G_IS_PROXY_ADDRESS (address) &&
+-      data->client->priv->enable_proxy)
+-    data->proxy_addr =3D g_object_ref (G_PROXY_ADDRESS (address));
+-
+   g_clear_error (&data->last_error);
+=20
+   socket =3D create_socket (data->client, address, &data->last_error);
+@@ -1788,6 +1891,10 @@ g_socket_client_enumerator_callback (GObject     =
 *object,
+   attempt->cancellable =3D g_cancellable_new ();
+   attempt->connection =3D (GIOStream *)g_socket_connection_factory_crea=
te_connection (socket);
+   attempt->timeout_source =3D g_timeout_source_new (HAPPY_EYEBALLS_CONN=
ECTION_ATTEMPT_TIMEOUT_MS);
++
++  if (G_IS_PROXY_ADDRESS (address) && data->client->priv->enable_proxy)
++    attempt->proxy_addr =3D g_object_ref (G_PROXY_ADDRESS (address));
++
+   g_source_set_callback (attempt->timeout_source, on_connection_attempt=
_timeout, attempt, NULL);
+   g_source_attach (attempt->timeout_source, g_main_context_get_thread_d=
efault ());
+   data->connection_attempts =3D g_slist_append (data->connection_attemp=
ts, attempt);
+@@ -1797,6 +1904,7 @@ g_socket_client_enumerator_callback (GObject      =
*object,
+                            g_object_ref (attempt->cancellable), g_objec=
t_unref);
+=20
+   g_socket_connection_set_cached_remote_address ((GSocketConnection *)a=
ttempt->connection, address);
++  g_debug ("GSocketClient: Starting TCP connection attempt");
+   g_socket_client_emit_event (data->client, G_SOCKET_CLIENT_CONNECTING,=
 data->connectable, attempt->connection);
+   g_socket_connection_connect_async (G_SOCKET_CONNECTION (attempt->conn=
ection),
+ 				     address,
+@@ -1849,24 +1957,48 @@ g_socket_client_connect_async (GSocketClient    =
   *client,
+   else
+     data->enumerator =3D g_socket_connectable_enumerate (connectable);
+=20
+-  /* The flow and ownership here isn't quite obvious:
+-    - The task starts an async attempt to connect.
+-      - Each attempt holds a single ref on task.
+-      - Each attempt may create new attempts by timing out (not a failu=
re) so
+-        there are multiple attempts happening in parallel.
+-      - Upon failure an attempt will start a new attempt that steals it=
s ref
+-        until there are no more attempts left and it drops its ref.
+-      - Upon success it will cancel all other attempts and continue on
+-        to the rest of the connection (tls, proxies, etc) which do not
+-        happen in parallel and at the very end drop its ref.
+-      - Upon cancellation an attempt drops its ref.
+-   */
++  /* This function tries to match the behavior of g_socket_client_conne=
ct ()
++     which is simple enough but much of it is done in parallel to be as=
 responsive
++     as possible as per Happy Eyeballs (RFC 8305). This complicates flo=
w quite a
++     bit but we can describe it in 3 sections:
++
++     Firstly we have address enumeration (DNS):
++       - This may be triggered multiple times by enumerator_next_async(=
).
++       - It also has its own cancellable (data->enumeration_cancellable=
).
++       - Enumeration is done lazily because GNetworkAddressAddressEnume=
rator
++         also does work in parallel and may lazily add new addresses.
++       - If the first enumeration errors then the task errors. Otherwis=
e all enumerations
++         will potentially be used (until task or enumeration is cancell=
ed).
++
++      Then we start attempting connections (TCP):
++        - Each connection is independent and kept in a ConnectionAttemp=
t object.
++          - They each hold a ref on the main task and have their own ca=
ncellable.
++        - Multiple attempts may happen in parallel as per Happy Eyeball=
s.
++        - Upon failure or timeouts more connection attempts are made.
++          - If no connections succeed the task errors.
++        - Upon success they are kept in a list of successful connection=
s.
++
++      Lastly we connect at the application layer (TLS, Proxies):
++        - These are done in serial.
++          - The reasoning here is that Happy Eyeballs is about making b=
ad connections responsive
++            at the IP/TCP layers. Issues at the application layer are g=
enerally not due to
++            connectivity issues but rather misconfiguration.
++        - Upon failure it will try the next TCP connection until it run=
s out and
++          the task errors.
++        - Upon success it cancels everything remaining (enumeration and=
 connections)
++          and returns the connection.
++  */
+=20
+   data->task =3D g_task_new (client, cancellable, callback, user_data);
+   g_task_set_check_cancellable (data->task, FALSE); /* We handle this m=
anually */
+   g_task_set_source_tag (data->task, g_socket_client_connect_async);
+   g_task_set_task_data (data->task, data, (GDestroyNotify)g_socket_clie=
nt_async_connect_data_free);
+=20
++  data->enumeration_cancellable =3D g_cancellable_new ();
++  if (cancellable)
++    g_cancellable_connect (cancellable, G_CALLBACK (on_connection_cance=
lled),
++                           g_object_ref (data->enumeration_cancellable)=
, g_object_unref);
++
+   enumerator_next_async (data, FALSE);
+ }
+=20
+@@ -1985,6 +2117,7 @@ g_socket_client_connect_to_uri_async (GSocketClien=
t        *client,
+     }
+   else
+     {
++      g_debug("g_socket_client_connect_to_uri_async");
+       g_socket_client_connect_async (client,
+ 				     connectable, cancellable,
+ 				     callback, user_data);
+--=20
+2.23.0
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.60.7.bb
index 5aefa6ad8b..5be81a8f31 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson.build-do-not-hardcode-linux-as-the-host-sys=
tem.patch \
            file://0001-meson-do-a-build-time-check-for-strlcpy-before-at=
tem.patch \
+           file://CVE-2020-6750.patch \
            "
=20
 SRC_URI_append_class-native =3D " file://relocate-modules.patch"
--=20
2.23.0

