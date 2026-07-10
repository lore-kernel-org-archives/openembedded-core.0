Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D547C4450D
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 16:37:14 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1858.1783701430622107991
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 09:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DeifoGjA;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493f60208a5so6393675e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 09:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783701429; x=1784306229; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsEASsnRT8LuZZrM46wcdAXBk2kJbCTQHq2aKYF869w=;
        b=DeifoGjAN+Yupm+XHSrlbdgoezuISKWQFaiC6slzws4ywzShHaSUWOIVe4m+KD/MwV
         X7AOWN8nGK3VW0td6Yk/4iO93MbrCMvsZs37pprjAeuSgMq8yt7I2CyAqydszYsfyZe4
         vn2naOmiEdku0BBgz7Rc9XXDDIdhdh73/4de4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701429; x=1784306229;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsEASsnRT8LuZZrM46wcdAXBk2kJbCTQHq2aKYF869w=;
        b=kP/MYCmTJAg160FAj+ctceKZjP3OkEFWkI3bePfwc98P+l7RUVLe43xqOiQolpj4KL
         URjSpSWvEStk6a6hV3zmGLmuAqWteajC3LO5hwCglEacYMySz0Ii3fO8MQJli6lgjeRG
         zhk+7jOjDxt4bhzh4VE1lMyJvu2K8pKPekXyGoZqDunxQxrGml9puLLz248vz35dHJJl
         079wXep3miBUo7+L1zLLRmdAclqmY0Xz3N5Uumubrv8paQniw7aYyAc30lgMvJtlfJEF
         d/tMFNrcIxFx++ChFlqOKR+ABmQ+az9sBsAdJL/AGoVD02KHKbnd6Gjj1YH7hwpVt5BE
         JJng==
X-Gm-Message-State: AOJu0Yx/kCZFD59hUKWDR2V8GkZ2ouesWoe7g38yW+IpaEN9/+aSMGc7
	i18pEMwaLywQu3TqHkArKQocstuwUHms/P18Ip5fWbmjf7Y7R/wdstv7lxdGEnaK+OICF5PBVkp
	yOSXSwZg=
X-Gm-Gg: AfdE7cljSpOJSQSs9dVwi1NnNp2gQdfzur/ro1YjmXC5m/QTPfTSaf2lBmxztXAKCqm
	jUWFgACQKmqu1HUyB9r9k1Bc5+275SVlmW3N6k7PXfRe9lT1sj79cGOemnvhtO3jkmfpGCV2lXs
	o/QGPCu2Gm8z+N5Dm0Q4UwADf7AAL4gSxaMe3nGVnAARH4IGA6NC6fdXYLNyOkLkxfL9jMOxzFZ
	3AAXxSBLiU8jiX+oVQjMVmKXIyiYOFNuGQtvUpQkd287vlb0wIHTzOCT10jLPH6BcDnkn0wXh5J
	w9MpYnx7C30oFgLQalWgpgUvAo3AzmigcAEJlkNX3YnnvyLio02On3VSpC8MPi/o+pH2oEZlLeu
	CEZpRYo4nx63h9uD94EAHL5OaKT3uzDwQNqESNJtICeTuZ29P841knZv7IliX7RNzFse/FzmyFk
	5Tl63965TQ2m1o/lRwZ523PxE9yB0pXuUXHi5fcw1itJMyojo3Tsi9UfKm2nC7Lr1VwKSBKnNwN
	KI12o1WDzpTKDOhLz4=
X-Received: by 2002:a05:600c:e558:10b0:493:e57e:7aa5 with SMTP id 5b1f17b1804b1-493e68c6e63mr85071195e9.22.1783701428647;
        Fri, 10 Jul 2026 09:37:08 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-2608-8c5f-3a92-eb6f-dc01-ac58.rev.sfr.net. [2a02:8440:2608:8c5f:3a92:eb6f:dc01:ac58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d4f9fsm150758695e9.4.2026.07.10.09.37.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:37:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 11/18] glib-2.0: fix CVE-2026-58016
Date: Fri, 10 Jul 2026 18:36:26 +0200
Message-ID: <de9befbf242b87d5dd611f77caada1d209405fe1.1783697455.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783697455.git.yoann.congal@smile.fr>
References: <cover.1783697455.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 16:37:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240672

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

A flaw was found in GLib. A state confusion issue exists in
g_dbus_node_info_new_for_xml() in the gio/gdbusintrospection.c file when
processing malformed D-Bus introspection XML, specifically with a <node>
element nested within other elements like <method>, <signal>, <property>
or <arg>. This issue can cause an unsigned integer overflow and lead to an
out-of-bounds read, resulting in a denial of service.

