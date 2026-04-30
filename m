Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB373FF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 09:40:40 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16459.1777542031899428155
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 02:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=A/lgTOlg;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AA1851A3491
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 09:40:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7996260495;
	Thu, 30 Apr 2026 09:40:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E2FC1072B88D;
	Thu, 30 Apr 2026 11:40:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777542026; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Im1S9w4l8z3VcRS/vnrlzbQH1H5qiwLYHbUr1WIJ8hU=;
	b=A/lgTOlgAdWc9Jec4ZL7VitZ82eAb38SVRYZ2S9OL47MJtlj2p+dPS3FbkY1HswD25O1QI
	WSQpUq8PBC8GN43bFBuLr8vTvMnZgRB241R4Axf3XpzxA97VWuavcfh2RQwHdP2d2u0WgM
	X7e0jktCpKQA0Cd+yGD2PwDk5bTz5+G5BSr62zDJsmijWuQvHh2a5DWE+lww3L4tthNTmh
	T7PfqzIkE24gobyEoOcPkY70fWJGg9ctrb9YI0cRi4ILVyLP+FayS2OxGRZFukUtuIONud
	8ss5ZJvv76T26gaSFdnSgwM29wxP9OxSLCqOGekxOvCTOHzKLRRkicTbVglCTw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: daniel.turull@ericsson.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: 
 Re: [OE-core] [PATCH] improve_kernel_cve_report: use numeric versions instead
 of cpeApplicability
Date: Thu, 30 Apr 2026 11:40:24 +0200
Message-ID: <hwRSwu7URpqXm61HMMXuww@bootlin.com>
In-Reply-To: 
 <970a04825d236b0fe34830591ab15c5ceb6205d1.camel@linuxfoundation.org>
References: 
 <20260417132409.1638132-1-daniel.turull@ericsson.com>
 <PA3PR07MB10721F2AD81A66C88C0D7D3B58A2F2@PA3PR07MB10721.eurprd07.prod.outlook.com>
 <970a04825d236b0fe34830591ab15c5ceb6205d1.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 09:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236153

On Thursday, April 30, 2026 at 11:34=E2=80=AFAM, Richard Purdie wrote:
> On Mon, 2026-04-20 at 07:53 +0000, Daniel Turull via lists.openembedded.o=
rg wrote:
> >=20
> >=20
> > > -----Original Message-----
> > > From: Benjamin Robin <benjamin.robin@bootlin.com>
> > > Sent: Monday, 20 April 2026 09:30
> > > To: openembedded-core@lists.openembedded.org; Daniel Turull
> > > <daniel.turull@ericsson.com>
> > > Subject: Re: [OE-core] [PATCH] improve_kernel_cve_report: use numeric
> > > versions instead of cpeApplicability
> > >=20
> > > On Monday, April 20, 2026 at 9:10=E2=80=AFAM, Daniel Turull wrote:
> > > >=20
> > > > > -----Original Message-----
> > > > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > > > core@lists.openembedded.org> On Behalf Of Benjamin Robin via
> > > > > lists.openembedded.org
> > > > > Sent: Sunday, 19 April 2026 11:07
> > > > > To: openembedded-core@lists.openembedded.org; Daniel Turull
> > > > > <daniel.turull@ericsson.com>
> > > > > Subject: Re: [OE-core] [PATCH] improve_kernel_cve_report: use
> > > > > numeric versions instead of cpeApplicability
> > > > >=20
> > > > > Hello Daniel,
> > > > >=20
> > > > > On Friday, April 17, 2026 at 6:54=E2=80=AFPM, Daniel Turull wrote:
> > > > > > What I tried to say was that in this case using versions if we
> > > > > > have 6.6.100 we
> > > > > think we are vulnerable, but the cve was introduced in a backport=
 in
