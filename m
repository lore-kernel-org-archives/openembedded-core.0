Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A29C47073
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 20:55:57 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.5181.1704920148273263246
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 12:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dj7v9gS2;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50eaaf2c7deso4999175e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 12:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704920146; x=1705524946; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hZCB2/DWkOfdH9pVxk+q9DAf6M5Z+XUsSf7qWtsmebA=;
        b=Dj7v9gS2rCsn5hKtq3QBpyWvJLT8SFJkBi66LM0/ZggPU0NXsCCxArvdj6OYO3TMvS
         55ZPbM5x84/WKZICY8lhJfnEY54mXu6soFSem14tgiYxF2jQxAWerS5pRkUgP691b7sV
         XeKuajOgLdOszp3k6ddpcMd/4FLfWNnSy0T2QDWKYGhFMGE3LpoxkqrmGOIRKzqdWVdM
         V88b7WuMM5hRlIe3Mi94msi5GPBa9lBfEZnz64ky5MZ4kTX/jv+/jOGkanQlzphgNuAz
         XbVNU9iN4n/ZfU2dzp6ZjsiUkqFAjSDQTp+8yBN43JTk4BPwZhKYSEgr/Durl71kR45b
         OdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704920146; x=1705524946;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZCB2/DWkOfdH9pVxk+q9DAf6M5Z+XUsSf7qWtsmebA=;
        b=umP32YVNMKsUOO4gKOp9ilTMR9+dBCR6DL9CfKrWbiVfbcprMjna/qojBwCfrxxvrd
         qnpCwhBqqc+DGi95+JiNLE2DvlX0f1W21FZu4yaYQT13XGitQ8CgtniTGEbHYe9dlCxB
         PHSO+D6pkrE3xoGt3cqs0l4T4caFu60DKmmDFJGqpaxa4JXtg4Bc0eyMDDRdNoZvVQbl
         GbHtqbaonpDT07YgaEjE02IfDnkZNXhdcjY0C8WKUWQCVpsIOV42UQsT6gsc7Pl/PQ/C
         8n2ZiEz68bbLy6EnKyZX989RG4xP8wQzrfMSot4mw7jVbgMuGbyOjNojB0raWr/zuJ+Q
         Ioww==
X-Gm-Message-State: AOJu0YyCMdCMhIz3NuQuJfSpTtJa9/6FLo7mjBJVVtJPqLJjGl5O3OnU
	+XQiqAuOT8nFAaSVjTLjKoUG9S5Ti/hUafZJwaE=
X-Google-Smtp-Source: AGHT+IGUa6HCZGyJ+PYYubb9r4jiLMVWK0K0klCiCBz84dIZfUxqsqlMm4BKgK6tpbRqkkckxN/RCx3x2zn+wPWOdjY=
X-Received: by 2002:a05:6512:5c2:b0:50e:c516:d75f with SMTP id
 o2-20020a05651205c200b0050ec516d75fmr12723lfo.31.1704920145876; Wed, 10 Jan
 2024 12:55:45 -0800 (PST)
MIME-Version: 1.0
References: <20231227040936.1063726-1-qiutt@fujitsu.com> <741C23EC-9225-4A31-94C7-D5FE92E39B08@arm.com>
In-Reply-To: <741C23EC-9225-4A31-94C7-D5FE92E39B08@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 Jan 2024 21:55:35 +0100
Message-ID: <CANNYZj8pBQG8aZfY3RYTT3i4-jWTPbvxBkH9Aw2Ci8-gBTJdjg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V4] cairo: upgrade 1.16.0 -> 1.18.0
To: Ross Burton <ross.burton@arm.com>
Cc: "fnstml-fujitsuten@fujitsu.com" <fnstml-fujitsuten@fujitsu.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"qiutt@fujitsu.com" <qiutt@fujitsu.com>
Content-Type: multipart/alternative; boundary="000000000000aa5d21060e9da7e8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 20:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193524

--000000000000aa5d21060e9da7e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think you should clarify. What wip commit and who=E2=80=99s taken it and =
where?

Alex

On Wed 10. Jan 2024 at 19.42, Ross Burton <ross.burton@arm.com> wrote:

