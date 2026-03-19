Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46FA1075273
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 08:46:04 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6461.1773909956716799496
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 01:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cqVYqlfn;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 952791A2EE0;
	Thu, 19 Mar 2026 08:45:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6BE855FDEB;
	Thu, 19 Mar 2026 08:45:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D8D31045094F;
	Thu, 19 Mar 2026 09:45:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773909953; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mBm9uyR4rlM3UBV56/Cif4LMMx5cBVuNJED6qVtDiSA=;
	b=cqVYqlfnIRD0VdB2nMKOrCFlp/kJNuyLyi/lhh3HtnLpgnCGqvFQYuiTHrr1c6iVwv+HaK
	7XYysnlOLNRIYwniX+FieO8arl2USkh1CaGodyQ76QWccqWR+A9mRd5JufNcjbd7DfPzZs
	UCys4G9VyNjq+REsu2jBcRyAo5biS30bXYW8w+R0qyBwKAnSb1gfrq0zbjBaJlZipaCzcW
	AOW8UIfKxEsx2Of97DTIji3Mqb5vtLM8+x3BWwlZu2mwCiHDvyZOauFw1F5JZc23Z6wlEb
	GpK7EBtIQcNcI0/3xhkRASJC9AymA1d2X93eAeOrCDoOaBCwSVo2/Zz7LjeN2A==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com,
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com,
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com
Subject: 
 Re: [OE-core] [PATCH RFC 0/2] sbom-cve-check: Download CVE DB using BitBake
 fetcher
Date: Thu, 19 Mar 2026 09:45:50 +0100
Message-ID: <8711656.T7Z3S40VBb@brobin-bootlin>
In-Reply-To: 
 <64a1484a196d4e9c603ec6dda598c6a8c4b91606.camel@linuxfoundation.org>
References: 
 <20260309-add-sbom-cve-check-p2b-v1-0-09165cddfcf1@bootlin.com>
 <64a1484a196d4e9c603ec6dda598c6a8c4b91606.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 08:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233467

Hello Richard,

On Wednesday, March 18, 2026 at 6:45=E2=80=AFPM, Richard Purdie wrote:
> I've just been trying to work out where we're at with this coming up to
> release and we need to get this resolved.
>=20
> I feel quite strongly that we need to use the fetcher for obtaining
> this data. "fetching" isn't trivial and is full of
> license/auditing/sbom issues. Making any exception to that, even for
> cve data tends to become problematic later.

I have just a slight implementation "detail" if we are using BitBake
fetcher. What is the license that we should use for the sources?
How to declare that in the recipes?

Because the license of the repositories:
 - https://github.com/CVEProject/cvelistV5 : Their is none
 - https://github.com/fkie-cad/nvd-json-data-feeds/tree/main/LICENSES
   It looks like custom license.

cve-update-db-native.bb is specifying MIT but this is kind of a lie.
I have done the same on my recipes for now...
=20
> The existing approach was only done as it was a sqlite database and we
> didn't have fetcher support for such a thing.

The recipes used to download the CVE databases for the cve-check class
are downloading tarballs. Yes these recipes are going to create a sqlite
database from that. But these recipes implements there own fetcher to
simply download a tarball.
That is why I thought I could implement my own fetcher, which is way
simpler than the update_db_file() in cve-update-db-native.bb which is
quite complex.

> If we need to improve the
> git fetcher in some way to better support this use case (e.g. shallow
> clone update efficiency), that is something we can work on.

Well that was my plan, but for the LTS release this was going to be too
short. So in the meantime I preferred to used a custom fetcher which
was implemented in the other RFC (or in the v4 of the original series).

> As such, I was wondering if you had never versions of these patches?

I sent 2 RFCs, one using my own fetcher, and one using the internal
fetcher (this series). And I sent a v4 of the original series.

> I'd note that we can't set AUTOREV by default, we'll need to specify a
> revision, and document how the user can enable AUTOREV in their config
> (maybe even a config fragment?). Whilst it is annoying to do that, it
> is a requirement that the system doesn't touch the network outside
> mirrors unless configured to.

If we can't use AUTOREV by default, which I understand, a config fragment
is the way to go (I think), with sane default to enable sbom-cve-check.
If the user want specific configuration, they can create their own
configuration. The config fragment would set:
 - IMAGE_CLASSES +=3D "sbom-cve-check"
 - SRCREV:pn-sbom-cve-check-update-nvd-native =3D "${AUTOREV}"
 - SRCREV:pn-sbom-cve-check-update-cvelist-native =3D "${AUTOREV}"
 - SPDX_INCLUDE_VEX =3D "all"
 - SPDX_INCLUDE_COMPILED_SOURCES:pn-linux-yocto =3D "1"

Also, what do you think about the deployment of the CVE databases
done using rsync? Do you have a better idea?

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




