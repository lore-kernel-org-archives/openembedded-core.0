Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF13E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 09:44:33 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.6994.1733910272737508033
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 01:44:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kWnjzdli;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4161020002;
	Wed, 11 Dec 2024 09:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733910271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fAh35U/sLtDVwgeKBd9e2VsBCU2IM8CIO2TaTeij5U8=;
	b=kWnjzdliXIFnIuZMXXdulg76kwfgzQfUsdREcIvlIHMhBPT44sm+TLFH/3s0XFiuTcxLmx
	RpPYai2ZUhmUJiZmfgmy78ddW3N30Ye+sWaF8tUlNb0PWPKMHUFOLjX/nS189hfnqJWJXy
	AFpqVJjIZWRvcfgy24rlKIGDMi5aWoel7fKG0Nl6lO/UVvbZMwO4i2pCRSkC7WeCBhTryi
	phZVj2uUpPwzllKw7HFA4fKHLiS9MqpecRmAXzhq0xHtPTXUcaIaYsazrC4py6K6hhINkj
	+W1tg43JXU12EakuUxmtQ3Les3tZGsfzG5ASotR3uVFU8XLaaD9xTG3BljiXFA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Dec 2024 10:44:30 +0100
Message-Id: <D68RW5L3YYXZ.1QVI9872WFLMS@bootlin.com>
To: <bruce.ashfield@gmail.com>, <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/6] poky/poky-tiny: update default to v6.12
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <cover.1733864271.git.bruce.ashfield@gmail.com>
 <96fdaf0aab7a75c7dbf9e5bee583ac3c6353f262.1733864271.git.bruce.ashfield@gmail.com>
In-Reply-To: <96fdaf0aab7a75c7dbf9e5bee583ac3c6353f262.1733864271.git.bruce.ashfield@gmail.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 09:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208574

On Tue Dec 10, 2024 at 10:06 PM CET, Bruce Ashfield via lists.openembedded.=
org wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> The 6.12 kernel is a LTS and our next reference kernel, so
> we bump our default to it.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---

Hi Bruce,

> --- a/meta-poky/conf/distro/poky.conf
> +++ b/meta-poky/conf/distro/poky.conf
> @@ -19,8 +19,8 @@ POKY_DEFAULT_EXTRA_RRECOMMENDS =3D "kernel-module-af-pa=
cket"
> =20
>  DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_F=
EATURES}"
> =20
> -PREFERRED_VERSION_linux-yocto ?=3D "6.10%"
> -PREFERRED_VERSION_linux-yocto-rt ?=3D "6.10%"
> +PREFERRED_VERSION_linux-yocto ?=3D "6.12"
> +PREFERRED_VERSION_linux-yocto-rt ?=3D "6.12%"
> =20

Is removing the '%' match in PREFERRED_VERSION_linux-yocto wanted ? I
believe this is responsible for a lot of new warnings, such as:

stdio: WARNING: preferred version 6.12 of linux-yocto not available (for it=
em linux-yocto)
stdio: WARNING: versions of linux-yocto available: 6.12.3+git 6.6.64+git
stdio: WARNING: preferred version 6.12 of linux-yocto not available (for it=
em virtual/kernel)
stdio: WARNING: versions of linux-yocto available: 6.12.3+git 6.6.64+git
stdio: WARNING: preferred version 6.12 of linux-yocto not available (for it=
em kernel-module-tun)
stdio: WARNING: versions of linux-yocto available: 6.12.3+git 6.6.64+git
...

https://valkyrie.yoctoproject.org/#/builders/29/builds/623/steps/13/logs/wa=
rnings


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


