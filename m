Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85ADFCD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 11:49:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10402.1779277785232612350
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 04:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Xthb5GWF;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EF9FB4E42CFD;
	Wed, 20 May 2026 11:49:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A58BF60019;
	Wed, 20 May 2026 11:49:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 217CE107E8E78;
	Wed, 20 May 2026 13:49:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779277782; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=0+TI7EEK9CAOfm+SNNij+crKpPZkEVr3eHjymAhKHrQ=;
	b=Xthb5GWF5DS2gq/4iKrTEkItLTypRmLR4Du7x78oB6tTLL+euHfC/p8OvYss2fjiY4pvcP
	pwmFSfY4VMPQeR5d4O4/20bFn8ogVyz29ynQMoBFaQ17HinVJuShg2GSVeCULJny8rA1bC
	ZK0eQni1Hhb53+wzIxgA4yG+nUAjSraQdsV1GE8WaX/SyvzrzIC9c3AiCqwmbBh2d+WItJ
	Aw85Xv+UPGeIP6qW+qTpWqDInecWtxacMjbaEeVMdliCFj5ntHeRYrzJMsc5IAlndSJ9fS
	wuKswF+3pfptlXGIRyneajrU2lwipPpVNkP6Zfv7EbR+zSIVMIWXdaq+s1sybA==
Message-ID: <503fb85f-b436-4985-8d39-549f54bd5025@bootlin.com>
Date: Wed, 20 May 2026 13:49:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/4] Split vim and xxd in different recipes
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, paul@pbarker.dev,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Ross Burton <ross.burton@arm.com>
References: <18ADB4FEC98E8237.2455325@lists.openembedded.org>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <18ADB4FEC98E8237.2455325@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 11:49:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237449

Hello,

On 5/8/26 23:40, Joao Marcos Costa via lists.openembedded.org wrote:
> Hello,
>=20
> Honestly, my main motivation to send this series comes from a time when
> I was building u-boot (meta-freescale) and I saw vim-native in Bitbake'=
s
> tasks. It blew my mind that a bootloader somehow dependend on a text
> editor (yes, only to be built, not to be executed, I know), and the who=
le
> text editor was being built to provide nothing more than xxd.
>=20
> Just to be clear, what bothers me is NOT u-boot depending on xxd. It is
> actually configuring and compiling Vim (considering the overhead this
> represents) only to use a single tiny piece of it.
>=20
> As for the tests I performed:
>=20
> - machine: qemuriscv64
> - toolchains: clang and gcc
> - classes (xxd, vim-xxd): target, native, nativesdk
> - classes (vim): target, native, nativesdk
>=20
> Everything built fine, and the core-image-minimal running with qemu als=
o
> correctly shipped vim and xxd, which executed fine as well.
>=20
> Best regards,
>=20
> Jo=C3=A3o Marcos Costa (4):
>    vim: introduce vim-sources.inc file
>    vim-xxd: introduce new recipe for xxd
>    vim: drop references to xxd in base recipe
>    vim.inc: remove xxd from the destination directory
>=20
>   meta/conf/distro/include/maintainers.inc |  1 +
>   meta/recipes-support/vim/vim-sources.inc | 16 +++++++++++++
>   meta/recipes-support/vim/vim-xxd_9.2.bb  | 29 +++++++++++++++++++++++=
+
>   meta/recipes-support/vim/vim.inc         | 21 ++++-------------
>   meta/recipes-support/vim/vim_9.2.bb      | 10 --------
>   5 files changed, 51 insertions(+), 26 deletions(-)
>   create mode 100644 meta/recipes-support/vim/vim-sources.inc
>   create mode 100644 meta/recipes-support/vim/vim-xxd_9.2.bb

Would there be any more feedbacks on this series? So far, I have been=20
considering to prepare a v2 to fix the License issue mentioned by Ross,=20
and also wiping out the source code of vim in vim-xxd_9.2.bb (leaving=20
only xxd's code, of course). This step would significantly reduce the=20
risk of xxd being affected by Vim's CVEs.

However, I prefer not investing my time on it if this split is not=20
seriously considered in the first place.

Thanks!
--=20
Best regards,
Jo=C3=A3o Marcos Costa

