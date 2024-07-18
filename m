Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF72C3DA60
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 13:30:11 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.15092.1721309410383757464
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 06:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HPi/CUYH;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ee91d9cb71so9485911fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 06:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721309408; x=1721914208; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awbR2hW8oz3CX52aM0Tp8nMzGIfYdLZclSX/N2WBlf4=;
        b=HPi/CUYHJZNfbSiyiUr3ZnkH/h95FSJtpplhp06wun+1ih37LTtkNYCXfp9SN5heIo
         rQdRSF8+RAMte9qDT/HME9So1rUBufgk9l2q/ZOAtwALKcG5/cDb5p5P6bV9f1Jic4S2
         s3MPZA7TvitNzarm4aMFGsiOd+KeWKnbu1I9rnN4Z2FJw+Az48K97z6RaGXfXqK4o6fS
         YNbMlOj6iqhCx8xJQzmxNX7x2TCouYCsMEPku1LyeSOerIWaSNFv8bXTo0LFPOmYnc2A
         mTSBs5/0b0zzPAN36xofDdHaaaeeFivCj6WyNUCEEB6L9CilH8uddYzFKxCKqtIJP1/w
         /1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721309408; x=1721914208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awbR2hW8oz3CX52aM0Tp8nMzGIfYdLZclSX/N2WBlf4=;
        b=byBkcfh6eqraYkltZZH40l28k0DV24m4fUdBpbZs1130kLbGCPnbVtGDYtamgF1aBw
         f1vmH9sTvoGwCPC1v2j373ywByoo0cmrMJRfvq1VLxFTQRPHZ4UxRFR4A+beYhYpQMfR
         YteGOr6MbpInJE4R3TBgD3/grAORwbgMVWzCH/cr2TYUI+c8akWOccX8Wgb1BzbY+lwZ
         /g/tG4yT+7BMpCxT2fE/AxqPx4E3xCKWZ91G0AK4UwgSzVGfkPWf4BNP7gSy3lkqFmuY
         9Kp8Ol/dKiNMKi/UfnI1lJMfNgeF6te5XA16amaZWyV8hBvARyWBwcynBo2bM/+VLNMA
         qNHQ==
X-Gm-Message-State: AOJu0YwgcAxD9NeLNLTJfspK6ao04OrexJs/VSfHDfHHnP2gltRZyqwb
	Q6g+oNTLvwf0uds47OUz/dDzqOSxR+xmmM91N9ms5N851soSxyu8uXDtTCmCjA6juFX1F2SjmRi
	lEu2tV7QZHYsEtriWd4clVgijt1s=
X-Google-Smtp-Source: AGHT+IHJ44/GP2KgPtM6KkGkb54CwgZb0hCElMoYr8edJmZE4hne855+NkIoUqEr2OEmXxYAOfQ6eAjMnIx63IL+zx8=
X-Received: by 2002:a2e:a541:0:b0:2ee:7dfe:d99c with SMTP id
 38308e7fff4ca-2ef05d2ed3fmr20766371fa.31.1721309408229; Thu, 18 Jul 2024
 06:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
 <50bea4fa4fe781c4b584d746fec34c758d28599f.camel@gmail.com>
 <CA+chaQeGeXFd7rH2KjsYdtW50Nnre0DL8ykjjmWSRKNX89OrYg@mail.gmail.com>
 <f8486647cf50da429e45b457e483bb89a2f2a1b6.camel@gmail.com>
 <CA+chaQfrdAhRKwbEwe+5nRxZ71J6RE4eBLzFNsg-u0FZJS815g@mail.gmail.com> <8c93f18c668fcb008069e318d6eb63de057d91da.camel@gmail.com>
In-Reply-To: <8c93f18c668fcb008069e318d6eb63de057d91da.camel@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 18 Jul 2024 15:29:51 +0200
Message-ID: <CA+chaQd9nXzOpZSRfqTsnemjO7mfj10V1hzi=i7qnsTrsEOLvw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/6] Use the kernel from sstate when building fitImages
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 13:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202212

On Thu, Jul 18, 2024 at 2:37=E2=80=AFPM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> On Thu, 2024-07-18 at 10:39 +0200, Martin Jansa wrote:
> > On Thu, Jul 18, 2024 at 10:00=E2=80=AFAM Adrian Freihofer
> > <adrian.freihofer@gmail.com> wrote:
> > >
> > > Hi Martin
> > >
> > > Thank you for looking at my patches.
> > >
> > > On Mon, 2024-07-15 at 16:32 +0200, Martin Jansa wrote:
> > > > Doesn't it still rebuild from scratch when IMAGE_VERSION_SUFFIX
> > > > changes?
> > >
> > > I wonder why this happens in WebOS. I think that this line
> > > kernel_do_deploy[vardepsexclude] =3D "DATETIME"
> > > prevents such unnecessary rebuilds.
> >
> > Hi Adrian,
> >
> > yes DATETIME is excluded by default, but it's useful to use different
> > suffix in IMAGE_VERSION_SUFFIX (e.g. BUILD_NUMBER from CI on jenkins
> > or release version when building release) and in such cases you don't
> > want to vardepexclude it, because it's useful to produce matching
> > version in images as well as kernel (and other artifacts you might
> > have), so your 1.2.1 release images doesn't end with 1.2.0 kernel
> > artifacts just because kernel sstate signature didn't change in 1.2.1
> > bugfix release.
> >
> > Does this make sense? I bet it would happen in your builds as well.
>
> I try to optimize everything towards binary-reproducible builds. This
> means that we remove all kinds of variables that change because the
> time changes or because the CI build ID changes or something like that.
> I see no benefit in compiling such information into the firmware.
> But the problem I see is that such ideas clash with efficient and
> binary-reproducible builds.
>
> That means that I don't see a reason for changing the
> IMAGE_VERSION_SUFFIX variable in such a way.
>
> >
> > Whole point of:
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12937
> > is to allow "renaming" (adding more hardlinks) artifacts with
> > matching
> > IMAGE_VERSION_SUFFIX without the need of rebuilding anything (e.g.
> > version-less kernel artifacts are re-used from sstate and then only
> > quick deploy-links task is executed to add right versioned hardlinks
> > in deploy directory.)
> >
>
> Well, yes, it would. But, I am confident that it is a better strategy
> to simply not do this than to support it.
>
> If such non-reproducible information is needed anyway, it can be
> archived independently of Bitbake.

Well the changes from:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12937
make the builds _more_ reproducible, because they move the DATETIME or
whatever IMAGE_VERSION_SUFFIX out of the artifacts in sstate and move
creating versioned names to separate task which can be disabled (by
setting IMAGE_VERSION_SUFFIX to empty if you prefer not to create
them).

