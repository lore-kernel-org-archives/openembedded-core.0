Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E651EE498A
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 09:55:03 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.18201.1726048495287933761
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 02:54:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout01.t-online.de (Postfix) with SMTP id 5FEF712A7F
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 11:54:53 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.60]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1soK3p-2L0Gyf0; Wed, 11 Sep 2024 11:54:53 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [master-next][oe-core][v2PATCH] gtk4: update 4.14.5 -> 4.16.0
Date: Wed, 11 Sep 2024 11:56:30 +0200
Message-ID: <20240911095630.4846-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726048493-557F84AB-89E3C452/0/0 CLEAN NORMAL
X-TOI-MSGID: 7152e447-58ed-46f2-883b-af2818703139
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 09:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204376

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

Overview of Changes in 4.15.6, 08-26-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkCheckButton:
 - Add a grouped style class for radio buttons

* GtkScale:
 - Fix alignment and positioning problems

* Css:
 - Fix crashes in the variable support

* Gsk:
 - Make graphics offloading work better with kwin
 - Make colorstate transfer functions more robust
 - GC dead textures more agressively
 - Only use a single render pass per frame

* GL:
 - Round damage rectangles properly
 - Use the shared context when creating textures
 - Fix a file descriptor leak in dmabuf export

* Vulkan:
 - Round damage rectangles properly

* Wayland:
 - Work with the kwin implementation of xx-color-management-v4

* Windows:
 - Make gtk_show_uri use SHOpenWithDialog()
 - Enable incremental rendering with WGL

* Macos:
 - Open context menus on Ctrl-left click

* Debugging:
 - Show color state information in the inspector
 - Collect input event traces in the recorder
 - Add shortcuts for toggling recording: Super-r
   and for screenshots: Super-c
 - Split the GDK_DEBUG env var into GDK_DEBUG and GDK_DISABLE
 - Add GDK_DISABLE=3Dcolor-mgmt and GDK_DISABLE=3Doffload

* Tools:
 - Add a 'Paste as node' action in gtk4-node-editor

* Translations updates
 Basque
 Belarusian
 Brazilian Portuguese
 Chinese (China)
 Georgian
 Hebrew
 Hindi
 Russian
 Slovenian
 Turkish
 Ukrainian

Overview of Changes in 4.15.5, 11-08-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkTextView:
 - ADd GtkTextBufferCommitNotify

* CSS:
 - Propagate color state information to GSK for many features:
   colors, borders, shadows, text

* Gdk:
 - Fix an fd leak in the Vulkan code
 - Fix a leak of EGLSurfaces and DMA buffers
 - Set the opaque region of surfaces automatically based on their content

* Gsk:
 - Fix Emoji rendering in Vulkan
 - Rework color handling to take color states into account
 - Implement more powerful occlusion culling
 - Minimize our use of renderpasses

* Macos:
 - Fix window transparency

* Debugging:
 - The inspector shows details about color states

* Deprecations:
 - gdk_draw_context_begin/end_frame
 - gdk_surface_set_opaque_region

* Build:
 - Require gstreamer 1.24

* Translation updates
 Romanian

Overview of Changes in 4.15.4, 30-07-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkPopover:
 - Fix size allocation with wrapping labels

* GtkColumnView:
 - Check column visibility when measuring

* CSS:
 - Fix fallout from recent changes
 - Make implementation of currentcolor inheritance match browsers

* Gdk:
 - Introduce GdkColorState for encoding color space information
   Currently, we support srgb, srgb-linear, rec2100-pq and rec2100-linear
 - Add color states to GdkTexture, as well as to the texture builder
   and downloader objects, and convert as necessary
 - Add GdkMemoryTextureBuilder
 - Attach color states when loading or saving textures
 - Add GdkCicpParams to create color state objects for cicp tuples
 - Drop GDK_DEBUG=3Dvulkan-validate
   Use VK_INSTEANCE_LAYERS=3DVK_LAYER_KHRONOS_validation instead

* Gsk:
 - Improve caching of glyphs and textures
 - Remove the uber shader
 - Numerous bug fixes
 - Fix corner cases in offload handling
 - Implement occlusion culling for opaque content
 - Allow offloading (some) transformed textures
 - Take colorstate into account when compositing
 - Add GDK_DEBUG=3Dlinear to opt into linear compositing
 - Implement tiling for large textures
 - Stop using descriptors and go back to simpler texture
   management that should work better with older GL
 - Use correct shader clip mode for glyphs
 - Improve shadow rendering

* Media:
 - Attach color states to textures obtained from gstreamer

* Wayland:
 - Allow offloading GL textures via dmabuf export
 - Suppot the xx-color-management-v4 protocol

* Deprecations:
 - GskGLShader and the render node

* Tools:
 - Improve the rendernode tool extract command
 - Add an image tool that is about manipulating textures

* Build:
 - GTK now requires a C11 compiler

* Translation updates
 Georgian
 Hebrew
 Hindi
 Occitan
 Slovenian

Overview of Changes in 4.15.3, 29-06-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Accessibility:
 - Only emit notifications when cursor positions change in GtkText
 - Fix handling of help text properties

* CSS:
 - Fix some crashes introduced in recent currentcolor changes

* DND:
 - Avoid a critical

* Documentation:
 - Fix many oversights and missing docs

* maxOS:
 - Add native keyboard shortcuts

Overview of Changes in 4.15.2, 28-06-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkFileChooserWidget:
 - Plug some memory leaks
 - Make Ctrl-Shift-N create a new folder

* GtkPopover:
 - Handle resizing and position changes better

