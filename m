Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
 by mx.groups.io with SMTP id smtpd.web11.8397.1589297868287082058
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 08:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Dbg3zPG3;
 spf=pass (domain: gmail.com, ip: 209.85.217.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f65.google.com with SMTP id a5so8119430vsm.7
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 08:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qD8v1yGiH0OpSaBrDnIDTkLBm9lgiRwGkE0r0zIO+Tc=;
        b=Dbg3zPG3iOZmYjcei7bLqyO1euJnYHI4rJULSUp4cZZD8G69lAX4HONIyZGyYYmGsA
         BEtgR9L05haZFFnmLxITZaXcXn+GPCI+Q12q2U6sIEEJbZLQf/BjbMNCWYMazh5YO8dj
         qSspyNAwpP4dLqTp1905moR0snQBKTyzF9E8d43n91p58ZOTci5SatthkOmk/szkqFeh
         wKKI3Sf5l2stqq9Jm7diOWamGwPPt2U/k+aMGYlzSUr0YGW+mitINWQjfHFVfn9/vjFE
         cInjVzCTXmDHbSKUzXgRdWACpjpSB6iQ47nEA18Ilab2UlN1QvQhIq5D1P/AQSCW8mxm
         Hh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qD8v1yGiH0OpSaBrDnIDTkLBm9lgiRwGkE0r0zIO+Tc=;
        b=eJq8r/wP0Hvq1HEq9Mnq9PsRZSqAUGklHPjaELBagPlP8zi5YBcBAiGyHrTyAk9zsu
         vsQbcUo85sJDNvde9IzX4haFCuAJe7lhTHCPmv5NpDG2uV6cINJELxjZW5f9BdF25koA
         n3kcf0Ul0ja/6aC4OwMxkN/T+QozvCzMs9vIhwUTmIWrex09icooo1EdNAhOHg8U2KiY
         CywTFV06ISvfO4VmSYyBgmsTThPzAoTx/1m2AzLnVo6qI6lG0qGLUgm/y/Wyznvy1+ku
         E4tPSQmPc/sLOFq5JUWOCKS0mpvFIae2y6M79VO+9qs4LWZ9uggoiKTap5M5EGrl6xOL
         DYpQ==
X-Gm-Message-State: AGi0PuZF9EgFo16Zk4HT/6UjmqoWp8SmIKudzAji9QSyHtKIQDqAm90b
	T+Q1oTwBIHzRcleBbOaSH4evNWbWneKAfy+giCI=
X-Google-Smtp-Source: APiQypKNj1To6nrcIyjrGM+FTE2b7OWGJzOkp971g2VfO0fifwzzUArJ0eWrMQ5w/s5Jtc7w/CyHYMj99f5p9Jv+pSE=
X-Received: by 2002:a67:fc8d:: with SMTP id x13mr17571818vsp.83.1589297867323;
 Tue, 12 May 2020 08:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200512151125.30472-1-alex.kanavin@gmail.com> <6194fc05-2ee6-f7fd-823f-71a88dc19149@gmail.com>
In-Reply-To: <6194fc05-2ee6-f7fd-823f-71a88dc19149@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 12 May 2020 17:37:35 +0200
Message-ID: <CANNYZj-4oNXUX2G=UWJLzQ_PCEHVohKvis-Cw8wxFQy1-qnhCQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] bitbake.conf: propagate 'opengl' DISTRO_FEATURE to native/nativesdk from target
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d2fc7905a5753e2d"

--000000000000d2fc7905a5753e2d
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 May 2020 at 17:20, Khem Raj <raj.khem@gmail.com> wrote:

> DISTRO_FEATURES are meant for target most of the time so this seems not
> the right way to go about it. perhaps HOST_DISTRO_FEATURES or some such
> would be the way to go, since it should not be enforced on folks who do
> not want it and dont use qemu as machine but just as a veneer to cross
> build stuff.
>

