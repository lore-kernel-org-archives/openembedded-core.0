Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C89C8F44873
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:00:43 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157200.1775829632961117568
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 07:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gbOJQtvV;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6501d32b04bso2230940d50.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 07:00:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775829632; cv=none;
        d=google.com; s=arc-20240605;
        b=EvRftTQz25sazo4/oGZ2f06OxQyvpLxgHvoW3hbXkKdwpJNPsmKGP/Rd7DNjxC2n6N
         801kK+5QsAX0lbuuEDxX/k80ctlysexEkuhbL12y5MfBLpfRGnnebC92R/AK9HbUvTYp
         XNkMMcEeAlh7Am9dGzYzRVdD8vy6y76B982Zp7eX8HOuho/D0f/O2VxF6ItmRLvMaKLX
         Kzw/MDrQJ6i5rvDEEbHTpgYPkOl4RY04OBJ0wkvPNjxNsevPtivKSVq1THfwkFbvgMBg
         annDTvLKcRYyYPNMI713G1MM0lCYOtXXw2Wgm1ZYeWRB1Pa7bzDpVg7TfshS65iJrBUR
         lKNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AboqOua8abizTdGaBkUax6Ict21fIe1MvT7nEtjgsSo=;
        fh=WdjV3QKZYGF8i5A6hYifeM8IJ2mLihyXvspEGCJvI3M=;
        b=K9XypS4odlPQZa8QTHbrXo1bchcC7VFekKNhxp+iMVV8v8Xjtt+vUyJ791VBwgWrXY
         GedNSh+nov+Z7SD1y/uRUtZqvqdV3RPOVClShxgKDgE9/+uuR+44is1CbcdjFPAfHCoM
         T0VJy2yLfEyEEyDQbtxparaF4fgULHpChA66ngWxyOQvJeSLmOcPLFIKO61RUxtak8GY
         kjuXp2K5210Xf/ipWDd0hh6fl3IKwjYYgjfC0FwZAP3j07YV+FCFN066x0PaY4nBEleV
         2BD8OrNZOdx/Wl7ydnem8juvhjSaNjb4kcN0OrvweGLnLi8pZ5WGXKleRJDii80Dbum5
         Jg8w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775829632; x=1776434432; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AboqOua8abizTdGaBkUax6Ict21fIe1MvT7nEtjgsSo=;
        b=gbOJQtvVhMOptELHezVq9wwc/TgcgI19a/i/qd2lm7XZH37T/kDHew6gHt6nL3u0ob
         KZoiJSdMsyca4MSaAfIEJ/4YPf+pnqoK+1o1v3OY8X0jphvN7+bPW7cIouVlX06Gh0IJ
         m8sSScWexJgHbvIanh9MKTgqkZ2agGH0RogsawjyZi9kyxhucXPHTxNhPNU+rhdui4po
         Mdv0DRxEOsUpxHskPaf9/QGpVpiV+FM/pVSG+Ao6bn+KJAKCM29+dJ+9dzpoVYdZ8+1F
         4oLGGJSwzEYohQuiq4czCipO7q6YGd4IS3avn6DG2Fh8o0OqlSApcSpNStWfAxtY/mcj
         CBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775829632; x=1776434432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AboqOua8abizTdGaBkUax6Ict21fIe1MvT7nEtjgsSo=;
        b=SBR/cJnT1/kqXT/1QW69H1RlGQZtEMWM+iXbu+mywv1t4+WFx4NvN/MOeuwtK8YWAv
         mz6MWCvu7d0Nj7kaAHi5l0d9gxpR9yHqTZzYRIyVCL4eK4g/1Te/aNUjMtWMl2OSX58t
         UbGKrOX6wg/JtjdrcbAdF8lWEKKj+yxPEryJZITQXXRiJWJLas6EQJIGV0hGIRLQuzug
         1SNeE5r46cUb2nphLoqkbfL3GZUICrR3A73wDIo19l8ahC2Wg4CC9qfy9vP8V8kts3KF
         pKCFGZgJUlY50ETZtgj7Cet8ZwxREoOQCr239q8G5x4B0YKg0MTlCOcHLXIOP7DG3Lnr
         IlAg==
X-Forwarded-Encrypted: i=1; AJvYcCV2OrSpjCy2qAhYa2m8z+jRW29qjB6F1Od2mnr0SoyAa3yVIdguaKEgO99LCWsJlD3qN3UuQDq62mI90S5YHotEqg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxzuR8w3cJU5LUlbl806FecdfHuV52wGNGyXDdjK5rHoMZfZmnD
	a+HEKAru8NzYPvFAp/mnLNu/U0PCVK0A/a5aUIC5IPvtVMlW1zdG85ONiYleo0HiVFPsAVNtDe7
	2aVf6VsFlb5xDCyh4P1sK7rknlE86tyMIig==
X-Gm-Gg: AeBDiesJo10Yt0e2WDFIN1/i3F2Jyaw0x+6d/64HywKLKf8deK3g0dTRwdo0kQ5e8r9
	jwc9NFMzxU6uEmCTWSVyUnJEtQ+poj7O8pz7FVdzJkP7Y4qv5XStLA7WyrTTXromVY4e3b7VBnw
	XDBqvNwuVTYIMtAaeiBz4bsxIYb65Pia1EjOaq0p2dIjf0092OHPPuiqFQOhanEJdH/6PCksf83
	Pg7PRKB30T0opAsxbegcDfg2ehUF/P4meApM75Lbhlv8/d8iMsHlG4elpjAng0iBz8NkkvwCnNn
	H/KVJLMSlzVvdLRDqxTiYNJz4SiGQZexRGjFOs6yBvNizQk4wmRggleTUsQfuNDe6oqOhdI5DpQ
	gl/LrCWF+czcla4xnz+Onj6Yq
