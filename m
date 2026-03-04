Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C736DEFCE24
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:39:18 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24198.1772645951997024240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:39:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Ks7/OpVH;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D8DD9C143D8
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 17:39:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8B2285FF5C;
	Wed,  4 Mar 2026 17:39:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8613103685C7;
	Wed,  4 Mar 2026 18:39:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772645949; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8KYe8MmCjze2Lagee7cPpwNxU6OKgDJHa6C81XXiOvU=;
	b=Ks7/OpVHrfrkELycxBCD8C9jQcJdwHawVvtKjgyrN0ISBnK73be9DOMaZxQs0c6U0qzdAH
	zRpYYd4HtrhizDi91SCFmYantMLShMAGjtXpw4gLYIlZeqSkeEUTSYakLombvu4bJtSn8V
	1GSLldNJ6VjQ8tlA+M8HRFkCqGR3YgCmlgKp9oqYnosTv0xybOY6fJ2DEqwkXZgHa47taP
	LwYSAMRlt41jlfHKWNKj3K7oZjwDkRqkDn1U1mL2a5DWR3T1R27yY+VdtASvhY1GdDvtbX
	SGWLUv1Fhi9BjK+G8/pCWy220Erh0nQ3OtOttvskdOqNiCfvVHPHrK6lcFyB8Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 18:39:06 +0100
Message-Id: <DGU6JLTTGI1W.2KGZ3Q4JFIALY@bootlin.com>
Subject: Re: [OE-core] [PATCH 3/6] iproute2: upgrade 6.18.0 -> 6.19.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <andrej.kozemcak@siemens.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260303133645.1449-1-andrej.kozemcak@siemens.com>
 <20260303133645.1449-3-andrej.kozemcak@siemens.com>
In-Reply-To: <20260303133645.1449-3-andrej.kozemcak@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232414

On Tue Mar 3, 2026 at 2:36 PM CET, Andrej Kozemcak via lists.openembedded.o=
rg wrote:
> Drop fix-musl.patch as it was merged upstream.
>
> Changes:
>   - new dpll command for managing Digital Phase-Locked Loop devices via n=
etlink.
>   - expanded CAN XL support
>   - MPTCP improvements
>   - devlink:
>     - added support for 64=E2=80=91bit parameters
>     - added new SWITCHDEV_INACTIVE eswitch mode
>     - added burst period configuration for health reporters
>   - genl:
>     - supports JSON output
>   - ifstat, nstat, lnstat:
>     - converted to use the high-level json_print API for unified JSON out=
put
>
> Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> ---

Hi Andrej,

Thanks for the upgrade.

It looks like we have some build issues with this new version:

ERROR: iproute2-6.19.0-r0 do_compile: oe_runmake failed
...
| NOTE: make -j 16 -l 75 CC=3Di686-poky-linux-musl-gcc  -m32 -march=3Dcore2=
 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=
=3D64 -fstack-protector-strong  -Os -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat=
-security -Werror=3Dformat-security --sysroot=3D/srv/pokybuild/yocto-worker=
/poky-tiny/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.19.0/re=
cipe-sysroot KERNEL_INCLUDE=3D/srv/pokybuild/yocto-worker/poky-tiny/build/b=
uild/tmp/work/core2-32-poky-linux-musl/iproute2/6.19.0/recipe-sysroot/usr/i=
nclude DOCDIR=3D/usr/share/doc/iproute2 SUBDIRS=3Dlib tc ip bridge misc gen=
l devlink tipc SBINDIR=3D/sbin CONF_USR_DIR=3D/usr/lib/iproute2 LIBDIR=3D/u=
sr/lib CCOPTS=3D -Os -fcanon-prefix-map  -ffile-prefix-map=3D/srv/pokybuild=
/yocto-worker/poky-tiny/build/build/tmp/work/core2-32-poky-linux-musl/iprou=
te2/6.19.0/sources/iproute2-6.19.0=3D/usr/src/debug/iproute2/6.19.0  -ffile=
-prefix-map=3D/srv/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/co=
re2-32-poky-linux-musl/iproute2/6.19.0/sources/iproute2-6.19.0=3D/usr/src/d=
ebug/iproute2/6.19.0  -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/poky-=
tiny/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.19.0/recipe-s=
ysroot=3D  -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/poky-tiny/build/=
build/tmp/work/core2-32-poky-linux-musl/iproute2/6.19.0/recipe-sysroot-nati=
ve=3D  -pipe -Wno-error=3Dincompatible-pointer-types -ffunction-sections -f=
data-sections
...
In file included from lnstat.c:35:
| ../include/json_print.h:80:30: warning: 'struct timeval' declared inside =
parameter list will not be visible outside of this definition or declaratio=
n
|    80 | _PRINT_FUNC(tv, const struct timeval *)
...
| ../include/color.h:27:34: error: unknown type name '__u8'
|    27 | enum color_attr ifa_family_color(__u8 ifa_family);
|       |                                  ^~~~
| ../include/color.h:28:34: error: unknown type name '__u8'
|    28 | enum color_attr oper_state_color(__u8 state);
|       |                                  ^~~~
| ../include/json_print.h:71:19: error: unknown type name '__u64'
|    71 | _PRINT_FUNC(size, __u64)
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/3328
https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/2028
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3316

Can you have a look at these failures?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


