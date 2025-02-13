Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D8EC021A4
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 10:32:40 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.6926.1739436996395464793
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 00:56:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jQ+YjFVN;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: pio.lobacz@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5ded1395213so502165a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 00:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739436995; x=1740041795; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kvgs1gVapgPXh2afooyMULKhttSyt3X4RUhhKXh4G4=;
        b=jQ+YjFVN1CTGZGSsOysEicc9YPBfhiti6hCcSAt8f1W0Yz93OX4pYRaxvYhmwaU+N1
         Vp48eXCk5ChaFxZ+vbvN8H9HWwIxTvX2OkFM2oDQHRUllcX+4JCImbXUJqwwEGrhQijv
         VklOGMgO7fk1Cyp/kTCKF3bdMYkxWqN3dT+RPdf/3fkXgC2e94zfSD4/hHGBgXAVZu2Y
         lOVIXSuCWMmQE5SwWZPnZyVIGLhw9JsBcQlRWT8w9DeEIJHMcX9Rty1zspjHBh7O4pAY
         AEDcN+lmB6JvgxMc8RzhJuqx4wdiSbH1JTKsKx/NvnQhDcGmvv/DH/ZDL2ut0nwk4eGC
         ho1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739436995; x=1740041795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kvgs1gVapgPXh2afooyMULKhttSyt3X4RUhhKXh4G4=;
        b=ZzhECleCHlkrceDzZhw2osxTLItOM5ygWm4G2Zfry5LmLfdbPu30mBS8rJgaBNhr8+
         PieZluWUfs7Fi6OvK+t57gkbzMhq25lqZ8y9HPnLch0hbql0+jjhgcEib+20jrAze61L
         X7mQQbdyZ0FkMdu3pP5v0IPIp//4G9OksW9ZymRUu2HCmlK8S1tzSvDtTM0sU4oom8vl
         jOrKEOBktswOF8IhnQjr5ztjGiUB0gdQwAAsU9Ats1IA6NIiGvH8Cy7bodDY4gW59IVi
         NR/QdwkEHaDf75tl2MDDSg/L3MOpEpjjjN9VLKYY7v2xihzaogVEhXKfj4vVj0sA2Gox
         3uDg==
X-Forwarded-Encrypted: i=1; AJvYcCVN2N18IiaZGlQrB6plKRaiN+EOW8hmcKmjG4SS/1CYG2Ye6h3lswhCcG+85MRKr/ylRX0LpAgQbrxW/QGRdxsBkQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz3Z/fsswNga1HUyzdWbIKQQOJ4EHLE0AKtE32hpS/2+gI7cEDy
	O9otvaUNTHUKKvOqmzUlc3Kwl3uVLFlt42E6NuB/qvTN8YElEsut3jSPdx0p7DusKFqy2/LuY3R
	WDUZUms5HSLxUv1q0qUBLQGoMO41Dgg==
X-Gm-Gg: ASbGnctrPahi4+aWqNS+7ZGmikoozeWQtgYGRnc4LTAc2jzeCzj94i4+qQMvN2l5rr8
	+zq3kBe8IwVnwTMmduNt/xpxZXuxJAzm7dsdvmdRj5Ek7skeR1fFfZph4ubhq0RB4OuQ6g3FaBg
	==
X-Google-Smtp-Source: AGHT+IFbSU3OxkILXNerdwkTytS9Uiv0YBCtZEcIyVD98QVkpbVrzVAQf2ScfXSv/jPdJZ6oxQbtL+dE5QcH5vumJU8=
X-Received: by 2002:a05:6402:3490:b0:5dc:cf9b:b034 with SMTP id
 4fb4d7f45d1cf-5dec9e7b75dmr1797895a12.14.1739436994232; Thu, 13 Feb 2025
 00:56:34 -0800 (PST)
MIME-Version: 1.0
References: <20250210125047.2644290-1-pio.lobacz@gmail.com>
 <3980bb85057c3c2402714d4c51676d628bf2ef52.camel@linuxfoundation.org>
 <CAH6NA5u+8U6ZWFFas0-S=Faq+7tiSs650MR7k9W_80Uxm=gOWg@mail.gmail.com>
 <CAJdd5GbUo6ckemc6GEsf=TdaMKPbK+V-zCNqPSWTV1_x3PdrdA@mail.gmail.com>
 <CAH6NA5tx+P0cTcG05rUPxD3+shAdWD9kbsL=+KQ8BY3Wq7=aLg@mail.gmail.com> <CAJdd5GZk8Q3cvGO6rdCSj2UzdvFhZ=wr=WHBiHHXJUe_fQu0ug@mail.gmail.com>
In-Reply-To: <CAJdd5GZk8Q3cvGO6rdCSj2UzdvFhZ=wr=WHBiHHXJUe_fQu0ug@mail.gmail.com>
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <pio.lobacz@gmail.com>
Date: Thu, 13 Feb 2025 09:56:23 +0100
X-Gm-Features: AWEUYZmR9gf37pkw4mgfsL6PwbFHzm4vvo13t049vRTVCzImcSWGGELCfaMZ0cA
Message-ID: <CAH6NA5se_XfH5VWguTp2uGoqUNqUViJgKkJqzXbk=VkS3BN12A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/create-spdx-2.2: Fix SPDXDIR affecting multiconfig machines
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 10:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211322

