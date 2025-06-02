Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 886A8C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 22:07:18 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.7940.1748902035495358746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 15:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LXD0ezlv;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-70e302191a3so42420177b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 15:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748902034; x=1749506834; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cv7R7nOT94xLfx9ZIitmL5p9x0sldqzVfcurG29s0xA=;
        b=LXD0ezlvLAoNf9mvGvsqjPsDvK1+7VBZ+v9AC0f81PZCCBtJzDWp6N7hCTzBoHmaox
         v2Ef4RMT2uo83cXK4gWkTYIdiCtD9MQKNtp9gzgT9ZjORSPZ43FplH0HHx7cPjO1dQXe
         ip8fk1WAqhgETyfNhxk6Y4KdyWa3Lx3HxUxA5GoTu27nu41hh4bm3qoiGxOQIiLdtUNY
         n9UnaK4GxHGbnNPQWxJvuB7BoWCU53HpRJ2vCNNzN5OznIBZP2TKwlBIP4unRfM6gGJ+
         Q5H81LG8zSs9BTCrwNpqx7M7SJNauXk/Pfc7NUpYKuyuCsP0eHUxvITx2s2b82ItzS6F
         I6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748902034; x=1749506834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cv7R7nOT94xLfx9ZIitmL5p9x0sldqzVfcurG29s0xA=;
        b=jH/XQ2nnBUI9nY/XaEVpMiMDviqTHPVdbt0+E2Pvp8ayQEO9O2tWmwOnd+lBLgBpuc
         ixkFTTC5iSoQfaS+sn3cYGSoJMT6Fz1t/ud/vcW0BZhVRVTDetj5onfHCoxML+OGX3q/
         vf2c3U7i//pIRcbfktSeq4MQJlcH2RFcH7kTJrv5bDmtw5aBbGvphyU30Bej9TOdyZnx
         7lJJx+Mt2FU5bwK/5dK9Yr/sC5Wel6mqfXDAFpXkFeKlctbJ6oyYknt11UiXU2cSWcOa
         XSYk6/AwSUYDagmHQ4OxrWc64ZKUhp6EFIW5cvhRlIrr1Pz/KbR7FgSAI2SccCHLhXwR
         zcdA==
X-Gm-Message-State: AOJu0YwnYWCvU7AYGqBx0VIXjnSdxg5ImceNgs4zNzdenNpXXFYznt2W
	xMA8uoXKTxup+5g4JbSHKGVvJ/iK+xqTg4fpS0QXcuIPhMmVn/c+BDRURNXQE7FnE75CO3MUYkV
	mF9Au0+48E/lI6dF/J+cyLm6bkxl7/XQ=
X-Gm-Gg: ASbGncuXPOc6BgfHXbam54n3xBtEPpHSr2B7GMz+8sdJsU4+7b8DZQvExxXgtZROIkG
	Xe0o3Uy5n08lhRqJooLFWEzitZOBtFF2JmkyAn/V516R/Oztga3cVITPc4skySH47uWpAuIM1hY
	j8FnOsdqMgKNVxK2YeQwWyKWZ4/NHVjuTv/V3G7XgIfWfSe/uJoG9J8IbpyVoW6YTAnBA=
X-Google-Smtp-Source: AGHT+IFGl7oWyfYFn/Zhp1JseNL64colh4y/382dLqaPw5CYQOLg8NMMJb6zsltMMbe5INtBwvx6pydJwtzwSi+3zPM=
X-Received: by 2002:a05:690c:490d:b0:6fb:b8a1:d3bb with SMTP id
 00721157ae682-70f97ebe239mr221451127b3.17.1748902034602; Mon, 02 Jun 2025
 15:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250530205609.3185264-1-raj.khem@gmail.com> <765485fbbd229582a973ccb8e9119eec21fb2cbf.camel@linuxfoundation.org>
In-Reply-To: <765485fbbd229582a973ccb8e9119eec21fb2cbf.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Jun 2025 15:07:02 -0700
X-Gm-Features: AX0GCFtwPm34y6AB6jPc8j4P7SaJryPi125dr6IqgUt9-3aEc-23sjuXJcsFzaY
Message-ID: <CAMKF1sp5W5f=s19nELw_3=6Mqd6iFAnROjCAiB+0grso+cX3Ow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5] pixmap: Enable openmp support with clang compiler
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008501ec06369dfcfb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 22:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217741

