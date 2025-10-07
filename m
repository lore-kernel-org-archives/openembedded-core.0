Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE99CCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 07:34:42 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.13400.1759822470811785093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 00:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BY6LaV/a;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5C045C085E0;
	Tue,  7 Oct 2025 07:34:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B509E606EB;
	Tue,  7 Oct 2025 07:34:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6FA6102F210E;
	Tue,  7 Oct 2025 09:34:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759822468; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AOi4qat+keBlyoo73UBpEF+XHPuwooQEVi2GzQYZcn4=;
	b=BY6LaV/aCJ1PKX02LxH2A6LDMjQeXuJf5Y0XRW8x2M+7n6lPjia6J4pTXDuZaT4TmFIUY+
	bfS6gB/AM8/I9nMEA2334w5WKILpBZii9uHdPSgNN1va9IrUWdGMsFJjXI9LW/Zzd8Vzx4
	q+6vn5OYFjIfoyXwAduaj11pByDQ11lbj9+VreUQFkitBLj2aJva9XTRAcRiXiXxXoYa1v
	yGhyxhq6UF6KzAjmFBxBS5BWmrjrXBesagWzA1Fbt2CyhPn2oJKImXj8Q1roOEUyozwsun
	2vCdL+Mcp1XThxCAawQz6AmoR4QmpgcggpsKvS0MJzN5pQuzK0JIGyzOSTmzbw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Oct 2025 09:34:21 +0200
Message-Id: <DDBWZY3PMFQU.1HP666LHFOD0H@bootlin.com>
To: <reatmon@ti.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] linux-firmware: Move all firmware into
 sub-packages
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251006170804.9664-1-reatmon@ti.com>
In-Reply-To: <20251006170804.9664-1-reatmon@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 07:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224513

On Mon Oct 6, 2025 at 7:08 PM CEST, Ryan Eatmon via lists.openembedded.org =
wrote:
> A lot of the firmware has already been broken out into sub-packages, but
> a good number were still lingering in the base linux-firmware package.
>
> This patch does two things:
>
> 1) Move all of the remaining firmware into sub-packages based on the
> driver name in the WHENCE file or into existing sub-packages where a
> file or two were missed.
>
> 2) Create a new REMOVE_UNLICENSED variable and do_install() logic to
> allow for marking certain firmware files as something to remove and not
> package up.  The intention is that in the WHENCE file, a number of
> firmware files have no license information or very questionable
> declarations as to what the license is for the firmware.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---

Hi Ryan,

Thanks for your patch.

It looks like some files are not shipped correctly:

ERROR: linux-firmware-1_20250917-r0 do_package: QA Issue: linux-firmware: F=
iles/directories were installed but not shipped in any package:
  /lib/firmware/ess
  /lib/firmware/ttusb-budget
  /lib/firmware/emi62
  /lib/firmware/myricom
  /lib/firmware/sun
  /lib/firmware/yamaha
  /lib/firmware/korg
  /lib/firmware/vicam
  /lib/firmware/acenic
  /lib/firmware/yam
  /lib/firmware/qcom/sa8775p/LEMANS-EVK-tplg.bin
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/2542

Can you fix it please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


