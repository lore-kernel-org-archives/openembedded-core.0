Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF761C48286
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 16:37:09 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.41795.1707064627884281085
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 08:37:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OsJQ3odb;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc238cb1b17so3338409276.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 08:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707064627; x=1707669427; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kb3pez6J5h14YlOL1DLpuvz9EeX3ykyb5t3vZcbskIc=;
        b=OsJQ3odbM7qJz1Hsxsj2Fe4mMeuzG9B0So/XKx6BBsTtObLhJUcZZKMRicqwdaV02q
         ZQ7yomFdey0GWkNS5DfztlERUyUJR4x4lxZ6zM8gI9l/U4GP34Z4rSd4DFK5Xy2yItUi
         XSGdDGba1iAocOydAHCNDFhjBH3DdemNB8rYrB4QITtUyeoalQNSc5/LI3urTjUXgmkO
         Ev2HuXZxLlUK5x2RyYJ6E8754qgq1vUwh1wf6dZechBoLeHM1pHAIOFW+tgVxbGsGS/s
         BhcrXgA2KMf06pqY2eriCVA90GOtVSOMPGHvTJZfxR1jFcc1cOSLVOFX2zdSNXxvaYeg
         typA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707064627; x=1707669427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kb3pez6J5h14YlOL1DLpuvz9EeX3ykyb5t3vZcbskIc=;
        b=g30RCf85Uc4l77seT7iTq0jx3B/XcPqJ9IuQ64x0vAhK/0ue+PnxTtufqDWlXhc0wz
         MF9hWY2RHzjZvAuvi7Yj2fumfOjHs4Q0D7/aFd1iUHyMX8DcMhxdqRLHSnH5j67vPZ8p
         PPFQPhOmVMMEKTWVrClU6CVoBJRxRqwWEF2EXfv6Q1IwZ8ERgKGHN6cYmjBaS2z8xX5J
         4qJJAfPQuKGft2JndXpmhzQZlq4BoxLeg0Iz6XWYh5bXmTspoye9ZSg35YINtbLr+8ae
         l+ib5lPE7+l+Sv6hmtG7jTAnJ/IzRbnRzORVg640K/VaR/lhBTq+bs00cpt4uX6/A10s
         oDGA==
X-Gm-Message-State: AOJu0Yx2lw/CjcTaCW8j0t/HZIIGQiDMObe/gHNuIqvnbUTAEx9Dk9Pi
	pzBefwc9Gi+/uofsKU4G0lsNFe/vefITPEgp83xAGBT2oXs/tzcBCwVHsijIlUxwgzxbNVkaXfV
	TIQgLHRYElg+S31lANXW2HutSivo=
X-Google-Smtp-Source: AGHT+IHjLG420204o+DI+7h1mi/lk0+ISdA2hLPByjkUeetJOQ86oK0c6rgEUzI9qUv7EWkyqyvfBHewLM6mkPClw4w=
X-Received: by 2002:a25:b87:0:b0:dc2:6f92:2ec0 with SMTP id
 129-20020a250b87000000b00dc26f922ec0mr6362722ybl.51.1707064626162; Sun, 04
 Feb 2024 08:37:06 -0800 (PST)
MIME-Version: 1.0
References: <20240130162049.2019289-1-raj.khem@gmail.com> <ebb2eb6d1384624d6c293ce194891ee5c001da1d.camel@linuxfoundation.org>
 <CAMKF1sonSbNt3bsxBznXXTxEErULs57op81VSbyx_dHB2kPZzg@mail.gmail.com>
 <8fbde10440b97a7d1fae483c192b9d17c450124d.camel@linuxfoundation.org>
 <CANx9H-DzH90X_tYppX4QP4NO-b0EcfnJYTCrR7zynB23nCTuzg@mail.gmail.com> <d6d59a9f1a93d9805f2b80b70f0558f6d8e133bb.camel@linuxfoundation.org>
In-Reply-To: <d6d59a9f1a93d9805f2b80b70f0558f6d8e133bb.camel@linuxfoundation.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 4 Feb 2024 08:36:55 -0800
Message-ID: <CANx9H-D+97bocuCA-eO078CZUd-58VXyW=3D4hGooiNfUhE5Sw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gcc-runtime: Move gdb pretty printer file to
 auto-load location
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Trevor Gamblin <tgamblin@baylibre.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a6b1a5061090f414"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 16:37:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194896

