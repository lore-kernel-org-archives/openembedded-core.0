Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FA9C30630
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 14:49:09 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.189376.1692283746037191646
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 07:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout11.t-online.de (Postfix) with SMTP id CB12C1C4C4;
	Thu, 17 Aug 2023 16:49:03 +0200 (CEST)
Received: from [192.168.178.58] ([79.219.235.94]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qWeJ4-0JpiiG0; Thu, 17 Aug 2023 16:49:02 +0200
Date: Thu, 17 Aug 2023 16:48:54 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] gtk4: upgrade 4.10.5 -> 4.12.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Message-Id: <IHIJZR.16XNVQ6SKCIP1@t-online.de>
In-Reply-To: <CAMKF1spOpBLBQ4ENJGdidsCHbX0faejtvrB7rWmwPFBQjP2ZJQ@mail.gmail.com>
References: <20230815145218.1561896-1-f_l_k@t-online.de>
	<CAMKF1spOpBLBQ4ENJGdidsCHbX0faejtvrB7rWmwPFBQjP2ZJQ@mail.gmail.com>
X-Mailer: geary/44.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-AEBoOGpAXk75H3WNeBjh"
X-TOI-EXPURGATEID: 150726::1692283742-1FFF716C-9E89123E/0/0 CLEAN NORMAL
X-TOI-MSGID: 403ddb1d-b535-497a-b01a-c6fcb834c1ed
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 14:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186323

--=-AEBoOGpAXk75H3WNeBjh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Sorry for the late reply. I was on the road yesterday.

I can't reproduce the issue unfortunately. That's because I've been=20
running my build host with a homebuilt yocto image for a couple of=20
weeks now to find runtime errors (and because it gets me better=20
hardware support). So far this is running very well, but I seem to have=20
a problem with libgcc-initial. When I want to use the clang toolchain,=20
libcxx-native aborts with:

| /home/flk/poky/build/tmp/hosttools/ld: cannot find crtbeginS.o: No=20
such file or directory
| /home/flk/poky/build/tmp/hosttools/ld: cannot find -lgcc: No such=20
file or directory
| /home/flk/poky/build/tmp/hosttools/ld: cannot find -lgcc: No such=20
file or directory
| clang-16: error: linker command failed with exit code 1 (use -v to=20
see the call)
| ninja: build stopped: subcommand failed.

Will have to look into this first. So far I have no idea what is going=20
on. In any case, at most I'd be able to hack this with a 'cast', but I=20
don't have enough knowledge of the gtk code to find the root cause

I think the best thing would be to create an issue at gitlab, but I'm a=20
bit afraid of that because I can't help if something needs to be tested=20
or if I should add more context.

In general this is an issue that should be fixed in gcc because this=20
seems to be indeed a bug.

Short term solutions might be to add -Wno-int-conversion to the cflags=20
for clang to make it less strict or to disable the experimental vulkan=20
support in gtk4 by default?

