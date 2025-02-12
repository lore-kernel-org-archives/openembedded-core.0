Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204B6C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 22:07:19 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.846.1739398032822574186
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 14:07:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NPnLGYdx;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54504bf07cdso138706e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 14:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739398031; x=1740002831; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yo26Is22DjDqtiTH5v3/VG+EX7DBATgJmmtLtj8nqHk=;
        b=NPnLGYdxaZzOEkJHk/6znrCc4pJ4EY/U8FDQSOitNQ5ZxEusSwASX+jmMVjC2S3ukZ
         mA0OlrVnqIFD2QoNWwXL+emn0C9Zpg1Vym/R3ZFf2pc6HDfkwHnfy1Mt9XuYYWDzeepY
         0Og8vLEi8tAFSQGP3mWHyrHEBaVJ7XgkkTzOUSrxznqXto9X+aNqMKFjIdOt2sCdbCDK
         RlPkwWG9QagiYl8LOOFncoapGwg1v0gOd7C48UdHWAT3anJyYmrY1ka8FsuYkIx8mi0C
         zBuxuXuQ2fXhaKyzBkzIiG0ClG6Fyw85rWfoLkj7BLt8/CCrKx8o+hLFm2+TSOIpKgQa
         DpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739398031; x=1740002831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yo26Is22DjDqtiTH5v3/VG+EX7DBATgJmmtLtj8nqHk=;
        b=rlhZLnlzYWAbYmHq9y7v6gNX/luxtpyCECgxh+xMzLDagKixty+5839rfUi+JQNl+c
         tr16J6QJ/BCbSYIgdNrnrFGtHTDBey7F5eCcKf9FGHXalYpU3DvHfsQwFtVpgscoaXWg
         jznV3pZzaC7LnESK81VV/DxmnBs9jRVfccawDuLYHXMTa7K/qV82NEWkDBWXNZ8/tYjM
         cMjMumbJS5TEFzqjTGpDo4SV/nvsmp+M9TAmBBK2C2HrsWe4wS+Lp5RnW2a6DG1vuulp
         hZytSP/lcfKwXVErQgT+Teskgi/rkCe3QwHzEpsMSwp2R7gWajvbqyUqcoi/xGmDNGWl
         bAcg==
X-Forwarded-Encrypted: i=1; AJvYcCUn9gxVBBNwig2GlCk/jBK4tiE3Z2hvPsrs4yW7QJRYfM8Jm7/uTQ9mdDS5m7h9gl/otqBz13YCJPcr4D8hO2682Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwIVQhvXWQf71jZ5rcP69E6Xjf5IAESDKQBj7aAenltCb8VWIXJ
	gZI+x/OmgxhkavQzEbpZ6ODHXfli+3gdYtLtmM3QdZ6Wk09VPVzpl6c3H1M92sizw1wHzVLlDah
	ca0jW6ZrBUIZXBbk6q294+SArTB4=
X-Gm-Gg: ASbGncuneOJ6ityX8HBart/qkTvD8j+5fWNDcFilIY9nOXNSKbQa/QxGxpei2/QL/A8
	TV688XXBR8AhSgeTOvXorXm94hlH4YRC1umANEfKPOYwzAvi9qcfWJ60Bz54/vZHJNcfB9DNU2Z
	dPjmv2fI9gPmo=
X-Google-Smtp-Source: AGHT+IGbd1qgOeCZqMN/v4sqDtF9CbSAxrE+JRduShuTBNmCuxRAByTw07R3/lDZX67wrA9cdr3hTD+DC7GIHqEsQzQ=
X-Received: by 2002:a05:6512:3988:b0:545:aa5:d455 with SMTP id
 2adb3069b0e04-5451810917dmr1635250e87.15.1739398030527; Wed, 12 Feb 2025
 14:07:10 -0800 (PST)
MIME-Version: 1.0
References: <20250210125047.2644290-1-pio.lobacz@gmail.com>
 <3980bb85057c3c2402714d4c51676d628bf2ef52.camel@linuxfoundation.org>
 <CAH6NA5u+8U6ZWFFas0-S=Faq+7tiSs650MR7k9W_80Uxm=gOWg@mail.gmail.com>
 <CAJdd5GbUo6ckemc6GEsf=TdaMKPbK+V-zCNqPSWTV1_x3PdrdA@mail.gmail.com> <CAH6NA5tx+P0cTcG05rUPxD3+shAdWD9kbsL=+KQ8BY3Wq7=aLg@mail.gmail.com>
In-Reply-To: <CAH6NA5tx+P0cTcG05rUPxD3+shAdWD9kbsL=+KQ8BY3Wq7=aLg@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 12 Feb 2025 15:06:58 -0700
X-Gm-Features: AWEUYZnd98Kk_de_BeyI2QkFiyccSbwad_ABYsMwdoaftyOO1a1I1l7BmBjPGUk
Message-ID: <CAJdd5GZk8Q3cvGO6rdCSj2UzdvFhZ=wr=WHBiHHXJUe_fQu0ug@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/create-spdx-2.2: Fix SPDXDIR affecting
 multiconfig machines
