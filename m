Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CB3C27C53
	for <webhook@archiver.kernel.org>; Sat, 22 Jun 2024 11:58:07 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.95797.1719057482913591570
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jun 2024 04:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KLaXh8su;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.180, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c9cc681ee0so1383631b6e.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 04:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719057482; x=1719662282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0S7YMul5pY3TsbARsEJ2IxtkoJ6vvV3qCih/M5s9A+A=;
        b=KLaXh8suRB4smYkp+VBonQdb9dh5jKWiujrmQUrnwoqTxCzApkGUNl5FKdmJTOAHUB
         tYU+bBUp+GnTB5Hn/LpDbvEsDV6GD7Sq0nDCKDPXVu8nCRSANrEqKMkqOueoc6dCCPrz
         MD7Fp4E+PAkCgIczq5zE+nBbcPj1AOySn3kfWQOvf190rJXuYdBi8TjO3DEoaYPw0Ej7
         /lVjRVmWbDckdK1tdV0lL1sPOYCtK/UplodPxaY64XC4uIct/2dfUs7v2J0rnjj05WsK
         TJzGaG35LIdf79c5W+C1kAID3tGVmLnRWWre8YTjLQRRZHnIAROpUxA4wpKROLompIpO
         zt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719057482; x=1719662282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0S7YMul5pY3TsbARsEJ2IxtkoJ6vvV3qCih/M5s9A+A=;
        b=h1gJPxSqF9xQ1d8VlcwvPH0OYYi+rPUhOkBDiOyOCJBzBgMojrmrASn6REkJ9aa2p2
         ZwDn6gOhkfU8j6Cd3bkA6ZrGYPAQkgUT5WZifaLVava4FIMVsZ6CgWPxzEwsrIm2E/JX
         5pNgen3mGkccRTTeKoAoZ38/PgefcSMSm5dIIe91t5lcXm3WM5WxRzAp8+5oFAx2CFRL
         VbV+Fdn0bDrQAkpRa9AfA5VTRzr3JTXdmnNDiWHU18+stz5M+nhHRVmepeI+sebbGGzF
         RjxQrpQemAba04afnQZVhdzUMe+z0+SAH5pufvUYHRP6ykRK9nQTLbhdhnQklmK/tyUa
         OjYQ==
X-Gm-Message-State: AOJu0YyD7xAWub7bkCPvcHPoShuUaYDjUj7k1tDt+2qpDBqYibt7Ajia
	Wvgh97xly9wAUApNoMntgE55xR0rJf3buEvyAQyujofODbOqwc4p5AEgU62m0dMe1/0ZF2wC6yT
	H
X-Google-Smtp-Source: AGHT+IEtExt/vNgWcdIym5Loxh/wzziN0bKR7/rF7D7IQ4+rppUjfSCCtyGEiafC9eQaxOg5nWfyxg==
X-Received: by 2002:a05:6870:7b4c:b0:258:42be:ce5e with SMTP id 586e51a60fabf-25d016c196emr347934fac.16.1719057480262;
        Sat, 22 Jun 2024 04:58:00 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716b364687bsm2101074a12.12.2024.06.22.04.57.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 04:57:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/9] glib-2.0: patch CVE-2024-34397
Date: Sat, 22 Jun 2024 04:57:28 -0700
Message-Id: <95e8507848e3143eca83621f6572439e22f60bd4.1719057291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719057291.git.steve@sakoman.com>
References: <cover.1719057291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 11:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201040

From: Peter Marko <peter.marko@siemens.com>

This is taken from https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4047
That MR was not merged as 2.72 is inactive branch now.
But it can be used by distributions, like Ubuntu did under
https://git.launchpad.net/ubuntu/+source/glib2.0/commit/?h=applied/ubuntu/jammy-security&id=94425c909b037c63c9dbbf72015f628ed4ad4aea

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glib-2.0/glib-2.0/CVE-2024-34397_01.patch | 129 +++
 .../glib-2.0/glib-2.0/CVE-2024-34397_02.patch |  62 ++
 .../glib-2.0/glib-2.0/CVE-2024-34397_03.patch | 985 ++++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2024-34397_04.patch | 253 +++++
 .../glib-2.0/glib-2.0/CVE-2024-34397_05.patch |  88 ++
 .../glib-2.0/glib-2.0/CVE-2024-34397_06.patch | 263 +++++
 .../glib-2.0/glib-2.0/CVE-2024-34397_07.patch |  45 +
 .../glib-2.0/glib-2.0/CVE-2024-34397_08.patch | 168 +++
 .../glib-2.0/glib-2.0/CVE-2024-34397_09.patch |  81 ++
 .../glib-2.0/glib-2.0/CVE-2024-34397_10.patch | 108 ++
 .../glib-2.0/glib-2.0/CVE-2024-34397_11.patch | 133 +++
 .../glib-2.0/glib-2.0/CVE-2024-34397_12.patch | 173 +++
 .../glib-2.0/glib-2.0/CVE-2024-34397_13.patch | 513 +++++++++
 .../glib-2.0/glib-2.0/CVE-2024-34397_14.patch |  75 ++
 .../glib-2.0/glib-2.0/CVE-2024-34397_15.patch |  47 +
 .../glib-2.0/glib-2.0/CVE-2024-34397_16.patch |  62 ++
 .../glib-2.0/glib-2.0/CVE-2024-34397_17.patch | 121 +++
 .../glib-2.0/glib-2.0/CVE-2024-34397_18.patch |  50 +
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  18 +
 19 files changed, 3374 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_03.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_04.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_05.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_06.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_07.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_08.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_09.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_10.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_11.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_12.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_13.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_14.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_15.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_16.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_17.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_18.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_01.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_01.patch
