Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 694FDC43458
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 09:34:47 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.128881.1783244081174915283
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 02:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=L1s6EmjV;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3C645C8EC46;
	Sun,  5 Jul 2026 09:34:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6F8D6601A2;
	Sun,  5 Jul 2026 09:34:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 17B8411BB83D8;
	Sun,  5 Jul 2026 11:34:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783244077; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=DnGjD3tLWZrfpCdAL6e5hR32fDyev75MkF0UxfiWJjo=;
	b=L1s6EmjVHUK8BSCdbeYdBbSCP4a6v3ULbx1xyoFe9EeO+Pp8dagbauRj+uW6haUhhHQePC
	ow+0+BADSr3iglxRRemIe8PYwbz0TX9R8lhoRhPTHdekI7dxVXqijmzzBOkz11vGE0r7A7
	DT8guSPbN/5ybObAC507dWnriIc2j5AXt07B7+T47Si5mZrvJhf5UfhtOO6tChmgJjtk9l
	sjdnwzvnrJz8Jl9guE+J8gXwXAmI26iSkjz7iyaS+w9iudAyPZ4/h52va/0ZyS6KNWjT0p
	n6YcONuc2EEdAyX4HIOaOvznI3bsuLzYyq8s/Bj7r5+ut9TDpXB5VBbZWeRE9g==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Sun, 05 Jul 2026 11:34:30 +0200
Subject: [PATCH v2] glib-2.0: fix CVE-2026-58016
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260705-glib-2-0-cve-2026-58016-master-v2-1-16416bf73089@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBBFr0K6dkynxIKuvIdhQcsAY5CatjYaw
 t2leAGX7+fn/b+IQJ4piEuxCE+JA7t5A3UohB3beSDgbmOhpNKykiUMExtQIMEmgpzCqZao4dG
 GSB6q2qBsZY+1KsUmeXrq+b0P3Jofh5e5k43Zmhsjh+j8Z3+QMPf+HksICIT6rKuu63vUV+Ncn
 Hg+WvcQzbquX+1foNHgAAAA
X-Change-ID: 20260703-glib-2-0-cve-2026-58016-master-78b10a0f1823
To: openembedded-core@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 09:34:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240146

A flaw was found in GLib. A state confusion issue exists in
g_dbus_node_info_new_for_xml() in the gio/gdbusintrospection.c file when
processing malformed D-Bus introspection XML, specifically with a <node>
element nested within other elements like <method>, <signal>, <property>
or <arg>. This issue can cause an unsigned integer overflow and lead to a=
n
out-of-bounds read, resulting in a denial of service.

The CVE NVD entry is wrong, it indicates that the CVE is fixed in 2.88.1
but the fix was realized in 2.89.0, see [1]. The fix is not present in 2.=
88.2.

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/c9da977c178fbfc0e4caf99f=
9fdf5dc433d6fcc2

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
---
Changes in v2:
- Backport the patch since 2.89.1 is not a stable release.
- Link to v1: https://patch.msgid.link/20260703-glib-2-0-cve-2026-58016-m=
aster-v1-1-e16967ddff16@bootlin.com
---
 .../glib-2.0/files/CVE-2026-58016-1.patch          | 92 ++++++++++++++++=
+++++
 .../glib-2.0/files/CVE-2026-58016-2.patch          | 96 ++++++++++++++++=
++++++
 meta/recipes-core/glib-2.0/glib.inc                |  2 +
 3 files changed, 190 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch b/me=