To: =?UTF-8?Q?Piotr_=C5=81obacz?= <pio.lobacz@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 22:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211280

Based on this patch, I'm guessing you're not working off of master?
The patch doesn't apply to the latest master version because a lot of
the variables in create-spdx-2.2 were moved to spdx-common.bbclass.

I tried the reproduction steps on master and it seems to work OK, but
I'll keep trying; can you provide what branch/commit you are working
on and we can possible figure out what fix might be needed if it is
already fixed on master?

On Mon, Feb 10, 2025 at 1:51=E2=80=AFPM Piotr =C5=81obacz <pio.lobacz@gmail=
.com> wrote:
>
> Sure Joshua,
> I hope it won't be much extra work, as I have this patch already applied
> and it is working for me without any issues.
>
> BR
> Piotr
>
> pon., 10 lut 2025 o 18:51 Joshua Watt <jpewhacker@gmail.com> napisa=C5=82=
(a):
> >
> > Piotr,
> >
> > I think with the provided example I can look into this. I suspect it
> > will be a little more involved than adding MACHINE_ARCH
> >
> > On Mon, Feb 10, 2025 at 9:58=E2=80=AFAM Piotr =C5=81obacz <pio.lobacz@g=
mail.com> wrote:
> > >
> > > Actually this was just an issue with the path to the deps.json file.
> > > which was containing all the dependencies and in case of different
> > > machine
> > > for packages like e.g. base-files this file was containing bad
> > > dependency, meaning that if i'm building first machine A, than B,
> > > the spdx files from A for base-files are being moved to B but are
> > > searched still in A directory.
> > >
> > > We were discussing this issue with Joshua, but i'm not an expert in
> > > this matter...
> > >
> > > BR
> > > Piotr
> > >
> > > pon., 10 lut 2025 o 14:42 Richard Purdie
> > > <richard.purdie@linuxfoundation.org> napisa=C5=82(a):
> > > >
> > > > On Mon, 2025-02-10 at 13:50 +0100, Piotr =C5=81obacz via lists.open=
embedded.org wrote:
> > > > > Currently SPDXDIR is pointing to `${WORKDIR}/spdx` which means th=
at the by-id
> > > > > and by-namespace SPDX files are created without differentiation b=
etween machines.
> > > > > This means that for two machines using a common package architect=
ure
> > > > > (e.g. genericx86-64 and qqemux86-64), there would be overlapping =
files. This means
> > > > > that the build of one can remove files from the other leading to =
build failures. An
> > > > > example would be:
> > > > >
> > > > > MACHINE=3Dqemux86-64 bitbake core-image-minimal
> > > > > MACHINE=3Dgenericx86-64 bitbake core-image-minimal
> > > > > MACHINE=3Dqemux86-64 bitbake linux-yocto -c clean
> > > > > MACHINE=3Dgenericx86-64 bitbake core-image-minimal -C rootfs
> > > > >
> > > > > To fix this, add MACHINE_ARCH to the SPDXDIR path used for the fi=
les in order
> > > > > to differentiate packages' dependencies between machines.
> > > > >
> > > > > This commit fixes issue repored by Khem [1]
> > > > >
> > > > > [1] https://patchwork.yoctoproject.org/comment/13577/
> > > > >
> > > > > Signed-off-by: Piotr =C5=81obacz <pio.lobacz@gmail.com>
> > > > > ---
> > > > >  meta/classes/create-spdx-2.2.bbclass | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/=
create-spdx-2.2.bbclass
> > > > > index ade1a04be3..9e228891ab 100644
> > > > > --- a/meta/classes/create-spdx-2.2.bbclass
> > > > > +++ b/meta/classes/create-spdx-2.2.bbclass
> > > > > @@ -11,7 +11,7 @@ DEPLOY_DIR_SPDX ??=3D "${DEPLOY_DIR}/spdx"
> > > > >  CVE_PRODUCT ??=3D "${BPN}"
> > > > >  CVE_VERSION ??=3D "${PV}"
> > > > >
> > > > > -SPDXDIR ??=3D "${WORKDIR}/spdx"
> > > > > +SPDXDIR ??=3D "${WORKDIR}/spdx/${MACHINE_ARCH}"
> > > > >  SPDXDEPLOY =3D "${SPDXDIR}/deploy"
> > > > >  SPDXWORK =3D "${SPDXDIR}/work"
> > > > >  SPDXIMAGEWORK =3D "${SPDXDIR}/image-work"
> > > >
> > > > I suspect this is going to cause other challenges since the task st=
amp
> > > > isn't machine specific as far as I know but this change would requi=
re
> > > > it to be and force all of the SPDX tasks to be machine specific.
> > > >
> > > > Cheers,
> > > >
> > > > Richard

