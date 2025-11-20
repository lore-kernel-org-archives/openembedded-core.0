Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129FDCF9C7A
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 17:38:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30815.1763632102892046965
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 01:48:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WdqU7czp;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 06BC84E417E5;
	Thu, 20 Nov 2025 09:39:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CAA336068C;
	Thu, 20 Nov 2025 09:38:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10D2C10371C30;
	Thu, 20 Nov 2025 10:38:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763631539; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oBhEgaKNrXKKWrPf7LuvywA53S6m9gZy6kY83f2kkAI=;
	b=WdqU7czpZSUFQ11PJmsKg3iXrjTK0S9LARZ28jz2OOS9MFnPhInUlzWY5cVjLYbZbX2wIV
	ewfnV1zFQFsBmaqKrCC74oyIrnnCYcyFOrVCVuSVA3SrDdi7zFkp+/U1B2T3yQz3FMT3p3
	UZswP7pcdJuYHhffHufwqq+hyr3kcaRSQf5C/Va7i70Y1cJ2kkjNehGlKuoZEFtRVarLCU
	jNld80Nq1ffvp6KxVZghGywsX6XnU1HDaxqNrXuHwmMxbsP2tt0jwBk+/e5SjvOFgbpKks
	j6ePcwVUsdIyK0MjyKfmh9XsbLm0ojk0conU689d6lOtwvrGhquM5pLo0xRScw==
From: Benjamin ROBIN <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org,
 Marta Rybczynska <marta.rybczynska@syslinbit.com>,
 Samantha Jalabert <samantha.jalabert@syslinbit.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Peter Marko <peter.marko@siemens.com>
Subject: Re: [PATCH 0/5] backport: allow to extract all CVE_STATUS info
Date: Thu, 20 Nov 2025 10:38:56 +0100
Message-ID: <10765366.nUPlyArG6x@brobin-bootlin>
In-Reply-To: <20251120091954.211153-1-benjamin.robin@bootlin.com>
References: <20251120091954.211153-1-benjamin.robin@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 17:38:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226636

Hello,

Please ignore this serie, it is not ready, and was sent by mistake...
Really sorry.

On Thursday, November 20, 2025 at 10:19=E2=80=AFAM, Benjamin Robin (Schneid=
er=20
Electric) wrote:
> From: "Benjamin Robin" <benjamin.robin@bootlin.com>
>=20
> The goal of this backport is to be able to extract all CVE annotations
> provided by the CVE_STATUS and the CVE_STATUS_GROUPS variables.
>=20
> Currently only CVEs with "Patched" status are exported in SPDX 3.0 files.
> And CVE annotations provided by the CVE_STATUS_GROUPS variable are not
> exported, since previously this was only handled by cve-check.bbclass.
>=20
> Also backport the vex.bbclass, which will help users to extract all the
> information needed to do a CVE analysis outside of Yocto.
>=20
> With this backport, great care has been taken to avoid breaking
> compatibility. This is why the get_patched_cves() API was not changed.
> Everything that was needed is implemented in the associated .bbclass.
>=20
> Benjamin Robin (5):
>   spdx30: provide all CVE_STATUS, not only Patched status
>   vex.bbclass: add a new class
>   cve-check: extract extending CVE_STATUS to library function
>   spdx: extend CVE_STATUS variables
>   vex: fix rootfs manifest
>=20
>  meta/classes/cve-check.bbclass   |  17 +-
>  meta/classes/spdx-common.bbclass |   5 +
>  meta/classes/vex.bbclass         | 319 +++++++++++++++++++++++++++++++
>  meta/lib/oe/cve_check.py         |  22 +++
>  meta/lib/oe/spdx30_tasks.py      |  31 +--
>  5 files changed, 365 insertions(+), 29 deletions(-)
>  create mode 100644 meta/classes/vex.bbclass


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




