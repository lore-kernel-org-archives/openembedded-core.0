Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAE7EC873D
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 15:41:52 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.16463.1694101305881359619
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 08:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=M6tCreeJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: quaresma.jose@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3aa1443858eso760445b6e.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 08:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694101305; x=1694706105; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tiKrKKWhUs7HQb2d90vGPXhtCtU2+LYH4+WRtR+Pt4M=;
        b=M6tCreeJ+bPiP1VT/85F88Kb443m0bQx6rFpTs9xZthV7IrQpJI//bOMicflDbV0rx
         CgVxKfrqUAjTqLAoc+4Hm4cQHT1/CPiZoj7xzNL3KIi09DYKFfRAnszeuWBBuugh0NMk
         zml6FIgNj9F5it/GOqFPXJeVdLbc7vc7UYr1kF6cfPoFq4b+omkM8dfOQwFp9EvLqo0x
         TQGu3delqeepQwj2iThqZWi8aFeXlRyNA7vVUCmf78jTi+zPOZYvvi/WKECcXQasWRU8
         LZ/vqSVovc/58650NUiUTl1BKg6yrmOUT5xZu37IzyUlp9Ad6qTNXEeJpc5kDxSiHxTu
         dUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694101305; x=1694706105;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tiKrKKWhUs7HQb2d90vGPXhtCtU2+LYH4+WRtR+Pt4M=;
        b=dbmHiijX0IlqmOmv9G7XoDd7Pa9yR9dzMwp2haMoF3axa8NvS6a2CLycGxxFoHAN9K
         xWrG8Li0LizHgm6FrtDXFwYFq8TS5pLiBRIRH9DjuljTIfXnbTRf6s7TDxzTzNfwyGGT
         Q6DUphzn5BI3eL37fBBeC0Fkj888+m9/gWkQp5el6TlLvVIXrD4nbMJZkMtk0MGv/ZhK
         0HH5JkMoZNGpSqRrBIdghJRlBA3VpO200LdX0b5stoAxux8Vh1Kqwyl+OfAjRayz6Bkw
         iHrz9LrYnOcAuMypd8pDuDT4VPBTUWJJhsnj9IvmU0DyNjNkYnMVRrfHArcvTsiiDV15
         sJIg==
X-Gm-Message-State: AOJu0YzNKcRBeOfWD4HTAXslApQ2/n1Znj+suQyu9P6PUHLSbSBGWE01
	ih4Sw7TaemaOJ6sN3RvwOT4mnW95eogzpuEwvHY=
X-Google-Smtp-Source: AGHT+IFU5/OBO3LvjqRF/3E6Jk5n/wgL44cqEaNRuYMOYENAZ8HzPRN4lcSYC6bqD7JMm8ttKWLeJCG4SZqvxaUdRMA=
X-Received: by 2002:a05:6808:2107:b0:3a7:4fff:6485 with SMTP id
 r7-20020a056808210700b003a74fff6485mr26313879oiw.28.1694101305050; Thu, 07
 Sep 2023 08:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230829143541.3837919-1-jose.quaresma@foundries.io>
 <bf604882ff482c21044429a08a31fe07efc5b0e7.camel@linuxfoundation.org>
 <CANPvuRmWb+TtJoQ__9nWa9dPmTGNaMKob8pLAL-+tok72UWOvA@mail.gmail.com> <76baa8fcdcec7125b30dcf050af6a84c7a4c59bd.camel@linuxfoundation.org>
In-Reply-To: <76baa8fcdcec7125b30dcf050af6a84c7a4c59bd.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 7 Sep 2023 16:41:33 +0100
Message-ID: <CANPvuRn0+SytsjH04qYtEO4cPfo6JggzUnyNqKzQ1VVDY-5L4w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] pybootchartgui: also match subtasks of the main ones
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000804a2a0604c6b293"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 15:41:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187390

--000000000000804a2a0604c6b293
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quinta,
7/09/2023 =C3=A0(s) 16:20:

