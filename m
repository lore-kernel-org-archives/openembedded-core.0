Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86255CFA47B
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 07:45:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6911.1763711108774001877
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 23:45:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MQp/wiqJ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 382AAC10198;
	Fri, 21 Nov 2025 07:44:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 916CF60719;
	Fri, 21 Nov 2025 07:45:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2C4841037174A;
	Fri, 21 Nov 2025 08:45:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763711106; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ln3Zx5zFE0UFgYfQNM8y96TO83xrriZv+uwrCtZYLeg=;
	b=MQp/wiqJvR4hd3uA2Oki81CRCeC4MfWsd2xxgUasHf+5+S/7OKk27de+IdikpZ/WF+q8M1
	euPpVqMZVhOp5YcMHG/Zbl6e76BIOb37FO6OjfP0X4zKBwO1LYMFDgR+iphvFgs2pjOyTZ
	VozPP6y2JeZ/rZiQqYq231tbTqFmKLar7Use+AdJyY8gp9mt1u60ozuNuOQlTs5kGfrM9L
	57ivuPCcgxxImghBUsQkW5ca7W3mjJ7W4ci4df7O4FDmItmNvV0YAImh7HZf0uZ2vTaYG/
	ayQkXi9vi21KyKZTZ1MoRh9M8NcLBfupy3ulAeY7ziq3XZbz3J8rlddZL9nVKw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Nov 2025 08:45:04 +0100
Message-Id: <DEE7ENXV6WVQ.2O6ZK5X4KV174@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ankur.tyagi85@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2] nasm: upgrade 2.16.03 -> 3.01
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251118100140.1584703-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20251118100140.1584703-1-ankur.tyagi85@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 07:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226650

On Tue Nov 18, 2025 at 11:01 AM CET, Ankur Tyagi via lists.openembedded.org=
 wrote:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> License-Update: Copyright year updated to 2025 and upstream replaced verb=
ose copyright headers with SPDX tags
>
> Refreshed patches for the new version.
>
> Release Note:
> https://www.nasm.us/docs/3.01/nasmac.html
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---

Hi Ankur,

Thanks for the v2.

Now it looks like this is breaking ovmf build:

ERROR: ovmf-edk2-stable202508-r0 do_compile: Execution of '/srv/pokybuild/y=
octo-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/=
ovmf/edk2-stable202508/temp/run.do_compile.3506090' failed with exit code 1
...
| /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v=
3-poky-linux-musl/ovmf/edk2-stable202508/sources/ovmf-edk2-stable202508/Bui=
ld/OvmfX64/RELEASE_GCC5/X64/UefiCpuPkg/Library/CpuExceptionHandlerLib/DxeCp=
uExceptionHandlerLib/OUTPUT/X64/ExceptionHandlerAsm.iii:60: error: instruct=
ion not valid with 32-bit operand size

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/2810
https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/2595

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


