Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD37C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 10:32:40 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.6897.1739437155181698638
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 00:59:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OCKUby49;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: pio.lobacz@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5de38c3d2acso1004012a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 00:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739437153; x=1740041953; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsEHsTORVQXuRaaFA9Sris37kN46utCxC8WmahRAD08=;
        b=OCKUby49WrliTgco+6RP4c81UFyisK71XaARvoPimD2Vp4QQrGs0TTudSWrMHZr9Iv
         FhU/Yu9IIBO4+EQBXZAJWa0uYrfzSA9022KkLkltbaiVI9xfrqKjvoV2rw+pgdcaO6vy
         RRRO++UHdpPNChGyHkLCPYVsKxq98hl07/Yevkq702+kGKCltU1Hbd43GUR0UlcFMg5s
         Z3mRL8i2GwqiYJxE1vBq7kiEMXB8oH8gcJY2ctj4FKugFXq00DstrumWxnOclD5NekGW
         24C/pNbMS8HM6Ne0cBtfzBVLn7eE5QI+4opu05KkMhYPj5muySReA2TcctZ3ckgHcCsO
         J3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739437153; x=1740041953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AsEHsTORVQXuRaaFA9Sris37kN46utCxC8WmahRAD08=;
        b=FuMOoyuby8Q1cYSjf/J2JYxDeTjLQ5JRZGuxUd81k7daymdhTOwkMYFJEqAyR6cKke
         JeWsy01Tcf4/Fo9LUPeasbAUhoRCRjK5volAwp+9RbNfgg09HzRYbgDPQ/F8lNj+zFn/
         rDXD1hvW67TpNhx6aqZClAB7ej39l+vnufbLBjcEPgaGcjUribGLvupUmwyHeXUo4h75
         o2drd9D6HK3RKpwq6dHgJC0M/1KVOdtod/eEWjXExajxcoblFkoV+nU2+/FY8Q8nEcJT
         3lwNUpoySnKrCmE3pmF5gXpGbTsuWkSLPsjhuMivAHqF4CZJ8OpWLmQOdp8Bigvd0cAC
         NzZg==
X-Forwarded-Encrypted: i=1; AJvYcCXgUhGbC/qzD6lzmuUIJcuPiPuAjJTF30J+dophYUlKXBKHAR/nNaw3fJv74UuBtadP9wICyQQYqIWnNwyc7B6R9g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxyS0JF+EZ6sgAlVCxBepB+B1xNgWL4uLaac/NZZ8uKrQFDPlly
	3olD0yHXOaNCCiQEe3oICxuS8sU889nP/oVXOmwVEwWVsXw7NxAKk3dY0VqbB2Ss0dKlp0wnREV
	GTtNE3S7VhT6etJdDm0wEJgFWv+U=
X-Gm-Gg: ASbGnctOK9lKUrrt0dLtDhLDRY1ONGV1q0LTTPP/MtdEf0BokWbGgB4AZOdjcDNPsG8
	mP4MiF1a6oV4TPGLEzwYwTgd3gmqaPiG0CkETwJRnuRbNOkzLF4eH8oFW4Bye+Bp1jwkdLnFh/A
	==
X-Google-Smtp-Source: AGHT+IG9oIZ2IFyDlYE+Irg+0QmUea9mUATpZjPOgFj5sO05ML6US5bnFjO3gADljzbUyHq8jl4g4hVZV5UqgECBDRc=
X-Received: by 2002:a05:6402:2546:b0:5de:bc13:6c65 with SMTP id
 4fb4d7f45d1cf-5debc137058mr3562945a12.14.1739437153290; Thu, 13 Feb 2025
 00:59:13 -0800 (PST)
MIME-Version: 1.0
References: <20250210125047.2644290-1-pio.lobacz@gmail.com>
 <3980bb85057c3c2402714d4c51676d628bf2ef52.camel@linuxfoundation.org>
 <CAH6NA5u+8U6ZWFFas0-S=Faq+7tiSs650MR7k9W_80Uxm=gOWg@mail.gmail.com>
 <CAJdd5GbUo6ckemc6GEsf=TdaMKPbK+V-zCNqPSWTV1_x3PdrdA@mail.gmail.com>
 <CAH6NA5tx+P0cTcG05rUPxD3+shAdWD9kbsL=+KQ8BY3Wq7=aLg@mail.gmail.com>
 <CAJdd5GZk8Q3cvGO6rdCSj2UzdvFhZ=wr=WHBiHHXJUe_fQu0ug@mail.gmail.com> <CAH6NA5se_XfH5VWguTp2uGoqUNqUViJgKkJqzXbk=VkS3BN12A@mail.gmail.com>
In-Reply-To: <CAH6NA5se_XfH5VWguTp2uGoqUNqUViJgKkJqzXbk=VkS3BN12A@mail.gmail.com>
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <pio.lobacz@gmail.com>
Date: Thu, 13 Feb 2025 09:59:01 +0100
X-Gm-Features: AWEUYZlR2U_CCvqx4UH1tmFRS-yVDnmJ4HM1C_FIYvg02kSuoiet2AEqeKZU_mc
Message-ID: <CAH6NA5sb-ExeDF-Mh-jjdiEfck9eZMqn2+70YWja=pagc0VM3A@mail.gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211323

If you want I can disable on my side this patch in order to reproduce
it and copy paste the files to which are causing the issue.

