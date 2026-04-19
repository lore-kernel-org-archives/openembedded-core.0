Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5CBEA7194
	for <webhook@archiver.kernel.org>; Sun, 19 Apr 2026 09:07:14 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5020.1776589631741836048
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Apr 2026 02:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NQhjP3un;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3A78A4E42A59;
	Sun, 19 Apr 2026 09:07:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A7795FFA5;
	Sun, 19 Apr 2026 09:07:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F56810460932;
	Sun, 19 Apr 2026 11:07:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776589628; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aFXLXS6nXz4wtxEj9AQegDAgalcKoEEUJcCJlWyymMc=;
	b=NQhjP3unTF0bO2HB7kmj97Btyb+QvTB/E/dswprJdOaviP5uyGR6qsNhdbjHHfM8YOF9yY
	esmOExLdmyFZWJ9yiRePayMApvPf7u6DnK7cRJcjtYNvJuN+TLLODGqiRk/HcOsEExtzX9
	ge/uZqgFhlbqbIVVzRb/CXfSUP0i3S8OiQpSVKOLv+27jMSiLvG7+742V1VpLq5uF/GU3z
	+S5ZVLza6X+ZwicEMjlGuL4e+wKOybxeW4dQpju73v1JU6EUozXrLB6pYLd2ZcLTxJ+y+g
	Dds57/hKGWqjnIoYLwdSre+uDoXvh/xEMMKb39kS7nLPSeK0725CA+jWAwLeyg==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 Daniel Turull <daniel.turull@ericsson.com>
Subject: 
 Re: [PATCH] improve_kernel_cve_report: use numeric versions instead of
 cpeApplicability
Date: Sun, 19 Apr 2026 11:07:07 +0200
Message-ID: <RTcJopQBQMuBZtd3st4uZA@bootlin.com>
In-Reply-To: 
 <PA3PR07MB10721D8F9BEC6B4059E7A6C3A8A202@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: 
 <20260417132409.1638132-1-daniel.turull@ericsson.com>
 <8667598.T7Z3S40VBb@brobin-bootlin>
 <PA3PR07MB10721D8F9BEC6B4059E7A6C3A8A202@PA3PR07MB10721.eurprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Apr 2026 09:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235524

Hello Daniel,

On Friday, April 17, 2026 at 6:54=E2=80=AFPM, Daniel Turull wrote:
> What I tried to say was that in this case using versions if we have 6.6.1=
00 we think we are vulnerable, but the cve was introduced in a backport in =
6.6.102. Only the range 6.6.102 to 6.6.112 should be vulnerable. I'll see i=
f I can report the issues so the source data is correct.

=46rom the version ranges:
 - https://cveawg.mitre.org/api/cve/CVE-2025-40067
 - https://git.kernel.org/pub/scm/linux/security/vulns.git/tree/cve/publish=
ed/2025/CVE-2025-40067.json

The "cpeApplicability" node says:

{
    "vulnerable": true,
    "criteria": "cpe:2.3:o:linux:linux_kernel:*:*:*:*:*:*:*:*",
    "versionStartIncluding": "6.6.102",
    "versionEndExcluding": "6.6.112"
},

So it is very clear that the first vulnerable version starts from 6.6.102

And the "versions" node says:

{
    "version": "6.6.112",
    "lessThanOrEqual": "6.6.*",
    "status": "unaffected",
    "versionType": "semver"
},

Which is coherent, version 6.6.112 is not vulnerable.

So in summary we are having:
 - [>=3D6.6.0, <6.6.102] =3D> not vulnerable,
 - [>=3D6.6.102, <6.6.112] =3D> vulnerable,
 - [>=3D6.6.112, <=3D6.6.*] =3D> not vulnerable.

To have a full picture, we must use all the information
("cpeApplicability" and "versions" nodes).
But now I am starting to understand what you are saying :)

> in this case using versions if we have 6.6.100 we think we are vulnerable

If we are only looking at the "versions" node, we may think that any version
below 6.6.102 is vulnerable (e.g., the 6.6.100 version).

This is not the only CVE that is like that; a *lot* of kernel CVEs are in
this case. So I don't know why Greg Kroah-Hartma said that cpeApplicability
nodes should not be used. Without it, the full picture of which version is
vulnerable cannot be obtained.

> If we plan to drop the script, I should probably not spend too much time =
on the script itself but on the data quality.

I don't know if we are going to drop the script.
Previously the script had some flows (and it still has), and since
sbom-cve-check (in the next release) should do better, I was going to
propose its suppression (In a few weeks).

> Have a nice weekend
> Daniel
>=20
> ________________________________
> From: Benjamin Robin <benjamin.robin@bootlin.com>
> Sent: Friday, April 17, 2026 4:47 PM
> To: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>; Daniel Turull <daniel.turull@ericsson.com>
> Subject: Re: [PATCH] improve_kernel_cve_report: use numeric versions inst=
ead of cpeApplicability
>=20
> On Friday, April 17, 2026 at 4:35=E2=80=AFPM, Daniel Turull wrote:
> > True,
> > I sent CVEs that had different responses. I used an old checkout and re=
run with the old and the new script.
> >
> > I'm starting to find some issues with the data that we should clarify b=
efore merging this patch. Let's pause it and have it correct.
> >
> > For example,
> >
> > "defaultStatus": "affected",
> > {
> >                      "version": "6.6.112",
> >                      "lessThanOrEqual": "6.6.*",
> >                      "status": "unaffected",
> >                      "versionType": "semver"
> >                   },
> >
> > "negate": false,
> > {
> >                            "vulnerable": true,
> >                            "criteria": "cpe:2.3:o:linux:linux_kernel:*:=
*:*:*:*:*:*:*",
> >                            "versionStartIncluding": "6.6.102",
> >                            "versionEndExcluding": "6.6.112"
> >                         },
>=20
> I see nothing wrong here.
> In [>6.6.102, <6.6.112] =3D> vulnerable, and [>=3D6.6.112, <=3D6.6.*] =3D=
> not vulnerable.
>=20
> > In this case, the information in one of the entries is not correct. For=
 example, in 6.6.100 is vulnerable in the version not in the cpeApplicabili=
ty, but git versions and cpeApplicability match if we do a git describe on =
them.
>=20
> I really did not understood this sentence.
> Be aware that if you do a git describe, this is the tag that can be reach=
ed
> that is displayed, not the tag that include the commit!
>=20
> Could you elaborate in more details, I may be wrong here...

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




