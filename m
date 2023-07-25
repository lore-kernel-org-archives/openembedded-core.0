Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2442CC001DF
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 09:28:43 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.16449.1690277319655247429
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 02:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ouPKKpKe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 664AE60009;
	Tue, 25 Jul 2023 09:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690277317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wj8OtGBgywM0+umcZK4usixqepSqwHo+PdGcTtoRnjQ=;
	b=ouPKKpKeCi0nvXbIC+rqkaBY74dwiiD1A3tRfpx+aDBZGAkl5wITn/5Z4sgPgoVQZ7Ed/T
	wufbCmERgZgXi1X/ldR6iJlUHabJqMJyJd2Z37A/CpFVu4ZbXCdISpg4xDb3T7Mujccyal
	y97FRD+jRuegtm4AN34kmwb9xFZHPfjqcyMDBVlH60Q4XpzK/Fem1PrjCVXpKs4UH4c8EE
	SFp+IaZAoEmHxGGH4yD0kqoW8aDuc9Gf8vl/WCPOlaLkaiv2FkcFt9sLb5StL6m/753ls8
	5kURlOR5G8qsmSL2dARmC1I9Vo9NjtSH3vntvNzN4rIgJX6TOaXy37wz/sw+Mg==
Date: Tue, 25 Jul 2023 11:28:37 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Piotr =?utf-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: ODP: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Message-ID: <20230725092837d3f47a0f@mail.local>
References: <20230724204639.353571-1-p.lobacz@welotec.com>
 <VI1PR04MB537371C2BED481FEDB533DB89102A@VI1PR04MB5373.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1PR04MB537371C2BED481FEDB533DB89102A@VI1PR04MB5373.eurprd04.prod.outlook.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 09:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184826

Hello Piotr,

On 24/07/2023 20:50:50+0000, Piotr Łobacz wrote:
> 
> Hello Alexandre,
> this is a final patchest which works for me, even with reproducible builds, but additionally, with posix format of tar archives.
> 
> I hope that this time it will work for autobuild as well.

We are almost there, there are still reproducibility failures which I
guess where hidding in all the other other ones:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3251/steps/12/logs/stdio

This time, diffoscope ran:
https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230724-5av30jl8/packages/diff-html/

> 
> BR
> Piotr
> 
> Od: Piotr Łobacz <p.lobacz@welotec.com>
> Wysłane: poniedziałek, 24 lipca 2023 22:46
> Do: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
> DW: Piotr Łobacz <p.lobacz@welotec.com>
> Temat: [OE-Core][PATCH v10][master-next 1/5] package_ipk.bbclass: add support for ACLs and xattr 
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
> View/Reply Online (#184818): https://lists.openembedded.org/g/openembedded-core/message/184818
> Mute This Topic: https://lists.openembedded.org/mt/100337925/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

