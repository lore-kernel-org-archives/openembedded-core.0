Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D385C4451B
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 22:18:39 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.453.1784499511275536355
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 15:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Dzx/EaPe;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260719221827c36d58b514000207c4-ezvxiv@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260719221827c36d58b514000207c4
        for <openembedded-core@lists.openembedded.org>;
        Mon, 20 Jul 2026 00:18:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=39RYglm9YkPiKI/ns9JiG0FY7IDYgZ+Vt9ps3mk2SP0=;
 b=Dzx/EaPeGHXnG4era8uIMkbs2fU50CaSAQeUdKGxbAsuCIiuivXdB4Rz73zeIV3LOCJegx
 4BEvFhNYxN+Rp9KYESk/F/c5t6GfEq8nVNCbXurl9+wtESiTFphtxv0V9LQC64pLgC6XIR3o
 r6evivY/buzE/qX/7iJffNSsaisPyghBYfdRdB4ZezgNi6u/G/s7RPysQCS+FksTPK0AHszJ
 DZNc5Mp5NKafC6s8fvLALgOtO0ROomvxfdvZSFGOXxLP2IJ8BNVHE1sF4faCknwVrr6EtFPR
 ZpdZJ9VWdQZhjOoDRwkIeJtEHVbOWDDQ+9TLVaJakTo/xb9RPJ6S6gkw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] glib-2.0: upgrade 2.88.0 -> 2.88.2
Date: Mon, 20 Jul 2026 00:18:22 +0200
Message-ID: <20260719221822.3458326-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 22:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241306

Refresh patches via devtool.
Release notes: [1] and [2].

2.88.1: Fix various minor (low severity) security issues
        CVE-2026-58010, CVE-2026-58011, CVE-2026-58012, CVE-2026-58013,
        CVE-2026-58014 and CVE-2026-58015