On Wed, Aug 16 2023 at 07:44:50 AM -07:00:00, Khem Raj=20
<raj.khem@gmail.com> wrote:
> clang finds more errors with this upgrade
>=20
> <https://errors.yoctoproject.org/Errors/Details/731552/>
>=20
> On Tue, Aug 15, 2023 at 7:52=E2=80=AFAM Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>>=20
>>  gtk.h: gtkscrollinfo.h was added, no change of license
>>  gdk.h: gdkpixbuf.h was deprecated, no change of license
>>=20
>>  update renamed build-options
>>=20
>>  Overview of Changes in 4.12.0, 05-08-2023
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>>  * List widgets:
>>   - Add scroll_to APIs
>>=20
>>  * GtkFileLauncher:
>>   - Add an always-ask property
>>=20
>>  * GtkTextView:
>>   - Make backspace behavior match GtkEntry
>>=20
>>  * gsk:
>>   - Fix handling of luminance in mask nodes
>>=20
>>  * Text rendering:
>>   - Automate the setting of gtk-hint-font-metrics from the
>>     scale factor. This improves font rendering in flatpaks
>>=20
>>  * Wayland:
>>   - Fix behavior of stylus buttons
>>   - Support suspended window state
>>=20
>>  * Vulkan:
>>   - Many improvements
>>=20
>>  * Tools:
>>   - Add gtk4-rendernode-tool
>>=20
>>  * Debugging:
>>   - Drop the GTK_DEBUG_TOUCHSCREEN flag
>>=20
>>  * Build:
>>   - Some build options have been renamed:
>>       gtk_doc -> documentation
>>       update_screenshots -> screenshots
>>     The old names still work
>>=20
>>  Overview of Changes in 4.11.4, 03-07-2023
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>>  * GtkFileChooser:
>>   - Default to sorting folders first
>>   - Fix a crash when visiting recent files
>>=20
>>  * GtkTextView:
>>   - Fix corner cases in word navigation
>>=20
>>  * GtkMenuButton:
>>   - Normalize label layout
>>=20
>>  * GtkDropDown:
>>   - Add support for sections
>>=20
>>  * GtkVideo:
>>   - Make the overlay icon clickable
>>=20
>>  * GtkWindow:
>>   - Clear the resize cursors to avoid artifacts
>>=20
>>  * GtkFileDialog:
>>   - Always set initial-folder
>>=20
>>  * GtkDropDown:
>>   - Update on expression changes
>>=20
>>  * GtkMapListModel:
>>   - Implement GtkSectionModel
>>=20
>>  * Accessibility:
>>   - Improvements all over the place: GtkButton, GtkPasswordEntry,
>>     GtkFontChooserDialog, GtkColorChooserDialog, GtkShortcutsWindow,
>>     GtkMenuButton, GtkAboutDialog, GtkFileChooserDialog,=20
>> GtkStackSidebar,
>>     GtkStackSwitcher, GtkMediaControls, GtkColorDialogButton,=20
>> GtkDropDown,
>>     GtkInfoBar, GtkNotebook, GtkPrintUnixDialog, GtkModelButton
>>   - Make name computation follow the ARIA spec more closely
>>   - Adapt name computation for the common 'nested button' scenario
>>   - Change many containers to use `generic` instead of `group`
>>   - Use `generic` as the default role
>>   - Use `application` instead of `window` for windows
>>   - Add properties for accessible names of not directly exposed
>>     widgets in GtkListView, GtkGridView and GtkColumnView
>>=20
>>  * DND:
>>   - Fix criticals when drops are rejected
>>=20
>>  * X11:
>>   - Fix regressions in GLX setup
>>=20
>>  * Windows:
>>   - Center newly created transient windows
>>=20
>>  * Vulkan:
>>   - Add antialising for gradients
>>   - Do less work on clipped away nodes
>>   - Redo image uploading
>>   - Support different image depths and formats
>>   - Add a pipeline cache
>>=20
>>  * Demos:
>>   - gtk4-demo: Improve window sizing
>>   - gtk4-demo: Improve focus behavior
>>   - gtk4-demo: Add many missing a11y properties
>>=20
>>  * Tools:
>>   - gtk4-builder-tool: Make render an alias screenshot
>>=20
>>  * Inspector:
>>   - Show more information in the a11y tab
>>   - Add an accessibility overlay with warnings and recommendations
>>   - Limit the width of the a11y tab
>>=20
>>  * Build:
>>   - Require GLib 2.76
>>   - Make asan builds work again
>>   - Fix the build if ld is not ld.bdf
>>=20
>>  Overview of Changes in 4.11.3, 05-06-2023
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>>  * GtkGridView:
>>   - Respect css border-spacing
>>   - Don't leak the factories
>>=20
>>  * GtkListView:
>>   - Don't leak the factories
>>=20
>>  * GtkColumnView:
>>   - Support displaying sections
>>=20
>>  * GtkNotebook:
>>   - Make the pages model implement GtkSelectionModel
>>=20
>>  * GtkScrolledWindow:
>>   - Propagate child measure size whenever possible
>>=20
>>  * GtkPopoverMenu:
>>   - Avoid unnecessary left padding
>>=20
>>  * GtkSearchEntry:
>>   - Improve size allocation for the clear icon
>>=20
>>  * GtkBoxLayout:
>>   - Fix a regression from recent baseline work
>>=20
>>  * CSS:
>>   - Add new binding-friendly css provider apis
>>=20
>>  * Theme:
>>   - Show focus in the shortcuts window
>>=20
>>  * GDK:
>>   - Support grayscale and alpha texture formats for loading
>>     and saving to png and tiff, and in GL
>>   - Fix some regressions in GL context initialization
>>=20
>>  * GSK:
>>   - Support grayscale and alpha texture formats in the GL renderer
>>   - Support straight alpha textures in the GL renderer
>>   - Many improvements to the experimental Vulkan renderer
>>=20
>>  * Wayland:
>>   - Make exporting surface handles more flexible
>>=20
>>  * X11:
>>   - Trap XRandr errors
>>   - Stop using passive grabs during DND
>>=20
>>  * Windows:
>>   - Many cleanups and simplifications
>>=20
>>  * Tests:
>>   - Improve test coverage
>>=20
>>  * Build:
>>   - Some build options have been renamed:
>>       demos -> build-demos
>>       profile -> demo-profile
>>     The old names still work
>>=20
>>  * Deprecations:
>>   - gtk_css_provider_load_from_data
>>   - gdk_wayland_toplevel_unexport_handle
>>   - gdk_pixbuf_get_from_surface
>>   - gdk_pixbuf_get_from_texture
>>   - gtk_image_new_from_pixbuf
>>   - gtk_image_set_from_pixbuf
>>   - gtk_picture_new_for_pixbuf
>>   - gtk_picture_set_pixbuf
>>=20
>>  Overview of Changes in 4.11.2, 09-05-2023
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>>  * GtkGLArea:
>>   - Add an allowed-apis property
>>=20
>>  * GtkListBox:
>>   - Fix a problem with gtk_list_box_remove_all
>>=20
>>  * Add the GtkSectionModel interface, and implement it in most
>>    of our list models
>>=20
>>  * GtkListView:
>>   - Support displaying sections
>>=20
>>  * GtkCenterBox:
>>   - Add a shrink-center-last property
>>=20
>>  * GtkButton, GtkMenuButton:
>>   - Add a can-shrink property
>>=20
>>  * GtkPopover:
>>   - Fix problems with grabs
>>=20
>>  * GtkFileChooser:
>>   - Fix a problem with removing files
>>   - Make the date, time and location columns work
>>   - Fix filtering in the save entry popup
>>   - A few memory leak fixes
>>   - Handle webdav in the pathbar
>>=20
>>  * GtkBox:
>>   - Support baselines in vertical orientation with=20
>> GtkBox:baseline-child
>>=20
>>  * Dialogs:
>>   - Destroy windows promptly when the async callback finishes
>>   - Detect absence of the OpenURI portal and fall back
>>=20
>>  * Theme:
>>   - Add explicit style classes to a number of widgets
>>   - Fix some contrast issues in the dark theme
>>=20
>>  * Accessibility:
>>   - Fix alert dialogs in the a11y tree
>>   - Improve accessibility of GtkShortcutsWindow
>>=20
>>  * Layout:
>>   - Some fixes to baseline alignment
>>   - Separate GTK_ALIGN_BASELINE_CENTER and _FILL
>>=20
>>  * CSS:
>>   - Fix a crash with color transitions
>>=20
>>  * GSK:
>>   - Fix problems with negative scales
>>   - Improve scaling of offscreens for (cross-fades, masks, blends)
>>=20
>>  * GL:
>>   - Add GdkGLTextureBuilder, a more flexible api for creating=20
>> textures
>>   - Support setting update regions for GL textures
>>   - Ensure that we work with GLES 2
>>=20
>>  * Vulkan:
>>   - More fixes to the experimental Vulkan renderer
>>   - Rework glyph caching
>>=20
>>  * Wayland:
>>   - Don't destroy wl_surfaces on hide
>>   - Plug leaks of compositor-side resources
>>=20
>>  * X11:
>>   - Fix artifacts in gnome-shell frame decorations
>>=20
>>  * Windows:
>>   - Fix GL context initialization
>>=20
>>  * Inspector:
>>   - Improve the action list
>>   - Improve the accessibility pane
>>   - Fix a crash
>>=20
>>  * Tools:
>>   - gtk4-node-editor: Improve scaling
>>   - gtk4-node-editor: Preserve aspect ratio of textures
>>   - gtk4-node-editor: Add some smarter editing
>>   - gtk4-demo: Make the stylus demo work with mice
>>=20
>>  * Deprecations:
>>   - gtk_widget_get_allocated_width/height/baseline
>>   - GTK_ALIGN_BASELINE
>>=20
>>  Overview of Changes in 4.11.1, 03-04-2023
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>=20
>>  * GtkLabel, GtkLinkButton:
>>   - Make file:// <file:///> uris work again
>>=20
>>  * GtkListView/GtkColumnView/GtkGridView:
>>   - Fix clipping issues
>>   - Handle focus movement better
>>   - Introduce ::tab-behavior properties
>>   - Introduce GtkListItem::focusable
>>   - Introduce GtkColumnViewCell
>>   - Introduce row factories in GtkColumnView
>>   - Make list grid and column views inert when not rendering
>>=20
>>  * Drag-and-Drop:
>>   - Support resizing drag surfaces, using the new
>>     GdkDragSurface::compute-size signal
>>=20
>>  * Theme:
>>   - Port .boxed-list style from Adwaita
>>   - Make insensitive pictures appear grayed out
>>=20
>>  * Accessibility:
>>   - Fix memory leaks
>>   - Fix a crash
>>=20
>>  * GDK:
>>   - Add gdk_surface_get_scale to get the fractional scale
>>   - Use fractional scales on Wayland with cairo
>>   - Use fractional scales on Wayland with GL if=20
>> GDK_DEBUG=3Dgl-fractional
>>     is set. This support is still experimental
>>=20
>>  * GSK:
>>   - Allow limiting texture sizes with GSK_MAX_TEXTURE_SIZE
>>   - Use samplers for GL texture filtering
>>   - Fix problems with texture slicing
>>   - Avoid re-uploading textures when possible
>>   - Use mipmaps when it is beneficial
>>=20
>>  * Wayland:
>>   - Fix handling of Drag hotspots
>>   - Fix a crash with cursor size 0
>>   - Support absolute paths in WAYLAND_DISPLAY
>>   - Use the fractional scale protocol
>>   - Use a viewporter to set buffer scale
>>=20
>>  * Windows:
>>   - Fix problems with WGL
>>=20
>>  * Vulkan:
>>   - Some fixes to the experimental Vulkan renderer
>>   - Support fractional scaling
>>=20
>>  * Debugging:
>>   - Show more Wayland-specific information in the inspector
>>=20
>>  * Deprecations:
>>   - gtk_widget_translate_coordinates
>>   - gdk_surface_create_similar_surface
>>=20
>>  * Documentation:
>>   - Add a section on coordinate systems
>>=20
>>  * Build:
>>   - Require wayland-protocols 1.31
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   .../gtk+/{gtk4_4.10.5.bb =3D> gtk4_4.12.0.bb}            | 10=20
>> +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>   rename meta/recipes-gnome/gtk+/{gtk4_4.10.5.bb =3D> gtk4_4.12.0.bb}=20
>> (94%)
>>=20
>>  diff --git a/meta/recipes-gnome/gtk+/gtk4_4.10.5.bb=20
>> b/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
>>  similarity index 94%
>>  rename from meta/recipes-gnome/gtk+/gtk4_4.10.5.bb
>>  rename to meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
>>  index 85fff6c61e..4f38e0cb2c 100644
>>  --- a/meta/recipes-gnome/gtk+/gtk4_4.10.5.bb
>>  +++ b/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
>>  @@ -27,8 +27,8 @@ DEPENDS =3D " \
>>   LICENSE =3D "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-or-later"
>>   LIC_FILES_CHKSUM =3D " \
>>       file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522ec2=20
>> <file://copying;md5=3D5f30f0716dfdd0d91eb439ebec522ec2/> \
>>  -   =20
>> <file://gtk/gtk.h;endline=3D25;md5=3D1d8dc0fccdbfa26287a271dce88af737> \
>>  -   =20
>> <file://gdk/gdk.h;endline=3D25;md5=3Dc920ce39dc88c6f06d3e7c50e08086f2> \
>>  +   =20
>> <file://gtk/gtk.h;endline=3D25;md5=3D61900d77e8d5bc67cf15ad93de9a3490> \
>>  +   =20
>> <file://gdk/gdk.h;endline=3D25;md5=3Da0fb26c1f6b94e66d148279e192c333f> \
>>      =20
>> <file://tests/testgtk.c;endline=3D25;md5=3D49d06770681b8322466b52ed19d29=
fb2>=20
>> \
>>   "
>>=20
>>  @@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
>>   UPSTREAM_CHECK_REGEX =3D=20
>> "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
>>=20
>>   SRC_URI =3D=20
>> "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz=20
>> <http://ftp.gnome.org/pub/gnome/sources/gtk/$%7BMAJ_VER%7D/gtk-$%7BPV%7D=
.tar.xz>"
>>  -SRC_URI[sha256sum] =3D=20
>> "9bd5e437e41d48e3d6a224c336b0fd3fd490036dceb8956ed74b956369af609b"
>>  +SRC_URI[sha256sum] =3D=20
>> "a6d10829f405b1afc0b65e2a9642c04126a1d1b638d11c6d97426da4f84f1f6f"
>>=20
>>   S =3D "${WORKDIR}/gtk-${PV}"
>>=20
>>  @@ -53,11 +53,11 @@ GSETTINGS_PACKAGE:class-native =3D ""
>>=20
>>   ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>>   REQUIRED_DISTRO_FEATURES =3D "opengl"
>>  -GTKDOC_MESON_OPTION =3D "gtk_doc"
>>  +GTKDOC_MESON_OPTION =3D "documentation"
>>   GIR_MESON_ENABLE_FLAG =3D 'enabled'
>>   GIR_MESON_DISABLE_FLAG =3D 'disabled'
>>=20
>>  -EXTRA_OEMESON =3D " -Dbuild-tests=3Dfalse -Dbuild-testsuite=3Dfalse=20
>> -Ddemos=3Dfalse"
>>  +EXTRA_OEMESON =3D " -Dbuild-tests=3Dfalse -Dbuild-testsuite=3Dfalse=20
>> -Dbuild-demos=3Dfalse"
>>=20
>>   PACKAGECONFIG ??=3D "gstreamer ${@bb.utils.filter=20
>> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'wayland x11 vulkan',=20
>> d)}"
>>   PACKAGECONFIG:class-native =3D "${@bb.utils.filter=20
>> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'x11', d)}"
>>  --
>>  2.41.0
>>=20
>>=20
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#186069):=20
>> <https://lists.openembedded.org/g/openembedded-core/message/186069>
>>  Mute This Topic:=20
>> <https://lists.openembedded.org/mt/100759433/1997914>
>>  Group Owner: openembedded-core+owner@lists.openembedded.org=20
>> <mailto:openembedded-core+owner@lists.openembedded.org>
>>  Unsubscribe:=20
>> <https://lists.openembedded.org/g/openembedded-core/unsub>=20
>> [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20


--=-AEBoOGpAXk75H3WNeBjh
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><div>Sorry for the late reply. I w=
as on the road yesterday.</div><div><br></div><div>I can't reproduce the is=
sue unfortunately. That's because I've been running my build host with a ho=
mebuilt yocto image for a couple of weeks now to find runtime errors (and b=
ecause it gets me better hardware support). So far this is running very wel=
l, but I seem to have a problem with libgcc-initial. When I want to use the=
 clang toolchain, libcxx-native aborts with:</div><div><br></div><div>| /ho=
me/flk/poky/build/tmp/hosttools/ld: cannot find crtbeginS.o: No such file o=
r directory</div><div>| /home/flk/poky/build/tmp/hosttools/ld: cannot find =
-lgcc: No such file or directory</div><div>| /home/flk/poky/build/tmp/hostt=
ools/ld: cannot find -lgcc: No such file or directory</div><div>| clang-16:=
 error: linker command failed with exit code 1 (use -v to see the call)</di=
v><div>| ninja: build stopped: subcommand failed.</div><div><br></div><div>=
Will have to look into this first. So far I have no idea what is going on. =
In any case, at most I'd be able to hack this with a 'cast', but I don't ha=
ve enough knowledge of the gtk code to find the root cause</div><div><br></=
div><div>I think the best thing would be to create an issue at gitlab, but =
I'm a bit afraid of that because I can't help if something needs to be test=
ed or if I should add more context.</div><div><br></div><div>In general thi=
s is an issue that should be fixed in gcc because this seems to be indeed a=
 bug.</div></div><div><br></div><div>Short term solutions might be to add -=
Wno-int-conversion to the cflags for clang to make it less strict or to dis=
able the experimental vulkan support in gtk4 by default?</div></div><div id=
=3D"geary-quote" dir=3D"auto"><br>On Wed, Aug 16 2023 at 07:44:50 AM -07:00=
:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type=3D"cite=
"><div class=3D"plaintext" style=3D"white-space: break-spaces;">clang finds=
 more errors with this upgrade

<a href=3D"https://errors.yoctoproject.org/Errors/Details/731552/">https://=
errors.yoctoproject.org/Errors/Details/731552/</a>

On Tue, Aug 15, 2023 at 7:52=E2=80=AFAM Markus Volk &lt;<a href=3D"mailto:f=
_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 gtk.h: gtkscrollinfo.h was added, no change of license
 gdk.h: gdkpixbuf.h was deprecated, no change of license

 update renamed build-options

 Overview of Changes in 4.12.0, 05-08-2023
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * List widgets:
  - Add scroll_to APIs

 * GtkFileLauncher:
  - Add an always-ask property

 * GtkTextView:
  - Make backspace behavior match GtkEntry

 * gsk:
  - Fix handling of luminance in mask nodes

 * Text rendering:
  - Automate the setting of gtk-hint-font-metrics from the
    scale factor. This improves font rendering in flatpaks

 * Wayland:
  - Fix behavior of stylus buttons
  - Support suspended window state

 * Vulkan:
  - Many improvements

 * Tools:
  - Add gtk4-rendernode-tool

 * Debugging:
  - Drop the GTK_DEBUG_TOUCHSCREEN flag

 * Build:
  - Some build options have been renamed:
      gtk_doc -&gt; documentation
      update_screenshots -&gt; screenshots
    The old names still work

 Overview of Changes in 4.11.4, 03-07-2023
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * GtkFileChooser:
  - Default to sorting folders first
  - Fix a crash when visiting recent files

 * GtkTextView:
  - Fix corner cases in word navigation

 * GtkMenuButton:
  - Normalize label layout

 * GtkDropDown:
  - Add support for sections

 * GtkVideo:
  - Make the overlay icon clickable

 * GtkWindow:
  - Clear the resize cursors to avoid artifacts

 * GtkFileDialog:
  - Always set initial-folder

 * GtkDropDown:
  - Update on expression changes

 * GtkMapListModel:
  - Implement GtkSectionModel

 * Accessibility:
  - Improvements all over the place: GtkButton, GtkPasswordEntry,
    GtkFontChooserDialog, GtkColorChooserDialog, GtkShortcutsWindow,
    GtkMenuButton, GtkAboutDialog, GtkFileChooserDialog, GtkStackSidebar,
    GtkStackSwitcher, GtkMediaControls, GtkColorDialogButton, GtkDropDown,
    GtkInfoBar, GtkNotebook, GtkPrintUnixDialog, GtkModelButton
  - Make name computation follow the ARIA spec more closely
  - Adapt name computation for the common 'nested button' scenario
  - Change many containers to use `generic` instead of `group`
  - Use `generic` as the default role
  - Use `application` instead of `window` for windows
  - Add properties for accessible names of not directly exposed
    widgets in GtkListView, GtkGridView and GtkColumnView

 * DND:
  - Fix criticals when drops are rejected

 * X11:
  - Fix regressions in GLX setup

 * Windows:
  - Center newly created transient windows

 * Vulkan:
  - Add antialising for gradients
  - Do less work on clipped away nodes
  - Redo image uploading
  - Support different image depths and formats
  - Add a pipeline cache

 * Demos:
  - gtk4-demo: Improve window sizing
  - gtk4-demo: Improve focus behavior
  - gtk4-demo: Add many missing a11y properties

 * Tools:
  - gtk4-builder-tool: Make render an alias screenshot

 * Inspector:
  - Show more information in the a11y tab
  - Add an accessibility overlay with warnings and recommendations
  - Limit the width of the a11y tab

 * Build:
  - Require GLib 2.76
  - Make asan builds work again
  - Fix the build if ld is not ld.bdf

 Overview of Changes in 4.11.3, 05-06-2023
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * GtkGridView:
  - Respect css border-spacing
  - Don't leak the factories

 * GtkListView:
  - Don't leak the factories

 * GtkColumnView:
  - Support displaying sections

 * GtkNotebook:
  - Make the pages model implement GtkSelectionModel

 * GtkScrolledWindow:
  - Propagate child measure size whenever possible

 * GtkPopoverMenu:
  - Avoid unnecessary left padding

 * GtkSearchEntry:
  - Improve size allocation for the clear icon

 * GtkBoxLayout:
  - Fix a regression from recent baseline work

 * CSS:
  - Add new binding-friendly css provider apis

 * Theme:
  - Show focus in the shortcuts window

 * GDK:
  - Support grayscale and alpha texture formats for loading
    and saving to png and tiff, and in GL
  - Fix some regressions in GL context initialization

 * GSK:
  - Support grayscale and alpha texture formats in the GL renderer
  - Support straight alpha textures in the GL renderer
  - Many improvements to the experimental Vulkan renderer

 * Wayland:
  - Make exporting surface handles more flexible

 * X11:
  - Trap XRandr errors
  - Stop using passive grabs during DND

 * Windows:
  - Many cleanups and simplifications

 * Tests:
  - Improve test coverage

 * Build:
  - Some build options have been renamed:
      demos -&gt; build-demos
      profile -&gt; demo-profile
    The old names still work

 * Deprecations:
  - gtk_css_provider_load_from_data
  - gdk_wayland_toplevel_unexport_handle
  - gdk_pixbuf_get_from_surface
  - gdk_pixbuf_get_from_texture
  - gtk_image_new_from_pixbuf
  - gtk_image_set_from_pixbuf
  - gtk_picture_new_for_pixbuf
  - gtk_picture_set_pixbuf

 Overview of Changes in 4.11.2, 09-05-2023
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * GtkGLArea:
  - Add an allowed-apis property

 * GtkListBox:
  - Fix a problem with gtk_list_box_remove_all

 * Add the GtkSectionModel interface, and implement it in most
   of our list models

 * GtkListView:
  - Support displaying sections

 * GtkCenterBox:
  - Add a shrink-center-last property

 * GtkButton, GtkMenuButton:
  - Add a can-shrink property

 * GtkPopover:
  - Fix problems with grabs

 * GtkFileChooser:
  - Fix a problem with removing files
  - Make the date, time and location columns work
  - Fix filtering in the save entry popup
  - A few memory leak fixes
  - Handle webdav in the pathbar

 * GtkBox:
  - Support baselines in vertical orientation with GtkBox:baseline-child

 * Dialogs:
  - Destroy windows promptly when the async callback finishes
  - Detect absence of the OpenURI portal and fall back

 * Theme:
  - Add explicit style classes to a number of widgets
  - Fix some contrast issues in the dark theme

 * Accessibility:
  - Fix alert dialogs in the a11y tree
  - Improve accessibility of GtkShortcutsWindow

 * Layout:
  - Some fixes to baseline alignment
  - Separate GTK_ALIGN_BASELINE_CENTER and _FILL

 * CSS:
  - Fix a crash with color transitions

 * GSK:
  - Fix problems with negative scales
  - Improve scaling of offscreens for (cross-fades, masks, blends)

 * GL:
  - Add GdkGLTextureBuilder, a more flexible api for creating textures
  - Support setting update regions for GL textures
  - Ensure that we work with GLES 2

 * Vulkan:
  - More fixes to the experimental Vulkan renderer
  - Rework glyph caching

 * Wayland:
  - Don't destroy wl_surfaces on hide
  - Plug leaks of compositor-side resources

 * X11:
  - Fix artifacts in gnome-shell frame decorations

 * Windows:
  - Fix GL context initialization

 * Inspector:
  - Improve the action list
  - Improve the accessibility pane
  - Fix a crash

 * Tools:
  - gtk4-node-editor: Improve scaling
  - gtk4-node-editor: Preserve aspect ratio of textures
  - gtk4-node-editor: Add some smarter editing
  - gtk4-demo: Make the stylus demo work with mice

 * Deprecations:
  - gtk_widget_get_allocated_width/height/baseline
  - GTK_ALIGN_BASELINE

 Overview of Changes in 4.11.1, 03-04-2023
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 * GtkLabel, GtkLinkButton:
  - Make <a href=3D"file://">file://</a> uris work again

 * GtkListView/GtkColumnView/GtkGridView:
  - Fix clipping issues
  - Handle focus movement better
  - Introduce ::tab-behavior properties
  - Introduce GtkListItem::focusable
  - Introduce GtkColumnViewCell
  - Introduce row factories in GtkColumnView
  - Make list grid and column views inert when not rendering

 * Drag-and-Drop:
  - Support resizing drag surfaces, using the new
    GdkDragSurface::compute-size signal

 * Theme:
  - Port .boxed-list style from Adwaita
  - Make insensitive pictures appear grayed out

 * Accessibility:
  - Fix memory leaks
  - Fix a crash

 * GDK:
  - Add gdk_surface_get_scale to get the fractional scale
  - Use fractional scales on Wayland with cairo
  - Use fractional scales on Wayland with GL if GDK_DEBUG=3Dgl-fractional
    is set. This support is still experimental

 * GSK:
  - Allow limiting texture sizes with GSK_MAX_TEXTURE_SIZE
  - Use samplers for GL texture filtering
  - Fix problems with texture slicing
  - Avoid re-uploading textures when possible
  - Use mipmaps when it is beneficial

 * Wayland:
  - Fix handling of Drag hotspots
  - Fix a crash with cursor size 0
  - Support absolute paths in WAYLAND_DISPLAY
  - Use the fractional scale protocol
  - Use a viewporter to set buffer scale

 * Windows:
  - Fix problems with WGL

 * Vulkan:
  - Some fixes to the experimental Vulkan renderer
  - Support fractional scaling

 * Debugging:
  - Show more Wayland-specific information in the inspector

 * Deprecations:
  - gtk_widget_translate_coordinates
  - gdk_surface_create_similar_surface

 * Documentation:
  - Add a section on coordinate systems

 * Build:
  - Require wayland-protocols 1.31

 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
  .../gtk+/{gtk4_4.10.5.bb =3D&gt; gtk4_4.12.0.bb}            | 10 +++++---=
--
  1 file changed, 5 insertions(+), 5 deletions(-)
  rename meta/recipes-gnome/gtk+/{gtk4_4.10.5.bb =3D&gt; gtk4_4.12.0.bb} (9=
4%)

 diff --git a/meta/recipes-gnome/gtk+/gtk4_4.10.5.bb b/meta/recipes-gnome/g=
tk+/gtk4_4.12.0.bb
 similarity index 94%
 rename from meta/recipes-gnome/gtk+/gtk4_4.10.5.bb
 rename to meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
 index 85fff6c61e..4f38e0cb2c 100644
 --- a/meta/recipes-gnome/gtk+/gtk4_4.10.5.bb
 +++ b/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
 @@ -27,8 +27,8 @@ DEPENDS =3D " \
  LICENSE =3D "LGPL-2.0-only &amp; LGPL-2.0-or-later &amp; LGPL-2.1-or-late=
r"
  LIC_FILES_CHKSUM =3D " \
      <a href=3D"file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522ec2">fil=
e://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522ec2</a> \
 -    <a href=3D"file://gtk/gtk.h;endline=3D25;md5=3D1d8dc0fccdbfa26287a271=
dce88af737">file://gtk/gtk.h;endline=3D25;md5=3D1d8dc0fccdbfa26287a271dce88=
af737</a> \
 -    <a href=3D"file://gdk/gdk.h;endline=3D25;md5=3Dc920ce39dc88c6f06d3e7c=
50e08086f2">file://gdk/gdk.h;endline=3D25;md5=3Dc920ce39dc88c6f06d3e7c50e08=
086f2</a> \
 +    <a href=3D"file://gtk/gtk.h;endline=3D25;md5=3D61900d77e8d5bc67cf15ad=
93de9a3490">file://gtk/gtk.h;endline=3D25;md5=3D61900d77e8d5bc67cf15ad93de9=
a3490</a> \
 +    <a href=3D"file://gdk/gdk.h;endline=3D25;md5=3Da0fb26c1f6b94e66d14827=
9e192c333f">file://gdk/gdk.h;endline=3D25;md5=3Da0fb26c1f6b94e66d148279e192=
c333f</a> \
      <a href=3D"file://tests/testgtk.c;endline=3D25;md5=3D49d06770681b8322=
466b52ed19d29fb2">file://tests/testgtk.c;endline=3D25;md5=3D49d06770681b832=
2466b52ed19d29fb2</a> \
  "

 @@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
  UPSTREAM_CHECK_REGEX =3D "gtk-(?P&lt;pver&gt;\d+\.(\d*[02468])+(\.\d+)+)\=
.tar.xz"

  SRC_URI =3D "<a href=3D"http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_=
VER}/gtk-${PV}.tar.xz">http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER=
}/gtk-${PV}.tar.xz</a>"
 -SRC_URI[sha256sum] =3D "9bd5e437e41d48e3d6a224c336b0fd3fd490036dceb8956ed=