If someone isn't using qemu-system-native recipe (the full system
emulators), then qemu-system-native isn't built at all, and so they're
entirely unaffected, no? All the native opengl stuff is pulled in by only
that recipe.

Otherwise, it's easy to disable: set DISTRO_FEATURES_FILTER_NATIVE to "".

Alex


>
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >   meta/conf/bitbake.conf                                     | 4 ++--
> >   meta/recipes-gnome/gtk+/gtk+3.inc                          | 2 ++
> >   meta/recipes-graphics/cairo/cairo_1.16.0.bb                | 2 ++
> >   meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb           | 2 --
> >   meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb | 2 --
> >   5 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index bdade79abe..f7700f1191 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -833,8 +833,8 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
> >
> >   # Normally target distro features will not be applied to native builds:
> >   # Native distro features on this list will use the target feature value
> > -DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation"
> > -DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation"
> > +DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation opengl"
> > +DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation opengl"
> >
> >   DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit
> gobject-introspection-data ldconfig"
> >   MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
> > diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc
> b/meta/recipes-gnome/gtk+/gtk+3.inc
> > index 5d1f59ea1a..6154154004 100644
> > --- a/meta/recipes-gnome/gtk+/gtk+3.inc
> > +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
> > @@ -46,6 +46,8 @@ do_compile_prepend() {
> >
> >   PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'opengl
> wayland x11', d)} \
> >                      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl
> x11', 'glx', '', d)}"
> > +PACKAGECONFIG_class-native = "${@bb.utils.filter('DISTRO_FEATURES',
> 'x11', d)}"
> > +PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES',
> 'x11', d)}"
> >
> >   PACKAGECONFIG[x11] =
> "--enable-x11-backend,--disable-x11-backend,at-spi2-atk fontconfig libx11
> libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite
> libxfixes"
> >   # this is provided by oe-core patch that removes epoxy/gl dependency
> from a X11 build
> > diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> > index b772c2ece2..092c77b826 100644
> > --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> > +++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> > @@ -42,6 +42,8 @@ PACKAGECONFIG ??=
> "${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
> >                      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11
> xcb', '', d)} \
> >                      ${@bb.utils.contains('DISTRO_FEATURES', 'x11
> opengl', 'opengl', '', d)} \
> >                      trace"
> > +PACKAGECONFIG_class-native = "${@bb.utils.contains('DISTRO_FEATURES',
> 'x11', 'x11 xcb', '', d)}"
> > +PACKAGECONFIG_class-nativesdk =
> "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)}"
> >
> >   PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no
> --disable-xlib,${X11DEPENDS}"
> >   PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
> > diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
> b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
> > index 0782c6ce35..6646ef79fe 100644
> > --- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
> > +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
> > @@ -19,8 +19,6 @@ UPSTREAM_CHECK_URI = "
> https://github.com/anholt/libepoxy/releases"
> >   inherit meson pkgconfig features_check
> >
> >   REQUIRED_DISTRO_FEATURES = "opengl"
> > -REQUIRED_DISTRO_FEATURES_class-native = ""
> > -REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
> >
> >   PACKAGECONFIG[egl] = "-Degl=yes, -Degl=no, virtual/egl"
> >   PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no -Dx11=false, virtual/libx11
> virtual/libgl"
> > diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> > index 1046b8504f..29b12628d0 100644
> > --- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> > +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> > @@ -22,5 +22,3 @@ inherit meson pkgconfig features_check
> >   BBCLASSEXTEND = "native nativesdk"
> >
> >   REQUIRED_DISTRO_FEATURES = "opengl"
> > -REQUIRED_DISTRO_FEATURES_class-native = ""
> > -REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
> >
> >
> > 
> >
>

