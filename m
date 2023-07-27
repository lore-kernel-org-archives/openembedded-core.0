Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7092DC001E0
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:18:30 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.8573.1690467503392843161
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=coGJDpeW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 04E43FF80D;
	Thu, 27 Jul 2023 14:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690467501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uQjT5teSQb/lZhcHbHoh8ftoYeV+NpEeAXsO0l0SyMc=;
	b=coGJDpeWFXuP+r43hGjVunNAcjR4bcq9oll7wTwVHSlMatpIQXMRXfE284/ZREoYcRr+4H
	urBunOXLA7cfwqHciJ4y8n8H5wUCpioahChWGHeHLq16lOVqUslljIiBHeFVEa6i6iY4D3
	D0Jn3PeAYZLdL6EH02V+Zpk5WFTgqMzLDKAMu+MmlJZJD+VuNEMqZhz9O5f1NPnlpDgQdS
	N5WLCo8sIpZSnLQPaFjYzH7S7rzLnKAthEeTxqVSXVCWd/stodFMKJvByF4cwF3nIWBAth
	C34ZAlDiAS0b29LYzXUllfzvSjvLosPPENp2IW3ORvnhoe0kBZwaZQD1cjUISA==
Date: Thu, 27 Jul 2023 16:18:20 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Piotr =?utf-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	Alex Stewart <alex.stewart@ni.com>
Subject: Re: ODP: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Message-ID: <20230727141809d2150cbd@mail.local>
References: <20230726092228.1005306-1-p.lobacz@welotec.com>
 <VI1PR04MB5373AD2BB745671859678D699100A@VI1PR04MB5373.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1PR04MB5373AD2BB745671859678D699100A@VI1PR04MB5373.eurprd04.prod.outlook.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184938

Hello,

I sent this to the autobuilders and I got the same reproducibility
failure as earlier:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3263/steps/13/logs/stdio

I'm not sure why you wouldn't see those.

On 26/07/2023 09:27:53+0000, Piotr Łobacz wrote:
> 
> Hi Alexandre, Alex,
> Thx for supporting me, I have finally discovered the issue regarding this packages differences.
> It occurred that I was badly comparing two strings for tarformat comparison. Now it is fixed and should finally work.
> 
> This has been additionally tested with oe-selftest -r reproducible.
> 
> BR
> Piotr
> 
> Od: Piotr Łobacz <p.lobacz@welotec.com>
> Wysłane: środa, 26 lipca 2023 11:22
> Do: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
> DW: Piotr Łobacz <p.lobacz@welotec.com>
> Temat: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add support for ACLs and xattr 
>  
> Extend OPKGBUILDCMD variable, with additional parameters, depending
> on target distro features, in order to support ACLs and xattr.
> 
> With fix pushed to the opkg-devel:
> https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8
> opkg-build is able to create tar archives with ACLs and xattr.
> 
> Signed-off-by: Piotr Łobacz <p.lobacz@welotec.com>
> ---
>  meta/classes-global/package_ipk.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/package_ipk.bbclass
> index b4b7bc9ac2..a0f106e4ad 100644
> --- a/meta/classes-global/package_ipk.bbclass
> +++ b/meta/classes-global/package_ipk.bbclass
> @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET = "${WORKDIR}/opkg-sdk-target.conf"
>  PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
>  
>  # Program to be used to build opkg packages
> -OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
> +OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-X', '', d)}'
>  
>  OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
>  OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
> -- 
> 2.34.1

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184875): https://lists.openembedded.org/g/openembedded-core/message/184875
> Mute This Topic: https://lists.openembedded.org/mt/100367408/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