new file mode 100644
index 0000000000..6a476fe307
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_01.patch
@@ -0,0 +1,129 @@
+From c4e3022918565253ffad52449dd0e648b6d772c7 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 28 Nov 2023 12:58:20 +0000
+Subject: [PATCH 01/18] gdbusmessage: Cache the arg0 value
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Technically we can’t rely on it being kept alive by the `message->body`
+pointer, unless we can guarantee that the `GVariant` is always
+serialised. That’s not necessarily the case, so keep a separate ref on
+the arg0 value at all times.
+
+This avoids a potential use-after-free.
+
+Spotted by Thomas Haller in
+https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3720#note_1924707.
+
+[This is a prerequisite for having tests pass after fixing the
+vulnerability described in glib#3268, because after fixing that
+vulnerability, the use-after-free genuinely does happen during
+regression testing. -smcv]
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+Helps: #3183, #3268
+(cherry picked from commit 10e9a917be7fb92b6b27837ef7a7f1d0be6095d5)
+
+CVE: CVE-2024-34397
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/c4e3022918565253ffad52449dd0e648b6d772c7]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/gdbusmessage.c | 35 ++++++++++++++++++++++-------------
+ 1 file changed, 22 insertions(+), 13 deletions(-)
+
+diff --git a/gio/gdbusmessage.c b/gio/gdbusmessage.c
+index ecef6cd3c..3fd1151ca 100644
+--- a/gio/gdbusmessage.c
++++ b/gio/gdbusmessage.c
+@@ -506,6 +506,7 @@ struct _GDBusMessage
+   guint32 serial;
+   GHashTable *headers;
+   GVariant *body;
++  GVariant *arg0_cache;  /* (nullable) (owned) */
+ #ifdef G_OS_UNIX
+   GUnixFDList *fd_list;
+ #endif
+@@ -528,6 +529,7 @@ g_dbus_message_finalize (GObject *object)
+     g_hash_table_unref (message->headers);
+   if (message->body != NULL)
+     g_variant_unref (message->body);
++  g_clear_pointer (&message->arg0_cache, g_variant_unref);
+ #ifdef G_OS_UNIX
+   if (message->fd_list != NULL)
+     g_object_unref (message->fd_list);
+@@ -1163,6 +1165,7 @@ g_dbus_message_set_body (GDBusMessage  *message,
+   if (body == NULL)
+     {
+       message->body = NULL;
++      message->arg0_cache = NULL;
+       g_dbus_message_set_signature (message, NULL);
+     }
+   else
+@@ -1173,6 +1176,12 @@ g_dbus_message_set_body (GDBusMessage  *message,
+ 
+       message->body = g_variant_ref_sink (body);
+ 
++      if (g_variant_is_of_type (message->body, G_VARIANT_TYPE_TUPLE) &&
++          g_variant_n_children (message->body) > 0)
++        message->arg0_cache = g_variant_get_child_value (message->body, 0);
++      else
++        message->arg0_cache = NULL;
++
+       type_string = g_variant_get_type_string (body);
+       type_string_len = strlen (type_string);
+       g_assert (type_string_len >= 2);
+@@ -2325,6 +2334,14 @@ g_dbus_message_new_from_blob (guchar                *blob,
+                                                  2,
+                                                  &local_error);
+           g_variant_type_free (variant_type);
++
++          if (message->body != NULL &&
++              g_variant_is_of_type (message->body, G_VARIANT_TYPE_TUPLE) &&
++              g_variant_n_children (message->body) > 0)
++            message->arg0_cache = g_variant_get_child_value (message->body, 0);
++          else
++            message->arg0_cache = NULL;
++
+           if (message->body == NULL)
+             goto fail;
+         }
+@@ -3364,22 +3381,13 @@ g_dbus_message_set_signature (GDBusMessage  *message,
+ const gchar *
+ g_dbus_message_get_arg0 (GDBusMessage  *message)
+ {
+-  const gchar *ret;
+-
+   g_return_val_if_fail (G_IS_DBUS_MESSAGE (message), NULL);
+ 
+-  ret = NULL;
++  if (message->arg0_cache != NULL &&
++      g_variant_is_of_type (message->arg0_cache, G_VARIANT_TYPE_STRING))
++    return g_variant_get_string (message->arg0_cache, NULL);
+ 
+-  if (message->body != NULL && g_variant_is_of_type (message->body, G_VARIANT_TYPE_TUPLE))
+-    {
+-      GVariant *item;
+-      item = g_variant_get_child_value (message->body, 0);
+-      if (g_variant_is_of_type (item, G_VARIANT_TYPE_STRING))
+-        ret = g_variant_get_string (item, NULL);
+-      g_variant_unref (item);
+-    }
+-
+-  return ret;
++  return NULL;
+ }
+ 
+ /* ---------------------------------------------------------------------------------------------------- */
+@@ -3822,6 +3830,7 @@ g_dbus_message_copy (GDBusMessage  *message,
+    * to just ref (as opposed to deep-copying) the GVariant instances
+    */
+   ret->body = message->body != NULL ? g_variant_ref (message->body) : NULL;
++  ret->arg0_cache = message->arg0_cache != NULL ? g_variant_ref (message->arg0_cache) : NULL;
+   g_hash_table_iter_init (&iter, message->headers);
+   while (g_hash_table_iter_next (&iter, &header_key, (gpointer) &header_value))
+     g_hash_table_insert (ret->headers, header_key, g_variant_ref (header_value));
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_02.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_02.patch
new file mode 100644
index 0000000000..aecc1686d5
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_02.patch
@@ -0,0 +1,62 @@
+From c805fd3862baaa114d1cceee27cc931264894c98 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Wed, 1 May 2024 15:51:42 +0100
+Subject: [PATCH 02/18] gdbusconnection: Make a backport of g_set_str()
+ available
+
+A subsequent commit will need this. Copying all of g_set_str() into a
+private header seems cleaner than replacing the call to it.
+
+Helps: GNOME/glib#3268
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+CVE: CVE-2024-34397
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/c805fd3862baaa114d1cceee27cc931264894c98]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/gdbusconnection.c |  1 +
+ glib/glib-private.h   | 18 ++++++++++++++++++
+ 2 files changed, 19 insertions(+)
+
+diff --git a/gio/gdbusconnection.c b/gio/gdbusconnection.c
+index 1159c2db4..82a68437b 100644
+--- a/gio/gdbusconnection.c
++++ b/gio/gdbusconnection.c
+@@ -95,6 +95,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ 
++#include "glib-private.h"
+ #include "gdbusauth.h"
+ #include "gdbusutils.h"
+ #include "gdbusaddress.h"
+diff --git a/glib/glib-private.h b/glib/glib-private.h
+index 943252f1b..f02828ff5 100644
+--- a/glib/glib-private.h
++++ b/glib/glib-private.h
+@@ -201,4 +201,22 @@ GLibPrivateVTable *glib__private__ (void);
+ # define GLIB_DEFAULT_LOCALE ""
+ #endif
+ 
++/* Backported from GLib 2.78.x, where it is public API in gstrfuncs.h */
++static inline gboolean
++g_set_str (char       **str_pointer,
++           const char  *new_str)
++{
++  char *copy;
++
++  if (*str_pointer == new_str ||
++      (*str_pointer && new_str && strcmp (*str_pointer, new_str) == 0))
++    return FALSE;
++
++  copy = g_strdup (new_str);
++  g_free (*str_pointer);
++  *str_pointer = copy;
++
++  return TRUE;
++}
++
+ #endif /* __GLIB_PRIVATE_H__ */
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_03.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_03.patch
new file mode 100644
index 0000000000..833e2b51a4
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_03.patch
@@ -0,0 +1,985 @@
+From 8b1d90457e2e72f1d7db7cb77b74754af3a5c4ef Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Fri, 8 Mar 2024 14:19:46 +0000
+Subject: [PATCH 03/18] tests: Add a data-driven test for signal subscriptions
+
+This somewhat duplicates test_connection_signals(), but is easier to
+extend to cover different scenarios.
+
+Each scenario is tested three times: once with lower-level
+GDBusConnection APIs, once with the higher-level GDBusProxy (which
+cannot implement all of the subscription scenarios, so some message
+counts are lower), and once with both (to check that delivery of the
+same message to multiple destinations is handled appropriately).
+
+[Backported to glib-2-74, resolving conflicts in gio/tests/meson.build]
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+CVE: CVE-2024-34397
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/8b1d90457e2e72f1d7db7cb77b74754af3a5c4ef]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/tests/gdbus-subscribe.c | 938 ++++++++++++++++++++++++++++++++++++
+ gio/tests/meson.build       |   1 +
+ 2 files changed, 939 insertions(+)
+ create mode 100644 gio/tests/gdbus-subscribe.c
+
+diff --git a/gio/tests/gdbus-subscribe.c b/gio/tests/gdbus-subscribe.c
+new file mode 100644
+index 000000000..3f53e1d7f
+--- /dev/null
++++ b/gio/tests/gdbus-subscribe.c
+@@ -0,0 +1,938 @@
++/*
++ * Copyright 2024 Collabora Ltd.
++ * SPDX-License-Identifier: LGPL-2.1-or-later
++ */
++
++#include <gio/gio.h>
++
++#include "gdbus-tests.h"
++
++#define DBUS_SERVICE_DBUS "org.freedesktop.DBus"
++#define DBUS_PATH_DBUS "/org/freedesktop/DBus"
++#define DBUS_INTERFACE_DBUS DBUS_SERVICE_DBUS
++
++/* A signal that each connection emits to indicate that it has finished
++ * emitting other signals */
++#define FINISHED_PATH "/org/gtk/Test/Finished"
++#define FINISHED_INTERFACE "org.gtk.Test.Finished"
++#define FINISHED_SIGNAL "Finished"
++
++/* A signal emitted during testing */
++#define EXAMPLE_PATH "/org/gtk/GDBus/ExampleInterface"
++#define EXAMPLE_INTERFACE "org.gtk.GDBus.ExampleInterface"
++#define FOO_SIGNAL "Foo"
++
++/* Log @s in a debug message. */
++static inline const char *
++nonnull (const char *s,
++         const char *if_null)
++{
++  return (s == NULL) ? if_null : s;
++}
++
++typedef enum
++{
++  TEST_CONN_NONE,
++  TEST_CONN_FIRST,
++  /* A connection that subscribes to signals */
++  TEST_CONN_SUBSCRIBER = TEST_CONN_FIRST,
++  /* A mockup of a legitimate service */
++  TEST_CONN_SERVICE,
++  /* A mockup of a second legitimate service */
++  TEST_CONN_SERVICE2,
++  /* A connection that tries to trick @subscriber into processing its signals
++   * as if they came from @service */
++  TEST_CONN_ATTACKER,
++  NUM_TEST_CONNS
++} TestConn;
++
++static const char * const test_conn_descriptions[NUM_TEST_CONNS] =
++{
++  "(unused)",
++  "subscriber",
++  "service",
++  "service 2",
++  "attacker"
++};
++
++typedef enum
++{
++  SUBSCRIPTION_MODE_CONN,
++  SUBSCRIPTION_MODE_PROXY,
++  SUBSCRIPTION_MODE_PARALLEL
++} SubscriptionMode;
++
++typedef struct
++{
++  GDBusProxy *received_by_proxy;
++  TestConn sender;
++  char *path;
++  char *iface;
++  char *member;
++  GVariant *parameters;
++  char *arg0;
++  guint32 step;
++} ReceivedMessage;
++
++static void
++received_message_free (ReceivedMessage *self)
++{
++
++  g_clear_object (&self->received_by_proxy);
++  g_free (self->path);
++  g_free (self->iface);
++  g_free (self->member);
++  g_clear_pointer (&self->parameters, g_variant_unref);
++  g_free (self->arg0);
++  g_free (self);
++}
++
++typedef struct
++{
++  TestConn sender;
++  TestConn unicast_to;
++  const char *path;
++  const char *iface;
++  const char *member;
++  const char *arg0;
++  guint received_by_conn;
++  guint received_by_proxy;
++} TestEmitSignal;
++
++typedef struct
++{
++  TestConn sender;
++  const char *path;
++  const char *iface;
++  const char *member;
++  const char *arg0;
++  GDBusSignalFlags flags;
++} TestSubscribe;
++
++typedef enum
++{
++  TEST_ACTION_NONE = 0,
++  TEST_ACTION_SUBSCRIBE,
++  TEST_ACTION_EMIT_SIGNAL,
++} TestAction;
++
++typedef struct
++{
++  TestAction action;
++  union {
++    TestEmitSignal signal;
++    TestSubscribe subscribe;
++  } u;
++} TestStep;
++
++/* Arbitrary, extend as necessary to accommodate the longest test */
++#define MAX_TEST_STEPS 10
++
++typedef struct
++{
++  const char *description;
++  TestStep steps[MAX_TEST_STEPS];
++} TestPlan;
++
++static const TestPlan plan_simple =
++{
++  .description = "A broadcast is only received after subscribing to it",
++  .steps = {
++    {
++      /* We don't receive a signal if we haven't subscribed yet */
++      .action = TEST_ACTION_EMIT_SIGNAL,
++      .u.signal = {
++        .sender = TEST_CONN_SERVICE,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++        .member = FOO_SIGNAL,
++        .received_by_conn = 0,
++        .received_by_proxy = 0
++      },
++    },
++    {
++      .action = TEST_ACTION_SUBSCRIBE,
++      .u.subscribe = {
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++      },
++    },
++    {
++      /* Now it works */
++      .action = TEST_ACTION_EMIT_SIGNAL,
++      .u.signal = {
++        .sender = TEST_CONN_SERVICE,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++        .member = FOO_SIGNAL,
++        .received_by_conn = 1,
++        /* The proxy can't be used in this case, because it needs
++         * a bus name to subscribe to */
++        .received_by_proxy = 0
++      },
++    },
++  },
++};
++
++static const TestPlan plan_broadcast_from_anyone =
++{
++  .description = "A subscription with NULL sender accepts broadcast and unicast",
++  .steps = {
++    {
++      /* Subscriber wants to receive signals from anyone */
++      .action = TEST_ACTION_SUBSCRIBE,
++      .u.subscribe = {
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++      },
++    },
++    {
++      /* First service sends a broadcast */
++      .action = TEST_ACTION_EMIT_SIGNAL,
++      .u.signal = {
++        .sender = TEST_CONN_SERVICE,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++        .member = FOO_SIGNAL,
++        .received_by_conn = 1,
++        .received_by_proxy = 0
++      },
++    },
++    {
++      /* Second service also sends a broadcast */
++      .action = TEST_ACTION_EMIT_SIGNAL,
++      .u.signal = {
++        .sender = TEST_CONN_SERVICE2,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++        .member = FOO_SIGNAL,
++        .received_by_conn = 1,
++        .received_by_proxy = 0
++      },
++    },
++    {
++      /* First service sends a unicast signal */
++      .action = TEST_ACTION_EMIT_SIGNAL,
++      .u.signal = {
++        .sender = TEST_CONN_SERVICE,
++        .unicast_to = TEST_CONN_SUBSCRIBER,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++        .member = FOO_SIGNAL,
++        .received_by_conn = 1,
++        .received_by_proxy = 0
++      },
++    },
++    {
++      /* Second service also sends a unicast signal */
++      .action = TEST_ACTION_EMIT_SIGNAL,
++      .u.signal = {
++        .sender = TEST_CONN_SERVICE2,
++        .unicast_to = TEST_CONN_SUBSCRIBER,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++        .member = FOO_SIGNAL,
++        .received_by_conn = 1,
++        .received_by_proxy = 0
++      },
++    },
++  },
++};
++
++static const TestPlan plan_match_twice =
++{
++  .description = "A message matching more than one subscription is received "
++                 "once per subscription",
++  .steps = {
++    {
++      .action = TEST_ACTION_SUBSCRIBE,
++      .u.subscribe = {
++        .sender = TEST_CONN_SERVICE,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++      },
++    },
++    {
++      .action = TEST_ACTION_SUBSCRIBE,
++      .u.subscribe = {
++        .path = EXAMPLE_PATH,
++      },
++    },
++    {
++      .action = TEST_ACTION_SUBSCRIBE,
++      .u.subscribe = {
++        .iface = EXAMPLE_INTERFACE,
++      },
++    },
++    {
++      .action = TEST_ACTION_SUBSCRIBE,
++      .u.subscribe = {
++        .sender = TEST_CONN_SERVICE,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++      },
++    },
++    {
++      .action = TEST_ACTION_EMIT_SIGNAL,
++      .u.signal = {
++        .sender = TEST_CONN_SERVICE,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++        .member = FOO_SIGNAL,
++        .received_by_conn = 4,
++        /* Only the first and last work with GDBusProxy */
++        .received_by_proxy = 2
++      },
++    },
++  },
++};
++
++static const TestPlan plan_limit_by_unique_name =
++{
++  .description = "A subscription via a unique name only accepts messages "
++                 "sent by that same unique name",
++  .steps = {
++    {
++      /* Subscriber wants to receive signals from service */
++      .action = TEST_ACTION_SUBSCRIBE,
++      .u.subscribe = {
++        .sender = TEST_CONN_SERVICE,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++      },
++    },
++    {
++      /* Attacker wants to trick subscriber into thinking that service
++       * sent a signal */
++      .action = TEST_ACTION_EMIT_SIGNAL,
++      .u.signal = {
++        .sender = TEST_CONN_ATTACKER,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++        .member = FOO_SIGNAL,
++        .received_by_conn = 0,
++        .received_by_proxy = 0
++      },
++    },
++    {
++      /* Attacker tries harder, by sending a signal unicast directly to
++       * the subscriber */
++      .action = TEST_ACTION_EMIT_SIGNAL,
++      .u.signal = {
++        .sender = TEST_CONN_ATTACKER,
++        .unicast_to = TEST_CONN_SUBSCRIBER,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++        .member = FOO_SIGNAL,
++        .received_by_conn = 0,
++        .received_by_proxy = 0
++      },
++    },
++    {
++      /* When the real service sends a signal, it should still get through */
++      .action = TEST_ACTION_EMIT_SIGNAL,
++      .u.signal = {
++        .sender = TEST_CONN_SERVICE,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++        .member = FOO_SIGNAL,
++        .received_by_conn = 1,
++        .received_by_proxy = 1
++      },
++    },
++  },
++};
++
++typedef struct
++{
++  const TestPlan *plan;
++  SubscriptionMode mode;
++  GError *error;
++  /* (element-type ReceivedMessage) */
++  GPtrArray *received;
++  /* conns[TEST_CONN_NONE] is unused and remains NULL */
++  GDBusConnection *conns[NUM_TEST_CONNS];
++  /* Proxies on conns[TEST_CONN_SUBSCRIBER] */
++  GPtrArray *proxies;
++  /* unique_names[TEST_CONN_NONE] is unused and remains NULL */
++  const char *unique_names[NUM_TEST_CONNS];
++  /* finished[TEST_CONN_NONE] is unused and remains FALSE */
++  gboolean finished[NUM_TEST_CONNS];
++  /* Remains 0 for any step that is not a subscription */
++  guint subscriptions[MAX_TEST_STEPS];
++  /* Number of times the signal from step n was received */
++  guint received_by_conn[MAX_TEST_STEPS];
++  /* Number of times the signal from step n was received */
++  guint received_by_proxy[MAX_TEST_STEPS];
++  guint finished_subscription;
++} Fixture;
++
++/* Wait for asynchronous messages from @conn to have been processed
++ * by the message bus, as a sequence point so that we can make
++ * "happens before" and "happens after" assertions relative to this.
++ * The easiest way to achieve this is to call a message bus method that has
++ * no arguments and wait for it to return: because the message bus processes
++ * messages in-order, anything we sent before this must have been processed
++ * by the time this call arrives. */
++static void
++connection_wait_for_bus (GDBusConnection *conn)
++{
++  GError *error = NULL;
++  GVariant *call_result;
++
++  call_result = g_dbus_connection_call_sync (conn,
++                                             DBUS_SERVICE_DBUS,
++                                             DBUS_PATH_DBUS,
++                                             DBUS_INTERFACE_DBUS,
++                                             "GetId",
++                                             NULL,   /* arguments */
++                                             NULL,   /* result type */
++                                             G_DBUS_CALL_FLAGS_NONE,
++                                             -1,
++                                             NULL,
++                                             &error);
++  g_assert_no_error (error);
++  g_assert_nonnull (call_result);
++  g_variant_unref (call_result);
++}
++
++/*
++ * Called when the subscriber receives a message from any connection
++ * announcing that it has emitted all the signals that it plans to emit.
++ */
++static void
++subscriber_finished_cb (GDBusConnection *conn,
++                        const char      *sender_name,
++                        const char      *path,
++                        const char      *iface,
++                        const char      *member,
++                        GVariant        *parameters,
++                        void            *user_data)
++{
++  Fixture *f = user_data;
++  GDBusConnection *subscriber = f->conns[TEST_CONN_SUBSCRIBER];
++  guint i;
++
++  g_assert_true (conn == subscriber);
++
++  for (i = TEST_CONN_FIRST; i < G_N_ELEMENTS (f->conns); i++)
++    {
++      if (g_str_equal (sender_name, f->unique_names[i]))
++        {
++          g_assert_false (f->finished[i]);
++          f->finished[i] = TRUE;
++
++          g_test_message ("Received Finished signal from %s %s",
++                          test_conn_descriptions[i], sender_name);
++          return;
++        }
++    }
++
++  g_error ("Received Finished signal from unknown sender %s", sender_name);
++}
++
++/*
++ * Called when we receive a signal, either via the GDBusProxy (proxy != NULL)
++ * or via the GDBusConnection (proxy == NULL).
++ */
++static void
++fixture_received_signal (Fixture    *f,
++                         GDBusProxy *proxy,
++                         const char *sender_name,
++                         const char *path,
++                         const char *iface,
++                         const char *member,
++                         GVariant   *parameters)
++{
++  guint i;
++  ReceivedMessage *received;
++
++  /* Ignore the Finished signal if it matches a wildcard subscription */
++  if (g_str_equal (member, FINISHED_SIGNAL))
++    return;
++
++  received = g_new0 (ReceivedMessage, 1);
++
++  if (proxy != NULL)
++    received->received_by_proxy = g_object_ref (proxy);
++  else
++    received->received_by_proxy = NULL;
++
++  received->path = g_strdup (path);
++  received->iface = g_strdup (iface);
++  received->member = g_strdup (member);
++  received->parameters = g_variant_ref (parameters);
++
++  for (i = TEST_CONN_FIRST; i < G_N_ELEMENTS (f->conns); i++)
++    {
++      if (g_str_equal (sender_name, f->unique_names[i]))
++        {
++          received->sender = i;
++          g_assert_false (f->finished[i]);
++          break;
++        }
++    }
++
++  g_assert_cmpint (received->sender, !=, TEST_CONN_NONE);
++
++  g_test_message ("Signal received from %s %s via %s",
++                  test_conn_descriptions[received->sender],
++                  sender_name,
++                  proxy != NULL ? "proxy" : "connection");
++  g_test_message ("\tPath: %s", path);
++  g_test_message ("\tInterface: %s", iface);
++  g_test_message ("\tMember: %s", member);
++
++  if (g_variant_is_of_type (parameters, G_VARIANT_TYPE ("(su)")))
++    {
++      g_variant_get (parameters, "(su)", &received->arg0, &received->step);
++      g_test_message ("\tString argument 0: %s", received->arg0);
++      g_test_message ("\tSent in step: %u", received->step);
++    }
++  else
++    {
++      g_assert_cmpstr (g_variant_get_type_string (parameters), ==, "(uu)");
++      g_variant_get (parameters, "(uu)", NULL, &received->step);
++      g_test_message ("\tArgument 0: (not a string)");
++      g_test_message ("\tSent in step: %u", received->step);
++    }
++
++  g_ptr_array_add (f->received, g_steal_pointer (&received));
++}
++
++static void
++proxy_signal_cb (GDBusProxy *proxy,
++                 const char *sender_name,
++                 const char *member,
++                 GVariant   *parameters,
++                 void       *user_data)
++{
++  Fixture *f = user_data;
++
++  fixture_received_signal (f, proxy, sender_name,
++                           g_dbus_proxy_get_object_path (proxy),
++                           g_dbus_proxy_get_interface_name (proxy),
++                           member, parameters);
++}
++
++static void
++subscribed_signal_cb (GDBusConnection *conn,
++                      const char      *sender_name,
++                      const char      *path,
++                      const char      *iface,
++                      const char      *member,
++                      GVariant        *parameters,
++                      void            *user_data)
++{
++  Fixture *f = user_data;
++  GDBusConnection *subscriber = f->conns[TEST_CONN_SUBSCRIBER];
++
++  g_assert_true (conn == subscriber);
++
++  fixture_received_signal (f, NULL, sender_name, path, iface, member, parameters);
++}
++
++static void
++fixture_subscribe (Fixture             *f,
++                   const TestSubscribe *subscribe,
++                   guint                step_number)
++{
++  GDBusConnection *subscriber = f->conns[TEST_CONN_SUBSCRIBER];
++  const char *sender;
++
++  if (subscribe->sender != TEST_CONN_NONE)
++    {
++      sender = f->unique_names[subscribe->sender];
++      g_test_message ("\tSender: %s %s",
++                      test_conn_descriptions[subscribe->sender],
++                      sender);
++    }
++  else
++    {
++      sender = NULL;
++      g_test_message ("\tSender: (any)");
++    }
++
++  g_test_message ("\tPath: %s", nonnull (subscribe->path, "(any)"));
++  g_test_message ("\tInterface: %s",
++                  nonnull (subscribe->iface, "(any)"));
++  g_test_message ("\tMember: %s",
++                  nonnull (subscribe->member, "(any)"));
++  g_test_message ("\tString argument 0: %s",
++                  nonnull (subscribe->arg0, "(any)"));
++  g_test_message ("\tFlags: %x", subscribe->flags);
++
++  if (f->mode != SUBSCRIPTION_MODE_PROXY)
++    {
++      /* CONN or PARALLEL */
++      guint id;
++
++      g_test_message ("\tSubscribing via connection");
++      id = g_dbus_connection_signal_subscribe (subscriber,
++                                               sender,
++                                               subscribe->iface,
++                                               subscribe->member,
++                                               subscribe->path,
++                                               subscribe->arg0,
++                                               subscribe->flags,
++                                               subscribed_signal_cb,
++                                               f, NULL);
++      g_assert_cmpuint (id, !=, 0);
++      f->subscriptions[step_number] = id;
++    }
++
++  if (f->mode != SUBSCRIPTION_MODE_CONN)
++    {
++      /* PROXY or PARALLEL */
++
++      if (sender == NULL)
++        {
++          g_test_message ("\tCannot subscribe via proxy: no bus name");
++        }
++      else if (subscribe->path == NULL)
++        {
++          g_test_message ("\tCannot subscribe via proxy: no path");
++        }
++      else if (subscribe->iface == NULL)
++        {
++          g_test_message ("\tCannot subscribe via proxy: no interface");
++        }
++      else
++        {
++          GDBusProxy *proxy;
++
++          g_test_message ("\tSubscribing via proxy");
++          proxy = g_dbus_proxy_new_sync (subscriber,
++                                         (G_DBUS_PROXY_FLAGS_DO_NOT_LOAD_PROPERTIES
++                                          | G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START),
++                                         NULL,    /* GDBusInterfaceInfo */
++                                         sender,
++                                         subscribe->path,
++                                         subscribe->iface,
++                                         NULL,    /* GCancellable */
++                                         &f->error);
++          g_assert_no_error (f->error);
++          g_assert_nonnull (proxy);
++          g_signal_connect (proxy, "g-signal", G_CALLBACK (proxy_signal_cb), f);
++          g_ptr_array_add (f->proxies, g_steal_pointer (&proxy));
++        }
++    }
++
++  /* As in setup(), we need to wait for AddMatch to happen. */
++  g_test_message ("Waiting for AddMatch to be processed");
++  connection_wait_for_bus (subscriber);
++}
++
++static void
++fixture_emit_signal (Fixture              *f,
++                     const TestEmitSignal *signal,
++                     guint                 step_number)
++{
++  GVariant *body;
++  const char *destination;
++  gboolean ok;
++
++  g_test_message ("\tSender: %s",
++                  test_conn_descriptions[signal->sender]);
++
++  if (signal->unicast_to != TEST_CONN_NONE)
++    {
++      destination = f->unique_names[signal->unicast_to];
++      g_test_message ("\tDestination: %s %s",
++                      test_conn_descriptions[signal->unicast_to],
++                      destination);
++    }
++  else
++    {
++      destination = NULL;
++      g_test_message ("\tDestination: (broadcast)");
++    }
++
++  g_assert_nonnull (signal->path);
++  g_test_message ("\tPath: %s", signal->path);
++  g_assert_nonnull (signal->iface);
++  g_test_message ("\tInterface: %s", signal->iface);
++  g_assert_nonnull (signal->member);
++  g_test_message ("\tMember: %s", signal->member);
++
++  /* If arg0 is non-NULL, put it in the message's argument 0.
++   * Otherwise put something that will not match any arg0.
++   * Either way, put the sequence number in argument 1 so we can
++   * correlate sent messages with received messages later. */
++  if (signal->arg0 != NULL)
++    {
++      g_test_message ("\tString argument 0: %s", signal->arg0);
++      /* floating */
++      body = g_variant_new ("(su)", signal->arg0, (guint32) step_number);
++    }
++  else
++    {
++      g_test_message ("\tArgument 0: (not a string)");
++      body = g_variant_new ("(uu)", (guint32) 0, (guint32) step_number);
++    }
++
++  ok = g_dbus_connection_emit_signal (f->conns[signal->sender],
++                                      destination,
++                                      signal->path,
++                                      signal->iface,
++                                      signal->member,
++                                      /* steals floating reference */
++                                      g_steal_pointer (&body),
++                                      &f->error);
++  g_assert_no_error (f->error);
++  g_assert_true (ok);
++
++  /* Emitting the signal is asynchronous, so if we want subsequent steps
++   * to be guaranteed to happen after the signal from the message bus's
++   * perspective, we have to do a round-trip to the message bus to sync up. */
++  g_test_message ("Waiting for signal to reach message bus");
++  connection_wait_for_bus (f->conns[signal->sender]);
++}
++
++static void
++fixture_run_plan (Fixture          *f,
++                  const TestPlan   *plan,
++                  SubscriptionMode  mode)
++{
++  guint i;
++
++  G_STATIC_ASSERT (G_N_ELEMENTS (plan->steps) == G_N_ELEMENTS (f->subscriptions));
++  G_STATIC_ASSERT (G_N_ELEMENTS (plan->steps) == G_N_ELEMENTS (f->received_by_conn));
++  G_STATIC_ASSERT (G_N_ELEMENTS (plan->steps) == G_N_ELEMENTS (f->received_by_proxy));
++
++  f->mode = mode;
++  f->plan = plan;
++
++  g_test_summary (plan->description);
++
++  for (i = 0; i < G_N_ELEMENTS (plan->steps); i++)
++    {
++      const TestStep *step = &plan->steps[i];
++
++      switch (step->action)
++        {
++          case TEST_ACTION_SUBSCRIBE:
++            g_test_message ("Step %u: adding subscription", i);
++            fixture_subscribe (f, &step->u.subscribe, i);
++            break;
++
++          case TEST_ACTION_EMIT_SIGNAL:
++            g_test_message ("Step %u: emitting signal", i);
++            fixture_emit_signal (f, &step->u.signal, i);
++            break;
++
++          case TEST_ACTION_NONE:
++            /* Padding to fill the rest of the array, do nothing */
++            break;
++
++          default:
++            g_return_if_reached ();
++        }
++    }
++
++  /* Now that we have done everything we wanted to do, emit Finished
++   * from each connection. */
++  for (i = TEST_CONN_FIRST; i < G_N_ELEMENTS (f->conns); i++)
++    {
++      gboolean ok;
++
++      ok = g_dbus_connection_emit_signal (f->conns[i],
++                                          NULL,
++                                          FINISHED_PATH,
++                                          FINISHED_INTERFACE,
++                                          FINISHED_SIGNAL,
++                                          NULL,
++                                          &f->error);
++      g_assert_no_error (f->error);
++      g_assert_true (ok);
++    }
++
++  /* Wait until we have seen the Finished signal from each sender */
++  while (TRUE)
++    {
++      gboolean all_finished = TRUE;
++
++      for (i = TEST_CONN_FIRST; i < G_N_ELEMENTS (f->conns); i++)
++        all_finished = all_finished && f->finished[i];
++
++      if (all_finished)
++        break;
++
++      g_main_context_iteration (NULL, TRUE);
++    }
++
++  /* Assert that the correct things happened before each Finished signal */
++  for (i = 0; i < f->received->len; i++)
++    {
++      const ReceivedMessage *received = g_ptr_array_index (f->received, i);
++
++      g_assert_cmpuint (received->step, <, G_N_ELEMENTS (f->received_by_conn));
++      g_assert_cmpuint (received->step, <, G_N_ELEMENTS (f->received_by_proxy));
++      g_assert_cmpint (plan->steps[received->step].action,
++                       ==, TEST_ACTION_EMIT_SIGNAL);
++
++      if (received->received_by_proxy != NULL)
++        f->received_by_proxy[received->step] += 1;
++      else
++        f->received_by_conn[received->step] += 1;
++    }
++
++  for (i = 0; i < G_N_ELEMENTS (plan->steps); i++)
++    {
++      const TestStep *step = &plan->steps[i];
++
++      if (step->action == TEST_ACTION_EMIT_SIGNAL)
++        {
++          const TestEmitSignal *signal = &plan->steps[i].u.signal;
++
++          if (mode != SUBSCRIPTION_MODE_PROXY)
++            {
++              g_test_message ("Signal from step %u was received %u times by "
++                              "GDBusConnection, expected %u",
++                              i, f->received_by_conn[i], signal->received_by_conn);
++              g_assert_cmpuint (f->received_by_conn[i], ==, signal->received_by_conn);
++            }
++          else
++            {
++              g_assert_cmpuint (f->received_by_conn[i], ==, 0);
++            }
++
++          if (mode != SUBSCRIPTION_MODE_CONN)
++            {
++              g_test_message ("Signal from step %u was received %u times by "
++                              "GDBusProxy, expected %u",
++                              i, f->received_by_proxy[i], signal->received_by_proxy);
++              g_assert_cmpuint (f->received_by_proxy[i], ==, signal->received_by_proxy);
++            }
++          else
++            {
++              g_assert_cmpuint (f->received_by_proxy[i], ==, 0);
++            }
++        }
++    }
++}
++
++static void
++setup (Fixture *f,
++       G_GNUC_UNUSED const void *context)
++{
++  GDBusConnection *subscriber;
++  guint i;
++
++  session_bus_up ();
++
++  f->proxies = g_ptr_array_new_full (MAX_TEST_STEPS, g_object_unref);
++  f->received = g_ptr_array_new_full (MAX_TEST_STEPS,
++                                      (GDestroyNotify) received_message_free);
++
++  for (i = TEST_CONN_FIRST; i < G_N_ELEMENTS (f->conns); i++)
++    {
++      f->conns[i] = _g_bus_get_priv (G_BUS_TYPE_SESSION, NULL, &f->error);
++      g_assert_no_error (f->error);
++      g_assert_nonnull (f->conns[i]);
++
++      f->unique_names[i] = g_dbus_connection_get_unique_name (f->conns[i]);
++      g_assert_nonnull (f->unique_names[i]);
++      g_test_message ("%s is %s",
++                      test_conn_descriptions[i],
++                      f->unique_names[i]);
++    }
++
++  subscriber = f->conns[TEST_CONN_SUBSCRIBER];
++
++  /* Used to wait for all connections to finish sending whatever they
++   * wanted to send */
++  f->finished_subscription = g_dbus_connection_signal_subscribe (subscriber,
++                                                                 NULL,
++                                                                 FINISHED_INTERFACE,
++                                                                 FINISHED_SIGNAL,
++                                                                 FINISHED_PATH,
++                                                                 NULL,
++                                                                 G_DBUS_SIGNAL_FLAGS_NONE,
++                                                                 subscriber_finished_cb,
++                                                                 f, NULL);
++  /* AddMatch is sent asynchronously, so we don't know how
++   * soon it will be processed. Before emitting signals, we
++   * need to wait for the message bus to get as far as processing
++   * AddMatch. */
++  g_test_message ("Waiting for AddMatch to be processed");
++  connection_wait_for_bus (subscriber);
++}
++
++static void
++test_conn_subscribe (Fixture *f,
++                     const void *context)
++{
++  fixture_run_plan (f, context, SUBSCRIPTION_MODE_CONN);
++}
++
++static void
++test_proxy_subscribe (Fixture *f,
++                      const void *context)
++{
++  fixture_run_plan (f, context, SUBSCRIPTION_MODE_PROXY);
++}
++
++static void
++test_parallel_subscribe (Fixture *f,
++                         const void *context)
++{
++  fixture_run_plan (f, context, SUBSCRIPTION_MODE_PARALLEL);
++}
++
++static void
++teardown (Fixture *f,
++          G_GNUC_UNUSED const void *context)
++{
++  GDBusConnection *subscriber = f->conns[TEST_CONN_SUBSCRIBER];
++  guint i;
++
++  g_ptr_array_unref (f->proxies);
++
++  if (f->finished_subscription != 0)
++    g_dbus_connection_signal_unsubscribe (subscriber, f->finished_subscription);
++
++  for (i = 0; i < G_N_ELEMENTS (f->subscriptions); i++)
++    {
++      if (f->subscriptions[i] != 0)
++        g_dbus_connection_signal_unsubscribe (subscriber, f->subscriptions[i]);
++    }
++
++  g_ptr_array_unref (f->received);
++
++  for (i = TEST_CONN_FIRST; i < G_N_ELEMENTS (f->conns); i++)
++    g_clear_object (&f->conns[i]);
++
++  g_clear_error (&f->error);
++
++  session_bus_down ();
++}
++
++int
++main (int   argc,
++      char *argv[])
++{
++  g_test_init (&argc, &argv, G_TEST_OPTION_ISOLATE_DIRS, NULL);
++
++  g_test_dbus_unset ();
++
++#define ADD_SUBSCRIBE_TEST(name) \
++  do { \
++    g_test_add ("/gdbus/subscribe/conn/" #name, \
++                Fixture, &plan_ ## name, \
++                setup, test_conn_subscribe, teardown); \
++    g_test_add ("/gdbus/subscribe/proxy/" #name, \
++                Fixture, &plan_ ## name, \
++                setup, test_proxy_subscribe, teardown); \
++    g_test_add ("/gdbus/subscribe/parallel/" #name, \
++                Fixture, &plan_ ## name, \
++                setup, test_parallel_subscribe, teardown); \
++  } while (0)
++
++  ADD_SUBSCRIBE_TEST (simple);
++  ADD_SUBSCRIBE_TEST (broadcast_from_anyone);
++  ADD_SUBSCRIBE_TEST (match_twice);
++  ADD_SUBSCRIBE_TEST (limit_by_unique_name);
++
++  return g_test_run();
++}
+diff --git a/gio/tests/meson.build b/gio/tests/meson.build
+index 383d84319..a1551aa53 100644
+--- a/gio/tests/meson.build
++++ b/gio/tests/meson.build
+@@ -354,6 +354,7 @@ if host_machine.system() != 'windows'
+       },
+       'gdbus-proxy-unique-name' : {'extra_sources' : extra_sources},
+       'gdbus-proxy-well-known-name' : {'extra_sources' : extra_sources},
++      'gdbus-subscribe' : {'extra_sources' : extra_sources},
+       'gdbus-test-codegen' : {
+         'extra_sources' : [extra_sources, gdbus_test_codegen_generated, gdbus_test_codegen_generated_interface_info],
+         'c_args' : ['-DGLIB_VERSION_MIN_REQUIRED=GLIB_VERSION_2_32'],
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_04.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_04.patch
new file mode 100644
index 0000000000..144afd0d51
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_04.patch
@@ -0,0 +1,253 @@
+From a87931c257a6bb1b7c104623beadd9b14d766ca6 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Fri, 8 Mar 2024 19:28:15 +0000
+Subject: [PATCH 04/18] tests: Add support for subscribing to signals from a
+ well-known name
+
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+CVE: CVE-2024-34397
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/a87931c257a6bb1b7c104623beadd9b14d766ca6]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/tests/gdbus-subscribe.c | 133 ++++++++++++++++++++++++++++++++++--
+ 1 file changed, 126 insertions(+), 7 deletions(-)
+
+diff --git a/gio/tests/gdbus-subscribe.c b/gio/tests/gdbus-subscribe.c
+index 3f53e1d7f..3d2a14e03 100644
+--- a/gio/tests/gdbus-subscribe.c
++++ b/gio/tests/gdbus-subscribe.c
+@@ -7,6 +7,9 @@
+ 
+ #include "gdbus-tests.h"
+ 
++/* From the D-Bus Specification */
++#define DBUS_REQUEST_NAME_REPLY_PRIMARY_OWNER 1
++
+ #define DBUS_SERVICE_DBUS "org.freedesktop.DBus"
+ #define DBUS_PATH_DBUS "/org/freedesktop/DBus"
+ #define DBUS_INTERFACE_DBUS DBUS_SERVICE_DBUS
+@@ -22,6 +25,9 @@
+ #define EXAMPLE_INTERFACE "org.gtk.GDBus.ExampleInterface"
+ #define FOO_SIGNAL "Foo"
+ 
++#define ALREADY_OWNED_NAME "org.gtk.Test.AlreadyOwned"
++#define OWNED_LATER_NAME "org.gtk.Test.OwnedLater"
++
+ /* Log @s in a debug message. */
+ static inline const char *
+ nonnull (const char *s,
+@@ -101,7 +107,8 @@ typedef struct
+ 
+ typedef struct
+ {
+-  TestConn sender;
++  const char *string_sender;
++  TestConn unique_sender;
+   const char *path;
+   const char *iface;
+   const char *member;
+@@ -109,11 +116,18 @@ typedef struct
+   GDBusSignalFlags flags;
+ } TestSubscribe;
+ 
++typedef struct
++{
++  const char *name;
++  TestConn owner;
++} TestOwnName;
++
+ typedef enum
+ {
+   TEST_ACTION_NONE = 0,
+   TEST_ACTION_SUBSCRIBE,
+   TEST_ACTION_EMIT_SIGNAL,
++  TEST_ACTION_OWN_NAME,
+ } TestAction;
+ 
+ typedef struct
+@@ -122,6 +136,7 @@ typedef struct
+   union {
+     TestEmitSignal signal;
+     TestSubscribe subscribe;
++    TestOwnName own_name;
+   } u;
+ } TestStep;
+ 
+@@ -247,7 +262,7 @@ static const TestPlan plan_match_twice =
+     {
+       .action = TEST_ACTION_SUBSCRIBE,
+       .u.subscribe = {
+-        .sender = TEST_CONN_SERVICE,
++        .unique_sender = TEST_CONN_SERVICE,
+         .path = EXAMPLE_PATH,
+         .iface = EXAMPLE_INTERFACE,
+       },
+@@ -267,7 +282,7 @@ static const TestPlan plan_match_twice =
+     {
+       .action = TEST_ACTION_SUBSCRIBE,
+       .u.subscribe = {
+-        .sender = TEST_CONN_SERVICE,
++        .unique_sender = TEST_CONN_SERVICE,
+         .path = EXAMPLE_PATH,
+         .iface = EXAMPLE_INTERFACE,
+       },
+@@ -296,7 +311,7 @@ static const TestPlan plan_limit_by_unique_name =
+       /* Subscriber wants to receive signals from service */
+       .action = TEST_ACTION_SUBSCRIBE,
+       .u.subscribe = {
+-        .sender = TEST_CONN_SERVICE,
++        .unique_sender = TEST_CONN_SERVICE,
+         .path = EXAMPLE_PATH,
+         .iface = EXAMPLE_INTERFACE,
+       },
+@@ -343,6 +358,62 @@ static const TestPlan plan_limit_by_unique_name =
+   },
+ };
+ 
++static const TestPlan plan_limit_by_well_known_name =
++{
++  .description = "A subscription via a well-known name only accepts messages "
++                 "sent by the owner of that well-known name",
++  .steps = {
++    {
++      /* Service already owns one name */
++      .action = TEST_ACTION_OWN_NAME,
++      .u.own_name = {
++        .name = ALREADY_OWNED_NAME,
++        .owner = TEST_CONN_SERVICE
++      },
++    },
++    {
++      /* Subscriber wants to receive signals from service */
++      .action = TEST_ACTION_SUBSCRIBE,
++      .u.subscribe = {
++        .string_sender = ALREADY_OWNED_NAME,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++      },
++    },
++    {
++      /* Subscriber wants to receive signals from service by another name */
++      .action = TEST_ACTION_SUBSCRIBE,
++      .u.subscribe = {
++        .string_sender = OWNED_LATER_NAME,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++      },
++    },
++    {
++      /* Service claims another name */
++      .action = TEST_ACTION_OWN_NAME,
++      .u.own_name = {
++        .name = OWNED_LATER_NAME,
++        .owner = TEST_CONN_SERVICE
++      },
++    },
++    {
++      /* Now the subscriber gets this signal twice, once for each
++       * subscription; and similarly each of the two proxies gets this
++       * signal twice */
++      .action = TEST_ACTION_EMIT_SIGNAL,
++      .u.signal = {
++        .sender = TEST_CONN_SERVICE,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++        .member = FOO_SIGNAL,
++        .received_by_conn = 2,
++        .received_by_proxy = 2
++      },
++    },
++  },
++};
++
+ typedef struct
+ {
+   const TestPlan *plan;
+@@ -540,11 +611,16 @@ fixture_subscribe (Fixture             *f,
+   GDBusConnection *subscriber = f->conns[TEST_CONN_SUBSCRIBER];
+   const char *sender;
+ 
+-  if (subscribe->sender != TEST_CONN_NONE)
++  if (subscribe->string_sender != NULL)
+     {
+-      sender = f->unique_names[subscribe->sender];
++      sender = subscribe->string_sender;
++      g_test_message ("\tSender: %s", sender);
++    }
++  else if (subscribe->unique_sender != TEST_CONN_NONE)
++    {
++      sender = f->unique_names[subscribe->unique_sender];
+       g_test_message ("\tSender: %s %s",
+-                      test_conn_descriptions[subscribe->sender],
++                      test_conn_descriptions[subscribe->unique_sender],
+                       sender);
+     }
+   else
+@@ -689,6 +765,43 @@ fixture_emit_signal (Fixture              *f,
+   connection_wait_for_bus (f->conns[signal->sender]);
+ }
+ 
++static void
++fixture_own_name (Fixture *f,
++                  const TestOwnName *own_name)
++{
++  GVariant *call_result;
++  guint32 flags;
++  guint32 result_code;
++
++  g_test_message ("\tName: %s", own_name->name);
++  g_test_message ("\tOwner: %s",
++                  test_conn_descriptions[own_name->owner]);
++
++  /* For simplicity, we do this via a direct bus call rather than
++   * using g_bus_own_name_on_connection(). The flags in
++   * GBusNameOwnerFlags are numerically equal to those in the
++   * D-Bus wire protocol. */
++  flags = G_BUS_NAME_OWNER_FLAGS_DO_NOT_QUEUE;
++  call_result = g_dbus_connection_call_sync (f->conns[own_name->owner],
++                                             DBUS_SERVICE_DBUS,
++                                             DBUS_PATH_DBUS,
++                                             DBUS_INTERFACE_DBUS,
++                                             "RequestName",
++                                             g_variant_new ("(su)",
++                                                           own_name->name,
++                                                           flags),
++                                             G_VARIANT_TYPE ("(u)"),
++                                             G_DBUS_CALL_FLAGS_NONE,
++                                             -1,
++                                             NULL,
++                                             &f->error);
++  g_assert_no_error (f->error);
++  g_assert_nonnull (call_result);
++  g_variant_get (call_result, "(u)", &result_code);
++  g_assert_cmpuint (result_code, ==, DBUS_REQUEST_NAME_REPLY_PRIMARY_OWNER);
++  g_variant_unref (call_result);
++}
++
+ static void
+ fixture_run_plan (Fixture          *f,
+                   const TestPlan   *plan,
+@@ -721,6 +834,11 @@ fixture_run_plan (Fixture          *f,
+             fixture_emit_signal (f, &step->u.signal, i);
+             break;
+ 
++          case TEST_ACTION_OWN_NAME:
++            g_test_message ("Step %u: claiming bus name", i);
++            fixture_own_name (f, &step->u.own_name);
++            break;
++
+           case TEST_ACTION_NONE:
+             /* Padding to fill the rest of the array, do nothing */
+             break;
+@@ -933,6 +1051,7 @@ main (int   argc,
+   ADD_SUBSCRIBE_TEST (broadcast_from_anyone);
+   ADD_SUBSCRIBE_TEST (match_twice);
+   ADD_SUBSCRIBE_TEST (limit_by_unique_name);
++  ADD_SUBSCRIBE_TEST (limit_by_well_known_name);
+ 
+   return g_test_run();
+ }
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_05.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_05.patch
new file mode 100644
index 0000000000..7d929b579a
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_05.patch
@@ -0,0 +1,88 @@
+From 4d4c40e858cb71a229b19f89196e6e02e235eb5b Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Fri, 8 Mar 2024 19:44:03 +0000
+Subject: [PATCH 05/18] tests: Add a test-case for what happens if a unique
+ name doesn't exist
+
+On GNOME/glib#3268 there was some concern about whether this would
+allow an attacker to send signals and have them be matched to a
+GDBusProxy in this situation, but it seems that was a false alarm.
+
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+CVE: CVE-2024-34397
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/4d4c40e858cb71a229b19f89196e6e02e235eb5b]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/tests/gdbus-subscribe.c | 48 +++++++++++++++++++++++++++++++++++++
+ 1 file changed, 48 insertions(+)
+
+diff --git a/gio/tests/gdbus-subscribe.c b/gio/tests/gdbus-subscribe.c
+index 3d2a14e03..350ec9f52 100644
+--- a/gio/tests/gdbus-subscribe.c
++++ b/gio/tests/gdbus-subscribe.c
+@@ -358,6 +358,53 @@ static const TestPlan plan_limit_by_unique_name =
+   },
+ };
+ 
++static const TestPlan plan_nonexistent_unique_name =
++{
++  .description = "A subscription via a unique name that doesn't exist "
++                 "accepts no messages",
++  .steps = {
++    {
++      /* Subscriber wants to receive signals from service */
++      .action = TEST_ACTION_SUBSCRIBE,
++      .u.subscribe = {
++        /* This relies on the implementation detail that the dbus-daemon
++         * (and presumably other bus implementations) never actually generates
++         * a unique name in this format */
++        .string_sender = ":0.this.had.better.not.exist",
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++      },
++    },
++    {
++      /* Attacker wants to trick subscriber into thinking that service
++       * sent a signal */
++      .action = TEST_ACTION_EMIT_SIGNAL,
++      .u.signal = {
++        .sender = TEST_CONN_ATTACKER,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++        .member = FOO_SIGNAL,
++        .received_by_conn = 0,
++        .received_by_proxy = 0
++      },
++    },
++    {
++      /* Attacker tries harder, by sending a signal unicast directly to
++       * the subscriber */
++      .action = TEST_ACTION_EMIT_SIGNAL,
++      .u.signal = {
++        .sender = TEST_CONN_ATTACKER,
++        .unicast_to = TEST_CONN_SUBSCRIBER,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++        .member = FOO_SIGNAL,
++        .received_by_conn = 0,
++        .received_by_proxy = 0
++      },
++    },
++  },
++};
++
+ static const TestPlan plan_limit_by_well_known_name =
+ {
+   .description = "A subscription via a well-known name only accepts messages "
+@@ -1051,6 +1098,7 @@ main (int   argc,
+   ADD_SUBSCRIBE_TEST (broadcast_from_anyone);
+   ADD_SUBSCRIBE_TEST (match_twice);
+   ADD_SUBSCRIBE_TEST (limit_by_unique_name);
++  ADD_SUBSCRIBE_TEST (nonexistent_unique_name);
+   ADD_SUBSCRIBE_TEST (limit_by_well_known_name);
+ 
+   return g_test_run();
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_06.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_06.patch
new file mode 100644
index 0000000000..ec79bda045
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_06.patch
@@ -0,0 +1,263 @@
+From 4d8106ba534c7f3c2037cca4c654fd13ce0b93d9 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Fri, 8 Mar 2024 20:10:29 +0000
+Subject: [PATCH 06/18] tests: Add test coverage for signals that match the
+ message bus's name
+
+This is a special case of unique names, even though it's syntactically
+a well-known name.
+
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+CVE: CVE-2024-34397
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/4d8106ba534c7f3c2037cca4c654fd13ce0b93d9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/tests/gdbus-subscribe.c | 161 ++++++++++++++++++++++++++++++++++--
+ 1 file changed, 154 insertions(+), 7 deletions(-)
+
+diff --git a/gio/tests/gdbus-subscribe.c b/gio/tests/gdbus-subscribe.c
+index 350ec9f52..af100de7d 100644
+--- a/gio/tests/gdbus-subscribe.c
++++ b/gio/tests/gdbus-subscribe.c
+@@ -13,6 +13,7 @@
+ #define DBUS_SERVICE_DBUS "org.freedesktop.DBus"
+ #define DBUS_PATH_DBUS "/org/freedesktop/DBus"
+ #define DBUS_INTERFACE_DBUS DBUS_SERVICE_DBUS
++#define NAME_OWNER_CHANGED "NameOwnerChanged"
+ 
+ /* A signal that each connection emits to indicate that it has finished
+  * emitting other signals */
+@@ -101,6 +102,7 @@ typedef struct
+   const char *iface;
+   const char *member;
+   const char *arg0;
++  const char *args;
+   guint received_by_conn;
+   guint received_by_proxy;
+ } TestEmitSignal;
+@@ -120,6 +122,8 @@ typedef struct
+ {
+   const char *name;
+   TestConn owner;
++  guint received_by_conn;
++  guint received_by_proxy;
+ } TestOwnName;
+ 
+ typedef enum
+@@ -461,6 +465,63 @@ static const TestPlan plan_limit_by_well_known_name =
+   },
+ };
+ 
++static const TestPlan plan_limit_to_message_bus =
++{
++  .description = "A subscription to the message bus only accepts messages "
++                 "from the message bus",
++  .steps = {
++    {
++      /* Subscriber wants to receive signals from the message bus itself */
++      .action = TEST_ACTION_SUBSCRIBE,
++      .u.subscribe = {
++        .string_sender = DBUS_SERVICE_DBUS,
++        .path = DBUS_PATH_DBUS,
++        .iface = DBUS_INTERFACE_DBUS,
++      },
++    },
++    {
++      /* Attacker wants to trick subscriber into thinking that the message
++       * bus sent a signal */
++      .action = TEST_ACTION_EMIT_SIGNAL,
++      .u.signal = {
++        .sender = TEST_CONN_ATTACKER,
++        .path = DBUS_PATH_DBUS,
++        .iface = DBUS_INTERFACE_DBUS,
++        .member = NAME_OWNER_CHANGED,
++        .arg0 = "would I lie to you?",
++        .received_by_conn = 0,
++        .received_by_proxy = 0
++      },
++    },
++    {
++      /* Attacker tries harder, by sending a signal unicast directly to
++       * the subscriber, and using more realistic arguments */
++      .action = TEST_ACTION_EMIT_SIGNAL,
++      .u.signal = {
++        .unicast_to = TEST_CONN_SUBSCRIBER,
++        .sender = TEST_CONN_ATTACKER,
++        .path = DBUS_PATH_DBUS,
++        .iface = DBUS_INTERFACE_DBUS,
++        .member = NAME_OWNER_CHANGED,
++        .args = "('com.example.Name', '', ':1.12')",
++        .received_by_conn = 0,
++        .received_by_proxy = 0
++      },
++    },
++    {
++      /* When the message bus sends a signal (in this case triggered by
++       * owning a name), it should still get through */
++      .action = TEST_ACTION_OWN_NAME,
++      .u.own_name = {
++        .name = OWNED_LATER_NAME,
++        .owner = TEST_CONN_SERVICE,
++        .received_by_conn = 1,
++        .received_by_proxy = 1
++      },
++    },
++  },
++};
++
+ typedef struct
+ {
+   const TestPlan *plan;
+@@ -591,7 +652,18 @@ fixture_received_signal (Fixture    *f,
+         }
+     }
+ 
+-  g_assert_cmpint (received->sender, !=, TEST_CONN_NONE);
++  if (g_str_equal (sender_name, DBUS_SERVICE_DBUS))
++    {
++      g_test_message ("Signal received from message bus %s",
++                      sender_name);
++    }
++  else
++    {
++      g_test_message ("Signal received from %s %s",
++                      test_conn_descriptions[received->sender],
++                      sender_name);
++      g_assert_cmpint (received->sender, !=, TEST_CONN_NONE);
++    }
+ 
+   g_test_message ("Signal received from %s %s via %s",
+                   test_conn_descriptions[received->sender],
+@@ -607,13 +679,56 @@ fixture_received_signal (Fixture    *f,
+       g_test_message ("\tString argument 0: %s", received->arg0);
+       g_test_message ("\tSent in step: %u", received->step);
+     }
+-  else
++  else if (g_variant_is_of_type (parameters, G_VARIANT_TYPE ("(uu)")))
+     {
+-      g_assert_cmpstr (g_variant_get_type_string (parameters), ==, "(uu)");
+       g_variant_get (parameters, "(uu)", NULL, &received->step);
+       g_test_message ("\tArgument 0: (not a string)");
+       g_test_message ("\tSent in step: %u", received->step);
+     }
++  else if (g_variant_is_of_type (parameters, G_VARIANT_TYPE ("(sss)")))
++    {
++      const char *name;
++      const char *old_owner;
++      const char *new_owner;
++
++      /* The only signal of this signature that we legitimately receive
++       * during this test is NameOwnerChanged, so just assert that it
++       * is from the message bus and can be matched to a plausible step.
++       * (This is less thorough than the above, and will not work if we
++       * add a test scenario where a name's ownership is repeatedly
++       * changed while watching NameOwnerChanged - so don't do that.) */
++      g_assert_cmpstr (sender_name, ==, DBUS_SERVICE_DBUS);
++      g_assert_cmpstr (path, ==, DBUS_PATH_DBUS);
++      g_assert_cmpstr (iface, ==, DBUS_INTERFACE_DBUS);
++      g_assert_cmpstr (member, ==, NAME_OWNER_CHANGED);
++
++      g_variant_get (parameters, "(&s&s&s)", &name, &old_owner, &new_owner);
++
++      for (i = 0; i < G_N_ELEMENTS (f->plan->steps); i++)
++        {
++          const TestStep *step = &f->plan->steps[i];
++
++          if (step->action == TEST_ACTION_OWN_NAME)
++            {
++              const TestOwnName *own_name = &step->u.own_name;
++
++              if (g_str_equal (name, own_name->name)
++                  && g_str_equal (new_owner, f->unique_names[own_name->owner])
++                  && own_name->received_by_conn > 0)
++                {
++                  received->step = i;
++                  break;
++                }
++            }
++
++          if (i >= G_N_ELEMENTS (f->plan->steps))
++            g_error ("Could not match message to a test step");
++        }
++    }
++  else
++    {
++      g_error ("Unexpected message received");
++    }
+ 
+   g_ptr_array_add (f->received, g_steal_pointer (&received));
+ }
+@@ -782,10 +897,15 @@ fixture_emit_signal (Fixture              *f,
+    * Otherwise put something that will not match any arg0.
+    * Either way, put the sequence number in argument 1 so we can
+    * correlate sent messages with received messages later. */
+-  if (signal->arg0 != NULL)
++  if (signal->args != NULL)
+     {
+-      g_test_message ("\tString argument 0: %s", signal->arg0);
+       /* floating */
++      body = g_variant_new_parsed (signal->args);
++      g_assert_nonnull (body);
++    }
++  else if (signal->arg0 != NULL)
++    {
++      g_test_message ("\tString argument 0: %s", signal->arg0);
+       body = g_variant_new ("(su)", signal->arg0, (guint32) step_number);
+     }
+   else
+@@ -933,8 +1053,6 @@ fixture_run_plan (Fixture          *f,
+ 
+       g_assert_cmpuint (received->step, <, G_N_ELEMENTS (f->received_by_conn));
+       g_assert_cmpuint (received->step, <, G_N_ELEMENTS (f->received_by_proxy));
+-      g_assert_cmpint (plan->steps[received->step].action,
+-                       ==, TEST_ACTION_EMIT_SIGNAL);
+ 
+       if (received->received_by_proxy != NULL)
+         f->received_by_proxy[received->step] += 1;
+@@ -974,6 +1092,34 @@ fixture_run_plan (Fixture          *f,
+               g_assert_cmpuint (f->received_by_proxy[i], ==, 0);
+             }
+         }
++      else if (step->action == TEST_ACTION_OWN_NAME)
++        {
++          const TestOwnName *own_name = &plan->steps[i].u.own_name;
++
++          if (mode != SUBSCRIPTION_MODE_PROXY)
++            {
++              g_test_message ("NameOwnerChanged from step %u was received %u "
++                              "times by GDBusConnection, expected %u",
++                              i, f->received_by_conn[i], own_name->received_by_conn);
++              g_assert_cmpuint (f->received_by_conn[i], ==, own_name->received_by_conn);
++            }
++          else
++            {
++              g_assert_cmpuint (f->received_by_conn[i], ==, 0);
++            }
++
++          if (mode != SUBSCRIPTION_MODE_CONN)
++            {
++              g_test_message ("NameOwnerChanged from step %u was received %u "
++                              "times by GDBusProxy, expected %u",
++                              i, f->received_by_proxy[i], own_name->received_by_proxy);
++              g_assert_cmpuint (f->received_by_proxy[i], ==, own_name->received_by_proxy);
++            }
++          else
++            {
++              g_assert_cmpuint (f->received_by_proxy[i], ==, 0);
++            }
++        }
+     }
+ }
+ 
+@@ -1100,6 +1246,7 @@ main (int   argc,
+   ADD_SUBSCRIBE_TEST (limit_by_unique_name);
+   ADD_SUBSCRIBE_TEST (nonexistent_unique_name);
+   ADD_SUBSCRIBE_TEST (limit_by_well_known_name);
++  ADD_SUBSCRIBE_TEST (limit_to_message_bus);
+ 
+   return g_test_run();
+ }
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_07.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_07.patch
new file mode 100644
index 0000000000..f19846761a
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_07.patch
@@ -0,0 +1,45 @@
+From 5057b6a0e488af6495146cfe96e93eb5e7beb66b Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Thu, 14 Mar 2024 19:18:15 +0000
+Subject: [PATCH 07/18] gdbusprivate: Add symbolic constants for the message
+ bus itself
+
+Using these is a bit more clearly correct than repeating them everywhere.
+To avoid excessive diffstat in a branch for a bug fix, I'm not
+immediately replacing all existing occurrences of the same literals with
+these names.
+
+The names of these constants are chosen to be consistent with libdbus,
+despite using somewhat outdated terminology (D-Bus now uses the term
+"well-known bus name" for what used to be called a service name,
+reserving the word "service" to mean specifically the programs that
+have .service files and participate in service activation).
+
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+CVE: CVE-2024-34397
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/5057b6a0e488af6495146cfe96e93eb5e7beb66b]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/gdbusprivate.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/gio/gdbusprivate.h b/gio/gdbusprivate.h
+index 72d2c32a9..ac737bd7a 100644
+--- a/gio/gdbusprivate.h
++++ b/gio/gdbusprivate.h
+@@ -29,6 +29,11 @@
+ 
+ G_BEGIN_DECLS
+ 
++/* Bus name, interface and object path of the message bus itself */
++#define DBUS_SERVICE_DBUS "org.freedesktop.DBus"
++#define DBUS_INTERFACE_DBUS DBUS_SERVICE_DBUS
++#define DBUS_PATH_DBUS "/org/freedesktop/DBus"
++
+ /* ---------------------------------------------------------------------------------------------------- */
+ 
+ typedef struct GDBusWorker GDBusWorker;
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_08.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_08.patch
new file mode 100644
index 0000000000..cd367478ff
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_08.patch
@@ -0,0 +1,168 @@
+From 467ff27a5a08c21705e20da70a988a55b9f15513 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Thu, 14 Mar 2024 19:24:24 +0000
+Subject: [PATCH 08/18] gdbusconnection: Move SignalData, SignalSubscriber
+ higher up
+
+Subsequent changes will need to access these data structures from
+on_worker_message_received(). No functional change here, only moving
+code around.
+
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+CVE: CVE-2024-34397
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/467ff27a5a08c21705e20da70a988a55b9f15513]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/gdbusconnection.c | 128 +++++++++++++++++++++---------------------
+ 1 file changed, 65 insertions(+), 63 deletions(-)
+
+diff --git a/gio/gdbusconnection.c b/gio/gdbusconnection.c
+index 82a68437b..4f31e8502 100644
+--- a/gio/gdbusconnection.c
++++ b/gio/gdbusconnection.c
+@@ -283,6 +283,71 @@ call_destroy_notify (GMainContext  *context,
+ 
+ /* ---------------------------------------------------------------------------------------------------- */
+ 
++typedef struct
++{
++  /* All fields are immutable after construction. */
++  gatomicrefcount ref_count;
++  GDBusSignalCallback callback;
++  gpointer user_data;
++  GDestroyNotify user_data_free_func;
++  guint id;
++  GMainContext *context;
++} SignalSubscriber;
++
++static SignalSubscriber *
++signal_subscriber_ref (SignalSubscriber *subscriber)
++{
++  g_atomic_ref_count_inc (&subscriber->ref_count);
++  return subscriber;
++}
++
++static void
++signal_subscriber_unref (SignalSubscriber *subscriber)
++{
++  if (g_atomic_ref_count_dec (&subscriber->ref_count))
++    {
++      /* Destroy the user data. It doesn’t matter which thread
++       * signal_subscriber_unref() is called in (or whether it’s called with a
++       * lock held), as call_destroy_notify() always defers to the next
++       * #GMainContext iteration. */
++      call_destroy_notify (subscriber->context,
++                           subscriber->user_data_free_func,
++                           subscriber->user_data);
++
++      g_main_context_unref (subscriber->context);
++      g_free (subscriber);
++    }
++}
++
++typedef struct
++{
++  gchar *rule;
++  gchar *sender;
++  gchar *sender_unique_name; /* if sender is unique or org.freedesktop.DBus, then that name... otherwise blank */
++  gchar *interface_name;
++  gchar *member;
++  gchar *object_path;
++  gchar *arg0;
++  GDBusSignalFlags flags;
++  GPtrArray *subscribers;  /* (owned) (element-type SignalSubscriber) */
++} SignalData;
++
++static void
++signal_data_free (SignalData *signal_data)
++{
++  g_free (signal_data->rule);
++  g_free (signal_data->sender);
++  g_free (signal_data->sender_unique_name);
++  g_free (signal_data->interface_name);
++  g_free (signal_data->member);
++  g_free (signal_data->object_path);
++  g_free (signal_data->arg0);
++  g_ptr_array_unref (signal_data->subscribers);
++  g_free (signal_data);
++}
++
++/* ---------------------------------------------------------------------------------------------------- */
++
+ #ifdef G_OS_WIN32
+ #define CONNECTION_ENSURE_LOCK(obj) do { ; } while (FALSE)
+ #else
+@@ -3238,69 +3303,6 @@ g_dbus_connection_remove_filter (GDBusConnection *connection,
+ 
+ /* ---------------------------------------------------------------------------------------------------- */
+ 
+-typedef struct
+-{
+-  gchar *rule;
+-  gchar *sender;
+-  gchar *sender_unique_name; /* if sender is unique or org.freedesktop.DBus, then that name... otherwise blank */
+-  gchar *interface_name;
+-  gchar *member;
+-  gchar *object_path;
+-  gchar *arg0;
+-  GDBusSignalFlags flags;
+-  GPtrArray *subscribers;  /* (owned) (element-type SignalSubscriber) */
+-} SignalData;
+-
+-static void
+-signal_data_free (SignalData *signal_data)
+-{
+-  g_free (signal_data->rule);
+-  g_free (signal_data->sender);
+-  g_free (signal_data->sender_unique_name);
+-  g_free (signal_data->interface_name);
+-  g_free (signal_data->member);
+-  g_free (signal_data->object_path);
+-  g_free (signal_data->arg0);
+-  g_ptr_array_unref (signal_data->subscribers);
+-  g_free (signal_data);
+-}
+-
+-typedef struct
+-{
+-  /* All fields are immutable after construction. */
+-  gatomicrefcount ref_count;
+-  GDBusSignalCallback callback;
+-  gpointer user_data;
+-  GDestroyNotify user_data_free_func;
+-  guint id;
+-  GMainContext *context;
+-} SignalSubscriber;
+-
+-static SignalSubscriber *
+-signal_subscriber_ref (SignalSubscriber *subscriber)
+-{
+-  g_atomic_ref_count_inc (&subscriber->ref_count);
+-  return subscriber;
+-}
+-
+-static void
+-signal_subscriber_unref (SignalSubscriber *subscriber)
+-{
+-  if (g_atomic_ref_count_dec (&subscriber->ref_count))
+-    {
+-      /* Destroy the user data. It doesn’t matter which thread
+-       * signal_subscriber_unref() is called in (or whether it’s called with a
+-       * lock held), as call_destroy_notify() always defers to the next
+-       * #GMainContext iteration. */
+-      call_destroy_notify (subscriber->context,
+-                           subscriber->user_data_free_func,
+-                           subscriber->user_data);
+-
+-      g_main_context_unref (subscriber->context);
+-      g_free (subscriber);
+-    }
+-}
+-
+ static gchar *
+ args_to_rule (const gchar      *sender,
+               const gchar      *interface_name,
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_09.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_09.patch
new file mode 100644
index 0000000000..581aa04983
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_09.patch
@@ -0,0 +1,81 @@
+From f75e2d73645598e5f3aa064adfece95da435525f Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Thu, 14 Mar 2024 19:30:12 +0000
+Subject: [PATCH 09/18] gdbusconnection: Factor out signal_data_new_take()
+
+No functional changes, except that the implicit ownership-transfer
+for the rule field becomes explicit (the local variable is set to NULL
+afterwards).
+
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+CVE: CVE-2024-34397
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/f75e2d73645598e5f3aa064adfece95da435525f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/gdbusconnection.c | 42 ++++++++++++++++++++++++++++++++----------
+ 1 file changed, 32 insertions(+), 10 deletions(-)
+
+diff --git a/gio/gdbusconnection.c b/gio/gdbusconnection.c
+index 4f31e8502..b8fd920d9 100644
+--- a/gio/gdbusconnection.c
++++ b/gio/gdbusconnection.c
+@@ -332,6 +332,30 @@ typedef struct
+   GPtrArray *subscribers;  /* (owned) (element-type SignalSubscriber) */
+ } SignalData;
+ 
++static SignalData *
++signal_data_new_take (gchar *rule,
++                      gchar *sender,
++                      gchar *sender_unique_name,
++                      gchar *interface_name,
++                      gchar *member,
++                      gchar *object_path,
++                      gchar *arg0,
++                      GDBusSignalFlags flags)
++{
++  SignalData *signal_data = g_new0 (SignalData, 1);
++
++  signal_data->rule = rule;
++  signal_data->sender = sender;
++  signal_data->sender_unique_name = sender_unique_name;
++  signal_data->interface_name = interface_name;
++  signal_data->member = member;
++  signal_data->object_path = object_path;
++  signal_data->arg0 = arg0;
++  signal_data->flags = flags;
++  signal_data->subscribers = g_ptr_array_new_with_free_func ((GDestroyNotify) signal_subscriber_unref);
++  return g_steal_pointer (&signal_data);
++}
++
+ static void
+ signal_data_free (SignalData *signal_data)
+ {
+@@ -3569,16 +3593,14 @@ g_dbus_connection_signal_subscribe (GDBusConnection     *connection,
+       goto out;
+     }
+ 
+-  signal_data = g_new0 (SignalData, 1);
+-  signal_data->rule                  = rule;
+-  signal_data->sender                = g_strdup (sender);
+-  signal_data->sender_unique_name    = g_strdup (sender_unique_name);
+-  signal_data->interface_name        = g_strdup (interface_name);
+-  signal_data->member                = g_strdup (member);
+-  signal_data->object_path           = g_strdup (object_path);
+-  signal_data->arg0                  = g_strdup (arg0);
+-  signal_data->flags                 = flags;
+-  signal_data->subscribers           = g_ptr_array_new_with_free_func ((GDestroyNotify) signal_subscriber_unref);
++  signal_data = signal_data_new_take (g_steal_pointer (&rule),
++                                      g_strdup (sender),
++                                      g_strdup (sender_unique_name),
++                                      g_strdup (interface_name),
++                                      g_strdup (member),
++                                      g_strdup (object_path),
++                                      g_strdup (arg0),
++                                      flags);
+   g_ptr_array_add (signal_data->subscribers, subscriber);
+ 
+   g_hash_table_insert (connection->map_rule_to_signal_data,
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_10.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_10.patch
new file mode 100644
index 0000000000..37b261eccd
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_10.patch
@@ -0,0 +1,108 @@
+From 7f8b44ecdf5bc02e132de4c3242e961f8f27e9f2 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Tue, 23 Apr 2024 20:31:57 +0100
+Subject: [PATCH 10/18] gdbusconnection: Factor out add_signal_data()
+
+No functional changes.
+
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+CVE: CVE-2024-34397
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/7f8b44ecdf5bc02e132de4c3242e961f8f27e9f2]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/gdbusconnection.c | 64 +++++++++++++++++++++++++------------------
+ 1 file changed, 37 insertions(+), 27 deletions(-)
+
+diff --git a/gio/gdbusconnection.c b/gio/gdbusconnection.c
+index b8fd920d9..3b170845c 100644
+--- a/gio/gdbusconnection.c
++++ b/gio/gdbusconnection.c
+@@ -3447,6 +3447,42 @@ is_signal_data_for_name_lost_or_acquired (SignalData *signal_data)
+ 
+ /* ---------------------------------------------------------------------------------------------------- */
+ 
++/* called in any thread, connection lock is held */
++static void
++add_signal_data (GDBusConnection *connection,
++                 SignalData      *signal_data)
++{
++  GPtrArray *signal_data_array;
++
++  g_hash_table_insert (connection->map_rule_to_signal_data,
++                       signal_data->rule,
++                       signal_data);
++
++  /* Add the match rule to the bus...
++   *
++   * Avoid adding match rules for NameLost and NameAcquired messages - the bus will
++   * always send such messages to us.
++   */
++  if (connection->flags & G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION)
++    {
++      if (!is_signal_data_for_name_lost_or_acquired (signal_data))
++        add_match_rule (connection, signal_data->rule);
++    }
++
++  signal_data_array = g_hash_table_lookup (connection->map_sender_unique_name_to_signal_data_array,
++                                           signal_data->sender_unique_name);
++  if (signal_data_array == NULL)
++    {
++      signal_data_array = g_ptr_array_new ();
++      g_hash_table_insert (connection->map_sender_unique_name_to_signal_data_array,
++                           g_strdup (signal_data->sender_unique_name),
++                           signal_data_array);
++    }
++  g_ptr_array_add (signal_data_array, signal_data);
++}
++
++/* ---------------------------------------------------------------------------------------------------- */
++
+ /**
+  * g_dbus_connection_signal_subscribe:
+  * @connection: a #GDBusConnection
+@@ -3536,7 +3572,6 @@ g_dbus_connection_signal_subscribe (GDBusConnection     *connection,
+   gchar *rule;
+   SignalData *signal_data;
+   SignalSubscriber *subscriber;
+-  GPtrArray *signal_data_array;
+   const gchar *sender_unique_name;
+ 
+   /* Right now we abort if AddMatch() fails since it can only fail with the bus being in
+@@ -3602,32 +3637,7 @@ g_dbus_connection_signal_subscribe (GDBusConnection     *connection,
+                                       g_strdup (arg0),
+                                       flags);
+   g_ptr_array_add (signal_data->subscribers, subscriber);
+-
+-  g_hash_table_insert (connection->map_rule_to_signal_data,
+-                       signal_data->rule,
+-                       signal_data);
+-
+-  /* Add the match rule to the bus...
+-   *
+-   * Avoid adding match rules for NameLost and NameAcquired messages - the bus will
+-   * always send such messages to us.
+-   */
+-  if (connection->flags & G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION)
+-    {
+-      if (!is_signal_data_for_name_lost_or_acquired (signal_data))
+-        add_match_rule (connection, signal_data->rule);
+-    }
+-
+-  signal_data_array = g_hash_table_lookup (connection->map_sender_unique_name_to_signal_data_array,
+-                                           signal_data->sender_unique_name);
+-  if (signal_data_array == NULL)
+-    {
+-      signal_data_array = g_ptr_array_new ();
+-      g_hash_table_insert (connection->map_sender_unique_name_to_signal_data_array,
+-                           g_strdup (signal_data->sender_unique_name),
+-                           signal_data_array);
+-    }
+-  g_ptr_array_add (signal_data_array, signal_data);
++  add_signal_data (connection, signal_data);
+ 
+  out:
+   g_hash_table_insert (connection->map_id_to_signal_data,
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_11.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_11.patch
new file mode 100644
index 0000000000..aa5c3ceaf5
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_11.patch
@@ -0,0 +1,133 @@
+From 1704bc6a70c0dcdc5555f23ebab8e3e7ed697998 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Thu, 14 Mar 2024 19:51:59 +0000
+Subject: [PATCH 11/18] gdbusconnection: Factor out
+ remove_signal_data_if_unused
+
+No functional change, just removing some nesting. The check for whether
+signal_data->subscribers is empty changes from a conditional that tests
+whether it is into an early-return if it isn't.
+
+A subsequent commit will add additional conditions that make us consider
+a SignalData to be still in use and therefore not eligible to be removed.
+
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+CVE: CVE-2024-34397
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/1704bc6a70c0dcdc5555f23ebab8e3e7ed697998]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/gdbusconnection.c | 83 +++++++++++++++++++++++++------------------
+ 1 file changed, 48 insertions(+), 35 deletions(-)
+
+diff --git a/gio/gdbusconnection.c b/gio/gdbusconnection.c
+index 3b170845c..114cdde29 100644
+--- a/gio/gdbusconnection.c
++++ b/gio/gdbusconnection.c
+@@ -3651,6 +3651,52 @@ g_dbus_connection_signal_subscribe (GDBusConnection     *connection,
+ 
+ /* ---------------------------------------------------------------------------------------------------- */
+ 
++/*
++ * Called in any thread.
++ * Must hold the connection lock when calling this, unless
++ * connection->finalizing is TRUE.
++ * May free signal_data, so do not dereference it after this.
++ */
++static void
++remove_signal_data_if_unused (GDBusConnection *connection,
++                              SignalData *signal_data)
++{
++  GPtrArray *signal_data_array;
++
++  if (signal_data->subscribers->len != 0)
++    return;
++
++  g_warn_if_fail (g_hash_table_remove (connection->map_rule_to_signal_data, signal_data->rule));
++
++  signal_data_array = g_hash_table_lookup (connection->map_sender_unique_name_to_signal_data_array,
++                                           signal_data->sender_unique_name);
++  g_warn_if_fail (signal_data_array != NULL);
++  g_warn_if_fail (g_ptr_array_remove (signal_data_array, signal_data));
++
++  if (signal_data_array->len == 0)
++    {
++      g_warn_if_fail (g_hash_table_remove (connection->map_sender_unique_name_to_signal_data_array,
++                                           signal_data->sender_unique_name));
++    }
++
++  /* remove the match rule from the bus unless NameLost or NameAcquired (see subscribe()) */
++  if ((connection->flags & G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION) &&
++      !is_signal_data_for_name_lost_or_acquired (signal_data) &&
++      !g_dbus_connection_is_closed (connection) &&
++      !connection->finalizing)
++    {
++      /* The check for g_dbus_connection_is_closed() means that
++       * sending the RemoveMatch message can't fail with
++       * G_IO_ERROR_CLOSED, because we're holding the lock,
++       * so on_worker_closed() can't happen between the check we just
++       * did, and releasing the lock later.
++       */
++      remove_match_rule (connection, signal_data->rule);
++    }
++
++  signal_data_free (signal_data);
++}
++
+ /* called in any thread */
+ /* must hold lock when calling this (except if connection->finalizing is TRUE)
+  * returns the number of removed subscribers */
+@@ -3659,7 +3705,6 @@ unsubscribe_id_internal (GDBusConnection *connection,
+                          guint            subscription_id)
+ {
+   SignalData *signal_data;
+-  GPtrArray *signal_data_array;
+   guint n;
+   guint n_removed = 0;
+ 
+@@ -3686,40 +3731,8 @@ unsubscribe_id_internal (GDBusConnection *connection,
+                                            GUINT_TO_POINTER (subscription_id)));
+       n_removed++;
+       g_ptr_array_remove_index_fast (signal_data->subscribers, n);
+-
+-      if (signal_data->subscribers->len == 0)
+-        {
+-          g_warn_if_fail (g_hash_table_remove (connection->map_rule_to_signal_data, signal_data->rule));
+-
+-          signal_data_array = g_hash_table_lookup (connection->map_sender_unique_name_to_signal_data_array,
+-                                                   signal_data->sender_unique_name);
+-          g_warn_if_fail (signal_data_array != NULL);
+-          g_warn_if_fail (g_ptr_array_remove (signal_data_array, signal_data));
+-
+-          if (signal_data_array->len == 0)
+-            {
+-              g_warn_if_fail (g_hash_table_remove (connection->map_sender_unique_name_to_signal_data_array,
+-                                                   signal_data->sender_unique_name));
+-            }
+-
+-          /* remove the match rule from the bus unless NameLost or NameAcquired (see subscribe()) */
+-          if ((connection->flags & G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION) &&
+-              !is_signal_data_for_name_lost_or_acquired (signal_data) &&
+-              !g_dbus_connection_is_closed (connection) &&
+-              !connection->finalizing)
+-            {
+-              /* The check for g_dbus_connection_is_closed() means that
+-               * sending the RemoveMatch message can't fail with
+-               * G_IO_ERROR_CLOSED, because we're holding the lock,
+-               * so on_worker_closed() can't happen between the check we just
+-               * did, and releasing the lock later.
+-               */
+-              remove_match_rule (connection, signal_data->rule);
+-            }
+-
+-          signal_data_free (signal_data);
+-        }
+-
++      /* May free signal_data */
++      remove_signal_data_if_unused (connection, signal_data);
+       goto out;
+     }
+ 
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_12.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_12.patch
new file mode 100644
index 0000000000..281143554f
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_12.patch
@@ -0,0 +1,173 @@
+From 5377b4d9061b73bb47af85cc99253a18dc58e83e Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Tue, 23 Apr 2024 20:39:05 +0100
+Subject: [PATCH 12/18] gdbusconnection: Stop storing sender_unique_name in
+ SignalData
+
+This will become confusing when we start tracking the owner of a
+well-known-name sender, and it's redundant anyway. Instead, track the
+1 bit of data that we actually need: whether it's a well-known name.
+
+Strictly speaking this too is redundant, because it's syntactically
+derivable from the sender, but only via extra string operations.
+A subsequent commit will add a data structure to keep track of the
+owner of a well-known-name sender, at which point this boolean will
+be replaced by the presence or absence of that data structure.
+
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+CVE: CVE-2024-34397
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/5377b4d9061b73bb47af85cc99253a18dc58e83e]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/gdbusconnection.c | 36 ++++++++++++++++++++++++------------
+ 1 file changed, 24 insertions(+), 12 deletions(-)
+
+diff --git a/gio/gdbusconnection.c b/gio/gdbusconnection.c
+index 114cdde29..8c1d77b62 100644
+--- a/gio/gdbusconnection.c
++++ b/gio/gdbusconnection.c
+@@ -323,19 +323,19 @@ typedef struct
+ {
+   gchar *rule;
+   gchar *sender;
+-  gchar *sender_unique_name; /* if sender is unique or org.freedesktop.DBus, then that name... otherwise blank */
+   gchar *interface_name;
+   gchar *member;
+   gchar *object_path;
+   gchar *arg0;
+   GDBusSignalFlags flags;
+   GPtrArray *subscribers;  /* (owned) (element-type SignalSubscriber) */
++  gboolean sender_is_its_own_owner;
+ } SignalData;
+ 
+ static SignalData *
+ signal_data_new_take (gchar *rule,
+                       gchar *sender,
+-                      gchar *sender_unique_name,
++                      gboolean sender_is_its_own_owner,
+                       gchar *interface_name,
+                       gchar *member,
+                       gchar *object_path,
+@@ -346,7 +346,7 @@ signal_data_new_take (gchar *rule,
+ 
+   signal_data->rule = rule;
+   signal_data->sender = sender;
+-  signal_data->sender_unique_name = sender_unique_name;
++  signal_data->sender_is_its_own_owner = sender_is_its_own_owner;
+   signal_data->interface_name = interface_name;
+   signal_data->member = member;
+   signal_data->object_path = object_path;
+@@ -361,7 +361,6 @@ signal_data_free (SignalData *signal_data)
+ {
+   g_free (signal_data->rule);
+   g_free (signal_data->sender);
+-  g_free (signal_data->sender_unique_name);
+   g_free (signal_data->interface_name);
+   g_free (signal_data->member);
+   g_free (signal_data->object_path);
+@@ -3438,7 +3437,7 @@ remove_match_rule (GDBusConnection *connection,
+ static gboolean
+ is_signal_data_for_name_lost_or_acquired (SignalData *signal_data)
+ {
+-  return g_strcmp0 (signal_data->sender_unique_name, "org.freedesktop.DBus") == 0 &&
++  return g_strcmp0 (signal_data->sender, "org.freedesktop.DBus") == 0 &&
+          g_strcmp0 (signal_data->interface_name, "org.freedesktop.DBus") == 0 &&
+          g_strcmp0 (signal_data->object_path, "/org/freedesktop/DBus") == 0 &&
+          (g_strcmp0 (signal_data->member, "NameLost") == 0 ||
+@@ -3450,7 +3449,8 @@ is_signal_data_for_name_lost_or_acquired (SignalData *signal_data)
+ /* called in any thread, connection lock is held */
+ static void
+ add_signal_data (GDBusConnection *connection,
+-                 SignalData      *signal_data)
++                 SignalData      *signal_data,
++                 const char      *sender_unique_name)
+ {
+   GPtrArray *signal_data_array;
+ 
+@@ -3470,12 +3470,12 @@ add_signal_data (GDBusConnection *connection,
+     }
+ 
+   signal_data_array = g_hash_table_lookup (connection->map_sender_unique_name_to_signal_data_array,
+-                                           signal_data->sender_unique_name);
++                                           sender_unique_name);
+   if (signal_data_array == NULL)
+     {
+       signal_data_array = g_ptr_array_new ();
+       g_hash_table_insert (connection->map_sender_unique_name_to_signal_data_array,
+-                           g_strdup (signal_data->sender_unique_name),
++                           g_strdup (sender_unique_name),
+                            signal_data_array);
+     }
+   g_ptr_array_add (signal_data_array, signal_data);
+@@ -3572,6 +3572,7 @@ g_dbus_connection_signal_subscribe (GDBusConnection     *connection,
+   gchar *rule;
+   SignalData *signal_data;
+   SignalSubscriber *subscriber;
++  gboolean sender_is_its_own_owner;
+   const gchar *sender_unique_name;
+ 
+   /* Right now we abort if AddMatch() fails since it can only fail with the bus being in
+@@ -3607,6 +3608,11 @@ g_dbus_connection_signal_subscribe (GDBusConnection     *connection,
+   rule = args_to_rule (sender, interface_name, member, object_path, arg0, flags);
+ 
+   if (sender != NULL && (g_dbus_is_unique_name (sender) || g_strcmp0 (sender, "org.freedesktop.DBus") == 0))
++    sender_is_its_own_owner = TRUE;
++  else
++    sender_is_its_own_owner = FALSE;
++
++  if (sender_is_its_own_owner)
+     sender_unique_name = sender;
+   else
+     sender_unique_name = "";
+@@ -3630,14 +3636,14 @@ g_dbus_connection_signal_subscribe (GDBusConnection     *connection,
+ 
+   signal_data = signal_data_new_take (g_steal_pointer (&rule),
+                                       g_strdup (sender),
+-                                      g_strdup (sender_unique_name),
++                                      sender_is_its_own_owner,
+                                       g_strdup (interface_name),
+                                       g_strdup (member),
+                                       g_strdup (object_path),
+                                       g_strdup (arg0),
+                                       flags);
+   g_ptr_array_add (signal_data->subscribers, subscriber);
+-  add_signal_data (connection, signal_data);
++  add_signal_data (connection, signal_data, sender_unique_name);
+ 
+  out:
+   g_hash_table_insert (connection->map_id_to_signal_data,
+@@ -3661,22 +3667,28 @@ static void
+ remove_signal_data_if_unused (GDBusConnection *connection,
+                               SignalData *signal_data)
+ {
++  const gchar *sender_unique_name;
+   GPtrArray *signal_data_array;
+ 
+   if (signal_data->subscribers->len != 0)
+     return;
+ 
++  if (signal_data->sender_is_its_own_owner)
++    sender_unique_name = signal_data->sender;
++  else
++    sender_unique_name = "";
++
+   g_warn_if_fail (g_hash_table_remove (connection->map_rule_to_signal_data, signal_data->rule));
+ 
+   signal_data_array = g_hash_table_lookup (connection->map_sender_unique_name_to_signal_data_array,
+-                                           signal_data->sender_unique_name);
++                                           sender_unique_name);
+   g_warn_if_fail (signal_data_array != NULL);
+   g_warn_if_fail (g_ptr_array_remove (signal_data_array, signal_data));
+ 
+   if (signal_data_array->len == 0)
+     {
+       g_warn_if_fail (g_hash_table_remove (connection->map_sender_unique_name_to_signal_data_array,
+-                                           signal_data->sender_unique_name));
++                                           sender_unique_name));
+     }
+ 
+   /* remove the match rule from the bus unless NameLost or NameAcquired (see subscribe()) */
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_13.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_13.patch
new file mode 100644
index 0000000000..aaa7cf8589
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_13.patch
@@ -0,0 +1,513 @@
+From 9114439d886137cfb903e109b612869535aa05b6 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Wed, 1 May 2024 15:43:09 +0100
+Subject: [PATCH 13/18] gdbus: Track name owners for signal subscriptions
+
+We will use this in a subsequent commit to prevent signals from an
+impostor from being delivered to a subscriber.
+
+To avoid message reordering leading to misleading situations, this does
+not use the existing mechanism for watching bus name ownership, which
+delivers the ownership changes to other main-contexts. Instead, it all
+happens on the single thread used by the GDBusWorker, so the order in
+which messages are received is the order in which they are processed.
+
+[Backported to glib-2-74, resolving minor conflicts]
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+CVE: CVE-2024-34397
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/9114439d886137cfb903e109b612869535aa05b6]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/gdbusconnection.c | 350 +++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 343 insertions(+), 7 deletions(-)
+
+diff --git a/gio/gdbusconnection.c b/gio/gdbusconnection.c
+index 8c1d77b62..1ac120bc5 100644
+--- a/gio/gdbusconnection.c
++++ b/gio/gdbusconnection.c
+@@ -320,6 +320,31 @@ signal_subscriber_unref (SignalSubscriber *subscriber)
+ }
+ 
+ typedef struct
++{
++  /*
++   * 1 reference while waiting for GetNameOwner() to finish
++   * 1 reference for each SignalData that points to this one as its
++   *   shared_name_watcher
++   */
++  grefcount ref_count;
++
++  gchar *owner;
++  guint32 get_name_owner_serial;
++} WatchedName;
++
++static WatchedName *
++watched_name_new (void)
++{
++  WatchedName *watched_name = g_new0 (WatchedName, 1);
++
++  g_ref_count_init (&watched_name->ref_count);
++  watched_name->owner = NULL;
++  return g_steal_pointer (&watched_name);
++}
++
++typedef struct SignalData SignalData;
++
++struct SignalData
+ {
+   gchar *rule;
+   gchar *sender;
+@@ -329,13 +354,36 @@ typedef struct
+   gchar *arg0;
+   GDBusSignalFlags flags;
+   GPtrArray *subscribers;  /* (owned) (element-type SignalSubscriber) */
+-  gboolean sender_is_its_own_owner;
+-} SignalData;
++
++  /*
++   * If the sender is a well-known name, this is an unowned SignalData
++   * representing the NameOwnerChanged signal that tracks its owner.
++   * NULL if sender is NULL.
++   * NULL if sender is its own owner (a unique name or DBUS_SERVICE_DBUS).
++   *
++   * Invariants: if not NULL, then
++   * shared_name_watcher->sender == DBUS_SERVICE_DBUS
++   * shared_name_watcher->interface_name == DBUS_INTERFACE_DBUS
++   * shared_name_watcher->member == "NameOwnerChanged"
++   * shared_name_watcher->object_path == DBUS_PATH_DBUS
++   * shared_name_watcher->arg0 == sender
++   * shared_name_watcher->flags == NONE
++   * shared_name_watcher->watched_name == NULL
++   */
++  SignalData *shared_name_watcher;
++
++  /*
++   * Non-NULL if this SignalData is another SignalData's shared_name_watcher.
++   * One reference for each SignalData that has this one as its
++   * shared_name_watcher.
++   * Otherwise NULL.
++   */
++  WatchedName *watched_name;
++};
+ 
+ static SignalData *
+ signal_data_new_take (gchar *rule,
+                       gchar *sender,
+-                      gboolean sender_is_its_own_owner,
+                       gchar *interface_name,
+                       gchar *member,
+                       gchar *object_path,
+@@ -346,7 +394,6 @@ signal_data_new_take (gchar *rule,
+ 
+   signal_data->rule = rule;
+   signal_data->sender = sender;
+-  signal_data->sender_is_its_own_owner = sender_is_its_own_owner;
+   signal_data->interface_name = interface_name;
+   signal_data->member = member;
+   signal_data->object_path = object_path;
+@@ -359,6 +406,17 @@ signal_data_new_take (gchar *rule,
+ static void
+ signal_data_free (SignalData *signal_data)
+ {
++  /* The SignalData should not be freed while it still has subscribers */
++  g_assert (signal_data->subscribers->len == 0);
++
++  /* The SignalData should not be freed while it is watching for
++   * NameOwnerChanged on behalf of another SignalData */
++  g_assert (signal_data->watched_name == NULL);
++
++  /* The SignalData should be detached from its name watcher, if any,
++   * before it is freed */
++  g_assert (signal_data->shared_name_watcher == NULL);
++
+   g_free (signal_data->rule);
+   g_free (signal_data->sender);
+   g_free (signal_data->interface_name);
+@@ -366,6 +424,7 @@ signal_data_free (SignalData *signal_data)
+   g_free (signal_data->object_path);
+   g_free (signal_data->arg0);
+   g_ptr_array_unref (signal_data->subscribers);
++
+   g_free (signal_data);
+ }
+ 
+@@ -497,6 +556,7 @@ struct _GDBusConnection
+ 
+   /* Map used for managing method replies, protected by @lock */
+   GHashTable *map_method_serial_to_task;  /* guint32 -> GTask* */
++  GHashTable *map_method_serial_to_name_watcher;  /* guint32 -> unowned SignalData* */
+ 
+   /* Maps used for managing signal subscription, protected by @lock */
+   GHashTable *map_rule_to_signal_data;                      /* match rule (gchar*)    -> SignalData */
+@@ -745,6 +805,7 @@ g_dbus_connection_finalize (GObject *object)
+     g_error_free (connection->initialization_error);
+ 
+   g_hash_table_unref (connection->map_method_serial_to_task);
++  g_hash_table_unref (connection->map_method_serial_to_name_watcher);
+ 
+   g_hash_table_unref (connection->map_rule_to_signal_data);
+   g_hash_table_unref (connection->map_id_to_signal_data);
+@@ -1149,6 +1210,7 @@ g_dbus_connection_init (GDBusConnection *connection)
+   g_mutex_init (&connection->init_lock);
+ 
+   connection->map_method_serial_to_task = g_hash_table_new (g_direct_hash, g_direct_equal);
++  connection->map_method_serial_to_name_watcher = g_hash_table_new_full (g_direct_hash, g_direct_equal, NULL, NULL);
+ 
+   connection->map_rule_to_signal_data = g_hash_table_new (g_str_hash,
+                                                           g_str_equal);
+@@ -2266,6 +2328,191 @@ g_dbus_connection_send_message_with_reply_sync (GDBusConnection        *connecti
+ 
+ /* ---------------------------------------------------------------------------------------------------- */
+ 
++/*
++ * Called in any thread.
++ * Must hold the connection lock when calling this, unless
++ * connection->finalizing is TRUE.
++ */
++static void
++name_watcher_unref_watched_name (GDBusConnection *connection,
++                                 SignalData *name_watcher)
++{
++  WatchedName *watched_name = name_watcher->watched_name;
++
++  g_assert (watched_name != NULL);
++
++  if (!g_ref_count_dec (&watched_name->ref_count))
++    return;
++
++  /* Removing watched_name from the name_watcher may result in
++   * name_watcher being freed, so we must make sure name_watcher is no
++   * longer in map_method_serial_to_name_watcher.
++   *
++   * If we stop watching the name while our GetNameOwner call was still
++   * in-flight, then when the reply eventually arrives, we will not find
++   * its serial number in the map and harmlessly ignore it as a result. */
++  if (watched_name->get_name_owner_serial != 0)
++    g_hash_table_remove (connection->map_method_serial_to_name_watcher,
++                         GUINT_TO_POINTER (watched_name->get_name_owner_serial));
++
++  name_watcher->watched_name = NULL;
++  g_free (watched_name->owner);
++  g_free (watched_name);
++}
++
++/* called in GDBusWorker thread with lock held */
++static void
++name_watcher_set_name_owner_unlocked (SignalData *name_watcher,
++                                      const char *new_owner)
++{
++  if (new_owner != NULL && new_owner[0] == '\0')
++    new_owner = NULL;
++
++  g_assert (name_watcher->watched_name != NULL);
++  g_set_str (&name_watcher->watched_name->owner, new_owner);
++}
++
++/* called in GDBusWorker thread with lock held */
++static void
++name_watcher_deliver_name_owner_changed_unlocked (SignalData *name_watcher,
++                                                  GDBusMessage *message)
++{
++  GVariant *body;
++
++  body = g_dbus_message_get_body (message);
++
++  if (G_LIKELY (body != NULL && g_variant_is_of_type (body, G_VARIANT_TYPE ("(sss)"))))
++    {
++      const char *name;
++      const char *new_owner;
++
++      g_variant_get (body, "(&s&s&s)", &name, NULL, &new_owner);
++
++      /* Our caller already checked this */
++      g_assert (g_strcmp0 (name_watcher->arg0, name) == 0);
++
++      if (G_LIKELY (new_owner[0] == '\0' || g_dbus_is_unique_name (new_owner)))
++        name_watcher_set_name_owner_unlocked (name_watcher, new_owner);
++      else
++        g_warning ("Received NameOwnerChanged signal with invalid owner \"%s\" for \"%s\"",
++                   new_owner, name);
++    }
++  else
++    {
++      g_warning ("Received NameOwnerChanged signal with unexpected "
++                 "signature %s",
++                 body == NULL ? "()" : g_variant_get_type_string (body));
++
++    }
++}
++
++/* called in GDBusWorker thread with lock held */
++static void
++name_watcher_deliver_get_name_owner_reply_unlocked (SignalData *name_watcher,
++                                                    GDBusConnection *connection,
++                                                    GDBusMessage *message)
++{
++  GDBusMessageType type;
++  GVariant *body;
++  WatchedName *watched_name;
++
++  watched_name = name_watcher->watched_name;
++  g_assert (watched_name != NULL);
++  g_assert (watched_name->get_name_owner_serial != 0);
++
++  type = g_dbus_message_get_message_type (message);
++  body = g_dbus_message_get_body (message);
++
++  if (type == G_DBUS_MESSAGE_TYPE_ERROR)
++    {
++      if (g_strcmp0 (g_dbus_message_get_error_name (message),
++                     "org.freedesktop.DBus.Error.NameHasNoOwner"))
++        name_watcher_set_name_owner_unlocked (name_watcher, NULL);
++      /* else it's something like NoReply or AccessDenied, which tells
++       * us nothing - leave the owner set to whatever we most recently
++       * learned from NameOwnerChanged, or NULL */
++    }
++  else if (type != G_DBUS_MESSAGE_TYPE_METHOD_RETURN)
++    {
++      g_warning ("Received GetNameOwner reply with unexpected type %d",
++                 type);
++    }
++  else if (G_LIKELY (body != NULL && g_variant_is_of_type (body, G_VARIANT_TYPE ("(s)"))))
++    {
++      const char *new_owner;
++
++      g_variant_get (body, "(&s)", &new_owner);
++
++      if (G_LIKELY (g_dbus_is_unique_name (new_owner)))
++        name_watcher_set_name_owner_unlocked (name_watcher, new_owner);
++      else
++        g_warning ("Received GetNameOwner reply with invalid owner \"%s\" for \"%s\"",
++                   new_owner, name_watcher->arg0);
++    }
++  else
++    {
++      g_warning ("Received GetNameOwner reply with unexpected signature %s",
++                 body == NULL ? "()" : g_variant_get_type_string (body));
++    }
++
++  g_hash_table_remove (connection->map_method_serial_to_name_watcher,
++                       GUINT_TO_POINTER (watched_name->get_name_owner_serial));
++  watched_name->get_name_owner_serial = 0;
++}
++
++/* Called in a user thread, lock is held */
++static void
++name_watcher_call_get_name_owner_unlocked (GDBusConnection *connection,
++                                           SignalData *name_watcher)
++{
++  GDBusMessage *message;
++  GError *local_error = NULL;
++  WatchedName *watched_name;
++
++  g_assert (g_strcmp0 (name_watcher->sender, DBUS_SERVICE_DBUS) == 0);
++  g_assert (g_strcmp0 (name_watcher->interface_name, DBUS_INTERFACE_DBUS) == 0);
++  g_assert (g_strcmp0 (name_watcher->member, "NameOwnerChanged") == 0);
++  g_assert (g_strcmp0 (name_watcher->object_path, DBUS_PATH_DBUS) == 0);
++  /* arg0 of the NameOwnerChanged message is the well-known name whose owner
++   * we are interested in */
++  g_assert (g_dbus_is_name (name_watcher->arg0));
++  g_assert (name_watcher->flags == G_DBUS_SIGNAL_FLAGS_NONE);
++
++  watched_name = name_watcher->watched_name;
++  g_assert (watched_name != NULL);
++  g_assert (watched_name->owner == NULL);
++  g_assert (watched_name->get_name_owner_serial == 0);
++  g_assert (name_watcher->shared_name_watcher == NULL);
++
++  message = g_dbus_message_new_method_call (DBUS_SERVICE_DBUS,
++                                            DBUS_PATH_DBUS,
++                                            DBUS_INTERFACE_DBUS,
++                                            "GetNameOwner");
++  g_dbus_message_set_body (message, g_variant_new ("(s)", name_watcher->arg0));
++
++  if (g_dbus_connection_send_message_unlocked (connection, message,
++                                               G_DBUS_SEND_MESSAGE_FLAGS_NONE,
++                                               &watched_name->get_name_owner_serial,
++                                               &local_error))
++    {
++      g_assert (watched_name->get_name_owner_serial != 0);
++      g_hash_table_insert (connection->map_method_serial_to_name_watcher,
++                           GUINT_TO_POINTER (watched_name->get_name_owner_serial),
++                           name_watcher);
++    }
++  else
++    {
++      g_critical ("Error while sending GetNameOwner() message: %s",
++                  local_error->message);
++      g_clear_error (&local_error);
++      g_assert (watched_name->get_name_owner_serial == 0);
++    }
++
++  g_object_unref (message);
++}
++
++/* ---------------------------------------------------------------------------------------------------- */
++
+ typedef struct
+ {
+   guint                       id;
+@@ -2389,6 +2636,7 @@ on_worker_message_received (GDBusWorker  *worker,
+         {
+           guint32 reply_serial;
+           GTask *task;
++          SignalData *name_watcher;
+ 
+           reply_serial = g_dbus_message_get_reply_serial (message);
+           CONNECTION_LOCK (connection);
+@@ -2404,6 +2652,19 @@ on_worker_message_received (GDBusWorker  *worker,
+             {
+               //g_debug ("message reply/error for serial %d but no SendMessageData found for %p", reply_serial, connection);
+             }
++
++          name_watcher = g_hash_table_lookup (connection->map_method_serial_to_name_watcher,
++                                              GUINT_TO_POINTER (reply_serial));
++
++          if (name_watcher != NULL)
++            {
++              g_assert (name_watcher->watched_name != NULL);
++              g_assert (name_watcher->watched_name->get_name_owner_serial == reply_serial);
++              name_watcher_deliver_get_name_owner_reply_unlocked (name_watcher,
++                                                                  connection,
++                                                                  message);
++            }
++
+           CONNECTION_UNLOCK (connection);
+         }
+       else if (message_type == G_DBUS_MESSAGE_TYPE_SIGNAL)
+@@ -3571,6 +3832,7 @@ g_dbus_connection_signal_subscribe (GDBusConnection     *connection,
+ {
+   gchar *rule;
+   SignalData *signal_data;
++  SignalData *name_watcher = NULL;
+   SignalSubscriber *subscriber;
+   gboolean sender_is_its_own_owner;
+   const gchar *sender_unique_name;
+@@ -3636,13 +3898,59 @@ g_dbus_connection_signal_subscribe (GDBusConnection     *connection,
+ 
+   signal_data = signal_data_new_take (g_steal_pointer (&rule),
+                                       g_strdup (sender),
+-                                      sender_is_its_own_owner,
+                                       g_strdup (interface_name),
+                                       g_strdup (member),
+                                       g_strdup (object_path),
+                                       g_strdup (arg0),
+                                       flags);
+   g_ptr_array_add (signal_data->subscribers, subscriber);
++
++  /* If subscribing to a signal from a specific sender with a well-known
++   * name, we must first subscribe to NameOwnerChanged signals for that
++   * well-known name, so that we can match the current owner of the name
++   * against the sender of each signal. */
++  if (sender != NULL && !sender_is_its_own_owner)
++    {
++      gchar *name_owner_rule = NULL;
++
++      /* We already checked that sender != NULL implies MESSAGE_BUS_CONNECTION */
++      g_assert (connection->flags & G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION);
++
++      name_owner_rule = args_to_rule (DBUS_SERVICE_DBUS,
++                                      DBUS_INTERFACE_DBUS,
++                                      "NameOwnerChanged",
++                                      DBUS_PATH_DBUS,
++                                      sender,
++                                      G_DBUS_SIGNAL_FLAGS_NONE);
++      name_watcher = g_hash_table_lookup (connection->map_rule_to_signal_data, name_owner_rule);
++
++      if (name_watcher == NULL)
++        {
++          name_watcher = signal_data_new_take (g_steal_pointer (&name_owner_rule),
++                                               g_strdup (DBUS_SERVICE_DBUS),
++                                               g_strdup (DBUS_INTERFACE_DBUS),
++                                               g_strdup ("NameOwnerChanged"),
++                                               g_strdup (DBUS_PATH_DBUS),
++                                               g_strdup (sender),
++                                               G_DBUS_SIGNAL_FLAGS_NONE);
++          add_signal_data (connection, name_watcher, DBUS_SERVICE_DBUS);
++        }
++
++      if (name_watcher->watched_name == NULL)
++        {
++          name_watcher->watched_name = watched_name_new ();
++          name_watcher_call_get_name_owner_unlocked (connection, name_watcher);
++        }
++      else
++        {
++          g_ref_count_inc (&name_watcher->watched_name->ref_count);
++        }
++
++      signal_data->shared_name_watcher = name_watcher;
++
++      g_clear_pointer (&name_owner_rule, g_free);
++    }
++
+   add_signal_data (connection, signal_data, sender_unique_name);
+ 
+  out:
+@@ -3670,10 +3978,18 @@ remove_signal_data_if_unused (GDBusConnection *connection,
+   const gchar *sender_unique_name;
+   GPtrArray *signal_data_array;
+ 
++  /* Cannot remove while there are still subscribers */
+   if (signal_data->subscribers->len != 0)
+     return;
+ 
+-  if (signal_data->sender_is_its_own_owner)
++  /* Cannot remove while another SignalData is still using this one
++   * as its shared_name_watcher, which holds watched_name->ref_count > 0 */
++  if (signal_data->watched_name != NULL)
++    return;
++
++  /* Point of no return: we have committed to removing it */
++
++  if (signal_data->sender != NULL && signal_data->shared_name_watcher == NULL)
+     sender_unique_name = signal_data->sender;
+   else
+     sender_unique_name = "";
+@@ -3706,6 +4022,15 @@ remove_signal_data_if_unused (GDBusConnection *connection,
+       remove_match_rule (connection, signal_data->rule);
+     }
+ 
++  if (signal_data->shared_name_watcher != NULL)
++    {
++      SignalData *name_watcher = g_steal_pointer (&signal_data->shared_name_watcher);
++
++      name_watcher_unref_watched_name (connection, name_watcher);
++      /* May free signal_data */
++      remove_signal_data_if_unused (connection, name_watcher);
++    }
++
+   signal_data_free (signal_data);
+ }
+ 
+@@ -3978,6 +4303,17 @@ schedule_callbacks (GDBusConnection *connection,
+             continue;
+         }
+ 
++      if (signal_data->watched_name != NULL)
++        {
++          /* Invariant: SignalData should only have a watched_name if it
++           * represents the NameOwnerChanged signal */
++          g_assert (g_strcmp0 (sender, DBUS_SERVICE_DBUS) == 0);
++          g_assert (g_strcmp0 (interface, DBUS_INTERFACE_DBUS) == 0);
++          g_assert (g_strcmp0 (path, DBUS_PATH_DBUS) == 0);
++          g_assert (g_strcmp0 (member, "NameOwnerChanged") == 0);
++          name_watcher_deliver_name_owner_changed_unlocked (signal_data, message);
++        }
++
+       for (m = 0; m < signal_data->subscribers->len; m++)
+         {
+           SignalSubscriber *subscriber = signal_data->subscribers->pdata[m];
+@@ -4039,7 +4375,7 @@ distribute_signals (GDBusConnection *connection,
+         schedule_callbacks (connection, signal_data_array, message, sender);
+     }
+ 
+-  /* collect subscribers not matching on sender */
++  /* collect subscribers not matching on sender, or matching a well-known name */
+   signal_data_array = g_hash_table_lookup (connection->map_sender_unique_name_to_signal_data_array, "");
+   if (signal_data_array != NULL)
+     schedule_callbacks (connection, signal_data_array, message, sender);
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_14.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_14.patch
new file mode 100644
index 0000000000..ab6c049da7
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_14.patch
@@ -0,0 +1,75 @@
+From 69799764cb40a2842d4891d4e1d72c3ce73964ed Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Thu, 14 Mar 2024 20:42:41 +0000
+Subject: [PATCH 14/18] gdbusconnection: Don't deliver signals if the sender
+ doesn't match
+
+Otherwise a malicious connection on a shared bus, especially the system
+bus, could trick GDBus clients into processing signals sent by the
+malicious connection as though they had come from the real owner of a
+well-known service name.
+
+Resolves: https://gitlab.gnome.org/GNOME/glib/-/issues/3268
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+CVE: CVE-2024-34397
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/69799764cb40a2842d4891d4e1d72c3ce73964ed]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/gdbusconnection.c | 40 ++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 40 insertions(+)
+
+diff --git a/gio/gdbusconnection.c b/gio/gdbusconnection.c
+index 1ac120bc5..7cde0e3bf 100644
+--- a/gio/gdbusconnection.c
++++ b/gio/gdbusconnection.c
+@@ -4284,6 +4284,46 @@ schedule_callbacks (GDBusConnection *connection,
+       if (signal_data->object_path != NULL && g_strcmp0 (signal_data->object_path, path) != 0)
+         continue;
+ 
++      if (signal_data->shared_name_watcher != NULL)
++        {
++          /* We want signals from a specified well-known name, which means
++           * the signal's sender needs to be the unique name that currently
++           * owns that well-known name, and we will have found this
++           * SignalData in
++           * connection->map_sender_unique_name_to_signal_data_array[""]. */
++          const WatchedName *watched_name;
++          const char *current_owner;
++
++          g_assert (signal_data->sender != NULL);
++          /* Invariant: We never need to watch for the owner of a unique
++           * name, or for the owner of DBUS_SERVICE_DBUS, either of which
++           * is always its own owner */
++          g_assert (!g_dbus_is_unique_name (signal_data->sender));
++          g_assert (g_strcmp0 (signal_data->sender, DBUS_SERVICE_DBUS) != 0);
++
++          watched_name = signal_data->shared_name_watcher->watched_name;
++          g_assert (watched_name != NULL);
++          current_owner = watched_name->owner;
++
++          /* Skip the signal if the actual sender is not known to own
++           * the required name */
++          if (current_owner == NULL || g_strcmp0 (current_owner, sender) != 0)
++            continue;
++        }
++      else if (signal_data->sender != NULL)
++        {
++          /* We want signals from a unique name or o.fd.DBus... */
++          g_assert (g_dbus_is_unique_name (signal_data->sender)
++                    || g_str_equal (signal_data->sender, DBUS_SERVICE_DBUS));
++
++          /* ... which means we must have found this SignalData in
++           * connection->map_sender_unique_name_to_signal_data_array[signal_data->sender],
++           * therefore we would only have found it if the signal's
++           * actual sender matches the required signal_data->sender */
++          g_assert (g_strcmp0 (signal_data->sender, sender) == 0);
++        }
++      /* else the sender is unspecified and we will accept anything */
++
+       if (signal_data->arg0 != NULL)
+         {
+           if (arg0 == NULL)
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_15.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_15.patch
new file mode 100644
index 0000000000..547884b796
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_15.patch
@@ -0,0 +1,47 @@
+From 505e2c644d02a5cf581fb85d145e820d51dc3f1b Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Fri, 8 Mar 2024 19:51:50 +0000
+Subject: [PATCH 15/18] tests: Add a test for matching by two well-known names
+
+The expected result is that because TEST_CONN_SERVICE owns
+ALREADY_OWNED_NAME but not (yet) OWNED_LATER_NAME, the signal will be
+delivered to the subscriber for the former but not the latter.
+Before #3268 was fixed, it was incorrectly delivered to both.
+
+Reproduces: https://gitlab.gnome.org/GNOME/glib/-/issues/3268 (partially)
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+CVE: CVE-2024-34397
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/505e2c644d02a5cf581fb85d145e820d51dc3f1b]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/tests/gdbus-subscribe.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/gio/tests/gdbus-subscribe.c b/gio/tests/gdbus-subscribe.c
+index af100de7d..171d6107d 100644
+--- a/gio/tests/gdbus-subscribe.c
++++ b/gio/tests/gdbus-subscribe.c
+@@ -440,6 +440,19 @@ static const TestPlan plan_limit_by_well_known_name =
+         .iface = EXAMPLE_INTERFACE,
+       },
+     },
++    {
++      /* When the service sends a signal with the name it already owns,
++       * it should get through */
++      .action = TEST_ACTION_EMIT_SIGNAL,
++      .u.signal = {
++        .sender = TEST_CONN_SERVICE,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++        .member = FOO_SIGNAL,
++        .received_by_conn = 1,
++        .received_by_proxy = 1
++      },
++    },
+     {
+       /* Service claims another name */
+       .action = TEST_ACTION_OWN_NAME,
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_16.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_16.patch
new file mode 100644
index 0000000000..d582f84a36
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_16.patch
@@ -0,0 +1,62 @@
+From 8338f7ac107f642283437d05d7b4d49ca8968cdf Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Fri, 8 Mar 2024 19:53:22 +0000
+Subject: [PATCH 16/18] tests: Add a test for signal filtering by well-known
+ name
+
+The vulnerability reported as GNOME/glib#3268 can be characterized
+as: these signals from an attacker should not be delivered to either
+the GDBusConnection or the GDBusProxy, but in fact they are (in at
+least some scenarios).
+
+Reproduces: https://gitlab.gnome.org/GNOME/glib/-/issues/3268
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+CVE: CVE-2024-34397
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/8338f7ac107f642283437d05d7b4d49ca8968cdf]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/tests/gdbus-subscribe.c | 27 +++++++++++++++++++++++++++
+ 1 file changed, 27 insertions(+)
+
+diff --git a/gio/tests/gdbus-subscribe.c b/gio/tests/gdbus-subscribe.c
+index 171d6107d..5406ba7e2 100644
+--- a/gio/tests/gdbus-subscribe.c
++++ b/gio/tests/gdbus-subscribe.c
+@@ -440,6 +440,33 @@ static const TestPlan plan_limit_by_well_known_name =
+         .iface = EXAMPLE_INTERFACE,
+       },
+     },
++    {
++      /* Attacker wants to trick subscriber into thinking that service
++       * sent a signal */
++      .action = TEST_ACTION_EMIT_SIGNAL,
++      .u.signal = {
++        .sender = TEST_CONN_ATTACKER,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++        .member = FOO_SIGNAL,
++        .received_by_conn = 0,
++        .received_by_proxy = 0
++      },
++    },
++    {
++      /* Attacker tries harder, by sending a signal unicast directly to
++       * the subscriber */
++      .action = TEST_ACTION_EMIT_SIGNAL,
++      .u.signal = {
++        .sender = TEST_CONN_ATTACKER,
++        .unicast_to = TEST_CONN_SUBSCRIBER,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++        .member = FOO_SIGNAL,
++        .received_by_conn = 0,
++        .received_by_proxy = 0
++      },
++    },
+     {
+       /* When the service sends a signal with the name it already owns,
+        * it should get through */
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_17.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_17.patch
new file mode 100644
index 0000000000..7f5776d0c3
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_17.patch
@@ -0,0 +1,121 @@
+From ff467241a37a0119d3c6df53548bb61fe4d4fbf9 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Tue, 23 Apr 2024 21:39:43 +0100
+Subject: [PATCH 17/18] tests: Ensure that unsubscribing with GetNameOwner
+ in-flight doesn't crash
+
+This was a bug that existed during development of this branch; make sure
+it doesn't come back.
+
+This test fails with a use-after-free and crash if we comment out the
+part of name_watcher_unref_watched_name() that removes the name watcher
+from `map_method_serial_to_name_watcher`.
+
+It would also fail with an assertion failure if we asserted in
+name_watcher_unref_watched_name() that get_name_owner_serial == 0
+(i.e. that GetNameOwner is not in-flight at destruction).
+
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+
+CVE: CVE-2024-34397
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/ff467241a37a0119d3c6df53548bb61fe4d4fbf9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/tests/gdbus-subscribe.c | 52 ++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 51 insertions(+), 1 deletion(-)
+
+diff --git a/gio/tests/gdbus-subscribe.c b/gio/tests/gdbus-subscribe.c
+index 5406ba7e2..4cba4f565 100644
+--- a/gio/tests/gdbus-subscribe.c
++++ b/gio/tests/gdbus-subscribe.c
+@@ -116,6 +116,7 @@ typedef struct
+   const char *member;
+   const char *arg0;
+   GDBusSignalFlags flags;
++  gboolean unsubscribe_immediately;
+ } TestSubscribe;
+ 
+ typedef struct
+@@ -141,6 +142,7 @@ typedef struct
+     TestEmitSignal signal;
+     TestSubscribe subscribe;
+     TestOwnName own_name;
++    guint unsubscribe_undo_step;
+   } u;
+ } TestStep;
+ 
+@@ -505,6 +507,43 @@ static const TestPlan plan_limit_by_well_known_name =
+   },
+ };
+ 
++static const TestPlan plan_unsubscribe_immediately =
++{
++  .description = "Unsubscribing before GetNameOwner can return doesn't result in a crash",
++  .steps = {
++    {
++      /* Service already owns one name */
++      .action = TEST_ACTION_OWN_NAME,
++      .u.own_name = {
++        .name = ALREADY_OWNED_NAME,
++        .owner = TEST_CONN_SERVICE
++      },
++    },
++    {
++      .action = TEST_ACTION_SUBSCRIBE,
++      .u.subscribe = {
++        .string_sender = ALREADY_OWNED_NAME,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++        .unsubscribe_immediately = TRUE
++      },
++    },
++    {
++      .action = TEST_ACTION_EMIT_SIGNAL,
++      .u.signal = {
++        .sender = TEST_CONN_SERVICE,
++        .path = EXAMPLE_PATH,
++        .iface = EXAMPLE_INTERFACE,
++        .member = FOO_SIGNAL,
++        .received_by_conn = 0,
++        /* The proxy can't unsubscribe, except by destroying the proxy
++         * completely, which we don't currently implement in this test */
++        .received_by_proxy = 1
++      },
++    },
++  },
++};
++
+ static const TestPlan plan_limit_to_message_bus =
+ {
+   .description = "A subscription to the message bus only accepts messages "
+@@ -855,8 +894,18 @@ fixture_subscribe (Fixture             *f,
+                                                subscribe->flags,
+                                                subscribed_signal_cb,
+                                                f, NULL);
++
+       g_assert_cmpuint (id, !=, 0);
+-      f->subscriptions[step_number] = id;
++
++      if (subscribe->unsubscribe_immediately)
++        {
++          g_test_message ("\tImmediately unsubscribing");
++          g_dbus_connection_signal_unsubscribe (subscriber, id);
++        }
++      else
++        {
++          f->subscriptions[step_number] = id;
++        }
+     }
+ 
+   if (f->mode != SUBSCRIPTION_MODE_CONN)
+@@ -1287,6 +1336,7 @@ main (int   argc,
+   ADD_SUBSCRIBE_TEST (nonexistent_unique_name);
+   ADD_SUBSCRIBE_TEST (limit_by_well_known_name);
+   ADD_SUBSCRIBE_TEST (limit_to_message_bus);
++  ADD_SUBSCRIBE_TEST (unsubscribe_immediately);
+ 
+   return g_test_run();
+ }
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_18.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_18.patch
new file mode 100644
index 0000000000..a19ce24555
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-34397_18.patch
@@ -0,0 +1,50 @@
+From fe11c6a513a1b16462442e361bab753246c8de2e Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@debian.org>
+Date: Mon, 6 May 2024 21:24:53 +0100
+Subject: [PATCH 18/18] gdbus-proxy test: Wait before asserting name owner has
+ gone away
+
+GDBusConnection sends each signal to recipients in a separate idle
+callback, and there's no particular guarantee about the order in which
+they're scheduled or dispatched. For the NameOwnerChanged signal that
+reports the name becoming unowned, it's possible that g_bus_watch_name()
+gets its idle callback called before the GDBusProxy:g-name-owner
+machinery has updated the name owner, in which case the assertion
+will fail.
+
+Fixing GNOME/glib#3268 introduced a new subscription to NameOwnerChanged
+which can alter the order of delivery, particularly in the case where
+G_DBUS_PROXY_FLAGS_NO_MATCH_RULE was used (as tested in
+/gdbus/proxy/no-match-rule). The resulting test failure is intermittent,
+but reliably appears within 100 repetitions of that test.
+
+Fixes: 511c5f5b "tests: Wait for gdbus-testserver to die when killing it"
+Signed-off-by: Simon McVittie <smcv@debian.org>
+
+CVE: CVE-2024-34397
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/fe11c6a513a1b16462442e361bab753246c8de2e]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/tests/gdbus-proxy.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/gio/tests/gdbus-proxy.c b/gio/tests/gdbus-proxy.c
+index eed75acf4..9303d0088 100644
+--- a/gio/tests/gdbus-proxy.c
++++ b/gio/tests/gdbus-proxy.c
+@@ -778,6 +778,12 @@ kill_test_service (GDBusConnection *connection)
+   while (!name_disappeared)
+     g_main_context_iteration (NULL, TRUE);
+ 
++  /* GDBusConnection doesn't guarantee that different subscriptions to the
++   * same signal will get their callbacks scheduled in any particular order,
++   * so make sure they have all happened */
++  while (g_main_context_iteration (NULL, FALSE))
++    continue;
++
+   g_bus_unwatch_name (watch_id);
+ #else
+   g_warning ("Can't kill com.example.TestService");
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index 24c590a714..35b51a3ec9 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -31,6 +31,24 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2023-32611-0002.patch \
            file://CVE-2023-32643.patch \
            file://CVE-2023-32636.patch \
+           file://CVE-2024-34397_01.patch \
+           file://CVE-2024-34397_02.patch \
+           file://CVE-2024-34397_03.patch \
+           file://CVE-2024-34397_04.patch \
+           file://CVE-2024-34397_05.patch \
+           file://CVE-2024-34397_06.patch \
+           file://CVE-2024-34397_07.patch \
+           file://CVE-2024-34397_08.patch \
+           file://CVE-2024-34397_09.patch \
+           file://CVE-2024-34397_10.patch \
+           file://CVE-2024-34397_11.patch \
+           file://CVE-2024-34397_12.patch \
+           file://CVE-2024-34397_13.patch \
+           file://CVE-2024-34397_14.patch \
+           file://CVE-2024-34397_15.patch \
+           file://CVE-2024-34397_16.patch \
+           file://CVE-2024-34397_17.patch \
+           file://CVE-2024-34397_18.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-- 
2.34.1


