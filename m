Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5847CC4828F
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 14:50:02 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.17264.1706798997558511002
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 06:49:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NCd8BDM2;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5ce942efda5so806255a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 06:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706798997; x=1707403797; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=budPT4P62hLF+PjALCbRUp5as7AgtVJ54RTg5zBkb2I=;
        b=NCd8BDM2y2nEay3LeuvgAt8Qxu6Zvv/LWgrZ73rMm81C9YRRY99B3+mTrmmLEeXeoX
         gVJvtBiHzTKg5ZkwQbGS2nr5/FBt8XmKr6MCYlu38DldiktFgMUU460SLflsB1C+VTNa
         Bp1oUu1jU9GsgAvEqpEXOy6Fr67C1tmOzQOdzEw4NCp9MYWCTcQG2Ve+U9BeC+9TaQcF
         DiWEcTw10wwLBiQUaRnW/r3guDSeDse9FxSmd083z0wh9DDs+/daCV4DTay9fuVpMzIU
         T/rVcEcJsJWbB+HJ1ZRWp7vVqIUYdWeeCFHpAWx9B2NdgNyZ4ufZS8IIhuL/GZ7Y9djv
         r6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706798997; x=1707403797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=budPT4P62hLF+PjALCbRUp5as7AgtVJ54RTg5zBkb2I=;
        b=BkePfyrVgQLX0mx7KPkYDkDj7C04ZeudgXFpLDXFePSbPDObkMJkS2q31LuyFZrfaL
         q+r+PUMdcnxhGiSnNdPRqxtDbCIR45lP+i6wffUpSyWDd1yviwLR5qzvnIe+zYocm7AU
         tbc1g9G4U4Tmxe4qTPymhutWvb+wpunyj+Gvc+f9zZMxTP3KZSq7FqArm7UK2PxkS+cs
         s+R+zvX4OZGtu5DEAO7fRK0F5S31c9TqWF/uceyEsDS4EFE5LENmCw08yN8PRrieD9m1
         extoBL/t5Palr4Lb8bnhlPHje/27wu9K2feOGlKn+HrOsoLFAF+xJAh9lmXzPy1PssSv
         rjiw==
X-Gm-Message-State: AOJu0YxgWatYP4/6v7S5dBLHGMQ+FWTaJ9B/2xIjerjfRztWlTRUcGtj
	NgvOBmaICQKc9q9r+DFnkK1m44fsc6m9AvJCeJ4unQ0swT19g4GUYJGSP/ayA0NNeeKWWCPzKgN
	H57PwaYb1+dok/iECbt2cIcqK/C4=
X-Google-Smtp-Source: AGHT+IFNsDs58sIKv86tvxtPICyzB0MiwbGF7VrJ+up8aguUXkoPQ6ShAB+4vzFp5olh9rn1/iT80sUbd1j9K9uuKOA=
X-Received: by 2002:a05:6a20:2a0f:b0:19e:30b0:6ad4 with SMTP id
 e15-20020a056a202a0f00b0019e30b06ad4mr2389564pzh.55.1706798996627; Thu, 01
 Feb 2024 06:49:56 -0800 (PST)
MIME-Version: 1.0
References: <20240201142531.765590-1-claus.stovgaard@gmail.com>
In-Reply-To: <20240201142531.765590-1-claus.stovgaard@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 1 Feb 2024 09:49:45 -0500
Message-ID: <CADkTA4P2D7JQcfUp_s=Bp3R4N0sC_LL3hJTYDwNscwM-4KFNAQ@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH] kernel-devsrc: fix RDEPENDS for make
To: Claus Stovgaard <claus.stovgaard@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 14:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194592

Thanks for the quick turnaround.

This looks good to me.

Bruce

On Thu, Feb 1, 2024 at 9:26=E2=80=AFAM Claus Stovgaard
<claus.stovgaard@gmail.com> wrote:
>
> Since kernel version 6.6 the debian package rules has been split up into
> a separate rules file, resulting in a runtime requirement for make.
> See scripts/package/debian/rules
>
> Remove the rules file, for not RDEPENDS on make for something we are
> not using for building modules.
>
> For reproducing the issue on a normal qemux86-64 machine, change to the
> linux-yocto-dev kernel, add the kernel-devsrc to the toolchain target
> task and disable ptest in distro features. (Notice ptest adds make as
> RDEPENDS for other packages hiding the issue)
>
> when populating sdk you will see dnf failing.
>
>  Problem: conflicting requests
>   - nothing provides /usr/bin/make needed by kernel-devsrc-1.0-r0.qemux86=
_64 from oe-repo
>
> Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-ke=
rnel/linux/kernel-devsrc.bb
> index ce5777fbe9..4ff751d9f0 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -148,6 +148,10 @@ do_install() {
>         # for v6.1+ (otherwise we are missing multiple default targets)
>         cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
>
> +       # For v6.6+ the debian packing is moved out to seperate rules fil=
e
> +       # Remove as we else would ned to RDEPEND on make
> +       rm $kerneldir/build/scripts/package/debian/rules 2>/dev/null || :
> +
>         # if our build dir had objtool, it will also be rebuilt on target=
, so
>         # we copy what is required for that build
>         if [ -f ${B}/tools/objtool/objtool ]; then
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194590): https://lists.openembedded.org/g/openembedde=
d-core/message/194590
> Mute This Topic: https://lists.openembedded.org/mt/104098238/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

