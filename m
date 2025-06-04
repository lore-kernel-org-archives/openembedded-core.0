Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D1C1C5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 13:13:13 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.16182.1749042791509597450
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 06:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dLElnOzS;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso8290928b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 06:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749042791; x=1749647591; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=71cDxvJ8nDc8jpg4mVvfe3vghsCZV/VsYUtCJO+u0/o=;
        b=dLElnOzSVAzNWDSyle7A3H4KBFygSEgSywDguSFRBxPfQBRFtYRO0SmdVF3ZeNjUZJ
         R7wTsFW6xhb3xjqYg+3f/PuRXPXn/Jh4upoddEqnHNeHxgcUnQYzFwMLcPcMTzPy9hMs
         IY5j4SrR8ycix1C0OyQdgkNtygmKcKZ4Xsn5MchmaQ7Qf8vx+TUwpfzV8EleT2a9CvAF
         q4F2xMkoLn1iKB8uwR3g6eA+A/uzW+/MHTmKMZBXwgRlwdoWMCSwfDJlvYbvgEkNGPK9
         gc7heHJehmf9/9IIroAgQcwLidWjcV5cHPWgF7Z+XDY3wjQEpXOq9qJukv+SF7AxxdjD
         3dKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749042791; x=1749647591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71cDxvJ8nDc8jpg4mVvfe3vghsCZV/VsYUtCJO+u0/o=;
        b=AMeEEonilas5gQehg/lcMo1jXz+AFT1LWnGN05v1464AH8/i7RQ4wcdLMW6YosZ+5T
         +YcEuzKaO9rn15OJYUAkxcoEX1aTtfD3ffSk3EEkexXOa751kx/9QuaRWmW1JQUH1OFy
         6O0bFi4k3UaS4bPbV2VMq7pSeWiISt60WHXWxGir39eqbsHixkfHtqhAcO1VAVJQvnDL
         AEdqjkGcZstGrgVf4DIe3xdmGl/Pv7sINBC30WikeHS9zuR+80PFCBtWK8tjE+hXoYr6
         1dFh6Gf0DeoKY+54i8zXyJe958NDPHb9gS5TM4syLpieWBRjVePogkkNR0/Y/wuv9EG8
         1b5A==
X-Gm-Message-State: AOJu0YyAbzxH7aa2V9YDKe8MZQbrL5/DXMPJncCBGRDZf7sSOiROxTgi
	wx/GdmjBHVH8A6mUdecR4BdCug4nWZ5nj4C0dNnu9RArroqPLvWMFgqZBtoIDRfUVzKQXRvE0ZG
	zlyrinikSblVf9KlPb7XkOopoVkv258I=
X-Gm-Gg: ASbGncvqQUqhekSLotab3TdZggKe+jbgbgkt1+YLm8voHN/jgX1asGBP1+TfmPfnIyx
	Yo2qllgpJK+N8RTyAXYdeGys2/FxIYZLWk6GYIjHyBJl1ckhoshgAEl2OUwvdTmN7SJIZRf3zkc
	SMjO8iena9OXTSI4oSJYZYCwfOWesuvB/dqg==
X-Google-Smtp-Source: AGHT+IELhalFB0GfXLNTEgB0mVTUZSbeNORVC4jwpt5bnRWr/hECCrE7HykKXE0oS2wele+JAKuCWo9AsO8gL6qtpNI=
X-Received: by 2002:a05:6a00:9284:b0:746:199d:525f with SMTP id
 d2e1a72fcca58-7480b25f0f8mr4396446b3a.7.1749042790625; Wed, 04 Jun 2025
 06:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-perf-arm64-unistd-v1-1-97d3bb08927f@phytec.de>
 <CADkTA4PKf=M6MYeuRatixn7XbeHB4WyE763S_g+dSCj20KGWEw@mail.gmail.com> <c7a3af282c60386768f7051f6beaaad936c87190.camel@phytec.de>
In-Reply-To: <c7a3af282c60386768f7051f6beaaad936c87190.camel@phytec.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Jun 2025 09:12:58 -0400
X-Gm-Features: AX0GCFuBWFyApXEhF4pqYFC05OjMlyW_mD8SgSQ4xccFnyKpm-uksQ-I9deVTV4
Message-ID: <CADkTA4P712PDLNRqsB3ki49+1DudWxkUiPwGzPcba0uSacQXmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perf: add arm64 source files for unistd_64.h
To: Yannic Moog <Y.Moog@phytec.de>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"upstream@lists.phytec.de" <upstream@lists.phytec.de>
Content-Type: multipart/alternative; boundary="0000000000003b76ae0636bec2db"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 13:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217944

