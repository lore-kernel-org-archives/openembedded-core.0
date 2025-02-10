Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCE9C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 21:58:22 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.3940.1739220669881975165
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 12:51:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RBpvp7He;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: pio.lobacz@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5de47cf9329so5864700a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 12:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739220668; x=1739825468; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbGQWbEpOhesWHRmfD81l/ZtPkJ+yVW/aMisV9TmJgQ=;
        b=RBpvp7HeTNYjNEYSYtcW/LnFI64gQMbR+mDXx9kyB9EURmxRZUg53hvQCjs8Y4ZOCu
         sEZWKZPQXCGZXwnCba5YFyKFKroj7h5Y0KdrhMgo0/KbMOOzfLctDiEi9jTO5N+4DwUg
         G01R/CK+TBiOI3ZGM8/e5OUUWMD9Qg1Anh7oj54w1VO1x+O4n9nWLYasl4Wjnm1GBwmk
         EPr0YQZiFXvnyCUeg9cPyIauwAewHvuVB/y5J/dFcwsSj5qEmKKIs0k8Kx83qaQSPsaP
         DLU5UTb3RnSBF9i9Sd5S02eaBBe7HCS8LIZ8LGzDZKlLN5o7Zx1nbnc+I2HASunCAVYC
         lhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739220668; x=1739825468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbGQWbEpOhesWHRmfD81l/ZtPkJ+yVW/aMisV9TmJgQ=;
        b=VgspzV2nNNpOLK3hR8KleTfRQAcrDYULMFBkCAqDfmRm4DIqooGZn7H87ymeoiC1a7
         KT/U4a1jC4xfqNMD2nwBTOK65qFrS6B0B1NshoYMRTJevwB3unsqAzrufqLtrgsr+58T
         L8BC3wP1SrczP6lf3jmBhSDub/73ACE1QKSgdSMGjyyFsNKWobKg7WUWSapOdoq0Se3U
         EfEq4JgAZ+C7zRzvOC/OqIXpWxsYeDFYuKnC3FdlC8fZWGj1991jc9w7c1SMVdP318rX
         EH0sxanf+dzifdgfEuRb/Tsjdmaxie6g7+yU0hMg2WdG6UyUqddhTD3iJl0+fhpehWt/
         50aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnsj0BeUYfMy0UNltfHJ6npjUlDEhqSiVIDfEKkGkja1gZm+UQ4PYzS11XxI+/XhHjKIYoUA5RpCjyHJ7WpjW2Fw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxjMWZYjBeJqPDRbGQzRCVF5O/CRg84t+/ZeoU9yIUGy7BKVIl8
	NxTkfeSkqbuQ2PR/fIONpUjEl3qKx6RgVed9rcRGDrhUzZa8k4vm8Rc7fpHPDpz1BsBWN8g7tlB
	ZNcs36DXM/1yYw9XKmNrP/B5xvc4=
X-Gm-Gg: ASbGnctEHVrcBuyioheqObYxfsOGg+53U7JakrM6/e0WM6IyKr6Mez1bp9iDR228RGg
	g3r72kS5djvj+c1QNKzg7l7btucCP9Z/J0G6QhUbRN6s+Vqnq563Q4+b+yoeageALi7uRcp2ImQ
	==
X-Google-Smtp-Source: AGHT+IE3CKNDvNqMTC5hFpGiS+1CqNt8NnTw19H2NRkMS0iC0Q0ZjOJBZ4xeYMTubbxmMi3/C+k6OOXCoHUNu1ukTIw=
X-Received: by 2002:a05:6402:5250:b0:5db:f5e9:6745 with SMTP id
 4fb4d7f45d1cf-5de9a0a42ddmr1497295a12.0.1739220668023; Mon, 10 Feb 2025
 12:51:08 -0800 (PST)
MIME-Version: 1.0
References: <20250210125047.2644290-1-pio.lobacz@gmail.com>
 <3980bb85057c3c2402714d4c51676d628bf2ef52.camel@linuxfoundation.org>
 <CAH6NA5u+8U6ZWFFas0-S=Faq+7tiSs650MR7k9W_80Uxm=gOWg@mail.gmail.com> <CAJdd5GbUo6ckemc6GEsf=TdaMKPbK+V-zCNqPSWTV1_x3PdrdA@mail.gmail.com>
