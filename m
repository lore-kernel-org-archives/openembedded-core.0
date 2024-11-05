Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D42ED12677
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 09:52:38 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.14335.1730800354253408072
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 01:52:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c+ByKnoj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBF96FF806;
	Tue,  5 Nov 2024 09:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730800352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+cEV9rav86cL3sF84y0t53bAxyWG+JVcZ37TEmD6vnE=;
	b=c+ByKnoj23yeSvV7L7Mq/ocmZatPSwDT4GoAXUjifKu8O55ZpB++iOSFwdDikjjhhvUHPc
	iEaC1lXPbFedtHF01DdTFb7balrP2Pk0r1sl7QuOJ9RVNISpX/tJ0MVng2n9tM5xKI5HuZ
	eNTC4SBm1nOEGqotvHnEl+SdcoFwYpZ/8Z0vSpq5ismBpZOoBScFuiplJHG9nXCXzvsibw
	bGjTYJTYwGDzMs1ftVIFUilei0d23e5/sYI4DQWQivbv79E0iJlJT7K3O3gzUN4mI27spl
	lxqz5Mt6+6OUg4DR2wq9yI0c/t9cLOBb4juFZMYJ2Kn6nPUtVL3G1kiODLW8Lg==
Date: Tue, 5 Nov 2024 10:52:30 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com
Subject: Re: [OE-core] [PATCH v3] xmlto: backport a patch to fix build with
 gcc-14 on host
Message-ID: <Zynq3g7_0jJQGt5f@bootlin-mathieu>
Mail-Followup-To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org, steve@sakoman.com
References: <20241104145922.1039681-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104145922.1039681-1-martin.jansa@gmail.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 09:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206699

On Mon, Nov 04, 2024 at 03:59:21PM +0100, Martin Jansa wrote:
> * need to add dependency on flex-native because now when the
>   .l file is modified by the .patch file it will try to regenerate
>   the c code and fail:
> 
> | make[1]: Entering directory 'work/x86_64-linux/xmlto-native/0.0.28-r0/build'
> | /bin/bash ../xmlto-0.0.28/ylwrap ../xmlto-0.0.28/xmlif/xmlif.l .c xmlif/xmlif.c -- /bin/bash 'work/x86_64-linux/xmlto-native/0.0.28-r0/xmlto-0.0.28/missing' flex
> | work/x86_64-linux/xmlto-native/0.0.28-r0/xmlto-0.0.28/missing: line 81: flex: command not found
> | WARNING: 'flex' is missing on your system.
> |          You should only need it if you modified a '.l' file.
> |          You may want to install the Fast Lexical Analyzer package:
> |          <https://github.com/westes/flex>
> 
> * backport
>   https://pagure.io/xmlto/c/32376c053733c6c0ebaca3c25c0725509342fdf3?branch=master
>   as well, so that patched xmlif/xmlif.c is newer than xmlif/xmlif.l and the build
>   won't try to regenerate it with flex as that leads to random build failures reported
>   in:
>   https://lists.openembedded.org/g/openembedded-core/message/206412
>   https://errors.yoctoproject.org/Errors/Details/810853/
>   https://lists.openembedded.org/g/openembedded-core/message/206496
>   https://valkyrie.yoctoproject.org/#/builders/29/builds/355
> 
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
> v3: add touch ${S}/xmlif/xmlif.c
>     to make sure xmlif.c is newer than xmlif.l after do_patch (order of
>     .patch files in SRC_URI isn't enough) to prevent regenerating it
>     with flex-native which isn't in DEPENDS
> 

Hi Martin,

This is still for Kirkstone branch, right ?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

