Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9221C36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 14:20:27 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.20427.1743517226913081678
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 07:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GY3r5Wlg;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3f6aa4b3a7fso1595511b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 07:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743517226; x=1744122026; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJOlgYzLvCTt11zXDE9YcgAauFFbBMn/DytYAOBe85M=;
        b=GY3r5Wlgy4cWwPpla/h8lGpJNyDTKryaGvcXrsS5QuPwO+VhPM+230vfDNSBr6dw1b
         vGN/QfqLf0PyvT3gyGR1GUzz1saoV98FOicNB7KOo+Dvx5gD0M7koGc2Tsn98CAEY4E8
         0xU+xn4lQzlxnWDhoD9uEztlbgrc9YUCOoEfNLFpfKBg3YkDa+reeU5DQmyF6pofm4OU
         /xbNa2YMWbmgS9uTue3RXetnl8+Gokj2KKd63rRx3bsq0WVqTq1pTTANc8zrl+M0uPl2
         iJsN/MkPS+3eu8xwhgbAHWsP6H/o9DdzXQfvyJaa0PTjWQj+gC5IHFgKPiUxHD5uEt1r
         NCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517226; x=1744122026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJOlgYzLvCTt11zXDE9YcgAauFFbBMn/DytYAOBe85M=;
        b=ZfEM/iVTrUa0bIZlP9qivLB+Tc75X572ua4OL6HYy/ukbPrH4lm4B7AD6JplcewoW+
         uU18C45pkuoGAK5FPOdTr0zs5qqcHK1D7+adtVW9Wyarzuvt9xcpxxqFzY982RTXrG6O
         gYVcecW6hmuB5YXvMh3OpxV324k0+2hyHSQJbOPWBusffPE0bml8zw07wWY17xUY3LA0
         Lz6A/cXdGsXHtJSmJStj7vR2ydaX2CQ5D8KwD+dgGtKqTupsWbQI202/AdFIIdKLkDaa
         9UheNvjlBdjj8kD197deqOCgedVnx6rybSsfai1wmA1CigKP/2C5JmyP1TggePn938H1
         oLzw==
X-Forwarded-Encrypted: i=1; AJvYcCUd+LkrMQloJh+pfk40ccklpn3FA+KRfxV8JCoEKbP885ReBONcOVwabg+NSXJ/DH7BsuedjkRsGEp2tli+SAGyyA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxyLT9V0hzK01EN767Zx050HhnuUOOOc5kix84MXblUUSzuktkb
	FD6YvrcQdESBxSqow8wwXN9gDxl763087cFJJjtGylhrXr0s491P++Lka16QwjQYLDP9Gt1C6gt
	wKnYM5NXfmEoJVnAWcnOy/G3ouKL+7T8p
X-Gm-Gg: ASbGncvXzeiLmMJbbZhUqiWIzqK/tzQunFo/HowIM452i88IHpvFFbO/1TWaY4m5zAZ
	HSQyGX6M8dS4FBo2pW3lZg68qsuDsUmCjh9b1sUL4qAy0RXDiHnrXWrrkvGYwa4XMitbrWjaKWa
	XcY0/18rFJ8+VRGAmK9oIGw8sOCwwcJEGk0+YN0KX9zb/Ci5VXrr0=
X-Google-Smtp-Source: AGHT+IFUMkp7hZy7pdH0zVXIH62KMqNdHz6ZwoTx18JmqA9Ak/CZQU3gUKk4GxugaAld1VWwkGODzjkoi92g2l6YEA0=
X-Received: by 2002:a05:6808:15a0:b0:3f8:a088:3e45 with SMTP id
 5614622812f47-3ff0f5cdee1mr6923018b6e.36.1743517226117; Tue, 01 Apr 2025
 07:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250331133044.1944108-1-richard.purdie@linuxfoundation.org>
 <CAMKF1sr8AqkmjQca6fYe90oOU3h=++A2=7RpaWkRFEuS38oyHg@mail.gmail.com>
 <9fe3cc25-c6fc-410a-b819-58e1e1db818e@windriver.com> <1831FE10390FE3BE.19875@lists.openembedded.org>
 <1832019BE8984F8C.2063@lists.openembedded.org> <0ffd9405cc6d36130436edcbffef826dc3f29b4b.camel@linuxfoundation.org>
