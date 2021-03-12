Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.9431.1615560874752754837
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 06:54:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=XDbXLA8Y;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from anbelski-lsg-linux-yocto-1.irsgb21fvobu5fvmalxug44hib.xx.internal.cloudapp.net (unknown [52.247.218.173])
	by linux.microsoft.com (Postfix) with ESMTPSA id 29EC120B3754
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 06:54:34 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 29EC120B3754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1615560874;
	bh=AqxGcVvbUBg3Cb+mOGh6oY43HtYttekaeoffj1WbcFs=;
	h=From:To:Subject:Date:From;
	b=XDbXLA8YFvzmoDIlqX48Iplsi4vfSiar2oJEZhoZA2nxwieFG2acbd+50wPxjSFSh
	 7hVjwdHIcLdwMuMs2QHNs/s382n96lwSxyyZ4QFT+OwLq5FDPJ8QrsMoTJp1HeAGFa
	 fS7pPdxSIniOV8OSHUFkj+1uViIHfbbp9r3ZEvJc=
From: "Anatol Belski" <anbelski@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH v2] glib-2.0: Fix CVE-2021-27219
Date: Fri, 12 Mar 2021 14:54:25 +0000
Message-Id: <20210312145425.14341-1-anbelski@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The upstream patches are only in glib >=3D 2.66.6 and >=3D 2.67.3 and won=
't
be backported. This patch is developed based on the upstream patch set
and consulting teh backports recently made by Ubuntu for the 2.64.6
series.

Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
---
 .../glib-2.0/glib-2.0/CVE-2021-27219.patch    | 1368 +++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb |    1 +
 2 files changed, 1369 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219.pa=
