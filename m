Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2A8C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 14:35:57 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.18321.1736778952301698326
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 06:35:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Km8wJ4Jb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3325AE0004;
	Mon, 13 Jan 2025 14:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736778950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tegM2HdYiZlgikMm1jLF9VQUE+sKgSUXYgInMY5jnv4=;
	b=Km8wJ4Jb+OI++R3pKoZNp9Xl4Tth0iK4FtkvQtgJHSrtjfVXpHM06xm8sT+XAyzkLt1+Vl
	9+nUkGE/HVpNVP/u1hEnfjq9PbLf/Hf9HXPBRkjyjrO9RDMB2kVeEY6qx2SzOTIfD6LC8E
	3Vm3tNnamn+eF/XP0zGigHKMWgL5L0n+gllWbgyxGo8LNC7ujd7v+wq6NFOVo7BItnUu/i
	z8otvv3sfN9c1D4ZjOhh5YsR7btbU0XRTlgbFIoL5SfqgMD0LFO4+7M/bnzmsH6nABMDJy
	97bRxYM2ZHmBvty7v5XvfokBgbgw2e9usYLcSteUSHLlvVRsLBL6VH8+puLTug==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jan 2025 15:35:49 +0100
Message-Id: <D710R6V2XEBY.19RQYXU7LEJO3@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <chris.laplante@agilent.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/7] De-globalization of 'devtool'
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250112145359.607585-1-chris.laplante@agilent.com>
In-Reply-To: <20250112145359.607585-1-chris.laplante@agilent.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 14:35:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209730

On Sun Jan 12, 2025 at 3:53 PM CET, Chris Laplante via lists.openembedded.o=
rg wrote:
> From: Chris Laplante <chris.laplante@agilent.com>
>
> This patchset removes global variables from the 'devtool' script. It
> also changes `Context` to be a dataclass.
>
> All devtool self-tests pass, tested via: oe-selftest -r devtool
>
> Chris Laplante (7):
>   devtool: un-globalize the 'basepath' variable
>   devtool: un-globalize 'workspace' variable
>   devtool: un-globalize 'context' variable and convert it to a dataclass
>   devtool: un-globalize 'config' variable
>   devtool: un-globalize 'plugins' variable
>   devtool: misc cleanups
>   devtool: remove unused 'config' param from '_create_workspace' method
>
>  scripts/devtool | 88 +++++++++++++++++++++++++------------------------
>  1 file changed, 45 insertions(+), 43 deletions(-)
>
> --
> 2.43.0

Hi Chris,

I believe this series is breaking some builds on the autobuilder. We
got the following error:

devtool: error: argument <subcommand>: invalid choice: 'sdk-install' (choos=
e from create-workspace, add, modify, extract, sync, rename, update-recipe,=
 status, reset, finish, edit-recipe, find-recipe, configure-help, import, d=
eploy-target, undeploy-target, build-image, ide-sdk, search, menuconfig, up=
grade, latest-version, check-upgrade-status, build, export)

https://valkyrie.yoctoproject.org/#/builders/80/builds/725/steps/13/logs/st=
dio

Can you have a look at this issue please ?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


