Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4830CCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 09:34:20 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16244.1777541658690189499
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 02:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BaTtA7xN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso4695415e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 02:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777541657; x=1778146457; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lYyb9+BS0FLVOCP6fUjfVfDNsJBJ+yUrB6DkyrSB2I=;
        b=BaTtA7xNHVsZLrUcJA+1U8VAlMVhyL2EGsZcOEsndQadKfnoc+Bnj8/92f2qWGPgYN
         kHGx32iprI96wNn01VBVgeOBwHhx3jzZAtEeXqy18Dxq5tAJQoU+ecy2hGbO5FTr20PI
         tn16VOxT7tYWRNpeVRT+169vd8ApVFAIKU4ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777541657; x=1778146457;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+lYyb9+BS0FLVOCP6fUjfVfDNsJBJ+yUrB6DkyrSB2I=;
        b=hMsfMruNAhOZhtobh4REbQs6AZ07KRbwUrPR+30+l92b+p8Dex4/IMsde25Genjopk
         VRtZJZ7R5LbaJyCSVLMmU3trj/rq65mf3e+gyfzN3nRR0pR2EHO56TmlfO2UDS+NhQXx
         gMsiCriJuUOvOJ1xl6TYR0QlyBeuz6v2+pIF2halRT9dXp9oqD7obAnTZhDBEr6Sn8uH
         zzVEknZzVquNa5+noItBafFallwJMC0J86D7Zj3yH1xWrGfMXMO9DJnn84E0v1LMaZLR
         ypLKiq75e0TCtfoUcnUVO/RqXQx204erKJfxLN4gfEnbIAsgkSW4GrknGvquKQH74qSO
         Z7Jg==
X-Forwarded-Encrypted: i=1; AFNElJ/YEScquQ6PS3zxDoqpn4qgGrbsOdf+DWD28Q5Vo2LedNO53cQRh6xkEYH1O5hBm1d3NL6lfEVES4GM4qqf7kz62g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwwXHL1MjaHVc6Te2QowsXajyrwt6elVgmdFJKMC1yObkEHhCun
	WGmOTuCWrYlex1wId0OpZtkz6Z24XZTRv/Mc93JqhYi1idOqlTsCeczM7sXnfipFrvsHZO4JgMJ
	vSWLGWFI=
X-Gm-Gg: AeBDiesWeP8raU7UL0hNKiSmIrZlQHxo4LfPgV5fkwcU4nV1pX2evekbjUUpe4Nzonc
	uC59We2HczeQjoobg/niGKBnxKdBinP4Mb9OEtl3xiJtn0cFT2ae2hZBfcIyrGWH4tr5qSt9Uaz
	mPVF5So5Had/Iq+EsdtZdb+Ojijk5O2XWgRkKM9o32lVit5iY5bRzT79x6S8MVXjmkXepsfaGCI
	lCQZQaoS8+Kg5BM93odekJtqlpJzY52GC815rKn1eo71DLhN/480PrOfp8XhBb+sjj1H0VOrObK
	LQ+4zj/cyn9RmOfS/BosFPqTJmlXnRF6ireioY6lc7vBn8KssdvbpqvrB25oPdRef8NNXS/HS+G
	xmea+FV68n1ocnp8TlTYSnTOqXiJ9OUuq4Xrk44xksrbo+qfWLnF6fHMFYg2rmeIdX96qaeD/3q
	EMozDiwSo2z7H4Iwkq7GDzqJgDmX5TRSh9a0RzKqqItCM3zpp4N2ld2w0U97nJDBz4VRtq0bzkW
	F0VXhTgCNO94d8r+bckkxJN
