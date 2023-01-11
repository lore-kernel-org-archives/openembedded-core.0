Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA38FC46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 11:21:29 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.21311.1673436083039364555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 03:21:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IzSvQ9i3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6B24020012;
	Wed, 11 Jan 2023 11:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673436080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3KeHfElBz1tifjvtLXVAsW9CJxX8SfEsjaUkK6OYfTQ=;
	b=IzSvQ9i3Ti8vLh2IVo0QtLnDjswiMriwRppGexKggWUIYViAt6y9ULxqWy2XnfgrjTGiX6
	mpp1xTel4/H2O6N4BTH/oTbld5L8tzt/hSM/bAWgC2xPoaAJGJSfUN9EWg98xxIcm+dEyk
	e7dw3GBV4NcWpmzEJ73xLe20+uUPR0VMhLDFXxhtuHfWIrrrR+cB9JLirtgUMqmU84rfbM
	RGNEuPwvWUJuli2/Y2jFclFrwZsQI7pF074P996IAWJv2EJI0JPf6u6GCZqnHVugxQ/Urj
	PkS8AYltz13AQAxIhrr02sYY846LMgIVEXPvoxXJQ/QmhVPys5TBlFl2ON1YDg==
Date: Wed, 11 Jan 2023 12:21:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] systemd: ship pcrphase/measure tools and
 units in systemd-extra-utils
Message-ID: <Y76bsFZfkoctrpuB@mail.local>
References: <20230110222227.314983-1-luca.boccassi@gmail.com>
 <20230110222227.314983-2-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230110222227.314983-2-luca.boccassi@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 11:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175732

Hello,

This doesn't apply on master because of 5ace3ada5c54 ("systemd:
'${systemd_unitdir}/system' => '${systemd_system_unitdir}'"), can you
rebase?

On 10/01/2023 22:22:27+0000, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> New tooling related to signed TPM policies introduced in v252
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
>  meta/recipes-core/systemd/systemd_252.4.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/meta/recipes-core/systemd/systemd_252.4.bb b/meta/recipes-core/systemd/systemd_252.4.bb
> index d745d60fe6..fa9c709293 100644
> --- a/meta/recipes-core/systemd/systemd_252.4.bb
> +++ b/meta/recipes-core/systemd/systemd_252.4.bb
> @@ -527,12 +527,15 @@ FILES_${PN}-extra-utils = "\
>                          ${bindir}/systemd-stdio-bridge \
>                          ${base_bindir}/systemd-ask-password \
>                          ${base_bindir}/systemd-tty-ask-password-agent \
> +                        ${systemd_unitdir}/system/initrd.target.wants/systemd-pcrphase-initrd.path \
>                          ${systemd_unitdir}/system/systemd-ask-password-console.path \
>                          ${systemd_unitdir}/system/systemd-ask-password-console.service \
>                          ${systemd_unitdir}/system/systemd-ask-password-wall.path \
>                          ${systemd_unitdir}/system/systemd-ask-password-wall.service \
>                          ${systemd_unitdir}/system/sysinit.target.wants/systemd-ask-password-console.path \
>                          ${systemd_unitdir}/system/sysinit.target.wants/systemd-ask-password-wall.path \
> +                        ${systemd_unitdir}/system/sysinit.target.wants/systemd-pcrphase.path \
> +                        ${systemd_unitdir}/system/sysinit.target.wants/systemd-pcrphase-sysinit.path \
>                          ${systemd_unitdir}/system/multi-user.target.wants/systemd-ask-password-wall.path \
>                          ${rootlibexecdir}/systemd/systemd-resolve-host \
>                          ${rootlibexecdir}/systemd/systemd-ac-power \
> @@ -540,12 +543,17 @@ FILES_${PN}-extra-utils = "\
>                          ${rootlibexecdir}/systemd/systemd-bus-proxyd \
>                          ${systemd_unitdir}/system/systemd-bus-proxyd.service \
>                          ${systemd_unitdir}/system/systemd-bus-proxyd.socket \
> +                        ${rootlibexecdir}/systemd/systemd-measure \
> +                        ${rootlibexecdir}/systemd/systemd-pcrphase \
>                          ${rootlibexecdir}/systemd/systemd-socket-proxyd \
>                          ${rootlibexecdir}/systemd/systemd-reply-password \
>                          ${rootlibexecdir}/systemd/systemd-sleep \
>                          ${rootlibexecdir}/systemd/system-sleep \
>                          ${systemd_unitdir}/system/systemd-hibernate.service \
>                          ${systemd_unitdir}/system/systemd-hybrid-sleep.service \
> +                        ${systemd_unitdir}/system/systemd-pcrphase-initrd.service \
> +                        ${systemd_unitdir}/system/systemd-pcrphase.service \
> +                        ${systemd_unitdir}/system/systemd-pcrphase-sysinit.service \
>                          ${systemd_unitdir}/system/systemd-suspend.service \
>                          ${systemd_unitdir}/system/sleep.target \
>                          ${rootlibexecdir}/systemd/systemd-initctl \
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175725): https://lists.openembedded.org/g/openembedded-core/message/175725
> Mute This Topic: https://lists.openembedded.org/mt/96188492/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

