Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF0C10987A3
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 16:14:55 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16941.1774023289653238656
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 09:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=pklbOWvq;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 927F91A2F03;
	Fri, 20 Mar 2026 16:14:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67274600E0;
	Fri, 20 Mar 2026 16:14:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC4E610450CA3;
	Fri, 20 Mar 2026 17:14:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774023286; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=g0N4E5ZsGWCpTMxSvy7I2tWzlzTGfOCehd3cZvtC/bA=;
	b=pklbOWvqjcjh/MWUNxTWtEHBps04UOvR70p/8LjULKppHr7J346dIGwSdmGKo8RPmA0jJ/
	rym7AXusmWuDnGOB16pRKgDlwyHct3TxJ5ITlho1+qdJM2UBHC8yWln19nzp0AcB5JVJE8
	iw5Uqfojbi+jPkPTAZql6Cr9kpqYDP0e/xTWw41NWzvptF8ICM0MS91PBUKj/rmhFNMrYq
	4rj9dOJgA0mDOjj04MEQIkffqP02NsjiUBcYJrtlMwLdMWAvP4ZlSvnwNuRjU/ODEWnq39
	OKZLKjXQVC8cPln/6HX/VG1foAzojm+yC7ceYx9LETcTnG7c2w6c1rSrVSG0jA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 richard.purdie@linuxfoundation.org, ross.burton@arm.com,
 peter.marko@siemens.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com,
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v6] sbom-cve-check: Add class for post-build CVE analysis
Date: Fri, 20 Mar 2026 17:14:44 +0100
Message-ID: <9699867.rMLUfLXkoz@brobin-bootlin>
In-Reply-To: 
 <CAApg2=QPoTedChybGx6gC8pQek57mfxd0jrtFZwBmJ5YyJ=ZhQ@mail.gmail.com>
References: 
 <20260319-add-sbom-cve-check-v6-0-cfc657daa6b7@bootlin.com>
 <20260319-add-sbom-cve-check-v6-1-cfc657daa6b7@bootlin.com>
 <CAApg2=QPoTedChybGx6gC8pQek57mfxd0jrtFZwBmJ5YyJ=ZhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 16:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233617

Hello Marta,

On Friday, March 20, 2026 at 4:54=E2=80=AFPM, Marta Rybczynska wrote:
> > ---
> >  meta/classes-recipe/sbom-cve-check.bbclass         | 121
> > +++++++++++++++++++++
> >  meta/conf/distro/include/maintainers.inc           |   2 +
> >  meta/conf/fragments/yocto/sbom-cve-check.conf      |  14 +++
> >  meta/recipes-core/meta/sbom-cve-check-config.inc   |   4 +
> >  .../meta/sbom-cve-check-update-cvelist-native.bb   |  12 ++
> >  .../recipes-core/meta/sbom-cve-check-update-db.inc |  28 +++++
> >  .../meta/sbom-cve-check-update-nvd-native.bb       |  12 ++
> >  7 files changed, 193 insertions(+)
> >
> >
> Hello,
> That looks cleaner than the previous version. How long does the intiial
> build take with
> this fetcher?
>=20
> Kind regards,
> Marta

I am not sure to understand the question.

With this fetcher, the duration of the initial clone is a "bit" slower,
since we are not doing a shallow clone. If the download directory is
not deleted, the initial fetch is done only once.

The fetch can be realized in parallel with the build of the packages,
and it really depends of your internet connection and of the build
machine.

But if I run:

$ bitbake -c cleanall sbom-cve-check-update-cvelist-native \
   sbom-cve-check-update-nvd-native

=46ollowed by:

$ time bitbake sbom-cve-check-update-cvelist-native \
   sbom-cve-check-update-nvd-native

The time elapsed is 5m10.211s
I hope this answer your question.

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