--000000000000a6b1a5061090f414
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 4, 2024 at 2:28=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2024-02-03 at 19:55 -0800, Tim Orling wrote:
> >
> >
> > On Fri, Feb 2, 2024 at 11:53=E2=80=AFPM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > > On Fri, 2024-02-02 at 16:23 -0800, Khem Raj wrote:
> > > > On Fri, Feb 2, 2024 at 2:58=E2=80=AFPM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >
> > > > > On Tue, 2024-01-30 at 08:20 -0800, Khem Raj wrote:
> > > > > > When debugging a C++ program on target using libcstdc++, gdb
> does not
> > > > > > find the pretty printer python support, this is because the ini=
t
> file is
> > > > > > installed into /usr/lib which is excluded from gdb's default
> list of
> > > > > > directories to load config's from, where as defaults to load fr=
om
> > > > > > datadir is still on, it therefore does not load this file
> > > > > >
> > > > > > warning: File "/usr/lib/libstdc++.so.6.0.33-gdb.py"
> auto-loading has been declined by your `auto-load safe-path' set to
> "$debugdir:$datadir/auto-load".
> > > > > >
> > > > > > This leaves the libstdc++ pretty-printers disabled even though
> added via
> > > > > > IMAGE_INSTALL +=3D "gcc-runtime-dbg"
> > > > > >
> > > > > > Add missing runtime dependency on datetime python module for th=
e
> pretty
> > > > > > printer to work/load successfully.
> > > > > >
> > > > > > Once the pretty-printer gdb file is moved out of libdir, it may
> become
> > > > > > empty therefore delete it if its empty.
> > > > > >
> > > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > > ---
> > > > > > v2: Fix build on mingw
> > > > > >
> > > > > >   meta/recipes-devtools/gcc/gcc-runtime.inc | 9 ++++++++-
> > > > > >   1 file changed, 8 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > > > > > index 64b6168ba76..004deb6e41f 100644
> > > > > > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > > > > > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > > > > > @@ -85,6 +85,8 @@ do_install () {
> > > > > >                cd ${B}/${TARGET_SYS}/$d/
> > > > > >                oe_runmake 'DESTDIR=3D${D}'
> MULTIBUILDTOP=3D${B}/${TARGET_SYS}/$d/ install
> > > > > >        done
> > > > > > +     install -d ${D}${datadir}/gdb/auto-load/${libdir}
> > > > > > +     mv ${D}${libdir}/libstdc++*-gdb.py
> ${D}${datadir}/gdb/auto-load/${libdir}
> > > > > >        if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include
> ]; then
> > > > > >                install -d
> ${D}${libdir}/${TARGET_SYS}/${BINV}/include
> > > > > >                mv
> ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/*
> ${D}${libdir}/${TARGET_SYS}/${BINV}/include
> > > > > > @@ -99,6 +101,9 @@ do_install () {
> > > > > >        if [ -d ${D}${infodir} ]; then
> > > > > >                rmdir --ignore-fail-on-non-empty -p ${D}${infodi=
r}
> > > > > >        fi
> > > > > > +     if [ -d ${D}${libdir} ]; then
> > > > > > +             rmdir --ignore-fail-on-non-empty -p ${D}${libdir}
> > > > > > +     fi
> > > > > >   }
> > > > > >
> > > > > >   do_install:append:class-target () {
> > > > > > @@ -182,9 +187,11 @@ RRECOMMENDS:${PN}-dbg =3D ""
> > > > > >
> > > > > >   # include python debugging scripts
> > > > > >   FILES:${PN}-dbg +=3D "\
> > > > > > -    ${libdir}/libstdc++.*-gdb.py \
> > > > > >       ${datadir}/gcc-${BINV}/python/libstdcxx \
> > > > > > +    ${datadir}/gdb/auto-load \
> > > > > >   "
> > > > > > +# Needed by libstdcxx pretty printer
> > > > > > +RDEPENDS:${PN}-dbg +=3D "python3-datetime"
> > > > > >
> > > > > >   FILES:libg2c =3D "${target_libdir}/libg2c.so.*"
> > > > > >   SUMMARY:libg2c =3D "Companion runtime library for g77"
> > > > >
> > > > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6381/st=
eps/14/logs/stdio
> > > > >
> > > > > Missing or unbuildable dependency chain was: ['selftest-ed',
> > > > > 'virtual/x86_64-poky-linux-compilerlibs', 'python3-datetime',
> 'bash']
> > > > >
> > > > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/8533
> > > >
> > > > Hmm, so I wonder if using RRECOMMEND is better here. Where is bash
> > > > being pulled from ?
> > >
> > > bash appears to be a dependency of python3-datetime. I don't think a
> > > RRECOMMEND will help unfortunately.
> > >
> >
> >
> > It seems to be required for tests/ (test_venv.py, test_subprocess.py an=
d
> test_zipfile/test_core.py are the obvious ones)
> >
> https://github.com/search?q=3Drepo%3Apython%2Fcpython+%28%22bash%22+OR+%2=
2bash+required%22%29+path%3A%2F%5ELib%5C%2Ftest%5C%2F%2F&type=3Dcode
> >
> > I didn=E2=80=99t see any hard requirement in Lib/datetime.py nor its te=
st cases.
> But searching on a phone can lead to missing things=E2=80=A6
>
> The dependency is definitely coming from the python3 tests.
>
> It looks like whilst the python3-ptest is conditional on enabling
> ptests, the python3-tests package is not, and it is that which contains
> the bash dependency.
>
> So perhaps we should rework python3 recipe to package tests/ into -ptest?


> Cheers,
>
> Richard
>
>

--000000000000a6b1a5061090f414
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 4, 2024 at 2:28=E2=80=AFA=
M Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">=
richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Sat, 2024-02-03 at 19:55 -0800, Tim Or=
ling wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Feb 2, 2024 at 11:53=E2=80=AFPM Richard Purdie &lt;<a href=3D"=
mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie=
@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; On Fri, 2024-02-02 at 16:23 -0800, Khem Raj wrote:<br>
&gt; &gt; &gt; On Fri, Feb 2, 2024 at 2:58=E2=80=AFPM Richard Purdie<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" ta=
rget=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; On Tue, 2024-01-30 at 08:20 -0800, Khem Raj wrote:<br>
&gt; &gt; &gt; &gt; &gt; When debugging a C++ program on target using libcs=
tdc++, gdb does not<br>
&gt; &gt; &gt; &gt; &gt; find the pretty printer python support, this is be=
cause the init file is<br>
&gt; &gt; &gt; &gt; &gt; installed into /usr/lib which is excluded from gdb=
&#39;s default list of<br>
&gt; &gt; &gt; &gt; &gt; directories to load config&#39;s from, where as de=
faults to load from<br>
&gt; &gt; &gt; &gt; &gt; datadir is still on, it therefore does not load th=
is file<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; warning: File &quot;/usr/lib/libstdc++.<a href=3D"=
http://so.6.0.33-gdb.py" rel=3D"noreferrer" target=3D"_blank">so.6.0.33-gdb=
.py</a>&quot; auto-loading has been declined by your `auto-load safe-path&#=
39; set to &quot;$debugdir:$datadir/auto-load&quot;.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; This leaves the libstdc++ pretty-printers disabled=
 even though added via<br>
