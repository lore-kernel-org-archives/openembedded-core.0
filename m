Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E827C001DE
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 15:04:35 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.27277.1690124671547450092
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 08:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XgX2cLh0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8FE2940003;
	Sun, 23 Jul 2023 15:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690124669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fZoQlJXzhJDmtLRdllBf8iRYc2nmegjon4nbn74VRRs=;
	b=XgX2cLh0NyL1AX33qWO21Y4MxU9GgBBfPh0UuJAobA452E8wMth3/EwFJ0bAQdcUH+/hyq
	IZf/QbQv041MidQyoyD5p1W8RR3j91xw/7C/dEIeAMtN/+giLjYX3sjmsy0p+gtTrGL8tC
	IlV07pRk9Eav/X0RzztDehSFqSWX4OG02cT5LrznjD9RBKd83Kw/dtYE5IxvajlfK+pyZk
	XcBFrvctELbzISGv1k9gZ75anPRmy/PjRGbLjPcsDZf3oRHe1NKXNWj0eo44aqm7xYZnj7
	lzQCxfJCe1U8I45wGYTXdEOki3sQT4qyYq7WQpIoB0tF8xei7999gqKsbpIVkQ==
Date: Sun, 23 Jul 2023 17:04:28 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Piotr =?utf-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: ODP: [OE-Core][PATCH v8][master-next 1/5] package_ipk.bbclass:
 add support for ACLs and xattr
Message-ID: <202307231504286d15f3bc@mail.local>
References: <17744C0B55ADA271.25264@lists.openembedded.org>
 <AM6PR04MB5368ED123188D5223D0F14B7913CA@AM6PR04MB5368.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM6PR04MB5368ED123188D5223D0F14B7913CA@AM6PR04MB5368.eurprd04.prod.outlook.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 15:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184756

Hello,

On 22/07/2023 21:03:43+0000, Piotr Łobacz wrote:
> Hello Alexadre,
> this time everything should be fixed and working :D I have tested it thrice:P
> 
> Additionally I've discovered that somehow, during all these patchsets, an extra param "--numeric-owner" has gone from opkg-build script,
> which is important to store uid(s)/gid(s) as numbers instead of names in tar archive. An updated patch has been already pushed to opkg-utils
> upstream.
> 
> You can run it and tell if everything is OK.
> 

This ran and mostly worked. The remaining issue is the reproducibility
issue:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230722-1a1a_7s6/

Unfortunately, diffoscope is not running on that large set.

> BR
> Piotr
> 
> 
> Od: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> w imieniu użytkownika Piotr Łobacz via lists.openembedded.org <p.lobacz=welotec.com@lists.openembedded.org>
> Wysłane: sobota, 22 lipca 2023 22:55
> Do: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
> DW: Piotr Łobacz <p.lobacz@welotec.com>
> Temat: [OE-Core][PATCH v8][master-next 1/5] package_ipk.bbclass: add support for ACLs and xattr
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
>  meta/classes-global/package_ipk.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/package_ipk.bbclass
> index b4b7bc9ac2..a0f106e4ad 100644
> --- a/meta/classes-global/package_ipk.bbclass
> +++ b/meta/classes-global/package_ipk.bbclass
> @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET = "${WORKDIR}/opkg-sdk-target.conf"
>  PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
> 
>  # Program to be used to build opkg packages
> -OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
> +OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-X', '', d)}'
> 
>  OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
>  OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
> --
> 2.34.1

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184740): https://lists.openembedded.org/g/openembedded-core/message/184740
> Mute This Topic: https://lists.openembedded.org/mt/100301979/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

