Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A55EF36C3A
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 07:30:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14731.1776670210173106908
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 00:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=R0ocJylz;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D41661A3363
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 07:30:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9AE3B5FFA5;
	Mon, 20 Apr 2026 07:30:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B55581046088E;
	Mon, 20 Apr 2026 09:30:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776670207; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=svj4Z/inZrqVnp2wIVvhC2E73Y1gYhpWynQxalTlClg=;
	b=R0ocJylz3cneWWRsVf1JVp+Dq4TdMNDgjyXVpuOzcf5atv1O6FqvQ762g8U4XYcACjmCoD
	NzTeRr6STMHKXdryYqecG/wjOf6onQfxO2gkBwrckUCQ4ku6r4fPk8hj9Qruw5yAvzFbCv
	e6nqzIcGMz1DLQn93rzZ5VhPMJ4wXEZPecdQ3xGdXSDseMYKxyn6XZoU0hShlZ+u9mUo8Y
	AJTecDBwu4N30hMSak52afNITIdeKlMOv4W/fjO0eGCcYHaTQWebWS59Wnp6/M/7vDSFvT
	1xhlUgK4NO3rEQsSylaCfj3FOOmHXGuCihZBC6ELFydUdbC8/2xqeMQK4xW2NA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 Daniel Turull <daniel.turull@ericsson.com>
Subject: 
 Re: [OE-core] [PATCH] improve_kernel_cve_report: use numeric versions instead
 of cpeApplicability
Date: Mon, 20 Apr 2026 09:30:05 +0200
Message-ID: <X57sBsVVR06ktoT6yI1WyA@bootlin.com>
In-Reply-To: 
 <PA3PR07MB1072146E662BC68654B733C8A8A2F2@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: 
 <20260417132409.1638132-1-daniel.turull@ericsson.com>
 <RTcJopQBQMuBZtd3st4uZA@bootlin.com>
 <PA3PR07MB1072146E662BC68654B733C8A8A2F2@PA3PR07MB10721.eurprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 07:30:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235538

On Monday, April 20, 2026 at 9:10=E2=80=AFAM, Daniel Turull wrote:
>=20
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Benjamin Robin via
> > lists.openembedded.org
> > Sent: Sunday, 19 April 2026 11:07
> > To: openembedded-core@lists.openembedded.org; Daniel Turull
> > <daniel.turull@ericsson.com>
> > Subject: Re: [OE-core] [PATCH] improve_kernel_cve_report: use numeric
> > versions instead of cpeApplicability
> >=20
> > Hello Daniel,
> >=20
> > On Friday, April 17, 2026 at 6:54=E2=80=AFPM, Daniel Turull wrote:
> > > What I tried to say was that in this case using versions if we have 6=
=2E6.100 we
> > think we are vulnerable, but the cve was introduced in a backport in 6.=
6.102.
> > Only the range 6.6.102 to 6.6.112 should be vulnerable. I'll see if I c=
an report
> > the issues so the source data is correct.
> >=20
> > From the version ranges:
> >  -
> >=20
> > The "cpeApplicability" node says:
> >=20
> > {
> >     "vulnerable": true,
> >     "criteria": "cpe:2.3:o:linux:linux_kernel:*:*:*:*:*:*:*:*",
> >     "versionStartIncluding": "6.6.102",
> >     "versionEndExcluding": "6.6.112"
> > },
> >=20
> > So it is very clear that the first vulnerable version starts from 6.6.1=
02
> >=20
> > And the "versions" node says:
> >=20
> > {
> >     "version": "6.6.112",
> >     "lessThanOrEqual": "6.6.*",
> >     "status": "unaffected",
> >     "versionType": "semver"
> > },
> >=20
> > Which is coherent, version 6.6.112 is not vulnerable.
> >=20
> > So in summary we are having:
> >  - [>=3D6.6.0, <6.6.102] =3D> not vulnerable,
> >  - [>=3D6.6.102, <6.6.112] =3D> vulnerable,
> >  - [>=3D6.6.112, <=3D6.6.*] =3D> not vulnerable.
> >=20
> > To have a full picture, we must use all the information ("cpeApplicabil=
ity" and
> > "versions" nodes).
> > But now I am starting to understand what you are saying :)
> >=20
> > > in this case using versions if we have 6.6.100 we think we are
> > > vulnerable
> >=20
> > If we are only looking at the "versions" node, we may think that any ve=
rsion
> > below 6.6.102 is vulnerable (e.g., the 6.6.100 version).
>=20
> Exactly.
>=20
> >=20
> > This is not the only CVE that is like that; a *lot* of kernel CVEs are =
in this case.
> > So I don't know why Greg Kroah-Hartma said that cpeApplicability nodes
> > should not be used. Without it, the full picture of which version is vu=
lnerable
> > cannot be obtained.
>=20
> I think is because if you look literally the versions without looking lik=
e a tree (which we do) the information is not correct. For example,
> imagine that the correction is 6.6.100, then any 6.7.X is not affected, b=
ut that 6.6.100 was a backport and it was never backported to 6.7.X since=20
> it is not supported anymore.

Yes I understand that, but why we should not look it like a tree? sbom-cve-=
check
in main branch has a special case for the kernel which do a specific proces=
sing for
all these version ranges provided by the kernel CNA.

> > > If we plan to drop the script, I should probably not spend too much t=
ime on
> > the script itself but on the data quality.
> >=20
> > I don't know if we are going to drop the script.
> > Previously the script had some flows (and it still has), and since sbom=
=2Dcve-
> > check (in the next release) should do better, I was going to propose its
> > suppression (In a few weeks).
>=20
> Can you point to the flaws, so I'm aware?

The current version of improve_kernel_cve_report.py does not process the
"versions" nodes. We need both sources of information.

I did not double check if these findings are right (but at first glance it
looked wrong):
 - If at least one entry does not have versionStartIncluding defined,
   first_affected is going to be 0.
 - It does not handle versionStartExcluding
 - It does not handle the fact that we could have multiples ranges
   within the same branch that is vulnerable.
 - Maybe there are others issues, I did not spent to much time analyzing
   it since I choose to use a different way to do that.

>=20
> Thanks
> Daniel

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