X-Received: by 2002:a05:600c:4e16:b0:48a:52ce:a4b1 with SMTP id 5b1f17b1804b1-48a8451cff6mr34797155e9.15.1777541656853;
        Thu, 30 Apr 2026 02:34:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c98d:ac74:daf:72a1? ([2001:8b0:aba:5f3c:c98d:ac74:daf:72a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b8ce444sm60252145e9.0.2026.04.30.02.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 02:34:14 -0700 (PDT)
Message-ID: <970a04825d236b0fe34830591ab15c5ceb6205d1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] improve_kernel_cve_report: use numeric
 versions instead of cpeApplicability
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: daniel.turull@ericsson.com, Benjamin Robin <benjamin.robin@bootlin.com>,
  "openembedded-core@lists.openembedded.org"	
 <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Apr 2026 10:34:13 +0100
In-Reply-To: <PA3PR07MB10721F2AD81A66C88C0D7D3B58A2F2@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <20260417132409.1638132-1-daniel.turull@ericsson.com>
	 <RTcJopQBQMuBZtd3st4uZA@bootlin.com>
	 <PA3PR07MB1072146E662BC68654B733C8A8A2F2@PA3PR07MB10721.eurprd07.prod.outlook.com>
	 <X57sBsVVR06ktoT6yI1WyA@bootlin.com>
	 <PA3PR07MB10721F2AD81A66C88C0D7D3B58A2F2@PA3PR07MB10721.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 09:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236152

On Mon, 2026-04-20 at 07:53 +0000, Daniel Turull via lists.openembedded.org=
 wrote:
>=20
>=20
> > -----Original Message-----
> > From: Benjamin Robin <benjamin.robin@bootlin.com>
> > Sent: Monday, 20 April 2026 09:30
> > To: openembedded-core@lists.openembedded.org; Daniel Turull
> > <daniel.turull@ericsson.com>
> > Subject: Re: [OE-core] [PATCH] improve_kernel_cve_report: use numeric
> > versions instead of cpeApplicability
> >=20
> > On Monday, April 20, 2026 at 9:10=E2=80=AFAM, Daniel Turull wrote:
> > >=20
> > > > -----Original Message-----
> > > > From: openembedded-core@lists.openembedded.org=C2=A0<openembedded-
> > > > core@lists.openembedded.org> On Behalf Of Benjamin Robin via
> > > > lists.openembedded.org
> > > > Sent: Sunday, 19 April 2026 11:07
> > > > To: openembedded-core@lists.openembedded.org; Daniel Turull
> > > > <daniel.turull@ericsson.com>
> > > > Subject: Re: [OE-core] [PATCH] improve_kernel_cve_report: use
> > > > numeric versions instead of cpeApplicability
> > > >=20
> > > > Hello Daniel,
> > > >=20
> > > > On Friday, April 17, 2026 at 6:54=E2=80=AFPM, Daniel Turull wrote:
> > > > > What I tried to say was that in this case using versions if we
> > > > > have 6.6.100 we
> > > > think we are vulnerable, but the cve was introduced in a backport i=
n
> > 6.6.102.
> > > > Only the range 6.6.102 to 6.6.112 should be vulnerable. I'll see if
> > > > I can report the issues so the source data is correct.
> > > >=20
> > > > From the version ranges:
> > > > =C2=A0-
> > > >=20
> > > > The "cpeApplicability" node says:
> > > >=20
> > > > {
> > > > =C2=A0=C2=A0=C2=A0 "vulnerable": true,
> > > > =C2=A0=C2=A0=C2=A0 "criteria": "cpe:2.3:o:linux:linux_kernel:*:*:*:=
*:*:*:*:*",
> > > > =C2=A0=C2=A0=C2=A0 "versionStartIncluding": "6.6.102",
> > > > =C2=A0=C2=A0=C2=A0 "versionEndExcluding": "6.6.112"
> > > > },
> > > >=20
> > > > So it is very clear that the first vulnerable version starts from
> > > > 6.6.102
> > > >=20
> > > > And the "versions" node says:
> > > >=20
> > > > {
> > > > =C2=A0=C2=A0=C2=A0 "version": "6.6.112",
> > > > =C2=A0=C2=A0=C2=A0 "lessThanOrEqual": "6.6.*",
> > > > =C2=A0=C2=A0=C2=A0 "status": "unaffected",
> > > > =C2=A0=C2=A0=C2=A0 "versionType": "semver"
> > > > },
> > > >=20
> > > > Which is coherent, version 6.6.112 is not vulnerable.
> > > >=20
> > > > So in summary we are having:
> > > > =C2=A0- [>=3D6.6.0, <6.6.102] =3D> not vulnerable,
> > > > =C2=A0- [>=3D6.6.102, <6.6.112] =3D> vulnerable,
> > > > =C2=A0- [>=3D6.6.112, <=3D6.6.*] =3D> not vulnerable.
> > > >=20
> > > > To have a full picture, we must use all the information
> > > > ("cpeApplicability" and "versions" nodes).
> > > > But now I am starting to understand what you are saying :)
> > > >=20
> > > > > in this case using versions if we have 6.6.100 we think we are
> > > > > vulnerable
> > > >=20
> > > > If we are only looking at the "versions" node, we may think that an=
y
> > > > version below 6.6.102 is vulnerable (e.g., the 6.6.100 version).
> > >=20
> > > Exactly.
> > >=20
> > > >=20
> > > > This is not the only CVE that is like that; a *lot* of kernel CVEs =
are in this
> > case.
> > > > So I don't know why Greg Kroah-Hartma said that cpeApplicability
> > > > nodes should not be used. Without it, the full picture of which
> > > > version is vulnerable cannot be obtained.
> > >=20
> > > I think is because if you look literally the versions without looking
> > > like a tree (which we do) the information is not correct. For example=
,
> > > imagine that the correction is 6.6.100, then any 6.7.X is not affecte=
d, but that
> > 6.6.100 was a backport and it was never backported to 6.7.X since it is=
 not
> > supported anymore.
> >=20
> > Yes I understand that, but why we should not look it like a tree? sbom-=
cve-
> > check in main branch has a special case for the kernel which do a speci=
fic
> > processing for all these version ranges provided by the kernel CNA.
>=20
> I'm not saying that we should not look that a tree. We are doing the corr=
ect thing. Only if you take the=20
> naive approach and compare versions 6.6.100 < 6.7.1, even 6.6.100 has a f=
ix and 6.7.1 not.
>=20
> > > > > If we plan to drop the script, I should probably not spend too
> > > > > much time on
> > > > the script itself but on the data quality.
> > > >=20
> > > > I don't know if we are going to drop the script.
> > > > Previously the script had some flows (and it still has), and since
> > > > sbom-cve- check (in the next release) should do better, I was going
> > > > to propose its suppression (In a few weeks).
> > >=20
> > > Can you point to the flaws, so I'm aware?
> >=20
> > The current version of improve_kernel_cve_report.py does not process th=
e
> > "versions" nodes. We need both sources of information.
> >=20
> > I did not double check if these findings are right (but at first glance=
 it looked
> > wrong):
> > =C2=A0- If at least one entry does not have versionStartIncluding defin=
ed,
> > =C2=A0=C2=A0 first_affected is going to be 0.
> > =C2=A0- It does not handle versionStartExcluding
> > =C2=A0- It does not handle the fact that we could have multiples ranges
> > =C2=A0=C2=A0 within the same branch that is vulnerable.
> > =C2=A0- Maybe there are others issues, I did not spent to much time ana=
lyzing
> > =C2=A0=C2=A0 it since I choose to use a different way to do that.
>=20
> Thanks, I need to look at start using sbom-cve-check. It is true, there a=
re a few corner cases.

Did we reach a consensus on what we should do with this patch?

We (as in patch review/triage) couldn't quite understand what the end resul=
t was!

Cheers,

Richard




