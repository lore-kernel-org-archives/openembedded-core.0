Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496ECF46454
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 11:29:01 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48423.1773660537641216110
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 04:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DnL1+IwW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852ff06541so50340185e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 04:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773660536; x=1774265336; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJEQed7p8LgjhGXugxRInezvSCKmBcB6/Z3m1iwaIoM=;
        b=DnL1+IwWL3+/gVEW0s7LA5gmQeP5dOfTgmnjgXqKU/XLRcXROpg838sZ475xM47knO
         Ft0I+r8jvi+bwfLxpvhU0mBHfkATM9bq70RMVQkSrAs5p4lEy4LsJLKaTPXzYXO6nVmy
         qDMkYdL6m0bkFkNfXhlYP2txk4vUislIbNiXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773660536; x=1774265336;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJEQed7p8LgjhGXugxRInezvSCKmBcB6/Z3m1iwaIoM=;
        b=KOS1TxYnzyEyEj9r+K8SlbAps45074e4kGg7RDd6Oki3ShIV3ADv5wYF+E3/W5hdoY
         dEKAi+e6zPDPN4JYJp6hKH9qmW8Nj1TF1+rXXBWqO1I+9L/P7hLurRdAkUvtX7YMT9D4
         m3bxWe8VRGaE0f6hoj5lVcsb1srq5sIRIXiGjf8NhnqFdEz8iN+s0/dBmCBi6zn3Rh1A
         1tWdvho2CcWl5rrupXkyzcb5XmuKyekSHPXS1NPJHMIu6Ls1qDRiAQZBiyXvyxskmYat
         KA2bzWP72anrB5zsuZDcU3LOxAzbPvmp0azvDtv7Ylqz0pHlU48TEtAAJf8iynWusb6R
         on3A==
X-Forwarded-Encrypted: i=1; AJvYcCVQJJEoYS8vA8rvlIxCnjk/CXnB+uS4d5TVUQjblyB8xzZH8DQsrYsBTLQ129vA+s1Ijmvw3NIWkM0aiQLgmhySVw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzPUKLY17Ru1gtAxAa9TSsaY4P+qTdCIviS4f6tkuzBJIsqfAS8
	lPDxKxUrgLkyA+ai77+EY1J8asPAc9XhbBoIIPu/KLKHaZbfUuic4qFIUbLJrEESaA8=
X-Gm-Gg: ATEYQzwm/RatKa6Tb4fTlDMY3mVFGNtRWOJAauTtigQsr5rCr+gbtb2ytN8IdElprGG
	q+MFiyprBq4IBRwU7TF4GrVhuJ5WoImOaqiz6dviVMqkFE27OAy4mgKtNeXkW1Wkl/slPmiXwLu
	AeRLevAgIUR4KPSMviBy6nBsK3wXtioFnlZVnjvZ+L9mQMAX5BQ5s3D5+/zyM0aDAuVx0tCQ9Qt
	IqePi1gDWzrnplmn0UXGY2K8slLX5yrrjiiTgz37cqMkbNYli7HFTTp5hXwqDj0LS95/g1rd6Td
	QGhmAU8u/grewCFaV/O7tUoRekSIpaUU7RM6MkTIy9UQpCisOIsTevDheqraOBheaNZf1b/ayTM
	n20r9N1496vR4bSqDMOA+BoGJ369dSY94I8hQimoyfKioxCpil7jU4pidujWkKBensTQo3AYITE
	1DwG7LhXMn1LT7dcihgTXWjNXmbiAOQP1W28tmkvc1orjbpog7EFiGnml2LuCzj2ipYV4BwT40a
	RTqhUGaGKSPdwc=
