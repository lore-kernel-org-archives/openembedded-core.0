Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67533108E1FD
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 12:03:47 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9380.1773921818226380805
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 05:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ji/i0AwV;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B92101A2E2D;
	Thu, 19 Mar 2026 12:03:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8E2415FDEB;
	Thu, 19 Mar 2026 12:03:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE3C410450703;
	Thu, 19 Mar 2026 13:03:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773921814; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Yl5/EsL1kfqTGk9kv9yAE5EQaaoziLyWL9NnX+MDsW0=;
	b=ji/i0AwVNRjnuW6acfLhFRr8V6QgOpajX41hmdv2Yk2AGQ/HIXeP5h3F5s7r6iWIuC0znX
	+exGeBdkXM2HQ/smwkKAWowHdphJMz250+K6s68zv710iRi5h1fUO3x3yTGkCBcnmNXARA
	h5gZvLnMkahAS4aX/1ie+usU4gwDpG9ZAgedQLX824Du/j6FenLxXxrNuQ4x49RP3axXHz
	8tbHR5Id5ESr7I/pAjj039y814TqRqKiMQ+USKerIPWJoUXdGBnn8c+ldfOjJtUES1CFje
	OfuyqmpUmjTDYeRWiJD87UFOOl7jPQTB/kbXSciraD2a4XcuhIIfE7v23PoxPg==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>, ross.burton@arm.com,
 peter.marko@siemens.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com,
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com,
 thomas.petazzoni@bootlin.com
Subject: 
 Re: [OE-core] [PATCH RFC 0/2] sbom-cve-check: Download CVE DB using BitBake
 fetcher
Date: Thu, 19 Mar 2026 13:03:31 +0100
Message-ID: <2323982.Icojqenx9y@brobin-bootlin>
In-Reply-To: 
 <CAApg2=SpoAyoJrwL_f6jfX5Putwj_dzeYH1FnBnqJQOsKSQbGQ@mail.gmail.com>
References: 
 <20260309-add-sbom-cve-check-p2b-v1-0-09165cddfcf1@bootlin.com>
 <2750263.Lt9SDvczpP@brobin-bootlin>
 <CAApg2=SpoAyoJrwL_f6jfX5Putwj_dzeYH1FnBnqJQOsKSQbGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 12:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233525

On Thursday, March 19, 2026 at 1:00=E2=80=AFPM, Marta Rybczynska wrote:
> On Thu, Mar 19, 2026 at 10:48=E2=80=AFAM Benjamin Robin <benjamin.robin@b=
ootlin.com>
> wrote:
>=20
> > Hello Marta,
> >
> > On Thursday, March 19, 2026 at 9:58=E2=80=AFAM, Marta Rybczynska wrote:
> > > On Thu, Mar 19, 2026 at 9:45=E2=80=AFAM Benjamin Robin via
> > lists.openembedded.org
> > > <benjamin.robin=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> > > > I have just a slight implementation "detail" if we are using BitBake
> > > > fetcher. What is the license that we should use for the sources?
> > > > How to declare that in the recipes?
> > > >
> > > > Because the license of the repositories:
> > > >  - https://github.com/CVEProject/cvelistV5 : Their is none
> > > >  - https://github.com/fkie-cad/nvd-json-data-feeds/tree/main/LICENS=
ES
> > > >    It looks like custom license.
> >
> > > The CVE project repo does not have a licence included, but it is cove=
red
> > by
> > > https://www.cve.org/legal/termsofuse (the usage part). It is basically
> > MIT.
> > >
> > > NVD has the specific,  licence, the one that is in the repo. A warnin=
g on
> > > the
> > > needed disclosure sentence in all documentation.
> >
> > So for you, it is fine to declare that the CVE databases are MIT?
> >
>=20
> CVE database is MIT
> NVD (so also FKIE) is custom

NVD license is apparently "cve-tou" which is available in Yocto.

> >
> > > AUTOREV isn't great here because it will re-fetch for each build. So =
if
> > > you're
> > > building multiple images or platforms (in CI or so), you will get
> > > potentially different
> > > results. cve-check has a set of variable to handle such use cases. You
> > pin
> > > to one specific release and do the whole checking with one single com=
mon
> > > version.
> >
> > Yes, that is why I initially pushed to use my custom fetcher that is
> > doing a git pull / shallow clone. With this fetcher I have a full contr=
ol
> > on the update period.
> >
> > But if we want to use BitBake fetcher, an user could pin to a specific
> > version instead of using AUTOREV. But the user needs to to that manuall=
y.
> >
> >
> I agree with Richard that using a git fetcher (or other existing fetcher)
> is a better
> idea than developing a custom fetcher.

I am preparing a v5 of the patch series based on this RFC series, which is
going to use the BitBake fetcher.

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




