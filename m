Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D87CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 16:56:37 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.2264.1759337794682556944
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 09:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GTJm/5Yd;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71d71bcac45so1438537b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 09:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759337794; x=1759942594; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ByDSpJskjZ4ZyF2COa7mNS+MrhFGJzqr2L4SA1HNczs=;
        b=GTJm/5YdGgm4MDth0FjlMzJbne6RKcPdP7ZpaDbO1AM8i+3CY7ZomBLzDBVtzu5sid
         GzkgPbuKNfVhshgTBwXT1h4w257K90gHTHa+SpvcjZ7FOF76c5rEZocezMrTX5Afub3K
         F8BOSLGaGDze9/7Z/04OvIOT221+evvESmPlck/SjdwmbEeWU+uFvEHKAUedv/pbkUFi
         lY+j42BcpO+xOcVTESC4k+qkWkkUDavo1FNhg36zlu03UDpNQTzExgXgssF0wpSbK6kY
         6qWHLkxUEmOQlVk3rytu0ysefK+xx3/VW/04P1g+coIEjD/qGmdrHuTDJG7ydwzO0xDu
         GLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759337794; x=1759942594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByDSpJskjZ4ZyF2COa7mNS+MrhFGJzqr2L4SA1HNczs=;
        b=ZShp6scsd0A5uPrDeGJApqV4nhbm1ZbYhEMZmewVp+Umbve+6euSFWMfP45oJbHp2J
         CDHK+7xRynBchAXIdm8EV8dxQuAyNeZtcfUUPF0551oNsau+Dvxw00HHFX3uE9a3k4Ol
         NROrmPShvDxF62ans6dBCulnGbL4HuR0XRxvVuD8FRAPehuFWtfwhujYWBmEqDWyWfVz
         4hMI4SBwDa5j6/5Kbds2pqWXD/vSYm3g4269MZDhZPBW2hFSYkF19mCRuM6iuYQ4H4cM
         hzp/x6epSc8sCO1VJmGoMsDeS/jRKxIPMhpPg2bPPaRYUNNI+GNCl1Qey9S8hj1M6TQ9
         vkVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7fx3bPq2KEV3lQbpmO3pA8q2kp3TufZhZDX545hRXCgWC5HbTxMX9ey6y/8MM5sX2r2j85FOHCSXVSzev1JygbA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwrOmqmAl/F7/Tus68etdTKkBqkso/73mLZniis1oyslooVOSky
	BbjMVsfZkhaZEmOVaUu9tDiapMGnM6ZRNsYToXJt577vxhUu64JhddDT8MIA2bwYCFxG3PNxZfG
	nuUd2yuI8sbKjPmG2+tHGV+SXPbJ5ep4=
X-Gm-Gg: ASbGncvwZsgdKooonYeR0By+PygsgJaj1qDlw9O/M4QOo+cd9RUHo9rAPQjEXAHFw/f
	dNjS72QPNeQSjosslTcKyKll8zIXInHKh8DA503hnXhiy+b4w4O2JaFgNHztDvf3vJvUrQkf0NA
	Zzh7ntr2R6NcFXxZYQIj5FKX2jtYQ8t89hKGr5jMtRu2YtomBffsYtYa5APoIkinG7T1bdiEYgD
	oM0KCiMG0v/RYyVa3aCYunwfJrtP1ASw+oMHrTuCV8oq9GhZE+S46lRp5I+mIK7Y3X5MrLVp7/u
	3O9ujoJ9zDhOC/+OaPyRCQGIod4uXxcQ5uhbOUv0cl1OxdFh
X-Google-Smtp-Source: AGHT+IGX8DCBiUiVgOk09Qb8KY/1Xs+kG9jJlY3qzTI3CxIpI93ZUTaX+cOw+jfrzB6inJlJ9gw3Ii29JVFxGUVGGUE=
X-Received: by 2002:a53:ac48:0:b0:636:3ff2:c89d with SMTP id
 956f58d0204a3-63b6ff23927mr4699166d50.20.1759337793668; Wed, 01 Oct 2025
 09:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250930123901.949798-1-Harish.Sadineni@windriver.com>
 <d04d310ec882ddea6f9578eeb65d99cfae1abe69.camel@linuxfoundation.org>
 <93d2d7a5-a6c7-4b0c-ad89-01be28b407ed@windriver.com> <d63a917901287e45aeee4b6b256615537124c2a6.camel@linuxfoundation.org>
