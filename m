Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DFFC5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 12:09:06 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11411.1786709340037118594
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 05:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qnjValIt;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B8F621A14FE;
	Fri, 14 Aug 2026 12:08:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 87B2E6046D;
	Fri, 14 Aug 2026 12:08:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B2D211C4EC31;
	Fri, 14 Aug 2026 14:08:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786709332; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SolEAtV/tPDFtPcwlbibr0i5oO5CSoclyk+lzVzh93o=;
	b=qnjValItnYhinbK4o38FICEzAUics+8fslJItz4K4uxvuhN0RkiIebgNaTXZZNUJ/VFSIc
	P87Kn97c1J1aBe61ESm0zf418sTK9F3pEHBYSXPnQgzU2rnkSZZ1J4ZYqdVQbzQzu27tJt
	n7G6x7NMhoXLkZ8GXffdthcf8h9sAYUvqBLwLQhdkUTrW4gGbWdu/JZxeTVXmniYGcsIzH
	+ryaQxn6V7KjWKRIz/70XtUJ4YcrCrZjmVW8GKiDsFFwEsdxP9Q2coszf8uVJsMWPUE1CE
	Lorp+dgKKem0va671v7oGcxKglSY6txUMiVo6ydgecOh/k8xX+z1jTjegDqr2Q==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Paul Barker <paul@pbarker.dev>,
 "Marko, Peter" <Peter.Marko@siemens.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Yoann Congal <yoann.congal@smile.fr>, Ross Burton <ross.burton@arm.com>
Subject: Re: [wrynose][RFC PATCH 00/11] sbom-cve-check update
Date: Fri, 14 Aug 2026 14:08:49 +0200
Message-ID: <T8RuCurQSHGCk8QRPy2f9A@bootlin.com>
In-Reply-To: 
 <AS8PR10MB5073987C262BD37F31AA9174FDDB2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <20260808105147.42294-1-peter.marko@siemens.com>
 <DTPlCxvbRoqnuQ1EM7zERg@bootlin.com>
 <AS8PR10MB5073987C262BD37F31AA9174FDDB2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 12:09:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243448

On Friday, August 14, 2026 at 12:05=E2=80=AFAM, Marko, Peter wrote:

> > On Thursday, August 13, 2026 at 1:46=E2=80=AFPM, Paul Barker wrote:
> > > On Sat, 2026-08-08 at 12:51 +0200, Peter Marko wrote:
> > > > This series updates sbom-cve-check tooling in wrynose to current ma=
ster.
> > > > Unfortunately it shows that having cve-check tooling in upstream
> > > > components violates LTS patch acceptance policies.
> > > >
> > > > In this case the most visible is python3-shacl2code (1.0.1 -> 1.1.0=
),
> > > > but also sbom-cve-check-update-nvd-native introduces new features
> > > > (which is actually the reason why this upgrade is wanted).
> > > > For now this should not be a big issue as all the dependencies are =
very
> > > > new and used exclusively in cve-check, however by time they may be =
used
> > > > in other recipes or tooling, too.
> > > >
> > > > So I am sending this series as RFC to discuss future of CVE checkin=
g on
> > > > LTS branches.
> > > > * should we go with this series as is (possibly updating policy tex=
t)?
> > > > * or are we stuck with old code for next 3.5 years?
> > > > * or separate the tooling to meta-sbom-cve-check which would only h=
ave
> > > >   master branch to service all currently supported releases?
> > > > * or create mixins layer (to be also used by AB cve-metrics jobs)?
> > > > * or are there some other suggestions how to rework this series?
> > > >
> > > > My preference would be to have cve-check aligned for all supported
> > > > releases (even scarthgap), so I would welcome opinions and discussi=
on
> > > > on this topic.
> >=20
> > Hello Peter,
> >=20
> > Thank you for taking the time to create this series. I had been planning
> > to work on it, but I was a bit busy :)
> >=20
> > >
> > > Hi Peter,
> > >
> > > The TSC has discussed this series and is happy for sbom-cve-check to =
be
> > > updated on wrynose. It's in line with the expectations we had when
> > > wrynose was released, and the upstream maintainer is involved.
> > >
> > > For scarthgap it's a different question. That still has the
> > > cve-check.bbclass implementation instead of sbom-cve-check, this would
> > > be whole new framework rather than a set of updates. I wonder if this
> > > can be handled via an LTS mixin layer instead of a backport in OE-cor=
e?
>=20
> Paul,
>=20
> as the meta-sbom-cve-check layer shows, sbom-cve-check can co-exist with =
the old cve-check.
> It does not have to be the super-invasive with breaking change.
>=20
> So in theory it should be pretty easy to copy 3 classes and bunch of supp=
ort recipes.
> But I'm also fine with having an external layer for that.
>=20
> Question is if Yocto project would also switch cve-metrics to the sbom-cv=
e-check.
> That would of course highly increase the open CVE numbers but would also =
help identify missing CVE fixes.
>=20
> >=20
> > Hello Paul,
> >=20
> > Technically, I think we could backport sbom-cve-check to scarthgap, but
> > indeed it still has the cve-check.bbclass implementation.
> >=20
> > sbom-cve-check can be run outside of Yocto, but if you want it integrat=
ed
> > into Yocto, there's already a layer for that:
> > https://github.com/bootlin/meta-sbom-cve-check
>=20
> Benjamin,
>=20
> This is super cool.
> However, cve-metrics uses sbom-cve-check-recipe, which is not part of thi=
s layer.
> When updating, please consider adding it.
>=20
> Peter

Peter,

I will be on vacation, so I won=E2=80=99t have time to work on this.
=46eel free to create a PR to add this feature. I don't know if it's possib=
le
to simply add `sbom-cve-check-recipe` to Scarthgap=E2=80=94I haven't checke=
d yet=E2=80=94but
I have some slight doubts about it (though I could be completely wrong).


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