In-Reply-To: <0ffd9405cc6d36130436edcbffef826dc3f29b4b.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Apr 2025 07:19:57 -0700
X-Gm-Features: AQ5f1JqJeM8JyWt1Fg1EidymDTtT0QxUscXGWFDoFv2LvDGBYbNaEatiPPCmk6s
Message-ID: <CAMKF1sqWHTPOvAo-CCF7=ByG5XgYFDAAZbFTiM6aDSdy-bZXPw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust-llvm: Compile llvm to use dynamic libraries
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Randy MacLeod <randy.macleod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, "Shinde, Yash" <yash.shinde@windriver.com>, 
	Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 14:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214136

On Tue, Apr 1, 2025 at 12:35=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2025-03-31 at 22:49 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Mon, 2025-03-31 at 21:44 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Mon, 2025-03-31 at 15:08 -0400, Randy MacLeod wrote:
> > > >
> > > > On 2025-03-31 12:13 p.m., Khem Raj via lists.openembedded.org
> > > > wrote:
> > > >
> > > > > On Mon, Mar 31, 2025 at 6:30=E2=80=AFAM Richard Purdie via
> > > > > lists.openembedded.org
> > > > > <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org>
> > > > > wrote:
> > > > > > Our main llvm recipe uses dynamic linking already but rust-
> > > > > > llvm
> > > > > > does not.
> > > > > >  Enabling this significanly reduces the size of llvm-rust to
> > > > > > about a third
> > > > > >  of what it was, which is a bettter configuration for us
> > > > > > leading to smaller
> > > > > >  TMPDIR and sstate objects
> > > > > >
> > > > >
> > > > >
> > > > >
> > > > >
> > > > > It will slow down the compiler execution and sometimes its
> > > > > could
> > > > > be significant as well we have seen this with clang so it would
> > > > > be good to have some idea around that least we provide a slow
> > > > > compiler compared to other distro infrastructures
> > > > >
> > > > >
> > > > >
> > > > >
> > > >
> > > > We'll get some performance info from the YP AB perf builds.
> > >
> > > https://valkyrie.yocto.io/pub/non-release/20250331-105/testresults/bu=
ildperf-debian11/perf-debian12-vk_master-next_20250331181527_9ba5b4f4e4.htm=
l
> > > https://valkyrie.yocto.io/pub/non-release/20250331-104/testresults/bu=
ildperf-alma8/perf-alma8-vk_master-next_20250331181513_9ba5b4f4e4.html
> > >
> > > The build time is fractionally faster (1%?) but hard to say within
> > > noise.
> > >
> > > The diskspace drop is convincing, 2.3GB less TMPDIR size (2.3%).
> > >
> > > The rm_work TMPDIR size also drops by 1GB (6%) which is
> > > particularly
> > > significant and nice to have.
> > >
> > > In builds with rust-llvm as well as rust-llvm-native, this will
> > > double up for a double win.
> >
> > The analysis is a bit flawed as it is contrasting master with master-
> > next which has 1.85 as well as other changes. We need to remove that
> > from the equation.
>
> There are a direct comparison with just the patch added:
>
> https://valkyrie.yocto.io/pub/non-release/20250331-129/testresults/buildp=
erf-debian11/perf-debian12-vk_master-next_20250331220727_26fa862acd.html
> https://valkyrie.yocto.io/pub/non-release/20250331-128/testresults/buildp=
erf-alma8/perf-alma8-vk_master-next_20250331220715_26fa862acd.html
>
> So the buildtime is around the same (or less with rm_work), it is hard
> to say from the daya. TMPDIR is 3.6GB less and 1GB less with rm_work so
> definitely improved.
>
> Enough of an improvement in space usage I think this is worthwhile. In
> general space usage does correlate with build speed.
>

Thanks for sharing these numbers, I am ok to apply this as well.

> Cheers,
>
> Richard

