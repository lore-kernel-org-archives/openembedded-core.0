Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5647ECE7AB0
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 07:28:12 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.47311.1725866891280696809
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Sep 2024 00:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout06.t-online.de (Postfix) with SMTP id 503FA1DA37
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Sep 2024 09:27:25 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.228.217]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1snYnx-0Bmtzl0; Mon, 9 Sep 2024 09:27:21 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] gtk4: update 4.14.5 -> 4.16.0
Date: Mon,  9 Sep 2024 09:28:59 +0200
Message-ID: <20240909072859.1331936-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1725866841-3EFFB47A-23D32414/0/0 CLEAN NORMAL
X-TOI-MSGID: 44655681-4485-40a9-a6cb-f35d7f9b1d48
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Sep 2024 07:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204313

- Add python3-docutils-native to provide rst2man and rst2html5
  Otherwise build fails if documentation is built
- Remove duplicate gi-docgen dependency. Its already included
  by gi-docgen.bbclass

Note: This release changes the default GSK renderer to be Vulkan,
on Wayland. Other platforms still use ngl. The intent of this change
is to use the best available platform APIs. You can still override
the renderer choice using the GSK_RENDERER environment variable.

We believe that most of the problems reported with the new renderers
during the 4.13 and 4.15 development cycles have been addressed by now.

But the new renderers and dmabuf support are using graphics drivers
in different ways than the old gl renderer, and trigger new driver bugs.
Therefore, it is recommended to use the latest mesa release (24.2)
with the new renderers.

* GtkScale:
 - Fix positioning of scale values

* GtkEmojiChooser:
 - Make Control-clicks work for the recent section

* GtkPopover:
 - Make sure focus lands on the right widget when cascading

* GtkSpinButton:
 - Disable Emoji input for numeric spin buttons

* GtkSingleSelection:
 - Implement unselect_all

* Accssibility:
 - Fix roles for radio buttons
 - Check if ATs are listening before exporting trees
 - Add a check for sandboxed accessibility bus
 - Fix handling of the error message relation
 - Turn criticals into debug messages
 - Set expanded states properly in menus

* CSS:
 - Fix a few issues on bigendian systems
 - Avoid a crash with relative colors

* GSK:
 - Use the right GL context when exporting textures
 - Don't let colors influence depth decisions
 - Allow uploading of mipmap levels when tiling textures

* GDK:
 - Update keysyms from libX11 1.8.10
 - Implement cpu-side mipmapping
 - Use a thread pool for color conversions and mipmapping

* Vulkan:
 - Fix drag surface offsets

* Wayland:
 - Fix a crash
 - Associate EGL windows with context later

* X11:
 - Fix initial EGL context creation
 - Fix a problem with GL context creation

* Broadway:
 - Implement compute_size and request_layout

* MacOS:
 - Set transparent backgroiund for toplevel windows

* Windows:
 - Improve debug output
 - Detect Mesas d3d12 driver and request GDI compat

* Demos:
 - Set window icons in demos
 - Add a 64k x 64k image to the image scaling demo

* Translation updates
 Belarusian
 Brazilian Portuguese
 Catalan
 Czech
 Galician
 German
 Hebrew
 Indonesian
 Korean
 Lithuanian
 Persian
 Polish
 Portuguese
 Slovenian
 Spanish
 Turkish
 Ukrainian

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/gtk+/{gtk4_4.14.5.bb =3D> gtk4_4.16.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.14.5.bb =3D> gtk4_4.16.0.bb} (96%=
)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.14.5.bb b/meta/recipes-gnome/=
gtk+/gtk4_4.16.0.bb
similarity index 96%
rename from meta/recipes-gnome/gtk+/gtk4_4.14.5.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.16.0.bb
index 0b3d33f8eb..6331e86bf5 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.14.5.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.16.0.bb
@@ -11,7 +11,6 @@ DEPENDS =3D " \
     fribidi \
     gdk-pixbuf \
     gdk-pixbuf-native \
-    gi-docgen \
     glib-2.0 \
     graphene \
     harfbuzz \
@@ -22,6 +21,7 @@ DEPENDS =3D " \
     librsvg \
     libxkbcommon \
     pango \
+    python3-docutils-native \
     tiff \
 "
=20
@@ -38,7 +38,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.=
xz"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-$=
{PV}.tar.xz"
-SRC_URI[sha256sum] =3D "5547f2b9f006b133993e070b87c17804e051efda3913feac=
a1108fa2be41e24d"
+SRC_URI[sha256sum] =3D "8ef538778c82c09870a6cc325195049caec5593c1ca37df9=
15a7b6b10f5524ea"
=20
 S =3D "${WORKDIR}/gtk-${PV}"
=20
@@ -56,7 +56,7 @@ GSETTINGS_PACKAGE:class-native =3D ""
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
-GTKDOC_MESON_OPTION =3D "documentation"
+GIDOCGEN_MESON_OPTION =3D "documentation"
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
=20
--=20
2.46.0


