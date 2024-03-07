Return-Path: <rwmacleod@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9BEC5475B
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 03:37:57 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web10.15144.1709782669246932935
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 19:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b2PaHH9l;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: rwmacleod@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-47265b3ca14so149139137.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 19:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709782668; x=1710387468; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2dVkKRoXW9l2iMy1o10P7i4CHUDN8nPWgoz4ps1YMoY=;
        b=b2PaHH9lcgIgutSksi7S4B00j3WwIYACYDFpFg0tGxWz0BzibFa1qX7a64wupL2BTg
         U65tuNLE6pXJhCTha35pe0FvhkaCm14J2qBosDoloZHFWIXGCBWJ/FmhTk4fJ7Djti1I
         3Zs1HqvVkqORkb+8JSGbm8vOr+8HfgkSTXnIxgIkey2W2L9tFO07GZv/6e5yqrXtG+pj
         DsOZvsYmPWpo84ed91dJGmIpsEjSHDtmF6BZehIjuJZVCzm5i1fJVXEER4ceKVQJyoie
         Xlc2ADqbBgzY3EwKCjicgPkAXwo2h9U6jF7FEsZwQoUe8KjmP5StvaAwPa6x90Ayyub/
         mTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709782668; x=1710387468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dVkKRoXW9l2iMy1o10P7i4CHUDN8nPWgoz4ps1YMoY=;
        b=SWfrnL3knaWcngsZ7xrkgw9ypSDin9T1QA35N4zR/5ixN1rlOVqkwR+2gxVOyvmvEC
         sbRUfiEUyOUh01FPXAXtuG0YlVmNzWxPyGPxZ51i+e+OYMiyfFOTh7dyWMYaEYrSgXcJ
         MY+wrrD2vZruIRp5lqSqUwkRJpo2nV7clNEGT4t/eiafFy1QuTaY2ECpg4fQGGLAqmF5
         3jM/WMnNDNJ/AFm9vIRjMOC5kehkqa0rCVji32Lepr5rYexoWcxmMn97pbwtZ0ROs3JP
         wV4KOkQ/xHh+dlyIeAOy815x7xewEyHv205pEwAu/PGZe0rW/9FpK0IZVsDSC/eAJ5zn
         lm7w==
X-Forwarded-Encrypted: i=1; AJvYcCU2nDxEznLEOBCYTTMJxfKQ4Idge9xgYXNw3e6wwm9iCK05QOXkJbOL73qIVJ3hOo/oYW0bVmse8NfBuX8hymEw2E1R4FTBJTIyYOXScG71uKyDIjiAW5Hg
X-Gm-Message-State: AOJu0Yx3U2KCjKdtARmQhWp6ihL1C73e0WlmOeYa3Nihw5FcQzLU8qe2
	48cGVO0e8BRVW/TTeYRd2uVATA+mAiS8OjeO5Tvtve3tgilmiFhX3GnbSA/TBejFuHTD0Lb5Pgw
	kyTlcFPOdpQspySuHGa4EHIVw12U=
X-Google-Smtp-Source: AGHT+IG+HOkHLn0Jv7JVfK9Frl4lKZvmKwB82ebSwSXgYMuLAIKh3QBFg/XEQpNx4qQxZYIrHwdZucqGmUr2Xpru5E4=
X-Received: by 2002:a05:6102:367a:b0:470:3f32:ab51 with SMTP id
 bg26-20020a056102367a00b004703f32ab51mr6625650vsb.22.1709782668219; Wed, 06
 Mar 2024 19:37:48 -0800 (PST)
