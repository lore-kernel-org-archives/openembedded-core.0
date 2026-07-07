Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25437C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 07:07:36 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.168119.1783408050970176545
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 00:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wTKxcX24;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AACB64E40CC6
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jul 2026 07:07:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 77CD7601A3;
	Tue,  7 Jul 2026 07:07:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D270911BC0C89;
	Tue,  7 Jul 2026 09:07:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783408047; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iQZ7ZC3vTrrUa8GGPCAmTxsRAcdUYN4QUAZqdeQvhrM=;
	b=wTKxcX24tZCj58PsWAoIvwKSysRQKnYs0O7vxsqKEvnBXmjKWlq5O7LHu9sTXHgzvgrTAb
	qh94afZ2HOrWQVfmLzYvh6JR3g8UqDKO0OfXVa1nwwBof+mfQLyxO0h0mEGZSmYhqXAkEp
	D3R55kb3WpA9OCmEYzxztxuWHNbQghniI6CRnaWHUfrYJbYQ+H3M66zQ6Tp1GfE/CE83q0
	Ja+UllZPq5085iAtda9nPUlLJDEJShSs0G0NuOUxYLoWHp4NwUnBsOo+ZTTAuGbAlG26/3
	HQJJkOR95AlN8off6McOv5N3Qq9d8Dw++YLgN4d977TcWHrWqkDCRAAkYNl6Eg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 09:07:26 +0200
Message-Id: <DJS5E22GVH5B.13AM4AQJRI639@bootlin.com>
Subject: Re: [OE-core] [PATCH 4/4] systemd: Ship /srv with the package
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <joerg.sommer@navimatix.de>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <5380f2caab9ad346667be7997955839e0825c8bc.1783357184.git.joerg.sommer@navimatix.de> <f5a84b83c1d675a4aae0b7b8c65209353820e887.1783357184.git.joerg.sommer@navimatix.de>
In-Reply-To: <f5a84b83c1d675a4aae0b7b8c65209353820e887.1783357184.git.joerg.sommer@navimatix.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 07:07:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240361

On Mon Jul 6, 2026 at 6:59 PM CEST, J=C3=B6rg Sommer via lists.openembedded=
.org wrote:
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>
> If *volatile-binds* gets removed from RDEPENDS, the /srv directory is not
> part of the image, and tmpfiles tries to create it on boot, but fails on =
a
> read-only rootfs:
>
> systemd-tmpfiles: /srv does not exist and cannot be created as the file s=
ystem is read-only.
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---

Hi J=C3=B6rg,

You probably also need to modify the FILES variable, as we get this
error on the autobuilder:

ERROR: systemd-1_259.5-r0 do_package: QA Issue: systemd: Files/directories =
were installed but not shipped in any package:
  /srv

https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/4061
https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/4078
https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/4041
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/4105

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


