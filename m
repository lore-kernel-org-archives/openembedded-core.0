Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAB8EE4993
	for <webhook@archiver.kernel.org>; Sun, 20 Aug 2023 14:54:38 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.29800.1692543271701101854
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Aug 2023 07:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=k4/V0OLG;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-56ced49d51aso1394860eaf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Aug 2023 07:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692543271; x=1693148071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QwXCPzbmn6Zmehr+TvgIibKNKwMgketOWi/AoS+8OEI=;
        b=k4/V0OLGrFGZlSofm7g4Ja1Fzu5VLGK55xiRG1wjOmm28/RPYw18Hlb2cLn/6O/Yq2
         okvKrv8HZ3t2GBuX4HCCWmHC1ec6p6yTGOiH+0/t2Vfm0WoiVG73arw2+JRWAjLBGS+Q
         BGBmQcW2ppbpKr+850KnSjjLBHf+4XFSPOOWh5NDDsjKQXWDIFdsWNfxif2/O3teXext
         9Lxyfi6Q9+6xH65QTPsDi4yK+W9V4wThoPjKSWWVjbweG8nNN7goK6Yi7vy04wDZ6rsp
         FVjp1Cp+qlJyM3KOM01r12kSq7wp0vxKXL9yKUthP4hOiGYwv/WUIqEnOn+PYLHye4gJ
         tnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692543271; x=1693148071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwXCPzbmn6Zmehr+TvgIibKNKwMgketOWi/AoS+8OEI=;
        b=EfWeemJ3eDwv6j6tMsa+gNABjBr73KLdbNGtOB6fLRdlDhrP+MrKHN53/9UiJ5959r
         ROoMCvxC59P1Ax75hxt61gkW5fT/OoDSPvKGhJWd8AIVeEs0uj7k2rk7hcqlk+QHDF0x
         6Ccm/OkPnLrnzs/f4GM5bFzIzEDtrpZfPk+oSUuWf1KUAWZ2LlI2/2yWnBhlwlugns4a
         SoNxTiQ8cbyIBYvCjvWnnDSeochvM8L76vGUSqL083QoOaJpcHyD4dqcE3wISw/s4rO0
         y3Av731VKkGc2VgYeIoNe+bLiDD/8DLHsarZI+3uRF8d0PYQtpdUZvca1s/qcYe1TjTD
         l8rg==
X-Gm-Message-State: AOJu0YyM2Ai2Uds2yhbIDfH6fGxM01fQ24VF4GQbo2DU1324b68x9svx
	8ZEDEmDBZrX7SQoFF8XIlWvYPy2E7E4lKfWvjJTY8SKmdIo=
X-Google-Smtp-Source: AGHT+IGQEv3IESg+SvV4mNqNsDEWP4qQEczZfkoilo7c45/OIz9PI2Ugh4izDKe26zL2bkBDdK3AkRJ1l8GMt3qgxEQ=
X-Received: by 2002:a4a:de15:0:b0:56d:fa76:be31 with SMTP id
 y21-20020a4ade15000000b0056dfa76be31mr3171498oot.1.1692543270771; Sun, 20 Aug
 2023 07:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230815145218.1561896-1-f_l_k@t-online.de> <CAMKF1spOpBLBQ4ENJGdidsCHbX0faejtvrB7rWmwPFBQjP2ZJQ@mail.gmail.com>
 <IHIJZR.16XNVQ6SKCIP1@t-online.de> <CAMKF1srb01=gFUx8CFh7seoNuN7yDP4m9DQfu2GsCLtCMMw66Q@mail.gmail.com>
In-Reply-To: <CAMKF1srb01=gFUx8CFh7seoNuN7yDP4m9DQfu2GsCLtCMMw66Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Aug 2023 07:54:19 -0700
Message-ID: <CAMKF1sqJz9y7BT+QbnrrFZVGUwh_17UKYfJ4+6_+7iXPR3hB+Q@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] gtk4: upgrade 4.10.5 -> 4.12.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006be0e806035bf005"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Aug 2023 14:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186412

--0000000000006be0e806035bf005
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 19, 2023 at 10:24 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Aug 17, 2023 at 7:49=E2=80=AFAM Markus Volk <f_l_k@t-online.de> w=
rote:
> >
> > Sorry for the late reply. I was on the road yesterday.
> >
> > I can't reproduce the issue unfortunately. That's because I've been
> running my build host with a homebuilt yocto image for a couple of weeks
> now to find runtime errors (and because it gets me better hardware
> support). So far this is running very well, but I seem to have a problem
> with libgcc-initial. When I want to use the clang toolchain, libcxx-nativ=
e
> aborts with:
> >
> > | /home/flk/poky/build/tmp/hosttools/ld: cannot find crtbeginS.o: No
> such file or directory
> > | /home/flk/poky/build/tmp/hosttools/ld: cannot find -lgcc: No such fil=
e
> or directory
> > | /home/flk/poky/build/tmp/hosttools/ld: cannot find -lgcc: No such fil=
e
> or directory
> > | clang-16: error: linker command failed with exit code 1 (use -v to se=
e
> the call)
> > | ninja: build stopped: subcommand failed.