The CVE NVD entry is wrong, it indicates that the CVE is fixed in 2.88.1
but the fix was realized in 2.89.0, see [1]. The fix is not present in 2.88.2.

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d52f4d582cc71ada3c8ebe54be1a5b70278ea1ca)
[YC: re-added the removed Signed-off-bys from the patches]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glib-2.0/files/CVE-2026-58016-1.patch     | 94 ++++++++++++++++++
 .../glib-2.0/files/CVE-2026-58016-2.patch     | 98 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |  2 +
 3 files changed, 194 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch

diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
new file mode 100644
index 00000000000..2c4b248b97b
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
@@ -0,0 +1,94 @@
+From 38eee3870fbcf6bdf8e6b1281bc7a98d32b68521 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Thu, 16 Apr 2026 15:27:37 +0100
+Subject: [PATCH 1/2] gdbusintrospection: Fix XML parser state handling for
+ <node> element nesting
+
+The check for whether a `<node>` element in D-Bus introspection XML was
+nested correctly was broken. `<node>` elements can only be at the top
+level, or nested immediately within another `<node>` element.
+
+Fix the check and add some unit tests for it.
+
+Spotted by linhlhq as #YWH-PGM9867-204. The fix is mine, and the unit test
+uses example XML strings adapted from their report.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+Fixes: #3932
+
+CVE: CVE-2026-58016
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2]
+
+Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
+---
+ gio/gdbusintrospection.c        |  2 +-
+ gio/tests/gdbus-introspection.c | 33 +++++++++++++++++++++++++++++++++
+ 2 files changed, 34 insertions(+), 1 deletion(-)
+
+diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
+index c7be334ce2f7..6f722ee6153d 100644
+--- a/gio/gdbusintrospection.c
++++ b/gio/gdbusintrospection.c
+@@ -1272,7 +1272,7 @@ parser_start_element (GMarkupParseContext  *context,
+   /* ---------------------------------------------------------------------------------------------------- */
+   if (strcmp (element_name, "node") == 0)
+     {
+-      if (!(g_slist_length (stack) >= 1 || strcmp (stack->next->data, "node") != 0))
++      if (stack->next != NULL && strcmp (stack->next->data, "node") != 0)
+         {
+           g_set_error_literal (error,
+                                G_MARKUP_ERROR,
+diff --git a/gio/tests/gdbus-introspection.c b/gio/tests/gdbus-introspection.c
+index 44cb7a96af45..daca313f77e7 100644
+--- a/gio/tests/gdbus-introspection.c
++++ b/gio/tests/gdbus-introspection.c
+@@ -299,6 +299,38 @@ test_extra_data (void)
+   g_dbus_node_info_unref (info);
+ }
+
++static void
++test_invalid (void)
++{
++  const struct
++    {
++      const char *xml;
++      GMarkupError expected_error_code;
++    }
++  vectors[] =
++    {
++      { "", G_MARKUP_ERROR_EMPTY },
++      { "<node><interface name=\"I\"><method name=\"M\"><node><interface name=\"I2\"></interface></node></method>", G_MARKUP_ERROR_INVALID_CONTENT },
++      { "<node><interface name=\"I\"><signal name=\"S\"><node><interface name=\"I2\"><signal name=\"S2\"></signal></interface></node></signal>", G_MARKUP_ERROR_INVALID_CONTENT },
++      { "<node><interface name=\"I\"><property name=\"P\" type=\"s\" access=\"read\"><node><interface name=\"I2\"></interface></node></property>", G_MARKUP_ERROR_INVALID_CONTENT },
++      { "<node><interface name=\"I\"><method name=\"M\"><arg type=\"\"><node><interface name=\"I2\"><method name=\"M2\"></method></interface></node></arg>", G_MARKUP_ERROR_INVALID_CONTENT },
++    };
++
++  for (size_t i = 0; i < G_N_ELEMENTS (vectors); i++)
++    {
++      GDBusNodeInfo *node;
++      GError *local_error = NULL;
++
++      g_test_message ("Testing parsing of %s gives an error", vectors[i].xml);
++
++      node = g_dbus_node_info_new_for_xml (vectors[i].xml, &local_error);
++      g_assert_error (local_error, G_MARKUP_ERROR, (int) vectors[i].expected_error_code);
++      g_assert_null (node);
++
++      g_clear_error (&local_error);
++    }
++}
++
+ /* ---------------------------------------------------------------------------------------------------- */
+
+ int
+@@ -316,6 +348,7 @@ main (int   argc,
+   g_test_add_func ("/gdbus/introspection-generate", test_generate);
+   g_test_add_func ("/gdbus/introspection-default-direction", test_default_direction);
+   g_test_add_func ("/gdbus/introspection-extra-data", test_extra_data);
++  g_test_add_func ("/gdbus/introspection/invalid", test_invalid);
+
+   ret = session_bus_run ();
+
+--
+2.54.0
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
new file mode 100644
index 00000000000..a61e35ad8a7
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
@@ -0,0 +1,98 @@
+From a75052ceeebea434f271b670766acd5416bc83b9 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Thu, 16 Apr 2026 15:08:10 +0100
+Subject: [PATCH 2/2] gdbusintrospection: Add some assertions before array
+ dereferences
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The state handling inside the D-Bus introspection XML parser is
+complicated, and it’s possible that these dereferences of the
+`len - 1`th element might get reached when the array is empty.
+
+Make failures like that more debuggable by adding an assertion on the
+length beforehand.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+Helps: #3932
+
+CVE: CVE-2026-58016
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/656ad4582cb1d7a7fa8bafe3ce8aec6aa3c17da0]
+
+Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
+---
+ gio/gdbusintrospection.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
+index 6f722ee6153d..ed0d291f99f0 100644
+--- a/gio/gdbusintrospection.c
++++ b/gio/gdbusintrospection.c
+@@ -1110,6 +1110,7 @@ parse_data_get_annotation (ParseData *data,
+ {
+   if (create_new)
+     g_ptr_array_add (data->annotations, g_new0 (GDBusAnnotationInfo, 1));
++  g_assert (data->annotations->len > 0);
+   return data->annotations->pdata[data->annotations->len - 1];
+ }
+
+@@ -1119,6 +1120,7 @@ parse_data_get_arg (ParseData *data,
+ {
+   if (create_new)
+     g_ptr_array_add (data->args, g_new0 (GDBusArgInfo, 1));
++  g_assert (data->args->len > 0);
+   return data->args->pdata[data->args->len - 1];
+ }
+
+@@ -1128,6 +1130,7 @@ parse_data_get_out_arg (ParseData *data,
+ {
+   if (create_new)
+     g_ptr_array_add (data->out_args, g_new0 (GDBusArgInfo, 1));
++  g_assert (data->out_args->len > 0);
+   return data->out_args->pdata[data->out_args->len - 1];
+ }
+
+@@ -1137,6 +1140,7 @@ parse_data_get_method (ParseData *data,
+ {
+   if (create_new)
+     g_ptr_array_add (data->methods, g_new0 (GDBusMethodInfo, 1));
++  g_assert (data->methods->len > 0);
+   return data->methods->pdata[data->methods->len - 1];
+ }
+
+@@ -1146,6 +1150,7 @@ parse_data_get_signal (ParseData *data,
+ {
+   if (create_new)
+     g_ptr_array_add (data->signals, g_new0 (GDBusSignalInfo, 1));
++  g_assert (data->signals->len > 0);
+   return data->signals->pdata[data->signals->len - 1];
+ }
+
+@@ -1155,6 +1160,7 @@ parse_data_get_property (ParseData *data,
+ {
+   if (create_new)
+     g_ptr_array_add (data->properties, g_new0 (GDBusPropertyInfo, 1));
++  g_assert (data->properties->len > 0);
+   return data->properties->pdata[data->properties->len - 1];
+ }
+
+@@ -1164,6 +1170,7 @@ parse_data_get_interface (ParseData *data,
+ {
+   if (create_new)
+     g_ptr_array_add (data->interfaces, g_new0 (GDBusInterfaceInfo, 1));
++  g_assert (data->interfaces->len > 0);
+   return data->interfaces->pdata[data->interfaces->len - 1];
+ }
+
+@@ -1173,6 +1180,7 @@ parse_data_get_node (ParseData *data,
+ {
+   if (create_new)
+     g_ptr_array_add (data->nodes, g_new0 (GDBusNodeInfo, 1));
++  g_assert (data->nodes->len > 0);
+   return data->nodes->pdata[data->nodes->len - 1];
+ }
+
+--
+2.54.0
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index dee94ec0600..fb35f84eec5 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -233,6 +233,8 @@ SRC_URI += "\
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
            file://skip-timeout.patch \
+           file://CVE-2026-58016-1.patch \
+           file://CVE-2026-58016-2.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \

