Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D4CCCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 05:55:46 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.8372.1760421344207839753
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 22:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0BagfP/f;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 79B211A1359
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 05:55:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 48D81606EC;
	Tue, 14 Oct 2025 05:55:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0956A102F2281;
	Tue, 14 Oct 2025 07:55:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760421341; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zkBci/oTGj5EQ+co1m9VDBA1iefTVQmsliU3qxARezY=;
	b=0BagfP/fSKmDOzdiMTu2fo447II4t7Fjt431n3GyfFBBk0VgN0FUhsob8P1YA/OVpxVsMz
	+HORvdq8EBwFo8vYVEDeW1UzKJtJR4xP8yqH03TQc2HyVegQlarHE0BUdeqTI3HWV3OAMJ
	KKermr/izN3Bg3flA1qrOAPA3ZZqznaHjTJgwh8FT0x22cThMlHo2EPCg38iqFtuSMq9mp
	oC60ztilLMVf4lVZX1JTDzlw4Ty7OcBFtaZxiSJRQU3gOPPAB+TgJX2xIVEsnzKv1OYLRN
	K9MPWeClEepkhEFhc8PRXvO/WVCDHqiCn+Vh3Z9ectqJX0aOl2+TyTTzmLgvUQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Oct 2025 07:55:39 +0200
Message-Id: <DDHTA6VE803Y.3EV2EYX0NHE1H@bootlin.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: upgrade 2.48.5 -> 2.50.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <skandigraun@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251012181610.1626721-1-skandigraun@gmail.com>
In-Reply-To: <20251012181610.1626721-1-skandigraun@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 05:55:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224807

On Sun Oct 12, 2025 at 8:16 PM CEST, Gyorgy Sarvari via lists.openembedded.=
org wrote:
> Dropped fix-armv7-compilation.patch, because it is included in this
> release.
> Dropped no-musttail-arm.patch, because it has been solved by project
> (a bit differently)[1]
>
> [1]: https://github.com/WebKit/WebKit/blob/webkitgtk-2.50.0/Source/WTF/wt=
f/Compiler.h#L280
>

Hi Gyorgy,

Thanks for the update. However, it looks like it is breaking while
compiled against musl:

ERROR: webkitgtk-2.50.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-w=
orker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/webkit=
gtk/2.50.0/temp/run.do_compile.3108541' failed with exit code 1
...
| /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v=
3-poky-linux-musl/webkitgtk/2.50.0/sources/webkitgtk-2.50.0/Source/bmalloc/=
libpas/src/libpas/pas_probabilistic_guard_malloc_allocator.c:52:10: fatal e=
rror: execinfo.h: No such file or directory
|    52 | #include <execinfo.h>

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/2633
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2598

Can you have a look at this error, please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