[1] https://gitlab.gnome.org/GNOME/glib/-/releases/2.88.1
[2] https://gitlab.gnome.org/GNOME/glib/-/releases/2.88.2

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glib-2.0/files/CVE-2026-58016-1.patch     | 12 ++++----
 .../glib-2.0/files/CVE-2026-58016-2.patch     | 30 +++++++++----------
 ...l_2.88.0.bb => glib-2.0-initial_2.88.2.bb} |  0
 ...{glib-2.0_2.88.0.bb => glib-2.0_2.88.2.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  2 +-
 5 files changed, 22 insertions(+), 22 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.88.0.bb => glib-2.0-initial_2.88.2.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.88.0.bb => glib-2.0_2.88.2.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
index 2c4b248b97..9beafd106d 100644
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
@@ -30,7 +30,7 @@ diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
 index c7be334ce2f7..6f722ee6153d 100644
 --- a/gio/gdbusintrospection.c
 +++ b/gio/gdbusintrospection.c
-@@ -1272,7 +1272,7 @@ parser_start_element (GMarkupParseContext  *context,
+@@ -1258,7 +1258,7 @@ parser_start_element (GMarkupParseContext  *context,
    /* ---------------------------------------------------------------------------------------------------- */
    if (strcmp (element_name, "node") == 0)
      {
@@ -43,10 +43,10 @@ diff --git a/gio/tests/gdbus-introspection.c b/gio/tests/gdbus-introspection.c
 index 44cb7a96af45..daca313f77e7 100644
 --- a/gio/tests/gdbus-introspection.c
 +++ b/gio/tests/gdbus-introspection.c
-@@ -299,6 +299,38 @@ test_extra_data (void)
+@@ -300,6 +300,38 @@ test_extra_data (void)
    g_dbus_node_info_unref (info);
  }
-
+ 
 +static void
 +test_invalid (void)
 +{
@@ -80,14 +80,14 @@ index 44cb7a96af45..daca313f77e7 100644
 +}
 +
  /* ---------------------------------------------------------------------------------------------------- */
-
+ 
  int
-@@ -316,6 +348,7 @@ main (int   argc,
+@@ -317,6 +349,7 @@ main (int   argc,
    g_test_add_func ("/gdbus/introspection-generate", test_generate);
    g_test_add_func ("/gdbus/introspection-default-direction", test_default_direction);
    g_test_add_func ("/gdbus/introspection-extra-data", test_extra_data);
 +  g_test_add_func ("/gdbus/introspection/invalid", test_invalid);
-
+ 
    ret = session_bus_run ();
 
 --
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
index a61e35ad8a..a07aa529ae 100644
--- a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
@@ -30,63 +30,63 @@ diff --git a/gio/gdbusintrospection.c b/gio/gdbusintrospection.c
 index 6f722ee6153d..ed0d291f99f0 100644
 --- a/gio/gdbusintrospection.c
 +++ b/gio/gdbusintrospection.c
-@@ -1110,6 +1110,7 @@ parse_data_get_annotation (ParseData *data,
+@@ -1096,6 +1096,7 @@ parse_data_get_annotation (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->annotations, g_new0 (GDBusAnnotationInfo, 1));
 +  g_assert (data->annotations->len > 0);
    return data->annotations->pdata[data->annotations->len - 1];
  }
-
-@@ -1119,6 +1120,7 @@ parse_data_get_arg (ParseData *data,
+ 
+@@ -1105,6 +1106,7 @@ parse_data_get_arg (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->args, g_new0 (GDBusArgInfo, 1));
 +  g_assert (data->args->len > 0);
    return data->args->pdata[data->args->len - 1];
  }
-
-@@ -1128,6 +1130,7 @@ parse_data_get_out_arg (ParseData *data,
+ 
+@@ -1114,6 +1116,7 @@ parse_data_get_out_arg (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->out_args, g_new0 (GDBusArgInfo, 1));
 +  g_assert (data->out_args->len > 0);
    return data->out_args->pdata[data->out_args->len - 1];
  }
-
-@@ -1137,6 +1140,7 @@ parse_data_get_method (ParseData *data,
+ 
+@@ -1123,6 +1126,7 @@ parse_data_get_method (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->methods, g_new0 (GDBusMethodInfo, 1));
 +  g_assert (data->methods->len > 0);
    return data->methods->pdata[data->methods->len - 1];
  }
-
-@@ -1146,6 +1150,7 @@ parse_data_get_signal (ParseData *data,
+ 
+@@ -1132,6 +1136,7 @@ parse_data_get_signal (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->signals, g_new0 (GDBusSignalInfo, 1));
 +  g_assert (data->signals->len > 0);
    return data->signals->pdata[data->signals->len - 1];
  }
-
-@@ -1155,6 +1160,7 @@ parse_data_get_property (ParseData *data,
+ 
+@@ -1141,6 +1146,7 @@ parse_data_get_property (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->properties, g_new0 (GDBusPropertyInfo, 1));
 +  g_assert (data->properties->len > 0);
    return data->properties->pdata[data->properties->len - 1];
  }
-
-@@ -1164,6 +1170,7 @@ parse_data_get_interface (ParseData *data,
+ 
+@@ -1150,6 +1156,7 @@ parse_data_get_interface (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->interfaces, g_new0 (GDBusInterfaceInfo, 1));
 +  g_assert (data->interfaces->len > 0);
    return data->interfaces->pdata[data->interfaces->len - 1];
  }
-
-@@ -1173,6 +1180,7 @@ parse_data_get_node (ParseData *data,
+ 
+@@ -1159,6 +1166,7 @@ parse_data_get_node (ParseData *data,
  {
    if (create_new)
      g_ptr_array_add (data->nodes, g_new0 (GDBusNodeInfo, 1));
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.2.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.2.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.88.2.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.88.2.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index fb35f84eec..d49ae13168 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -240,7 +240,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[archive.sha256sum] = "3546251ccbb3744d4bc4eb48354540e1f6200846572bab68e3a2b7b2b64dfd07"
+SRC_URI[archive.sha256sum] = "cf3f215a640c8a4257f14317586b8f1fdd25a10a93cb4bdda147c0f9ad88e74f"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.

