Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5662.1792606755110808785
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 11:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FzUFiir6;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B3F00C5CD6A;
	Wed, 21 Oct 2026 18:20:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9ECB6606E3;
	Wed, 21 Oct 2026 18:19:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DE40103289F5;
	Wed, 21 Oct 2026 20:19:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792606748; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3teqFwTlYowMPfPHarjrIVm49tPZfvayViELuJeXWC8=;
	b=FzUFiir6XuRPQnxCjkrSYiaPK9CZi2c3mE87I/o/MaRg7fZmx+dWYdms+BYo5OqDdiFjfo
	yHg2bkx5lbqyr9BXC5ZYSVSgpubHdGJdhCpTjgtvmOWFWvP+vzKLS03tJIcmhzTk+YkAKN
	UTCjP8rOps7Dtw8oY+v2THwmXS0I2qUwsaz/Syhes3hFnkUB8yFVoolunY3uEiyTbpWsnk
	we57qz+mU5DfqoKHi0LY6XCj5vZBWbH1/w8B+PQV+g8U6Otvj2V64ypC1KGjQzUej7rYDj
	DbtsNZewT3RqJA3h5bWeK05dCyVJLFC1gT2b/gkd+OwtYwj6K02pUULl9IApkA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 20:19:06 +0200
Message-Id: <DMAQ22FCQ26A.QU4YFS98NG17@bootlin.com>
Subject: Re: [OE-core] [PATCH] lrzsz: upgrade 0.12.20 -> 0.13.1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261021123806.18975-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20261021123806.18975-1-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 18:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248403

On Wed Oct 21, 2026 at 2:38 PM CEST, Jaipaul Cheernam wrote:
> ChangeLog: https://github.com/UweOhse/lrzsz/blob/release_0.13.1/ChangeLog
>
> Version 0.13.1 - October 2026, Uwe Ohse
> In this release one recently implemented feature (ESC8 - high bit escapin=
g) was removed
> after Stephen Hurd (of zmtx-zmrx) informed me about its incompatibility.
> A list of known incompatibilities between the 0.12 and the 0.13 series ex=
ists.
>
> NEWS: https://www.ohse.de/uwe/software/lrzsz/NEWS-0.13.0.html
>
> Upstream resumed activity and released 0.13.1, the first release in
> decades. It incorporates equivalents of all the fixes carried locally,
> so the full patch stack is dropped:
>
> - Drop autotools-update/autotools/makefile/lrzsz-check-locale.h patches
>   Upstream reworked the autotools/gettext setup (external gettext,
>   configure.ac, intl/ and ansi2knr removed).
> - Drop cve-2018-10195.patch
>   zsdata() integer overflow is fixed upstream.
> - Drop include/0001-Fix-build-with-GCC-15/K&R-to-ANSI patches
>   Targeted the lib/ tree and K&R prototypes that no longer exist;
>   src/lsyslog.c already carries the added includes.
> - Drop 0001-Fix-cross-compilation-using-autoconf-detected-AR.patch
>   No static archive is built any more, so no host 'ar' is invoked.
>
> Also drop the -Wno-error=3Dincompatible-pointer-types workaround as the
> src/tcp.c it covered was removed upstream.
>
> Tested on qemux86-64: builds under -Werror -std=3Dc23, passes package QA,
> and upstream 'make vcheck' passes the zmodem/ymodem/xmodem transfer and
> traversal/restricted-mode tests.
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

We can see some failures, only on x86 builds:

ERROR: lib32-lrzsz-0.13.1-r0 do_compile: Execution of '/srv/pokybuild/yocto=
-worker/qemux86-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-lrzs=
z/0.13.1/temp/run.do_compile.3925122' failed with exit code 1
...
| ../../sources/lrzsz-0.13.1/src/linesimulator.c: In function 'xorshift64':
| ../../sources/lrzsz-0.13.1/src/linesimulator.c:126:13: error: conversion =
from 'long long unsigned int' to 'long unsigned int' changes value from '11=
400714819323198485' to '2135587861' [-Werror=3Doverflow]
|   126 |         x =3D 0x9E3779B97F4A7C15UL;
|       |             ^~~~~~~~~~~~~~~~~~~~
| ../../sources/lrzsz-0.13.1/src/linesimulator.c: In function 'es_seed':
| ../../sources/lrzsz-0.13.1/src/linesimulator.c:344:19: error: conversion =
from 'long long unsigned int' to 'long unsigned int' changes value from '11=
400714819323198485' to '2135587861' [-Werror=3Doverflow]
|   344 |         es->rng =3D 0x9E3779B97F4A7C15UL;
|       |                   ^~~~~~~~~~~~~~~~~~~~
| cc1: all warnings being treated as errors
| make[2]: *** [Makefile:491: linesimulator.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/qemux86-world/bui=
ld/build/tmp/work/x86-pokymllib32-linux/lib32-lrzsz/0.13.1/build/src'
| make[1]: *** [Makefile:434: all-recursive] Error 1
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/qemux86-world/bui=
ld/build/tmp/work/x86-pokymllib32-linux/lib32-lrzsz/0.13.1/build'
| make: *** [Makefile:373: all] Error 2
| ERROR: oe_runmake failed

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/4892
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/4888
https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/4717
https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/4861
https://autobuilder.yoctoproject.org/valkyrie/#/builders/65/builds/4833

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

