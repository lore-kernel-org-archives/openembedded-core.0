Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0EBC83F17
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 19:11:00 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.3236.1752174656222967793
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jul 2025 12:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fS73O0Oa;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3121aed2435so1410842a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 12:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752174656; x=1752779456; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6cDBHrL4IXcLhUzUvYxaoJYoLHHX5pT0mM04lbqBCQ=;
        b=fS73O0OaipdIrwMKTDGow4qvqUqCCCNP1l4sKG7d2A4FGjwOvLBQv4wY9JVRPS7eDH
         Ns8qqD2IXJBErNLt8J+S3MHcmHxMhAan7DxGAqxeWLgV0hMHk+GeJPW3nM1olB1vKEcu
         vrV9HUcKZvwBGBjlUdxfPHnro3MrVmokWa0xKpnJplMmstxfp38Iqz0rd5M667ezCelv
         aOoF8ljUt2jRp/JiUsOSassj1ZbwdMWoqe4U2weBN3uGaSaIFd8PCX6yhTiOZGu0oEA4
         eeHoSiEJlqqgdmgls2jV1iPEQcSh5tg1OCvAGjlBcseo/MySDIxIvLydynh7DF1vt1h3
         l0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752174656; x=1752779456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6cDBHrL4IXcLhUzUvYxaoJYoLHHX5pT0mM04lbqBCQ=;
        b=LNduI1mFKWjhZEK6mMcp/lpI0+1W4OJaUI0DNxO0FeKRFPK2zEnGfRSW8ii7pNcMFE
         SESz4cKNmwK2rzTAG4dvlMn4TXx8dxKginvJaKbCzNBtJsXsqHWm9Zned1ry2SxOqu14
         tULUS4io9B7wJPDZmKBvmVErykHEwEZ5MsKFKluzp/l/GDvBmc47W+PHAJ968svkOnCN
         Hs9NvivQbhOVOxfAr6PK4QUGupFFDSWWcH0RS3X/+FG3VAvA16gTvlgD4a2D6KIPliB1
         NJKRJJ4Yfdq8f3reLkpsJj1uRuctP/6W9Ga7tbk/WFC1DGKL1/2awsKsGrEX6NKRs0cD
         eoiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxJrMcvoSUdIieNOfc79It/i3IPsvGnKkDsFXByLuA0Zz8YEPk2/gEYLjl27aO5EAsweZv678LXnBqQix6Ev37wA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw9aZf+o2WYrj8jOnDeyq+A+J2mS+frZN4Oov3XaobHMJFziPMW
	D83QoSgT/CIUXb8VhGi2MgnzaancudyCD4CApLg9F2B0VtLs/IUfYYiGr637+hFq8JgDk+dJiAr
	CG5WqXSyZ4vedOx4CoXk9METRRp2CVN4=
X-Gm-Gg: ASbGncsSsBNsEHMxNCFoul0o5b6lgxp4jc7XzOqiL/jEW2YnxmOzzaoaKQkskunn/AA
	i7XymKSM+VMDSb/CbBN82LqdenYrSqvmp7mcYR2S5b06rKPtRFdsfub2h/8tf7c3aOvMHGqRdtW
	3w0seV/8oSCLnTrANScmipDiGCG2O+DGIqc6W8c7tfrqM=
X-Google-Smtp-Source: AGHT+IFOYnigsOUoEoFIIAoT+4jTYkz51kFl0txRJjsUCzy7r5fW/l59EE7gICNn7oXGn/GmUFALcM1qwLmKAUw0+m0=
X-Received: by 2002:a17:90b:3a8a:b0:312:db8f:9a09 with SMTP id
 98e67ed59e1d1-31c4cb8600emr937514a91.14.1752174655396; Thu, 10 Jul 2025
 12:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <DB3PR09MB62022D923A65D95B35ADAF69EA4EA@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <8340.1751980391085408362@lists.openembedded.org> <DB3PR09MB6202D15953E63F9683D3A14EEA48A@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <CAMKF1spsAzE8MKQeemmi2Gs5PTSB4-KfdkRNo8P7KAUhbF1Znw@mail.gmail.com>
In-Reply-To: <CAMKF1spsAzE8MKQeemmi2Gs5PTSB4-KfdkRNo8P7KAUhbF1Znw@mail.gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Thu, 10 Jul 2025 22:10:43 +0300
X-Gm-Features: Ac12FXwbRPpy7ip5ISN6Xj7hLShmbKjRD8KvZxY4TjjhPBUhlrt7mC-HwNQ5ogk
Message-ID: <CAGpma=4Kr8D_R7Sn3mQNc5Eg-06DwK2fAmuunXZyESemFx1+VQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 0/7] cmake: Major version bump to 4.0.3
To: Khem Raj <raj.khem@gmail.com>
Cc: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, f_l_k@t-online.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 19:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220128

Hello everyone,

It looks like Markus is also sending fixes to meta-openembedded
regarding the CMake 4+ compatibility issue, so I have added him to cc
as well.

I collected the errors from Khem=E2=80=99s latest qemuarm run into a
spreadsheet and added checkboxes. You can tick off the ones you have
fixed, so we can avoid conflicts and waste of time.

https://docs.google.com/spreadsheets/d/1X8LN9x4xhqqzuAiTdE27pJdabS1P9ijeuUG=
AL6oQyzo/edit?usp=3Dsharing

Khem Raj <raj.khem@gmail.com>, 10 Tem 2025 Per, 20:40 tarihinde =C5=9Funu y=
azd=C4=B1:
>
> On Wed, Jul 9, 2025 at 11:34=E2=80=AFPM Haase Moritz, JD-62 <Moritz.Haase=
@bmw.de> wrote:
> >
> > Hi,
> >
> > > I also considered the idea of temporarily using
> > > -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to quickly work around the CMake=
 4 issues
> > > across multiple recipes. Then, I thought that directly upgrading reci=
pes where
> > > the upstream version could be updated was more sustainable solution. =
I
> > > believed this would resolve many compatibility issues by relying on u=
pstream
> > > fixes and encourage the community to use the latest versions.
> > >
> > > [...]
> >
> > I totally agree. Updating should be the preferred approach, followed by=
 patching
> > and the policy workaround.
> >
> > > Before our conversation I made a few things and sent them to meta-ope=
nembedded
> > > and Khem accepted them to master-next, but I still had the feeling th=
at maybe
> > > something better could be done.
> >
> > Awesome, thanks!
> >
> > > As I said, I have the feeling that it can be done better, so I will w=
ait for
> > > your answers before I do anything.
> >
> > How about splitting the remaining build failures in half (after sorting=
 them
> > alphabetically by recipe name?). Would start working on the *second* ha=
lf then.
> > In case of dependency issues we can sync here.
> >
> > @Khem: Would you mind sharing a link to the failures of the latest 'mas=
ter-next'
> > build?
> >
>
> Alper has sent a set of fixes which lowered the volume quite a bit,
> Thanks a lot Alper !. it's down to 52 now.
> here is latest qemuarm run
>
> https://errors.yoctoproject.org/Errors/Build/211141/?limit=3D100
>
>
> > Moritz
> >