In-Reply-To: <d63a917901287e45aeee4b6b256615537124c2a6.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Oct 2025 09:56:06 -0700
X-Gm-Features: AS18NWCVK21ywyqYTFCQ7k5VNPolZrvbcKXAT2AsJI_9HGo2xZIAZnjMrXpS2hk
Message-ID: <CAMKF1sqqwTwN2z1=rFbUVgFm3sFdd48MvtXPt3=B5_+MZJi26Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] binutils-cross-canadian: Add missing perl
 mpodules to RDEPENDS
To: richard.purdie@linuxfoundation.org
Cc: Harish Sadineni <Harish.Sadineni@windriver.com>, openembedded-core@lists.openembedded.org, 
	Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 16:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224312

On Wed, Oct 1, 2025 at 2:57=E2=80=AFAM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> On Wed, 2025-10-01 at 14:17 +0530, Harish Sadineni wrote:
> >  On 9/30/2025 7:17 PM, Richard Purdie wrote:
> >  On Tue, 2025-09-30 at 05:39 -0700, Sadineni, Harish via lists.openembe=
dded.org wrote:
> > > > From: Harish Sadineni <Harish.Sadineni@windriver.com>
> > > >
> > > > In sdk while running "x86_64-poky-linux-gp-display-html --help" giv=
es
> > > > following error:
> > > > $sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux->
> > > > ./x86_64-poky-linux-gp-display-html --help
> > > > Can't locate bigint.pm in @INC (you may need to install the bigint =
module
> > > >
> > > > By adding the following perl modules to RDEPENDS fixes the above er=
rors:
> > > >   nativesdk-perl-module-bignum
> > > >   nativesdk-perl-module-bigint
> > > >   nativesdk-perl-module-math-bigint
> > > >
> > > > Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> > > > ---
> > > >  meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian=
.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> > > > index 7d7ffe92ce..9dc73fbdf1 100644
> > > > --- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> > > > +++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> > > > @@ -5,6 +5,7 @@ PN =3D "binutils-cross-canadian-${TRANSLATED_TARGET=
_ARCH}"
> > > >  BPN =3D "binutils"
> > > >
> > > >  DEPENDS =3D "flex-native bison-native virtual/nativesdk-cross-cc v=
irtual/nativesdk-libc nativesdk-zlib nativesdk-gettext nativesdk-flex"
> > > > +RDEPENDS:${PN} +=3D "nativesdk-perl-module-bignum  nativesdk-perl-=
module-bigint nativesdk-perl-module-math-bigint"
> > > >  EXTRA_OECONF +=3D "--with-sysroot=3D${SDKPATH}/sysroots/${TUNE_PKG=
ARCH}${TARGET_VENDOR}-${TARGET_OS} \
> > > >                  --enable-poison-system-directories \
> > > >                  "
> > > >
> > > This is probably the right direction but shouldn't this be for the
> > > gprofng package rather than ${PN}?
> > >
> > Hi Richard,
> >
> >  In the SDK at $sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-
> > poky-linux, the script "x86_64-poky-linux-gp-display-html" is not
> > pulled or packaged by the gprofng package.
> >  Instead, it is installed as part of the binutils-cross-canadian
> > package.
> >
> > Adding the perl module dependencies to gprofng package will not
> > resolve this issue , it would be effective only if "nativesdk-
> > gprofng" is explicitly installed by the user.
> >
>
> Fair enough. Should x86_64-poky-linux-gp-display-html not be part of
> the gprofng package though? Perhaps we should change it to be packaged
> there, then add the dependency to that?

right, that would make it live with the right set of sub-package as well.

>
> Cheers,
>
> Richard
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224204): https://lists.openembedded.org/g/openembedde=
d-core/message/224204
> Mute This Topic: https://lists.openembedded.org/mt/115512852/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