tch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219.patch b/m=
eta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219.patch
new file mode 100644
index 0000000000..041d79bf2e
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2021-27219.patch
@@ -0,0 +1,1368 @@
+commit ff746791126e4ff49bce3600c7861c71ba63c9f1
+Author: Anatol Belski <anbelski@linux.microsoft.com>
+Date:   Thu Mar 11 17:37:49 2021 +0000
+
+    backport: CVE-2021-27219 patches
+
+CVE: CVE-2021-27219
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/glib/-/merge_requests/1926]
+
+Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
+
+diff --git a/docs/reference/glib/meson.build b/docs/reference/glib/meson=
.build
+index bba7649f0..ee39f6d04 100644
+--- a/docs/reference/glib/meson.build
++++ b/docs/reference/glib/meson.build
+@@ -22,6 +22,7 @@ if get_option('gtk_doc')
+     'gprintfint.h',
+     'gmirroringtable.h',
+     'gscripttable.h',
++    'gstrfuncsprivate.h',
+     'glib-mirroring-tab',
+     'gnulib',
+     'pcre',
+diff --git a/gio/gdatainputstream.c b/gio/gdatainputstream.c
+index 2e7750cb5..2cdcbda19 100644
+--- a/gio/gdatainputstream.c
++++ b/gio/gdatainputstream.c
+@@ -27,6 +27,7 @@
+ #include "gioenumtypes.h"
+ #include "gioerror.h"
+ #include "glibintl.h"
++#include "gstrfuncsprivate.h"
+=20
+ #include <string.h>
+=20
+@@ -856,7 +857,7 @@ static gssize
+ scan_for_chars (GDataInputStream *stream,
+ 		gsize            *checked_out,
+ 		const char       *stop_chars,
+-                gssize            stop_chars_len)
++                gsize             stop_chars_len)
+ {
+   GBufferedInputStream *bstream;
+   const char *buffer;
+@@ -952,7 +953,7 @@ typedef struct
+   gsize checked;
+=20
+   gchar *stop_chars;
+-  gssize stop_chars_len;
++  gsize stop_chars_len;
+   gsize length;
+ } GDataInputStreamReadData;
+=20
+@@ -1078,12 +1079,17 @@ g_data_input_stream_read_async (GDataInputStream=
    *stream,
+ {
+   GDataInputStreamReadData *data;
+   GTask *task;
++  gsize stop_chars_len_unsigned;
+=20
+   data =3D g_slice_new0 (GDataInputStreamReadData);
+-  if (stop_chars_len =3D=3D -1)
+-    stop_chars_len =3D strlen (stop_chars);
+-  data->stop_chars =3D g_memdup (stop_chars, stop_chars_len);
+-  data->stop_chars_len =3D stop_chars_len;
++
++  if (stop_chars_len < 0)
++    stop_chars_len_unsigned =3D strlen (stop_chars);
++  else
++    stop_chars_len_unsigned =3D (gsize) stop_chars_len;
++
++  data->stop_chars =3D g_memdup2 (stop_chars, stop_chars_len_unsigned);
++  data->stop_chars_len =3D stop_chars_len_unsigned;
+   data->last_saw_cr =3D FALSE;
+=20
+   task =3D g_task_new (stream, cancellable, callback, user_data);
+@@ -1338,17 +1344,20 @@ g_data_input_stream_read_upto (GDataInputStream =
 *stream,
+   gssize found_pos;
+   gssize res;
+   char *data_until;
++  gsize stop_chars_len_unsigned;
+=20
+   g_return_val_if_fail (G_IS_DATA_INPUT_STREAM (stream), NULL);
+=20
+   if (stop_chars_len < 0)
+-    stop_chars_len =3D strlen (stop_chars);
++    stop_chars_len_unsigned =3D strlen (stop_chars);
++  else
++    stop_chars_len_unsigned =3D (gsize) stop_chars_len;
+=20
+   bstream =3D G_BUFFERED_INPUT_STREAM (stream);
+=20
+   checked =3D 0;
+=20
+-  while ((found_pos =3D scan_for_chars (stream, &checked, stop_chars, s=
top_chars_len)) =3D=3D -1)
++  while ((found_pos =3D scan_for_chars (stream, &checked, stop_chars, s=
top_chars_len_unsigned)) =3D=3D -1)
+     {
+       if (g_buffered_input_stream_get_available (bstream) =3D=3D
+           g_buffered_input_stream_get_buffer_size (bstream))
+diff --git a/gio/gdbusconnection.c b/gio/gdbusconnection.c
+index f1f0921d4..d56453486 100644
+--- a/gio/gdbusconnection.c
++++ b/gio/gdbusconnection.c
+@@ -110,6 +110,7 @@
+ #include "gasyncinitable.h"
+ #include "giostream.h"
+ #include "gasyncresult.h"
++#include "gstrfuncsprivate.h"
+ #include "gtask.h"
+ #include "gmarshal-internal.h"
+=20
+@@ -3997,7 +3998,7 @@ _g_dbus_interface_vtable_copy (const GDBusInterfac=
eVTable *vtable)
+   /* Don't waste memory by copying padding - remember to update this
+    * when changing struct _GDBusInterfaceVTable in gdbusconnection.h
+    */
+-  return g_memdup ((gconstpointer) vtable, 3 * sizeof (gpointer));
++  return g_memdup2 ((gconstpointer) vtable, 3 * sizeof (gpointer));
+ }
+=20
+ static void
+@@ -4014,7 +4015,7 @@ _g_dbus_subtree_vtable_copy (const GDBusSubtreeVTa=
ble *vtable)
+   /* Don't waste memory by copying padding - remember to update this
+    * when changing struct _GDBusSubtreeVTable in gdbusconnection.h
+    */
+-  return g_memdup ((gconstpointer) vtable, 3 * sizeof (gpointer));
++  return g_memdup2 ((gconstpointer) vtable, 3 * sizeof (gpointer));
+ }
+=20
+ static void
+diff --git a/gio/gdbusinterfaceskeleton.c b/gio/gdbusinterfaceskeleton.c
+index 4a06516c1..4a4b719a5 100644
+--- a/gio/gdbusinterfaceskeleton.c
++++ b/gio/gdbusinterfaceskeleton.c
+@@ -28,6 +28,7 @@
+ #include "gdbusmethodinvocation.h"
+ #include "gdbusconnection.h"
+ #include "gmarshal-internal.h"
++#include "gstrfuncsprivate.h"
+ #include "gtask.h"
+ #include "gioerror.h"
+=20
+@@ -701,7 +702,7 @@ add_connection_locked (GDBusInterfaceSkeleton *inter=
face_,
+        * properly before building the hooked_vtable, so we create it
+        * once at the last minute.
+        */
+-      interface_->priv->hooked_vtable =3D g_memdup (g_dbus_interface_sk=
eleton_get_vtable (interface_), sizeof (GDBusInterfaceVTable));
++      interface_->priv->hooked_vtable =3D g_memdup2 (g_dbus_interface_s=
keleton_get_vtable (interface_), sizeof (GDBusInterfaceVTable));
+       interface_->priv->hooked_vtable->method_call =3D skeleton_interce=
pt_handle_method_call;
+     }
+=20
+diff --git a/gio/gfile.c b/gio/gfile.c
+index ba93f7c75..88b341e7d 100644
+--- a/gio/gfile.c
++++ b/gio/gfile.c
+@@ -60,6 +60,7 @@
+ #include "gasyncresult.h"
+ #include "gioerror.h"
+ #include "glibintl.h"
++#include "gstrfuncsprivate.h"
+=20
+=20
+ /**
+@@ -7884,7 +7885,7 @@ measure_disk_usage_progress (gboolean reporting,
+   g_main_context_invoke_full (g_task_get_context (task),
+                               g_task_get_priority (task),
+                               measure_disk_usage_invoke_progress,
+-                              g_memdup (&progress, sizeof progress),
++                              g_memdup2 (&progress, sizeof progress),
+                               g_free);
+ }
+=20
+@@ -7902,7 +7903,7 @@ measure_disk_usage_thread (GTask        *task,
+                                  data->progress_callback ? measure_disk=
_usage_progress : NULL, task,
+                                  &result.disk_usage, &result.num_dirs, =
&result.num_files,
+                                  &error))
+-    g_task_return_pointer (task, g_memdup (&result, sizeof result), g_f=
ree);
++    g_task_return_pointer (task, g_memdup2 (&result, sizeof result), g_=
free);
+   else
+     g_task_return_error (task, error);
+ }
+@@ -7926,7 +7927,7 @@ g_file_real_measure_disk_usage_async (GFile       =
                 *file,
+=20
+   task =3D g_task_new (file, cancellable, callback, user_data);
+   g_task_set_source_tag (task, g_file_real_measure_disk_usage_async);
+-  g_task_set_task_data (task, g_memdup (&data, sizeof data), g_free);
++  g_task_set_task_data (task, g_memdup2 (&data, sizeof data), g_free);
+   g_task_set_priority (task, io_priority);
+=20
+   g_task_run_in_thread (task, measure_disk_usage_thread);
+diff --git a/gio/gkeyfilesettingsbackend.c b/gio/gkeyfilesettingsbackend=
.c
+index cd5765afd..de216e615 100644
+--- a/gio/gkeyfilesettingsbackend.c
++++ b/gio/gkeyfilesettingsbackend.c
+@@ -33,6 +33,7 @@
+ #include "gfilemonitor.h"
+ #include "gsimplepermission.h"
+ #include "gsettingsbackendinternal.h"
++#include "gstrfuncsprivate.h"
+ #include "giomodule-priv.h"
+ #include "gportalsupport.h"
+=20
+@@ -145,8 +146,8 @@ convert_path (GKeyfileSettingsBackend  *kfsb,
+               gchar                   **group,
+               gchar                   **basename)
+ {
+-  gint key_len =3D strlen (key);
+-  gint i;
++  gsize key_len =3D strlen (key);
++  const gchar *last_slash;
+=20
+   if (key_len < kfsb->prefix_len ||
+       memcmp (key, kfsb->prefix, kfsb->prefix_len) !=3D 0)
+@@ -155,38 +156,48 @@ convert_path (GKeyfileSettingsBackend  *kfsb,
+   key_len -=3D kfsb->prefix_len;
+   key +=3D kfsb->prefix_len;
+=20
+-  for (i =3D key_len; i >=3D 0; i--)
+-    if (key[i] =3D=3D '/')
+-      break;
++  last_slash =3D strrchr (key, '/');
++
++  /* Disallow empty group names or key names */
++  if (key_len =3D=3D 0 ||
++      (last_slash !=3D NULL &&
++       (*(last_slash + 1) =3D=3D '\0' ||
++        last_slash =3D=3D key)))
++    return FALSE;
+=20
+   if (kfsb->root_group)
+     {
+       /* if a root_group was specified, make sure the user hasn't given
+        * a path that ghosts that group name
+        */
+-      if (i =3D=3D kfsb->root_group_len && memcmp (key, kfsb->root_grou=
p, i) =3D=3D 0)
++      if (last_slash !=3D NULL && (last_slash - key) =3D=3D kfsb->root_=
group_len && memcmp (key, kfsb->root_group, last_slash - key) =3D=3D 0)
+         return FALSE;
+     }
+   else
+     {
+       /* if no root_group was given, ensure that the user gave a path *=
/
+-      if (i =3D=3D -1)
++      if (last_slash =3D=3D NULL)
+         return FALSE;
+     }
+=20
+   if (group)
+     {
+-      if (i >=3D 0)
++      if (last_slash !=3D NULL)
+         {
+-          *group =3D g_memdup (key, i + 1);
+-          (*group)[i] =3D '\0';
++          *group =3D g_memdup2 (key, (last_slash - key) + 1);
++          (*group)[(last_slash - key)] =3D '\0';
+         }
+       else
+         *group =3D g_strdup (kfsb->root_group);
+     }
+=20
+   if (basename)
+-    *basename =3D g_memdup (key + i + 1, key_len - i);
++    {
++      if (last_slash !=3D NULL)
++        *basename =3D g_memdup2 (last_slash + 1, key_len - (last_slash =
- key));
++      else
++        *basename =3D g_strdup (key);
++    }
+=20
+   return TRUE;
+ }
+diff --git a/gio/gsettingsschema.c b/gio/gsettingsschema.c
+index 3a60b8c64..dded9b1ca 100644
+--- a/gio/gsettingsschema.c
++++ b/gio/gsettingsschema.c
+@@ -20,6 +20,7 @@
+=20
+ #include "gsettingsschema-internal.h"
+ #include "gsettings.h"
++#include "gstrfuncsprivate.h"
+=20
+ #include "gvdb/gvdb-reader.h"
+ #include "strinfo.c"
+@@ -1058,9 +1059,9 @@ g_settings_schema_list_children (GSettingsSchema *=
schema)
+=20
+       if (g_str_has_suffix (key, "/"))
+         {
+-          gint length =3D strlen (key);
++          gsize length =3D strlen (key);
+=20
+-          strv[j] =3D g_memdup (key, length);
++          strv[j] =3D g_memdup2 (key, length);
+           strv[j][length - 1] =3D '\0';
+           j++;
+         }
+diff --git a/gio/gsocket.c b/gio/gsocket.c
+index 66073af83..a3af149e8 100644
+--- a/gio/gsocket.c
++++ b/gio/gsocket.c
+@@ -75,6 +75,7 @@
+ #include "gcredentialsprivate.h"
+ #include "glibintl.h"
+ #include "gioprivate.h"
++#include "gstrfuncsprivate.h"
+=20
+ #ifdef G_OS_WIN32
+ /* For Windows XP runtime compatibility, but use the system's if_nameto=
index() if available */
+@@ -174,7 +175,7 @@ static gboolean     g_socket_datagram_based_conditio=
n_wait       (GDatagramBased
+                                                                   GErro=
r          **error);
+=20
+ static GSocketAddress *
+-cache_recv_address (GSocket *socket, struct sockaddr *native, int nativ=
e_len);
++cache_recv_address (GSocket *socket, struct sockaddr *native, size_t na=
tive_len);
+=20
+ static gssize
+ g_socket_receive_message_with_timeout  (GSocket                 *socket=
,
+@@ -260,7 +261,7 @@ struct _GSocketPrivate
+   struct {
+     GSocketAddress *addr;
+     struct sockaddr *native;
+-    gint native_len;
++    gsize native_len;
+     guint64 last_used;
+   } recv_addr_cache[RECV_ADDR_CACHE_SIZE];
+ };
+@@ -5211,14 +5212,14 @@ g_socket_send_messages_with_timeout (GSocket    =
    *socket,
+ }
+=20
+ static GSocketAddress *
+-cache_recv_address (GSocket *socket, struct sockaddr *native, int nativ=
e_len)
++cache_recv_address (GSocket *socket, struct sockaddr *native, size_t na=
tive_len)
+ {
+   GSocketAddress *saddr;
+   gint i;
+   guint64 oldest_time =3D G_MAXUINT64;
+   gint oldest_index =3D 0;
+=20
+-  if (native_len <=3D 0)
++  if (native_len =3D=3D 0)
+     return NULL;
+=20
+   saddr =3D NULL;
+@@ -5226,7 +5227,7 @@ cache_recv_address (GSocket *socket, struct sockad=
dr *native, int native_len)
+     {
+       GSocketAddress *tmp =3D socket->priv->recv_addr_cache[i].addr;
+       gpointer tmp_native =3D socket->priv->recv_addr_cache[i].native;
+-      gint tmp_native_len =3D socket->priv->recv_addr_cache[i].native_l=
en;
++      gsize tmp_native_len =3D socket->priv->recv_addr_cache[i].native_=
len;
+=20
+       if (!tmp)
+         continue;
+@@ -5256,7 +5257,7 @@ cache_recv_address (GSocket *socket, struct sockad=
dr *native, int native_len)
+       g_free (socket->priv->recv_addr_cache[oldest_index].native);
+     }
+=20
+-  socket->priv->recv_addr_cache[oldest_index].native =3D g_memdup (nati=
ve, native_len);
++  socket->priv->recv_addr_cache[oldest_index].native =3D g_memdup2 (nat=
ive, native_len);
+   socket->priv->recv_addr_cache[oldest_index].native_len =3D native_len=
;
+   socket->priv->recv_addr_cache[oldest_index].addr =3D g_object_ref (sa=
ddr);
+   socket->priv->recv_addr_cache[oldest_index].last_used =3D g_get_monot=
onic_time ();
+@@ -5404,6 +5405,9 @@ g_socket_receive_message_with_timeout (GSocket    =
             *socket,
+     /* do it */
+     while (1)
+       {
++        /* addrlen has to be of type int because that=E2=80=99s how WSA=
RecvFrom() is defined */
++        G_STATIC_ASSERT (sizeof addr <=3D G_MAXINT);
++
+ 	addrlen =3D sizeof addr;
+ 	if (address)
+ 	  result =3D WSARecvFrom (socket->priv->fd,
+diff --git a/gio/gtlspassword.c b/gio/gtlspassword.c
+index 1e437a7b6..bd86a6dfe 100644
+--- a/gio/gtlspassword.c
++++ b/gio/gtlspassword.c
+@@ -23,6 +23,7 @@
+ #include "glibintl.h"
+=20
+ #include "gioenumtypes.h"
++#include "gstrfuncsprivate.h"
+ #include "gtlspassword.h"
+=20
+ #include <string.h>
+@@ -287,9 +288,14 @@ g_tls_password_set_value (GTlsPassword  *password,
+   g_return_if_fail (G_IS_TLS_PASSWORD (password));
+=20
+   if (length < 0)
+-    length =3D strlen ((gchar *)value);
++    {
++      /* FIXME: g_tls_password_set_value_full() doesn=E2=80=99t support=
 unsigned gsize */
++      gsize length_unsigned =3D strlen ((gchar *) value);
++      g_return_if_fail (length_unsigned <=3D G_MAXSSIZE);
++      length =3D (gssize) length_unsigned;
++    }
+=20
+-  g_tls_password_set_value_full (password, g_memdup (value, length), le=
ngth, g_free);
++  g_tls_password_set_value_full (password, g_memdup2 (value, (gsize) le=
ngth), length, g_free);
+ }
+=20
+ /**
+diff --git a/gio/gwin32registrykey.c b/gio/gwin32registrykey.c
+index c19fede4e..fbd65311a 100644
+--- a/gio/gwin32registrykey.c
++++ b/gio/gwin32registrykey.c
+@@ -28,6 +28,8 @@
+ #include <ntstatus.h>
+ #include <winternl.h>
+=20
++#include "gstrfuncsprivate.h"
++
+ #ifndef _WDMDDK_
+ typedef enum _KEY_INFORMATION_CLASS {
+   KeyBasicInformation,
+@@ -125,16 +127,34 @@ typedef enum
+   G_WIN32_REGISTRY_UPDATED_PATH =3D 1,
+ } GWin32RegistryKeyUpdateFlag;
+=20
++static gsize
++g_utf16_len (const gunichar2 *str)
++{
++  gsize result;
++
++  for (result =3D 0; str[0] !=3D 0; str++, result++)
++    ;
++
++  return result;
++}
++
+ static gunichar2 *
+-g_wcsdup (const gunichar2 *str,
+-          gssize           str_size)
++g_wcsdup (const gunichar2 *str, gssize str_len)
+ {
+-  if (str_size =3D=3D -1)
+-    {
+-      str_size =3D wcslen (str) + 1;
+-      str_size *=3D sizeof (gunichar2);
+-    }
+-  return g_memdup (str, str_size);
++  gsize str_len_unsigned;
++  gsize str_size;
++
++  g_return_val_if_fail (str !=3D NULL, NULL);
++
++  if (str_len < 0)
++    str_len_unsigned =3D g_utf16_len (str);
++  else
++    str_len_unsigned =3D (gsize) str_len;
++
++  g_assert (str_len_unsigned <=3D G_MAXSIZE / sizeof (gunichar2) - 1);
++  str_size =3D (str_len_unsigned + 1) * sizeof (gunichar2);
++
++  return g_memdup2 (str, str_size);
+ }
+=20
+ /**
+@@ -247,7 +267,7 @@ g_win32_registry_value_iter_copy (const GWin32Regist=
ryValueIter *iter)
+   new_iter->value_name_size =3D iter->value_name_size;
+=20
+   if (iter->value_data !=3D NULL)
+-    new_iter->value_data =3D g_memdup (iter->value_data, iter->value_da=
ta_size);
++    new_iter->value_data =3D g_memdup2 (iter->value_data, iter->value_d=
ata_size);
+=20
+   new_iter->value_data_size =3D iter->value_data_size;
+=20
+@@ -268,8 +288,8 @@ g_win32_registry_value_iter_copy (const GWin32Regist=
ryValueIter *iter)
+   new_iter->value_data_expanded_charsize =3D iter->value_data_expanded_=
charsize;
+=20
+   if (iter->value_data_expanded_u8 !=3D NULL)
+-    new_iter->value_data_expanded_u8 =3D g_memdup (iter->value_data_exp=
anded_u8,
+-                                                 iter->value_data_expan=
ded_charsize);
++    new_iter->value_data_expanded_u8 =3D g_memdup2 (iter->value_data_ex=
panded_u8,
++                                                  iter->value_data_expa=
nded_charsize);
+=20
+   new_iter->value_data_expanded_u8_size =3D iter->value_data_expanded_c=
harsize;
+=20
+diff --git a/gio/tests/async-close-output-stream.c b/gio/tests/async-clo=
se-output-stream.c
+index 5f6620275..d3f97a119 100644
+--- a/gio/tests/async-close-output-stream.c
++++ b/gio/tests/async-close-output-stream.c
+@@ -24,6 +24,8 @@
+ #include <stdlib.h>
+ #include <string.h>
+=20
++#include "gstrfuncsprivate.h"
++
+ #define DATA_TO_WRITE "Hello world\n"
+=20
+ typedef struct
+@@ -147,9 +149,9 @@ prepare_data (SetupData *data,
+=20
+   data->expected_size =3D g_memory_output_stream_get_data_size (G_MEMOR=
Y_OUTPUT_STREAM (data->data_stream));
+=20
+-  g_assert_cmpint (data->expected_size, >, 0);
++  g_assert_cmpuint (data->expected_size, >, 0);
+=20
+-  data->expected_output =3D g_memdup (written, (guint)data->expected_si=
ze);
++  data->expected_output =3D g_memdup2 (written, data->expected_size);
+=20
+   /* then recreate the streams and prepare them for the asynchronous cl=
ose */
+   destroy_streams (data);
+diff --git a/gio/tests/gdbus-export.c b/gio/tests/gdbus-export.c
+index 506c7458a..5513306f8 100644
+--- a/gio/tests/gdbus-export.c
++++ b/gio/tests/gdbus-export.c
+@@ -23,6 +23,7 @@
+ #include <string.h>
+=20
+ #include "gdbus-tests.h"
++#include "gstrfuncsprivate.h"
+=20
+ /* all tests rely on a shared mainloop */
+ static GMainLoop *loop =3D NULL;
+@@ -671,7 +672,7 @@ subtree_introspect (GDBusConnection       *connectio=
n,
+       g_assert_not_reached ();
+     }
+=20
+-  return g_memdup (interfaces, 2 * sizeof (void *));
++  return g_memdup2 (interfaces, 2 * sizeof (void *));
+ }
+=20
+ static const GDBusInterfaceVTable *
+@@ -727,7 +728,7 @@ dynamic_subtree_introspect (GDBusConnection       *c=
onnection,
+ {
+   const GDBusInterfaceInfo *interfaces[2] =3D { &dyna_interface_info, N=
ULL };
+=20
+-  return g_memdup (interfaces, 2 * sizeof (void *));
++  return g_memdup2 (interfaces, 2 * sizeof (void *));
+ }
+=20
+ static const GDBusInterfaceVTable *
+diff --git a/gio/tests/gsettings.c b/gio/tests/gsettings.c
+index baadca8f5..afe594a23 100644
+--- a/gio/tests/gsettings.c
++++ b/gio/tests/gsettings.c
+@@ -1,3 +1,4 @@
++#include <errno.h>
+ #include <stdlib.h>
+ #include <locale.h>
+ #include <libintl.h>
+@@ -1740,6 +1741,14 @@ key_changed_cb (GSettings *settings, const gchar =
*key, gpointer data)
+   (*b) =3D TRUE;
+ }
+=20
++typedef struct
++{
++  const gchar *path;
++  const gchar *root_group;
++  const gchar *keyfile_group;
++  const gchar *root_path;
++} KeyfileTestData;
++
+ /*
+  * Test that using a keyfile works
+  */
+@@ -1834,7 +1843,11 @@ test_keyfile (Fixture       *fixture,
+   g_free (str);
+=20
+   g_settings_set (settings, "farewell", "s", "cheerio");
+- =20
++
++  /* Check that empty keys/groups are not allowed. */
++  g_assert_false (g_settings_is_writable (settings, ""));
++  g_assert_false (g_settings_is_writable (settings, "/"));
++
+   /* When executing as root, changing the mode of the keyfile will have
+    * no effect on the writability of the settings.
+    */
+@@ -1866,6 +1879,149 @@ test_keyfile (Fixture       *fixture,
+   g_free (keyfile_path);
+ }
+=20
++/*
++ * Test that using a keyfile works with a schema with no path set.
++ */
++static void
++test_keyfile_no_path (Fixture       *fixture,
++                      gconstpointer  user_data)
++{
++  const KeyfileTestData *test_data =3D user_data;
++  GSettingsBackend *kf_backend;
++  GSettings *settings;
++  GKeyFile *keyfile;
++  gboolean writable;
++  gchar *key =3D NULL;
++  GError *error =3D NULL;
++  gchar *keyfile_path =3D NULL, *store_path =3D NULL;
++
++  keyfile_path =3D g_build_filename (fixture->tmp_dir, "keyfile", NULL)=
;
++  store_path =3D g_build_filename (keyfile_path, "gsettings.store", NUL=
L);
++  kf_backend =3D g_keyfile_settings_backend_new (store_path, test_data-=
>root_path, test_data->root_group);
++  settings =3D g_settings_new_with_backend_and_path ("org.gtk.test.no-p=
ath", kf_backend, test_data->path);
++  g_object_unref (kf_backend);
++
++  g_settings_reset (settings, "test-boolean");
++  g_assert_true (g_settings_get_boolean (settings, "test-boolean"));
++
++  writable =3D g_settings_is_writable (settings, "test-boolean");
++  g_assert_true (writable);
++  g_settings_set (settings, "test-boolean", "b", FALSE);
++
++  g_assert_false (g_settings_get_boolean (settings, "test-boolean"));
++
++  g_settings_delay (settings);
++  g_settings_set (settings, "test-boolean", "b", TRUE);
++  g_settings_apply (settings);
++
++  keyfile =3D g_key_file_new ();
++  g_assert_true (g_key_file_load_from_file (keyfile, store_path, 0, NUL=
L));
++
++  g_assert_true (g_key_file_get_boolean (keyfile, test_data->keyfile_gr=
oup, "test-boolean", NULL));
++
++  g_key_file_free (keyfile);
++
++  g_settings_reset (settings, "test-boolean");
++  g_settings_apply (settings);
++  keyfile =3D g_key_file_new ();
++  g_assert_true (g_key_file_load_from_file (keyfile, store_path, 0, NUL=
L));
++
++  g_assert_false (g_key_file_get_string (keyfile, test_data->keyfile_gr=
oup, "test-boolean", &error));
++  g_assert_error (error, G_KEY_FILE_ERROR, G_KEY_FILE_ERROR_KEY_NOT_FOU=
ND);
++  g_clear_error (&error);
++
++  /* Check that empty keys/groups are not allowed. */
++  g_assert_false (g_settings_is_writable (settings, ""));
++  g_assert_false (g_settings_is_writable (settings, "/"));
++
++  /* Keys which ghost the root group name are not allowed. This can onl=
y be
++   * tested when the path is `/` as otherwise it acts as a prefix and p=
revents
++   * any ghosting. */
++  if (g_str_equal (test_data->path, "/"))
++    {
++      key =3D g_strdup_printf ("%s/%s", test_data->root_group, "");
++      g_assert_false (g_settings_is_writable (settings, key));
++      g_free (key);
++
++      key =3D g_strdup_printf ("%s/%s", test_data->root_group, "/");
++      g_assert_false (g_settings_is_writable (settings, key));
++      g_free (key);
++
++      key =3D g_strdup_printf ("%s/%s", test_data->root_group, "test-bo=
olean");
++      g_assert_false (g_settings_is_writable (settings, key));
++      g_free (key);
++    }
++
++  g_key_file_free (keyfile);
++  g_object_unref (settings);
++
++  /* Clean up the temporary directory. */
++  g_assert_cmpint (g_chmod (keyfile_path, 0777) =3D=3D 0 ? 0 : errno, =3D=
=3D, 0);
++  g_assert_cmpint (g_remove (store_path) =3D=3D 0 ? 0 : errno, =3D=3D, =
0);
++  g_assert_cmpint (g_rmdir (keyfile_path) =3D=3D 0 ? 0 : errno, =3D=3D,=
 0);
++  g_free (store_path);
++  g_free (keyfile_path);
++}
++
++/*
++ * Test that a keyfile rejects writes to keys outside its root path.
++ */
++static void
++test_keyfile_outside_root_path (Fixture       *fixture,
++                                gconstpointer  user_data)
++{
++  GSettingsBackend *kf_backend;
++  GSettings *settings;
++  gchar *keyfile_path =3D NULL, *store_path =3D NULL;
++
++  keyfile_path =3D g_build_filename (fixture->tmp_dir, "keyfile", NULL)=
;
++  store_path =3D g_build_filename (keyfile_path, "gsettings.store", NUL=
L);
++  kf_backend =3D g_keyfile_settings_backend_new (store_path, "/tests/ba=
sic-types/", "root");
++  settings =3D g_settings_new_with_backend_and_path ("org.gtk.test.no-p=
ath", kf_backend, "/tests/");
++  g_object_unref (kf_backend);
++
++  g_assert_false (g_settings_is_writable (settings, "test-boolean"));
++
++  g_object_unref (settings);
++
++  /* Clean up the temporary directory. The keyfile probably doesn=E2=80=
=99t exist, so
++   * don=E2=80=99t error on failure. */
++  g_remove (store_path);
++  g_assert_cmpint (g_rmdir (keyfile_path) =3D=3D 0 ? 0 : errno, =3D=3D,=
 0);
++  g_free (store_path);
++  g_free (keyfile_path);
++}
++
++/*
++ * Test that a keyfile rejects writes to keys in the root if no root gr=
oup is set.
++ */
++static void
++test_keyfile_no_root_group (Fixture       *fixture,
++                            gconstpointer  user_data)
++{
++  GSettingsBackend *kf_backend;
++  GSettings *settings;
++  gchar *keyfile_path =3D NULL, *store_path =3D NULL;
++
++  keyfile_path =3D g_build_filename (fixture->tmp_dir, "keyfile", NULL)=
;
++  store_path =3D g_build_filename (keyfile_path, "gsettings.store", NUL=
L);
++  kf_backend =3D g_keyfile_settings_backend_new (store_path, "/", NULL)=
;
++  settings =3D g_settings_new_with_backend_and_path ("org.gtk.test.no-p=
ath", kf_backend, "/");
++  g_object_unref (kf_backend);
++
++  g_assert_false (g_settings_is_writable (settings, "test-boolean"));
++  g_assert_true (g_settings_is_writable (settings, "child/test-boolean"=
));
++
++  g_object_unref (settings);
++
++  /* Clean up the temporary directory. The keyfile probably doesn=E2=80=
=99t exist, so
++   * don=E2=80=99t error on failure. */
++  g_remove (store_path);
++  g_assert_cmpint (g_rmdir (keyfile_path) =3D=3D 0 ? 0 : errno, =3D=3D,=
 0);
++  g_free (store_path);
++  g_free (keyfile_path);
++}
++
+ /* Test that getting child schemas works
+  */
+ static void
+@@ -2844,6 +3000,14 @@ main (int argc, char *argv[])
+   gchar *override_text;
+   gchar *enums;
+   gint result;
++  const KeyfileTestData keyfile_test_data_explicit_path =3D { "/tests/"=
, "root", "tests", "/" };
++  const KeyfileTestData keyfile_test_data_empty_path =3D { "/", "root",=
 "root", "/" };
++  const KeyfileTestData keyfile_test_data_long_path =3D {
++    "/tests/path/is/very/long/and/this/makes/some/comparisons/take/a/di=
fferent/branch/",
++    "root",
++    "tests/path/is/very/long/and/this/makes/some/comparisons/take/a/dif=
ferent/branch",
++    "/"
++  };
+=20
+ /* Meson build sets this */
+ #ifdef TEST_LOCALE_PATH
+@@ -2967,6 +3131,11 @@ main (int argc, char *argv[])
+     }
+=20
+   g_test_add ("/gsettings/keyfile", Fixture, NULL, setup, test_keyfile,=
 teardown);
++  g_test_add ("/gsettings/keyfile/explicit-path", Fixture, &keyfile_tes=
t_data_explicit_path, setup, test_keyfile_no_path, teardown);
++  g_test_add ("/gsettings/keyfile/empty-path", Fixture, &keyfile_test_d=
ata_empty_path, setup, test_keyfile_no_path, teardown);
++  g_test_add ("/gsettings/keyfile/long-path", Fixture, &keyfile_test_da=
ta_long_path, setup, test_keyfile_no_path, teardown);
++  g_test_add ("/gsettings/keyfile/outside-root-path", Fixture, NULL, se=
tup, test_keyfile_outside_root_path, teardown);
++  g_test_add ("/gsettings/keyfile/no-root-group", Fixture, NULL, setup,=
 test_keyfile_no_root_group, teardown);
+   g_test_add_func ("/gsettings/child-schema", test_child_schema);
+   g_test_add_func ("/gsettings/strinfo", test_strinfo);
+   g_test_add_func ("/gsettings/enums", test_enums);
+diff --git a/gio/tests/tls-interaction.c b/gio/tests/tls-interaction.c
+index 4f0737d7e..5661e8e0d 100644
+--- a/gio/tests/tls-interaction.c
++++ b/gio/tests/tls-interaction.c
+@@ -174,6 +174,38 @@ test_interaction_ask_password_finish_failure (GTlsI=
nteraction    *interaction,
+ }
+=20
+=20
++/* Return a copy of @str that is allocated in a silly way, to exercise
++ * custom free-functions. The returned pointer points to a copy of @str
++ * in a buffer of the form "BEFORE \0 str \0 AFTER". */
++static guchar *
++special_dup (const char *str)
++{
++  GString *buf =3D g_string_new ("BEFORE");
++  guchar *ret;
++
++  g_string_append_c (buf, '\0');
++  g_string_append (buf, str);
++  g_string_append_c (buf, '\0');
++  g_string_append (buf, "AFTER");
++  ret =3D (guchar *) g_string_free (buf, FALSE);
++  return ret + strlen ("BEFORE") + 1;
++}
++
++
++/* Free a copy of @str that was made with special_dup(), after assertin=
g
++ * that it has not been corrupted. */
++static void
++special_free (gpointer p)
++{
++  gchar *s =3D p;
++  gchar *buf =3D s - strlen ("BEFORE") - 1;
++
++  g_assert_cmpstr (buf, =3D=3D, "BEFORE");
++  g_assert_cmpstr (s + strlen (s) + 1, =3D=3D, "AFTER");
++  g_free (buf);
++}
++
++
+ static GTlsInteractionResult
+ test_interaction_ask_password_sync_success (GTlsInteraction    *interac=
tion,
+                                             GTlsPassword       *passwor=
d,
+@@ -181,6 +213,8 @@ test_interaction_ask_password_sync_success (GTlsInte=
raction    *interaction,
+                                             GError            **error)
+ {
+   TestInteraction *self;
++  const guchar *value;
++  gsize len;
+=20
+   g_assert (TEST_IS_INTERACTION (interaction));
+   self =3D TEST_INTERACTION (interaction);
+@@ -192,6 +226,27 @@ test_interaction_ask_password_sync_success (GTlsInt=
eraction    *interaction,
+   g_assert (error !=3D NULL);
+   g_assert (*error =3D=3D NULL);
+=20
++  /* Exercise different ways to set the value */
++  g_tls_password_set_value (password, (const guchar *) "foo", 4);
++  len =3D 0;
++  value =3D g_tls_password_get_value (password, &len);
++  g_assert_cmpmem (value, len, "foo", 4);
++
++  g_tls_password_set_value (password, (const guchar *) "bar", -1);
++  len =3D 0;
++  value =3D g_tls_password_get_value (password, &len);
++  g_assert_cmpmem (value, len, "bar", 3);
++
++  g_tls_password_set_value_full (password, special_dup ("baa"), 4, spec=
ial_free);
++  len =3D 0;
++  value =3D g_tls_password_get_value (password, &len);
++  g_assert_cmpmem (value, len, "baa", 4);
++
++  g_tls_password_set_value_full (password, special_dup ("baz"), -1, spe=
cial_free);
++  len =3D 0;
++  value =3D g_tls_password_get_value (password, &len);
++  g_assert_cmpmem (value, len, "baz", 3);
++
+   /* Don't do this in real life. Include a null terminator for testing =
*/
+   g_tls_password_set_value (password, (const guchar *)"the password", 1=
3);
+   return G_TLS_INTERACTION_HANDLED;
+diff --git a/gio/win32/gwinhttpfile.c b/gio/win32/gwinhttpfile.c
+index cf5eed31d..2c3ead9eb 100644
+--- a/gio/win32/gwinhttpfile.c
++++ b/gio/win32/gwinhttpfile.c
+@@ -30,6 +30,7 @@
+ #include "gio/gfileattribute.h"
+ #include "gio/gfileinfo.h"
+ #include "gwinhttpfile.h"
++#include "gstrfuncsprivate.h"
+ #include "gwinhttpfileinputstream.h"
+ #include "gwinhttpfileoutputstream.h"
+ #include "gio/gioerror.h"
+@@ -393,10 +394,10 @@ g_winhttp_file_resolve_relative_path (GFile      *=
file,
+   child =3D g_object_new (G_TYPE_WINHTTP_FILE, NULL);
+   child->vfs =3D winhttp_file->vfs;
+   child->url =3D winhttp_file->url;
+-  child->url.lpszScheme =3D g_memdup (winhttp_file->url.lpszScheme, (wi=
nhttp_file->url.dwSchemeLength+1)*2);
+-  child->url.lpszHostName =3D g_memdup (winhttp_file->url.lpszHostName,=
 (winhttp_file->url.dwHostNameLength+1)*2);
+-  child->url.lpszUserName =3D g_memdup (winhttp_file->url.lpszUserName,=
 (winhttp_file->url.dwUserNameLength+1)*2);
+-  child->url.lpszPassword =3D g_memdup (winhttp_file->url.lpszPassword,=
 (winhttp_file->url.dwPasswordLength+1)*2);
++  child->url.lpszScheme =3D g_memdup2 (winhttp_file->url.lpszScheme, ((=
gsize) winhttp_file->url.dwSchemeLength + 1) * 2);
++  child->url.lpszHostName =3D g_memdup2 (winhttp_file->url.lpszHostName=
, ((gsize) winhttp_file->url.dwHostNameLength + 1) * 2);
++  child->url.lpszUserName =3D g_memdup2 (winhttp_file->url.lpszUserName=
, ((gsize) winhttp_file->url.dwUserNameLength + 1) * 2);
++  child->url.lpszPassword =3D g_memdup2 (winhttp_file->url.lpszPassword=
, ((gsize) winhttp_file->url.dwPasswordLength + 1) * 2);
+   child->url.lpszUrlPath =3D wnew_path;
+   child->url.dwUrlPathLength =3D wcslen (wnew_path);
+   child->url.lpszExtraInfo =3D NULL;
+diff --git a/glib/gbytes.c b/glib/gbytes.c
+index 7b72886e5..84c87e4cf 100644
+--- a/glib/gbytes.c
++++ b/glib/gbytes.c
+@@ -34,6 +34,8 @@
+=20
+ #include <string.h>
+=20
++#include "gstrfuncsprivate.h"
++
+ /**
+  * GBytes:
+  *
+@@ -95,7 +97,7 @@ g_bytes_new (gconstpointer data,
+ {
+   g_return_val_if_fail (data !=3D NULL || size =3D=3D 0, NULL);
+=20
+-  return g_bytes_new_take (g_memdup (data, size), size);
++  return g_bytes_new_take (g_memdup2 (data, size), size);
+ }
+=20
+ /**
+@@ -499,7 +501,7 @@ g_bytes_unref_to_data (GBytes *bytes,
+        * Copy: Non g_malloc (or compatible) allocator, or static memory=
,
+        * so we have to copy, and then unref.
+        */
+-      result =3D g_memdup (bytes->data, bytes->size);
++      result =3D g_memdup2 (bytes->data, bytes->size);
+       *size =3D bytes->size;
+       g_bytes_unref (bytes);
+     }
+diff --git a/glib/gdir.c b/glib/gdir.c
+index 6b85e99c8..6747a8c6f 100644
+--- a/glib/gdir.c
++++ b/glib/gdir.c
+@@ -37,6 +37,7 @@
+ #include "gconvert.h"
+ #include "gfileutils.h"
+ #include "gstrfuncs.h"
++#include "gstrfuncsprivate.h"
+ #include "gtestutils.h"
+ #include "glibintl.h"
+=20
+@@ -112,7 +113,7 @@ g_dir_open_with_errno (const gchar *path,
+     return NULL;
+ #endif
+=20
+-  return g_memdup (&dir, sizeof dir);
++  return g_memdup2 (&dir, sizeof dir);
+ }
+=20
+ /**
+diff --git a/glib/ghash.c b/glib/ghash.c
+index e61b03788..26f26062b 100644
+--- a/glib/ghash.c
++++ b/glib/ghash.c
+@@ -34,6 +34,7 @@
+ #include "gmacros.h"
+ #include "glib-private.h"
+ #include "gstrfuncs.h"
++#include "gstrfuncsprivate.h"
+ #include "gatomic.h"
+ #include "gtestutils.h"
+ #include "gslice.h"
+@@ -964,7 +965,7 @@ g_hash_table_ensure_keyval_fits (GHashTable *hash_ta=
ble, gpointer key, gpointer
+       if (hash_table->have_big_keys)
+         {
+           if (key !=3D value)
+-            hash_table->values =3D g_memdup (hash_table->keys, sizeof (=
gpointer) * hash_table->size);
++            hash_table->values =3D g_memdup2 (hash_table->keys, sizeof =
(gpointer) * hash_table->size);
+           /* Keys and values are both big now, so no need for further c=
hecks */
+           return;
+         }
+@@ -972,7 +973,7 @@ g_hash_table_ensure_keyval_fits (GHashTable *hash_ta=
ble, gpointer key, gpointer
+         {
+           if (key !=3D value)
+             {
+-              hash_table->values =3D g_memdup (hash_table->keys, sizeof=
 (guint) * hash_table->size);
++              hash_table->values =3D g_memdup2 (hash_table->keys, sizeo=
f (guint) * hash_table->size);
+               is_a_set =3D FALSE;
+             }
+         }
+@@ -1000,7 +1001,7 @@ g_hash_table_ensure_keyval_fits (GHashTable *hash_=
table, gpointer key, gpointer
+=20
+   /* Just split if necessary */
+   if (is_a_set && key !=3D value)
+-    hash_table->values =3D g_memdup (hash_table->keys, sizeof (gpointer=
) * hash_table->size);
++    hash_table->values =3D g_memdup2 (hash_table->keys, sizeof (gpointe=
r) * hash_table->size);
+=20
+ #endif
+ }
+diff --git a/glib/giochannel.c b/glib/giochannel.c
+index 1956e9dc6..4c39b9dc0 100644
+--- a/glib/giochannel.c
++++ b/glib/giochannel.c
+@@ -37,6 +37,7 @@
+ #include "giochannel.h"
+=20
+ #include "gstrfuncs.h"
++#include "gstrfuncsprivate.h"
+ #include "gtestutils.h"
+ #include "glibintl.h"
+=20
+@@ -883,17 +884,26 @@ g_io_channel_set_line_term (GIOChannel	*channel,
+                             const gchar	*line_term,
+ 			    gint         length)
+ {
++  guint length_unsigned;
++
+   g_return_if_fail (channel !=3D NULL);
+   g_return_if_fail (line_term =3D=3D NULL || length !=3D 0); /* Disallo=
w "" */
+=20
+   if (line_term =3D=3D NULL)
+-    length =3D 0;
+-  else if (length < 0)
+-    length =3D strlen (line_term);
++    length_unsigned =3D 0;
++  else if (length >=3D 0)
++    length_unsigned =3D (guint) length;
++  else
++    {
++      /* FIXME: We=E2=80=99re constrained by line_term_len being a guin=
t here */
++      gsize length_size =3D strlen (line_term);
++      g_return_if_fail (length_size <=3D G_MAXUINT);
++      length_unsigned =3D (guint) length_size;
++    }
+=20
+   g_free (channel->line_term);
+-  channel->line_term =3D line_term ? g_memdup (line_term, length) : NUL=
L;
+-  channel->line_term_len =3D length;
++  channel->line_term =3D line_term ? g_memdup2 (line_term, length_unsig=
ned) : NULL;
++  channel->line_term_len =3D length_unsigned;
+ }
+=20
+ /**
+diff --git a/glib/gslice.c b/glib/gslice.c
+index 4c758c3be..bcdbb8853 100644
+--- a/glib/gslice.c
++++ b/glib/gslice.c
+@@ -41,6 +41,7 @@
+ #include "gmain.h"
+ #include "gmem.h"               /* gslice.h */
+ #include "gstrfuncs.h"
++#include "gstrfuncsprivate.h"
+ #include "gutils.h"
+ #include "gtrashstack.h"
+ #include "gtestutils.h"
+@@ -350,7 +351,7 @@ g_slice_get_config_state (GSliceConfig ckey,
+       array[i++] =3D allocator->contention_counters[address];
+       array[i++] =3D allocator_get_magazine_threshold (allocator, addre=
ss);
+       *n_values =3D i;
+-      return g_memdup (array, sizeof (array[0]) * *n_values);
++      return g_memdup2 (array, sizeof (array[0]) * *n_values);
+     default:
+       return NULL;
+     }
+diff --git a/glib/gstrfuncsprivate.h b/glib/gstrfuncsprivate.h
+new file mode 100644
+index 000000000..85c88328a
+--- /dev/null
++++ b/glib/gstrfuncsprivate.h
+@@ -0,0 +1,55 @@
++/* GLIB - Library of useful routines for C programming
++ * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacD=
onald
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation; either
++ * version 2.1 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with this library; if not, see <http://www.gnu.org/lic=
enses/>.
++ */
++
++#include <glib.h>
++#include <string.h>
++
++/*
++ * g_memdup2:
++ * @mem: (nullable): the memory to copy.
++ * @byte_size: the number of bytes to copy.
++ *
++ * Allocates @byte_size bytes of memory, and copies @byte_size bytes in=
to it
++ * from @mem. If @mem is %NULL it returns %NULL.
++ *
++ * This replaces g_memdup(), which was prone to integer overflows when
++ * converting the argument from a #gsize to a #guint.
++ *
++ * This static inline version is a backport of the new public API from
++ * GLib 2.68, kept internal to GLib for backport to older stable releas=
es.
++ * See https://gitlab.gnome.org/GNOME/glib/-/issues/2319.
++ *
++ * Returns: (nullable): a pointer to the newly-allocated copy of the me=
mory,
++ *    or %NULL if @mem is %NULL.
++ * Since: 2.68
++ */
++static inline gpointer
++g_memdup2 (gconstpointer mem,
++           gsize         byte_size)
++{
++  gpointer new_mem;
++
++  if (mem && byte_size !=3D 0)
++    {
++      new_mem =3D g_malloc (byte_size);
++      memcpy (new_mem, mem, byte_size);
++    }
++  else
++    new_mem =3D NULL;
++
++  return new_mem;
++}
+diff --git a/glib/gtestutils.c b/glib/gtestutils.c
+index dd789482f..5887ecc36 100644
+--- a/glib/gtestutils.c
++++ b/glib/gtestutils.c
+@@ -49,6 +49,7 @@
+ #include "gpattern.h"
+ #include "grand.h"
+ #include "gstrfuncs.h"
++#include "gstrfuncsprivate.h"
+ #include "gtimer.h"
+ #include "gslice.h"
+ #include "gspawn.h"
+@@ -3798,7 +3799,7 @@ g_test_log_extract (GTestLogBuffer *tbuffer)
+       if (p <=3D tbuffer->data->str + mlength)
+         {
+           g_string_erase (tbuffer->data, 0, mlength);
+-          tbuffer->msgs =3D g_slist_prepend (tbuffer->msgs, g_memdup (&=
msg, sizeof (msg)));
++          tbuffer->msgs =3D g_slist_prepend (tbuffer->msgs, g_memdup2 (=
&msg, sizeof (msg)));
+           return TRUE;
+         }
+=20
+diff --git a/glib/gvariant.c b/glib/gvariant.c
+index b61bf7278..d6f68a9ea 100644
+--- a/glib/gvariant.c
++++ b/glib/gvariant.c
+@@ -33,6 +33,7 @@
+=20
+ #include <string.h>
+=20
++#include "gstrfuncsprivate.h"
+=20
+ /**
+  * SECTION:gvariant
+@@ -725,7 +726,7 @@ g_variant_new_variant (GVariant *value)
+   g_variant_ref_sink (value);
+=20
+   return g_variant_new_from_children (G_VARIANT_TYPE_VARIANT,
+-                                      g_memdup (&value, sizeof value),
++                                      g_memdup2 (&value, sizeof value),
+                                       1, g_variant_is_trusted (value));
+ }
+=20
+@@ -1229,7 +1230,7 @@ g_variant_new_fixed_array (const GVariantType  *el=
ement_type,
+       return NULL;
+     }
+=20
+-  data =3D g_memdup (elements, n_elements * element_size);
++  data =3D g_memdup2 (elements, n_elements * element_size);
+   value =3D g_variant_new_from_data (array_type, data,
+                                    n_elements * element_size,
+                                    FALSE, g_free, data);
+@@ -1908,7 +1909,7 @@ g_variant_dup_bytestring (GVariant *value,
+   if (length)
+     *length =3D size;
+=20
+-  return g_memdup (original, size + 1);
++  return g_memdup2 (original, size + 1);
+ }
+=20
+ /**
+diff --git a/glib/gvarianttype.c b/glib/gvarianttype.c
+index 1a228f73b..07659ff12 100644
+--- a/glib/gvarianttype.c
++++ b/glib/gvarianttype.c
+@@ -28,6 +28,7 @@
+=20
+ #include <string.h>
+=20
++#include "gstrfuncsprivate.h"
+=20
+ /**
+  * SECTION:gvarianttype
+@@ -1181,7 +1182,7 @@ g_variant_type_new_tuple (const GVariantType * con=
st *items,
+   g_assert (offset < sizeof buffer);
+   buffer[offset++] =3D ')';
+=20
+-  return (GVariantType *) g_memdup (buffer, offset);
++  return (GVariantType *) g_memdup2 (buffer, offset);
+ }
+=20
+ /**
+diff --git a/glib/meson.build b/glib/meson.build
+index aaf5f00f5..5a6eea397 100644
+--- a/glib/meson.build
++++ b/glib/meson.build
+@@ -268,6 +268,7 @@ glib_sources =3D files(
+   'gslist.c',
+   'gstdio.c',
+   'gstrfuncs.c',
++  'gstrfuncsprivate.h',
+   'gstring.c',
+   'gstringchunk.c',
+   'gtestutils.c',
+diff --git a/glib/tests/array-test.c b/glib/tests/array-test.c
+index b26704e25..ca819541f 100644
+--- a/glib/tests/array-test.c
++++ b/glib/tests/array-test.c
+@@ -29,6 +29,8 @@
+ #include <string.h>
+ #include "glib.h"
+=20
++#include "gstrfuncsprivate.h"
++
+ /* Test data to be passed to any function which calls g_array_new(), pr=
oviding
+  * the parameters for that call. Most #GArray tests should be repeated =
for all
+  * possible values of #ArrayTestData. */
+@@ -1616,7 +1618,7 @@ byte_array_new_take (void)
+   GByteArray *gbarray;
+   guint8 *data;
+=20
+-  data =3D g_memdup ("woooweeewow", 11);
++  data =3D g_memdup2 ("woooweeewow", 11);
+   gbarray =3D g_byte_array_new_take (data, 11);
+   g_assert (gbarray->data =3D=3D data);
+   g_assert_cmpuint (gbarray->len, =3D=3D, 11);
+diff --git a/glib/tests/option-context.c b/glib/tests/option-context.c
+index 149d22353..88d2b80d1 100644
+--- a/glib/tests/option-context.c
++++ b/glib/tests/option-context.c
+@@ -27,6 +27,8 @@
+ #include <string.h>
+ #include <locale.h>
+=20
++#include "gstrfuncsprivate.h"
++
+ static GOptionEntry main_entries[] =3D {
+   { "main-switch", 0, 0,
+     G_OPTION_ARG_NONE, NULL,
+@@ -256,7 +258,7 @@ join_stringv (int argc, char **argv)
+ static char **
+ copy_stringv (char **argv, int argc)
+ {
+-  return g_memdup (argv, sizeof (char *) * (argc + 1));
++  return g_memdup2 (argv, sizeof (char *) * (argc + 1));
+ }
+=20
+ static void
+@@ -2323,7 +2325,7 @@ test_group_parse (void)
+   g_option_context_add_group (context, group);
+=20
+   argv =3D split_string ("program --test arg1 -f arg2 --group-test arg3=
 --frob arg4 -z arg5", &argc);
+-  orig_argv =3D g_memdup (argv, (argc + 1) * sizeof (char *));
++  orig_argv =3D g_memdup2 (argv, (argc + 1) * sizeof (char *));
+=20
+   retval =3D g_option_context_parse (context, &argc, &argv, &error);
+=20
+diff --git a/glib/tests/strfuncs.c b/glib/tests/strfuncs.c
+index e1f9619c7..d968afff9 100644
+--- a/glib/tests/strfuncs.c
++++ b/glib/tests/strfuncs.c
+@@ -32,6 +32,8 @@
+ #include <string.h>
+ #include "glib.h"
+=20
++#include "gstrfuncsprivate.h"
++
+ #if defined (_MSC_VER) && (_MSC_VER <=3D 1800)
+ #define isnan(x) _isnan(x)
+=20
+@@ -219,6 +221,26 @@ test_memdup (void)
+   g_free (str_dup);
+ }
+=20
++/* Testing g_memdup2() function with various positive and negative case=
s */
++static void
++test_memdup2 (void)
++{
++  gchar *str_dup =3D NULL;
++  const gchar *str =3D "The quick brown fox jumps over the lazy dog";
++
++  /* Testing negative cases */
++  g_assert_null (g_memdup2 (NULL, 1024));
++  g_assert_null (g_memdup2 (str, 0));
++  g_assert_null (g_memdup2 (NULL, 0));
++
++  /* Testing normal usage cases */
++  str_dup =3D g_memdup2 (str, strlen (str) + 1);
++  g_assert_nonnull (str_dup);
++  g_assert_cmpstr (str, =3D=3D, str_dup);
++
++  g_free (str_dup);
++}
++
+ /* Testing g_strpcpy() function with various positive and negative case=
s */
+ static void
+ test_stpcpy (void)
+@@ -2523,6 +2545,7 @@ main (int   argc,
+   g_test_add_func ("/strfuncs/has-prefix", test_has_prefix);
+   g_test_add_func ("/strfuncs/has-suffix", test_has_suffix);
+   g_test_add_func ("/strfuncs/memdup", test_memdup);
++  g_test_add_func ("/strfuncs/memdup2", test_memdup2);
+   g_test_add_func ("/strfuncs/stpcpy", test_stpcpy);
+   g_test_add_func ("/strfuncs/str_match_string", test_str_match_string)=
;
+   g_test_add_func ("/strfuncs/str_tokenize_and_fold", test_str_tokenize=
_and_fold);
+diff --git a/gobject/gsignal.c b/gobject/gsignal.c
+index 77d8f211e..41c54ab57 100644
+--- a/gobject/gsignal.c
++++ b/gobject/gsignal.c
+@@ -28,6 +28,7 @@
+ #include <signal.h>
+=20
+ #include "gsignal.h"
++#include "gstrfuncsprivate.h"
+ #include "gtype-private.h"
+ #include "gbsearcharray.h"
+ #include "gvaluecollector.h"
+@@ -1730,7 +1731,7 @@ g_signal_newv (const gchar       *signal_name,
+   node->single_va_closure_is_valid =3D FALSE;
+   node->flags =3D signal_flags & G_SIGNAL_FLAGS_MASK;
+   node->n_params =3D n_params;
+-  node->param_types =3D g_memdup (param_types, sizeof (GType) * n_param=
s);
++  node->param_types =3D g_memdup2 (param_types, sizeof (GType) * n_para=
ms);
+   node->return_type =3D return_type;
+   node->class_closure_bsa =3D NULL;
+   if (accumulator)
+diff --git a/gobject/gtype.c b/gobject/gtype.c
+index 7d3789400..8441b90e9 100644
+--- a/gobject/gtype.c
++++ b/gobject/gtype.c
+@@ -33,6 +33,7 @@
+=20
+ #include "glib-private.h"
+ #include "gconstructor.h"
++#include "gstrfuncsprivate.h"
+=20
+ #ifdef G_OS_WIN32
+ #include <windows.h>
+@@ -1470,7 +1471,7 @@ type_add_interface_Wm (TypeNode             *node,
+   iholder->next =3D iface_node_get_holders_L (iface);
+   iface_node_set_holders_W (iface, iholder);
+   iholder->instance_type =3D NODE_TYPE (node);
+-  iholder->info =3D info ? g_memdup (info, sizeof (*info)) : NULL;
++  iholder->info =3D info ? g_memdup2 (info, sizeof (*info)) : NULL;
+   iholder->plugin =3D plugin;
+=20
+   /* create an iface entry for this type */
+@@ -1731,7 +1732,7 @@ type_iface_retrieve_holder_info_Wm (TypeNode *ifac=
e,
+         INVALID_RECURSION ("g_type_plugin_*", iholder->plugin, NODE_NAM=
E (iface));
+      =20
+       check_interface_info_I (iface, instance_type, &tmp_info);
+-      iholder->info =3D g_memdup (&tmp_info, sizeof (tmp_info));
++      iholder->info =3D g_memdup2 (&tmp_info, sizeof (tmp_info));
+     }
+  =20
+   return iholder;	/* we don't modify write lock upon returning NULL */
+@@ -2016,10 +2017,10 @@ type_iface_vtable_base_init_Wm (TypeNode *iface,
+       IFaceEntry *pentry =3D type_lookup_iface_entry_L (pnode, iface);
+      =20
+       if (pentry)
+-	vtable =3D g_memdup (pentry->vtable, iface->data->iface.vtable_size);
++	vtable =3D g_memdup2 (pentry->vtable, iface->data->iface.vtable_size);
+     }
+   if (!vtable)
+-    vtable =3D g_memdup (iface->data->iface.dflt_vtable, iface->data->i=
face.vtable_size);
++    vtable =3D g_memdup2 (iface->data->iface.dflt_vtable, iface->data->=
iface.vtable_size);
+   entry->vtable =3D vtable;
+   vtable->g_type =3D NODE_TYPE (iface);
+   vtable->g_instance_type =3D NODE_TYPE (node);
+diff --git a/gobject/gtypemodule.c b/gobject/gtypemodule.c
+index 4ecaf8c88..20911fafd 100644
+--- a/gobject/gtypemodule.c
++++ b/gobject/gtypemodule.c
+@@ -19,6 +19,7 @@
+=20
+ #include <stdlib.h>
+=20
++#include "gstrfuncsprivate.h"
+ #include "gtypeplugin.h"
+ #include "gtypemodule.h"
+=20
+@@ -436,7 +437,7 @@ g_type_module_register_type (GTypeModule     *module=
,
+   module_type_info->loaded =3D TRUE;
+   module_type_info->info =3D *type_info;
+   if (type_info->value_table)
+-    module_type_info->info.value_table =3D g_memdup (type_info->value_t=
able,
++    module_type_info->info.value_table =3D g_memdup2 (type_info->value_=
table,
+ 						   sizeof (GTypeValueTable));
+=20
+   return module_type_info->type;
+diff --git a/gobject/tests/param.c b/gobject/tests/param.c
+index 758289bf8..971cff162 100644
+--- a/gobject/tests/param.c
++++ b/gobject/tests/param.c
+@@ -2,6 +2,8 @@
+ #include <glib-object.h>
+ #include <stdlib.h>
+=20
++#include "gstrfuncsprivate.h"
++
+ static void
+ test_param_value (void)
+ {
+@@ -851,7 +853,7 @@ main (int argc, char *argv[])
+             test_path =3D g_strdup_printf ("/param/implement/subprocess=
/%d-%d-%d-%d",
+                                          data.change_this_flag, data.ch=
ange_this_type,
+                                          data.use_this_flag, data.use_t=
his_type);
+-            test_data =3D g_memdup (&data, sizeof (TestParamImplementDa=
ta));
++            test_data =3D g_memdup2 (&data, sizeof (TestParamImplementD=
ata));
+             g_test_add_data_func_full (test_path, test_data, test_param=
_implement_child, g_free);
+             g_free (test_path);
+           }
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.62.6.bb
index 1a006b9f38..a3b271a4e4 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.xz \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-on=
ly-.patch \
            file://tzdata-update.patch \
            file://CVE-2020-35457.patch \
+           file://CVE-2021-27219.patch \
            "
=20
 SRC_URI_append_class-native =3D " file://relocate-modules.patch"
--=20
2.17.1

