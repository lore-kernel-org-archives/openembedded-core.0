Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63ABCCE7AAA
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 17:19:34 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.66890.1695662368565961985
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 10:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k8IA7f0B;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-405505b07dfso28708995e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 10:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695662367; x=1696267167; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3UfB2TfJbJ3nliC0F/iMO1VEh3QjOAR3PEtliuHvvxE=;
        b=k8IA7f0BCpHwCvLFE8PsyaEZpuuxqTtFBLKsT0937h7G5fTpIA0YGfhGUX1ZSL7zg4
         oskZvHt4j0UuWmwtG0fkVW5a4BjXLTgg1mGR/t2tGDsVIO/nQOyWO6zKqSbb9s1MgFIr
         E0ihed6wUcDdopBbMqBC+X97Shj2CdAURBilUzeKrzzhDY+3F5IbibpwsjfkR0kySTnU
         YfPI+QSczXFf0IZm6FdCe/8VsYnE/oW5DVnp/faKlcinWS2vkvKsSFD80LdwMqMH2fQc
         m6Tq+UA0YilNpfiiCtATTv3sE2BRv1p5xAduuqYVdrcffML1WRsM06NFCP70Ur3io2mu
         Z4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695662367; x=1696267167;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3UfB2TfJbJ3nliC0F/iMO1VEh3QjOAR3PEtliuHvvxE=;
        b=lCJdbuoA3lYrrSt7qmZQ0fcMsCgToqNgdgY0qSG7Esy7DQcO7P1LM6YjSJrD+JgIDe
         lc8zkiffubNbUkEa7w6vWHoYrzfmVrqJVsShFB7Nwc2BETEYnArYd50bFcNNCzWbhBrM
         sfqusHD93Gx0T1h4Vaz9o9L+pCM5HZOtX/InafuxB23XxmpC1x/xS/DuikvqCEC058YC
         uWl7V3lEefAR9y26nHtqmZjMIaG1s9idtij1GpTSV4isEUuMTFQlUNjfs5q4rvEAA/Is
         reiO/M7cKbosX6Xwp2yM+N+dtcrq9eFXJlgww+C3hHIV5dWHOlUF+W4RMzy/uThVIWnN
         oqSw==
X-Gm-Message-State: AOJu0YxJVFFhaTBVqg5zJ1PG1BSbARkU6PyRQcoOi2qtmrccusR35aJ2
	cvSR6MWTgprUchfxI3Yj9lpPTc1AiwLAZfBs10g=
X-Google-Smtp-Source: AGHT+IEPJam4ayfQAuVGEBRj1ywaHq7rh3e5pZ/xozsNAP0vgDTm6I8qoy4qYpLKZHhascW/q+B7nWmGEIay6nmGN3A=
X-Received: by 2002:adf:f484:0:b0:31f:afeb:4e7d with SMTP id
 l4-20020adff484000000b0031fafeb4e7dmr218300wro.18.1695662366528; Mon, 25 Sep
 2023 10:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230920105802.1008778-1-richard.purdie@linuxfoundation.org>
 <20230920105802.1008778-3-richard.purdie@linuxfoundation.org>
 <CA+chaQdisk-vWfuRvOuK4dGag2coDqJX89OSf_T2YrZEqPSxcg@mail.gmail.com> <4050f808f3123fd5decc61b90926f57608a35eb2.camel@linuxfoundation.org>
In-Reply-To: <4050f808f3123fd5decc61b90926f57608a35eb2.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 25 Sep 2023 19:19:15 +0200
Message-ID: <CA+chaQft8D9SjZAfrZ8bSYReq_+C8C4gRHDvUU7WA9=2O2rAqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/6] sstate: Stop allowing overlapping symlinks
 from sstate
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000418d406063229a4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 17:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188197

--0000000000000418d406063229a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In the cases I've seen in our internal recipes I can just PNBLACKLIST the
one we never use (libfm) to make sure it's never built with faultmanager
(as it was built only as part of world build anyway, nothing in our images
really depends on it). So it wasn't something which would happen in regular
builds, but I agree that ihe error is real and good that it will force us
to make this a bit more deterministic.

For some other internal cases I can also add SkipRecipe to make them
mutually exclusive (they are MACHINE_ARCH implementations of the same
thing, just not restricted with COMPATIBLE_MACHINE or such to make sure
that only the preferred provider is built for given MACHINE).

And for libslirp and libslirp-virt it looks like it was meant to be only
temporary and this error will force it to be resolved a bit sooner.

Regards,