> On Thu, 2023-09-07 at 15:59 +0100, Jose Quaresma wrote:
> >
> >
> > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> > quinta, 7/09/2023 =C3=A0(s) 15:16:
> > > On Tue, 2023-08-29 at 14:35 +0000, Jose Quaresma wrote:
> > > > This will match other deviation subtask of the same main task,
> > > > a couple of them can be found on oe-core layer:
> > > >   do_compile_kernelmodules
> > > >   do_compile_ptest
> > > >   native_add_do_populate_sysroot_deps
> > > >   do_package_qa
> > > >   cmake_do_configure
> > > >   setuptools3_do_configure
> > > >   cargo_common_do_configure
> > > >   python_pyo3_do_configure
> > > >   python_setuptools3_rust_do_configure
> > > >
> > > > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > > > ---
> > > >   scripts/pybootchartgui/pybootchartgui/draw.py | 18 +++++++++---
> > > > ------
> > > >   1 file changed, 9 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py
> > > > b/scripts/pybootchartgui/pybootchartgui/draw.py
> > > > index 3d1ff695c1..2beb3c7c67 100644
> > > > --- a/scripts/pybootchartgui/pybootchartgui/draw.py
> > > > +++ b/scripts/pybootchartgui/pybootchartgui/draw.py
> > > > @@ -661,20 +661,20 @@ def render_processes_chart(ctx, options,
> > > > trace, curr_y, width, h, sec_w):
> > > >
> > > >               #print("proc at %s %s %s %s" % (x, y, w, proc_h))
> > > >               col =3D None
> > > > -            if task =3D=3D "do_compile":
> > > > +            if "_setscene" in task:
> > > > +                col =3D WHITE
> > > > +            elif "do_compile" in task:
> > > >                   col =3D TASK_COLOR_COMPILE
> > > > -            elif task =3D=3D "do_configure":
> > > > +            elif "do_configure" in task:
> > > >                   col =3D TASK_COLOR_CONFIGURE
> > > > -            elif task =3D=3D "do_install":
> > > > +            elif "do_install" in task:
> > > >                   col =3D TASK_COLOR_INSTALL
> > > > -            elif task =3D=3D "do_populate_sysroot":
> > > > +            elif "do_populate_sysroot" in task:
> > > >                   col =3D TASK_COLOR_SYSROOT
> > > > -            elif task =3D=3D "do_package":
> > > > -                col =3D TASK_COLOR_PACKAGE
> > > > -            elif task =3D=3D "do_package_write_rpm" or \
> > > > -                     task =3D=3D "do_package_write_deb" or \
> > > > -                     task =3D=3D "do_package_write_ipk":
> > > > +            elif "do_package_write" in task:
> > > >                   col =3D TASK_COLOR_PACKAGE_WRITE
> > > > +            elif "do_package" in task:
> > > > +                col =3D TASK_COLOR_PACKAGE
> > > >               else:
> > > >                   col =3D WHITE
> > > >
> > >
> > > I'm a bit torn on this as the patch changes the approach of the
> > > code.
> > >
> > > Currently, the tasks are marked without any fuzz, i.e. it matches
> > > do_compile alone. The code is entirely consistent in that all the
> > > other
> > > areas match specific tasks too.
> > >
> > > After the change you're changing the meaning to "any compile task"
> > > and
> > > "any configure task".
> > >
> >
> >
> > Yeah that was my intention and they still be consistent by color but
> > now
> > matching a sequential group of tasks:
> >
> > "any configure task" -> "any compile task" -> "any package task" ->
> > "any package write task" -> "do_populate_sysroot"
> >
> > and in this way it is easier to identify the color patterns of the
> > above groups,
> > currently we get a couple of white bars for the majority of the
> > tasks.
> >
> > >
> > > I'm not entirely convinced this is a good thing. Should do_package
> > > match do_package_qa for example? Those are quite different. I think
> > > we're swapping something which is currently at least quite clear
> > > for
> > > something which is very fuzzy and not easy for the user to
> > > understand
> > > without looking at the code :/.
> > >
> >
> >
> > I can rework the patch to have the same colors as before with more
> > new colors
> > for the new tasks I added but with many colors It will be harder to
> > understand.
>
> How about a compromise. Keep do_compile and "compile like" tasks
> separate and use a pale version of the compile colour for "compile
> like". Do something similar for configure and leave the others
> unchanged?
>

Ok, I will do that.


>
>
> Cheers,
>
> Richard
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000804a2a0604c6b293
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia quinta, 7/09/2023 =C3=A0(s) 16:20:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Thu, 2023-09-07 at 15:59 +0100, J=
ose Quaresma wrote:<br>
&gt; <br>
&gt; <br>
&gt; Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.or=
g" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; escreveu no=
 dia<br>
