Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B76106FD72
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 03:54:10 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8232.1773374045076647807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 20:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FZGrKiOR;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: alistair23@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64c9a398bc7so2010662d50.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 20:54:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773374044; cv=none;
        d=google.com; s=arc-20240605;
        b=WT3ygfqbdDQ4V9jPFuYe9uqVzqAGy9oueJq3m5KCdE6NTP4O+pqEHKhfvYrGtmkWFE
         BtGhR6s47mxKyytaVo2+5yeLHmGnaWXlKOzg9kDP0aar6nMpqsXHZ0QYmfOFchPhdMgp
         gHzBp9Wn+fvQycVjdvyITTl+O64LjXU9OAuEjk2vpg8gxa7AH0DQfC2QqE4U3MAhVNMW
         ELzxUWNp3y8hpZAqYETnNP3PHtbohIi9DssLjVwri76hRauemANmMWyeKHUBd0yb44xt
         ctMUqWamUMcmQOa9OzdsJttXFWDy0MM1DwenGsBNRy18jPgMTM5ZJJps9m8Qc7bC9qL3
         uQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rgXSP8nyU10kU/MIC/689maP4sMEC5qPiEQXowN0a3U=;
        fh=HSdUEHf5G2S/k8cm9P+GEYOlZVa2Yren2HZEua27aIY=;
        b=SGaUK6q5zpRc/Aoc7njj8cXf0k/BC0MRbcSF6Y6EZSV2UIzbkzwUyqdzOTlOSnjZk7
         LxUVVWBtEa/ApHuAthLPrlxGN9B+rHOsybF+24P0h0/rHpnDfMHtB17Mj45Z4+eBNe8E
         tGMxRE+TDRl/L6UErPDIet0iD8DDaQh+kqiPxSzdwnWBJ5d4OK2Nk+HiHTzpd8ckZFrK
         sNAtXO/EPbTi34UXg6FnN7a3BSszFGQ8A4/Ox2CfVsnraUPnsDfNGHzRsG+fZdGDgjnn
         wXB2y7eXlafg2znSDzt3YXL1UQ1U/0yVfoJ2cjcbEENmJrIkDbhIMFkfLae7pxlv/o4z
         118Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773374044; x=1773978844; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgXSP8nyU10kU/MIC/689maP4sMEC5qPiEQXowN0a3U=;
        b=FZGrKiORK6YPzFqVQ9iHLKBifL4xIsncBGWhwV+OE+/3qsTdzMj+02+3e/R76taxWZ
         oHV4xWDTWBonERadVyjgoBYMtVccFzYyL1phk+ugsRZxTFbh0+LyEPeSDcR/DFPNkL4o
         77gNAR6cKS8kvXfLMymCt2m6ioEQ3KjMjdhkC8CedBybwpeqa/hzXmPgWm+0tlz8AMfH
         GupVGywBr2TfTSJMLWsObcFjsE9ADqIuljm6y9zwHRzbrfdQhjeik+1R+CZvwarBlPuG
         AeL8lki1Enf4lUdnqu+hBK9x1EehFQmHZOnjldgEJTycfQ8Syz6ofbRaZzwkNPQA0mEo
         NsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773374044; x=1773978844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rgXSP8nyU10kU/MIC/689maP4sMEC5qPiEQXowN0a3U=;
        b=L9PMD0/hJW3gzXiPLP+EkjVnwpUYGnPRi2h8DqLcabkJWP+yaWY8ECGZ6Vhd1697CI
         VtuIurKcuYMYPev6MRnaDkoQp4iujgCamERJRG9LEtMP9PkVrSf3YQweOrzF+5Zjp5oh
         vXs1pJjTOfRiugZxBCgdiUbjSLIa4JZQ4XuxqZffImdeUoeXs6Z8kuwj8lEFaDhrpVEc
         AWk+Rwv40hwfjCLIOBjiY1avPgkoPYrfGErbkDlhmElHM1DPXWgsEJuPZ54s//3huw5t
         h+Iwb0HcmgH8FU599XX6PSEt4ID5EzHFIVBJBb6cGIJdygHeHmCFHTXGnYFwM3TVM7fr
         NS2w==
X-Forwarded-Encrypted: i=1; AJvYcCUR5ATgCGAEh8t+EWjRHSlRiwABFxPMiCORDb3vZVVVEEcGPkmKU2ENLqIMAwv0m8kNuUmR0Y9RDzisa8lPHfEB3A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyd5TUn1ROp0o6LLp2De6KN02Hque12TYbdjvrRfl/20z0dw10/
	QkD3F3gcbbWDGH+ecTPS8OU9j1vJ3224EKM0yOxWcpfFMbts6RYNbfBueix6paoNAFjgAVgZ4Hd
	2xLwJmVWe3Rdt1ztt7Vt8VyVtsBRDdFg=