--000000000000d2fc7905a5753e2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 12 May 2020 at 17:20, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
DISTRO_FEATURES are meant for target most of the time so this seems not <b=
r>
the right way to go about it. perhaps HOST_DISTRO_FEATURES or some such<br=
>
would be the way to go, since it should not be enforced on folks who do<br=
>
not want it and dont use qemu as machine but just as a veneer to cross <br=
>
build stuff.<br></blockquote><div><br></div><div>If someone isn&#39;t usin=
g qemu-system-native recipe (the full system emulators), then qemu-system-n=
ative isn&#39;t built at all, and so they&#39;re entirely unaffected, no? A=
ll the native opengl stuff is pulled in by only that recipe.<br></div></div=
><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Otherwise,=
 it&#39;s easy to disable: set DISTRO_FEATURES_FILTER_NATIVE to &quot;&quot=
;.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Ale=
x<br></div><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
&gt;=C2=A0 =C2=A0meta/recipes-gnome/gtk+/gtk+3.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<=
br>
&gt;=C2=A0 =C2=A0meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.=
0.bb" rel=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
&gt;=C2=A0 =C2=A0meta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy=
_1.5.4.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.4.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 --<br>
&gt;=C2=A0 =C2=A0meta/recipes-graphics/virglrenderer/<a href=3D"http://vir=
glrenderer_0.8.2.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8=
.2.bb</a> | 2 --<br>
&gt;=C2=A0 =C2=A05 files changed, 6 insertions(+), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index bdade79abe..f7700f1191 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -833,8 +833,8 @@ DISTRO_FEATURES_NATIVESDK ?=3D &quot;x11&quot;<br=
>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# Normally target distro features will not be applied to =
native builds:<br>
&gt;=C2=A0 =C2=A0# Native distro features on this list will use the target=
 feature value<br>
