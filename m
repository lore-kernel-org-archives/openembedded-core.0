Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735A0D65C5B
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 14:50:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16295.1765983050820157834
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 06:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EfqhMr4Q;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0D2754E41C62
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 14:50:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D15A06072F;
	Wed, 17 Dec 2025 14:50:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2395A102F0AD5;
	Wed, 17 Dec 2025 15:50:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765983045; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DjAAq2UqUoA86qvAUP8rDK4xE7M+9SoTgVkxU9X75h0=;
	b=EfqhMr4QELn6Bs0FayPhmdXXQQbrhAkS0uimF8UmLHVtYQs+Fp0btUn2lcjbRZelgNe/RZ
	vik0cexo5fmmzHcVDJsAWBIRiT80wnTxhXl7L+OQ1N6pvUPhpYwR3idJZyMxe7oqKjKnlB
	2k/nqT7/P/z/F3HqryYaG7vHcTLraSoM6y/etDhr3J5VpNiaTgG9u/LHSvr7TGZEKrddnB
	0/WQBwjkezsrF8CMV3pdmYAPlg5BIpbwHiqaNnIXtZc/NVb5elv1w+dlTvJMG6lpnBjHk4
	AxJghRuxX0Wc+WMWwD5T1wStXFaeSB5RG2BvOklixivPqON19AoNOC/hqCiB4g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:50:44 +0100
Message-Id: <DF0KQQWVQZMH.2W0FET0GDQBVB@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/5] ALSA 1.2.15 updates
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <michael.opdenacker@rootcommit.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251217121705.391288-1-michael.opdenacker@rootcommit.com>
In-Reply-To: <20251217121705.391288-1-michael.opdenacker@rootcommit.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 14:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228048

On Wed Dec 17, 2025 at 1:17 PM CET, Michael Opdenacker via lists.openembedd=
ed.org wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>
> These changes update alsa-lib, alsa-utils, alsa-tools
> and alsa-ucm-conf to the latest version: 1.2.15
>
> Michael Opdenacker (5):

Hi Michael,

Thanks for your patch.

Based on the discussion on the other thread, you are probably already
aware of this, but just to confirm: this is failing with musl:

ERROR: alsa-lib-1.2.15-r0 do_compile: Execution of '/srv/pokybuild/yocto-wo=
rker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.=
2.15/temp/run.do_compile.644079' failed with exit code 1
...
| ../../../sources/alsa-lib-1.2.15/src/ucm/ucm_exec.c: In function 'uc_mgr_=
exec':
| ../../../sources/alsa-lib-1.2.15/src/ucm/ucm_exec.c:263:17: error: implic=
it declaration of function 'close_range' [-Wimplicit-function-declaration]
|   263 |                 close_range(3, maxfd, 0);
|       |                 ^~~~~~~~~~~

https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2885
https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/1605

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


