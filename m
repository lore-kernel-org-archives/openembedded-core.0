Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232EFC48286
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 03:55:46 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.32343.1707018937304409779
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 19:55:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gKexaYYt;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc6f6d10ea9so1404756276.2
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 19:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707018936; x=1707623736; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b2pNBoeKSRkhT1d8Xe5ZVVgTyL5GXwfhgNYz/xN7os0=;
        b=gKexaYYtt9rwGMInP+ZnsCuQPmVMCtbjTfmVZwJVbLAdqbtT3/w+6qNG9CXoLQkUxP
         p8efWkC2BbK8irjqFYU6h5FlvQLJbYwZKwnr8mXZE+/DGshLDmOjO+OZkTD4TSp+bgSa
         WovDhkqCT0JfPb8jz57UvFUtESDA1yhUGr7yAEBZxWJT13bT57rR8aN0vY+E6rodhJhK
         F3wB/ezMjnkigHvL2R5fM8m3D0WoPvCAjPz3RB2aHmV1TPEfKGVQKwhmlBBWXowR0r7h
         DQIXkS0sBDejCTTJgYFEOiXdcO1CGeipwePG26uIwtdXHpAyP8Ky+ZFN8iTioA+km+3E
         oTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707018936; x=1707623736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b2pNBoeKSRkhT1d8Xe5ZVVgTyL5GXwfhgNYz/xN7os0=;
        b=s/pC3FwZfAcxJ4a8vQISZrZjHBdnK0XYaHTs3+x7wu+2jjVSIVyfSClJ03/kuXFbz3
         4n4PJBsh5nSWdY0FjuTu8unwXH1x5sPHkDA7BkLIuhyBddhhNi8HffUgbtgEeo7OcvQt
         7oYRCtnc8N2BQtMKBjL4ZId3Jh4pJtQY8MZxejcXToAxF687Gh1SlJr17wUrVSMM9uAL
         J5h61zjeVnizq8+7VKVkMXg1rsYBMhsVaCyzZ0UoEyp9F8AAXm20mwbdYBD/LjMW/hur
         JA4WuddwJ+l7UYcV6S9sMuMFx0Xql7LO1PbxqnkyIx/41iKCcN/RB3TgN09vSPg/htPH
         STJg==
X-Gm-Message-State: AOJu0YyWdoydSZETIdQNe5xemxKs6HgZTdJqq7YdwtCMFdzVuYJ5UuLe
	bESUxlOQy/gtfWuiutoHtRVXf77Mz7TK0z9X2fcLPzgDzNyQXX3GRaMBO3iNq0nxvtADAgQr3ux
	JVQlhuFLbc7evdO23ibDxWLpy8dM=
X-Google-Smtp-Source: AGHT+IEKmIiIgmrk7tjx/G+DZB3X0kZy8jvclZksFHBKskFmoewgaRiKsVY9jBU3Yrs0rW90lLjn7jkr39IvQBdd8bM=
X-Received: by 2002:a25:6850:0:b0:dc6:b7e3:c193 with SMTP id
 d77-20020a256850000000b00dc6b7e3c193mr5477554ybc.7.1707018936080; Sat, 03 Feb
 2024 19:55:36 -0800 (PST)
MIME-Version: 1.0
References: <20240130162049.2019289-1-raj.khem@gmail.com> <ebb2eb6d1384624d6c293ce194891ee5c001da1d.camel@linuxfoundation.org>
 <CAMKF1sonSbNt3bsxBznXXTxEErULs57op81VSbyx_dHB2kPZzg@mail.gmail.com> <8fbde10440b97a7d1fae483c192b9d17c450124d.camel@linuxfoundation.org>
In-Reply-To: <8fbde10440b97a7d1fae483c192b9d17c450124d.camel@linuxfoundation.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 3 Feb 2024 19:55:25 -0800
Message-ID: <CANx9H-DzH90X_tYppX4QP4NO-b0EcfnJYTCrR7zynB23nCTuzg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gcc-runtime: Move gdb pretty printer file to
 auto-load location
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004f675d0610865154"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 03:55:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194870

