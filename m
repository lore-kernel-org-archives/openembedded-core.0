Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4CACDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 07:36:10 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.6202.1697096166994148315
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 00:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mtAFJ+Rc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09B4F24000F;
	Thu, 12 Oct 2023 07:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697096164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1LhTylTH7FWYT883dfUD6/p9n6RNmWocUBeP5fYnv3I=;
	b=mtAFJ+RcoRjn9OxnPojPiRYh6t8Xpmo1GCaGCF+pSyCb3Cu7Nk8w6z+xMdFcOoGDKvdbM9
	DBMQ5Qzgp9Ez41wmw8A34zVTOw0tk+2jMmdPNoJzW/cr5EzCV1dzfpivo/VAr4J8a/PCRk
	+1v0dcTBoTD9kQa5icHd7vCJF2+XbkTwEx0CFze06ybTo4TBpbu/+FCcuB+hht1j0i63p4
	O2gMFQJff+uqL0JVMt77JaIds/j19jzMx6gh2N6GwxmuupYm2Ix5QkRthbDtSYVKrjZ2OR
	9FrXUS81b10xukcy5E1eo1I5WnqnYTmhtG066FajpmipVPZwezX57mzciSEaPg==
Date: Thu, 12 Oct 2023 09:36:03 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Pavel Zhukov" <pavel@zhukoff.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 1/4] dummy-sdk-package.inc: Filter packages
 which are marked for installation
Message-ID: <20231012093603.53a79e61@booty>
In-Reply-To: <20231009144001.21150-1-pavel@zhukoff.net>
References: <20231009144001.21150-1-pavel@zhukoff.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 07:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188989

Hello Pavel,

On Mon,  9 Oct 2023 16:39:58 +0200
"Pavel Zhukov" <pavel@zhukoff.net> wrote:

> if packages is provided by dummysdk and in the same time marked for
> installation with IMAGE_INSTALL it causes conflict in apt because virtual providers are
> not taken into account if package is asked to be installed explicitly.
> Filter such packages from provides/conflicts to workaround this problem.
> This workaround brakes RPM usecase because of file conlicts with
> DUMMYPROVIDES, use DUMMYPROVIDES_PACKAGES_MULTILIB instead (which
> doesn't include file based conflicts).
> While this is needed for the case of package_deb only adding it for all
> package managers to not complicate the code.
> 
> Fixes: [Yocto #13338] [Yocto #14066]
> 
> Fixes:
> The following information may help to resolve the situation:
> 
> The following packages have unmet dependencies:
>  target-sdk-provides-dummy : Conflicts: bash
> E: Unable to correct problems, you have held broken packages.
> 
> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>

Testing with this series applied results in lots of errors like these:

stdio: ERROR: core-image-minimal-1.0-r0 do_rootfs: No SPDX file found for package base-files, False sstate:base-files:qemux86_64-poky-linux:3.0.14:r0:qemux86_64:11: sstate:base-files::3.0.14:r0::11:
stdio: ERROR: core-image-minimal-mtdutils-1.0-r0 do_rootfs: No SPDX file found for package base-files, False sstate:base-files:qemux86_64-poky-linux:3.0.14:r0:qemux86_64:11: sstate:base-files::3.0.14:r0::11:

See the full log at:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5894/steps/14/logs/stdio

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

