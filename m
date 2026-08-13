Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ADA2C5CFEB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 07:21:11 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13831.1786605669745405300
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 00:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=O5P0zyZz;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 73D864E411DE;
	Thu, 13 Aug 2026 07:21:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 33768602B8;
	Thu, 13 Aug 2026 07:21:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7F08511C4DA0D;
	Thu, 13 Aug 2026 09:21:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786605662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K6kjScpSIhwSeJkDlgmmpiIizZbFDRxTtkz00PfWb1c=;
	b=O5P0zyZz1HYAsDzaKby9SR1stwwc6DXtfnC67MIc/EJ9MPVWHLbHN9MyvzonOcSHRskz7b
	xx/cMjTuyXC9PwLhYjYBAV3wZh6xYxO3D/1gK9nIFLjImnz4+s2H+erNfFAhw8qZqYeell
	iEnbBvXs7SPGb9nXIGAVzMGeZi2ayrXhKvT374Z+i3+PTeVB5zO7ct4HUfJmtRDmE3AcuQ
	PTWtUk3e3u+5+4o7yqU2vVNDkzkyUEfM9BSw9/M+WJlk4aGTzwIW5wB3TT1QX8TOX59H2J
	Z2AEWo6XjRyCjGbJV0DJl9bz5P+TRt+4NM9KIAE80iEfLoogxw2FzXfjvl86aw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 09:21:00 +0200
Message-Id: <DKNMULYY5WRL.1AGY4AN1ETRUY@bootlin.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: add strip process for signed
 kernel modules
Cc: <openembedded-core@lists.openembedded.org>, <ross.burton@arm.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Bougrine Anis" <anis.bougrine10@gmail.com>
References: <20260812130655.15109-1-anis.bougrine10@gmail.com>
 <DKN0I9BUB6PD.3V0CQ1YVMPXDN@bootlin.com>
 <CAGgtUzaO1g+CXpoOi-aUgYNYF-8SGOVvWNWnJvOXFsLjCjVYmQ@mail.gmail.com>
In-Reply-To: <CAGgtUzaO1g+CXpoOi-aUgYNYF-8SGOVvWNWnJvOXFsLjCjVYmQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 07:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243336

Hi,

On Wed Aug 12, 2026 at 5:46 PM CEST, Bougrine Anis wrote:
> Hi Antonin,
>
> I took your suggestion into account. A v2 patch may look like this:
>
>     if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
>         # If the module will be auto-signed, perform stripping before
> signing.
>         if [ "$(./source/scripts/config --file ./.config --state
> MODULE_SIG)" =3D y ] &&
>            [ "$(./source/scripts/config --file ./.config --state
> MODULE_SIG_ALL)" =3D y ]; then
>             export INSTALL_MOD_STRIP=3D"--strip-debug
> --remove-section=3D.comment --remove-section=3D.note --preserve-dates"
>         fi
>         oe_runmake DEPMOD=3Decho
> MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}
> INSTALL_FW_PATH=3D${D}${nonarch_base_libdir}/firmware modules_install
>     fi
>
> However, I think grepping the .config file is more reliable, since its
> location inside ${WORKDIR} is more stable than the location of the config
> script.

Can you use the script directly from the source using S?

${S}/scripts/config --file ./.config --state ...

Also, if you know the config file is always going to be in your current wor=
king
directory, then you can do:

${S}/scripts/config --state ...

Since the default value for --file is "./.config".

So your conditions would look like:

if [ "$(${S}/scripts/config --state MODULE_SIG)" =3D "y" ] && [ "$(${S}/scr=
ipts/config --state MODULE_SIG_ALL)" =3D "y" ]; then

(not tested)

Antonin