&gt; -DISTRO_FEATURES_FILTER_NATIVE ?=3D &quot;api-documentation&quot;<br>
&gt; -DISTRO_FEATURES_FILTER_NATIVESDK ?=3D &quot;api-documentation&quot;<=
br>
&gt; +DISTRO_FEATURES_FILTER_NATIVE ?=3D &quot;api-documentation opengl&qu=
ot;<br>
&gt; +DISTRO_FEATURES_FILTER_NATIVESDK ?=3D &quot;api-documentation opengl=
&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0DISTRO_FEATURES_BACKFILL =3D &quot;pulseaudio sysvinit go=
bject-introspection-data ldconfig&quot;<br>
&gt;=C2=A0 =C2=A0MACHINE_FEATURES_BACKFILL =3D &quot;rtc qemu-usermode&quo=
t;<br>
&gt; diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/g=
tk+/gtk+3.inc<br>
&gt; index 5d1f59ea1a..6154154004 100644<br>
&gt; --- a/meta/recipes-gnome/gtk+/gtk+3.inc<br>
&gt; +++ b/meta/recipes-gnome/gtk+/gtk+3.inc<br>
&gt; @@ -46,6 +46,8 @@ do_compile_prepend() {<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_=
FEATURES&#39;, &#39;opengl wayland x11&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl x11&#39=
;, &#39;glx&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +PACKAGECONFIG_class-native =3D &quot;${@bb.utils.filter(&#39;DISTRO_=
FEATURES&#39;, &#39;x11&#39;, d)}&quot;<br>
&gt; +PACKAGECONFIG_class-nativesdk =3D &quot;${@bb.utils.filter(&#39;DIST=
RO_FEATURES&#39;, &#39;x11&#39;, d)}&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[x11] =3D &quot;--enable-x11-backend,--disab=
le-x11-backend,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxd=
amage libxrandr libxrender libxcomposite libxfixes&quot;<br>
&gt;=C2=A0 =C2=A0# this is provided by oe-core patch that removes epoxy/gl=
 dependency from a X11 build<br>
&gt; diff --git a/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16=
.0.bb" rel=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a> b/meta/reci=
pes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">cairo_1.16.0.bb</a><br>
&gt; index b772c2ece2..092c77b826 100644<br>
&gt; --- a/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb" =
rel=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a><br>
&gt; +++ b/meta/recipes-graphics/cairo/<a href=3D"http://cairo_1.16.0.bb" =
rel=3D"noreferrer" target=3D"_blank">cairo_1.16.0.bb</a><br>
&gt; @@ -42,6 +42,8 @@ PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;D=
ISTRO_FEATURES&#39;, &#39;directfb&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39=
;x11 xcb&#39;, &#39;&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11 opengl&#39=
;, &#39;opengl&#39;, &#39;&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 trace&quot;<br>
&gt; +PACKAGECONFIG_class-native =3D &quot;${@bb.utils.contains(&#39;DISTR=
O_FEATURES&#39;, &#39;x11&#39;, &#39;x11 xcb&#39;, &#39;&#39;, d)}&quot;<br=
>
&gt; +PACKAGECONFIG_class-nativesdk =3D &quot;${@bb.utils.contains(&#39;DI=
STRO_FEATURES&#39;, &#39;x11&#39;, &#39;x11 xcb&#39;, &#39;&#39;, d)}&quot;=
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[x11] =3D &quot;--with-x=3Dyes -enable-xlib,=
--with-x=3Dno --disable-xlib,${X11DEPENDS}&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[xcb] =3D &quot;--enable-xcb,--disable-xcb,l=
ibxcb&quot;<br>
&gt; diff --git a/meta/recipes-graphics/libepoxy/<a href=3D"http://libepox=
y_1.5.4.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.4.bb</a> b/me=
ta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy_1.5.4.bb" rel=3D"no=
referrer" target=3D"_blank">libepoxy_1.5.4.bb</a><br>
&gt; index 0782c6ce35..6646ef79fe 100644<br>
&gt; --- a/meta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy_1.5.4=
.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.4.bb</a><br>
&gt; +++ b/meta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy_1.5.4=
.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.4.bb</a><br>
&gt; @@ -19,8 +19,6 @@ UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://git=
hub.com/anholt/libepoxy/releases" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/anholt/libepoxy/releases</a>&quot;<br>
&gt;=C2=A0 =C2=A0inherit meson pkgconfig features_check<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
&gt; -REQUIRED_DISTRO_FEATURES_class-native =3D &quot;&quot;<br>
&gt; -REQUIRED_DISTRO_FEATURES_class-nativesdk =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[egl] =3D &quot;-Degl=3Dyes, -Degl=3Dno, vir=
tual/egl&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[x11] =3D &quot;-Dglx=3Dyes, -Dglx=3Dno -Dx1=
1=3Dfalse, virtual/libx11 virtual/libgl&quot;<br>
&gt; diff --git a/meta/recipes-graphics/virglrenderer/<a href=3D"http://vi=
rglrenderer_0.8.2.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.=
8.2.bb</a> b/meta/recipes-graphics/virglrenderer/<a href=3D"http://virglren=
derer_0.8.2.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.2.bb=
</a><br>
&gt; index 1046b8504f..29b12628d0 100644<br>
&gt; --- a/meta/recipes-graphics/virglrenderer/<a href=3D"http://virglrend=
erer_0.8.2.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.2.bb<=
/a><br>
&gt; +++ b/meta/recipes-graphics/virglrenderer/<a href=3D"http://virglrend=
erer_0.8.2.bb" rel=3D"noreferrer" target=3D"_blank">virglrenderer_0.8.2.bb<=
/a><br>
&gt; @@ -22,5 +22,3 @@ inherit meson pkgconfig features_check<br>
&gt;=C2=A0 =C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
&gt; -REQUIRED_DISTRO_FEATURES_class-native =3D &quot;&quot;<br>
&gt; -REQUIRED_DISTRO_FEATURES_class-nativesdk =3D &quot;&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div></div>

--000000000000d2fc7905a5753e2d--
