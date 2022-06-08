Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50357C43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 07:48:37 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.3810.1654674508133039016
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 00:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aMTaBBsa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0395740004;
	Wed,  8 Jun 2022 07:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654674506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rX/8h9fwGbId3unRe1S1QaUGCpPR4YB5HdNxjHjV82k=;
	b=aMTaBBsasecPwSsUOvIsl7VNwCD5mNmMbYd7M/pgsnoRcyZ05WK9s2x5SESWvGBeuIp0xo
	cyvmFnYtvuFhYhPqrIoNesIsuiIQfjGAe04XsmDELbplP/ZMSXQmm1q2fFV1UL/gHJ72jn
	ptl+amkZOjvmuc8vzZqMcvxW5G18eME/NihPOzwOW0+7vnU7DqyvZegLdzwGTqbBwtBdBz
	xODcDtHyznTKXshKMs3JF0MzS6WWQCtO8nEpKXlmY6FbvGfZD5lD7f5uh5rt5X+lMI56dc
	WwpxW8g6n3jZBGYm5ZTA+lQuU/4kYRbpOuYC6f9KPcoW9r69gpckoAVh+P/6Pw==
Date: Wed, 8 Jun 2022 09:48:24 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Jan Claussen via lists.openembedded.org"
 <claussen.j=eppendorf.de@lists.openembedded.org>
Cc: claussen.j@eppendorf.de, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] dropbear: Allow root login fix
Message-ID: <20220608094824.028155bb@booty>
In-Reply-To: 
 <AS8PR02MB8392C950253DEB9B054726B9F0A59@AS8PR02MB8392.eurprd02.prod.outlook.com>
References: 
 <AS8PR02MB8392C950253DEB9B054726B9F0A59@AS8PR02MB8392.eurprd02.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 07:48:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166694

Hi Jan,

On Tue, 7 Jun 2022 12:36:15 +0000
"Jan Claussen via lists.openembedded.org"
<claussen.j=eppendorf.de@lists.openembedded.org> wrote:

>     This enables root login when either "allow-root-login" or "debug-tweaks"
>     were set in EXTRA_IMAGE_FEATURES.
> 
>     Signed-off-by: Jan Claussen <claussen.j@eppendorf.de>

Thanks for your patch. However I have a couple comments.

First, please try to send patches using 'git format-patch' and 'git
send-email'. Otherwise the format makes it hard to apply it. Even
though this one has a better format than your previous submission
(thanks for taking care of that!), using the git tools will simplify
both yours and others' task.

> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
> index 78f9f9adbd..e545c425ab 100644
> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -105,6 +105,13 @@ do_install() {
>   -e 's,@BINDIR@,${bindir},g' \
>   -e 's,@SBINDIR@,${sbindir},g' \
>   ${D}${systemd_system_unitdir}/dropbear.socket ${D}${systemd_system_unitdir}/*.service
> +
> +    # Enable root login for dropbear when debug-tweaks or allow-root-login are set
> +    if [ "${@bb.utils.filter('EXTRA_IMAGE_FEATURES', 'debug-tweaks', d)}" \
> +         || "${@bb.utils.filter('EXTRA_IMAGE_FEATURES', 'allow-root-login', d)}" ]; then
> +            sed -i 's/-w//g' ${D}/etc/default/dropbear
> +    fi
> +
>  }

Actually I don't think this should be needed at all because
meta/classes/rootfs-postcommands.bbclass already does this.
If that doesn't work for you, then maybe you could explain your problem
so we can help you find out why.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

