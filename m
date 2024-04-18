Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E02C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 18:48:13 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.2024.1713466091692304417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Apr 2024 11:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=bz+kEfQG;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.180, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c709e5e4f9so823329b6e.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 11:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713466091; x=1714070891; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vsJ+omXYhjljcINmvyemIMJ8mqYCSt56W04ZweinBU=;
        b=bz+kEfQGz/oLPv27/aH+j2oGvBtTv2v21Md6EryK9b1kig0EbIhhpohcLi/Kuceqn3
         asq+v1jLZvpaoo9QhOi58tfpefuFeE4NZ3nPu8zSNWbX2CeKQhGk+hXmvNdNB2wunZGv
         q3XawwPAgdwE0vFp9TaClL19wM115BYNYpMs0rb+N8lFz8ruzUTXQAkOZINMb4xu1KTU
         l8mojRKdzk9CAbeY79XbSa7oM7k7aUpYfe9+EbC1AjMiPbSP87G0UhXUdauqQkmEY1cO
         eIL11tjhazYp2aHtrVNyIqru5nvNV8pJmhnGPK0GPX6LAlq5rYl3rrIjm9JILsQOucWE
         nfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713466091; x=1714070891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vsJ+omXYhjljcINmvyemIMJ8mqYCSt56W04ZweinBU=;
        b=CIk5cpG++7at0kW1qGQizkr3RTVQmiZZaDRV4vUp/xjdSrUigs7OlTPtINKx+B0SGz
         P9zwfeSmBWNcJTiyTEEL2oVu+fcCjVLepSw31fjKseAQ80FS/kD7AP7gTi7Eqnj93UYQ
         T3qNVUuyv9kCkdeCm2lG2ClQAGXYqT13NAEGfHVOwhK96u1KahrtTDRfrmVyf+cyl4zc
         qH7MDnEqVkWlueEaiWofY+3PwGDILpDgsH0cICeQZ0YyDG3/QkbOTg8itrX3UkxWnBDj
         H6sP/vxphuQGhk1I6qVOy3bzao4yK0zJ28lJGbu35RITo0z6HE702aXs6tw6xkM6N24c
         iDUQ==
X-Gm-Message-State: AOJu0YzUWdluoO9PH7ka70XRqft1e4T0xXjkIBp82XliQX88AI7hTcdD
	/rO3z8VwIkC68+FrGSmFUPu7yHVTv5igCi9Waa9fDQW/ZbteP2Fqlu9WGm4B/Iup9c1+SqcUi4+
	0SxcZhKuFOONwV4oNCib5YP8p8EDnlTzQLddN
X-Google-Smtp-Source: AGHT+IGfm66wPJKlxnhgxcmY9Od7CizuWvFUyIjV7aCd+Y1ANdLZnCcxRfuQjaXgXrzZk8PB7MpX+NoEJAtNcBV50hQ=
X-Received: by 2002:a05:6871:3a10:b0:22e:a036:c33a with SMTP id
 pu16-20020a0568713a1000b0022ea036c33amr4608658oac.6.1713466090963; Thu, 18
 Apr 2024 11:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240418155558.3399658-1-jdmason@kudzu.us> <CANNYZj8dwnv61TtHj5F5F1rAthb_ucYgkLMocc101YsTs7QVOQ@mail.gmail.com>
In-Reply-To: <CANNYZj8dwnv61TtHj5F5F1rAthb_ucYgkLMocc101YsTs7QVOQ@mail.gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Thu, 18 Apr 2024 14:48:00 -0400
Message-ID: <CAPoiz9z4h=6r=wX5DqDR5ywDkFf6tKywCcb=e_97ZDmrjE1Zvg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo-c: add UPSTREAM_CHECK
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 18:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198523

On Thu, Apr 18, 2024 at 1:17=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I have a patch for bitbake that solves the general problem of checking
> latest crate versions from crate:// URIs (and fixes cargo-c check as a
> result):
>
> https://git.yoctoproject.org/poky-contrib/commit/?h=3Dakanavin/package-ve=
rsion-updates&id=3D6afcb9100b8d99fabcad70afb4f37628a2f62cc6
>
> So this patch is unneeded.
>
> Alex

Push it already :)

With those changes, I think all of the UNKOWN_BROKEN stuff is out of OE Cor=
e.

Thanks,
Jon

> On Thu, 18 Apr 2024 at 17:56, Jon Mason via lists.openembedded.org
> <jdmason=3Dkudzu.us@lists.openembedded.org> wrote:
> >
> > Add logic to check the upstream version of cargo-c from the github
> > account the crate is based on.  Unfortunately, this is an inexact match
> > of the versioning, as the crate expects the cargo version as part of th=
e
> > version.  For example, the current version is "0.9.30+cargo-0.77.0",
> > whereas the latest tagged version is "0.9.31".  So, even if the version=
s
> > matched exactly, the `devtool check-upgrade-status cargo-c-native` will
> > show a mismatch.  I think this is better than disabling the check or
> > having devtool return broken.  So, leaving this idiosyncrasy as-is.
> >
> > NOTE: https://crates.io/crates/cargo-c/versions would be a better place
> > to get the latest version (and would match the expected cargo
> > versioning), but creates.io seems to require javascript and any attempt
> > to wget that webpage returns 404.
> >
> > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > ---
> >  .../rust/cargo-c-native_0.9.30+cargo-0.77.0.bb                 | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/rust/cargo-c-native_0.9.30+cargo-0.7=
7.0.bb b/meta/recipes-devtools/rust/cargo-c-native_0.9.30+cargo-0.77.0.bb
> > index 8e17606b73dd..eaa51a8d2565 100644
> > --- a/meta/recipes-devtools/rust/cargo-c-native_0.9.30+cargo-0.77.0.bb
> > +++ b/meta/recipes-devtools/rust/cargo-c-native_0.9.30+cargo-0.77.0.bb
> > @@ -9,6 +9,9 @@ SRC_URI =3D "crate://crates.io/cargo-c/${PV};name=3Dcar=
go-c"
> >  SRC_URI[cargo-c.sha256sum] =3D "ec77e3635cdb0d211f88f22d0460eef0ba031e=
b616ded57f2ffb98a90365c445"
> >  S =3D "${CARGO_VENDORING_DIRECTORY}/cargo-c-${PV}"
> >
> > +UPSTREAM_CHECK_URI =3D "https://github.com/lu-zero/cargo-c/releases/"
> > +UPSTREAM_CHECK_REGEX =3D "releases/tag/v?(?P<pver>\d+(\.\d+)+)"
> > +
> >  inherit cargo cargo-update-recipe-crates pkgconfig native
> >
> >  DEPENDS =3D "openssl curl"
> > --
> > 2.30.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#198520): https://lists.openembedded.org/g/openembed=
ded-core/message/198520
> > Mute This Topic: https://lists.openembedded.org/mt/105600795/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