czw., 13 lut 2025 o 09:56 Piotr =C5=81obacz <pio.lobacz@gmail.com> napisa=
=C5=82(a):
>
> Nope. It is on the scarthgap and I have set it in the subject when git
> send-mail, but somehow it has been cut...
>
> =C5=9Br., 12 lut 2025 o 23:07 Joshua Watt <jpewhacker@gmail.com> napisa=
=C5=82(a):
> >
> > Based on this patch, I'm guessing you're not working off of master?
> > The patch doesn't apply to the latest master version because a lot of
> > the variables in create-spdx-2.2 were moved to spdx-common.bbclass.
> >
> > I tried the reproduction steps on master and it seems to work OK, but
> > I'll keep trying; can you provide what branch/commit you are working
> > on and we can possible figure out what fix might be needed if it is
> > already fixed on master?
> >
> > On Mon, Feb 10, 2025 at 1:51=E2=80=AFPM Piotr =C5=81obacz <pio.lobacz@g=
mail.com> wrote:
> > >
> > > Sure Joshua,
> > > I hope it won't be much extra work, as I have this patch already appl=
ied
> > > and it is working for me without any issues.
> > >
> > > BR
> > > Piotr
> > >
> > > pon., 10 lut 2025 o 18:51 Joshua Watt <jpewhacker@gmail.com> napisa=
=C5=82(a):
> > > >
> > > > Piotr,
> > > >
> > > > I think with the provided example I can look into this. I suspect i=
t
> > > > will be a little more involved than adding MACHINE_ARCH
> > > >
> > > > On Mon, Feb 10, 2025 at 9:58=E2=80=AFAM Piotr =C5=81obacz <pio.loba=
cz@gmail.com> wrote:
> > > > >
> > > > > Actually this was just an issue with the path to the deps.json fi=
le.
> > > > > which was containing all the dependencies and in case of differen=
t
> > > > > machine
> > > > > for packages like e.g. base-files this file was containing bad
> > > > > dependency, meaning that if i'm building first machine A, than B,
> > > > > the spdx files from A for base-files are being moved to B but are
> > > > > searched still in A directory.
> > > > >
> > > > > We were discussing this issue with Joshua, but i'm not an expert =
in
> > > > > this matter...
> > > > >
> > > > > BR
> > > > > Piotr
> > > > >
> > > > > pon., 10 lut 2025 o 14:42 Richard Purdie
> > > > > <richard.purdie@linuxfoundation.org> napisa=C5=82(a):
> > > > > >
> > > > > > On Mon, 2025-02-10 at 13:50 +0100, Piotr =C5=81obacz via lists.=
openembedded.org wrote:
> > > > > > > Currently SPDXDIR is pointing to `${WORKDIR}/spdx` which mean=
s that the by-id
> > > > > > > and by-namespace SPDX files are created without differentiati=
on between machines.
> > > > > > > This means that for two machines using a common package archi=
tecture
> > > > > > > (e.g. genericx86-64 and qqemux86-64), there would be overlapp=
ing files. This means
> > > > > > > that the build of one can remove files from the other leading=
 to build failures. An
> > > > > > > example would be:
> > > > > > >
> > > > > > > MACHINE=3Dqemux86-64 bitbake core-image-minimal
> > > > > > > MACHINE=3Dgenericx86-64 bitbake core-image-minimal
> > > > > > > MACHINE=3Dqemux86-64 bitbake linux-yocto -c clean
> > > > > > > MACHINE=3Dgenericx86-64 bitbake core-image-minimal -C rootfs
> > > > > > >
> > > > > > > To fix this, add MACHINE_ARCH to the SPDXDIR path used for th=
e files in order
> > > > > > > to differentiate packages' dependencies between machines.
> > > > > > >
> > > > > > > This commit fixes issue repored by Khem [1]
> > > > > > >
> > > > > > > [1] https://patchwork.yoctoproject.org/comment/13577/
> > > > > > >
> > > > > > > Signed-off-by: Piotr =C5=81obacz <pio.lobacz@gmail.com>
> > > > > > > ---
> > > > > > >  meta/classes/create-spdx-2.2.bbclass | 2 +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/clas=
ses/create-spdx-2.2.bbclass
> > > > > > > index ade1a04be3..9e228891ab 100644
> > > > > > > --- a/meta/classes/create-spdx-2.2.bbclass
> > > > > > > +++ b/meta/classes/create-spdx-2.2.bbclass
> > > > > > > @@ -11,7 +11,7 @@ DEPLOY_DIR_SPDX ??=3D "${DEPLOY_DIR}/spdx"
> > > > > > >  CVE_PRODUCT ??=3D "${BPN}"
> > > > > > >  CVE_VERSION ??=3D "${PV}"
> > > > > > >
> > > > > > > -SPDXDIR ??=3D "${WORKDIR}/spdx"
> > > > > > > +SPDXDIR ??=3D "${WORKDIR}/spdx/${MACHINE_ARCH}"
> > > > > > >  SPDXDEPLOY =3D "${SPDXDIR}/deploy"
> > > > > > >  SPDXWORK =3D "${SPDXDIR}/work"
> > > > > > >  SPDXIMAGEWORK =3D "${SPDXDIR}/image-work"
> > > > > >
> > > > > > I suspect this is going to cause other challenges since the tas=
k stamp
> > > > > > isn't machine specific as far as I know but this change would r=
equire
> > > > > > it to be and force all of the SPDX tasks to be machine specific=
.
> > > > > >
> > > > > > Cheers,
> > > > > >
> > > > > > Richard

