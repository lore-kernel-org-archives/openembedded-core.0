Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C6AFF886F
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 07:32:18 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14934.1777534335448411173
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 00:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=VYmgxpG7;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 77EA44E42B73
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 07:32:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46AAD60495;
	Thu, 30 Apr 2026 07:32:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5BCB61072B6F0;
	Thu, 30 Apr 2026 09:32:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777534332; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oudlrllsMVDccricsyIn7hzpXkz5ydkXFHiuovHU9S8=;
	b=VYmgxpG7VhfNwvCIL50GDMbyrVJnPJGPRVl5IqPGEJiQIT/Y2GPeiM+Oe5M/gLJxkyKA1+
	d++nSCrLOvc9wUis+d395l2HG+Ok8r3BJ9wDpJNTjsfdLMJi+BKf1iv1fE/vlaf3MvW6Pb
	sxwAxzsN/tF2gWAhMeWw2HnhKsa56pON13tr9UZK4mhqPhgom/DXUnNdn4Rj8R2mDQSJb/
	WT30xtQ2ExDpUMVlBLKJhBWLYDw7gMlV6tIdL/MXfQyAasoTc2j7WwYG9Bc5Pi25j9clMU
	8IJeavroPtkREUoezEPA7FnTX8NKQnlO7JMD0pjausQgoHS1WoOrj4X1LA6ohQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 Pascal EBERHARD <pascal.eberhard@se.com>, Wahid ESSID <wahid.essid@se.com>,
 olivier.benjamin@bootlin.com
Subject: Re: [PATCH 1/6] sudo: set status of CVE-2025-64170 and CVE-2025-64517
Date: Thu, 30 Apr 2026 09:32:10 +0200
Message-ID: <PzSSW6WZTRq2coTSXOgXvg@bootlin.com>
In-Reply-To: <zu-eGewcQDqGgk84Tio0gA@bootlin.com>
References: 
 <20260426185025.13217-1-peter.marko@siemens.com>
 <AS1PR10MB56972D5D144DE00D1F5838B3FD342@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <zu-eGewcQDqGgk84Tio0gA@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 07:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236143

On Thursday, April 30, 2026 at 9:21=E2=80=AFAM, Benjamin Robin wrote:
> Hello Peter,
>=20
> On Wednesday, April 29, 2026 at 7:13=E2=80=AFPM, Marko, Peter wrote:
>=20
> > > > Hello Benjamin,
> > > >
> > > > I will sent CVE_PRODUCT update to get rid of some older sudo-rs CVE.
> > > >
> > > > However for these two CVEs, I can still only see "sudo-rs" as produ=
ct, not "sudo",
> > > also via link you have provided from cveawg.org/api.
> > >=20
> > > Yes, but this is not a CPE. As explained previously (see the steps de=
tailed
> > > above in the previous email), using the vendor/product names extracte=
d from
> > > the associated field, we look in the products database for an associa=
ted CPE:
> > > https://github.com/bootlin/sbom-cve-
> > > check/blob/v1.3.0/src/sbom_cve_check/products/products.toml#L1688
> >=20
> > Thanks for the explanation.
> > Finally, I'm starting to understand how some CVEs get assigned to compo=
nents where I'd not expect them.
> >=20
> > How was that toml file created? Manual work?
> > For sudo I think the table is correct (although I don't understand NVD =
motivation for that).
>=20
> This is a mix of an automated script and of a manual work...
> =20
> > However for SDL (CVE-2026-35444) it looks wrong:
> > https://github.com/bootlin/sbom-cve-check/blob/v1.3.0/src/sbom_cve_chec=
k/products/products.toml#L1608
> > Why does it map sdl and sdl_image and simple_directmedia_layer together?
> > There are distinctive CPEs for both sdl and sdl_image in NVD DB...
>=20
> From my understanding this was the same component, but it is clearly
> not the case...
>=20
> - https://nvd.nist.gov/vuln/detail/CVE-2019-7573 use this CPE
>   "cpe:2.3:a:libsdl:simple_directmedia_layer:*:*:*:*:*:*:*:*"
>   and refer to both SDL 1 and 2. The referenced code looks like it is:
>   https://github.com/libsdl-org/SDL/blob/main/src/audio/SDL_wave.c#L376
>=20
> - https://nvd.nist.gov/vuln/detail/CVE-2008-0544 use this CPE
>   "cpe:2.3:a:sdl:sdl_image:1.2.6:*:*:*:*:*:*:*"
>    and refer to SDL_image 1. The referenced code looks like it is:
>    https://github.com/libsdl-org/SDL_image/blob/SDL-1.2/IMG_lbm.c

After checking (again), I now understand my mistake.

In the CVE list, "Simple DirectMedia Layer" product name always refers to
the SDL_image component.

I am going to remove this entry from the product database, as it only
covers fewer than 10 (old) CVEs.
=20
> > Peter
>=20
> I expected to make several mistakes. This is a first version, and it is
> going to be improved and fixed in the long run (at least this was my plan=
).
>=20
>=20


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




