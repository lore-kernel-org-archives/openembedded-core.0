Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D94EA8104
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 11:58:54 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18000.1770724730637337680
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 03:58:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UPpPE50Q;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8F89FC8F1FF
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 11:58:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 291C2606BD;
	Tue, 10 Feb 2026 11:58:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4213119D146F;
	Tue, 10 Feb 2026 12:58:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770724727; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=toPo99Ki7BYq+SVkOSWdxuPFBangUqN+0+DJVlaYEBE=;
	b=UPpPE50QuBtKiM+zpYlqj8k7ywB2KN8+o1trzYDM6pydRrMWCpPjq7jMXSFYU1nUdv+M5f
	dS5DDC6Vr67djcggse9CiGH2auh8RuhgJTt1NlA8IwgwAqn+yLF8/ch5zrKNYEglUgTVxu
	pIVBa031ufr5qKrCfL7bnn7FYOepUJn5jNZXj0SbnQjktUtyS26xWeZNv6I5y74VAXy6cM
	Al37SU+AjvIblX5SnAO76QLuFjG1eAdf3ZS4k5nd3MrPEp8C+yCIVQ2XH+APmN8l5wWNXw
	ixBkacoSKn76w02HWcwbV/R9QOGPAc0bYvAdIJ7GZpYmjiIH1DAZ8rFe9maWJw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 12:58:46 +0100
Message-Id: <DGB9J1A94Z7W.3JGACH78D4IHM@bootlin.com>
Subject: Re: [OE-core] [PATCH 23/39] python3-numpy: upgrade 2.3.5 -> 2.4.2
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260209090317.1468-1-wangmy@fujitsu.com>
 <20260209090317.1468-23-wangmy@fujitsu.com>
In-Reply-To: <20260209090317.1468-23-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 11:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230888

On Mon Feb 9, 2026 at 10:03 AM CET, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for your patch.

It looks like this is breaking piglit build:

ERROR: piglit-1.0+gitr-r0 do_compile: Execution of '/srv/pokybuild/yocto-wo=
rker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/piglit/1.0+=
gitr/temp/run.do_compile.2412819' failed with exit code 1
...
|   File "/srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/cor=
e2-32-poky-linux-musl/piglit/1.0+gitr/sources/piglit-1.0+gitr/generated_tes=
ts/builtin_function_fp64.py", line 257, in column_major_values
|     return list(np.reshape(value, newshape=3D-1, order=3D'F'))
|                 ~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| TypeError: reshape() got an unexpected keyword argument 'newshape'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3171
https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3154

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