On Mon, Sep 25, 2023 at 4:59=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2023-09-24 at 11:14 +0200, Martin Jansa wrote:
> > Just FYI I think this change is now causing few more recipes to be
> mutually exclusive, when they build the same library (even when it's
> packaged in differently named package), in world builds I'm seeing e.g.
> libslirp and libslirp-virt (from meta-virtualization) causing packagedata
> failure for one of them (depending which one was built second):
> >
> > DEBUG: Staging files from
> TOPDIR/BUILD/work/raspberrypi4_64-oe-linux/libslirp-virt/4.6.1+git/pkgdat=
a-pdata-input
> to TOPDIR/BUILD/pkgdata/raspberrypi4-64
> > ERROR: Recipe libslirp-virt is trying to install files into a shared
> area when those files already exist. The files and the manifests listing
> them are:
> >   TOPDIR/BUILD/pkgdata/raspberrypi4-64/runtime-reverse/libslirp-dev
> >     (matched in manifest-raspberrypi4_64-libslirp.packagedata)
> >   TOPDIR/BUILD/pkgdata/raspberrypi4-64/runtime-reverse/libslirp0
> >     (matched in manifest-raspberrypi4_64-libslirp.packagedata)
> >   TOPDIR/BUILD/pkgdata/raspberrypi4-64/runtime-reverse/libslirp-dbg
> >     (matched in manifest-raspberrypi4_64-libslirp.packagedata)
> >   TOPDIR/BUILD/pkgdata/raspberrypi4-64/runtime-reverse/libslirp-src
> >     (matched in manifest-raspberrypi4_64-libslirp.packagedata)
> > Please adjust the recipes so only one recipe provides a given file.
> > DEBUG: Python function sstate_task_postfunc finished
> >
> > Bruce is 4.6.1 version in meta-virtualization still needed or can you
> update to libslirp 4.7.0 from oe-core?
> > From the git log
> https://git.yoctoproject.org/meta-virtualization/log/recipes-networking/s=
lirp
> it looks like it was originally imported from meta-retro and later rename=
d
> from libslirp to libslirt-virt until the oe-core version is validated in
> runtime.
> >
> > And I'm seeing the same with some internal recipes (e.g. we have
> faultmanager recipe which provides libfm - completely different from libf=
m
> from oe-core, just library name coincidence).
>
> I did look into this and it *is* a real issue/bug. The output will be
> non-deterministic depending upon which is built first. The issue would
> "corrupt" anything which is reading data from pkgdata related to the
> recipes in question.
>
> The error is therefore correct and we need to do something about this.
>
> Cheers,
>
> Richard
>
>

--0000000000000418d406063229a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In the cases I&#39;ve seen in our internal recipes I can j=
ust PNBLACKLIST the one we never use (libfm) to make sure it&#39;s never bu=
ilt with faultmanager (as it was built only as part of world build anyway, =
nothing in our images really depends on it). So it wasn&#39;t something whi=
ch would happen in regular builds, but I agree that ihe error is real and g=
ood that it will force us to make this a bit more deterministic.<div><br></=
div><div>For some other internal cases I can also add SkipRecipe to make th=
em mutually exclusive (they are MACHINE_ARCH implementations of the same th=
ing, just not restricted with COMPATIBLE_MACHINE or such to make sure that =
only the preferred provider is built for given MACHINE).</div><div><br></di=
v><div>And for libslirp and libslirp-virt it looks like it was meant to be =
only temporary and this error will force it to be resolved a bit sooner.</d=
iv><div><br></div><div>Regards,</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 25, 2023 at 4:59=E2=80=AFP=
M Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">=
richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Sun, 2023-09-24 at 11:14 +0200, Martin=
 Jansa wrote:<br>
&gt; Just FYI I think this change is now causing few more recipes to be mut=
ually exclusive, when they build the same library (even when it&#39;s packa=
ged in differently named package), in world builds I&#39;m seeing e.g. libs=
lirp and libslirp-virt (from meta-virtualization) causing packagedata failu=
re for one of them (depending which one was built second):<br>
&gt; <br>
&gt; DEBUG: Staging files from TOPDIR/BUILD/work/raspberrypi4_64-oe-linux/l=
ibslirp-virt/4.6.1+git/pkgdata-pdata-input to TOPDIR/BUILD/pkgdata/raspberr=
ypi4-64<br>
&gt; ERROR: Recipe libslirp-virt is trying to install files into a shared a=
rea when those files already exist. The files and the manifests listing the=
m are:<br>
&gt; =C2=A0 TOPDIR/BUILD/pkgdata/raspberrypi4-64/runtime-reverse/libslirp-d=
ev<br>
&gt; =C2=A0 =C2=A0 (matched in manifest-raspberrypi4_64-libslirp.packagedat=
a)<br>
&gt; =C2=A0 TOPDIR/BUILD/pkgdata/raspberrypi4-64/runtime-reverse/libslirp0<=
br>
&gt; =C2=A0 =C2=A0 (matched in manifest-raspberrypi4_64-libslirp.packagedat=
a)<br>
&gt; =C2=A0 TOPDIR/BUILD/pkgdata/raspberrypi4-64/runtime-reverse/libslirp-d=
bg<br>
&gt; =C2=A0 =C2=A0 (matched in manifest-raspberrypi4_64-libslirp.packagedat=
a)<br>
&gt; =C2=A0 TOPDIR/BUILD/pkgdata/raspberrypi4-64/runtime-reverse/libslirp-s=
rc<br>
&gt; =C2=A0 =C2=A0 (matched in manifest-raspberrypi4_64-libslirp.packagedat=
a)<br>
&gt; Please adjust the recipes so only one recipe provides a given file. <b=
r>
&gt; DEBUG: Python function sstate_task_postfunc finished<br>
&gt; <br>
&gt; Bruce is 4.6.1 version in meta-virtualization still needed or can you =
update to libslirp 4.7.0 from oe-core?<br>
&gt; From the git log=C2=A0<a href=3D"https://git.yoctoproject.org/meta-vir=
tualization/log/recipes-networking/slirp" rel=3D"noreferrer" target=3D"_bla=
nk">https://git.yoctoproject.org/meta-virtualization/log/recipes-networking=
/slirp</a> it looks like it was originally imported from meta-retro and lat=
er renamed from libslirp to libslirt-virt until the oe-core version is vali=
dated in runtime.<br>
&gt; <br>
&gt; And I&#39;m seeing the same with some internal recipes (e.g. we have f=
aultmanager recipe which provides libfm - completely different from libfm f=
rom oe-core, just library name coincidence).<br>
<br>
I did look into this and it *is* a real issue/bug. The output will be<br>
non-deterministic depending upon which is built first.=C2=A0The issue would=
<br>
&quot;corrupt&quot; anything which is reading data from pkgdata related to =
the<br>
recipes in question.<br>
<br>
The error is therefore correct and we need to do something about this.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--0000000000000418d406063229a4--