Ok the cmdline looks normal what=E2=80=99s the install location of these fi=
les
above



>
> while it is interesting that you are using OE based distro on your
> build host, its not a combination thats commonly tested. Especially in
> native libcxx case, its using
> clang-native with runtime from build host and I am sure thats where
> problem is perhaps some paths are being detected wrong. Clang does
> encode distro information
> into its driver. Can you post full log of failed task may be it has
> some hints. It will be also good to see the output of failing linker
> cmdline with --verbose option, it will
> show what paths clang driver is looking for runtime stuff.
>
> >
> > Will have to look into this first. So far I have no idea what is going
> on. In any case, at most I'd be able to hack this with a 'cast', but I
> don't have enough knowledge of the gtk code to find the root cause
> >
> > I think the best thing would be to create an issue at gitlab, but I'm a
> bit afraid of that because I can't help if something needs to be tested o=
r
> if I should add more context.
> >
> > In general this is an issue that should be fixed in gcc because this
> seems to be indeed a bug.
> >
> > Short term solutions might be to add -Wno-int-conversion to the cflags
> for clang to make it less strict or to disable the experimental vulkan
> support in gtk4 by default?
> >
> > On Wed, Aug 16 2023 at 07:44:50 AM -07:00:00, Khem Raj <
> raj.khem@gmail.com> wrote:
> >
> > clang finds more errors with this upgrade
> https://errors.yoctoproject.org/Errors/Details/731552/ On Tue, Aug 15,
> 2023 at 7:52=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wrote:
> >
> > gtk.h: gtkscrollinfo.h was added, no change of license gdk.h:
> gdkpixbuf.h was deprecated, no change of license update renamed
> build-options Overview of Changes in 4.12.0, 05-08-2023
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D * List widgets: - Add s=
croll_to
> APIs * GtkFileLauncher: - Add an always-ask property * GtkTextView: - Mak=
e
> backspace behavior match GtkEntry * gsk: - Fix handling of luminance in
> mask nodes * Text rendering: - Automate the setting of
> gtk-hint-font-metrics from the scale factor. This improves font rendering
> in flatpaks * Wayland: - Fix behavior of stylus buttons - Support suspend=
ed
> window state * Vulkan: - Many improvements * Tools: - Add
> gtk4-rendernode-tool * Debugging: - Drop the GTK_DEBUG_TOUCHSCREEN flag *
> Build: - Some build options have been renamed: gtk_doc -> documentation
> update_screenshots -> screenshots The old names still work Overview of
> Changes in 4.11.4, 03-07-2023 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D *
> GtkFileChooser: - Default to sorting folders first - Fix a crash when
> visiting recent files * GtkTextView: - Fix corner cases in word navigatio=
n
> * GtkMenuButton: - Normalize label layout * GtkDropDown: - Add support fo=
r
> sections * GtkVideo: - Make the overlay icon clickable * GtkWindow: - Cle=
ar
> the resize cursors to avoid artifacts * GtkFileDialog: - Always set
> initial-folder * GtkDropDown: - Update on expression changes *
> GtkMapListModel: - Implement GtkSectionModel * Accessibility: -
> Improvements all over the place: GtkButton, GtkPasswordEntry,
> GtkFontChooserDialog, GtkColorChooserDialog, GtkShortcutsWindow,
> GtkMenuButton, GtkAboutDialog, GtkFileChooserDialog, GtkStackSidebar,
> GtkStackSwitcher, GtkMediaControls, GtkColorDialogButton, GtkDropDown,
> GtkInfoBar, GtkNotebook, GtkPrintUnixDialog, GtkModelButton - Make name
> computation follow the ARIA spec more closely - Adapt name computation fo=
r
> the common 'nested button' scenario - Change many containers to use
> `generic` instead of `group` - Use `generic` as the default role - Use
> `application` instead of `window` for windows - Add properties for
> accessible names of not directly exposed widgets in GtkListView,
> GtkGridView and GtkColumnView * DND: - Fix criticals when drops are
> rejected * X11: - Fix regressions in GLX setup * Windows: - Center newly
> created transient windows * Vulkan: - Add antialising for gradients - Do
> less work on clipped away nodes - Redo image uploading - Support differen=
t
> image depths and formats - Add a pipeline cache * Demos: - gtk4-demo:
> Improve window sizing - gtk4-demo: Improve focus behavior - gtk4-demo: Ad=
d
> many missing a11y properties * Tools: - gtk4-builder-tool: Make render an
> alias screenshot * Inspector: - Show more information in the a11y tab - A=
dd
> an accessibility overlay with warnings and recommendations - Limit the
> width of the a11y tab * Build: - Require GLib 2.76 - Make asan builds wor=
k
> again - Fix the build if ld is not ld.bdf Overview of Changes in 4.11.3,
> 05-06-2023 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D * GtkGridVi=
ew: -
> Respect css border-spacing - Don't leak the factories * GtkListView: -
> Don't leak the factories * GtkColumnView: - Support displaying sections *
> GtkNotebook: - Make the pages model implement GtkSelectionModel *
> GtkScrolledWindow: - Propagate child measure size whenever possible *
> GtkPopoverMenu: - Avoid unnecessary left padding * GtkSearchEntry: -
> Improve size allocation for the clear icon * GtkBoxLayout: - Fix a
> regression from recent baseline work * CSS: - Add new binding-friendly cs=
s
> provider apis * Theme: - Show focus in the shortcuts window * GDK: -
> Support grayscale and alpha texture formats for loading and saving to png
> and tiff, and in GL - Fix some regressions in GL context initialization *
> GSK: - Support grayscale and alpha texture formats in the GL renderer -
> Support straight alpha textures in the GL renderer - Many improvements to
> the experimental Vulkan renderer * Wayland: - Make exporting surface
> handles more flexible * X11: - Trap XRandr errors - Stop using passive
> grabs during DND * Windows: - Many cleanups and simplifications * Tests: =
-
> Improve test coverage * Build: - Some build options have been renamed:
> demos -> build-demos profile -> demo-profile The old names still work *
> Deprecations: - gtk_css_provider_load_from_data -
> gdk_wayland_toplevel_unexport_handle - gdk_pixbuf_get_from_surface -
> gdk_pixbuf_get_from_texture - gtk_image_new_from_pixbuf -
> gtk_image_set_from_pixbuf - gtk_picture_new_for_pixbuf -
> gtk_picture_set_pixbuf Overview of Changes in 4.11.2, 09-05-2023
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D * GtkGLArea: - Add an
> allowed-apis property * GtkListBox: - Fix a problem with
> gtk_list_box_remove_all * Add the GtkSectionModel interface, and implemen=
t
> it in most of our list models * GtkListView: - Support displaying section=
s
> * GtkCenterBox: - Add a shrink-center-last property * GtkButton,
> GtkMenuButton: - Add a can-shrink property * GtkPopover: - Fix problems
> with grabs * GtkFileChooser: - Fix a problem with removing files - Make t=
he
> date, time and location columns work - Fix filtering in the save entry
> popup - A few memory leak fixes - Handle webdav in the pathbar * GtkBox: =
-
> Support baselines in vertical orientation with GtkBox:baseline-child *
> Dialogs: - Destroy windows promptly when the async callback finishes -
> Detect absence of the OpenURI portal and fall back * Theme: - Add explici=
t
> style classes to a number of widgets - Fix some contrast issues in the da=
rk
> theme * Accessibility: - Fix alert dialogs in the a11y tree - Improve
> accessibility of GtkShortcutsWindow * Layout: - Some fixes to baseline
> alignment - Separate GTK_ALIGN_BASELINE_CENTER and _FILL * CSS: - Fix a
> crash with color transitions * GSK: - Fix problems with negative scales -
> Improve scaling of offscreens for (cross-fades, masks, blends) * GL: - Ad=
d
> GdkGLTextureBuilder, a more flexible api for creating textures - Support
> setting update regions for GL textures - Ensure that we work with GLES 2 =
*
> Vulkan: - More fixes to the experimental Vulkan renderer - Rework glyph
> caching * Wayland: - Don't destroy wl_surfaces on hide - Plug leaks of
> compositor-side resources * X11: - Fix artifacts in gnome-shell frame
> decorations * Windows: - Fix GL context initialization * Inspector: -
> Improve the action list - Improve the accessibility pane - Fix a crash *
> Tools: - gtk4-node-editor: Improve scaling - gtk4-node-editor: Preserve
> aspect ratio of textures - gtk4-node-editor: Add some smarter editing -
> gtk4-demo: Make the stylus demo work with mice * Deprecations: -
> gtk_widget_get_allocated_width/height/baseline - GTK_ALIGN_BASELINE
> Overview of Changes in 4.11.1, 03-04-2023
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D * GtkLabel, GtkLinkButt=
on: - Make
> file:// uris work again * GtkListView/GtkColumnView/GtkGridView: - Fix
> clipping issues - Handle focus movement better - Introduce ::tab-behavior
> properties - Introduce GtkListItem::focusable - Introduce GtkColumnViewCe=
ll
> - Introduce row factories in GtkColumnView - Make list grid and column
> views inert when not rendering * Drag-and-Drop: - Support resizing drag
> surfaces, using the new GdkDragSurface::compute-size signal * Theme: - Po=
rt
> .boxed-list style from Adwaita - Make insensitive pictures appear grayed
> out * Accessibility: - Fix memory leaks - Fix a crash * GDK: - Add
> gdk_surface_get_scale to get the fractional scale - Use fractional scales
> on Wayland with cairo - Use fractional scales on Wayland with GL if
> GDK_DEBUG=3Dgl-fractional is set. This support is still experimental * GS=
K: -
> Allow limiting texture sizes with GSK_MAX_TEXTURE_SIZE - Use samplers for
> GL texture filtering - Fix problems with texture slicing - Avoid
> re-uploading textures when possible - Use mipmaps when it is beneficial *
> Wayland: - Fix handling of Drag hotspots - Fix a crash with cursor size 0=
 -
