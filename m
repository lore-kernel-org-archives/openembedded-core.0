Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D705CC3DA6E
	for <webhook@archiver.kernel.org>; Sat, 23 Dec 2023 22:13:53 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.15690.1703369624350807900
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Dec 2023 14:13:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AZtw2LJu;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e6ee5b7ffso1156935e87.3
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Dec 2023 14:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703369622; x=1703974422; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNSI0C7bGJtbh+K3eJUGSPvDKJlRIoZ1EfT9prrtDyE=;
        b=AZtw2LJu86CdlKrm3OsZ8l1nLtkBXIFV1j2exqZwts45xciUoGPTpa4txv0D8Lr1tw
         ZfqpMLfr3XiBmuU0Zwv+D1DCqKofZl+QMLDo+nCoAWM2ktKLZ9wylyN/B2bGtykERzgz
         TuNIAa0Dtu76ggmmCDwzHAQ6ZtkqZBOztbB5qzEEvmko6s+Qxl3FQVnuX6JkOTLRB8ie
         QI4hLYc8B2nFP9w7mwf6X4XV+IBatqr7RhIsLszUG+DBs0LLEBjiUYOMYR7MNlPy8m80
         nzBavAMY/NbPP6/x4qb0kiYLmggpN5AzgcC3Mqh/cZd0E48tJp8FUwqqYyPCJBbfq8sX
         TxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703369622; x=1703974422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNSI0C7bGJtbh+K3eJUGSPvDKJlRIoZ1EfT9prrtDyE=;
        b=maGO0RoCcdStqlYnmvIDzOVff/mrZ8RoccsxlhYPkguX1ZxEwYxgtyREHj/Pl2OV6w
         RaRYzWRIkEv2SWw22HwF8JnpPutKp3+8e6ZNVlHmrySjtw6ybYA+ShnzQImDkR+lmljq
         fOam99oap7rxSiHJUOs4qConZ1Vf0iBecwBPLxiHgQ2+EzCyS6+qcl+AIeZ51ywnh7aN
         1aWTj8/biVc0rqrS7rTr5+vqmKtsk0oGpSeWz/fYAypvs8m9MAAE3Uclma6RSCtxCNgY
         5Yn44PJhGXfQYD0UY8C3OT3nBoQuv3CZ9wIVLSB7XdPLX5O7B2IKQ7js0stH0W6g+mHM
         d1Rg==
X-Gm-Message-State: AOJu0Yyjn88G917Q+gwaHQqC4NZ06SOxpWvUw6i4aj80Z38Mx1bB4BHV
	ckWl4DmHTfhDJnpNMXPSPrbtlz7Uw1jeqkHkd+4=
X-Google-Smtp-Source: AGHT+IGQVOJa8i8qp+vBd4MApAYJ9MHR1b/cwisLA7rqSjZiqnzDGkqtRXYjoSk5lo4z3IrArMJgEybhFcUPCEtr7zM=
X-Received: by 2002:ac2:5e33:0:b0:50e:6b48:5407 with SMTP id
 o19-20020ac25e33000000b0050e6b485407mr1220406lfg.82.1703369622195; Sat, 23
 Dec 2023 14:13:42 -0800 (PST)
MIME-Version: 1.0
References: <20231213094113.3981-1-alex.kiernan@gmail.com> <bdd89f1893f33e2d19db0367fb1544b36ee49cf9.camel@linuxfoundation.org>
 <E29D8825-5868-4FB2-A0ED-B01299BBBF4E@arm.com> <CAO5Uq5TZfbe5HaEuV69T94WC0F6gytTkp-RCpaTKwtO1SoHKrg@mail.gmail.com>
 <CAMKF1sqoiM_dTGO2_J7za+OnsCX4F7i=rzUBbnhZQ2rRBFYyKA@mail.gmail.com> <17A38CDC4B87CFC1.18542@lists.openembedded.org>
In-Reply-To: <17A38CDC4B87CFC1.18542@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 23 Dec 2023 22:13:30 +0000
Message-ID: <CAO5Uq5Tu4dgiYegPofh8n8KJozsjTFc6ipi4X74Rk15mxunG1g@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] rust: Upgrade 1.71.1 -> 1.74.1
To: alex.kiernan@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, Ross Burton <Ross.Burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Dec 2023 22:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192888

On Sat, Dec 23, 2023 at 7:32=E2=80=AFPM Alex Kiernan via
lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Fri, Dec 15, 2023 at 5:24=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > On Fri, Dec 15, 2023 at 4:41=E2=80=AFAM Alex Kiernan <alex.kiernan@gmai=
l.com> wrote:
> > >
> > > On Thu, Dec 14, 2023 at 10:28=E2=80=AFAM Ross Burton <Ross.Burton@arm=
.com> wrote:
> > > >
> > > > On 13 Dec 2023, at 14:06, Richard Purdie via lists.openembedded.org=
 <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > > > > I've run this with this patch included:
> > > > >
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/build=
s/4082
> > > >
> > > > Same failure:
> > > >
> > > > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-2023121=
3-s13b67oz/packages/diff-html/
> > > >
> > > > Ross
> > >
> > > Thanks both.
> > >
> > > It does look like its just filename churn, but I cannot find where
> > > those names actually get generated :| Suspect this will be a report
> > > upstream and hope someone helps.
> > >
> >
> > I think its the cmdline options passed to compiler-builtins crate. So
> > looking closely at this crates build log can reveal the problem. If
> > somewhere we have builds
> > done in two different folders I can take a look
> >
>
> I think you're right... I've been looking in completely the wrong place :=
|
>

I think this is our problem:

https://github.com/rust-lang/cc-rs/commit/c4f414f449bb7cffba3bc923f277704d1=
d08a8ec

> --
> Alex Kiernan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192886): https://lists.openembedded.org/g/openembedde=
d-core/message/192886
> Mute This Topic: https://lists.openembedded.org/mt/103146651/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