X-Received: by 2002:a05:600c:45d5:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-485566d3104mr207168075e9.6.1773660535929;
        Mon, 16 Mar 2026 04:28:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1225:f5c3:a704:878a? ([2001:8b0:aba:5f3c:1225:f5c3:a704:878a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557777105sm152973755e9.4.2026.03.16.04.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 04:28:55 -0700 (PDT)
Message-ID: <3f73b46c12aff52292d488f48d11572c66991b70.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate/sstatesig: Abstract dummy package
 architectures into layer.conf settings
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Mar 2026 11:28:54 +0000
In-Reply-To: <DB5PR02MB10213C75B95E2CBE99D91221DEF40A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260314102702.3942139-1-richard.purdie@linuxfoundation.org>
	 <DB5PR02MB10213C75B95E2CBE99D91221DEF40A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 11:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233248

On Mon, 2026-03-16 at 11:21 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From:
> > openembedded-core@lists.openembedded.org=C2=A0<openembedded-core@lists.=
openembedded.org
> > > On Behalf Of Richard Purdie via lists.openembedded.org
> > Sent: den 14 mars 2026 11:27
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH] sstate/sstatesig: Abstract dummy package
> > architectures into layer.conf settings
> >=20
> > Other layers need to be able to add dummy recipes. To do this add
> > DUMMY_PACKAGE_ARCHS_SDK and DUMMY_PACKAGE_ARCHS_TARGET in
> > layer.conf
> > which can be used to add these to the right places in the code.
> >=20
> > Don't add the variables to task signatures as these only matter in
> > the
> > context of constructed images and not the recipes.
> >=20
> > d-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0meta/classes-global/sstate.bbclass | 7 +++----
> > =C2=A0meta/conf/layer.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
> > =C2=A0meta/lib/oe/sstatesig.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 9 +++------
> > =C2=A03 files changed, 9 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-
> > global/sstate.bbclass
> > index a7c3f5332a2..fe70a976869 100644
> > --- a/meta/classes-global/sstate.bbclass
> > +++ b/meta/classes-global/sstate.bbclass
> > @@ -86,14 +86,13 @@ SSTATE_ARCHS =3D " \
> > =C2=A0=C2=A0=C2=A0=C2=A0 ${BUILD_ARCH}_${ORIGNATIVELSBSTRING} \
> > =C2=A0=C2=A0=C2=A0=C2=A0 ${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS} \
> > =C2=A0=C2=A0=C2=A0=C2=A0 ${SDK_ARCH}-${SDKPKGSUFFIX} \
> > -=C2=A0=C2=A0=C2=A0 buildtools-dummy-${SDKPKGSUFFIX} \
> > -=C2=A0=C2=A0=C2=A0 sdk-provides-dummy-target \
> > -=C2=A0=C2=A0=C2=A0 sdk-provides-dummy-${SDKPKGSUFFIX} \
> > +=C2=A0=C2=A0=C2=A0 ${DUMMY_PACKAGE_ARCHS_SDK} \
> > +=C2=A0=C2=A0=C2=A0 ${DUMMY_PACKAGE_ARCHS_TARGET} \
> > =C2=A0=C2=A0=C2=A0=C2=A0 allarch \
> > =C2=A0=C2=A0=C2=A0=C2=A0 ${SSTATE_ARCHS_TUNEPKG} \
> > =C2=A0=C2=A0=C2=A0=C2=A0 ${PACKAGE_EXTRA_ARCHS} \
> > =C2=A0=C2=A0=C2=A0=C2=A0 ${MACHINE_ARCH}"
> > -SSTATE_ARCHS[vardepsexclude] =3D "ORIGNATIVELSBSTRING"
> > +SSTATE_ARCHS[vardepsexclude] =3D "ORIGNATIVELSBSTRING
> > DUMMY_PACKAGE_ARCHS_SDK DUMMY_PACKAGE_ARCHS_TARGET"
> >=20
> > =C2=A0SSTATECREATEFUNCS +=3D "sstate_hardcode_path"
> > =C2=A0SSTATECREATEFUNCS[vardeps] =3D "SSTATE_SCAN_FILES"
> > diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> > index ba25ca30296..4794e660aed 100644
> > --- a/meta/conf/layer.conf
> > +++ b/meta/conf/layer.conf
> > @@ -133,6 +133,9 @@ SSTATE_EXCLUDEDEPS_SYSROOT +=3D "\
> > =C2=A0# dependency in the recipe.
> > =C2=A0SSTATE_EXCLUDEDEPS_SYSROOT +=3D ".*->autoconf-archive-native"
> >=20
> > +DUMMY_PACKAGE_ARCHS_SDK =3D "buildtools-dummy-${SDKPKGSUFFIX} sdk-
> > provides-dummy-${SDKPKGSUFFIX}"
> > +DUMMY_PACKAGE_ARCHS_TARGET =3D "sdk-provides-dummy-target"
>=20
> Wouldn't it be more appropriate to use +=3D for these two?
> Otherwise one will have to use :append to add to them in other
> layers.

That depends on whether your layer is included after core or not. I'd
have thought including before core would be potentially problematic
anyway...

Cheers,

Richard

