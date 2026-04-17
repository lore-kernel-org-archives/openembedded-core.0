Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7349FF436A7
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 13:55:13 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45580.1776434105495627424
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 06:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YlQysA3u;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 829E3C5C3E2;
	Fri, 17 Apr 2026 13:55:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E62960497;
	Fri, 17 Apr 2026 13:55:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 518B610460984;
	Fri, 17 Apr 2026 15:54:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776434098; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JaLKsVG0V549WrYupmnQbonZ6DeJoptzzz7Cayyj/ok=;
	b=YlQysA3uDhyrgO7uNY84HhJ3kwCx3M2s+MPt6Es/jXfy8I1L+q+qPkUiZLj52R8BoO/2My
	NncDFp6f7m5SYkAtPg7LvzfiF/8+EA/sWnuozo+btm62w26fyqR6m40GmUH6y/t+2SH/07
	LDZXbsu0gM1f7DYHfsJo04N9esG2vnhUSecNf5n4H8RAXnFzM+sj4PRXeQxG5RBWC/+7jp
	ZC3Cnt++UXm0p1hzpTDZp0JTgtSzxtI7K5FiBlPrqOL8rIw11KPtKqOKGhjRqzT69uM0Yo
	2BU/5Bt9CQYcqUuuptLq7N7YiT8oSmckuYSdhxiC3FCEj/ZHd8kCmGeC9CjCzw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 Daniel Turull <daniel.turull@ericsson.com>
Subject: 
 Re: [PATCH] improve_kernel_cve_report: use numeric versions instead of
 cpeApplicability
Date: Fri, 17 Apr 2026 15:54:57 +0200
Message-ID: <2259273.irdbgypaU6@brobin-bootlin>
In-Reply-To: 
 <PA3PR07MB10721B25CE9927D9C2E70BD208A202@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: 
 <20260417132409.1638132-1-daniel.turull@ericsson.com>
 <5983306.DvuYhMxLoT@brobin-bootlin>
 <PA3PR07MB10721B25CE9927D9C2E70BD208A202@PA3PR07MB10721.eurprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 13:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235502

On Friday, April 17, 2026 at 3:44=E2=80=AFPM, Daniel Turull wrote:
> Hi,
> We had Greg visiting us and I asked him what is better to use and he said=
 git or versions, not cvepAplicability that has issues defining trees.

You reply is technically not responding to my question :)
Could you provide at least one example with an entry that is not correct
in the cpeApplicability node?

The script had previously various issue (or at least it looked like it).
I preferred to use a completely different algorithm (and using all sources
of information)

But since I am also using NVD entries this degrade a bit the quality of
the generated assessment message

