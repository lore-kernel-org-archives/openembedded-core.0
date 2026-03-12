Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0C8106705A
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 15:58:33 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25134.1773331109667611451
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 08:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ekgn+QV9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso9808985e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 08:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773331108; x=1773935908; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7bJa/o9vXoMhi5Y4g3EuAdvNel3BuTFzK5WXU1/IkWg=;
        b=Ekgn+QV9eXvQlAGQZ2S/I34+2x8ksAMClpfcJYtsMjrBGyrV8IBg+KGSSToxnZxDNX
         5dw98IXo73rV5U/Q7QuFJpQq682R4TmXHjPeSvStIWxH7lUgjd8iuuuyF27gnPHhq0t/
         q/2QRSu8I58D1E6202YXn1iqiNhfd7NarrJUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773331108; x=1773935908;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7bJa/o9vXoMhi5Y4g3EuAdvNel3BuTFzK5WXU1/IkWg=;
        b=ddsclM/0NSG5oZ7zim6gmzM3n6QcQ50hKP9/Na6I6S7GDyY8u9K8hwnCNLjh6arnQ2
         UXihdlpduOTAHVe02wcEB9ZNnEUbfwl6qGr508ZWcfJTCtj4KkwKG6GVd8dRK6CZMMbG
         QBpQMWACaoUx50Fg6YPLBYyXmmutFXMgdw2blT2sSrHWb9K1Dfqqusz48tx99rmVK5lV
         3HQ9RuWJruKkhiloEHkTYySz0E5tZYTOH4D+Yaf5Z4bsFk1tQVPJ2fxRz7C/7Bh1xa/E
         GfQxBizLpcFApCekUZZjbEhTUpgalJ1GZmvqV5Uh03A5A+dZQdKszbnk8mdg64n6VFUV
         jDdg==
X-Gm-Message-State: AOJu0YwMCrC6spH7rEyvA7d4HaZu/nLd9LLD+a2/DtHu9XySrYsFEwjD
	dO/L8Lkljf2TH7G0IxDrSbjBLWi4pZj+mKj+epsDlhi67JQ99ZWGqs7VveGt1jXPLCY=
X-Gm-Gg: ATEYQzwFXBBb+F0nmcr3lYpBg7q2O+ozo22Kp4D5B9Oo8qUbbTrB3QW5cHVf3Ls0XbG
	uonI3O09q+DPg2Do2UulSnCK79Vb6Txrby8ceG+Vy+9BpUYiAUWmoouL9xLAvRI/bzWgVIaeGYC
	V2FNSLdEosJEdkBjYCnUblcq2xaQ2oRsVMU6WlsKd01iHdRsEWP16GU7ZoGDErLr+SLqje9mDqs
	Ol8ZJXmquX5PGfD99rarEoj9cOgKs1UrgqUtlr5JOI2HwmPoG84xb7YnyG1e4rzUAUok+Jy0pqr
	PWVNBPkErjGHX0N2Q1MxQsMQ3V26FR1/7tSAfqNPy/FCD0jXnoKFZG2QuRkuAt7FqvF7U8x8DTh
	hHxIcFJLuwGWJ1iD/WI9cqVauvaTmvGdLn6VoY8t44imPcRk3RiAceePXU7g9hLKlipWds1gH1p
	JzFF+aXWKXsSDGn5mt/ekZnP/DNtXi+DR5K1KIs0dvu/lNHiQ+D1G3KK+7R+M7q+vFDepJlyyfF
	SAtG7RLl3Q7