> > > 6.6.102.
> > > > > Only the range 6.6.102 to 6.6.112 should be vulnerable. I'll see =
if
> > > > > I can report the issues so the source data is correct.
> > > > >=20
> > > > > From the version ranges:
> > > > >  -
> > > > >=20
> > > > > The "cpeApplicability" node says:
> > > > >=20
> > > > > {
> > > > >     "vulnerable": true,
> > > > >     "criteria": "cpe:2.3:o:linux:linux_kernel:*:*:*:*:*:*:*:*",
> > > > >     "versionStartIncluding": "6.6.102",
> > > > >     "versionEndExcluding": "6.6.112"
> > > > > },
> > > > >=20
> > > > > So it is very clear that the first vulnerable version starts from
> > > > > 6.6.102
> > > > >=20
> > > > > And the "versions" node says:
> > > > >=20
> > > > > {
> > > > >     "version": "6.6.112",
> > > > >     "lessThanOrEqual": "6.6.*",
> > > > >     "status": "unaffected",
> > > > >     "versionType": "semver"
> > > > > },
> > > > >=20
> > > > > Which is coherent, version 6.6.112 is not vulnerable.
> > > > >=20
> > > > > So in summary we are having:
> > > > >  - [>=3D6.6.0, <6.6.102] =3D> not vulnerable,
> > > > >  - [>=3D6.6.102, <6.6.112] =3D> vulnerable,
> > > > >  - [>=3D6.6.112, <=3D6.6.*] =3D> not vulnerable.
> > > > >=20
> > > > > To have a full picture, we must use all the information
> > > > > ("cpeApplicability" and "versions" nodes).
> > > > > But now I am starting to understand what you are saying :)
> > > > >=20
> > > > > > in this case using versions if we have 6.6.100 we think we are
> > > > > > vulnerable
> > > > >=20
> > > > > If we are only looking at the "versions" node, we may think that =
any
> > > > > version below 6.6.102 is vulnerable (e.g., the 6.6.100 version).
> > > >=20
> > > > Exactly.
> > > >=20
> > > > >=20
> > > > > This is not the only CVE that is like that; a *lot* of kernel CVE=
s are in this
> > > case.
> > > > > So I don't know why Greg Kroah-Hartma said that cpeApplicability
> > > > > nodes should not be used. Without it, the full picture of which
> > > > > version is vulnerable cannot be obtained.
> > > >=20
> > > > I think is because if you look literally the versions without looki=
ng
> > > > like a tree (which we do) the information is not correct. For examp=
le,
> > > > imagine that the correction is 6.6.100, then any 6.7.X is not affec=
ted, but that
> > > 6.6.100 was a backport and it was never backported to 6.7.X since it =
is not
> > > supported anymore.
> > >=20
> > > Yes I understand that, but why we should not look it like a tree? sbo=
m-cve-
> > > check in main branch has a special case for the kernel which do a spe=
cific
> > > processing for all these version ranges provided by the kernel CNA.
> >=20
> > I'm not saying that we should not look that a tree. We are doing the co=
rrect thing. Only if you take the=20
> > naive approach and compare versions 6.6.100 < 6.7.1, even 6.6.100 has a=
 fix and 6.7.1 not.
> >=20
> > > > > > If we plan to drop the script, I should probably not spend too
> > > > > > much time on
> > > > > the script itself but on the data quality.
> > > > >=20
> > > > > I don't know if we are going to drop the script.
> > > > > Previously the script had some flows (and it still has), and since
> > > > > sbom-cve- check (in the next release) should do better, I was goi=
ng
> > > > > to propose its suppression (In a few weeks).
> > > >=20
> > > > Can you point to the flaws, so I'm aware?
> > >=20
> > > The current version of improve_kernel_cve_report.py does not process =
the
> > > "versions" nodes. We need both sources of information.
> > >=20
> > > I did not double check if these findings are right (but at first glan=
ce it looked
> > > wrong):
> > >  - If at least one entry does not have versionStartIncluding defined,
> > >    first_affected is going to be 0.
> > >  - It does not handle versionStartExcluding
> > >  - It does not handle the fact that we could have multiples ranges
> > >    within the same branch that is vulnerable.
> > >  - Maybe there are others issues, I did not spent to much time analyz=
ing
> > >    it since I choose to use a different way to do that.
> >=20
> > Thanks, I need to look at start using sbom-cve-check. It is true, there=
 are a few corner cases.
>=20
> Did we reach a consensus on what we should do with this patch?

I am not sure.
Currently this patch is "not good enough" (see the whole discussion for the=
 reasons).

But, sbom-cve-check should have a "better" algorithm, and this script shoul=
d no
longer be necessary. And since cve-check class was removed, I don't know if=
 this
script is still useful.
=20
> We (as in patch review/triage) couldn't quite understand what the end res=
ult was!
>=20
> Cheers,
>=20
> Richard



=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