X-Gm-Gg: ATEYQzxvXGaU86z6lFJFuw6J5MnZguasmctFfzVblJT0wTO60z/OCvuujPyMUYZjTzW
	PGmuX3v3j8PlPlSqV9FGwlOGb7nMGQtZ+9FxeXOptTcwnWlN6Skbiq3A7RNQf/NpSWXEAkl5kbh
	kxoX+BCeXjDEog0BwIJ2lXg4C8VPr4Y08tk4Uv68hk69QuT0I6QzFWg8+7nh/e7WOIf3h9AesUA
	pujexvu+LmBZ+BtEeChJkNuxumNrMrZV9gSP+lsc8w1iTy6jR00NIOuMZTj6t/yXE/X/xGK/xYC
	/Pxj1+hLpBc/hdfEjOUpZaMnPp3dGHe6ZAOZ1HiRS27tgtIw
X-Received: by 2002:a05:690e:1658:b0:64a:df97:e075 with SMTP id
 956f58d0204a3-64e62f82278mr1590500d50.33.1773374044175; Thu, 12 Mar 2026
 20:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260305053505.1632077-1-alistair.francis@wdc.com>
 <CANNYZj9FNw4F0228tOo_BJUzrkvWFy-_5pLDv7XG=J-Z3FWP0A@mail.gmail.com>
 <CAKmqyKP7+qWZfEsg1R8geLVeOoime8w0wAOf5kK2qp12PDZ+bw@mail.gmail.com> <24cfe9bc-6bb7-484e-981d-464f059c6011@windriver.com>
In-Reply-To: <24cfe9bc-6bb7-484e-981d-464f059c6011@windriver.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Mar 2026 13:53:35 +1000
X-Gm-Features: AaiRm50zs0Z-gFcu4pOyyii59sqpiLYKrHT2rleG-9MGAOPD9DGgwAuVKhvrfys
Message-ID: <CAKmqyKOE218MkSbGyVPHxmi-h6u9n=V+QD0-hMUYGMSXRZ=biA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] machine/qemux86-64: Recommend extra kernel modules
To: ChenQi <Qi.Chen@windriver.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 03:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233021

On Fri, Mar 13, 2026 at 1:27=E2=80=AFPM ChenQi <Qi.Chen@windriver.com> wrot=
e:
>
> IMHO, if you install all kernel modules for machines such as qemux86-64,
> which are used by a lot of people including layer maintainers to do
> basic testing, then the problem of recipes lacking dependencies on some
> specific kernel modules will be covered up.

Fair.

What about adding `MACHINE_EXTRA_RRECOMMENDS +=3D " kernel-modules"` if
devtool kernel is used instead? Is that something we could do?

Alistair

>
> Ideally, if recipeA needs some kernel module at runtime, it should list
> it in its RDEPENDS.
>
> Regards,
> Qi
>
>
> On 3/13/26 08:05, Alistair Francis via lists.openembedded.org wrote:
> > On Thu, Mar 12, 2026 at 9:22=E2=80=AFPM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> >> On Thu, 5 Mar 2026 at 06:35, Alistair Francis via
> >> lists.openembedded.org <alistair23=3Dgmail.com@lists.openembedded.org>
> >> wrote:
> >>> When bulding Linux with kernel modules by default they aren't include=
d
> >>> in the qemux86-64 machine. Let's ensure that they are included by
> >>> setting the MACHINE_EXTRA_RRECOMMENDS to include " ernel-modules".
> >>>
> >>> This is already done for the qemuppc64, qemuloongarch and qemuriscv
> >>> machines.
> >>> -MACHINE_EXTRA_RRECOMMENDS =3D "kernel-module-snd-ens1370 kernel-modu=
le-snd-rawmidi"
> >>> +MACHINE_EXTRA_RRECOMMENDS +=3D " kernel-modules"
> >>> +MACHINE_EXTRA_RRECOMMENDS +=3D " kernel-module-snd-ens1370 kernel-mo=
dule-snd-rawmidi"
> >> The consensus in the patch review meeting was that BSPs forcing *all*
> >> of the kernel modules into images is actually an anti-pattern that
> >> should be avoided. It should only list specific, known to be useful
> > This is very confusing to users though.
> >
> > If I use menuconfig to enable a kernel module
> >
> > ```shell
> > MACHINE=3Dqemux86-64 bitbake virtual/kernel -c do_menuconfig
> > ```
> >
> > then I expect that module to be installed, but currently it's not. So
> > even with a module enabled it's not being installed, which is very
> > confusing and difficult for people to debug.
> >
> > Alistair
> >
> >> items, similar to how linux-firmware or python modules are packaged
> >> and installed. This has unfortunately gotten into qemuriscv
> >> definitions, but the correct approach would be to replace that with
> >> specific module lists, e.g. by replicating autobuilder tests for that
> >> target:
> >>
> >> https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json
> >>
> >> Alex
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#233015): https://lists.openembedded.org/g/openembe=
dded-core/message/233015
> >> Mute This Topic: https://lists.openembedded.org/mt/118147967/7304865
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[Qi.Chen@eng.windriver.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