--0000000000008501ec06369dfcfb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 2:41=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2025-05-30 at 13:56 -0700, Khem Raj via lists.openembedded.org
> wrote:
> > pixman's meson detects openmp support and if it finds it in runtime the=
n
> > enables it, this happens for gcc via gcc-runtime, however for clang, it
> > does not. In some cases e.g. mips it enables it during configure only t=
o
> > find that clang can not find the libomp during linking. Therefore, add
> > the dependency on openmp when using clang compiler. This ensures
> consistent
> > behaviour across architectures.
> >
> > Disable internal assembler on mips since it can not handle the inline
> assembly
> >
> > Turn openmp into a packageconfig
> >
> > openmp is not yet ported to all architectures e.g. RISCV32/PPC32
> > does not have it
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v5: Remove openmp on rv32 and ppc32
> >
> >  meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
> b/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
> > index c1c71fd4202..925a7d7b29b 100644
> > --- a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
> > +++ b/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
> > @@ -23,6 +23,17 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D14096c769ae0cbb5fcb94ec468be11b3 \
> >
> >  inherit meson pkgconfig
> >
> > +OPENMP ?=3D ""
> > +OPENMP:toolchain-clang =3D "openmp"
> > +# openmp is not yet ported to rv32/ppc
> > +OPENMP:remove:riscv32 =3D "openmp"
> > +OPENMP:remove:powerpc =3D "openmp"
> > +
> > +PACKAGECONFIG ??=3D "openmp"
> > +PACKAGECONFIG:class-native ?=3D ""
> > +
> > +PACKAGECONFIG[openmp] =3D ",-Dopenmp=3Ddisabled,${OPENMP}"
> > +
> >  # These are for the tests and demos, which we don't install
> >  EXTRA_OEMESON =3D "-Dgtk=3Ddisabled -Dlibpng=3Ddisabled"
> >  # ld: pixman/libpixman-mmx.a(pixman-mmx.c.o):
> > @@ -36,7 +47,7 @@ EXTRA_OEMESON:append:class-target:powerpc64le =3D "
> ${@bb.utils.contains("TUNE_FEA
> >  EXTRA_OEMESON:append:armv7a =3D
> "${@bb.utils.contains("TUNE_FEATURES","neon",""," -Dneon=3Ddisabled",d)}"
> >  EXTRA_OEMESON:append:armv7ve =3D
> "${@bb.utils.contains("TUNE_FEATURES","neon",""," -Dneon=3Ddisabled",d)}"
> >
> > -EXTRA_OEMESON:append:class-native =3D " -Dopenmp=3Ddisabled"
> > +CFLAGS:append:toolchain-clang:mipsarch =3D " -fno-integrated-as"
> >
> >  BBCLASSEXTEND =3D "native nativesdk"
>
> I think this needs more discussion or potentially a better fix.
>
> Potentially the test for openmp in pixman is wrong and it shouldn't
> build if it can find the header but not the library.
>

This is worth exploring more and if we can make the test robust it will
benefit overall


> Alternatively, if the openmp library can't be built, why are we
> shipping the header? Should we delete it in that case?
>

Header is installed by gcc-runtime package


> Something doesn't see right here and I think we need to fix the root
> cause


>
> Cheers,
>
> Richard
>
>
>
>
>

--0000000000008501ec06369dfcfb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 2, 2025 at 2:41=E2=80=AFPM =
Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ri=
chard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Fri, 2025-05-30 at 13:56 -0700, Khem Raj via <a href=3D"ht=
tp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.ope=
nembedded.org</a> wrote:<br>
&gt; pixman&#39;s meson detects openmp support and if it finds it in runtim=
e then<br>
&gt; enables it, this happens for gcc via gcc-runtime, however for clang, i=
t<br>
&gt; does not. In some cases e.g. mips it enables it during configure only =
to<br>
&gt; find that clang can not find the libomp during linking. Therefore, add=
<br>
&gt; the dependency on openmp when using clang compiler. This ensures consi=
stent<br>
&gt; behaviour across architectures.<br>
&gt; <br>
&gt; Disable internal assembler on mips since it can not handle the inline =
assembly<br>
&gt; <br>
&gt; Turn openmp into a packageconfig<br>
&gt; <br>
&gt; openmp is not yet ported to all architectures e.g. RISCV32/PPC32<br>
&gt; does not have it<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v5: Remove openmp on rv32 and ppc32<br>
&gt; <br>
&gt; =C2=A0meta/recipes-graphics/xorg-lib/<a href=3D"http://pixman_0.46.0.b=
b" rel=3D"noreferrer" target=3D"_blank">pixman_0.46.0.bb</a> | 13 +++++++++=
+++-<br>
&gt; =C2=A01 file changed, 12 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-graphics/xorg-lib/<a href=3D"http://pixman_0=
.46.0.bb" rel=3D"noreferrer" target=3D"_blank">pixman_0.46.0.bb</a> b/meta/=
recipes-graphics/xorg-lib/<a href=3D"http://pixman_0.46.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">pixman_0.46.0.bb</a><br>
&gt; index c1c71fd4202..925a7d7b29b 100644<br>
&gt; --- a/meta/recipes-graphics/xorg-lib/<a href=3D"http://pixman_0.46.0.b=
b" rel=3D"noreferrer" target=3D"_blank">pixman_0.46.0.bb</a><br>
&gt; +++ b/meta/recipes-graphics/xorg-lib/<a href=3D"http://pixman_0.46.0.b=
b" rel=3D"noreferrer" target=3D"_blank">pixman_0.46.0.bb</a><br>
&gt; @@ -23,6 +23,17 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D140=
96c769ae0cbb5fcb94ec468be11b3=C2=A0\<br>
&gt; =C2=A0<br>
&gt; =C2=A0inherit meson pkgconfig<br>
&gt; =C2=A0<br>
&gt; +OPENMP ?=3D &quot;&quot;<br>
&gt; +OPENMP:toolchain-clang =3D &quot;openmp&quot;<br>
&gt; +# openmp is not yet ported to rv32/ppc<br>
&gt; +OPENMP:remove:riscv32 =3D &quot;openmp&quot;<br>
&gt; +OPENMP:remove:powerpc =3D &quot;openmp&quot;<br>
&gt; +<br>
&gt; +PACKAGECONFIG ??=3D &quot;openmp&quot;<br>
&gt; +PACKAGECONFIG:class-native ?=3D &quot;&quot;<br>
&gt; +<br>
&gt; +PACKAGECONFIG[openmp] =3D &quot;,-Dopenmp=3Ddisabled,${OPENMP}&quot;<=
br>
&gt; +<br>
&gt; =C2=A0# These are for the tests and demos, which we don&#39;t install<=
br>
&gt; =C2=A0EXTRA_OEMESON =3D &quot;-Dgtk=3Ddisabled -Dlibpng=3Ddisabled&quo=
t;<br>
&gt; =C2=A0# ld: pixman/libpixman-mmx.a(pixman-mmx.c.o):<br>
&gt; @@ -36,7 +47,7 @@ EXTRA_OEMESON:append:class-target:powerpc64le =3D &q=
uot; ${@bb.utils.contains(&quot;TUNE_FEA<br>
&gt; =C2=A0EXTRA_OEMESON:append:armv7a =3D &quot;${@bb.utils.contains(&quot=
;TUNE_FEATURES&quot;,&quot;neon&quot;,&quot;&quot;,&quot; -Dneon=3Ddisabled=
&quot;,d)}&quot;<br>
&gt; =C2=A0EXTRA_OEMESON:append:armv7ve =3D &quot;${@bb.utils.contains(&quo=
t;TUNE_FEATURES&quot;,&quot;neon&quot;,&quot;&quot;,&quot; -Dneon=3Ddisable=
d&quot;,d)}&quot;<br>
&gt; =C2=A0<br>
&gt; -EXTRA_OEMESON:append:class-native =3D &quot; -Dopenmp=3Ddisabled&quot=
;<br>
&gt; +CFLAGS:append:toolchain-clang:mipsarch =3D &quot; -fno-integrated-as&=
quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
I think this needs more discussion or potentially a better fix.<br>
<br>
Potentially the test for openmp in pixman is wrong and it shouldn&#39;t<br>
build if it can find the header but not the library.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This is worth ex=
ploring more and if we can make the test robust it will benefit overall</di=
v><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Alternatively, if the openmp library can&#39;t be built, why are we<br>
shipping the header? Should we delete it in that case?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Header is instal=
led by gcc-runtime package</div><div dir=3D"auto"><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex" dir=3D"auto"><br>
Something doesn&#39;t see right here and I think we need to fix the root<br=
>
cause</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000008501ec06369dfcfb--

