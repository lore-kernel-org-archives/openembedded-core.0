Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80422C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 17:51:11 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.58497.1739209863775063795
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 09:51:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UoYwJ0N6;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-545074b88aaso1937296e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 09:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739209862; x=1739814662; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyWPbNjVf/4v8xNLt7sPZe0smmT8nJHsJB9C6Fwn9E0=;
        b=UoYwJ0N61pnpmIWPXCJK9JowhkKGJOW9BtXsZz+wkT12iXniZn4eAgv/N54VSF+Hkk
         eePmC02JrXZva2Y9TlMaQy0jsfW1p5XD8N95zXmQM6h/q9FN50uZKy2e49tsDBq5LLA/
         5uZh/b+TI/a/Xq0/b8RC0tAtUl0dCb6J5vFDDErFLR2CesHWuKRpkOcR3VgfiYUcjoRQ
         UAZlhDt5pwgY0jru15O39DZIwk9gflhVpUH1nD+BToVf7tuByilyCmhpbCqMfScsrsF+
         MAKAKKWZ4DF+MDRP+VFhoQN+KVdS20zPg1k++V1wDB9YcvG07ulpqUiD9xo5DjLg2tr/
         Yq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739209862; x=1739814662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyWPbNjVf/4v8xNLt7sPZe0smmT8nJHsJB9C6Fwn9E0=;
        b=XfYyxV64H3HNzZmi3xrwUzY6vuid1Y7KdS8fYQ/C9yfk87HZXGRMl44DAV76u5IgBW
         m+1uIfw48XPN3chPSHYfu7ka8wKi/MBQwTZpssFggkIkwDfSvDpJaSTVhE+LYEt/DuuP
         9gJFk5qlcIQ8fx3in+sRpBSXENxwzqQhU1CZVXVvF0WwnQp3or3tCspGQfI51luPP8f1
         RaMbB5c8IF2qw9DPalYNpLwQ8H+tQRdOzvpFSCug5MOa9a9sPQKljd0ZjtUgehf9lI3l
         g1L949eSe6VaHT9GUhYpAybZSTKo+n32Q011z+/HIx5uCXsn3XoYcIPLYUdlkj2eVoOX
         g0wg==
X-Forwarded-Encrypted: i=1; AJvYcCWw6lo8802xdognHyXqlFkS2rOU/4+wxB5OiNI5vCil+n6HorZGUtZFDFxVf8JDbhTmHjQ62zFzSm+gLct+xdc2Yw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yycm0LPtrQIiW/JAYSuOjI/FyZCKzUtdCjYNGEaZha9dr/T0tP2
	WluywLhjFZtsZjB6Ldoqr5+s4W06ej4ewOaJC1flCZoOI39BSMBZHNSmRTYZwszk2KIxd8lSKXA
	Iu36XTwMomtKvUnFCatlLUGU6/vQ=
X-Gm-Gg: ASbGncuo43+iyUF2EZ8iwHUXNGXOdGn6dNCV5jGQVUpVomuyLUxfs2yaGFbQCX5W0Bj
	xqY2FLk68wstrhRiUYN7m0tJ2wO8gHZmPW9OSEU74wSpAGjrW99fATXXvCrMqaOYNiVI8GK8Stx
	mDfKONXfXF5Ok=
X-Google-Smtp-Source: AGHT+IGotIPKx+33w9C+iDKDMnCEonjjC9urmyDyk2HuRWdB2vhu0v4Efmlc2jd1wlsvaGmScIxG2yFP+GagiIGjtt4=
X-Received: by 2002:ac2:58ee:0:b0:545:93b:30bf with SMTP id
 2adb3069b0e04-545093b314cmr1731691e87.41.1739209861580; Mon, 10 Feb 2025
 09:51:01 -0800 (PST)
MIME-Version: 1.0
References: <20250210125047.2644290-1-pio.lobacz@gmail.com>
 <3980bb85057c3c2402714d4c51676d628bf2ef52.camel@linuxfoundation.org> <CAH6NA5u+8U6ZWFFas0-S=Faq+7tiSs650MR7k9W_80Uxm=gOWg@mail.gmail.com>
