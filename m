Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D826FF60DE
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 07:56:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15199.1774943770323563003
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 00:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=eJFLq37g;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 57772C5994C;
	Tue, 31 Mar 2026 07:56:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DF7676029D;
	Tue, 31 Mar 2026 07:56:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A727104507B3;
	Tue, 31 Mar 2026 09:56:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774943767; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=A4HlLecqt/8N48OKriGmvzFfAdUIqWFdULtnDwyCCz0=;
	b=eJFLq37g9EKsFlFthMDf1wxMbndpWMKOJonkDDZTv6teM34Tm5p2wErxsWrhCi5rhS1e3p
	hrO2/02DvMXnP4NJ2p+tWZbq+WrzUz+moZYrCSRQvV/kdhtzgX6gG3anXt76EEvizk0do6
	CgKuwikIroBXgIg7XKw+JfTAGAJd/Pk6eCFIMXRduGNW3IhAaXiJeHFKndsYUT4k9J/TGM
	uMyVdvs7hn6a/vpZhNGSuufzfTksmlvtfl0GxMYW0EV/t61dY6XlRx6Gq/G//eTJmA/HB6
	RxVwBmnfKpsdm16/qGpxvDQGonZ8Ylkbw1NeXEDA5REnGtAFO8M2A4lrig74ew==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 31 Mar 2026 09:56:04 +0200
Message-Id: <DHGT1WW8V5AK.Z5TAGIFLEW4F@bootlin.com>
Subject: Re: [OE-core] [PATCH v7 1/6] signing-keys.bb: Fix DISTRO_CODENAME
 truncation
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adam.duskett@amarulasolutions.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260330095849.119621-1-adam.duskett@amarulasolutions.com>
In-Reply-To: <20260330095849.119621-1-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 07:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234269

On Mon Mar 30, 2026 at 11:58 AM CEST, Adam Duskett via lists.openembedded.o=
rg wrote:
> If DISTRO_CODENAME is not set in the environment, bash quietly
> drops the string resulting in a key such as PACKAGEFEED-GPG-KEY-defaultse=
tup-
>
> However, when python calls self.d.getVar('DISTRO_CODENAME'), the resultin=
g
> string is 'None', leading to a configuration file pointing to a key such
> as PACKAGEFEED-GPG-KEY-defaultsetup-None
>
> Add a default value in signing-keys.bb to set DISTRO_CODENAME to None if
> DISTRO_CODENAME is not set.
>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---

Hi Adam,

Thanks for your patch.

It looks like we get some new warning with this patch:

WARNING: core-image-minimal-1.0-r0 do_rootfs: [log_check] core-image-minima=
l: found 1 warning message in the logfile:
[log_check] Warning: skipped OpenPGP checks for 39 packages from repository=
: oe-repo

It appears in most builds on the autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/3461
https://autobuilder.yoctoproject.org/valkyrie/#/builders/78/builds/3521
https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/3342
...

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


