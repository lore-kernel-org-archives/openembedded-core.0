Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC6C1075280
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 09:07:34 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6894.1773911230089438062
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 02:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GfMehXdu;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 31A081A2EFA;
	Thu, 19 Mar 2026 09:07:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 056965FDEB;
	Thu, 19 Mar 2026 09:07:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 331571045069D;
	Thu, 19 Mar 2026 10:07:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773911227; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eXkx1/+dvOvp8BpgrvPljt2MtqPMNHt3vbbCJhYpwM4=;
	b=GfMehXduYj6iDDmB7f6NKFhX2Q1b96etwwMepev14md6Nfg8OYdqUfoLEG7XFfeZ2Mi5lv
	cjH3DutDLVnxgKvcktT6y6ebZW01deGogNnIhGH3hi5PnZjDXSzdorh+MMS6SGDkBQ+Vit
	uFNWZnA+AapfsAL3qOLiNoxwh/d2XDz0DSoTRecFlSeTKdUqOqcF4zgk156N9S+lGfA2IB
	b4qk2kyAjrRfyQIxmodrMvAKzJt1t2H1wOYJJHa/py625mFbXCx58nITRZhyFND4Kztkgc
	9h8EmQnb9yX4szHfMfm/yeJ0n/iMQ553ZAMX/EUMcN4FcN6JXnhgfGTVKbg+Pg==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: Marta Rybczynska <rybczynska@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com,
 peter.marko@siemens.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com,
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com,
 thomas.petazzoni@bootlin.com
Subject: 
 Re: [OE-core] [PATCH RFC 0/2] sbom-cve-check: Download CVE DB using BitBake
 fetcher
Date: Thu, 19 Mar 2026 10:07:04 +0100
Message-ID: <1908188.VLH7GnMWUR@brobin-bootlin>
In-Reply-To: 
 <793e23609ccbbd3e139136ee8243d6ed2d116a55.camel@linuxfoundation.org>
References: 
 <20260309-add-sbom-cve-check-p2b-v1-0-09165cddfcf1@bootlin.com>
 <CAApg2=T6f1yQ8qQFF+V3K+0yhpZWscDUqO+pXA2MK0jik3C4Yw@mail.gmail.com>
 <793e23609ccbbd3e139136ee8243d6ed2d116a55.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 09:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233470

Hello Marta and Richard,

On Thursday, March 19, 2026 at 8:52=E2=80=AFAM, Richard Purdie wrote:
> On Thu, 2026-03-19 at 08:29 +0100, Marta Rybczynska wrote:

> > Fetching the complete git repos has a number of problems. Why not use r=
elease
> > tarballs like those in  https://github.com/CVEProject/cvelistV5/release=
s ?
> > Fkie feeds also have them https://github.com/fkie-cad/nvd-json-data-fee=
ds/releases

Here the reasons:
 - Fetching the tarballs is quite complex to implement. This was done
   in cve-update-db-native.bb. To do that we must use a custom fetcher
   because we cannot expect the user to manually update the URL each
   time a new CVE analysis needs to be done.
 - Also, sbom-cve-check is expecting a git repository. It does not
   support a simple extraction of the CVE database.
 - sbom-cve-check also expects one JSON file per CVE, which is not
   the case with release tarball for FKIE. This is a simple compressed
   JSON file.

> FWIW we can shallow clone git repos, it is just isn't optimal in how
> updates are handled which was Benjamin's concern as the shallow clones
> end up more like tarballs.
>=20
> If we use the bitbake fetcher, it also makes it much easier to actually
> use tarballs directly too, since the fetcher also supports those and it
> just becomes a simple SRC_URI change.

If we are using BitBake fetcher, with tarballs, the download directory
is going to be filled with a lot of version of the CVE databases.
This is really inefficient.

=46or cvelistV5 the release zip file is the roughly the same size that
the git shallow clone.

=46or https://github.com/fkie-cad/nvd-json-data-feeds/releases
this is not even an option to use tarball since sbom-cve-check is
not compatible with this format.

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




