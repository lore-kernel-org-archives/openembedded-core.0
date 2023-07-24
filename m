Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7711AC001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 20:16:49 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.4818.1690229800341802501
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 13:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LI2+O7Nz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so46794555e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 13:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690229799; x=1690834599;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SaP0V4TD3joXot2SvI6S4EuF1xg0ukPsTSxkpFTEr34=;
        b=LI2+O7Nzll+RLZj5Vu2clcF/zP1JpteGlHoSeBszUU3O/LSyWHoHJvXooNIG0/FgbJ
         hhjc9qViPEskXIB60+YhUp8fnmcYdODuMYH7XCX834oSqevOdY2kx9R1FlBAmHMqs/Xq
         +3ToWTw+8hX0FgwsCwzvR0Nv4JSYxhMpbJMAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690229799; x=1690834599;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SaP0V4TD3joXot2SvI6S4EuF1xg0ukPsTSxkpFTEr34=;
        b=FexxlBdeZ/RfLnkOfRXzCm2LIgjHlzeeM8nFR4CoVBEWL6fb92t0SFkqB4ZreApYog
         oXB5zMz0UlbuOWk7UKRVgQjCU0YnDNf9FfDy8wPsS2AYo7J4kV7LuFDNPL1ukPjUb0mF
         YhNjt7P3PCK478GEsBZapxBjAf/SUk30FLtIJ1F/nG1QsbPIKm5c88TaqAFDyd5vu/Wu
         cZML+8JglHDEXFrPJbq2EEHPUoG0YrgBK54pxqacTCYQKo3iHMHZ/OtkEtEo0D21Ors6
         uf1Aane01tYXm1MVPVHSOB1n9kFCK4nUb8ONIBGB1YQJamB9u8KiGP7FI+GeyKRQSihU
         VB5A==
X-Gm-Message-State: ABy/qLZNAnkKB647U+E9Hn+sO4FeegMIK7sC5cgvud1c85tlR+jB23MI
	pOyZIRfH61EUsVOGUZeQQJwfVg==
X-Google-Smtp-Source: APBJJlFEUu00n90VGgIr6LaYaYJonkoEJZ3GShuVZpJEZxGZSFlW/6/2TxVGzxemsxlsH6AeqUOpsQ==
X-Received: by 2002:a7b:c315:0:b0:3fc:80a:cf63 with SMTP id k21-20020a7bc315000000b003fc080acf63mr9599415wmj.38.1690229798775;
        Mon, 24 Jul 2023 13:16:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:42df:c474:f29d:a4f9? ([2001:8b0:aba:5f3c:42df:c474:f29d:a4f9])
        by smtp.gmail.com with ESMTPSA id w3-20020a05600c014300b003fc05b89e5bsm11002840wmm.34.2023.07.24.13.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 13:16:38 -0700 (PDT)
Message-ID: <fdd49f8d5f6bbf5814b9b27a400f16d367ced3ae.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rpm: Install and/or tweak rpm macros file to
 make rpmbuild work
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?B=F6sz=F6rm=E9nyi_Zolt=E1n?= <zboszor@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Ross Burton <Ross.Burton@arm.com>
Date: Mon, 24 Jul 2023 21:16:37 +0100
In-Reply-To: <b000bd79-9788-5345-eaee-b50f27d2fe45@gmail.com>
References: <20230724123529.288581-1-zboszor@gmail.com>
	 <0a32f2ba6a3d55a160423da13ffc3e3f30a1e02a.camel@linuxfoundation.org>
	 <b000bd79-9788-5345-eaee-b50f27d2fe45@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 20:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184807

On Mon, 2023-07-24 at 20:13 +0200, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n w=
rote:
> 2023. 07. 24. 17:59 keltez=C3=A9ssel, Richard Purdie =C3=ADrta:
> > On Mon, 2023-07-24 at 14:35 +0200, Zoltan Boszormenyi wrote:
> > > Some BSP architecture builds (e.g. genericx86-64 or anything from
> > > meta-intel) don't have their /usr/lib/rpm/platform/<arch>-linux
> > > directories. This causes rpmbuild fail on the target machine.
> > >=20
> > > Use ${SDK_ARCH}-linux as the base arch which likely exists in
> > > /usr/lib/rpm/platform and clone it as ${MACHINE_ARCH}-linux.
> > >=20
> > > Also, fix %_lib and %_libdir in the new cloned platform directory
> > > to use ${baselib} and ${libdir} so the RPM package contents will
> > > be correct for library packages.
> > >=20
> > > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.=
com>
> > > ---
> > >   meta/recipes-devtools/rpm/rpm_4.18.1.bb | 13 +++++++++++++
> > >   1 file changed, 13 insertions(+)
> > >=20
> > > diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipes-d=
evtools/rpm/rpm_4.18.1.bb
> > > index 95a9e92f96..21f0127561 100644
> > > --- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> > > +++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
> > > @@ -131,7 +131,20 @@ do_install:append:class-nativesdk() {
> > >   # Rpm's make install creates var/tmp which clashes with base-files =
packaging
> > >   do_install:append:class-target() {
> > >       rm -rf ${D}/var
> > > +
> > > +    if [ -d "${D}${prefix}/lib/rpm/platform/${SDK_ARCH}-linux" ]; th=
en
> > > +        if [ ! -d ${D}${prefix}/lib/rpm/platform/${MACHINE_ARCH}-lin=
ux ]; then
> > > +            cp -r ${D}${prefix}/lib/rpm/platform/${SDK_ARCH}-linux $=
{D}${prefix}/lib/rpm/platform/${MACHINE_ARCH}-linux
> > > +        fi
> > > +    fi
> >=20
> > SDK_ARCH should not be referenced outside of nativesdk recipes. This
> > reference is almost certainly incorrect as it would make the target
> > recipe dependent on the value of SDKMACHINE.
>=20
> Please advise what setting should be used instead.
>=20
> MACHINE_ARCH is what ends up in /etc/rpm/platform.
> TARGET_ARCH is not available in Honister but SDK_ARCH is.
>=20
> Suggest a common setting that can be used in both older and
> newer Yocto versions that has the base arch name and is
> usable for target builds.

I'm afraid I don't understand the problem you're running into from your
description so I don't know how to answer that. TARGET_ARCH has been
around in OE for many years so I'd be surprised it is unavailable in
honister though.

I do know that SDK_ARCH is incorrect here though. To prove what I'm
saying, try setting SDKMACHINE =3D "i686" and then check the value of
SDK_ARCH compared to when SDKMACHINE =3D "x86_64" (or "aarch64").

Cheers,

Richard

