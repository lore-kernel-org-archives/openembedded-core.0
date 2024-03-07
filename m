Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA186C54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 15:50:40 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.26679.1709826636235849497
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 07:50:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l1dRHwiw;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6e4f1660493so495223a34.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 07:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709826635; x=1710431435; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlFuqVKEbJlqGw5z66WdSGheUhmvPl/VqLoeBNK7G9U=;
        b=l1dRHwiwM3mpybe6shTh9uoZvRueh++d9cjTOiEi/mttTtxiAE2Z8eDWlYa2B4Sr+x
         +O2RJqw5XbpZZTlPuhZ7TyeyHNmiakWm/7MSu4+VKqz/z4rwhbp4kVXnFUpdZWPa+2Wv
         731yogt1AvguPY08sTOx06+Ue64AI1MO778mI84caTdvV6bhXwLrLCIkwTutkW8OheqY
         p36gcrCeB02vNCa8idMAB3ESGvBiC3PNeFvTwsF/0OdhYRRqVMoghRYpCjMEBQNboOjm
         e0oF6+eE7FHX/3s53Grebv1Zk0oYgcI0d2l2moKDhLqJcOZC5+Jn3tfVwdSCqNgIaxtB
         38lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709826635; x=1710431435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlFuqVKEbJlqGw5z66WdSGheUhmvPl/VqLoeBNK7G9U=;
        b=iGrZPWite/yYYnqp8oU61p+Ho+eueE3gsONK6yT0zBef4nzemZOTyPMtyuWsXO67rf
         GL6Y2hoZfNJolM7uiCwDmibK+pvURmIoN/9fm9cUvQ8ikLQpCRRLsiuwaVhhgaEN2m/Y
         ihbQ52lo+r7ZuoX9+ngW4B9402GT6LdG7CXkYVyWSKNyYiG7eO5aBzxZ/5LlagvaPkyI
         ZvxcWR3P1X5JAaiZwwOwD752cm95dCSoeiwD3IxrWD2Uu6cONe1qbGOV3Klaf4BaC1tv
         op3zoDewh4MnpmJHSgueogDRGmTrsPmrcWDpMrT3TEP0hJ1EIfNRJtYexoQxpQ09ZcrG
         ontw==
X-Gm-Message-State: AOJu0YwyerAH+pSc59pEm+r3Z7WYkPJcp3p94ygEIYF4mBDLm62cG4R+
	VjSmkTcyppP8800vpSKMi2M0uk4QvtP9Vh6OPmouGg8aNFUSOjwGl+OwXhGLVjkVoaTir8A8UCn
	Cu/NTBOZSOMjgunZ20exho96hKRc=
X-Google-Smtp-Source: AGHT+IGPo6mWPvYKpPwDpEht4Iol45Rm9bBVPJmnno/hCOKItp62aItGdqO7K6ikwspYqJavjvhyXbkUKbDmum+snfg=
X-Received: by 2002:a05:6870:82a9:b0:220:de23:85f7 with SMTP id
 q41-20020a05687082a900b00220de2385f7mr189822oae.48.1709826635373; Thu, 07 Mar
 2024 07:50:35 -0800 (PST)
MIME-Version: 1.0
References: <20240306162341.2267587-1-richard.purdie@linuxfoundation.org>
 <20240306162341.2267587-7-richard.purdie@linuxfoundation.org>
 <CAMKF1sr84E-VvgKDMor9Bx_7BtZtQ1VwSCi_4R4Qi=S0+b6MdA@mail.gmail.com> <3cd28383d48955c12056aa09216cb20f920fda6a.camel@linuxfoundation.org>
In-Reply-To: <3cd28383d48955c12056aa09216cb20f920fda6a.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Mar 2024 07:50:08 -0800
Message-ID: <CAMKF1so5-zURTciJXncPn8TCE-3LCwFjswfN8=0QNM-WzwojsA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/9] oeqa/runtime/login: Exclude qemuriscv64
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	=?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?= <pidge@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 15:50:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196802

On Wed, Mar 6, 2024 at 2:34=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2024-03-06 at 10:52 -0800, Khem Raj wrote:
> > On Wed, Mar 6, 2024 at 8:23=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > From: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibre.com=
>
> > >
> > > Excluding riscv64 due to mouse rather than a touchscreen which adds a
> > > moving cursor, so the diff ends up > 0. Need to fix the image to use =
the
> > > touchscreen rather than mouse input.
> >
> > Is it an option we are using to start the qemu which is causing this is=
sue?
> > I would like to understand more
>
> I suspect it will be. Somewhere on the other platforms we use a usb
> touch input device (absolute coords) but I think for riscv64 it is
> using a mouse (relative coords).
>
> We just need to compare the usb devices and work out what is missing...
>

We use -device usb-tablet -device usb-kbd for qemuarm64 and for qemuriscv64
-device virtio-tablet-pci -device virtio-keyboard-pci is used. I think
that might be
the difference. I will test a change to use usb-tablet and usb-kbd, I
have a local
patch for kernel-cache and then these options work for qemuriscv64 as well
sadly the events are received by qemu but clicks do not work for qemuriscv3=
2
somehow, I will make the changes for qemuriscv64 atleast and leave rv32 as =
it
is.

> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196757): https://lists.openembedded.org/g/openembedde=
d-core/message/196757

> Mute This Topic: https://lists.openembedded.org/mt/104768948/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

