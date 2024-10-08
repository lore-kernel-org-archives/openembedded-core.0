Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F01DCEF156
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 11:24:21 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.6754.1728386657081224089
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 04:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kM1sl+Xy;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a7aa086b077so631259666b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 04:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728386655; x=1728991455; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b63gUZ92W3S0Xz6hTO9fYyBjiV1W6TeuB7/rh9hGmn8=;
        b=kM1sl+XyC7cS/ksv4nn5CJciaBboQHcHKcqwbHc38akH3BOCuOY/KOSHkHZzNoXH78
         +mn43tBKz3y3U7cKRN2CcJJFyogDUD+u4FwIQe30bBussfiavbodimhBypyAHndMva+s
         EGlN2l+CV7+xaozODhIBp5fTiyPB6oxoECtRe82KwJR0tZUXCU2jHdwjOXwBQf5WYLpb
         3QwLO0nAWubH21LFQKug0CnTZBplWOaznQQ9IbtHa3yuBxGl4MbPULrRIP+o6rHsQCIA
         ttXWO4fSyfSZgBkTJ5de+C9pelT3V6EG4aLeEV+mcPemyRYbCebNM5aALqyJAxlrGlPr
         J8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728386655; x=1728991455;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b63gUZ92W3S0Xz6hTO9fYyBjiV1W6TeuB7/rh9hGmn8=;
        b=pqgEBa5KLlWEOBy18ROKcYalIJ8cTdAUnhqewoUV0m+46OLjCs33UMQRCD/+H0bpiT
         ZInR5eTYqv6x01F3Rf/Aaea3qnXvd1u1PcB1d09nuwoUSlxDscozxvF7ZnNC0rbzndB8
         RwdmxIGf3gXpMAXZk78UcLPShm+I/33HHNfasszjm8VzREnQcPnwxXlEhbl9Vy8cdXww
         iqbMId0218cEa4h6/wWq0zpDElFTQEIEITp4/qODamsSZ/3KYD67E0ZA2vdCeGWvxZBM
         UszqT1tXit8nFhv4VxW0htPbqz2hs8EgDcLNbQcKMy+JtV+9ZoWATbHobAvrdZW4e0IS
         6J9w==
X-Forwarded-Encrypted: i=1; AJvYcCUY4Vh/UV9iz4g4n4Ahp5wbcSgEZ/J7BX22hQtHFqjk6eIIc993YXV8VuRCjT3WAvU3c+2gCT2h31pvr0gAuPuCrw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz1X0ENdCOwfKIPx1tJdtAaj2d75OvVJd5El/gF8qYqVSztNxWZ
	NzS3CkdYPAs9G9N9zVRMqP8LWVD6Yw4vAgr+Azbpv1IiL1hhDNCK
X-Google-Smtp-Source: AGHT+IFL9velQcOMjzK5EL9MBSVxWlNI2b+K8skDaWzzYSmK9UAX8OxGYVGSbYERGlIfD8zSSiuWJA==
X-Received: by 2002:a17:907:868f:b0:a99:577b:b9f0 with SMTP id a640c23a62f3a-a99577bbb02mr603552966b.30.1728386654716;
        Tue, 08 Oct 2024 04:24:14 -0700 (PDT)
Received: from [10.9.136.49] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99325c5c48sm490466166b.170.2024.10.08.04.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 04:24:14 -0700 (PDT)
Message-ID: <2b4615fffa3c131e9795255c4884d6b9eea98c86.camel@gmail.com>
Subject: Re: [OE-core] [RFC][master][PATCH] populate_sdk_base: Add
 SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY
From: claus.stovgaard@gmail.com
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
Date: Tue, 08 Oct 2024 13:24:13 +0200
In-Reply-To: <CANNYZj-Wna0xVjvoX0hJwd9Kg_=yaVB+dNLecBDsjpSayo1zVg@mail.gmail.com>
References: <20240927132040.200122-1-claus.stovgaard@gmail.com>
	 <c3155a29aa855283f3396582c989263d93ded4f3.camel@linuxfoundation.org>
	 <2456863182484d2b15f75fe0f67a3473240a3fe6.camel@gmail.com>
	 <CANNYZj-Wna0xVjvoX0hJwd9Kg_=yaVB+dNLecBDsjpSayo1zVg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 11:24:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205287

On Tue, 2024-10-08 at 11:17 +0200, Alexander Kanavin wrote:
> On Mon, 7 Oct 2024 at 23:08, Claus Stovgaard via
> lists.openembedded.org
> <claus.stovgaard=3Dgmail.com@lists.openembedded.org> wrote:
> > A prime example for where we need the installation of packages in
> > RRECOMMENDS, and not ignore it is for generating a SDK with all
> > dependencies for an application.
> >=20
> > E.g. if we have a dummy recipe with packages in DEPENDS, the
> > packages
> > listed in DEPENDS will end in RRECOMMENDS. See process_depchains in
> > package.py for the pkg_adddeprrecs method, and not be installed in
> > the
> > SDK. Using the variable introduced with this patch, will install
> > packages from RRECOMMENDS in the SDK, and we have a classic SDK
> > with
> > all the packages from DEPENDS and ready to be used for the
> > application.
>=20
> But DEPENDS isn't meant to generate SDK dependencies. It's purpose is
> to pull things into sysroots in a plain yocto build.
>=20
> You need RDEPENDS for that if I'm not mistaken.
>=20
> Alex

It is a build time dependency as I see it.

if foo.bb is setting DEPENDS to include "bar baz and qux" to indicate
it need it for compilation.

When foo is added to an image, and we then populate_sdk for this image
I expect that the SDK includes the dev packages of bar baz and qux to
be able to compile foo with it.

This has working until now as the SDK installed the recommended
packages.

The key is that process_depchains in package.py make the
recommendation. From the comment

<snip>
def process_depchains(pkgfiles, d):
    """
    For a given set of prefix and postfix modifiers, make those
packages
    RRECOMMENDS on the corresponding packages for its RDEPENDS.

    Example:  If package A depends upon package B, and A's .bb emits an
    A-dev package, this would make A-dev Recommends: B-dev.
</snip>

I will start on creating an example on my github account showing the
issue better if it is not yet clear.

Claus

