Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67104C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 18:20:35 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.1191.1745518829508641225
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 11:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T+3CDpSr;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3fa6c54cc1aso988433b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 11:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745518829; x=1746123629; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAgKA/6vM5hiBX5KW3Lzmjj97ExA6rmKi3mkyeZ6XXo=;
        b=T+3CDpSrs31tOfYOdaq7z9NHLYNJlhGjqJDwuBze9dm9Wll6KKixZzpN4wGF2pulk3
         74cOffA3nEs6urjydHKL/jy4402e3sIrykXuscHoHUbbFoBJQogrTcnQ5wEv7fJUlMyc
         6TDhNffsiNJ6CLSrFFB8KQjAlJgw00A41htyp34Ke9hMz6QcinOT/E/KdjWzn8hAqpJv
         wC4gCA1BukOGmChlC2MMiYxiKpC0oSDrWj1adehi9T2Ez598JbBEwk4sfM5Off2sunKn
         4qQZ6PLxILKVfIHq/g+MT8gHYAXpuA1D6V0ZN/LSQL999SNqIXQRQCXyvm+YDmSjMwKa
         n3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745518829; x=1746123629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAgKA/6vM5hiBX5KW3Lzmjj97ExA6rmKi3mkyeZ6XXo=;
        b=oco0YlQZSoQn5etVpCHeDGcb7sDnXuZgbPIO+CGRwvpk7whZTLfeU4/w9knB8n2jFx
         6PbB8hfWpnIkU8pWZAAbO63dZRKhQyHCE6K7AeO8wd3zV9RoYmeH4xebkyg5ka9eE7Bn
         ulQagfogHuo3pgBtgD+HlF/6UsR4y2PC6Ju2ftiiOtLbnZFUkljO/qnE4kqfmKoVjtq5
         OzKIv2P3sxdrzOKAs6BytAS1O0UJFTLvn2bD2u+dC2Qia/DwbJceXQXygnQsfhjITtOQ
         Lq/02P15Mk8CRCpVxFl9Zm52jg/zwSdpIGQmabDllvXyFHjmXmrKoBauKbB1zZC+hI96
         Ywhw==
X-Gm-Message-State: AOJu0Yy0+hEEvwCn4Op9eMZClgkgTQEIeKnq0e+ZR11v6kFTUrUOxq2N
	cvWKZ2MaFPhtMxCfGov1ht4RCc08DJcbVLKuJ+lc+N1Zcd6SPmr/OQK1gRD+JyF8XXEX2gmduEA
	gPF6Y4Y+RceunpqJu2PuyHqZDCYJiAPPU
X-Gm-Gg: ASbGnctR8kgvM8CkMbBcQ5YCfnbAF+b9V2gDN7bG9ptvNYJVA+o1bWw/UsuQjYCaXke
	L/8JTQV+fLHZG9p4seMs4q0DeleL6SnpKq/UljqUHM/G7s2l5jYRMIg562zCIBTE4OoP9e9bz+T
	Z7v2TbirrSCsFGLN7XVZ6yPw==
X-Google-Smtp-Source: AGHT+IHTn1gAriSCxj9N0tsimVP+zkurypfLzXmh20/4RiB2tM7sm6nNb+Axfy0kiXtmVLfoWU5t0fv5mwdfJLIRzfU=
X-Received: by 2002:a05:6808:6f8a:b0:3fe:b0ad:f92a with SMTP id
 5614622812f47-401eb2392camr2165001b6e.6.1745518828769; Thu, 24 Apr 2025
 11:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
 <20250424-clang-merge-v1-8-5a492a8461aa@gmail.com> <e3ngs7lqtrkdlgzps6yqyxdefsqhkwngnvdpebqbiocdwu6wy4@7oakys5aa3ov>
In-Reply-To: <e3ngs7lqtrkdlgzps6yqyxdefsqhkwngnvdpebqbiocdwu6wy4@7oakys5aa3ov>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Apr 2025 11:20:02 -0700
X-Gm-Features: ATxdqUEuLurPlvrlJ5f4dj6veIFzeFxJ5928PlU3krHUSO8O7X0-oyOujBCyK_0
Message-ID: <CAMKF1srPcSzusprOGUhZLDc9sdR1txeSeyp2NkAanaKjJD1J1A@mail.gmail.com>
Subject: Re: [PATCH 08/11] clang: multilib-header fix for llvm-config.h
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org, 
	Liu Yiding <liuyd.fnst@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 18:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215398

On Thu, Apr 24, 2025 at 2:06=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Apr 24, 2025 at 12:20:42AM -0700, Khem Raj wrote:
> > From: Liu Yiding <liuyd.fnst@fujitsu.com>
> >
> > fix the issue that:
> > | file /usr/include/llvm/Config/llvm-config.h conflicts between attempt=
ed installs of lib32-llvm-dev-20.1.2-r0.core2_32 and llvm-dev-20.1.2-r0.cor=
e2_64
> >
> > reproduce steps:
> > 1. Add in local.conf the following lines:
> >
> >   MACHINE ?=3D "qemux86-64"
> >
> >   require conf/multilib.conf
> >
> >   MULTILIBS ?=3D "multilib:lib32"
> >
> >   DEFAULTTUNE:virtclass-multilib-lib32 ?=3D "core2-32"
> >
> > 2. add lib32-llvm-dev llvm-dev to core-image-minimal.bb
> >
> >   IMAGE_INSTALL =3D "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL}=
 lib32-llvm-dev llvm-dev"
> >
> > 3. $ bitbake core-image-minimal
> >
> > Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/clang/clang_git.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
>
> Can be squashed into the previous patch. There is little point in adding
> a commit with known issues.
>

seem fine. I wanted to credit the authors thats why I kept it separate
but I have squashed that for v2 with SOBs added

>
> --
> With best wishes
> Dmitry

