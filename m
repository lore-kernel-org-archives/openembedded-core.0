Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146BBCA5FE3
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 09:57:24 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7659.1790935033512220124
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 02:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qqc5FA3c;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E5E154E41106
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Oct 2026 09:57:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B952C603DC;
	Fri,  2 Oct 2026 09:57:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 463B71032849D;
	Fri,  2 Oct 2026 11:57:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790935030; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a0Bic6si40y1xttUybc4KbodmctoidGsfWKFahDOGcs=;
	b=qqc5FA3crPnJsJE3eUs4X+GKBi+Q5PsR3bjIcC/s3WZa6m95K2mNc5iXVHPifNAqxW2G8y
	taDoY+RpTDmFL7792OSPteHVr4z72uRvnKeWRNMS0mkfz771cQmHpdmNSIYMMiZBKFx74X
	SgZI0ROOxlQ/KIj0ziglRIGZut/9tBVDssSA7bfv6rC1ZVK6TcawRMe4UfS6csp5CkVuN1
	YiwJcwbMdW3ND1yKaKjuo55vrfstS/098YOsoevaF9sWriFy//GfjnmJseDh92A01SsB9Y
	UVRr+jl9v136kbsf+DqQOE1ncQYme5Du5sCQAfDTNUBVriVp8NTWQVYCjiA7PQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 11:57:08 +0200
Message-Id: <DLU9HE0BMZOU.1Q9F128NAY6NH@bootlin.com>
Subject: Re: [OE-core][PATCH 1/2] meta-extsdk-toolchain: Install multilib
 toolchain files in the eSDK if multilib is enabled
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <workjagadeesh@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261001174220.3492439-1-workjagadeesh@gmail.com>
 <20261001174220.3492439-2-workjagadeesh@gmail.com>
In-Reply-To: <20261001174220.3492439-2-workjagadeesh@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 09:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247097

On Thu Oct 1, 2026 at 7:42 PM CEST, Jagadeesh Krishnanjanappa via lists.ope=
nembedded.org wrote:
> 1. Ship multilib virtual/cross-cc, virtual/compilerlibs, and virtual/libc
> packages in the eSDK if it is created with multilib configuration. These
> packages are required to compile source for multilib using the eSDK.
>
> 2. Include multilib tune configuration directory in SPDX_MULTILIB_SSTATE_=
ARCHS
> to search SPDX document as meta-extsdk-toolchain is dependent on multilib=
 recipes.
>
> [YOCTO #14020]
>
> Signed-off-by: Jagadeesh K <workjagadeesh@gmail.com>
> ---

Hi Jagadeesh,

Thanks for your patch.

It looks like this is failing to build with "world" target:

ERROR: meta-extsdk-toolchain-1.0-r0 do_create_recipe_spdx: Failure expandin=
g variable SPDX_MULTILIB_SSTATE_ARCHS, expression was ${@all_multilib_tune_=
values(d, 'SSTATE_ARCHS')} which triggered exception NameError: name 'all_m=
ultilib_tune_values' is not defined
...
ERROR: lib32-meta-extsdk-toolchain-1.0-r0 do_create_spdx: Failure expanding=
 variable SPDX_MULTILIB_SSTATE_ARCHS, expression was ${@all_multilib_tune_v=
alues(d, 'SSTATE_ARCHS')} which triggered exception NameError: name 'all_mu=
ltilib_tune_values' is not defined

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/4790
https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/4615

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


