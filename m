Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE4FF436B4
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 14:47:17 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46864.1776437232868244693
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 07:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Jx+eAfdD;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0C658C5C3E5
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 14:47:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 824C460497;
	Fri, 17 Apr 2026 14:47:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6ED8710460A5E;
	Fri, 17 Apr 2026 16:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776437229; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=k7kcXCBpe7BXq0RI134YfdIv09EXz5Ag02oYS8RJGoU=;
	b=Jx+eAfdDDNzLEK+M17i+tGxduFf4u6N6eyqJyMxuANxTdN3KS0z/+uBTO79TRnARNr/baP
	BzW1JdupyouNDCS2gUrHcV2D3+eK1ZacOeW0DUcgbdrRvEjmPVm1xu/93m8yGdbUzbh9ET
	4kNy2fCMwGzNzpLt3mNLuARQI6ae/Wspo9kzUwTzgPx734/Qh6Ft6UT1RkfqJQ/cW1i8NB
	lncWk78Pqkkdto6soT1cdkzp7t8QZ8B2FFZaQSf3SdGiiK5PvSg+BvfcJXuddoAVtxdqN9
	SQdv4l4sPSwolbPVF4xoBUbVzi+99Moqn2JJ4qiih6hU98tnHG8qVyjDrW8aUA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 Daniel Turull <daniel.turull@ericsson.com>
Subject: 
 Re: [PATCH] improve_kernel_cve_report: use numeric versions instead of
 cpeApplicability
Date: Fri, 17 Apr 2026 16:47:08 +0200
Message-ID: <8667598.T7Z3S40VBb@brobin-bootlin>
In-Reply-To: 
 <PA3PR07MB10721AC4C17755A46BB4D4F378A202@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: 
 <20260417132409.1638132-1-daniel.turull@ericsson.com>
 <2259273.irdbgypaU6@brobin-bootlin>
 <PA3PR07MB10721AC4C17755A46BB4D4F378A202@PA3PR07MB10721.eurprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 14:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235506

On Friday, April 17, 2026 at 4:35=E2=80=AFPM, Daniel Turull wrote:
> True,
> I sent CVEs that had different responses. I used an old checkout and reru=
n with the old and the new script.
>=20
> I'm starting to find some issues with the data that we should clarify bef=
ore merging this patch. Let's pause it and have it correct.
>=20
> For example,
> https://git.kernel.org/pub/scm/linux/security/vulns.git/tree/cve/publishe=
d/2025/CVE-2025-40067.json
>=20
> "defaultStatus": "affected",
> {
>                      "version": "6.6.112",
>                      "lessThanOrEqual": "6.6.*",
>                      "status": "unaffected",
>                      "versionType": "semver"
>                   },
>=20
> "negate": false,
> {
>                            "vulnerable": true,
>                            "criteria": "cpe:2.3:o:linux:linux_kernel:*:*:=
*:*:*:*:*:*",
>                            "versionStartIncluding": "6.6.102",
>                            "versionEndExcluding": "6.6.112"
>                         },

I see nothing wrong here.
In [>6.6.102, <6.6.112] =3D> vulnerable, and [>=3D6.6.112, <=3D6.6.*] =3D> =
not vulnerable.

> In this case, the information in one of the entries is not correct. For e=
xample, in 6.6.100 is vulnerable in the version not in the cpeApplicability=
, but git versions and cpeApplicability match if we do a git describe on th=
em.

I really did not understood this sentence.
Be aware that if you do a git describe, this is the tag that can be reached
that is displayed, not the tag that include the commit!

Could you elaborate in more details, I may be wrong here...

> I'll send an email to ask for clarification to the kernel security team a=
nd try to see other similar cases. I must say that this is a minority of al=
l CVEs.
>=20
> Also I need to look if this could be integrated in the sbom-cve-check, so=
 we have it only one place. I want to be able to run the script as well wit=
h older releases or just telling the kernel to use without SBOM.

This is already integrated to sbom-cve-check (I pushed today in main),
but the algorithm is completely different.
And again since NVD database is enabled (by default) the result is not as
good as if you are only using the CVEList entries.

I was going to propose to drop this Python script that you are working on.

>=20
> Best regards,
> Daniel
>=20
>=20
> > -----Original Message-----
> > From: Benjamin Robin <benjamin.robin@bootlin.com>
> > Sent: Friday, 17 April 2026 15:55
> > To: openembedded-core@lists.openembedded.org; Daniel Turull
> > <daniel.turull@ericsson.com>
> > Subject: Re: [PATCH] improve_kernel_cve_report: use numeric versions
> > instead of cpeApplicability
> >=20
> > On Friday, April 17, 2026 at 3:44=E2=80=AFPM, Daniel Turull wrote:
> > > Hi,
> > > We had Greg visiting us and I asked him what is better to use and he =
said git
> > or versions, not cvepAplicability that has issues defining trees.
> >=20
> > You reply is technically not responding to my question :) Could you pro=
vide at
> > least one example with an entry that is not correct in the cpeApplicabi=
lity
> > node?
> >=20
> > The script had previously various issue (or at least it looked like it).
> > I preferred to use a completely different algorithm (and using all sour=
ces of
> > information)
> >=20
> > But since I am also using NVD entries this degrade a bit the quality of=
 the
> > generated assessment message
> >=20
> > > I have done some comparison with 6.6.100 and 6.18.22



=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