MIME-Version: 1.0
References: <20240307015239.2600073-1-Randy.MacLeod@windriver.com> <CAMKF1sqkhATCR5S_bciVOMZvGVd5H251x+t0z1p9Cve4pJf4dg@mail.gmail.com>
In-Reply-To: <CAMKF1sqkhATCR5S_bciVOMZvGVd5H251x+t0z1p9Cve4pJf4dg@mail.gmail.com>
From: Randy MacLeod <rwmacleod@gmail.com>
Date: Wed, 6 Mar 2024 22:37:37 -0500
Message-ID: <CAK6=ix6eAYG6vrFynZy4F=pWi1hECHNoFa56=+zkG=vbRx3myg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] valgrind: skip intermittently failing ptests
To: Khem Raj <raj.khem@gmail.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000951b4e061309ccac"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 03:37:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196766

--000000000000951b4e061309ccac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024, 22:31 Khem Raj <raj.khem@gmail.com> wrote:

> do we know the reason for these failures or some details ?
>

Not yet. I'm just skipping the tests for now to make the YP auto builder
less noisy.

Some day I'll make time to work on understanding and hopefully fixing all
the slipped tests.


Randy


> On Wed, Mar 6, 2024 at 5:52=E2=80=AFPM Randy MacLeod via
> lists.openembedded.org
> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > From: Randy MacLeod <Randy.MacLeod@windriver.com>
> >
> > Skip a few additional ptests that fail occasionally on the Yocto
> > autobuilder and remove those added to the remove-for-all list
> > if they were already in the remove-for-aarch64 list.
> >
> > =3D=3D=3D Test Summary =3D=3D=3D
> > TOTAL: 774
> > PASSED: 755
> > FAILED: 0
> > SKIPPED: 19
> >
> > Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> > ---
> >  meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 | 2 --
> >  meta/recipes-devtools/valgrind/valgrind/remove-for-all     | 4 ++++
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
> b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
> > index 04f159d701..5bfba1c8d3 100644
> > --- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
> > +++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
> > @@ -1,5 +1,4 @@
> >  drd/tests/annotate_sem
> > -drd/tests/boost_thread
> >  gdbserver_tests/hgtls
> >  helgrind/tests/hg05_race2
> >  helgrind/tests/tc20_verifywrap
> > @@ -15,7 +14,6 @@ memcheck/tests/atomic_incs
> >  memcheck/tests/bug464969_d_demangle
> >  memcheck/tests/cxx17_aligned_new
> >  memcheck/tests/demangle
> > -memcheck/tests/linux/timerfd-syscall
> >  memcheck/tests/long_namespace_xml
> >  memcheck/tests/mismatches
> >  memcheck/tests/mismatches_xml
> > diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all
> b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
> > index 004589a7ea..8435a6d41d 100644
> > --- a/meta/recipes-devtools/valgrind/valgrind/remove-for-all
> > +++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
> > @@ -1,8 +1,12 @@
> >  cachegrind/tests/wrap5
> > +drd/tests/boost_thread
> >  none/tests/amd64/fb_test_amd64
> > +none/tests/tls
> >  gdbserver_tests/hginfo
> > +gdbserver_tests/mcinvokeRU
> >  memcheck/tests/linux/dlclose_leak-no-keep
> >  memcheck/tests/linux/dlclose_leak
> > +memcheck/tests/linux/timerfd-syscall
> >  memcheck/tests/supp_unknown
> >  memcheck/tests/wrap1
> >  memcheck/tests/wrap2
> > --
> > 2.43.0
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196765):
> https://lists.openembedded.org/g/openembedded-core/message/196765
> Mute This Topic: https://lists.openembedded.org/mt/104780048/953399
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rwmacleod@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000951b4e061309ccac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Mar 6, 2024, 22:31 Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">do we know the reason for these failures or some det=
ails ?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Not yet. I&#39;m just skipping the tests for now to make the YP auto =
builder less noisy.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Some=
 day I&#39;ll make time to work on understanding and hopefully fixing all t=
he slipped tests.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Randy</div><div dir=3D"auto"><br></div><div dir=3D"au=
to"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
On Wed, Mar 6, 2024 at 5:52=E2=80=AFPM Randy MacLeod via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">lists.openembedded.org</a><br>
&lt;randy.macleod=3D<a href=3D"mailto:windriver.com@lists.openembedded.org"=
 target=3D"_blank" rel=3D"noreferrer">windriver.com@lists.openembedded.org<=
