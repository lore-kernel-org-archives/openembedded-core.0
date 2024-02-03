Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E1BC4828F
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 08:48:50 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.13819.1706950122798061756
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 00:48:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UOUegCLj;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-210dec2442eso1746687fac.2
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 00:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706950122; x=1707554922; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csuH3Kk0KaxaWy6K7dNVMP/qyxoGTf/F/w7rOCz5swM=;
        b=UOUegCLjM5t8l98wmeEAoGvn1hcEfbRpmYiVuCnICKdFOO0FlteC5zI8XyAr9S63eS
         m6EPxG8BiPzYNVXR7zCSa/5rdWGZwrK2dTPAipPIdbpdTa8Ep8GcE7MsQRR1xyxdSTlJ
         psV1K1Ti7wlZwMhpSYzyE9dDqoN0Mgwn7tU8Oq8yakne7GZX89Wjw2FdsvS2zHq2Lw5R
         2oWNyt8tngpYIl30+18OUdMjwrfONM0ym+ytHTGCNuU/1icp1jCAKQKWV+gpclKXy3CU
         SlZ5q0lNfZYR34WHvPnlJFp1c6OVCCtxdfATUXyupbuEDJ7eatUYBC+MiOx5cSQjJ3w1
         prDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706950122; x=1707554922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csuH3Kk0KaxaWy6K7dNVMP/qyxoGTf/F/w7rOCz5swM=;
        b=ulQpuetulvrCeN5gbg27NaT+hFWNxxX7SGKy30a4TBIDxSW1GNXwgej4zCbkj9vESD
         sBhG3KOxK/4KQ/+Ghaq+zfe0OadYuxLAiyKcNCvbPx21MACdJOGko+CAs7RV6s7nWtcs
         q+1drQPz8yHXHIrW/3y4KBxyBngV+Q/RL3nmDyA0n2sBmRX7YHcteHZwR/LR9KoxEoDI
         6Qm1dsYvMjxDEpA4oePsqwqH0OxbI4sThP4LA227enno2F7gFVJU6rg6BtQ9T2IeWbK6
         ubq8QfzSMORWFq31RdR46X3K3Drqz65dIqRgzh2aTwr6RUmgEHCe1/rkh5t8d5VB9n6n
         7EVQ==
X-Gm-Message-State: AOJu0YwiBL+PyIkEfkMXY1F0z5DNn1R/RobMYO9Yo1sTQMDE/5fdC3En
	HXxuDHKgMZdZGYz3QpTDOl2yaM47QZkzV3SbQC7au8y2khrdn+2wiogmvTQ/SPEwksOY+Pk3ZJ6
	f6oo8imii2C6rmRRMy/Zsytd0uMk=
X-Google-Smtp-Source: AGHT+IG8/pFEfmMNGA16PXDl1oTK0/2pPpPac4bfZrpQRNuk9kYbvHTP+/BHfGOOLdm9MB0pnOnY/op/RXVCiSOfkc0=
X-Received: by 2002:a05:6870:2e03:b0:218:de4b:28ee with SMTP id
 oi3-20020a0568702e0300b00218de4b28eemr2313056oab.44.1706950121816; Sat, 03
 Feb 2024 00:48:41 -0800 (PST)
MIME-Version: 1.0
References: <20240201222401.565583-1-raj.khem@gmail.com> <e490accbe222726fba2d51fadb40040b0608a172.camel@linuxfoundation.org>
 <CAMKF1somo=Uma9ze-tiRw+iJkg6T0ikf3NDDyVvq4QtNEYjD3A@mail.gmail.com> <CAMKF1sp2k0qXzV9FQ8bU75XNRwuicxYtcJhTOj7tTOGej_SLtA@mail.gmail.com>
In-Reply-To: <CAMKF1sp2k0qXzV9FQ8bU75XNRwuicxYtcJhTOj7tTOGej_SLtA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Feb 2024 00:48:15 -0800
Message-ID: <CAMKF1spG=Ny4n8DCmZXhSUdEJRVKvuK9Np1dSiGZiH=sBVNpTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] glibc: Upgrade to 2.39
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 08:48:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194838

On Sat, Feb 3, 2024 at 12:31=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Sat, Feb 3, 2024 at 12:15=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > On Fri, Feb 2, 2024 at 11:54=E2=80=AFPM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Thu, 2024-02-01 at 14:24 -0800, Khem Raj wrote:
> > > > License-Update: Relicenses the IBM portions of resolv/base64.c and
> > > > resolv/res_debug.c to a new license that does not have use-limited
> > > > patent language [1]
> > > >
> > > > Upgrade localdef to get glibc 2.39 build fixes
> > > > Details of release [2]
> > > >
> > > > Add fix for mips clone3 crash
> > > >
> > > > [1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Dae49a7=
b29acc184b03c2a6bd6ac01b5e08efd54f
> > > > [2] https://sourceware.org/glibc/wiki/Release/2.39
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >
> > > I think we may still have an n32 mips failure:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/856=
2/steps/27/logs/stdio
> > >
> > > #   error "_TIME_BITS=3D64 is allowed only with _FILE_OFFSET_BITS=3D6=
4"
> > >
> > > although I haven't 100% confirmed it is this patch.
> >
> > most likely, I will take a look later.
>
> The issue seems to be that assimp is vendoring zlib 1.2.x and there is
> a fix to zlib for 64bit time_t [1] which is available in release 1.3.1
> onwards
> glibc headers have become more transparent which brings this issue to
> front. So a fix is to patch the copy of zlib in assimp with the below
> zlib patch
> or perhaps use some other application in this self test. We have
> deleted the assimp recipe already in YP 3.4 release onwards so maybe
> we should
> replace building it in self-test as well.
>
> [1] https://github.com/madler/zlib/commit/a566e156b3fa07b566ddbf6801b517a=
9dba04fa3

I also wonder why does it resort to build internal zlib copy when the
SDK has zlib so it might be
that zlib detection logic in assimp is failing which could be SDK
issue of not packaging needed bits
to detect it.

Perhaps pass -DASSIMP_BUILD_ZLIB=3DOFF to assimp cmake invocation in
test case and then it should fail
the build if it can not find zlib on system, then perhaps look into
why cmake is failing to detect zlib.

> >
> > >
> > > Cheers,
> > >
> > > Richard