* CSS:
 - Support color(), oklab(), etc (https://www.w3.org/TR/css-color-4/)
 - Support color-mix() (https://www.w3.org/TR/css-color-5/)
 - Support relative colors (https://www.w3.org/TR/css-color-5/)
 - Support more colorspaces in color()
 - Allow percentages for opacity
 - Handle currentcolor more correctly

* Accessibility:
 - Avoid markup when reading labels

* GSK:
 - Subset fonts when serializing node trees
 - Make ngl export render_texture results as dmabufs

* Wayland:
 - Use xdg-dialog protocol for attached dialogs

* Windows:
 - Build with UNICODE

* macOS:
 - Implement fullscreen-on-monitor

* Documentation:
 - Widget shortcuts and actions are now described in the docs

* Debugging:
 - Add GTK_DEBUG=3Dcss for warning about deprecated css syntax

* Tools:
 - rendernode-tool: Add an extract command for data urls

* Deprecations:
 - CSS Color functions shade(), lighter(), darker(), alpha(), mix()

* Translation updates:
 Czech
 Hebrew
 Serbian

Overview of Changes in 4.15.1, 21-05-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* GtkGraphicsOffload:
 - Don't crash without a child

* GtkSpinner:
 - Don't animate when unmapped

* CSS:
 - Support the :root selector
 - Support variables and custom properties (https://www.w3.org/TR/css-var=
iables-1/)
 - Implement math functions (https://www.w3.org/TR/css-values-4/)
 - Support modern syntax and calc in rgb() and hsl()

* Icontheme:
 - Make symbolic svg loading more efficient
 - Handle color-free symbolics more efficiently

* Accessibility:
 - Make the gtk-demo sidebar search more accessible
 - Stop emitting focus events
 - Realize child contexts when necessary

* GDK:
 - Support XDG_ACTIVATION_TOKEN
 - dmabuf: Be more defensive when importing unknown formats to GL
 - dmabuf: Use narrow range for YUV
 - vulkan: Recreate swapchains when necessary or beneficial

* GSK:
 - Improve logging for GDK_DEBUG=3Doffload
 - Improve logging for GSK_DEBUG=3Drenderer
 - gpu: Warn about inefficient texture import
 - gpu: Handle tiny offscreens correctly
 - vulkan: Add profiler marks in various places
 - vulkan: Fix a problem with imported dmabufs showing up black
 - cairo: Speed up mask nodes, since we use them for symbolic icons

* Wayland:
 - Use wl_compositor version 6

* X11:
 - Implement a missing method

* Build:
 - Fix many ubsan warnings

* Debugging:
 - Show more texture details in the recorder
 - Use GTK_DEBUG=3Dcss to see CSS deprecations

* macOS:
 - Fix problems with events handed back to the OS
 - Respect GDK_DEBUG=3Ddefault-settings
 - Allow applictions to handle Dock > Quit

* Deprecations:
 - Use of @name colors in CSS

* Translation updates:
 Catalan
 Georgian
 Hungarian
 Korean
 Portuguese
 Turkish

Overview of Changes in 4.15.0, 21-04-2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This release changes the default GSK renderer to be Vulkan, on
Wayland. Other platforms still use ngl.

The intent of this change is to get wider testing and verify that
Vulkan drivers are good enough for us to rely on. If significant
problems show up, we will revert this change for 4.16.

You can still override the renderer choice using the GSK_RENDERER
environment variable.

---

This release also changes font rendering settings by introducing
a new high-level gtk-font-rendering settings which gives GTK more
freedom to decide on font rendering.

You can still use the low-level font-related settings by changing
the new property to 'manual'.

---

* GtkColumnView:
 - Fix infinite loops in dispose
 - Fix problems with weak ref cycles in GtkExpression

* GtkListView:
* GtkShortcutManager:
 - Track the propagation phase of added controllers

* GtkGLArea:
 - Produce dmabuf textures, so graphics offload is possible

* GtkTextView:
 - Support text shadows

* GtkGraphicsOffload:
 - Add a black-background property

* Settings:
 - Add a new gtk-font-rendering setting

* Accessibility:
 - Add support for GetRangeExtents to GtkAccessibleText
 - Add support for GetOffsetAtPoint to GtkAccessibleText
 - Implement GtkAccessibleRange for scrollbars

* GDK:
 - Add a callback-based cursor API

* GSK:
-  Use the Vulkan renderer by default
 - Avoid an infinite recursion with offscreens in some cases
 - Optimize graphics offload to make it more likely that compositors
   can use direct scanout

* X11:
 - Fix some confusing debug messages
 - Drop a no-longer-relevant optimization that was interfering with
   getting the current window manager capabilities

* macOS:
 - Implement the color picker for macOS 10.15+

* Debugging:
 - Snow monitor resolution in the inspector

* Demos:
 - Use graphics offload in the shadertoy demo
 - Show more reliable fps numbers in the fishbowl demo

* Tools:
 - Support generating pdf in gtk4-rendernode-tool

* Build:
 - Require pango 1.52
 - Require cairo 1.18
 - Add a missing dependency that was causing build failures
 - Drop deprecated build options:
   gtk_doc -> documentation
   update_screenshots -> screenshots
   demo-profile -> profile
   demos -> build-demos

* Deprecations:
 - gdk_widget_set/get_font_options
 - gdk_wayland/x11_display_set_cursor_theme

* Translation updates:
 Basque
 Brazilian Portuguese
 British English
 Chinese (China)
 Hebrew
 Kabyle
 Persian
 Polish
 Russian
 Slovenian
 Swedish
 Turkish

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


