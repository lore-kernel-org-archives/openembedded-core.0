Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 744D3C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 17:25:41 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.56955.1739206724065239216
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 08:58:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f1mmoK3A;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: pio.lobacz@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab7a6758b7fso374380366b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 08:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739206722; x=1739811522; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jB0sHxJOZI6hv4uLakWu6aIM7d41TpHLBgETbm8oJ2Q=;
        b=f1mmoK3AJGPc6kh1ZEjrhSPCYYBMGvohEcGK13n8FxTZIsyCvDLwwERLu4mEXjLrmJ
         gDv0aiidWlTlKA3fGluM5QmzF6xXepIog3yU6vbivqBgTSx9dPlbzjdZ/SfKKc6EvjKA
         Uzd6Hg/Z5ksvCdng+IiN3zZpPtnsE61uoFVEmCN3ezca2lN2o0yY9U6F/YdfH0J/7eIW
         tkeAn4PSVd2MBJ8QsRkbH/SCM7V9MEsM3Fg9Ly7mhHOAwowFReukUi2ctaxYHN7mQq55
         vOXcp9lHJhZlEsu9dA8/NnjFpjSa3UKxh3uwYM9tRuMaaxGJNzj/hW7sRNR3rWZY2rYm
         tW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739206722; x=1739811522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jB0sHxJOZI6hv4uLakWu6aIM7d41TpHLBgETbm8oJ2Q=;
        b=iLCvWT3JzvyK+SvyMLbuV9VrMeyBb29wX2HWZqBlH/IyPZkebsViSkx7WkMoW6/9l8
         WYUOIZ3GA7LyOtKl2rVqGZ5N2dk0I3jQ13DNicQ9KU4iV+nO3dJp7NyfMQ3wWmCfQgb6
         54kc4bP7uZkps7ro8URVSaMrcYkruaM5aympDVX2WHd+obVsObrwiRmsB65P0/hwV+mE
         i5kFtHORfgpHQ9cF3bDWQGmjBgMghxfZ9JUSh7i05J1JjiYhFuWzZdreJKxYtaEfguM1
         hUNFgbIaErTeyd9eWwTxbDpctn8KDolw1LvS0D12tq69b3j80gNXEIoH+8KBdcoHEv4y
         Rlow==
X-Gm-Message-State: AOJu0YxcmRvO8gsJUgJextCanz0rfm0PvoxvIZ2iI1aQXbPYIiwL0byr
	smn6Asb0To7HXX1iqcDYKrbWYZoTtvXYvgt+G2HNixtIDSpzVpLOu2hTAAvb4Fwt/KNzdrZ9ZVL
	tltnXXzxgyU7BAMUNPI7rBvCqwPE=
X-Gm-Gg: ASbGncsJ6Oa0Mg5AEUpqFkDDxd1YicCmAUli8epEtaxMm7TaP16Rt3U9PeEsDxGuWsS
	00fFr4vjK3+MYW3l4lRnCm6nEMfgGkKaEjofanzP0Tb7Ls4J356E4MRhR4CD/hKXoEqd1d5MLog
	==
X-Google-Smtp-Source: AGHT+IEMDUi2MmBY0zCmeBk1ls+ArV8LozHPX45Q4wxFmvgRLfrpnz/PgsE3YLqxXb11Q8AeoRjaUMwbz1y6WzjKdlw=
X-Received: by 2002:a17:906:9c8d:b0:ab7:6e14:c03f with SMTP id
 a640c23a62f3a-ab789b862d9mr1439088766b.21.1739206722247; Mon, 10 Feb 2025
 08:58:42 -0800 (PST)
MIME-Version: 1.0
References: <20250210125047.2644290-1-pio.lobacz@gmail.com> <3980bb85057c3c2402714d4c51676d628bf2ef52.camel@linuxfoundation.org>
In-Reply-To: <3980bb85057c3c2402714d4c51676d628bf2ef52.camel@linuxfoundation.org>
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <pio.lobacz@gmail.com>
Date: Mon, 10 Feb 2025 17:58:31 +0100
X-Gm-Features: AWEUYZmQG0L4ivG__PCCQlZfZ1vc7OBFJgf6rCpmUIJwaXildaHhsMMyO-YVGbE
Message-ID: <CAH6NA5u+8U6ZWFFas0-S=Faq+7tiSs650MR7k9W_80Uxm=gOWg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/create-spdx-2.2: Fix SPDXDIR affecting multiconfig machines
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 17:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211109

Actually this was just an issue with the path to the deps.json file.
which was containing all the dependencies and in case of different
machine
for packages like e.g. base-files this file was containing bad
dependency, meaning that if i'm building first machine A, than B,
the spdx files from A for base-files are being moved to B but are
searched still in A directory.

We were discussing this issue with Joshua, but i'm not an expert in
this matter...

BR
Piotr

pon., 10 lut 2025 o 14:42 Richard Purdie
<richard.purdie@linuxfoundation.org> napisa=C5=82(a):
>
> On Mon, 2025-02-10 at 13:50 +0100, Piotr =C5=81obacz via lists.openembedd=
ed.org wrote:
> > Currently SPDXDIR is pointing to `${WORKDIR}/spdx` which means that the=
 by-id
> > and by-namespace SPDX files are created without differentiation between=
 machines.
> > This means that for two machines using a common package architecture
> > (e.g. genericx86-64 and qqemux86-64), there would be overlapping files.=
 This means
> > that the build of one can remove files from the other leading to build =
failures. An
> > example would be:
> >
> > MACHINE=3Dqemux86-64 bitbake core-image-minimal
> > MACHINE=3Dgenericx86-64 bitbake core-image-minimal
> > MACHINE=3Dqemux86-64 bitbake linux-yocto -c clean
> > MACHINE=3Dgenericx86-64 bitbake core-image-minimal -C rootfs
> >
> > To fix this, add MACHINE_ARCH to the SPDXDIR path used for the files in=
 order
> > to differentiate packages' dependencies between machines.
> >
> > This commit fixes issue repored by Khem [1]
> >
> > [1] https://patchwork.yoctoproject.org/comment/13577/
> >
> > Signed-off-by: Piotr =C5=81obacz <pio.lobacz@gmail.com>
> > ---
> >  meta/classes/create-spdx-2.2.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create=
-spdx-2.2.bbclass
> > index ade1a04be3..9e228891ab 100644
> > --- a/meta/classes/create-spdx-2.2.bbclass
> > +++ b/meta/classes/create-spdx-2.2.bbclass
> > @@ -11,7 +11,7 @@ DEPLOY_DIR_SPDX ??=3D "${DEPLOY_DIR}/spdx"
> >  CVE_PRODUCT ??=3D "${BPN}"
> >  CVE_VERSION ??=3D "${PV}"
> >
> > -SPDXDIR ??=3D "${WORKDIR}/spdx"
> > +SPDXDIR ??=3D "${WORKDIR}/spdx/${MACHINE_ARCH}"
> >  SPDXDEPLOY =3D "${SPDXDIR}/deploy"
> >  SPDXWORK =3D "${SPDXDIR}/work"
> >  SPDXIMAGEWORK =3D "${SPDXDIR}/image-work"
>
> I suspect this is going to cause other challenges since the task stamp
> isn't machine specific as far as I know but this change would require
> it to be and force all of the SPDX tasks to be machine specific.
>
> Cheers,
>
> Richard

