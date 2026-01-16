Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58734D4A61A
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 09:41:45 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2556.1768556503706654817
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 01:41:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YtIweOPZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A45D61A28A6;
	Fri, 16 Jan 2026 09:41:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 74ABB60732;
	Fri, 16 Jan 2026 09:41:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40CF610B689AC;
	Fri, 16 Jan 2026 10:41:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768556501; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=azXv46iEgpxtT9didyOwQjt+tNz0RdroniYO/xh/qqM=;
	b=YtIweOPZAEjIbFEvXxxecN6p5CVXDP86tFSr2rz2nyhkXy21LxT2Y0Hk7p9qcOtPRipm4H
	dvUXXCnRiuxtDyhM3Szoxr4Dk3sgLYoSgBA/1h34EFFFF0Bv8ESm8ZcJsEDFssZLs3RLww
	VGWR10r+UaS695uqfuCqO9j2gCreyfuvabp+tokZjOz52yWX5si7kK4ebUIHoeVI+qjhdn
	FDBga74kUeTHn1jIP/NbmphOP6r1Raz22IFu2lTDCexpA7a3GBBw6L2eiuaVU46FhjbXzs
	8SWJf/Aflb4I1bPxYHqPiU4zfTgUCEQMOP/cz1mdNELCX8ySLGnGPfysjcX3SA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 10:41:39 +0100
Message-Id: <DFPWYFPKCFJX.2BQFT0MCMX3QY@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <adam.duskett@amarulasolutions.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] systemd: upgrade from 258.1 to 258.3
References: <20260115132728.3570868-1-adam.duskett@amarulasolutions.com>
In-Reply-To: <20260115132728.3570868-1-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 09:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229537

Hi,

This triggers the following error on our test infrastructure:

[  868.041774] systemd-ssh-generator[11355]: Failed to query local AF_VSOCK=
 CID: Cannot assign requested address
[  869.652338] systemd-ssh-generator[11392]: Failed to query local AF_VSOCK=
 CID: Cannot assign requested address
[  871.124628] systemd-ssh-generator[11428]: Failed to query local AF_VSOCK=
 CID: Cannot assign requested address
[  873.574975] systemd-ssh-generator[11479]: Failed to query local AF_VSOCK=
 CID: Cannot assign requested address
[ 1080.239169] systemd-ssh-generator[12943]: Failed to query local AF_VSOCK=
 CID: Cannot assign requested address
[ 1084.241817] systemd-ssh-generator[12998]: Failed to query local AF_VSOCK=
 CID: Cannot assign requested address

Not sure what this relates to, but is failing when our qemu runners using
systemd as the init manager. Can you have a look / try to reproduce?

Full logs:
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4980270/raw_inlin=
e

Corresponding build:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/3021

Also fails in multiples builders using systemd (suffixed with "-alt") as yo=
u can
see from:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3065

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