ta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
new file mode 100644
index 000000000000..ee6321361455
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-1.patch
@@ -0,0 +1,92 @@
+From 38eee3870fbcf6bdf8e6b1281bc7a98d32b68521 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Thu, 16 Apr 2026 15:27:37 +0100
+Subject: [PATCH 1/2] gdbusintrospection: Fix XML parser state handling f=
or
+ <node> element nesting
+
+The check for whether a `<node>` element in D-Bus introspection XML was
+nested correctly was broken. `<node>` elements can only be at the top
+level, or nested immediately within another `<node>` element.
+
+Fix the check and add some unit tests for it.
+
+Spotted by linhlhq as #YWH-PGM9867-204. The fix is mine, and the unit te=
st
+uses example XML strings adapted from their report.
+
+Fixes: #3932
+
+CVE: CVE-2026-58016
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
c9da977c178fbfc0e4caf99f9fdf5dc433d6fcc2]
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
+@@ -1272,7 +1272,7 @@ parser_start_element (GMarkupParseContext  *contex=
t,
+   /* ------------------------------------------------------------------=
---------------------------------- */
+   if (strcmp (element_name, "node") =3D=3D 0)
+     {
+-      if (!(g_slist_length (stack) >=3D 1 || strcmp (stack->next->data,=
 "node") !=3D 0))
++      if (stack->next !=3D NULL && strcmp (stack->next->data, "node") !=
=3D 0)
+         {
+           g_set_error_literal (error,
+                                G_MARKUP_ERROR,
+diff --git a/gio/tests/gdbus-introspection.c b/gio/tests/gdbus-introspec=
tion.c
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
++  vectors[] =3D
++    {
++      { "", G_MARKUP_ERROR_EMPTY },
++      { "<node><interface name=3D\"I\"><method name=3D\"M\"><node><inte=
rface name=3D\"I2\"></interface></node></method>", G_MARKUP_ERROR_INVALID=
_CONTENT },
++      { "<node><interface name=3D\"I\"><signal name=3D\"S\"><node><inte=
rface name=3D\"I2\"><signal name=3D\"S2\"></signal></interface></node></s=
ignal>", G_MARKUP_ERROR_INVALID_CONTENT },
++      { "<node><interface name=3D\"I\"><property name=3D\"P\" type=3D\"=
s\" access=3D\"read\"><node><interface name=3D\"I2\"></interface></node><=
/property>", G_MARKUP_ERROR_INVALID_CONTENT },
++      { "<node><interface name=3D\"I\"><method name=3D\"M\"><arg type=3D=
\"\"><node><interface name=3D\"I2\"><method name=3D\"M2\"></method></inte=
rface></node></arg>", G_MARKUP_ERROR_INVALID_CONTENT },
++    };
++
++  for (size_t i =3D 0; i < G_N_ELEMENTS (vectors); i++)
++    {
++      GDBusNodeInfo *node;
++      GError *local_error =3D NULL;
++
++      g_test_message ("Testing parsing of %s gives an error", vectors[i=
].xml);
++
++      node =3D g_dbus_node_info_new_for_xml (vectors[i].xml, &local_err=
or);
++      g_assert_error (local_error, G_MARKUP_ERROR, (int) vectors[i].exp=
ected_error_code);
++      g_assert_null (node);
++
++      g_clear_error (&local_error);
++    }
++}
++
+ /* --------------------------------------------------------------------=
-------------------------------- */
+
+ int
+@@ -316,6 +348,7 @@ main (int   argc,
+   g_test_add_func ("/gdbus/introspection-generate", test_generate);
+   g_test_add_func ("/gdbus/introspection-default-direction", test_defau=
lt_direction);
+   g_test_add_func ("/gdbus/introspection-extra-data", test_extra_data);
++  g_test_add_func ("/gdbus/introspection/invalid", test_invalid);
+
+   ret =3D session_bus_run ();
+
+--
+2.54.0
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch b/me=
ta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
new file mode 100644
index 000000000000..a24e54016177
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58016-2.patch
@@ -0,0 +1,96 @@
+From a75052ceeebea434f271b670766acd5416bc83b9 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Thu, 16 Apr 2026 15:08:10 +0100
+Subject: [PATCH 2/2] gdbusintrospection: Add some assertions before arra=
y
+ dereferences
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The state handling inside the D-Bus introspection XML parser is
+complicated, and it=E2=80=99s possible that these dereferences of the
+`len - 1`th element might get reached when the array is empty.
+
+Make failures like that more debuggable by adding an assertion on the
+length beforehand.
+
+Helps: #3932
+
+CVE: CVE-2026-58016
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
656ad4582cb1d7a7fa8bafe3ce8aec6aa3c17da0]
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
+     g_ptr_array_add (data->annotations, g_new0 (GDBusAnnotationInfo, 1)=
);
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
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
index 8d23092187bf..a3f4a88246b5 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -233,6 +233,8 @@ SRC_URI +=3D "\
            file://0001-gio-tests-resources.c-comment-out-a-build-host-on=
ly-.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.pa=
tch \
            file://skip-timeout.patch \
+           file://CVE-2026-58016-1.patch \
+           file://CVE-2026-58016-2.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pi=
dfd-features-on-native-g.patch \

---
base-commit: 0776ddc4508387f3c1a13f7a1b6e2a6119aea4b2
change-id: 20260703-glib-2-0-cve-2026-58016-master-78b10a0f1823

Best regards,
-- =20
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