In-Reply-To: <CAH6NA5u+8U6ZWFFas0-S=Faq+7tiSs650MR7k9W_80Uxm=gOWg@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 10 Feb 2025 10:50:48 -0700
X-Gm-Features: AWEUYZkO8x4e3x-oh5oAWmIu2Wu_8KiiynV4xBEBtl-udVEbvFAUVi_kfj6yfx4
Message-ID: <CAJdd5GbUo6ckemc6GEsf=TdaMKPbK+V-zCNqPSWTV1_x3PdrdA@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 17:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211111

Piotr,

I think with the provided example I can look into this. I suspect it
will be a little more involved than adding MACHINE_ARCH

On Mon, Feb 10, 2025 at 9:58=E2=80=AFAM Piotr =C5=81obacz <pio.lobacz@gmail=
.com> wrote:
>
> Actually this was just an issue with the path to the deps.json file.
> which was containing all the dependencies and in case of different
> machine
> for packages like e.g. base-files this file was containing bad
> dependency, meaning that if i'm building first machine A, than B,
> the spdx files from A for base-files are being moved to B but are
> searched still in A directory.
>
> We were discussing this issue with Joshua, but i'm not an expert in
> this matter...
>
> BR
> Piotr
>
> pon., 10 lut 2025 o 14:42 Richard Purdie
> <richard.purdie@linuxfoundation.org> napisa=C5=82(a):
> >
> > On Mon, 2025-02-10 at 13:50 +0100, Piotr =C5=81obacz via lists.openembe=
dded.org wrote:
> > > Currently SPDXDIR is pointing to `${WORKDIR}/spdx` which means that t=
he by-id
> > > and by-namespace SPDX files are created without differentiation betwe=
en machines.
> > > This means that for two machines using a common package architecture
> > > (e.g. genericx86-64 and qqemux86-64), there would be overlapping file=
s. This means
> > > that the build of one can remove files from the other leading to buil=
d failures. An
> > > example would be:
> > >
> > > MACHINE=3Dqemux86-64 bitbake core-image-minimal
> > > MACHINE=3Dgenericx86-64 bitbake core-image-minimal
> > > MACHINE=3Dqemux86-64 bitbake linux-yocto -c clean
> > > MACHINE=3Dgenericx86-64 bitbake core-image-minimal -C rootfs
> > >
> > > To fix this, add MACHINE_ARCH to the SPDXDIR path used for the files =
in order
> > > to differentiate packages' dependencies between machines.
> > >
> > > This commit fixes issue repored by Khem [1]
> > >
> > > [1] https://patchwork.yoctoproject.org/comment/13577/
> > >
> > > Signed-off-by: Piotr =C5=81obacz <pio.lobacz@gmail.com>
> > > ---
> > >  meta/classes/create-spdx-2.2.bbclass | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/crea=
te-spdx-2.2.bbclass
> > > index ade1a04be3..9e228891ab 100644
> > > --- a/meta/classes/create-spdx-2.2.bbclass
> > > +++ b/meta/classes/create-spdx-2.2.bbclass
> > > @@ -11,7 +11,7 @@ DEPLOY_DIR_SPDX ??=3D "${DEPLOY_DIR}/spdx"
> > >  CVE_PRODUCT ??=3D "${BPN}"
> > >  CVE_VERSION ??=3D "${PV}"
> > >
> > > -SPDXDIR ??=3D "${WORKDIR}/spdx"
> > > +SPDXDIR ??=3D "${WORKDIR}/spdx/${MACHINE_ARCH}"
> > >  SPDXDEPLOY =3D "${SPDXDIR}/deploy"
> > >  SPDXWORK =3D "${SPDXDIR}/work"
> > >  SPDXIMAGEWORK =3D "${SPDXDIR}/image-work"
> >
> > I suspect this is going to cause other challenges since the task stamp
> > isn't machine specific as far as I know but this change would require
> > it to be and force all of the SPDX tasks to be machine specific.
> >
> > Cheers,
> >
> > Richard