> I have done some comparison with 6.6.100 and 6.18.22
>=20
>=20
> =3D=3D=3D 6.6.100 =3D=3D=3D
> Old: 10900  New: 10898  Match: 10418  Only old: 2  Only new: 0  Diff: 480
>     327  Unpatched/version-in-range -> Unpatched/version-in-range
>     106  Patched/fixed-version -> Patched/fixed-version
>      16  Patched/cpe-stable-backport -> Unpatched/version-in-range
>      15  Unpatched/version-in-range -> Patched/fixed-version
>       5  Patched/fixed-version -> Unpatched/known-affected
>       5  Patched/fixed-version -> Unpatched/version-in-range
>       2  Patched/cpe-stable-backport -> Patched/fixed-version
>       1  Patched/version-not-in-range -> Unpatched/version-in-range
>       1  Patched/cpe-stable-backport -> Unpatched/known-affected
>       1  Patched/version-not-in-range -> Patched/fixed-version
>       1  Unpatched/version-in-range -> Unpatched/known-affected
>   Only in old:
>     CVE-2024-0000: Patched/version-not-in-range
>     CVE-2024-0053: Patched/version-not-in-range
>=20
> =3D=3D=3D 6.18.22 =3D=3D=3D
> Old: 10900  New: 10898  Match: 10877  Only old: 2  Only new: 0  Diff: 21
>       7  Unpatched/version-in-range -> Unpatched/version-in-range
>       6  Patched/fixed-version -> Patched/fixed-version
>       6  Patched/fixed-version -> Unpatched/known-affected
>       1  Unpatched/version-in-range -> Unpatched/known-affected
>       1  Unpatched/version-in-range -> Patched/cpe-stable-backport
>   Only in old:
>     CVE-2024-0000: Patched/version-not-in-range
>     CVE-2024-0053: Patched/version-not-in-range
>=20
> old vs new outputs for kernel 6.18.22
>=20
> Old total: 10900
> New total: 10898
> Matching: 10877
> Only in old: 2
> Only in new: 0
> Different: 21
>=20
> Difference categories:
>       7  Unpatched/version-in-range -> Unpatched/version-in-range
>       6  Patched/fixed-version -> Patched/fixed-version
>       6  Patched/fixed-version -> Unpatched/known-affected
>       1  Unpatched/version-in-range -> Unpatched/known-affected
>       1  Unpatched/version-in-range -> Patched/cpe-stable-backport
>=20
> Only in old (2):
>   CVE-2024-0000: Patched/version-not-in-range: No CPE match
>   CVE-2024-0053: Patched/version-not-in-range: No CPE match
>=20
> Different (all 21):
>   CVE-2021-47295:
>     old: Patched/fixed-version: Fixed from version 6.2.5
>     new: Patched/fixed-version: Fixed from version 5.14
>   CVE-2021-47342:
>     old: Patched/fixed-version: Fixed from version 5.12.5000
>     new: Patched/fixed-version: Fixed from version 5.10.77
>   CVE-2022-50396:
>     old: Patched/fixed-version: Fixed from version 6.2.5
>     new: Patched/fixed-version: Fixed from version 6.2
>   CVE-2023-53012:
>     old: Patched/fixed-version: Fixed from version 6.1.5000
>     new: Unpatched/known-affected: No known resolution
>   CVE-2023-53187:
>     old: Patched/fixed-version: Fixed from version 5.15.5000
>     new: Unpatched/known-affected: No known resolution
>   CVE-2024-49854:
>     old: Patched/fixed-version: Fixed from version 5.10.5000
>     new: Unpatched/known-affected: No known resolution
>   CVE-2025-38656:
>     old: Patched/fixed-version: Fixed from version 6.12.5000
>     new: Unpatched/known-affected: No known resolution
>   CVE-2025-68195:
>     old: Patched/fixed-version: Fixed from version 6.12.5000
>     new: Unpatched/known-affected: No known resolution
>   CVE-2025-68357:
>     old: Patched/fixed-version: Fixed from version 6.17.5000
>     new: Patched/fixed-version: Fixed from version 6.12.64
>   CVE-2025-71145:
>     old: Patched/fixed-version: Fixed from version 5.10.5000
>     new: Unpatched/known-affected: No known resolution
>   CVE-2026-23288:
>     old: Patched/fixed-version: only affects 6.19.4 onwards
>     new: Patched/fixed-version: only affects 6.19 onwards
>   CVE-2026-23327:
>     old: Unpatched/version-in-range: Needs backporting (fixed from 6.19.7)
>     new: Unpatched/version-in-range: Needs backporting (fixed from 7.0rc2)
>   CVE-2026-23328:
>     old: Unpatched/version-in-range: Needs backporting (fixed from 6.19.7)
>     new: Unpatched/version-in-range: Needs backporting (fixed from 7.0rc3)
>   CVE-2026-23333:
>     old: Unpatched/version-in-range: Needs backporting (fixed from 6.19.4)
>     new: Unpatched/known-affected: No known resolution
>   CVE-2026-23341:
>     old: Patched/fixed-version: only affects 6.19.4 onwards
>     new: Patched/fixed-version: only affects 6.19 onwards
>   CVE-2026-23355:
>     old: Unpatched/version-in-range: Needs backporting (fixed from 7.0rc3)
>     new: Patched/cpe-stable-backport: Backported in 6.18.18
>   CVE-2026-23371:
>     old: Unpatched/version-in-range: Needs backporting (fixed from 6.19.7)
>     new: Unpatched/version-in-range: Needs backporting (fixed from 7.0rc3)
>   CVE-2026-23374:
>     old: Unpatched/version-in-range: Needs backporting (fixed from 6.19.7)
>     new: Unpatched/version-in-range: Needs backporting (fixed from 7.0rc3)
>   CVE-2026-23377:
>     old: Unpatched/version-in-range: Needs backporting (fixed from 6.19.7)
>     new: Unpatched/version-in-range: Needs backporting (fixed from 7.0rc3)
>   CVE-2026-23389:
>     old: Unpatched/version-in-range: Needs backporting (fixed from 6.19.7)
>     new: Unpatched/version-in-range: Needs backporting (fixed from 7.0rc3)
>   CVE-2026-23394:
>     old: Unpatched/version-in-range: Needs backporting (fixed from 6.19.1=
0)
>     new: Unpatched/version-in-range: Needs backporting (fixed from 7.0rc5)
>=20
> Best regards,
> Daniel
>=20
> > -----Original Message-----
> > From: Benjamin Robin <benjamin.robin@bootlin.com>
> > Sent: Friday, 17 April 2026 15:32
> > To: openembedded-core@lists.openembedded.org; Daniel Turull
> > <daniel.turull@ericsson.com>
> > Subject: Re: [PATCH] improve_kernel_cve_report: use numeric versions
> > instead of cpeApplicability
> >=20
> > [You don't often get email from benjamin.robin@bootlin.com. Learn why t=
his
> > is important at https://aka.ms/LearnAboutSenderIdentification ]
> >=20
> > Hello Daniel,
> >=20
> > On Friday, April 17, 2026 at 3:24=E2=80=AFPM, daniel.turull@ericsson.co=
m wrote:
> > > From: Daniel Turull <daniel.turull@ericsson.com>
> > >
> > > git shas or versions should be use instead of cpeApplicability.
> > > Reuse the same logic as generate-cve-exclusions, so outputs are consi=
stent.
> > >
> > > cpeApplicability does not provide accurate version information and for
> > > some  CVEs the information is not the same. This came from a
> > > discussion that we had with Greg Kroah-Hartma, member of the Linux
> > security team.
> >=20
> > Indeed "cpeApplicability" does not provide the same kind of information=
 that
> > the "versions" node.
> > In sbom-cve-check (the latest version in main branch) we are using both
> > sources of information.
> > But you are saying that "cpeApplicability" does not provide accurate ve=
rsion
> > information. Could you elaborate and give various examples? I never saw
> > something invalid in "cpeApplicability".
> >=20

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




