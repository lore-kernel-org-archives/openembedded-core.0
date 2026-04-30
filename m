Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43838CD13D3
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 07:21:18 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14769.1777533667595908914
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 00:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Yrhgjn1m;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 418C14E42B74
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 07:21:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1170C60495;
	Thu, 30 Apr 2026 07:21:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 761E51072B6D9;
	Thu, 30 Apr 2026 09:21:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777533664; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q5SSHtUL37RrZzH3MIP7Gtemx7g1jQiUb2IreB7ghxs=;
	b=Yrhgjn1mZiIxJVhCDgfNPEWCMevG/H2nG3NjqYiwS2k4CEMTDz5Es9D0LbD8O8ueduZP83
	Vj8GBIWwMjPgKG1UxJ74lUQUdJQzslf1OWAVw8/usa0NQt9ov+mxuW/g3ugd7msJD4XSYD
	ED/jH2oJJF6HH8aMlZhLwHKea43vMAlTEuwf2dxcoqfHfwZK+Wui9F3tjjCl5i16Gw5NWP
	0za9nkJLIUOsHE5RhceS9aPH0CdGb+qTBEl6vCKIKHGHJriiS7U2ykNOt8uLPvVzyA9aei
	1EzqZbjbE/5L9thl6u5unyEvbQ9YQSpa5xkNiRry6ky7Hcc6Ph1ExzItjRP5YQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] sudo: set status of CVE-2025-64170 and CVE-2025-64517
Date: Thu, 30 Apr 2026 09:21:02 +0200
Message-ID: <zu-eGewcQDqGgk84Tio0gA@bootlin.com>
In-Reply-To: 
 <AS1PR10MB56972D5D144DE00D1F5838B3FD342@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <20260426185025.13217-1-peter.marko@siemens.com>
 <guQOcvruSnqgA-55eCHYSw@bootlin.com>
 <AS1PR10MB56972D5D144DE00D1F5838B3FD342@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 07:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236141

Hello Peter,

On Wednesday, April 29, 2026 at 7:13=E2=80=AFPM, Marko, Peter wrote:

> > > Hello Benjamin,
> > >
> > > I will sent CVE_PRODUCT update to get rid of some older sudo-rs CVE.
> > >
> > > However for these two CVEs, I can still only see "sudo-rs" as product=
, not "sudo",
> > also via link you have provided from cveawg.org/api.
> >=20
> > Yes, but this is not a CPE. As explained previously (see the steps deta=
iled
> > above in the previous email), using the vendor/product names extracted =
from
> > the associated field, we look in the products database for an associate=
d CPE:
> > https://github.com/bootlin/sbom-cve-
> > check/blob/v1.3.0/src/sbom_cve_check/products/products.toml#L1688
>=20
> Thanks for the explanation.
> Finally, I'm starting to understand how some CVEs get assigned to compone=
nts where I'd not expect them.
>=20
> How was that toml file created? Manual work?
> For sudo I think the table is correct (although I don't understand NVD mo=
tivation for that).

This is a mix of an automated script and of a manual work...
=20
> However for SDL (CVE-2026-35444) it looks wrong:
> https://github.com/bootlin/sbom-cve-check/blob/v1.3.0/src/sbom_cve_check/=
products/products.toml#L1608
> Why does it map sdl and sdl_image and simple_directmedia_layer together?
> There are distinctive CPEs for both sdl and sdl_image in NVD DB...

=46rom my understanding this was the same component, but it is clearly
not the case...

=2D https://nvd.nist.gov/vuln/detail/CVE-2019-7573 use this CPE
  "cpe:2.3:a:libsdl:simple_directmedia_layer:*:*:*:*:*:*:*:*"
  and refer to both SDL 1 and 2. The referenced code looks like it is:
  https://github.com/libsdl-org/SDL/blob/main/src/audio/SDL_wave.c#L376

=2D https://nvd.nist.gov/vuln/detail/CVE-2008-0544 use this CPE
  "cpe:2.3:a:sdl:sdl_image:1.2.6:*:*:*:*:*:*:*"
   and refer to SDL_image 1. The referenced code looks like it is:
   https://github.com/libsdl-org/SDL_image/blob/SDL-1.2/IMG_lbm.c

> Peter

I expected to make several mistakes. This is a first version, and it is
going to be improved and fixed in the long run (at least this was my plan).

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