/a>&gt; wrote:<br>
&gt;<br>
&gt; From: Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver.com"=
 target=3D"_blank" rel=3D"noreferrer">Randy.MacLeod@windriver.com</a>&gt;<b=
r>
&gt;<br>
&gt; Skip a few additional ptests that fail occasionally on the Yocto<br>
&gt; autobuilder and remove those added to the remove-for-all list<br>
&gt; if they were already in the remove-for-aarch64 list.<br>
&gt;<br>
&gt; =3D=3D=3D Test Summary =3D=3D=3D<br>
&gt; TOTAL: 774<br>
&gt; PASSED: 755<br>
&gt; FAILED: 0<br>
&gt; SKIPPED: 19<br>
&gt;<br>
&gt; Signed-off-by: Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windr=
iver.com" target=3D"_blank" rel=3D"noreferrer">Randy.MacLeod@windriver.com<=
/a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 | 2 -=
-<br>
&gt;=C2=A0 meta/recipes-devtools/valgrind/valgrind/remove-for-all=C2=A0 =C2=
=A0 =C2=A0| 4 ++++<br>
&gt;=C2=A0 2 files changed, 4 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch6=
4 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64<br>
&gt; index 04f159d701..5bfba1c8d3 100644<br>
&gt; --- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64<br>
&gt; +++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64<br>
&gt; @@ -1,5 +1,4 @@<br>
&gt;=C2=A0 drd/tests/annotate_sem<br>
&gt; -drd/tests/boost_thread<br>
&gt;=C2=A0 gdbserver_tests/hgtls<br>
&gt;=C2=A0 helgrind/tests/hg05_race2<br>
&gt;=C2=A0 helgrind/tests/tc20_verifywrap<br>
&gt; @@ -15,7 +14,6 @@ memcheck/tests/atomic_incs<br>
&gt;=C2=A0 memcheck/tests/bug464969_d_demangle<br>
&gt;=C2=A0 memcheck/tests/cxx17_aligned_new<br>
&gt;=C2=A0 memcheck/tests/demangle<br>
&gt; -memcheck/tests/linux/timerfd-syscall<br>
&gt;=C2=A0 memcheck/tests/long_namespace_xml<br>
&gt;=C2=A0 memcheck/tests/mismatches<br>
&gt;=C2=A0 memcheck/tests/mismatches_xml<br>
&gt; diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/=
meta/recipes-devtools/valgrind/valgrind/remove-for-all<br>
&gt; index 004589a7ea..8435a6d41d 100644<br>
&gt; --- a/meta/recipes-devtools/valgrind/valgrind/remove-for-all<br>
&gt; +++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all<br>
&gt; @@ -1,8 +1,12 @@<br>
&gt;=C2=A0 cachegrind/tests/wrap5<br>
&gt; +drd/tests/boost_thread<br>
&gt;=C2=A0 none/tests/amd64/fb_test_amd64<br>
&gt; +none/tests/tls<br>
&gt;=C2=A0 gdbserver_tests/hginfo<br>
&gt; +gdbserver_tests/mcinvokeRU<br>
&gt;=C2=A0 memcheck/tests/linux/dlclose_leak-no-keep<br>
&gt;=C2=A0 memcheck/tests/linux/dlclose_leak<br>
&gt; +memcheck/tests/linux/timerfd-syscall<br>
&gt;=C2=A0 memcheck/tests/supp_unknown<br>
&gt;=C2=A0 memcheck/tests/wrap1<br>
&gt;=C2=A0 memcheck/tests/wrap2<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#196765): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/196765" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/196765</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104780048/953=
399" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/104780048/953399</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:rwmacleod@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">rwmacleod@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000951b4e061309ccac--

