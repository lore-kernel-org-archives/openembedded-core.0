Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8605FC5DF97
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 16:12:45 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9157.1787415159419193815
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 09:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DERUkeN0;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 27F834E41342;
	Sat, 22 Aug 2026 16:12:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D96D8604C4;
	Sat, 22 Aug 2026 16:12:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 18E4511C77B14;
	Sat, 22 Aug 2026 18:12:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787415152; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xAFggRXWlriYYXdU07OUpMQwseHWgnZFZsQeF/nP/SQ=;
	b=DERUkeN0uFKN11BHin4gnAhVUZpixf+sNgnMLGYY+zLlyjZx177nZsu3tMmEvxyzVkDkKC
	KLzz5qs9ePH4FNZ+C+cZNnJkX3CQFDySTqDrFg84CgxSqVwphkplnoC5BsMra5V7bO4pgQ
	d0EvQeZUmqNcKg4IuRLWFmAV5zAWUDr5ebIUM4sNtBhE2Ms/MZ+YuIsHjGQBNKrvzIS4fO
	fda4fQ1j1+N+a/o2w/t3ORynIWC7tzMQolYht3jNOv9vrBKQ6iN5AumzeHVocPQ3xaA7bJ
	tarw9CZo+4VWi00pwoS+2hwwJLZI4Q3kF1D1Ulq6qs0BaR+q9iBtKP/41yfXUA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 22 Aug 2026 18:12:27 +0200
Message-Id: <DKVLSEW6L0T7.2PCFL9327XYCG@bootlin.com>
Subject: Re: [OE-core][PATCH v4 0/4] Make signed kernel modules stripped
Cc: <antonin.godard@bootlin.com>, <bruce.ashfield@gmail.com>,
 <jose.quaresma@oss.qualcomm.com>, <richard.purdie@linuxfoundation.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <anis.bougrine10@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260822002601.90667-1-anis.bougrine10@gmail.com>
In-Reply-To: <20260822002601.90667-1-anis.bougrine10@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 16:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243989

On Sat Aug 22, 2026 at 2:25 AM CEST, Anis Bougrine via lists.openembedded.o=
rg wrote:
> - Re-sign modules after the package stripping process.
> - Remove the package-stripping skip for signed modules from package.py.
> - Add MOD_INSTALL_PREFIX variable
>
> Note that this v4 patch drops v3 patch and its relative which have been m=
erged to master-next:
> 3e34657 kernel.bbclass: add strip process for signed kernel modules
> ffc6d51 package: extract debug sources from signed kernel modules
>
> Anis Bougrine (4):
>   kernel.bbclass: re-sign kernel modules after package stripping process
>   package.py: remove stripping and splitting skip for signed kernel
>     modules
>   kernel: centralize kernel module installation path in one variable
>   documentation.conf: add documentation for MOD_INSTALL_PREFIX variable
>
>  .../kernel-module-split.bbclass               | 23 ++++++++++++++++
>  meta/classes-recipe/kernel.bbclass            | 13 +++++-----
>  meta/conf/documentation.conf                  |  1 +
>  meta/lib/oe/package.py                        | 26 +++----------------
>  4 files changed, 34 insertions(+), 29 deletions(-)

Hi Anis,

Thanks for your patch.

I suspect this is related with this failure:

ERROR: lttng-modules-2.15.3-r0 do_package: Execution of '/srv/pokybuild/yoc=
to-worker/genericx86/build/build/tmp/work/genericx86-poky-linux/lttng-modul=
es/2.15.3/temp/run.post_strip_kernel_modules_signing.1005048' failed with e=
xit code 127
...
| DEBUG: runstrip: ['i686-poky-linux-strip', '--strip-debug', '--remove-sec=
tion=3D.comment', '--remove-section=3D.note', '/srv/pokybuild/yocto-worker/=
genericx86/build/build/tmp/work/genericx86-poky-linux/lttng-modules/2.15.3/=
package/lib/modules/6.18.43-yocto-standard/kernel/lttng-modules/tests/lttng=
-test.ko']
| DEBUG: runstrip: ['i686-poky-linux-strip', '--strip-debug', '--remove-sec=
tion=3D.comment', '--remove-section=3D.note', '/srv/pokybuild/yocto-worker/=
genericx86/build/build/tmp/work/genericx86-poky-linux/lttng-modules/2.15.3/=
package/lib/modules/6.18.43-yocto-standard/kernel/lttng-modules/tests/lttng=
-clock-plugin-test.ko']
| DEBUG: runstrip: ['i686-poky-linux-strip', '--strip-debug', '--remove-sec=
tion=3D.comment', '--remove-section=3D.note', '/srv/pokybuild/yocto-worker/=
genericx86/build/build/tmp/work/genericx86-poky-linux/lttng-modules/2.15.3/=
package/lib/modules/6.18.43-yocto-standard/kernel/lttng-modules/probes/lttn=
g-probe-x86-irq-vectors.ko']
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/4453
https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/4424
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/4481

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