&gt; &gt; &gt; &gt; &gt; IMAGE_INSTALL +=3D &quot;gcc-runtime-dbg&quot;<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Add missing runtime dependency on datetime python =
module for the pretty<br>
&gt; &gt; &gt; &gt; &gt; printer to work/load successfully.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Once the pretty-printer gdb file is moved out of l=
ibdir, it may become<br>
&gt; &gt; &gt; &gt; &gt; empty therefore delete it if its empty.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; v2: Fix build on mingw<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 meta/recipes-devtools/gcc/gcc-runtime.inc |=
 9 ++++++++-<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 1 file changed, 8 insertions(+), 1 deletion=
(-)<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; diff --git a/meta/recipes-devtools/gcc/gcc-runtime=
.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
&gt; &gt; &gt; &gt; &gt; index 64b6168ba76..004deb6e41f 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/meta/recipes-devtools/gcc/gcc-runtime.inc<br=
>
&gt; &gt; &gt; &gt; &gt; +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc<br=
>
&gt; &gt; &gt; &gt; &gt; @@ -85,6 +85,8 @@ do_install () {<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0cd ${B}/${TARGET_SYS}/$d/<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0oe_runmake &#39;DESTDIR=3D${D}&#39; MULTIBUILDTOP=3D${B}/${TARGET_SYS=
}/$d/ install<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0install -d ${D}${datadir}/gdb=
/auto-load/${libdir}<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0mv ${D}${libdir}/libstdc++*-g=
db.py ${D}${datadir}/gdb/auto-load/${libdir}<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -d ${D}${libdir}/g=
cc/${TARGET_SYS}/${BINV}/include ]; then<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0install -d ${D}${libdir}/${TARGET_SYS}/${BINV}/include<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/* ${D}${libdir}/${=
TARGET_SYS}/${BINV}/include<br>
&gt; &gt; &gt; &gt; &gt; @@ -99,6 +101,9 @@ do_install () {<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -d ${D}${infodir} =
]; then<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0rmdir --ignore-fail-on-non-empty -p ${D}${infodir}<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if [ -d ${D}${libdir} ]; then=
<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
mdir --ignore-fail-on-non-empty -p ${D}${libdir}<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 do_install:append:class-target () {<br>
&gt; &gt; &gt; &gt; &gt; @@ -182,9 +187,11 @@ RRECOMMENDS:${PN}-dbg =3D &qu=
ot;&quot;<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 # include python debugging scripts<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 FILES:${PN}-dbg +=3D &quot;\<br>
&gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 ${libdir}/libstdc++.*-gdb.py \<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 ${datadir}/gcc-${BINV}/python=
/libstdcxx \<br>
&gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 ${datadir}/gdb/auto-load \<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 &quot;<br>
&gt; &gt; &gt; &gt; &gt; +# Needed by libstdcxx pretty printer<br>
&gt; &gt; &gt; &gt; &gt; +RDEPENDS:${PN}-dbg +=3D &quot;python3-datetime&qu=
ot;<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 FILES:libg2c =3D &quot;${target_libdir}/lib=
g2c.so.*&quot;<br>
&gt; &gt; &gt; &gt; &gt; =C2=A0 SUMMARY:libg2c =3D &quot;Companion runtime =
library for g77&quot;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon=
/#/builders/87/builds/6381/steps/14/logs/stdio" rel=3D"noreferrer" target=
=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/builders/87/buil=
ds/6381/steps/14/logs/stdio</a><br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Missing or unbuildable dependency chain was: [&#39;self=
test-ed&#39;,<br>
&gt; &gt; &gt; &gt; &#39;virtual/x86_64-poky-linux-compilerlibs&#39;, &#39;=
python3-datetime&#39;, &#39;bash&#39;]<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon=
/#/builders/89/builds/8533" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/89/builds/8533</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Hmm, so I wonder if using RRECOMMEND is better here. Where i=
s bash<br>
&gt; &gt; &gt; being pulled from ?<br>
&gt; &gt; <br>
&gt; &gt; bash appears to be a dependency of python3-datetime. I don&#39;t =
think a<br>
&gt; &gt; RRECOMMEND will help unfortunately.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; It seems to be required for tests/ (test_venv.py, test_subprocess.py a=
nd test_zipfile/test_core.py are the obvious ones)<br>
&gt; <a href=3D"https://github.com/search?q=3Drepo%3Apython%2Fcpython+%28%2=
2bash%22+OR+%22bash+required%22%29+path%3A%2F%5ELib%5C%2Ftest%5C%2F%2F&amp;=
type=3Dcode" rel=3D"noreferrer" target=3D"_blank">https://github.com/search=
?q=3Drepo%3Apython%2Fcpython+%28%22bash%22+OR+%22bash+required%22%29+path%3=
A%2F%5ELib%5C%2Ftest%5C%2F%2F&amp;type=3Dcode</a><br>
&gt; <br>
&gt; I didn=E2=80=99t see any hard requirement in Lib/datetime.py nor its t=
est cases. But searching on a phone can lead to missing things=E2=80=A6<br>
<br>
The dependency is definitely coming from the python3 tests.<br>
<br>
It looks like whilst the python3-ptest is conditional on enabling<br>
ptests, the python3-tests package is not, and it is that which contains<br>
the bash dependency.<br>
<br></blockquote><div>So perhaps we should rework python3 recipe to package=
 tests/ into -ptest?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000a6b1a5061090f414--

