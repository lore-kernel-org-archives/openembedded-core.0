Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B28BCCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 18:24:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4728.1762194271488140648
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 10:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gkouW9ov;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 94AE14E414CB
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Nov 2025 18:24:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 63FF660628;
	Mon,  3 Nov 2025 18:24:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 13EB410B50088;
	Mon,  3 Nov 2025 19:24:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762194269; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V9r+WYLBuTcHGJzekekFJyfwmhu5HIGrNMXCwYh7kos=;
	b=gkouW9ov0RkUfJCJ2UJo08sm8ESYHrRnEO7gcekfl4wpuWevSKE0iPmozAss+/DCqsi9Y1
	JGW/hvd27k/PhIpB4Y2Zc2EaE8o0BZL8zGafEOivpR9GXS/H4Y+P8905O0PDJfBvJldih9
	xnN8AKJ57cWtgQFbdp2p1I4lcPg6grYKzLws7q9DFX5zzjqaF2MH+PWZrqIApwNd3WAEO5
	1V3//I1QB9C0vKal74r9e62nwwNB6FdLJzpCmpr6QeaUfcuSCYubEkNV2rFg2N3yXIbkS4
	Qoa7ABSIeZ9eKKaGyxNS76xJpZpNhRuDhQWwBe2SytLYm6l0j8p7rRhenPDeuQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Nov 2025 19:24:27 +0100
Message-Id: <DDZ9QEGSEJ8V.1DSQEABXR0UC5@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ankur.tyagi85@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 3/5] iproute2: upgrade 6.16.0 -> 6.17.0
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251102084855.1555197-1-ankur.tyagi85@gmail.com>
 <20251102084855.1555197-3-ankur.tyagi85@gmail.com>
In-Reply-To: <20251102084855.1555197-3-ankur.tyagi85@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 18:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225689

On Sun Nov 2, 2025 at 9:48 AM CET, Ankur Tyagi via lists.openembedded.org w=
rote:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---

Hi Ankur,

Thanks for your patch.

It looks like this is breaking with musl:

ERROR: iproute2-6.17.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-wo=
rker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/iproute=
2/6.17.0/temp/run.do_compile.3517119' failed with exit code 1
...
| /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v=
3-poky-linux-musl/iproute2/6.17.0/recipe-sysroot/usr/include/netinet/in.h:2=
9:1: error: redefinition of struct or union 'struct in6_addr'
...
| /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v=
3-poky-linux-musl/iproute2/6.17.0/recipe-sysroot/usr/include/netinet/in.h:4=
0:1: error: redefinition of struct or union 'struct sockaddr_in6'
...
| /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v=
3-poky-linux-musl/iproute2/6.17.0/recipe-sysroot/usr/include/netinet/in.h:4=
5:1: error: redefinition of struct or union 'struct ipv6_mreq'
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/2729
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2694
https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/1414

Can you have a look at this?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


