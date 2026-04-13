Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4B2EBFD07
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 07:05:29 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.266651.1776063922507239161
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 00:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uXKvgl9c;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 54A564E429EC;
	Mon, 13 Apr 2026 07:05:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CC995FFB9;
	Mon, 13 Apr 2026 07:05:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6C6910451B9D;
	Mon, 13 Apr 2026 09:05:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776063919; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R/OwkEMPFGwwg90dF08eBPKuXSnvh2IQcXboN4otdbE=;
	b=uXKvgl9cb8KDaIuLp70mWFPZHvjBMyIUnRoR36LY86O6asmFUaIBW83usemhZBEIoliqbs
	TXJRmu7pZCuD2Dg3VlIBTzVWzEJadnfLw2HkBiF93CEvXXxLzG6kY6GLNG6i0/Fks+AzMR
	Kee/MHbduJlGMAQDr2BitWwdDwQ7B86GBma0gQuO0iUN2wWoI+PdrZjRZzfWyObGMIRx/b
	gsQ0Jh24ViMbawoYmbGBI8p5XowB3imVIH91RfMKeUv6bzZ+R4U/iOVolbm5WL3KR8d2/D
	B/07hz1m6CXRWTlbIDVJMsfMY0U9CKbba/nKooVpskk01rl630UQ3GxfsfjmAQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: Ross Burton <ross.burton@arm.com>,
 "Marko, Peter" <Peter.Marko@siemens.com>
Cc: 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] xwayland: set status for CVE-2024-21886
Date: Mon, 13 Apr 2026 09:05:17 +0200
Message-ID: <3410842.44csPzL39Z@brobin-bootlin>
In-Reply-To: 
 <AS1PR10MB56973C7FC237B95B05B7B1DBFD272@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <20260412185201.2556780-1-peter.marko@siemens.com>
 <13986342.uLZWGnKmhe@brobin-bootlin>
 <AS1PR10MB56973C7FC237B95B05B7B1DBFD272@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 07:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235087

On Sunday, April 12, 2026 at 11:01=E2=80=AFPM, Marko, Peter wrote:
> > From: Benjamin Robin <benjamin.robin@bootlin.com>
> > This should not be possible. With default configuration a manual
> > annotation cannot be overwritten. sbom-cve-check directly use the
> > annotation without any extra processing.
>=20
> I wonder what I'm doing wrong when using this new code for the first time=
=2E..
> When I got to the "new" CVE for ovmf, cve-metrics shows only CVE-2024-129=
8.
> In my local build, I get all the CVEs (which are se to fixed-version in t=
he recipe).
>=20
> RECIPE=3Dovmf; bitbake $RECIPE -c sbom_cve_check_recipe; jq -r '.package[=
] | select(.name =3D=3D "'$RECIPE'") | .issue[]? | select(.status =3D=3D "U=
npatched") | .id' tmp/deploy/images/qemux86-64/$RECIPE-recipe-sbom.sbom-cve=
=2Dcheck.yocto.json
> CVE-2014-4859
> CVE-2014-4860
> CVE-2014-8271
> CVE-2019-14553
> CVE-2019-14559
> CVE-2019-14562
> CVE-2019-14563
> CVE-2019-14575
> CVE-2019-14586
> CVE-2019-14587
> CVE-2024-1298
>=20
> My local.conf is:
> DISTRO =3D "poky"
> INHERIT +=3D "sbom-cve-check-recipe"
> SRCREV:pn-sbom-cve-check-update-cvelist-native =3D "82e18eb3051039642ed8e=
c0b8eb15ea27dbbf52c"
> include conf/distro/include/cve-extra-exclusions.inc

I still cannot reproduce your issue.
Could you share these 2 files (by email and compressed, and maybe only to m=
e):
 - ovmf-recipe-sbom.spdx.json
 - ovmf-recipe-sbom.sbom-cve-check.yocto.json

If you also have a KAS configuration file of your current setup, this will
be great.

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