Nope. It is on the scarthgap and I have set it in the subject when git
send-mail, but somehow it has been cut...

=C5=9Br., 12 lut 2025 o 23:07 Joshua Watt <jpewhacker@gmail.com> napisa=C5=
=82(a):
>
> Based on this patch, I'm guessing you're not working off of master?
> The patch doesn't apply to the latest master version because a lot of
> the variables in create-spdx-2.2 were moved to spdx-common.bbclass.
>
> I tried the reproduction steps on master and it seems to work OK, but
> I'll keep trying; can you provide what branch/commit you are working
> on and we can possible figure out what fix might be needed if it is
> already fixed on master?
>
> On Mon, Feb 10, 2025 at 1:51=E2=80=AFPM Piotr =C5=81obacz <pio.lobacz@gma=
il.com> wrote:
> >
> > Sure Joshua,
> > I hope it won't be much extra work, as I have this patch already applie=
d
> > and it is working for me without any issues.
> >
> > BR
> > Piotr
> >
> > pon., 10 lut 2025 o 18:51 Joshua Watt <jpewhacker@gmail.com> napisa=C5=
=82(a):
> > >
> > > Piotr,
> > >
> > > I think with the provided example I can look into this. I suspect it
> > > will be a little more involved than adding MACHINE_ARCH
> > >
> > > On Mon, Feb 10, 2025 at 9:58=E2=80=AFAM Piotr =C5=81obacz <pio.lobacz=
@gmail.com> wrote:
> > > >
> > > > Actually this was just an issue with the path to the deps.json file=
.
> > > > which was containing all the dependencies and in case of different
> > > > machine
> > > > for packages like e.g. base-files this file was containing bad
> > > > dependency, meaning that if i'm building first machine A, than B,
> > > > the spdx files from A for base-files are being moved to B but are
> > > > searched still in A directory.
> > > >
> > > > We were discussing this issue with Joshua, but i'm not an expert in
> > > > this matter...
> > > >
> > > > BR
> > > > Piotr
> > > >
> > > > pon., 10 lut 2025 o 14:42 Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> napisa=C5=82(a):
> > > > >
> > > > > On Mon, 2025-02-10 at 13:50 +0100, Piotr =C5=81obacz via lists.op=
enembedded.org wrote:
> > > > > > Currently SPDXDIR is pointing to `${WORKDIR}/spdx` which means =
that the by-id
> > > > > > and by-namespace SPDX files are created without differentiation=
 between machines.
> > > > > > This means that for two machines using a common package archite=
cture
> > > > > > (e.g. genericx86-64 and qqemux86-64), there would be overlappin=
g files. This means
> > > > > > that the build of one can remove files from the other leading t=
o build failures. An
> > > > > > example would be:
> > > > > >
> > > > > > MACHINE=3Dqemux86-64 bitbake core-image-minimal
> > > > > > MACHINE=3Dgenericx86-64 bitbake core-image-minimal
> > > > > > MACHINE=3Dqemux86-64 bitbake linux-yocto -c clean
> > > > > > MACHINE=3Dgenericx86-64 bitbake core-image-minimal -C rootfs
> > > > > >
> > > > > > To fix this, add MACHINE_ARCH to the SPDXDIR path used for the =
files in order
> > > > > > to differentiate packages' dependencies between machines.
> > > > > >
> > > > > > This commit fixes issue repored by Khem [1]
> > > > > >
> > > > > > [1] https://patchwork.yoctoproject.org/comment/13577/
> > > > > >
> > > > > > Signed-off-by: Piotr =C5=81obacz <pio.lobacz@gmail.com>
> > > > > > ---
> > > > > >  meta/classes/create-spdx-2.2.bbclass | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classe=
s/create-spdx-2.2.bbclass
> > > > > > index ade1a04be3..9e228891ab 100644
> > > > > > --- a/meta/classes/create-spdx-2.2.bbclass
> > > > > > +++ b/meta/classes/create-spdx-2.2.bbclass
> > > > > > @@ -11,7 +11,7 @@ DEPLOY_DIR_SPDX ??=3D "${DEPLOY_DIR}/spdx"
> > > > > >  CVE_PRODUCT ??=3D "${BPN}"
> > > > > >  CVE_VERSION ??=3D "${PV}"
> > > > > >
> > > > > > -SPDXDIR ??=3D "${WORKDIR}/spdx"
> > > > > > +SPDXDIR ??=3D "${WORKDIR}/spdx/${MACHINE_ARCH}"
> > > > > >  SPDXDEPLOY =3D "${SPDXDIR}/deploy"
> > > > > >  SPDXWORK =3D "${SPDXDIR}/work"
> > > > > >  SPDXIMAGEWORK =3D "${SPDXDIR}/image-work"
> > > > >
> > > > > I suspect this is going to cause other challenges since the task =
stamp
> > > > > isn't machine specific as far as I know but this change would req=
uire
> > > > > it to be and force all of the SPDX tasks to be machine specific.
> > > > >
> > > > > Cheers,
> > > > >
> > > > > Richard