In-Reply-To: <CAJdd5GbUo6ckemc6GEsf=TdaMKPbK+V-zCNqPSWTV1_x3PdrdA@mail.gmail.com>
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <pio.lobacz@gmail.com>
Date: Mon, 10 Feb 2025 21:50:56 +0100
X-Gm-Features: AWEUYZnz3tHVsGYs4OaOTW4erp3qa4a_licS7QKEmj7uMl6r2jfP8Z7QzVFeTl4
Message-ID: <CAH6NA5tx+P0cTcG05rUPxD3+shAdWD9kbsL=+KQ8BY3Wq7=aLg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/create-spdx-2.2: Fix SPDXDIR affecting multiconfig machines
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 21:58:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211120

Sure Joshua,
I hope it won't be much extra work, as I have this patch already applied
and it is working for me without any issues.

BR
Piotr

pon., 10 lut 2025 o 18:51 Joshua Watt <jpewhacker@gmail.com> napisa=C5=82(a=
):
>
> Piotr,
>
> I think with the provided example I can look into this. I suspect it
> will be a little more involved than adding MACHINE_ARCH
>
> On Mon, Feb 10, 2025 at 9:58=E2=80=AFAM Piotr =C5=81obacz <pio.lobacz@gma=
il.com> wrote:
> >
> > Actually this was just an issue with the path to the deps.json file.
> > which was containing all the dependencies and in case of different
> > machine
> > for packages like e.g. base-files this file was containing bad
> > dependency, meaning that if i'm building first machine A, than B,
> > the spdx files from A for base-files are being moved to B but are
> > searched still in A directory.
> >
> > We were discussing this issue with Joshua, but i'm not an expert in
> > this matter...
> >
> > BR
> > Piotr
> >
> > pon., 10 lut 2025 o 14:42 Richard Purdie
> > <richard.purdie@linuxfoundation.org> napisa=C5=82(a):
> > >
> > > On Mon, 2025-02-10 at 13:50 +0100, Piotr =C5=81obacz via lists.openem=
bedded.org wrote:
> > > > Currently SPDXDIR is pointing to `${WORKDIR}/spdx` which means that=
 the by-id
> > > > and by-namespace SPDX files are created without differentiation bet=
ween machines.
> > > > This means that for two machines using a common package architectur=
e
> > > > (e.g. genericx86-64 and qqemux86-64), there would be overlapping fi=
les. This means
> > > > that the build of one can remove files from the other leading to bu=
ild failures. An
> > > > example would be:
> > > >
> > > > MACHINE=3Dqemux86-64 bitbake core-image-minimal
> > > > MACHINE=3Dgenericx86-64 bitbake core-image-minimal
> > > > MACHINE=3Dqemux86-64 bitbake linux-yocto -c clean
> > > > MACHINE=3Dgenericx86-64 bitbake core-image-minimal -C rootfs
> > > >
> > > > To fix this, add MACHINE_ARCH to the SPDXDIR path used for the file=
s in order
> > > > to differentiate packages' dependencies between machines.
> > > >
> > > > This commit fixes issue repored by Khem [1]
> > > >
> > > > [1] https://patchwork.yoctoproject.org/comment/13577/
> > > >
> > > > Signed-off-by: Piotr =C5=81obacz <pio.lobacz@gmail.com>
> > > > ---
> > > >  meta/classes/create-spdx-2.2.bbclass | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/cr=
eate-spdx-2.2.bbclass
> > > > index ade1a04be3..9e228891ab 100644
> > > > --- a/meta/classes/create-spdx-2.2.bbclass
> > > > +++ b/meta/classes/create-spdx-2.2.bbclass
> > > > @@ -11,7 +11,7 @@ DEPLOY_DIR_SPDX ??=3D "${DEPLOY_DIR}/spdx"
> > > >  CVE_PRODUCT ??=3D "${BPN}"
> > > >  CVE_VERSION ??=3D "${PV}"
> > > >
> > > > -SPDXDIR ??=3D "${WORKDIR}/spdx"
> > > > +SPDXDIR ??=3D "${WORKDIR}/spdx/${MACHINE_ARCH}"
> > > >  SPDXDEPLOY =3D "${SPDXDIR}/deploy"
> > > >  SPDXWORK =3D "${SPDXDIR}/work"
> > > >  SPDXIMAGEWORK =3D "${SPDXDIR}/image-work"
> > >
> > > I suspect this is going to cause other challenges since the task stam=
p
> > > isn't machine specific as far as I know but this change would require
> > > it to be and force all of the SPDX tasks to be machine specific.
> > >
> > > Cheers,
> > >
> > > Richard