> If you=E2=80=99re going to take someone elses WIP commit wholesale, pleas=
e at
> least credit them...
>
> Ross
>
> > On 27 Dec 2023, at 04:09, qiutt@fujitsu.com via lists.openembedded.org
> <qiutt=3Dfujitsu.com@lists.openembedded.org> wrote:
> >
> > From: qiutt <qiutt@fujitsu.com>
> >
> > Changelog for 1.18.0 [1]:
> >  The cairo-sphinx tool has been removed
> >  Cairo now implements Type 3 color fonts for PDF
> >  The XML surface has been removed
> >  The Tee surface is now automatically enabled
> >  The Quartz surface is improved
> >  Cairo now hides all private symbols by default on every platform
> >  Fixed multiple issues
> >
> > As a part of 1.18.0, the following patches should be dropped.
> >  CVE-2018-19876.patch :
> https://gitlab.freedesktop.org/cairo/cairo/-/commit/90e85c2493fdfa3551f20=
2ff10282463f1e36645
> >  CVE-2019-6461.patch  :
> https://gitlab.freedesktop.org/cairo/cairo/-/commit/09643ee1abdd5daacebfc=
b564448f29be9a79bac
> >  CVE-2019-6462.patch  :
> https://gitlab.freedesktop.org/cairo/cairo/-/commit/bbeaf08190d3006a80b80=
a77724801cd477a37b8
> >  CVE-2020-35492.patch :
> https://gitlab.freedesktop.org/cairo/cairo/-/commit/c986a7310bb06582b7d8a=
566d5f007ba4e5e75bf
> >
> > These options are all gone [2]: directfb, valgrind, egl, glesv2, opengl=
,
> trace
> >
> > Build tool is changed : autotools -> meson
> >
> > Fix cross compile error [3] by adding cairo.cross file.
> >
> > [1] https://www.cairographics.org/news/cairo-1.18.0/
> > [2]
> https://gitlab.freedesktop.org/cairo/cairo/-/blob/master/meson_options.tx=
t
> > [3] https://gitlab.freedesktop.org/cairo/cairo/-/issues/613
> >
> > Signed-off-by: qiutt <qiutt@fujitsu.com>
> > ---
> > .../cairo/cairo/CVE-2018-19876.patch          | 34 ---------
> > .../cairo/cairo/CVE-2019-6461.patch           | 20 ------
> > .../cairo/cairo/CVE-2019-6462.patch           | 40 -----------
> > .../cairo/cairo/CVE-2020-35492.patch          | 60 ----------------
> > .../{cairo_1.16.0.bb =3D> cairo_1.18.0.bb}      | 72 +++++++-----------=
-
> > 5 files changed, 25 insertions(+), 201 deletions(-)
> > delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2018-19876.pat=
ch
> > delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patc=
h
> > delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patc=
h
> > delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2020-35492.pat=
ch
> > rename meta/recipes-graphics/cairo/{cairo_1.16.0.bb =3D> cairo_1.18.0.b=
b}
> (51%)
> >
> > diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
> b/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
> > deleted file mode 100644
> > index 4252a5663b..0000000000
> > --- a/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch
> > +++ /dev/null
> > @@ -1,34 +0,0 @@
> > -CVE: CVE-2018-19876
> > -Upstream-Status: Backport
> > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > -
> > -From 90e85c2493fdfa3551f202ff10282463f1e36645 Mon Sep 17 00:00:00 2001
> > -From: Carlos Garcia Campos <cgarcia@igalia.com>
> > -Date: Mon, 19 Nov 2018 12:33:07 +0100
> > -Subject: [PATCH] ft: Use FT_Done_MM_Var instead of free when available
> in
> > - cairo_ft_apply_variations
> > -
> > -Fixes a crash when using freetype >=3D 2.9
> > ----
> > - src/cairo-ft-font.c | 4 ++++
> > - 1 file changed, 4 insertions(+)
> > -
> > -diff --git a/src/cairo-ft-font.c b/src/cairo-ft-font.c
> > -index 325dd61b4..981973f78 100644
> > ---- a/src/cairo-ft-font.c
> > -+++ b/src/cairo-ft-font.c
> > -@@ -2393,7 +2393,11 @@ skip:
> > - done:
> > -         free (coords);
> > -         free (current_coords);
> > -+#if HAVE_FT_DONE_MM_VAR
> > -+        FT_Done_MM_Var (face->glyph->library, ft_mm_var);
> > -+#else
> > -         free (ft_mm_var);
> > -+#endif
> > -     }
> > - }
> > -
> > ---
> > -2.11.0
> > -
> > diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
> b/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
> > deleted file mode 100644
> > index a2dba6cb20..0000000000
> > --- a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
> > +++ /dev/null
> > @@ -1,20 +0,0 @@
> > -There is an assertion in function _cairo_arc_in_direction().
> > -
> > -CVE: CVE-2019-6461
> > -Upstream-Status: Pending
> > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > -
> > -diff --git a/src/cairo-arc.c b/src/cairo-arc.c
> > -index 390397bae..1bde774a4 100644
> > ---- a/src/cairo-arc.c
> > -+++ b/src/cairo-arc.c
> > -@@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t  *cr,
> > -     if (cairo_status (cr))
> > -         return;
> > -
> > --    assert (angle_max >=3D angle_min);
> > -+    if (angle_max < angle_min)
> > -+       return;
> > -
> > -     if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
> > - angle_max =3D fmod (angle_max - angle_min, 2 * M_PI);
> > diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
> b/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
> > deleted file mode 100644
> > index 7c3209291b..0000000000
> > --- a/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -CVE: CVE-2019-6462
> > -Upstream-Status: Backport
> > -Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > -
> > -From ab2c5ee21e5f3d3ee4b3f67cfcd5811a4f99c3a0 Mon Sep 17 00:00:00 2001
> > -From: Heiko Lewin <hlewin@gmx.de>
> > -Date: Sun, 1 Aug 2021 11:16:03 +0000
> > -Subject: [PATCH] _arc_max_angle_for_tolerance_normalized: fix infinite
> loop
> > -
> > ----
> > - src/cairo-arc.c | 4 +++-
> > - 1 file changed, 3 insertions(+), 1 deletion(-)
> > -
> > -diff --git a/src/cairo-arc.c b/src/cairo-arc.c
> > -index 390397bae..1c891d1a0 100644
> > ---- a/src/cairo-arc.c
> > -+++ b/src/cairo-arc.c
> > -@@ -90,16 +90,18 @@ _arc_max_angle_for_tolerance_normalized (double
> tolerance)
> > - { M_PI / 11.0,  9.81410988043554039085e-09 },
> > -     };
> > -     int table_size =3D ARRAY_LENGTH (table);
> > -+    const int max_segments =3D 1000; /* this value is chosen
> arbitrarily. this gives an error of about 1.74909e-20 */
> > -
> > -     for (i =3D 0; i < table_size; i++)
> > - if (table[i].error < tolerance)
> > -    return table[i].angle;
> > -
> > -     ++i;
> > -+
> > -     do {
> > - angle =3D M_PI / i++;
> > - error =3D _arc_error_normalized (angle);
> > --    } while (error > tolerance);
> > -+    } while (error > tolerance && i < max_segments);
> > -
> > -     return angle;
> > - }
> > ---
> > -2.38.1
> > -
> > diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
> b/meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
> > deleted file mode 100644
> > index fb6ce5cfdf..0000000000
> > --- a/meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch
> > +++ /dev/null
> > @@ -1,60 +0,0 @@
> > -Fix stack buffer overflow.
> > -
> > -CVE: CVE-2020-35492
> > -Upstream-Status: Backport
> > -Signed-off-by: Ross Burton <ross.burton@arm.com>
> > -
> > -From 03a820b173ed1fdef6ff14b4468f5dbc02ff59be Mon Sep 17 00:00:00 2001
> > -From: Heiko Lewin <heiko.lewin@worldiety.de>
> > -Date: Tue, 15 Dec 2020 16:48:19 +0100
> > -Subject: [PATCH] Fix mask usage in image-compositor
> > -
> > ----
> > - src/cairo-image-compositor.c                |   8 ++--
> > - test/Makefile.sources                       |   1 +
> > - test/bug-image-compositor.c                 |  39 +++++++++++++++++++=
+
> > - test/reference/bug-image-compositor.ref.png | Bin 0 -> 185 bytes
> > - 4 files changed, 44 insertions(+), 4 deletions(-)
> > - create mode 100644 test/bug-image-compositor.c
> > - create mode 100644 test/reference/bug-image-compositor.ref.png
> > -
> > -diff --git a/src/cairo-image-compositor.c b/src/cairo-image-compositor=
.c
> > -index 79ad69f68..4f8aaed99 100644
> > ---- a/src/cairo-image-compositor.c
> > -+++ b/src/cairo-image-compositor.c
> > -@@ -2601,14 +2601,14 @@ _inplace_src_spans (void *abstract_renderer,
> int y, int h,
> > -    unsigned num_spans)
> > - {
> > -     cairo_image_span_renderer_t *r =3D abstract_renderer;
> > --    uint8_t *m;
> > -+    uint8_t *m, *base =3D (uint8_t*)pixman_image_get_data(r->mask);
> > -     int x0;
> > -
> > -     if (num_spans =3D=3D 0)
> > - return CAIRO_STATUS_SUCCESS;
> > -
> > -     x0 =3D spans[0].x;
> > --    m =3D r->_buf;
> > -+    m =3D base;
> > -     do {
> > - int len =3D spans[1].x - spans[0].x;
> > - if (len >=3D r->u.composite.run_length && spans[0].coverage =3D=3D 0x=
ff) {
> > -@@ -2655,7 +2655,7 @@ _inplace_src_spans (void *abstract_renderer, int
> y, int h,
> > -      spans[0].x, y,
> > -      spans[1].x - spans[0].x, h);
> > -
> > --    m =3D r->_buf;
> > -+    m =3D base;
> > -    x0 =3D spans[1].x;
> > - } else if (spans[0].coverage =3D=3D 0x0) {
> > -    if (spans[0].x !=3D x0) {
> > -@@ -2684,7 +2684,7 @@ _inplace_src_spans (void *abstract_renderer, int
> y, int h,
> > - #endif
> > -    }
> > -
> > --    m =3D r->_buf;
> > -+    m =3D base;
> > -    x0 =3D spans[1].x;
> > - } else {
> > -    *m++ =3D spans[0].coverage;
> > ---
> > diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> b/meta/recipes-graphics/cairo/cairo_1.18.0.bb
> > similarity index 51%
> > rename from meta/recipes-graphics/cairo/cairo_1.16.0.bb
> > rename to meta/recipes-graphics/cairo/cairo_1.18.0.bb
> > index ffb813d290..ffae13b48a 100644
> > --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> > +++ b/meta/recipes-graphics/cairo/cairo_1.18.0.bb
> > @@ -7,7 +7,7 @@ optional translucence (opacity/alpha) and combined usin=
g
> the \
> > extended Porter/Duff compositing algebra as found in the X Render \
> > Extension."
> > HOMEPAGE =3D "http://cairographics.org"
> > -BUGTRACKER =3D "http://bugs.freedesktop.org"
> > +BUGTRACKER =3D "https://gitlab.freedesktop.org/cairo/cairo/-/issues"
> > SECTION =3D "libs"
> >
> > LICENSE =3D "(MPL-1.1 | LGPL-2.1-only) & GPL-3.0-or-later"
> > @@ -26,62 +26,40 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3De73e999e0c72b5ac9012424fa157ad77 \
> >                     ${@bb.utils.contains('PACKAGECONFIG', 'trace',
> 'file://util/cairo-trace/COPYING-GPL-3;md5=3Dd32239bcb673463ab874e80d47fa=
e504',
> '', d)}"
> >
> >
> > -DEPENDS =3D "fontconfig glib-2.0 libpng pixman zlib"
> > +DEPENDS =3D "fontconfig freetype glib-2.0 libpng pixman zlib"
> >
> > SRC_URI =3D "http://cairographics.org/releases/cairo-${PV}.tar.xz \
> >            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.dif=
f
> \
> > -           file://CVE-2018-19876.patch \
> > -           file://CVE-2019-6461.patch \
> > -           file://CVE-2019-6462.patch \
> > -           file://CVE-2020-35492.patch \
> >           "
> >
> > -SRC_URI[md5sum] =3D "f19e0353828269c22bd72e271243a552"
> > -SRC_URI[sha256sum] =3D
> "5e7b29b3f113ef870d1e3ecf8adf21f923396401604bda16d44be45e66052331"
> > +SRC_URI[sha256sum] =3D
> "243a0736b978a33dee29f9cca7521733b78a65b5418206fef7bd1c3d4cf10b64"
> >
> > -inherit autotools pkgconfig upstream-version-is-even gtk-doc
> multilib_script
> > +inherit meson pkgconfig upstream-version-is-even gtk-doc multilib_scri=
pt
> > +
> > +# Tell libsoup where the target ntlm_auth is installed
> > +do_write_config:append:class-target() {
> > +    cat >${WORKDIR}/cairo.cross <<EOF
> > +[binaries]
> > +ipc_rmid_deferred_release =3D 'true'
> > +EOF
> > +}
> > +EXTRA_OEMESON:append:class-target =3D " --cross-file
> ${WORKDIR}/cairo.cross"
> > +
> > +GTKDOC_MESON_OPTION =3D "gtk_doc"
> >
> > MULTILIB_SCRIPTS =3D "${PN}-perf-utils:${bindir}/cairo-trace"
> >
> > -X11DEPENDS =3D "virtual/libx11 libsm libxrender libxext"
> > -
> > -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'directfb',
> d)} \
> > -                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11
> xcb', '', d)} \
> > -                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11
> opengl', 'opengl', '', d)} \
> > -                   trace"
> > -PACKAGECONFIG:class-native =3D "${@bb.utils.contains('DISTRO_FEATURES'=
,
> 'x11', 'x11 xcb', '', d)}"
> > -PACKAGECONFIG:class-nativesdk =3D
> "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)}"
> > -
> > -PACKAGECONFIG[x11] =3D "--with-x=3Dyes -enable-xlib,--with-x=3Dno
> --disable-xlib,${X11DEPENDS}"
> > -PACKAGECONFIG[xcb] =3D "--enable-xcb,--disable-xcb,libxcb"
> > -PACKAGECONFIG[directfb] =3D "--enable-directfb=3Dyes,,directfb"
> > -PACKAGECONFIG[valgrind] =3D
> "--enable-valgrind=3Dyes,--disable-valgrind,valgrind"
> > -PACKAGECONFIG[egl] =3D "--enable-egl=3Dyes,--disable-egl,virtual/egl"
> > -PACKAGECONFIG[glesv2] =3D
> "--enable-glesv2,--disable-glesv2,virtual/libgles2"
> > -PACKAGECONFIG[opengl] =3D "--enable-gl,--disable-gl,virtual/libgl"
> > -# trace is under GPLv3
> > -PACKAGECONFIG[trace] =3D "--enable-trace,--disable-trace"
> > -
> > -EXTRA_OECONF +=3D " \
> > -    ${@bb.utils.contains('TARGET_FPU', 'soft',
> '--disable-some-floating-point', '', d)} \
> > -    --enable-tee \
> > -"
> > -
> > -# We don't depend on binutils so we need to disable this
> > -export ac_cv_lib_bfd_bfd_openr=3D"no"
> > -# Ensure we don't depend on LZO
> > -export ac_cv_lib_lzo2_lzo2a_decompress=3D"no"
> > +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x=
lib
> xcb', '', d)} trace"
> > +PACKAGECONFIG[xlib] =3D "-Dxlib=3Denabled,-Dxlib=3Ddisabled,virtual/li=
bx11
> libxrender libxext"
> > +PACKAGECONFIG[xcb] =3D "-Dxcb=3Denabled,-Dxcb=3Ddisabled,libxcb"
> > +# cairo-trace is GPLv3 so add an option to remove it
> > +PACKAGECONFIG[trace] =3D ""
> >
> > do_install:append () {
> > - rm -rf ${D}${bindir}/cairo-sphinx
> > - rm -rf ${D}${libdir}/cairo/cairo-fdr*
> > - rm -rf ${D}${libdir}/cairo/cairo-sphinx*
> > - rm -rf ${D}${libdir}/cairo/.debug/cairo-fdr*
> > - rm -rf ${D}${libdir}/cairo/.debug/cairo-sphinx*
> > - [ ! -d ${D}${bindir} ] ||
> > - rmdir -p --ignore-fail-on-non-empty ${D}${bindir}
> > - [ ! -d ${D}${libdir}/cairo ] ||
> > - rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/cairo
> > +    if ! ${@bb.utils.contains('PACKAGECONFIG', 'trace', 'true',
> 'false', d)}; then
> > +        rm ${D}${bindir}/cairo-trace
> ${D}${libdir}/cairo/libcairo-trace.so
> > +        rmdir --ignore-fail-on-non-empty ${D}${bindir}
> ${D}${libdir}/cairo
> > +    fi
> > }
> >
> > PACKAGES =3D+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
> > @@ -99,7 +77,7 @@ DESCRIPTION:cairo-perf-utils =3D "The Cairo library
> performance utilities"
> > FILES:${PN} =3D "${libdir}/libcairo.so.*"
> > FILES:${PN}-gobject =3D "${libdir}/libcairo-gobject.so.*"
> > FILES:${PN}-script-interpreter =3D
> "${libdir}/libcairo-script-interpreter.so.*"
> > -FILES:${PN}-perf-utils =3D "${bindir}/cairo-trace* ${libdir}/cairo/*.l=
a
> ${libdir}/cairo/libcairo-trace.so"
> > +FILES:${PN}-perf-utils =3D "${bindir}/cairo-*
> ${libdir}/cairo/libcairo-trace.so ${libdir}/cairo/libcairo-fdr.so"
> >
> > BBCLASSEXTEND =3D "native nativesdk"
> >
> > --
> > 2.25.1
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193520):
> https://lists.openembedded.org/g/openembedded-core/message/193520
> Mute This Topic: https://lists.openembedded.org/mt/103380468/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000aa5d21060e9da7e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div><div dir=3D"auto">I think you should clarify. What wip commit and=
 who=E2=80=99s taken it and where?</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Alex</div></div></div><div><div><div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 10. Jan 2024 at 19.42, Ros=
s Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.=
burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:sol=
id;padding-left:1ex;border-left-color:rgb(204,204,204)">If you=E2=80=99re g=
oing to take someone elses WIP commit wholesale, please at least credit the=
m...<br>
<br>
Ross<br>
<br>
&gt; On 27 Dec 2023, at 04:09, <a href=3D"mailto:qiutt@fujitsu.com" target=
=3D"_blank">qiutt@fujitsu.com</a> via <a href=3D"http://lists.openembedded.=
org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> &lt;qi=
utt=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org" target=3D"_blan=
k">fujitsu.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; From: qiutt &lt;<a href=3D"mailto:qiutt@fujitsu.com" target=3D"_blank"=
>qiutt@fujitsu.com</a>&gt;<br>
&gt; <br>
&gt; Changelog for 1.18.0 [1]:<br>
&gt;=C2=A0 The cairo-sphinx tool has been removed<br>
&gt;=C2=A0 Cairo now implements Type 3 color fonts for PDF<br>
&gt;=C2=A0 The XML surface has been removed<br>
&gt;=C2=A0 The Tee surface is now automatically enabled<br>
&gt;=C2=A0 The Quartz surface is improved<br>
&gt;=C2=A0 Cairo now hides all private symbols by default on every platform=
<br>
&gt;=C2=A0 Fixed multiple issues<br>
&gt; <br>
&gt; As a part of 1.18.0, the following patches should be dropped.<br>
&gt;=C2=A0 CVE-2018-19876.patch : <a href=3D"https://gitlab.freedesktop.org=
/cairo/cairo/-/commit/90e85c2493fdfa3551f202ff10282463f1e36645" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.freedesktop.org/cairo/cairo/-/comm=
it/90e85c2493fdfa3551f202ff10282463f1e36645</a><br>
&gt;=C2=A0 CVE-2019-6461.patch=C2=A0 : <a href=3D"https://gitlab.freedeskto=
p.org/cairo/cairo/-/commit/09643ee1abdd5daacebfcb564448f29be9a79bac" rel=3D=
"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/cairo/cairo/-=
/commit/09643ee1abdd5daacebfcb564448f29be9a79bac</a><br>
&gt;=C2=A0 CVE-2019-6462.patch=C2=A0 : <a href=3D"https://gitlab.freedeskto=
p.org/cairo/cairo/-/commit/bbeaf08190d3006a80b80a77724801cd477a37b8" rel=3D=
"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/cairo/cairo/-=
/commit/bbeaf08190d3006a80b80a77724801cd477a37b8</a><br>
&gt;=C2=A0 CVE-2020-35492.patch : <a href=3D"https://gitlab.freedesktop.org=
/cairo/cairo/-/commit/c986a7310bb06582b7d8a566d5f007ba4e5e75bf" rel=3D"nore=
ferrer" target=3D"_blank">https://gitlab.freedesktop.org/cairo/cairo/-/comm=
it/c986a7310bb06582b7d8a566d5f007ba4e5e75bf</a><br>
&gt; <br>
&gt; These options are all gone [2]: directfb, valgrind, egl, glesv2, openg=
l, trace<br>
&gt; <br>
&gt; Build tool is changed : autotools -&gt; meson<br>
&gt; <br>
&gt; Fix cross compile error [3] by adding cairo.cross file.<br>
&gt; <br>
&gt; [1] <a href=3D"https://www.cairographics.org/news/cairo-1.18.0/" rel=
=3D"noreferrer" target=3D"_blank">https://www.cairographics.org/news/cairo-=
1.18.0/</a><br>
&gt; [2] <a href=3D"https://gitlab.freedesktop.org/cairo/cairo/-/blob/maste=
r/meson_options.txt" rel=3D"noreferrer" target=3D"_blank">https://gitlab.fr=
eedesktop.org/cairo/cairo/-/blob/master/meson_options.txt</a><br>
&gt; [3] <a href=3D"https://gitlab.freedesktop.org/cairo/cairo/-/issues/613=
" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/cairo=
/cairo/-/issues/613</a><br>
&gt; <br>
&gt; Signed-off-by: qiutt &lt;<a href=3D"mailto:qiutt@fujitsu.com" target=
=3D"_blank">qiutt@fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt; .../cairo/cairo/CVE-2018-19876.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 34 ---------<br>
&gt; .../cairo/cairo/CVE-2019-6461.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 20 ------<br>
&gt; .../cairo/cairo/CVE-2019-6462.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 40 -----------<br>
&gt; .../cairo/cairo/CVE-2020-35492.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 60 ----------------<br>
&gt; .../{<a href=3D"http://cairo_1.16.0.bb" rel=3D"noreferrer" target=3D"_=
blank">cairo_1.16.0.bb</a> =3D&gt; <a href=3D"http://cairo_1.18.0.bb" rel=
=3D"noreferrer" target=3D"_blank">cairo_1.18.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
| 72 +++++++------------<br>
&gt; 5 files changed, 25 insertions(+), 201 deletions(-)<br>
&gt; delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2018-19876.pa=
tch<br>
&gt; delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2019-6461.pat=
ch<br>
&gt; delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2019-6462.pat=
ch<br>
&gt; delete mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2020-35492.pa=
tch<br>
&gt; rename meta/recipes-graphics/cairo/{<a href=3D"http://cairo_1.16.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a> =3D&gt; <a href=
=3D"http://cairo_1.18.0.bb" rel=3D"noreferrer" target=3D"_blank">cairo_1.18=
.0.bb</a>} (51%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch b/=
meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 4252a5663b..0000000000<br>
&gt; --- a/meta/recipes-graphics/cairo/cairo/CVE-2018-19876.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,34 +0,0 @@<br>
&gt; -CVE: CVE-2018-19876<br>
&gt; -Upstream-Status: Backport<br>
&gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.co=
m" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; -<br>
&gt; -From 90e85c2493fdfa3551f202ff10282463f1e36645 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Carlos Garcia Campos &lt;<a href=3D"mailto:cgarcia@igalia.com" =
target=3D"_blank">cgarcia@igalia.com</a>&gt;<br>
&gt; -Date: Mon, 19 Nov 2018 12:33:07 +0100<br>
&gt; -Subject: [PATCH] ft: Use FT_Done_MM_Var instead of free when availabl=
e in<br>
&gt; - cairo_ft_apply_variations<br>
&gt; -<br>
&gt; -Fixes a crash when using freetype &gt;=3D 2.9<br>
&gt; ----<br>
&gt; - src/cairo-ft-font.c | 4 ++++<br>
&gt; - 1 file changed, 4 insertions(+)<br>
&gt; -<br>
&gt; -diff --git a/src/cairo-ft-font.c b/src/cairo-ft-font.c<br>
&gt; -index 325dd61b4..981973f78 100644<br>
&gt; ---- a/src/cairo-ft-font.c<br>
&gt; -+++ b/src/cairo-ft-font.c<br>
&gt; -@@ -2393,7 +2393,11 @@ skip:<br>
&gt; - done:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free (coords);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free (current_coords);<br>
&gt; -+#if HAVE_FT_DONE_MM_VAR<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FT_Done_MM_Var (face-&gt;glyph-&gt;libra=
ry, ft_mm_var);<br>
&gt; -+#else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free (ft_mm_var);<br>
&gt; -+#endif<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; - }<br>
&gt; - <br>
&gt; --- <br>
&gt; -2.11.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch b/m=
eta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch<br>
&gt; deleted file mode 100644<br>
&gt; index a2dba6cb20..0000000000<br>
&gt; --- a/meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,20 +0,0 @@<br>
&gt; -There is an assertion in function _cairo_arc_in_direction().<br>
&gt; -<br>
&gt; -CVE: CVE-2019-6461<br>
&gt; -Upstream-Status: Pending<br>
&gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.co=
m" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; -<br>
&gt; -diff --git a/src/cairo-arc.c b/src/cairo-arc.c<br>
&gt; -index 390397bae..1bde774a4 100644<br>
&gt; ---- a/src/cairo-arc.c<br>
&gt; -+++ b/src/cairo-arc.c<br>
&gt; -@@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t=C2=A0 *cr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (cairo_status (cr))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 assert (angle_max &gt;=3D angle_min);<br>
&gt; -+=C2=A0 =C2=A0 if (angle_max &lt; angle_min)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (angle_max - angle_min &gt; 2 * M_PI * MAX_FUL=
L_CIRCLES) {<br>
&gt; - angle_max =3D fmod (angle_max - angle_min, 2 * M_PI);<br>
&gt; diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch b/m=
eta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 7c3209291b..0000000000<br>
&gt; --- a/meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,40 +0,0 @@<br>
&gt; -CVE: CVE-2019-6462<br>
&gt; -Upstream-Status: Backport<br>
&gt; -Signed-off-by: Quentin Schulz &lt;<a href=3D"mailto:quentin.schulz@th=
eobroma-systems.com" target=3D"_blank">quentin.schulz@theobroma-systems.com=
</a>&gt;<br>
&gt; -<br>
&gt; -From ab2c5ee21e5f3d3ee4b3f67cfcd5811a4f99c3a0 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Heiko Lewin &lt;<a href=3D"mailto:hlewin@gmx.de" target=3D"_bla=
nk">hlewin@gmx.de</a>&gt;<br>
&gt; -Date: Sun, 1 Aug 2021 11:16:03 +0000<br>
&gt; -Subject: [PATCH] _arc_max_angle_for_tolerance_normalized: fix infinit=
e loop<br>
&gt; -<br>
&gt; ----<br>
&gt; - src/cairo-arc.c | 4 +++-<br>
&gt; - 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/src/cairo-arc.c b/src/cairo-arc.c<br>
&gt; -index 390397bae..1c891d1a0 100644<br>
&gt; ---- a/src/cairo-arc.c<br>
&gt; -+++ b/src/cairo-arc.c<br>
&gt; -@@ -90,16 +90,18 @@ _arc_max_angle_for_tolerance_normalized (double t=
olerance)<br>
&gt; - { M_PI / 11.0,=C2=A0 9.81410988043554039085e-09 },<br>
&gt; -=C2=A0 =C2=A0 =C2=A0};<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int table_size =3D ARRAY_LENGTH (table);<br>
&gt; -+=C2=A0 =C2=A0 const int max_segments =3D 1000; /* this value is chos=
en arbitrarily. this gives an error of about 1.74909e-20 */<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; table_size; i++)<br>
&gt; - if (table[i].error &lt; tolerance)<br>
&gt; -=C2=A0 =C2=A0 return table[i].angle;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0++i;<br>
&gt; -+<br>
&gt; -=C2=A0 =C2=A0 =C2=A0do {<br>
&gt; - angle =3D M_PI / i++;<br>
&gt; - error =3D _arc_error_normalized (angle);<br>
&gt; --=C2=A0 =C2=A0 } while (error &gt; tolerance);<br>
&gt; -+=C2=A0 =C2=A0 } while (error &gt; tolerance &amp;&amp; i &lt; max_se=
gments);<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0return angle;<br>
&gt; - }<br>
&gt; --- <br>
&gt; -2.38.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch b/=
meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch<br>
&gt; deleted file mode 100644<br>
&gt; index fb6ce5cfdf..0000000000<br>
&gt; --- a/meta/recipes-graphics/cairo/cairo/CVE-2020-35492.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,60 +0,0 @@<br>
&gt; -Fix stack buffer overflow.<br>
&gt; -<br>
&gt; -CVE: CVE-2020-35492<br>
&gt; -Upstream-Status: Backport<br>
&gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com"=
 target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; -<br>
