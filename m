Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCDAC6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 13:42:04 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.43214.1679492516421514847
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 06:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=anJ1NFaT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 21F991BF207;
	Wed, 22 Mar 2023 13:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679492514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1vfaIsacvo+9rUN7jI2QJ3Q6YOPiCHS0mgCL25qAwxg=;
	b=anJ1NFaTWiG2iX7LGDpvcR1cag7qEwndTVc/YKPZs0cscscMsWZ7TAPF0RTkQdsISMxVuQ
	zFvpTOhtX3b9EolyumuMyAZV5CmxsV0mWqz76J9/3TDp9HZKljjmC3TjlUXQvfcYKflHWI
	PotJNlo3BZwy5xZsfGbdrlGPTXj0bwrbU32W2JvqzhAuS2VSm4VV90GYlGfLZqtMR0gj63
	7+7oUuHr7Dw8/7us4NROlUEL6uY5+niu3aFrual/X1v6AAfOV3zhPYvl11iuMAqbRXInKO
	psnNbmsNUBFDgRuadMGOsO4p82J6Joe9Ecqx9uhuTsbFymnl7Gr2BCH+fgUhgQ==
Date: Wed, 22 Mar 2023 14:41:53 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] lib/oeqa: add __init__.py
Message-ID: <20230322134153d56095ae@mail.local>
References: <AM6PR09MB3091CD0EFBD24354A1A80FF6A8809@AM6PR09MB3091.eurprd09.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR09MB3091CD0EFBD24354A1A80FF6A8809@AM6PR09MB3091.eurprd09.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 13:42:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178922

Hello,

This breaks the buils on the AB:

meta-mingw
https://autobuilder.yoctoproject.org/typhoon/#builders/89/builds/6880/steps/17/logs/stdio

oe-selftest:
https://autobuilder.yoctoproject.org/typhoon/#builders/127/builds/1146/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#builders/80/builds/4912/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#builders/87/builds/4995/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#builders/79/builds/4964/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#builders/86/builds/4956/steps/14/logs/stdio

On 20/03/2023 15:46:57+0000, Konrad Weihmann wrote:
> to allow loading of oeqa modules outside of bitbake.
> Calls like from oeqa.runtime.case import OERuntimeTestCase or
> from oeqa.runtime.case import OERuntimeTestCase assume that oeqa
> is a python module, but a the folder is lacking an __init__.py imports
> fail when the file is loaded outside of bitbake with manipulated
> sys.path.
> Fix that by adding an empty file.
> This allow to inspect for instance test case and generate proper
> test documentation from docstring or even other use cases.
> 
> The file got deleted to fix testimage and testexport features in
> d9b3ee8b38f877c1723e48f1aa311c28102786fb, but it should have
> been not deleted but just emptied
> 
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/lib/oeqa/__init__.py | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  create mode 100644 meta/lib/oeqa/__init__.py
> 
> diff --git a/meta/lib/oeqa/__init__.py b/meta/lib/oeqa/__init__.py
> new file mode 100644
> index 0000000000..e69de29bb2
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178832): https://lists.openembedded.org/g/openembedded-core/message/178832
> Mute This Topic: https://lists.openembedded.org/mt/97734360/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