--0000000000003b76ae0636bec2db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 9:05=E2=80=AFAM Yannic Moog <Y.Moog@phytec.de> wrote=
:

> Am Mittwoch, dem 04.06.2025 um 07:54 -0400 schrieb Bruce Ashfield:
> >
> >
> > On Wed, Jun 4, 2025 at 2:52=E2=80=AFAM Yannic Moog via lists.openembedd=
ed.org
> > <y.moog=3Dphytec.de@lists.openembedded.org> wrote:
> > > kernel commit bfb713ea53c7 ("perf tools: Fix arm64 build by generatin=
g
> > > unistd_64.h")
> > > introduces a new dependency on source files for arm64, specifically
> > > include/uapi/asm-generic.
> > >
> > > Build fails with:
> > > [..]/perf/1.0/perf-1.0/scripts/Makefile.asm-headers:33:
> [...]/perf/1.0/perf-
> > > 1.0/include/uapi/asm-generic/Kbuild: No such file or directory
> > > make[4]: *** No rule to make target '[...]/perf/1.0/perf-
> > > 1.0/include/uapi/asm-generic/Kbuild'.  Stop.
> > >
> > > Add the directory to PERF_SRC.
> > > Fix whitespace error while at it.
> > >
> > > Signed-off-by: Yannic Moog <y.moog@phytec.de>
> > > ---
> > >  meta/recipes-kernel/perf/perf.bb | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-
> > > kernel/perf/perf.bb
> > > index
> > >
> 0d19e1bdc222da26a5ad0a1d4964acca437a6692..d7a81b5802dc655917c2adf04472b8e=
680
> > > 380ec8 100644
> > > --- a/meta/recipes-kernel/perf/perf.bb
> > > +++ b/meta/recipes-kernel/perf/perf.bb
> > > @@ -151,6 +151,7 @@ PERF_SRC ?=3D "Makefile \
> > >               arch/arm64/tools \
> > >               ${PERF_BPF_EVENT_SRC} \
> > >               arch/${ARCH}/Makefile \
> > > +             ${@bb.utils.contains('ARCH', 'arm64', 'include/uapi/asm=
-
> > > generic', '', d)} \
> > >
> >
> >
> > Can we be more precise on just getting what we need to generate
> unistd_64 ?
>
> Don't think so, but I don't have experience with perf. Kbuild requires al=
l
> files
> present in the directory afaik.
>
>
Not necessarily, see the kernel-dev src recipe. We've been picking out
just the kbuild parts for years there.

Bruce



> >
> > We've always tried to copy just as much as required to get things
> building.
> > I've been
> > able to get away with being specific in kernel-devsrc in the past.
> >
> > Barring that, I wouldn't make this architecture specific, just copy it
> all for
> > all architectures.
>
> Okay, will do.
>
> Yannic
>
> >
> > Bruce
> >
> > >  "
> > >
> > >  PERF_EXTRA_LDFLAGS =3D ""
> > > @@ -208,7 +209,7 @@ python copy_perf_source_from_kernel() {
> > >  do_configure:prepend () {
> > >      # If building a multlib based perf, the incorrect library path
> will be
> > >      # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64)=
.
> In a
> > > 32 bit
> > > -    # build, with a 64 bit multilib, the arch won't match and the
> detection
> > > of a
> > > +    # build, with a 64 bit multilib, the arch won't match and the
> detection
> > > of a
> > >      # 64 bit build (and library) are not exected. To ensure that
> libraries
> > > are
> > >      # installed to the correct location, we can use the weak
> assignment in
> > > the
> > >      # config/Makefile.
> > >
> > > ---
> > > base-commit: 343dd7ae4a177111e75f51f6d1ee1ce254f99e9d
> > > change-id: 20250603-perf-arm64-unistd-9344a6fc96a7
> > >
> > > Best regards,
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000003b76ae0636bec2db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 4, 2025 at 9:05=
=E2=80=AFAM Yannic Moog &lt;<a href=3D"mailto:Y.Moog@phytec.de">Y.Moog@phyt=
ec.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Am Mittwoch, dem 04.06.2025 um 07:54 -0400 schrieb Bruce Ashfield:<br>
&gt; <br>
&gt; <br>
&gt; On Wed, Jun 4, 2025 at 2:52=E2=80=AFAM Yannic Moog via <a href=3D"http=
://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.opene=
mbedded.org</a><br>
&gt; &lt;y.moog=3D<a href=3D"mailto:phytec.de@lists.openembedded.org" targe=
t=3D"_blank">phytec.de@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt; kernel commit bfb713ea53c7 (&quot;perf tools: Fix arm64 build by =
generating<br>
&gt; &gt; unistd_64.h&quot;)<br>
&gt; &gt; introduces a new dependency on source files for arm64, specifical=
ly<br>
&gt; &gt; include/uapi/asm-generic.<br>
&gt; &gt; <br>
&gt; &gt; Build fails with:<br>
&gt; &gt; [..]/perf/1.0/perf-1.0/scripts/Makefile.asm-headers:33: [...]/per=
f/1.0/perf-<br>
&gt; &gt; 1.0/include/uapi/asm-generic/Kbuild: No such file or directory<br=
>
&gt; &gt; make[4]: *** No rule to make target &#39;[...]/perf/1.0/perf-<br>
&gt; &gt; 1.0/include/uapi/asm-generic/Kbuild&#39;.=C2=A0 Stop.<br>
&gt; &gt; <br>
&gt; &gt; Add the directory to PERF_SRC.<br>
&gt; &gt; Fix whitespace error while at it.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Yannic Moog &lt;<a href=3D"mailto:y.moog@phytec.de=
" target=3D"_blank">y.moog@phytec.de</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"=
noreferrer" target=3D"_blank">perf.bb</a> | 3 ++-<br>
&gt; &gt; =C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" =
rel=3D"noreferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-<br>
&gt; &gt; kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer" target=
=3D"_blank">perf.bb</a><br>
&gt; &gt; index<br>
&gt; &gt; 0d19e1bdc222da26a5ad0a1d4964acca437a6692..d7a81b5802dc655917c2adf=
04472b8e680<br>
&gt; &gt; 380ec8 100644<br>
&gt; &gt; --- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"=
noreferrer" target=3D"_blank">perf.bb</a><br>
&gt; &gt; +++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"=
noreferrer" target=3D"_blank">perf.bb</a><br>
&gt; &gt; @@ -151,6 +151,7 @@ PERF_SRC ?=3D &quot;Makefile \<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm64/tools=
 \<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PERF_BPF_EVENT=
_SRC} \<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/${ARCH}/Mak=
efile \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.cont=
ains(&#39;ARCH&#39;, &#39;arm64&#39;, &#39;include/uapi/asm-<br>
&gt; &gt; generic&#39;, &#39;&#39;, d)} \<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; Can we be more precise on just getting what we need to generate unistd=
_64 ?<br>
<br>
Don&#39;t think so, but I don&#39;t have experience with perf. Kbuild requi=
res all files<br>
present in the directory afaik.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Not necessarily, see the kernel-dev src recipe. We&#39;ve =
been picking out</div><div class=3D"gmail_default" style=3D"font-size:small=
">just the kbuild parts for years there.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
&gt; <br>
&gt; We&#39;ve always tried to copy just as much as required to get things =
building.<br>
&gt; I&#39;ve been<br>
&gt; able to get away with being specific in kernel-devsrc in the past.<br>
&gt; <br>
&gt; Barring that, I wouldn&#39;t make this architecture specific, just cop=
y it all for<br>
&gt; all architectures.<br>
<br>
Okay, will do.<br>
<br>
Yannic<br>
<br>
&gt; <br>
&gt; Bruce<br>
&gt; <br>
&gt; &gt; =C2=A0&quot;<br>
&gt; &gt; <br>
&gt; &gt; =C2=A0PERF_EXTRA_LDFLAGS =3D &quot;&quot;<br>
&gt; &gt; @@ -208,7 +209,7 @@ python copy_perf_source_from_kernel() {<br>
&gt; &gt; =C2=A0do_configure:prepend () {<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0# If building a multlib based perf, the incor=
rect library path will be<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0# detected by perf, since it triggers via: if=
eq ($(ARCH),x86_64). In a<br>
&gt; &gt; 32 bit<br>
&gt; &gt; -=C2=A0 =C2=A0 # build, with a 64 bit multilib, the arch won&#39;=
t match and the detection<br>
&gt; &gt; of a <br>
&gt; &gt; +=C2=A0 =C2=A0 # build, with a 64 bit multilib, the arch won&#39;=
t match and the detection<br>
&gt; &gt; of a<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0# 64 bit build (and library) are not exected.=
 To ensure that libraries<br>
&gt; &gt; are<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0# installed to the correct location, we can u=
se the weak assignment in<br>
&gt; &gt; the<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0# config/Makefile.<br>
&gt; &gt; <br>
&gt; &gt; ---<br>
&gt; &gt; base-commit: 343dd7ae4a177111e75f51f6d1ee1ce254f99e9d<br>
&gt; &gt; change-id: 20250603-perf-arm64-unistd-9344a6fc96a7<br>
&gt; &gt; <br>
&gt; &gt; Best regards,<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000003b76ae0636bec2db--

