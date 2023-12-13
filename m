Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13BC7C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 21:58:23 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.1980.1702504694774718164
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 13:58:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hFm83IUa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3333074512bso4576058f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 13:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702504693; x=1703109493; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viF2tIYCgzcC0up0IpHPfVGC9CXniNvDzwOK0Kba/Jk=;
        b=hFm83IUaVcSUD3LZPSfi7nwro5xHs55Pi7vb3qgg/Ie+3XeSQWs2cPLLkBkYPgWJ1Q
         PZGhbFZDN7SZDm7VfI+cy/CllCFUD6nzqCtkw8LB6KGm6OLdYzLkhINh+jEMuNVr9u7j
         t4MyTXocGhyvmd9vM77z+wf+QoMKRxPNTrVxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702504693; x=1703109493;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=viF2tIYCgzcC0up0IpHPfVGC9CXniNvDzwOK0Kba/Jk=;
        b=M9xPiKi1aSbbVewAzbwitASQQ7zVaZ+5SHd5Ipa9WmXxMFFnwbleVayw9vChWhD4ut
         iF7rGqbg6NoPS8nhkWgbrQairHvdGWNvmZDvVIrbc1NeXNGG6OOlN8aUw3IU8onSyszo
         oW5gaimbEuaWgvzrxI3KUdJhSDaWtiZTs8ytwAjeE72F8UVxzPM2FInE3+aWF5kEk744
         L0YBkAFgmM/iAMp7LiPz1WUA2tpmchEjW7Qkkhx2zwjTfD58b9pReBo0e4WXnwXc8wyC
         skRkRMEOLAe9DXczko1XNI20tIhSoTxtqSB2ZMC2DS/l3TMDMO+fuvGjJ8gN4zuR1lAH
         fZ5w==
X-Gm-Message-State: AOJu0Yxz7xpeNnNZpOgzMN7YwFCRD6NzZOYRHWFKEcFbWbO5VenMTG3Y
	bm7WatP8PiT9HJXbqgZollGGmg==
X-Google-Smtp-Source: AGHT+IEdbw0V/qNYZGckerCh+h3rtKyUK6LISgCwpQEzRxcUi9CLDfptWsZZaXzM7A0GCYxZBlp05g==
X-Received: by 2002:a7b:cbd8:0:b0:40b:5e56:7b56 with SMTP id n24-20020a7bcbd8000000b0040b5e567b56mr4038704wmi.159.1702504693205;
        Wed, 13 Dec 2023 13:58:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7173:bb34:6d69:83d3? ([2001:8b0:aba:5f3c:7173:bb34:6d69:83d3])
        by smtp.gmail.com with ESMTPSA id b16-20020a05600c4e1000b0040c310abc4bsm22414107wmq.43.2023.12.13.13.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 13:58:12 -0800 (PST)
Message-ID: <333c5c8aed1e90baf856d16be2b33769e7ef6220.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] dtc: pass version as parameter instead of
 querying git
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "alex@linutronix.de"
	 <alex@linutronix.de>
Date: Wed, 13 Dec 2023 21:58:12 +0000
In-Reply-To: <AS1PR10MB56976720657BE061DEE39204FD8DA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20231213210703.667740-1-peter.marko@siemens.com>
	 <182ad0e88ab88b269d5b256406ca9bfffaf129cc.camel@linuxfoundation.org>
	 <AS1PR10MB56976720657BE061DEE39204FD8DA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 21:58:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192330

On Wed, 2023-12-13 at 21:53 +0000, Marko, Peter wrote:
> -----Original Message-----
> From: Richard Purdie <richard.purdie@linuxfoundation.org>=20
> Sent: Wednesday, December 13, 2023 22:11
> To: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>; openembedd=
ed-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH] dtc: pass version as parameter instead of q=
uerying git
>=20
> > On Wed, 2023-12-13 at 22:07 +0100, Peter Marko via lists.openembedded.o=
rg wrote:
> > > From: Peter Marko <peter.marko@siemens.com>
> > >=20
> > > Since switch from Makefile to meson based build, the version is no=
=20
> > > longer hardcoded but queried from git tag.
> > >=20
> > > This works only if git history is available.
> > > When shallow tarballs are used, tag is not available.
> > >=20
> > > Example error for trusted-firmware-a from meta-arm:
> > > dtc version too old (039a994), you need at least version 1.4.4
> > >=20
> > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > ---
> > >  ...n-as-parameter-instead-of-querying-g.patch | 49 +++++++++++++++++=
++
> > >  meta/recipes-kernel/dtc/dtc_1.7.0.bb          |  7 ++-
> > >  2 files changed, 54 insertions(+), 2 deletions(-)  create mode 10064=
4=20
> > > meta/recipes-kernel/dtc/dtc/0001-meson-get-version-as-parameter-inste=
a
> > > d-of-querying-g.patch
> > >=20
> > > diff --git=20
> > > a/meta/recipes-kernel/dtc/dtc/0001-meson-get-version-as-parameter-ins=
t
> > > ead-of-querying-g.patch=20
> > > b/meta/recipes-kernel/dtc/dtc/0001-meson-get-version-as-parameter-ins=
t
> > > ead-of-querying-g.patch
> > > new file mode 100644
> > > index 0000000000..d7906bd6f9
> > > --- /dev/null
> > > +++ b/meta/recipes-kernel/dtc/dtc/0001-meson-get-version-as-parameter=
-
> > > +++ instead-of-querying-g.patch
> > > @@ -0,0 +1,49 @@
> > > +From f32056f825b926b5820d43478d11e92eee1ec91f Mon Sep 17 00:00:00=
=20
> > > +2001
> > > +From: Peter Marko <peter.marko@siemens.com>
> > > +Date: Wed, 13 Dec 2023 21:18:14 +0100
> > > +Subject: [PATCH] meson: get version as parameter instead of querying=
=20
> > > +git
> > > +
> > > +When using shallow tarballs, git tag is not available.
> > > +This causes version to be git hash.
> > > +This prevents application from checking minimal required version.
> > > +
> > > +Example error for trusted-firmware-a from meta-arm:
> > > +dtc version too old (039a994), you need at least version 1.4.4
> > > +
> > > +Upstream-Status: Inappropriate [oe specific]
> > > +
> > > +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > +---
> > > + meson.build       | 3 ++-
> > > + meson_options.txt | 2 ++
> > > + 2 files changed, 4 insertions(+), 1 deletion(-)
> > > +
> >=20
> > I'm not sure that is inappropriate. Has anyone talked to upstream about=
 builds failing from shallow clones?
> >=20
> > Cheers,
> >=20
> > Richard
> >=20
>=20
> I actually think that building from shallow clones is very non-standard s=
cenario.
> Usual builds are either from full clones or from release tarballs.
> And meson nicely handles these two scenarios.
> Shallow tarball is an incomplete thing which has storage benefits but als=
o misses things that buildsystems are relying on.
> And I don't think I can win a discussion with meson maintainers about thi=
s.
> The vcs functions are standard and have good fallbacks (e.g. to hash)
> I could maybe convince them to add option to disable fall back to git has=
h, but that would be a long-runner.

They might be more receptive to adding an argument to allow the value
to be forced though, particularly if you can explain scenarios where
this is the only option and the code get it wrong?

I do think we need to raise these issues with the upstreams and only
carry patches if we can't convince them of these challenges.

> Maybe I could add an option to bitbake git fetcher to remove .git folder =
if needed?

I'm not sure we want to encourage it. That is actually more
maintainable even in the recipe though.

Cheers,

Richard