> Support absolute paths in WAYLAND_DISPLAY - Use the fractional scale
> protocol - Use a viewporter to set buffer scale * Windows: - Fix problems
> with WGL * Vulkan: - Some fixes to the experimental Vulkan renderer -
> Support fractional scaling * Debugging: - Show more Wayland-specific
> information in the inspector * Deprecations: -
> gtk_widget_translate_coordinates - gdk_surface_create_similar_surface *
> Documentation: - Add a section on coordinate systems * Build: - Require
> wayland-protocols 1.31 Signed-off-by: Markus Volk <f_l_k@t-online.de> ---
> .../gtk+/{gtk4_4.10.5.bb =3D> gtk4_4.12.0.bb} | 10 +++++----- 1 file
> changed, 5 insertions(+), 5 deletions(-) rename meta/recipes-gnome/gtk+/{
> gtk4_4.10.5.bb =3D> gtk4_4.12.0.bb} (94%) diff --git
> a/meta/recipes-gnome/gtk+/gtk4_4.10.5.bb b/meta/recipes-gnome/gtk+/
> gtk4_4.12.0.bb similarity index 94% rename from meta/recipes-gnome/gtk+/
> gtk4_4.10.5.bb rename to meta/recipes-gnome/gtk+/gtk4_4.12.0.bb index
> 85fff6c61e..4f38e0cb2c 100644 --- a/meta/recipes-gnome/gtk+/gtk4_4.10.5.b=
b
> +++ b/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb @@ -27,8 +27,8 @@ DEPENDS =
=3D
> " \ LICENSE =3D "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-or-later"
> LIC_FILES_CHKSUM =3D " \ file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec5=
22ec2
> \ - file://gtk/gtk.h;endline=3D25;md5=3D1d8dc0fccdbfa26287a271dce88af737 =
\ -
> file://gdk/gdk.h;endline=3D25;md5=3Dc920ce39dc88c6f06d3e7c50e08086f2 \ +
> file://gtk/gtk.h;endline=3D25;md5=3D61900d77e8d5bc67cf15ad93de9a3490 \ +
> file://gdk/gdk.h;endline=3D25;md5=3Da0fb26c1f6b94e66d148279e192c333f \
> file://tests/testgtk.c;endline=3D25;md5=3D49d06770681b8322466b52ed19d29fb=
2 \ "
> @@ -37,7 +37,7 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
> UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.x=
z"
> SRC_URI =3D "
> http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
> -SRC_URI[sha256sum] =3D
> "9bd5e437e41d48e3d6a224c336b0fd3fd490036dceb8956ed74b956369af609b"
> +SRC_URI[sha256sum] =3D
> "a6d10829f405b1afc0b65e2a9642c04126a1d1b638d11c6d97426da4f84f1f6f" S =3D
> "${WORKDIR}/gtk-${PV}" @@ -53,11 +53,11 @@ GSETTINGS_PACKAGE:class-native=
 =3D