X-Received: by 2002:a53:d20a:0:b0:64e:ecef:1793 with SMTP id
 956f58d0204a3-65198a6b7a8mr2322622d50.15.1775829631442; Fri, 10 Apr 2026
 07:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260408044737.696968-1-khem.raj@oss.qualcomm.com>
 <c8e3d16047191a697c26bfdfd7885fa8f560a7dc.camel@linuxfoundation.org> <DHPILUGFBYND.3S81A028WPCOE@bootlin.com>
In-Reply-To: <DHPILUGFBYND.3S81A028WPCOE@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Apr 2026 07:00:18 -0700
X-Gm-Features: AQROBzCUcjq1PmDNiKp5IhxzfhKEhGdp_eNUke4BWEPdLzOTgimJWMWrQxGyo_s
Message-ID: <CAMKF1srA7Gs8aitDCnc8h9p=mLF899v=uvwM_fQug5OoEg0smw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] db: Pin to use C99 std
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="0000000000005d2673064f1b8ed4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 14:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235034

--0000000000005d2673064f1b8ed4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I sent a v2 please use that

https://lore.kernel.org/openembedded-core/20260408162759.842544-1-khem.raj@=
oss.qualcomm.com/

On Fri, Apr 10, 2026, 6:38=E2=80=AFAM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Fri Apr 10, 2026 at 3:15 PM CEST, Richard Purdie via
> lists.openembedded.org wrote:
> > On Tue, 2026-04-07 at 21:47 -0700, Khem Raj via lists.openembedded.org
> wrote:
> >> GCC-15 has switched to using C23 by default, we have been selectively
> >> disabling warnings as errors to get by, however with autoconf 2.72
> adding
> >> -std=3Dgnu23 it now gets enabled for every compiler and clang-22 is mo=
re
> >> obidient and has dropped support for K&R C completely. db5 code has a
> lot
> >> of K&R C prototypes and it starts to fail vigorously. We can not keep
> >> working around with out uplifting sources to be compliant with newer C
> >> standard like C23.
> >>
> >> Therefore pin the cflags to use C99 standard as this package expects.
> >>
> >> Drop the code to disable warnings as errors selectively.
> >>
> >> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> >> ---
> >>  meta/recipes-support/db/db_5.3.28.bb | 9 ++++-----
> >>  1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > This seemed to trigger failures for me, e.g.:
> >
> >
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/3538#b=
b-step-15
> >
> > Cheers,
> >
> > Richard
>
> This is because the patch is touching lines ending with spaces, and
> these spaces have not been kept in the mail.
>
> I tweaked the patch to make it work correctly, it landed in my -success
> branch.
>
> Thanks,
> Mathieu
>
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--0000000000005d2673064f1b8ed4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I sent a v2 please use that<div dir=3D"auto"><br><div dir=
=3D"auto"><div dir=3D"auto"><a href=3D"https://lore.kernel.org/openembedded=
-core/20260408162759.842544-1-khem.raj@oss.qualcomm.com/">https://lore.kern=
el.org/openembedded-core/20260408162759.842544-1-khem.raj@oss.qualcomm.com/=
</a></div></div></div></div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 10, 2026, 6:38=E2=
=80=AFAM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-briand@=
bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Fri Apr 10, 2026 at 3:15 P=
M CEST, Richard Purdie via <a href=3D"http://lists.openembedded.org" rel=3D=
"noreferrer noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:=
<br>
&gt; On Tue, 2026-04-07 at 21:47 -0700, Khem Raj via <a href=3D"http://list=
s.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.o=
penembedded.org</a> wrote:<br>
&gt;&gt; GCC-15 has switched to using C23 by default, we have been selectiv=
ely<br>
&gt;&gt; disabling warnings as errors to get by, however with autoconf 2.72=
 adding<br>
&gt;&gt; -std=3Dgnu23 it now gets enabled for every compiler and clang-22 i=
s more<br>
&gt;&gt; obidient and has dropped support for K&amp;R C completely. db5 cod=
e has a lot<br>
&gt;&gt; of K&amp;R C prototypes and it starts to fail vigorously. We can n=
ot keep<br>
&gt;&gt; working around with out uplifting sources to be compliant with new=
er C<br>
&gt;&gt; standard like C23.<br>
&gt;&gt; <br>
&gt;&gt; Therefore pin the cflags to use C99 standard as this package expec=
ts.<br>
&gt;&gt; <br>
&gt;&gt; Drop the code to disable warnings as errors selectively.<br>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcom=
m.com" target=3D"_blank" rel=3D"noreferrer">khem.raj@oss.qualcomm.com</a>&g=
t;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0meta/recipes-support/db/<a href=3D"http://db_5.3.28.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">db_5.3.28.bb</a> | 9 ++++-----=
<br>
&gt;&gt; =C2=A01 file changed, 4 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; This seemed to trigger failures for me, e.g.:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/74=
/builds/3538%23bb-step-15" rel=3D"noreferrer noreferrer" target=3D"_blank">=
https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/3538#bb-=
step-15</a><br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
<br>
This is because the patch is touching lines ending with spaces, and<br>
these spaces have not been kept in the mail.<br>
<br>
I tweaked the patch to make it work correctly, it landed in my -success<br>
branch.<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
<br>
</blockquote></div>

--0000000000005d2673064f1b8ed4--