74b956369af609b"
 +SRC_URI[sha256sum] =3D "a6d10829f405b1afc0b65e2a9642c04126a1d1b638d11c6d9=
7426da4f84f1f6f"

  S =3D "${WORKDIR}/gtk-${PV}"

 @@ -53,11 +53,11 @@ GSETTINGS_PACKAGE:class-native =3D ""

  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
  REQUIRED_DISTRO_FEATURES =3D "opengl"
 -GTKDOC_MESON_OPTION =3D "gtk_doc"
 +GTKDOC_MESON_OPTION =3D "documentation"
  GIR_MESON_ENABLE_FLAG =3D 'enabled'
  GIR_MESON_DISABLE_FLAG =3D 'disabled'

 -EXTRA_OEMESON =3D " -Dbuild-tests=3Dfalse -Dbuild-testsuite=3Dfalse -Ddem=
os=3Dfalse"
 +EXTRA_OEMESON =3D " -Dbuild-tests=3Dfalse -Dbuild-testsuite=3Dfalse -Dbui=
ld-demos=3Dfalse"

  PACKAGECONFIG ??=3D "gstreamer <a href=3D"mailto:${@bb.utils.filter">${@b=
b.utils.filter</a>('DISTRO_FEATURES', 'wayland x11 vulkan', d)}"
  PACKAGECONFIG:class-native =3D "<a href=3D"mailto:${@bb.utils.filter">${@=
bb.utils.filter</a>('DISTRO_FEATURES', 'x11', d)}"
 --
 2.41.0


 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
 Links: You receive all messages sent to this group.
 View/Reply Online (#186069): <a href=3D"https://lists.openembedded.org/g/o=
penembedded-core/message/186069">https://lists.openembedded.org/g/openembed=
ded-core/message/186069</a>
 Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100759433/19=
97914">https://lists.openembedded.org/mt/100759433/1997914</a>
 Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.=
org">openembedded-core+owner@lists.openembedded.org</a>
 Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core=
/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hr=
ef=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</blockquote></div></blockquote></div>
--=-AEBoOGpAXk75H3WNeBjh--