> "" ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> REQUIRED_DISTRO_FEATURES =3D "opengl" -GTKDOC_MESON_OPTION =3D "gtk_doc"
> +GTKDOC_MESON_OPTION =3D "documentation" GIR_MESON_ENABLE_FLAG =3D 'enabl=
ed'
> GIR_MESON_DISABLE_FLAG =3D 'disabled' -EXTRA_OEMESON =3D " -Dbuild-tests=
=3Dfalse
> -Dbuild-testsuite=3Dfalse -Ddemos=3Dfalse" +EXTRA_OEMESON =3D "
> -Dbuild-tests=3Dfalse -Dbuild-testsuite=3Dfalse -Dbuild-demos=3Dfalse"
> PACKAGECONFIG ??=3D "gstreamer ${@bb.utils.filter('DISTRO_FEATURES', 'way=
land
> x11 vulkan', d)}" PACKAGECONFIG:class-native =3D
> "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}" -- 2.41.0
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this group.
> View/Reply Online (#186069):
> https://lists.openembedded.org/g/openembedded-core/message/186069 Mute
> This Topic: https://lists.openembedded.org/mt/100759433/1997914 Group
> Owner: openembedded-core+owner@lists.openembedded.org Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--0000000000006be0e806035bf005
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Aug 19, 2023 at 10:24 PM Khem Raj &lt;<a href=3D"ma=
ilto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">On Thu, Aug 17, 2023 at 7:49=E2=80=AFAM Markus Volk=
 &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.=
de</a>&gt; wrote:<br>
&gt;<br>
&gt; Sorry for the late reply. I was on the road yesterday.<br>
&gt;<br>
&gt; I can&#39;t reproduce the issue unfortunately. That&#39;s because I&#3=
9;ve been running my build host with a homebuilt yocto image for a couple o=
f weeks now to find runtime errors (and because it gets me better hardware =
support). So far this is running very well, but I seem to have a problem wi=
th libgcc-initial. When I want to use the clang toolchain, libcxx-native ab=
orts with:<br>
&gt;<br>
&gt; | /home/flk/poky/build/tmp/hosttools/ld: cannot find crtbeginS.o: No s=
uch file or directory<br>
&gt; | /home/flk/poky/build/tmp/hosttools/ld: cannot find -lgcc: No such fi=
le or directory<br>
&gt; | /home/flk/poky/build/tmp/hosttools/ld: cannot find -lgcc: No such fi=
le or directory<br>
&gt; | clang-16: error: linker command failed with exit code 1 (use -v to s=
ee the call)<br>
&gt; | ninja: build stopped: subcommand failed.</blockquote><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Ok the cmdline looks normal what=E2=80=99s t=
he install location of these files above=C2=A0</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto=
"><br>
<br>
while it is interesting that you are using OE based distro on your<br>
build host, its not a combination thats commonly tested. Especially in<br>
native libcxx case, its using<br>
clang-native with runtime from build host and I am sure thats where<br>
problem is perhaps some paths are being detected wrong. Clang does<br>
encode distro information<br>
into its driver. Can you post full log of failed task may be it has<br>
some hints. It will be also good to see the output of failing linker<br>
cmdline with --verbose option, it will<br>
show what paths clang driver is looking for runtime stuff.<br>
<br>
&gt;<br>
&gt; Will have to look into this first. So far I have no idea what is going=
 on. In any case, at most I&#39;d be able to hack this with a &#39;cast&#39=
;, but I don&#39;t have enough knowledge of the gtk code to find the root c=
ause<br>
&gt;<br>
&gt; I think the best thing would be to create an issue at gitlab, but I&#3=
9;m a bit afraid of that because I can&#39;t help if something needs to be =
tested or if I should add more context.<br>
&gt;<br>
&gt; In general this is an issue that should be fixed in gcc because this s=
eems to be indeed a bug.<br>
&gt;<br>
&gt; Short term solutions might be to add -Wno-int-conversion to the cflags=
 for clang to make it less strict or to disable the experimental vulkan sup=
port in gtk4 by default?<br>
&gt;<br>
&gt; On Wed, Aug 16 2023 at 07:44:50 AM -07:00:00, Khem Raj &lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wro=
te:<br>
&gt;<br>
&gt; clang finds more errors with this upgrade <a href=3D"https://errors.yo=
ctoproject.org/Errors/Details/731552/" rel=3D"noreferrer" target=3D"_blank"=
>https://errors.yoctoproject.org/Errors/Details/731552/</a> On Tue, Aug 15,=
 2023 at 7:52=E2=80=AFAM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.d=
e" target=3D"_blank">f_l_k@t-online.de</a>&gt; wrote:<br>
&gt;<br>
&gt; gtk.h: gtkscrollinfo.h was added, no change of license gdk.h: gdkpixbu=
f.h was deprecated, no change of license update renamed build-options Overv=
iew of Changes in 4.12.0, 05-08-2023 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D * List widgets: - Add scroll_to APIs * GtkFileLauncher: - Add =
an always-ask property * GtkTextView: - Make backspace behavior match GtkEn=
try * gsk: - Fix handling of luminance in mask nodes * Text rendering: - Au=
tomate the setting of gtk-hint-font-metrics from the scale factor. This imp=
roves font rendering in flatpaks * Wayland: - Fix behavior of stylus button=
s - Support suspended window state * Vulkan: - Many improvements * Tools: -=
 Add gtk4-rendernode-tool * Debugging: - Drop the GTK_DEBUG_TOUCHSCREEN fla=
g * Build: - Some build options have been renamed: gtk_doc -&gt; documentat=
ion update_screenshots -&gt; screenshots The old names still work Overview =
of Changes in 4.11.4, 03-07-2023 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D * GtkFileChooser: - Default to sorting folders first - Fix a crash w=
hen visiting recent files * GtkTextView: - Fix corner cases in word navigat=
ion * GtkMenuButton: - Normalize label layout * GtkDropDown: - Add support =
for sections * GtkVideo: - Make the overlay icon clickable * GtkWindow: - C=
lear the resize cursors to avoid artifacts * GtkFileDialog: - Always set in=
itial-folder * GtkDropDown: - Update on expression changes * GtkMapListMode=
l: - Implement GtkSectionModel * Accessibility: - Improvements all over the=
 place: GtkButton, GtkPasswordEntry, GtkFontChooserDialog, GtkColorChooserD=
ialog, GtkShortcutsWindow, GtkMenuButton, GtkAboutDialog, GtkFileChooserDia=
log, GtkStackSidebar, GtkStackSwitcher, GtkMediaControls, GtkColorDialogBut=
ton, GtkDropDown, GtkInfoBar, GtkNotebook, GtkPrintUnixDialog, GtkModelButt=
on - Make name computation follow the ARIA spec more closely - Adapt name c=
omputation for the common &#39;nested button&#39; scenario - Change many co=
ntainers to use `generic` instead of `group` - Use `generic` as the default=
 role - Use `application` instead of `window` for windows - Add properties =
for accessible names of not directly exposed widgets in GtkListView, GtkGri=
dView and GtkColumnView * DND: - Fix criticals when drops are rejected * X1=
1: - Fix regressions in GLX setup * Windows: - Center newly created transie=
nt windows * Vulkan: - Add antialising for gradients - Do less work on clip=
ped away nodes - Redo image uploading - Support different image depths and =
formats - Add a pipeline cache * Demos: - gtk4-demo: Improve window sizing =
- gtk4-demo: Improve focus behavior - gtk4-demo: Add many missing a11y prop=
erties * Tools: - gtk4-builder-tool: Make render an alias screenshot * Insp=
ector: - Show more information in the a11y tab - Add an accessibility overl=
ay with warnings and recommendations - Limit the width of the a11y tab * Bu=
ild: - Require GLib 2.76 - Make asan builds work again - Fix the build if l=
d is not ld.bdf Overview of Changes in 4.11.3, 05-06-2023 =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D * GtkGridView: - Respect css border-spaci=
ng - Don&#39;t leak the factories * GtkListView: - Don&#39;t leak the facto=
ries * GtkColumnView: - Support displaying sections * GtkNotebook: - Make t=
he pages model implement GtkSelectionModel * GtkScrolledWindow: - Propagate=
 child measure size whenever possible * GtkPopoverMenu: - Avoid unnecessary=
 left padding * GtkSearchEntry: - Improve size allocation for the clear ico=
n * GtkBoxLayout: - Fix a regression from recent baseline work * CSS: - Add=
 new binding-friendly css provider apis * Theme: - Show focus in the shortc=
uts window * GDK: - Support grayscale and alpha texture formats for loading=
 and saving to png and tiff, and in GL - Fix some regressions in GL context=
 initialization * GSK: - Support grayscale and alpha texture formats in the=
 GL renderer - Support straight alpha textures in the GL renderer - Many im=
provements to the experimental Vulkan renderer * Wayland: - Make exporting =
surface handles more flexible * X11: - Trap XRandr errors - Stop using pass=
ive grabs during DND * Windows: - Many cleanups and simplifications * Tests=
: - Improve test coverage * Build: - Some build options have been renamed: =
demos -&gt; build-demos profile -&gt; demo-profile The old names still work=
 * Deprecations: - gtk_css_provider_load_from_data - gdk_wayland_toplevel_u=
nexport_handle - gdk_pixbuf_get_from_surface - gdk_pixbuf_get_from_texture =
- gtk_image_new_from_pixbuf - gtk_image_set_from_pixbuf - gtk_picture_new_f=
or_pixbuf - gtk_picture_set_pixbuf Overview of Changes in 4.11.2, 09-05-202=
3 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D * GtkGLArea: - Add an a=
llowed-apis property * GtkListBox: - Fix a problem with gtk_list_box_remove=
_all * Add the GtkSectionModel interface, and implement it in most of our l=
ist models * GtkListView: - Support displaying sections * GtkCenterBox: - A=
dd a shrink-center-last property * GtkButton, GtkMenuButton: - Add a can-sh=
rink property * GtkPopover: - Fix problems with grabs * GtkFileChooser: - F=
ix a problem with removing files - Make the date, time and location columns=
 work - Fix filtering in the save entry popup - A few memory leak fixes - H=
andle webdav in the pathbar * GtkBox: - Support baselines in vertical orien=
tation with GtkBox:baseline-child * Dialogs: - Destroy windows promptly whe=
n the async callback finishes - Detect absence of the OpenURI portal and fa=
ll back * Theme: - Add explicit style classes to a number of widgets - Fix =
some contrast issues in the dark theme * Accessibility: - Fix alert dialogs=
 in the a11y tree - Improve accessibility of GtkShortcutsWindow * Layout: -=
 Some fixes to baseline alignment - Separate GTK_ALIGN_BASELINE_CENTER and =
_FILL * CSS: - Fix a crash with color transitions * GSK: - Fix problems wit=
h negative scales - Improve scaling of offscreens for (cross-fades, masks, =
blends) * GL: - Add GdkGLTextureBuilder, a more flexible api for creating t=
extures - Support setting update regions for GL textures - Ensure that we w=
ork with GLES 2 * Vulkan: - More fixes to the experimental Vulkan renderer =
- Rework glyph caching * Wayland: - Don&#39;t destroy wl_surfaces on hide -=
 Plug leaks of compositor-side resources * X11: - Fix artifacts in gnome-sh=
ell frame decorations * Windows: - Fix GL context initialization * Inspecto=
r: - Improve the action list - Improve the accessibility pane - Fix a crash=
 * Tools: - gtk4-node-editor: Improve scaling - gtk4-node-editor: Preserve =
aspect ratio of textures - gtk4-node-editor: Add some smarter editing - gtk=
4-demo: Make the stylus demo work with mice * Deprecations: - gtk_widget_ge=
t_allocated_width/height/baseline - GTK_ALIGN_BASELINE Overview of Changes =
in 4.11.1, 03-04-2023 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D * =
GtkLabel, GtkLinkButton: - Make file:// uris work again * GtkListView/GtkCo=
lumnView/GtkGridView: - Fix clipping issues - Handle focus movement better =
- Introduce ::tab-behavior properties - Introduce GtkListItem::focusable - =
Introduce GtkColumnViewCell - Introduce row factories in GtkColumnView - Ma=
ke list grid and column views inert when not rendering * Drag-and-Drop: - S=
upport resizing drag surfaces, using the new GdkDragSurface::compute-size s=
ignal * Theme: - Port .boxed-list style from Adwaita - Make insensitive pic=
tures appear grayed out * Accessibility: - Fix memory leaks - Fix a crash *=
 GDK: - Add gdk_surface_get_scale to get the fractional scale - Use fractio=
nal scales on Wayland with cairo - Use fractional scales on Wayland with GL=
 if GDK_DEBUG=3Dgl-fractional is set. This support is still experimental * =
GSK: - Allow limiting texture sizes with GSK_MAX_TEXTURE_SIZE - Use sampler=
s for GL texture filtering - Fix problems with texture slicing - Avoid re-u=
ploading textures when possible - Use mipmaps when it is beneficial * Wayla=
nd: - Fix handling of Drag hotspots - Fix a crash with cursor size 0 - Supp=
ort absolute paths in WAYLAND_DISPLAY - Use the fractional scale protocol -=
 Use a viewporter to set buffer scale * Windows: - Fix problems with WGL * =
Vulkan: - Some fixes to the experimental Vulkan renderer - Support fraction=
al scaling * Debugging: - Show more Wayland-specific information in the ins=
pector * Deprecations: - gtk_widget_translate_coordinates - gdk_surface_cre=
ate_similar_surface * Documentation: - Add a section on coordinate systems =
* Build: - Require wayland-protocols 1.31 Signed-off-by: Markus Volk &lt;<a=
 href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&=
gt; --- .../gtk+/{<a href=3D"http://gtk4_4.10.5.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gtk4_4.10.5.bb</a> =3D&gt; <a href=3D"http://gtk4_4.12.0.bb" =
rel=3D"noreferrer" target=3D"_blank">gtk4_4.12.0.bb</a>} | 10 +++++----- 1 =
file changed, 5 insertions(+), 5 deletions(-) rename meta/recipes-gnome/gtk=
+/{<a href=3D"http://gtk4_4.10.5.bb" rel=3D"noreferrer" target=3D"_blank">g=
tk4_4.10.5.bb</a> =3D&gt; <a href=3D"http://gtk4_4.12.0.bb" rel=3D"noreferr=
er" target=3D"_blank">gtk4_4.12.0.bb</a>} (94%) diff --git a/meta/recipes-g=
nome/gtk+/<a href=3D"http://gtk4_4.10.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">gtk4_4.10.5.bb</a> b/meta/recipes-gnome/gtk+/<a href=3D"http://gtk4_4=
.12.0.bb" rel=3D"noreferrer" target=3D"_blank">gtk4_4.12.0.bb</a> similarit=
y index 94% rename from meta/recipes-gnome/gtk+/<a href=3D"http://gtk4_4.10=
.5.bb" rel=3D"noreferrer" target=3D"_blank">gtk4_4.10.5.bb</a> rename to me=
ta/recipes-gnome/gtk+/<a href=3D"http://gtk4_4.12.0.bb" rel=3D"noreferrer" =
target=3D"_blank">gtk4_4.12.0.bb</a> index 85fff6c61e..4f38e0cb2c 100644 --=
- a/meta/recipes-gnome/gtk+/<a href=3D"http://gtk4_4.10.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">gtk4_4.10.5.bb</a> +++ b/meta/recipes-gnome/gtk+/<a=
 href=3D"http://gtk4_4.12.0.bb" rel=3D"noreferrer" target=3D"_blank">gtk4_4=
.12.0.bb</a> @@ -27,8 +27,8 @@ DEPENDS =3D &quot; \ LICENSE =3D &quot;LGPL-=
2.0-only &amp; LGPL-2.0-or-later &amp; LGPL-2.1-or-later&quot; LIC_FILES_CH=
KSUM =3D &quot; \ file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522ec2 \ -=
 file://gtk/gtk.h;endline=3D25;md5=3D1d8dc0fccdbfa26287a271dce88af737 \ - f=
ile://gdk/gdk.h;endline=3D25;md5=3Dc920ce39dc88c6f06d3e7c50e08086f2 \ + fil=
e://gtk/gtk.h;endline=3D25;md5=3D61900d77e8d5bc67cf15ad93de9a3490 \ + file:=
//gdk/gdk.h;endline=3D25;md5=3Da0fb26c1f6b94e66d148279e192c333f \ file://te=
sts/testgtk.c;endline=3D25;md5=3D49d06770681b8322466b52ed19d29fb2 \ &quot; =
@@ -37,7 +37,7 @@ MAJ_VER =3D &quot;${@oe.utils.trim_version(&quot;${PV}&qu=
ot;, 2)}&quot; UPSTREAM_CHECK_REGEX =3D &quot;gtk-(?P&lt;pver&gt;\d+\.(\d*[=
02468])+(\.\d+)+)\.tar.xz&quot; SRC_URI =3D &quot;<a href=3D"http://ftp.gno=
me.org/pub/gnome/sources/gtk/$%7BMAJ_VER%7D/gtk-$%7BPV%7D.tar.xz" rel=3D"no=
referrer" target=3D"_blank">http://ftp.gnome.org/pub/gnome/sources/gtk/${MA=
J_VER}/gtk-${PV}.tar.xz</a>&quot; -SRC_URI[sha256sum] =3D &quot;9bd5e437e41=
d48e3d6a224c336b0fd3fd490036dceb8956ed74b956369af609b&quot; +SRC_URI[sha256=
sum] =3D &quot;a6d10829f405b1afc0b65e2a9642c04126a1d1b638d11c6d97426da4f84f=
1f6f&quot; S =3D &quot;${WORKDIR}/gtk-${PV}&quot; @@ -53,11 +53,11 @@ GSETT=
INGS_PACKAGE:class-native =3D &quot;&quot; ANY_OF_DISTRO_FEATURES =3D &quot=
;${GTK3DISTROFEATURES}&quot; REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot=
; -GTKDOC_MESON_OPTION =3D &quot;gtk_doc&quot; +GTKDOC_MESON_OPTION =3D &qu=
ot;documentation&quot; GIR_MESON_ENABLE_FLAG =3D &#39;enabled&#39; GIR_MESO=
N_DISABLE_FLAG =3D &#39;disabled&#39; -EXTRA_OEMESON =3D &quot; -Dbuild-tes=
ts=3Dfalse -Dbuild-testsuite=3Dfalse -Ddemos=3Dfalse&quot; +EXTRA_OEMESON =
=3D &quot; -Dbuild-tests=3Dfalse -Dbuild-testsuite=3Dfalse -Dbuild-demos=3D=
false&quot; PACKAGECONFIG ??=3D &quot;gstreamer ${@bb.utils.filter(&#39;DIS=
TRO_FEATURES&#39;, &#39;wayland x11 vulkan&#39;, d)}&quot; PACKAGECONFIG:cl=
ass-native =3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;x11=
&#39;, d)}&quot; -- 2.41.0 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Li=
nks: You receive all messages sent to this group. View/Reply Online (#18606=
9): <a href=3D"https://lists.openembedded.org/g/openembedded-core/message/1=
86069" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/message/186069</a> Mute This Topic: <a href=3D"https://=
lists.openembedded.org/mt/100759433/1997914" rel=3D"noreferrer" target=3D"_=
blank">https://lists.openembedded.org/mt/100759433/1997914</a> Group Owner:=
 <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded.org" target=
=3D"_blank">openembedded-core+owner@lists.openembedded.org</a> Unsubscribe:=
 <a href=3D"https://lists.openembedded.org/g/openembedded-core/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/openembe=
dded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank=
">raj.khem@gmail.com</a>] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
</blockquote></div></div>

--0000000000006be0e806035bf005--