&gt; quinta, 7/09/2023 =C3=A0(s) 15:16:<br>
&gt; &gt; On Tue, 2023-08-29 at 14:35 +0000, Jose Quaresma wrote:<br>
&gt; &gt; &gt; This will match other deviation subtask of the same main tas=
k,<br>
&gt; &gt; &gt; a couple of them can be found on oe-core layer:<br>
&gt; &gt; &gt; =C2=A0 do_compile_kernelmodules<br>
&gt; &gt; &gt; =C2=A0 do_compile_ptest<br>
&gt; &gt; &gt; =C2=A0 native_add_do_populate_sysroot_deps<br>
&gt; &gt; &gt; =C2=A0 do_package_qa<br>
&gt; &gt; &gt; =C2=A0 cmake_do_configure<br>
&gt; &gt; &gt; =C2=A0 setuptools3_do_configure<br>
&gt; &gt; &gt; =C2=A0 cargo_common_do_configure<br>
&gt; &gt; &gt; =C2=A0 python_pyo3_do_configure<br>
&gt; &gt; &gt; =C2=A0 python_setuptools3_rust_do_configure<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quar=
esma@foundries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; =C2=A0 scripts/pybootchartgui/pybootchartgui/draw.py | 18 ++=
+++++++---<br>
&gt; &gt; &gt; ------<br>
&gt; &gt; &gt; =C2=A0 1 file changed, 9 insertions(+), 9 deletions(-)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py<b=
r>
&gt; &gt; &gt; b/scripts/pybootchartgui/pybootchartgui/draw.py<br>
&gt; &gt; &gt; index 3d1ff695c1..2beb3c7c67 100644<br>
&gt; &gt; &gt; --- a/scripts/pybootchartgui/pybootchartgui/draw.py<br>
&gt; &gt; &gt; +++ b/scripts/pybootchartgui/pybootchartgui/draw.py<br>
&gt; &gt; &gt; @@ -661,20 +661,20 @@ def render_processes_chart(ctx, option=
s,<br>
&gt; &gt; &gt; trace, curr_y, width, h, sec_w):<br>
&gt; &gt; &gt; =C2=A0 <br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #print(&quo=
t;proc at %s %s %s %s&quot; % (x, y, w, proc_h))<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =3D Non=
e<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if task =3D=3D &q=
uot;do_compile&quot;:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;_setscen=
e&quot; in task:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col=
 =3D WHITE<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif &quot;do_com=
pile&quot; in task:<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 col =3D TASK_COLOR_COMPILE<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif task =3D=3D =
&quot;do_configure&quot;:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif &quot;do_con=
figure&quot; in task:<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 col =3D TASK_COLOR_CONFIGURE<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif task =3D=3D =
&quot;do_install&quot;:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif &quot;do_ins=
tall&quot; in task:<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 col =3D TASK_COLOR_INSTALL<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif task =3D=3D =
&quot;do_populate_sysroot&quot;:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif &quot;do_pop=
ulate_sysroot&quot; in task:<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 col =3D TASK_COLOR_SYSROOT<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif task =3D=3D =
&quot;do_package&quot;:<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col=
 =3D TASK_COLOR_PACKAGE<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif task =3D=3D =
&quot;do_package_write_rpm&quot; or \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0task =3D=3D &quot;do_package_write_deb&quot; or \<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0task =3D=3D &quot;do_package_write_ipk&quot;:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif &quot;do_pac=
kage_write&quot; in task:<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 col =3D TASK_COLOR_PACKAGE_WRITE<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif &quot;do_pac=
kage&quot; in task:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col=
 =3D TASK_COLOR_PACKAGE<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 col =3D WHITE<br>
&gt; &gt; &gt; =C2=A0 <br>
&gt; &gt; <br>
&gt; &gt; I&#39;m a bit torn on this as the patch changes the approach of t=
he<br>
&gt; &gt; code.<br>
&gt; &gt; <br>
&gt; &gt; Currently, the tasks are marked without any fuzz, i.e. it matches=
<br>
&gt; &gt; do_compile alone. The code is entirely consistent in that all the=
<br>
&gt; &gt; other<br>
&gt; &gt; areas match specific tasks too.<br>
&gt; &gt; <br>
&gt; &gt; After the change you&#39;re changing the meaning to &quot;any com=
pile task&quot;=C2=A0<br>
&gt; &gt; and<br>
&gt; &gt; &quot;any configure task&quot;.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; Yeah that was my intention and they still be consistent by color but<b=
r>
&gt; now=C2=A0<br>
&gt; matching a sequential group of tasks:<br>
&gt; <br>
&gt; &quot;any configure task&quot; -&gt; &quot;any compile task&quot; -&gt=
; &quot;any package task&quot; -&gt;<br>
&gt; &quot;any package write task&quot; -&gt; &quot;do_populate_sysroot&quo=
t;<br>
&gt; <br>
&gt; and in this way it is easier to identify the color patterns of the<br>
&gt; above groups,<br>
&gt; currently we get a couple of white bars for the majority of the<br>
&gt; tasks.=C2=A0<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; I&#39;m not entirely convinced this is a good thing. Should do_pa=
ckage<br>
&gt; &gt; match do_package_qa for example? Those are quite different. I thi=
nk<br>
&gt; &gt; we&#39;re swapping something which is currently at least quite cl=
ear<br>
&gt; &gt; for<br>
&gt; &gt; something which is very fuzzy and not easy for the user to<br>
&gt; &gt; understand<br>
&gt; &gt; without looking at the code :/.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; I can rework the patch to have the same colors as before with more<br>
&gt; new colors<br>
&gt; for the new tasks I added but with many colors=C2=A0It will be harder =
to<br>
&gt; understand.<br>
<br>
How about a compromise. Keep do_compile and &quot;compile like&quot; tasks<=
br>
separate and use a pale version of the compile colour for &quot;compile<br>
like&quot;. Do something similar for configure and leave the others<br>
unchanged?<br></blockquote><div><br></div><div>Ok, I will do that.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000804a2a0604c6b293--