--0000000000004f675d0610865154
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 11:53=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2024-02-02 at 16:23 -0800, Khem Raj wrote:
> > On Fri, Feb 2, 2024 at 2:58=E2=80=AFPM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Tue, 2024-01-30 at 08:20 -0800, Khem Raj wrote:
> > > > When debugging a C++ program on target using libcstdc++, gdb does n=
ot
> > > > find the pretty printer python support, this is because the init
> file is
> > > > installed into /usr/lib which is excluded from gdb's default list o=
f
> > > > directories to load config's from, where as defaults to load from
> > > > datadir is still on, it therefore does not load this file
> > > >
> > > > warning: File "/usr/lib/libstdc++.so.6.0.33-gdb.py" auto-loading
> has been declined by your `auto-load safe-path' set to
> "$debugdir:$datadir/auto-load".
> > > >
> > > > This leaves the libstdc++ pretty-printers disabled even though adde=
d
> via
> > > > IMAGE_INSTALL +=3D "gcc-runtime-dbg"
> > > >
> > > > Add missing runtime dependency on datetime python module for the
> pretty
> > > > printer to work/load successfully.
> > > >
> > > > Once the pretty-printer gdb file is moved out of libdir, it may
> become
> > > > empty therefore delete it if its empty.
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > > v2: Fix build on mingw
> > > >
> > > >  meta/recipes-devtools/gcc/gcc-runtime.inc | 9 ++++++++-
> > > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > > > index 64b6168ba76..004deb6e41f 100644
> > > > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > > > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > > > @@ -85,6 +85,8 @@ do_install () {
> > > >               cd ${B}/${TARGET_SYS}/$d/
> > > >               oe_runmake 'DESTDIR=3D${D}'
> MULTIBUILDTOP=3D${B}/${TARGET_SYS}/$d/ install
> > > >       done
> > > > +     install -d ${D}${datadir}/gdb/auto-load/${libdir}
> > > > +     mv ${D}${libdir}/libstdc++*-gdb.py
> ${D}${datadir}/gdb/auto-load/${libdir}
> > > >       if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include ]; th=
en
> > > >               install -d ${D}${libdir}/${TARGET_SYS}/${BINV}/includ=
e
> > > >               mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/*
> ${D}${libdir}/${TARGET_SYS}/${BINV}/include
> > > > @@ -99,6 +101,9 @@ do_install () {
> > > >       if [ -d ${D}${infodir} ]; then
> > > >               rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
> > > >       fi
> > > > +     if [ -d ${D}${libdir} ]; then
> > > > +             rmdir --ignore-fail-on-non-empty -p ${D}${libdir}
> > > > +     fi
> > > >  }
> > > >
> > > >  do_install:append:class-target () {
> > > > @@ -182,9 +187,11 @@ RRECOMMENDS:${PN}-dbg =3D ""
> > > >
> > > >  # include python debugging scripts
> > > >  FILES:${PN}-dbg +=3D "\
> > > > -    ${libdir}/libstdc++.*-gdb.py \
> > > >      ${datadir}/gcc-${BINV}/python/libstdcxx \
> > > > +    ${datadir}/gdb/auto-load \
> > > >  "
> > > > +# Needed by libstdcxx pretty printer
> > > > +RDEPENDS:${PN}-dbg +=3D "python3-datetime"
> > > >
> > > >  FILES:libg2c =3D "${target_libdir}/libg2c.so.*"
> > > >  SUMMARY:libg2c =3D "Companion runtime library for g77"
> > >
> > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6381/st=
eps/14/logs/stdio
> > >
> > > Missing or unbuildable dependency chain was: ['selftest-ed',
> > > 'virtual/x86_64-poky-linux-compilerlibs', 'python3-datetime', 'bash']
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/853=
3
> >
> > Hmm, so I wonder if using RRECOMMEND is better here. Where is bash
> > being pulled from ?
>
> bash appears to be a dependency of python3-datetime. I don't think a
> RRECOMMEND will help unfortunately.
>

It seems to be required for tests/ (test_venv.py, test_subprocess.py and
test_zipfile/test_core.py are the obvious ones)
https://github.com/search?q=3Drepo%3Apython%2Fcpython+%28%22bash%22+OR+%22b=
ash+required%22%29+path%3A%2F%5ELib%5C%2Ftest%5C%2F%2F&type=3Dcode

I didn=E2=80=99t see any hard requirement in Lib/datetime.py nor its test c=
ases.
But searching on a phone can lead to missing things=E2=80=A6


> Cheers,
>
> Richard
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194830):
> https://lists.openembedded.org/g/openembedded-core/message/194830
> Mute This Topic: https://lists.openembedded.org/mt/104056687/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004f675d0610865154
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Feb 2, 2024 at 11:53=E2=80=AFPM Richard Purdie &lt;=
<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxf=
oundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:soli=
d;padding-left:1ex;border-left-color:rgb(204,204,204)">On Fri, 2024-02-02 a=
t 16:23 -0800, Khem Raj wrote:<br>
&gt; On Fri, Feb 2, 2024 at 2:58=E2=80=AFPM Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; On Tue, 2024-01-30 at 08:20 -0800, Khem Raj wrote:<br>
&gt; &gt; &gt; When debugging a C++ program on target using libcstdc++, gdb=
 does not<br>
&gt; &gt; &gt; find the pretty printer python support, this is because the =
init file is<br>
&gt; &gt; &gt; installed into /usr/lib which is excluded from gdb&#39;s def=
ault list of<br>
&gt; &gt; &gt; directories to load config&#39;s from, where as defaults to =
load from<br>
&gt; &gt; &gt; datadir is still on, it therefore does not load this file<br=
>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; warning: File &quot;/usr/lib/libstdc++.<a href=3D"http://so.=
6.0.33-gdb.py" rel=3D"noreferrer" target=3D"_blank">so.6.0.33-gdb.py</a>&qu=
ot; auto-loading has been declined by your `auto-load safe-path&#39; set to=
 &quot;$debugdir:$datadir/auto-load&quot;.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; This leaves the libstdc++ pretty-printers disabled even thou=