&gt; -From 03a820b173ed1fdef6ff14b4468f5dbc02ff59be Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Heiko Lewin &lt;<a href=3D"mailto:heiko.lewin@worldiety.de" tar=
get=3D"_blank">heiko.lewin@worldiety.de</a>&gt;<br>
&gt; -Date: Tue, 15 Dec 2020 16:48:19 +0100<br>
&gt; -Subject: [PATCH] Fix mask usage in image-compositor<br>
&gt; -<br>
&gt; ----<br>
&gt; - src/cairo-image-compositor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 ++--<br>
&gt; - test/Makefile.sources=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt; - test/bug-image-compositor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 39 ++++++++++++++++++++<br>
&gt; - test/reference/bug-image-compositor.ref.png | Bin 0 -&gt; 185 bytes<=
br>
&gt; - 4 files changed, 44 insertions(+), 4 deletions(-)<br>
&gt; - create mode 100644 test/bug-image-compositor.c<br>
&gt; - create mode 100644 test/reference/bug-image-compositor.ref.png<br>
&gt; -<br>
&gt; -diff --git a/src/cairo-image-compositor.c b/src/cairo-image-composito=
r.c<br>
&gt; -index 79ad69f68..4f8aaed99 100644<br>
&gt; ---- a/src/cairo-image-compositor.c<br>
&gt; -+++ b/src/cairo-image-compositor.c<br>
&gt; -@@ -2601,14 +2601,14 @@ _inplace_src_spans (void *abstract_renderer, =
int y, int h,<br>
&gt; -=C2=A0 =C2=A0 unsigned num_spans)<br>
&gt; - {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cairo_image_span_renderer_t *r =3D abstract_rende=
rer;<br>
&gt; --=C2=A0 =C2=A0 uint8_t *m;<br>
&gt; -+=C2=A0 =C2=A0 uint8_t *m, *base =3D (uint8_t*)pixman_image_get_data(=
r-&gt;mask);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0int x0;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (num_spans =3D=3D 0)<br>
&gt; - return CAIRO_STATUS_SUCCESS;<br>
&gt; - <br>
&gt; -=C2=A0 =C2=A0 =C2=A0x0 =3D spans[0].x;<br>
&gt; --=C2=A0 =C2=A0 m =3D r-&gt;_buf;<br>
&gt; -+=C2=A0 =C2=A0 m =3D base;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0do {<br>
&gt; - int len =3D spans[1].x - spans[0].x;<br>
&gt; - if (len &gt;=3D r-&gt;u.composite.run_length &amp;&amp; spans[0].cov=
erage =3D=3D 0xff) {<br>
&gt; -@@ -2655,7 +2655,7 @@ _inplace_src_spans (void *abstract_renderer, in=
t y, int h,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 spans[0].x, y,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 spans[1].x - spans[0].x, h);<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 m =3D r-&gt;_buf;<br>
&gt; -+=C2=A0 =C2=A0 m =3D base;<br>
&gt; -=C2=A0 =C2=A0 x0 =3D spans[1].x;<br>
&gt; - } else if (spans[0].coverage =3D=3D 0x0) {<br>
&gt; -=C2=A0 =C2=A0 if (spans[0].x !=3D x0) {<br>
&gt; -@@ -2684,7 +2684,7 @@ _inplace_src_spans (void *abstract_renderer, in=
t y, int h,<br>
&gt; - #endif<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 m =3D r-&gt;_buf;<br>
&gt; -+=C2=A0 =C2=A0 m =3D base;<br>
&gt; -=C2=A0 =C2=A0 x0 =3D spans[1].x;<br>
&gt; - } else {<br>
&gt; -=C2=A0 =C2=A0 *m++ =3D spans[0].coverage;<br>
&gt; --- <br>
&gt; diff --git a/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.=
0.bb" rel=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a> b/meta/recip=
es-graphics/cairo/<a href=3D"http://cairo_1.18.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">cairo_1.18.0.bb</a><br>
&gt; similarity index 51%<br>
&gt; rename from meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0=
.bb" rel=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a><br>
&gt; rename to meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.18.0.b=
b" rel=3D"noreferrer" target=3D"_blank">cairo_1.18.0.bb</a><br>
&gt; index ffb813d290..ffae13b48a 100644<br>
&gt; --- a/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb" r=
el=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a><br>
&gt; +++ b/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.18.0.bb" r=
el=3D"noreferrer" target=3D"_blank">cairo_1.18.0.bb</a><br>
&gt; @@ -7,7 +7,7 @@ optional translucence (opacity/alpha) and combined usi=
ng the \<br>
&gt; extended Porter/Duff compositing algebra as found in the X Render \<br=
>
&gt; Extension.&quot;<br>
&gt; HOMEPAGE =3D &quot;<a href=3D"http://cairographics.org" rel=3D"norefer=
rer" target=3D"_blank">http://cairographics.org</a>&quot;<br>
&gt; -BUGTRACKER =3D &quot;<a href=3D"http://bugs.freedesktop.org" rel=3D"n=
oreferrer" target=3D"_blank">http://bugs.freedesktop.org</a>&quot;<br>
&gt; +BUGTRACKER =3D &quot;<a href=3D"https://gitlab.freedesktop.org/cairo/=
cairo/-/issues" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedes=
ktop.org/cairo/cairo/-/issues</a>&quot;<br>
&gt; SECTION =3D &quot;libs&quot;<br>
&gt; <br>
&gt; LICENSE =3D &quot;(MPL-1.1 | LGPL-2.1-only) &amp; GPL-3.0-or-later&quo=
t;<br>
&gt; @@ -26,62 +26,40 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3De7=
3e999e0c72b5ac9012424fa157ad77 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;trace&#39;, &#39;f=
ile://util/cairo-trace/COPYING-GPL-3;md5=3Dd32239bcb673463ab874e80d47fae504=
&#39;, &#39;&#39;, d)}&quot;<br>
&gt; <br>
&gt; <br>
&gt; -DEPENDS =3D &quot;fontconfig glib-2.0 libpng pixman zlib&quot;<br>
&gt; +DEPENDS =3D &quot;fontconfig freetype glib-2.0 libpng pixman zlib&quo=
t;<br>
&gt; <br>
&gt; SRC_URI =3D &quot;<a href=3D"http://cairographics.org/releases/cairo-$=
%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://cairographics.=
org/releases/cairo-${PV}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cairo-get_bitmap_surfa=
ce-bsc1036789-CVE-2017-7475.diff \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2018-19876.patch =
\<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2019-6461.patch \=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2019-6462.patch \=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2020-35492.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; <br>
&gt; -SRC_URI[md5sum] =3D &quot;f19e0353828269c22bd72e271243a552&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;5e7b29b3f113ef870d1e3ecf8adf21f923396401=
604bda16d44be45e66052331&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;243a0736b978a33dee29f9cca7521733b78a65b5=
418206fef7bd1c3d4cf10b64&quot;<br>
&gt; <br>
&gt; -inherit autotools pkgconfig upstream-version-is-even gtk-doc multilib=
_script<br>
&gt; +inherit meson pkgconfig upstream-version-is-even gtk-doc multilib_scr=
ipt<br>
&gt; +<br>
&gt; +# Tell libsoup where the target ntlm_auth is installed<br>
&gt; +do_write_config:append:class-target() {<br>
&gt; +=C2=A0 =C2=A0 cat &gt;${WORKDIR}/cairo.cross &lt;&lt;EOF<br>
&gt; +[binaries]<br>
&gt; +ipc_rmid_deferred_release =3D &#39;true&#39;<br>
&gt; +EOF<br>
&gt; +}<br>
&gt; +EXTRA_OEMESON:append:class-target =3D &quot; --cross-file ${WORKDIR}/=
cairo.cross&quot;<br>
&gt; +<br>
&gt; +GTKDOC_MESON_OPTION =3D &quot;gtk_doc&quot;<br>
&gt; <br>
&gt; MULTILIB_SCRIPTS =3D &quot;${PN}-perf-utils:${bindir}/cairo-trace&quot=
;<br>
&gt; <br>
&gt; -X11DEPENDS =3D &quot;virtual/libx11 libsm libxrender libxext&quot;<br=
>
&gt; -<br>
&gt; -PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39=
;, &#39;directfb&#39;, d)} \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;x11 xcb=
&#39;, &#39;&#39;, d)} \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11 opengl&#39;, &#39;=
opengl&#39;, &#39;&#39;, d)} \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
trace&quot;<br>
&gt; -PACKAGECONFIG:class-native =3D &quot;${@bb.utils.contains(&#39;DISTRO=
_FEATURES&#39;, &#39;x11&#39;, &#39;x11 xcb&#39;, &#39;&#39;, d)}&quot;<br>
&gt; -PACKAGECONFIG:class-nativesdk =3D &quot;${@bb.utils.contains(&#39;DIS=
TRO_FEATURES&#39;, &#39;x11&#39;, &#39;x11 xcb&#39;, &#39;&#39;, d)}&quot;<=
br>
&gt; -<br>
&gt; -PACKAGECONFIG[x11] =3D &quot;--with-x=3Dyes -enable-xlib,--with-x=3Dn=
o --disable-xlib,${X11DEPENDS}&quot;<br>
&gt; -PACKAGECONFIG[xcb] =3D &quot;--enable-xcb,--disable-xcb,libxcb&quot;<=
br>
&gt; -PACKAGECONFIG[directfb] =3D &quot;--enable-directfb=3Dyes,,directfb&q=
uot;<br>
&gt; -PACKAGECONFIG[valgrind] =3D &quot;--enable-valgrind=3Dyes,--disable-v=
algrind,valgrind&quot;<br>
&gt; -PACKAGECONFIG[egl] =3D &quot;--enable-egl=3Dyes,--disable-egl,virtual=
/egl&quot;<br>
&gt; -PACKAGECONFIG[glesv2] =3D &quot;--enable-glesv2,--disable-glesv2,virt=
ual/libgles2&quot;<br>
&gt; -PACKAGECONFIG[opengl] =3D &quot;--enable-gl,--disable-gl,virtual/libg=
l&quot;<br>
&gt; -# trace is under GPLv3<br>
&gt; -PACKAGECONFIG[trace] =3D &quot;--enable-trace,--disable-trace&quot;<b=
r>
&gt; -<br>
&gt; -EXTRA_OECONF +=3D &quot; \<br>
&gt; -=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;TARGET_FPU&#39;, &#39;soft&#3=
9;, &#39;--disable-some-floating-point&#39;, &#39;&#39;, d)} \<br>
&gt; -=C2=A0 =C2=A0 --enable-tee \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -# We don&#39;t depend on binutils so we need to disable this<br>
&gt; -export ac_cv_lib_bfd_bfd_openr=3D&quot;no&quot;<br>
&gt; -# Ensure we don&#39;t depend on LZO<br>
&gt; -export ac_cv_lib_lzo2_lzo2a_decompress=3D&quot;no&quot;<br>
&gt; +PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#=
39;, &#39;x11&#39;, &#39;xlib xcb&#39;, &#39;&#39;, d)} trace&quot;<br>
&gt; +PACKAGECONFIG[xlib] =3D &quot;-Dxlib=3Denabled,-Dxlib=3Ddisabled,virt=
ual/libx11 libxrender libxext&quot;<br>
&gt; +PACKAGECONFIG[xcb] =3D &quot;-Dxcb=3Denabled,-Dxcb=3Ddisabled,libxcb&=
quot;<br>
&gt; +# cairo-trace is GPLv3 so add an option to remove it<br>
&gt; +PACKAGECONFIG[trace] =3D &quot;&quot;<br>
&gt; <br>
&gt; do_install:append () {<br>
&gt; - rm -rf ${D}${bindir}/cairo-sphinx<br>
&gt; - rm -rf ${D}${libdir}/cairo/cairo-fdr*<br>
&gt; - rm -rf ${D}${libdir}/cairo/cairo-sphinx*<br>
&gt; - rm -rf ${D}${libdir}/cairo/.debug/cairo-fdr*<br>
&gt; - rm -rf ${D}${libdir}/cairo/.debug/cairo-sphinx*<br>
&gt; - [ ! -d ${D}${bindir} ] ||<br>
&gt; - rmdir -p --ignore-fail-on-non-empty ${D}${bindir}<br>
&gt; - [ ! -d ${D}${libdir}/cairo ] ||<br>
&gt; - rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/cairo<br>
&gt; +=C2=A0 =C2=A0 if ! ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39=
;trace&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm ${D}${bindir}/cairo-trace ${D}${libdir=
}/cairo/libcairo-trace.so<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rmdir --ignore-fail-on-non-empty ${D}${bi=
ndir} ${D}${libdir}/cairo<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; }<br>
&gt; <br>
&gt; PACKAGES =3D+ &quot;cairo-gobject cairo-script-interpreter cairo-perf-=
utils&quot;<br>
&gt; @@ -99,7 +77,7 @@ DESCRIPTION:cairo-perf-utils =3D &quot;The Cairo lib=
rary performance utilities&quot;<br>
&gt; FILES:${PN} =3D &quot;${libdir}/libcairo.so.*&quot;<br>
&gt; FILES:${PN}-gobject =3D &quot;${libdir}/libcairo-gobject.so.*&quot;<br=
>
&gt; FILES:${PN}-script-interpreter =3D &quot;${libdir}/libcairo-script-int=
erpreter.so.*&quot;<br>
&gt; -FILES:${PN}-perf-utils =3D &quot;${bindir}/cairo-trace* ${libdir}/cai=
ro/*.la ${libdir}/cairo/libcairo-trace.so&quot;<br>
&gt; +FILES:${PN}-perf-utils =3D &quot;${bindir}/cairo-* ${libdir}/cairo/li=
bcairo-trace.so ${libdir}/cairo/libcairo-fdr.so&quot;<br>
&gt; <br>
&gt; BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; <br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#193520): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/193520" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/193520</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103380468/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103380468/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</div>
</div>

--000000000000aa5d21060e9da7e8--