X-Received: by 2002:a05:600c:4512:b0:483:64b4:79da with SMTP id 5b1f17b1804b1-4854b124e7dmr114718825e9.26.1773331107843;
        Thu, 12 Mar 2026 08:58:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:215f:5162:d0b:8f1d? ([2001:8b0:aba:5f3c:215f:5162:d0b:8f1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854e67ea40sm98678325e9.7.2026.03.12.08.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:58:27 -0700 (PDT)
Message-ID: <c46dca246219768d5ecc515b904fbfc6053feab7.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v6 10/15] dummy-sdk-package: Disable SPDX
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2026 15:58:26 +0000
In-Reply-To: <CAJdd5GYvTS71yZ7OfgH3d2Ouam8H-2y4hZmgJurLXC9t3CA9fg@mail.gmail.com>
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
	 <20260310184058.533343-1-JPEWhacker@gmail.com>
	 <20260310184058.533343-11-JPEWhacker@gmail.com>
	 <a437698a4d24a835440e282d0d744f5b3ff669a3.camel@linuxfoundation.org>
	 <CAJdd5GYvTS71yZ7OfgH3d2Ouam8H-2y4hZmgJurLXC9t3CA9fg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 15:58:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232984

On Thu, 2026-03-12 at 08:24 -0600, Joshua Watt wrote:
> On Thu, Mar 12, 2026 at 5:59=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Tue, 2026-03-10 at 12:38 -0600, Joshua Watt via lists.openembedded.o=
rg wrote:
> > > The dummy SDK packages do not need SPDX support, and since they play
> > > some games with allarch that cause problems, it's simplest to disable
> > > their SPDX output.
> > >=20
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > ---
> > > =C2=A0meta/recipes-core/meta/dummy-sdk-package.inc | 1 +
> > > =C2=A01 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/reci=
pes-core/meta/dummy-sdk-package.inc
> > > index bf453cac9b..71e788b0b9 100644
> > > --- a/meta/recipes-core/meta/dummy-sdk-package.inc
> > > +++ b/meta/recipes-core/meta/dummy-sdk-package.inc
> > > @@ -4,6 +4,7 @@ LICENSE =3D "MIT"
> > > =C2=A0PACKAGE_ARCH =3D "all"
> > >=20
> > > =C2=A0inherit allarch
> > > +inherit nospdx
> > >=20
> > > =C2=A0INHIBIT_DEFAULT_DEPS =3D "1"
> >=20
> > I know why you did this, but after thinking about this, I'm worried and
> > I'm not sure this is the right move.
> >=20
> > The SDK dummy packages are "odd" but they are actual package files that
> > are generated and would be present in manifests and as such, if they're
> > missing from the SPDX manifests and docs, this is going to raise
> > questions. I appreciate they don't have content and their main use is
> > their 'provides'.
> >=20
> > Taking a step back, we do support generic/multiple levels of package
> > arch and since we support that, the SPDX code does need to handle that
> > too. I'm therefore starting to worry that SPDX can't cope with the
> > multiple package levels. Can you remind me what the issue is with the
> > "all" arch here?
>=20
> The problem is specifically the anonymous python that does:
>=20
> =C2=A0=C2=A0=C2=A0 d.setVar('PACKAGE_ARCH', '${DUMMYARCH}')
>=20
> Which seems specifically intended to bypass the allarch logic in a
> weird way. It's specifically doing this to put the package in a place
> no-one can find it (this includes SPDX); I didn't think it provided
> much value hence disabling it, but looking closer, I think we can do:
>=20
> SSTATE_MULTILIB_SSTATE_ARCHS:append =3D " ${SDK_PACKAGE_ARCH}"
>=20
> in create-spdx-sdk-3.0.bbclass and that should fix it. I'll try it.

That code was to put these packages into their own separate feed.
Specifically:

meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb:DUMMYARCH =3D "bu=
ildtools-dummy-${SDKPKGSUFFIX}"
meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb:DUMMYARCH =3D "sdk-p=
rovides-dummy-${SDKPKGSUFFIX}"
meta/recipes-core/meta/dummy-sdk-package.inc:    d.setVar('PACKAGE_ARCH', '=
${DUMMYARCH}')
meta/recipes-core/meta/target-sdk-provides-dummy.bb:DUMMYARCH =3D "sdk-prov=
ides-dummy-target"

so there are separate package feeds being created and then the SDK code
can select which package feeds it wants to use for a given
configuration/recipe.

That isn't to bypass allarch but just to customise the end package feed
naming and allow different forms of SDK to be built by bringing in the
different package combinations.

My worry is that the SPDX code isn't going to handle the scenario where
PACKAGE_ARCH is changed (for example for a specialist graphics stack)
and that one of our general features will be lost.

Cheers,

Richard





