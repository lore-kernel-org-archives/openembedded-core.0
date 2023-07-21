Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D15EB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 22:01:33 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.18807.1689976889468323342
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 15:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gkcgyNPe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67BB020002;
	Fri, 21 Jul 2023 22:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689976886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eeqQamNGIfOWyNUnagRoYZng1SzBgXFw8bBXyJNmnuc=;
	b=gkcgyNPeusXzORHM0Zo96V1cOYmriQpFUptmyiQNVl6JRWmicQK2bqfZ3FNBZnLFgeUzhJ
	pAm/he+tp+9qWoRuPHdEUIKufSlJO43iM6mkwYKisN+NMFXzFehLErkIOemqLn74MlMPW3
	hcfR/Zs+arpzvblgDxd5qKB1U+nJXRT+VNCil4qq++I8w4WXb+SdIKzIGXhgirJa2qu4w7
	okb8ARLulH/VH2m0brwHsRXuL9SbqmX4C5u8zpx0UWOW3DeypKMPZso2WwQrHtYQ1UomO5
	fJUNFsuQvNuxYxTd1VvqnOxuOqol5R06S2wTgpDFIupk9uwjwDhdfKFlmJdOFA==
Date: Sat, 22 Jul 2023 00:01:26 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Piotr =?utf-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-Core][PATCH v7][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
Message-ID: <20230721220126165c5136@mail.local>
References: <20230721120723.4006443-1-p.lobacz@welotec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230721120723.4006443-1-p.lobacz@welotec.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 22:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184710

I confirm this still fails on the autobuilders:

This is a-full:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5631

On 21/07/2023 14:07:19+0200, Piotr Łobacz wrote:
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
> index b4b7bc9ac2..5e151be3cd 100644
> --- a/meta/classes-global/package_ipk.bbclass
> +++ b/meta/classes-global/package_ipk.bbclass
> @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET = "${WORKDIR}/opkg-sdk-target.conf"
>  PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
>  
>  # Program to be used to build opkg packages
> -OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
> +OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}" "${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)}" "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-X', '', d)}"'
>  
>  OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
>  OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184688): https://lists.openembedded.org/g/openembedded-core/message/184688
> Mute This Topic: https://lists.openembedded.org/mt/100275318/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