gh added via<br>
&gt; &gt; &gt; IMAGE_INSTALL +=3D &quot;gcc-runtime-dbg&quot;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Add missing runtime dependency on datetime python module for=
 the pretty<br>
&gt; &gt; &gt; printer to work/load successfully.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Once the pretty-printer gdb file is moved out of libdir, it =
may become<br>
&gt; &gt; &gt; empty therefore delete it if its empty.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; v2: Fix build on mingw<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 meta/recipes-devtools/gcc/gcc-runtime.inc | 9 ++++++++=
-<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 8 insertions(+), 1 deletion(-)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/met=
a/recipes-devtools/gcc/gcc-runtime.inc<br>
&gt; &gt; &gt; index 64b6168ba76..004deb6e41f 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
&gt; &gt; &gt; +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
&gt; &gt; &gt; @@ -85,6 +85,8 @@ do_install () {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${B=
}/${TARGET_SYS}/$d/<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_run=
make &#39;DESTDIR=3D${D}&#39; MULTIBUILDTOP=3D${B}/${TARGET_SYS}/$d/ instal=
l<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0install -d ${D}${datadir}/gdb/auto-load=
/${libdir}<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0mv ${D}${libdir}/libstdc++*-gdb.py ${D}=
${datadir}/gdb/auto-load/${libdir}<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -d ${D}${libdir}/gcc/${TARGET=
_SYS}/${BINV}/include ]; then<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0instal=
l -d ${D}${libdir}/${TARGET_SYS}/${BINV}/include<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${D=
}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/* ${D}${libdir}/${TARGET_SYS}/=
${BINV}/include<br>
&gt; &gt; &gt; @@ -99,6 +101,9 @@ do_install () {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -d ${D}${infodir} ]; then<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rmdir =
--ignore-fail-on-non-empty -p ${D}${infodir}<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0if [ -d ${D}${libdir} ]; then<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rmdir --ign=
ore-fail-on-non-empty -p ${D}${libdir}<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 do_install:append:class-target () {<br>
&gt; &gt; &gt; @@ -182,9 +187,11 @@ RRECOMMENDS:${PN}-dbg =3D &quot;&quot;<=
br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 # include python debugging scripts<br>
&gt; &gt; &gt;=C2=A0 FILES:${PN}-dbg +=3D &quot;\<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 ${libdir}/libstdc++.*-gdb.py \<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 ${datadir}/gcc-${BINV}/python/libstdcxx =
\<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 ${datadir}/gdb/auto-load \<br>
&gt; &gt; &gt;=C2=A0 &quot;<br>
&gt; &gt; &gt; +# Needed by libstdcxx pretty printer<br>
&gt; &gt; &gt; +RDEPENDS:${PN}-dbg +=3D &quot;python3-datetime&quot;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 FILES:libg2c =3D &quot;${target_libdir}/libg2c.so.*&qu=
ot;<br>
&gt; &gt; &gt;=C2=A0 SUMMARY:libg2c =3D &quot;Companion runtime library for=
 g77&quot;<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/87/builds/6381/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">=
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6381/step=
s/14/logs/stdio</a><br>
&gt; &gt; <br>
&gt; &gt; Missing or unbuildable dependency chain was: [&#39;selftest-ed&#3=
9;,<br>
&gt; &gt; &#39;virtual/x86_64-poky-linux-compilerlibs&#39;, &#39;python3-da=
tetime&#39;, &#39;bash&#39;]<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/89/builds/8533" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/typhoon/#/builders/89/builds/8533</a><br>
&gt; <br>
&gt; Hmm, so I wonder if using RRECOMMEND is better here. Where is bash<br>
&gt; being pulled from ?<br>
<br>
bash appears to be a dependency of python3-datetime. I don&#39;t think a<br=
>
RRECOMMEND will help unfortunately.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">It seems to be r=
equired for tests/ (test_venv.py, test_subprocess.py and test_zipfile/test_=
core.py are the obvious ones)</div><div dir=3D"auto"><div><a href=3D"https:=
//github.com/search?q=3Drepo%3Apython%2Fcpython+%28%22bash%22+OR+%22bash+re=
quired%22%29+path%3A%2F%5ELib%5C%2Ftest%5C%2F%2F&amp;type=3Dcode">https://g=
ithub.com/search?q=3Drepo%3Apython%2Fcpython+%28%22bash%22+OR+%22bash+requi=
red%22%29+path%3A%2F%5ELib%5C%2Ftest%5C%2F%2F&amp;type=3Dcode</a></div><br>=
</div><div dir=3D"auto">I didn=E2=80=99t see any hard requirement in Lib/da=
tetime.py nor its test cases. But searching on a phone can lead to missing =
things=E2=80=A6</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#194830): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/194830" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/194830</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104056687/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104056687/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000004f675d0610865154--

