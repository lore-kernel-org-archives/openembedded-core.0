Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE74BD1F9D1
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 21:09:21 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.8217.1729026560849339155
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 14:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jYKrYdSi;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71e4c2e36daso197433b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 14:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729026560; x=1729631360; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzSVVLj1aNIo34FirbSryDjyyDoPF0Pa0jp8a4BEths=;
        b=jYKrYdSio1ilNFOhkUEWvMo+gpD5XsMkdG4eAhIh2cgDr9VnPOhY9n8Bkr8CGoX3kk
         Ei5xhcy9ByAFFdv+9eKFSAiicq4JD0nQEV1f9WWx86S2N4L5PQQgMwdlD7uokEz8js2N
         cSdNq53GIJmpDiuaJlS2vwsWrfEJLFg1HI0js6WsvelM+ZQwlGSxyNydmQA0OCTKKz5s
         obqcrJ2QaLE7xLw0S+K6tWkXJytSjtQaGM7YlTeiCWA1XfNytLioHFoX9aKTONpaJ2i6
         QpiY3wjeUhhUWeSbCPJ7HJdo7Ba+fbgI54BQcyLdB9rn2XqnGlFjfZOo4TBao9Lay6Ah
         pVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729026560; x=1729631360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzSVVLj1aNIo34FirbSryDjyyDoPF0Pa0jp8a4BEths=;
        b=NomGwqO4Tn7QBSTWuTz7g48PCcViFlkEUBZaMW+zSWUPVSO8Q69RwCSYJG3WJGYwOH
         qv6sMRHV2SIH6U4X3SSt1UMULZ3yZQHndDwbVhbBU2UcLyL4gaEcszIYQJu2feCcwbdi
         a5dFfFJUWHzHTPm3H52sFiHX5XQZZFdc8LHeAhVz6q9rNLfhuDqySmmqKdTFoUvNdvxO
         Rm8Qol9bav/2R9dnu+OJJGBl5aQa/r0stT6Xs9rz1a08D9bVV5GvT3EjnxVQssTj1oNc
         djacWTa5VyJJjDYGFtSs+o2J59vrFvtlXpnR+/XoVZ20ebmSbkAnKqNBSjqOEUzoaMNN
         xtvw==
X-Gm-Message-State: AOJu0YzTvlXrxZo4QaRwISkOZL59HD/VzgngmnqvpcN75Qgv/R6BiOhE
	pLuQ272FtKq6rEP8QTNP9nHO4jX3X6Yi6xw6dmzdaCJbKIOiI0TDvgQd4/AbQgjY5lD6SwIOjhB
	6RUrxO3B31dZ9sXCh6AW8xgDLMTo=
X-Google-Smtp-Source: AGHT+IFjH+4rVt4dzmiczKTk2+rJF1kavUQwgFnuhpAB7Y6nx+S1JDp6INqhC9gC9apJsXC/oa/SXU1joOz+k645Ukw=
X-Received: by 2002:a05:6a00:14d2:b0:71e:5573:8dcd with SMTP id
 d2e1a72fcca58-71e55738e5emr17855938b3a.2.1729026560187; Tue, 15 Oct 2024
 14:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1728912923.git.bruce.ashfield@gmail.com>
 <88eada332f5d3d00baf9f2cedf63460d80356032.1728912923.git.bruce.ashfield@gmail.com>
 <453e16e5f843492aa7aac45e0311046729e4155b.camel@linuxfoundation.org>
 <CADkTA4MGh=XDy+gCx7wYd-AvLCGweMFLTR_4hHQZ+tT36xUsDg@mail.gmail.com> <884bed91ca885d594970e2141a56576363436143.camel@linuxfoundation.org>
In-Reply-To: <884bed91ca885d594970e2141a56576363436143.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 15 Oct 2024 17:09:08 -0400
Message-ID: <CADkTA4Mkvq-NA5F2v+VuRp2v9wnepC-xKWa5byViBjaf8OxvcQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] linux-yocto-dev: conditionally add coreutils to depends
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 21:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205949

On Tue, Oct 15, 2024 at 5:01=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2024-10-15 at 16:56 -0400, Bruce Ashfield wrote:
> > On Tue, Oct 15, 2024 at 10:15=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Mon, 2024-10-14 at 09:45 -0400, bruce.ashfield@gmail.com wrote:
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >
> > > > 6.11+ uses truncate as part of the build. While truncate has been
> > > > added to HOSTTOOLS in oe-core master, it still is possible to
> > > > build a kernel recipe newer than 6.11+ on a release that doesn't
> > > > have the HOSTTOOLS tweak.
> > > >
> > > > We can test for truncate and condtionally add the dependency.
> > > >
> > > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > ---
> > > >  meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/re=
cipes-kernel/linux/linux-yocto-dev.bb
> > > > index 292897ce43..752d108bd8 100644
> > > > --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > > > +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > > > @@ -44,6 +44,10 @@ PACKAGECONFIG[dt-validation] =3D ",,python3-dtsc=
hema-native"
> > > >  # we need the wrappers if validation isn't in the packageconfig
> > > >  DEPENDS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'dt-validation=
', '', 'python3-dtschema-wrapper-native', d)}"
> > > >
> > > > +# 6.11+ uses truncate in the build, so we need to either have it i=
n host tools, or
> > > > +# build it ourselves
> > > > +DEPENDS +=3D "${@bb.utils.contains('HOSTTOOLS', 'truncate', '', 'c=
oreutils-native', d)}"
> > > > +
> > > >  COMPATIBLE_MACHINE =3D "^(qemuarmv5|qemuarm|qemuarm64|qemux86|qemu=
ppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64|qemuloongarch64)=
$"
> > > >
> > > >  KERNEL_DEVICETREE:qemuarmv5 =3D "arm/versatile-pb.dtb"
> > >
> > > This is for master so truncate should always be in HOSTTOOLS? I don't
> > > understand why we need this there?
> >
> > It came out of a discussion to do a reference for people that are build=
ing
> > newer kernels on older releases (of which there seem to be quite a few)=
.
> >
> > So either we'd have to bacckport the hosttools addition (which is likel=
y
> > possible), or I could throw together that reference of how you'd build =
it
> > conditionally.
>
> I think the addition was backported for scarthgap so we're good there.
> The main question would be around kirkstone where this commit could be
> more appropriate if someone were building 6.11+.
>
> I'm find with having this patch around as a proof of concept but I
> don't think it should go into master...

No objections on my part. I had told Quentin that I'd eventually send
out my local workaround for it, which I've done now. If there is somewhere
else we can put it, I'm all ears for that as well.

No matter what, I'll keep it around locally, so I can send it to anyone tha=
t
might need it (and then eventually remove it once anything that might
need such support is old and not supported).

Bruce

>
> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

