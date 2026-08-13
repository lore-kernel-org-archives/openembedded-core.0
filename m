Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E0EC5CFEB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 11:56:19 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17303.1786622172052825656
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 04:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jCycKAoP;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DAAD84E411EF;
	Thu, 13 Aug 2026 11:56:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A781F602B8;
	Thu, 13 Aug 2026 11:56:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00C3A11C4DE3B;
	Thu, 13 Aug 2026 13:56:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786622165; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2pTlSbfwFgj7gW2lVEQygpYdUON/oFjKHV0U39PM1Ys=;
	b=jCycKAoP9Lp7UtdzXbG1U10F/TwbX6juvjKGAhV8tlB/RVjqcy2ioyoWHj90iG4hwJw4LD
	HdoAbwF5iXzbi368XzwlbBOiCsz48JFweAWUDFQgdT0SEeGMGWivgk071iQmAdVoiq25XL
	r3eUpjOSLTDQwCcm3k77Kp+1OhH1baga62CrddUXMi/i606KBws9HhOetCegDqWVpxPkxl
	7Z+LTT0gR4pbJVjaHM/qWNGTA5MDo0YpIiQIz9PSeRVtj9OcZnPFcuugAk8vVfLfmOVPfD
	DUcNMy73oR88ivbGnOoaZKon+7aXv37pvdj1x4N6R8Mx1slpTRwYE8wO2psswA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: Peter Marko <peter.marko@siemens.com>,
 openembedded-core@lists.openembedded.org, Paul Barker <paul@pbarker.dev>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Yoann Congal <yoann.congal@smile.fr>, Ross Burton <ross.burton@arm.com>
Subject: Re: [wrynose][RFC PATCH 00/11] sbom-cve-check update
Date: Thu, 13 Aug 2026 13:56:02 +0200
Message-ID: <DTPlCxvbRoqnuQ1EM7zERg@bootlin.com>
In-Reply-To: <2edd57716d5a827ffe58d9001323098a045be7a6.camel@pbarker.dev>
References: 
 <20260808105147.42294-1-peter.marko@siemens.com>
 <2edd57716d5a827ffe58d9001323098a045be7a6.camel@pbarker.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 11:56:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243350

On Thursday, August 13, 2026 at 1:46=E2=80=AFPM, Paul Barker wrote:
> On Sat, 2026-08-08 at 12:51 +0200, Peter Marko wrote:
> > This series updates sbom-cve-check tooling in wrynose to current master.
> > Unfortunately it shows that having cve-check tooling in upstream
> > components violates LTS patch acceptance policies.
> >=20
> > In this case the most visible is python3-shacl2code (1.0.1 -> 1.1.0),
> > but also sbom-cve-check-update-nvd-native introduces new features
> > (which is actually the reason why this upgrade is wanted).
> > For now this should not be a big issue as all the dependencies are very
> > new and used exclusively in cve-check, however by time they may be used
> > in other recipes or tooling, too.
> >=20
> > So I am sending this series as RFC to discuss future of CVE checking on
> > LTS branches.
> > * should we go with this series as is (possibly updating policy text)?
> > * or are we stuck with old code for next 3.5 years?
> > * or separate the tooling to meta-sbom-cve-check which would only have
> >   master branch to service all currently supported releases?
> > * or create mixins layer (to be also used by AB cve-metrics jobs)?
> > * or are there some other suggestions how to rework this series?
> >=20
> > My preference would be to have cve-check aligned for all supported
> > releases (even scarthgap), so I would welcome opinions and discussion
> > on this topic.

Hello Peter,

Thank you for taking the time to create this series. I had been planning
to work on it, but I was a bit busy :)=20

>=20
> Hi Peter,
>=20
> The TSC has discussed this series and is happy for sbom-cve-check to be
> updated on wrynose. It's in line with the expectations we had when
> wrynose was released, and the upstream maintainer is involved.
>=20
> For scarthgap it's a different question. That still has the
> cve-check.bbclass implementation instead of sbom-cve-check, this would
> be whole new framework rather than a set of updates. I wonder if this
> can be handled via an LTS mixin layer instead of a backport in OE-core?

Hello Paul,

Technically, I think we could backport sbom-cve-check to scarthgap, but
indeed it still has the cve-check.bbclass implementation.                  =
                                                                           =
                                                                           =
                                                                           =
                   =20
                                                                           =
                                                                           =
                                                                           =
                                                                           =
               =20
sbom-cve-check can be run outside of Yocto, but if you want it integrated  =
                                                                           =
                                                                           =
                                                                           =
          =20
into Yocto, there's already a layer for that:                              =
                                                                           =
                                                                           =
                                                                           =
          =20
https://github.com/bootlin/meta-sbom-cve-check                             =
                                                                           =
                                                                           =
                                                                           =
          =20
                                                                           =
                                                                           =
                                                                           =
                                                                           =
               =20
However, I need to update it to version 1.3.3.

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




