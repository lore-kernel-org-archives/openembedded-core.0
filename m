Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E0BCAC5A7
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 11:46:00 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.28030.1758455156891754021
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Sep 2025 04:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YRHnRoaw;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 33A291A0F44;
	Sun, 21 Sep 2025 11:45:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAF8D60634;
	Sun, 21 Sep 2025 11:45:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7BDEE102F16EB;
	Sun, 21 Sep 2025 13:45:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758455154; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0I37OJ0UuPszPVrb+FzimRtdvxvy1ffo0xQRS05rCLo=;
	b=YRHnRoawNHXoExTINQE101jbTiFJS8PDfRbhMOp5M/5k7jQUobnlvZliafJb9EHk5il9o1
	M3VVmtobfkjfkUrN8gHhNKgTap0ycd6i4NCv89i98aLOxkLAKaiqMoN1EVhicS8ZG2YWnr
	rAxA/qEgIqpKRq+5ugb4LXX4oMX95ddIUOqCNuUdd+L3HY92WlLcg3XTyenf8hx4uSoBh4
	W1dNlyvGUoMfkZbOKNaxqLnfUO+UoGcHWuAwPHFkKLtsFREio025f1YXoF/SjMl789M3x9
	VyU2XbAYzEPs3/oFvOXhEQ65futKE+myIkf9Dx/SMtdac9g1jeih6+vgnQA5Fw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 21 Sep 2025 13:45:41 +0200
Message-Id: <DCYGBNNUBP8C.21AHR94F4XJD6@bootlin.com>
Subject: Re: [PATCH] perf: Fix reproducibility issue
Cc: <richard.purdie@linuxfoundation.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Hongxu Jia" <hongxu.jia@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250920000821.3374061-1-hongxu.jia@windriver.com>
In-Reply-To: <20250920000821.3374061-1-hongxu.jia@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 11:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223791

On Sat Sep 20, 2025 at 2:08 AM CEST, Hongxu Jia wrote:
> Perf's build process generates two copies of its internal headers,
> one at tools/lib/perf/include/internal and one at libperf/include/interna=
l
> with files like core.h. Although the files are identical, the binaries in=
cluding
> them would see them at different paths and have different debuginfo data.=
 [1]
>
> The reason is the order of include dir `tools/lib/perf/include' and
> `libperf/include' is not stable, such as
>
> $ x86_64-poky-linux-gcc  ... \
>    -Ipath-to/tmp/work/qemux86_64-poky-linux/perf/1.0/sources/perf-1.0/too=
ls/lib/perf/include \
>    -Ipath-to/tmp/work/qemux86_64-poky-linux/perf/1.0/sources/perf-1.0/lib=
perf/include \
>    -c -o path-to/tmp/work/qemux86_64-poky-linux/perf/1.0/sources/perf-1.0=
/libperf/core.o core.c
>
> $ recipe-sysroot-native/usr/bin/dwarfsrcfiles sources/perf-1.0/libperf/co=
re.o
> /usr/src/debug/perf/1.0/tools/lib/perf/core.c
> ...
>         /usr/src/debug/perf/1.0/tools/lib/perf/include/perf/core.h
>         /usr/src/debug/perf/1.0/tools/lib/perf/include/internal/lib.h
> ...
>
> $ x86_64-poky-linux-gcc  ... \
>    -Ipath-to/tmp/work/qemux86_64-poky-linux/perf/1.0/sources/perf-1.0/lib=
perf/include \
>    -Ipath-to/tmp/work/qemux86_64-poky-linux/perf/1.0/sources/perf-1.0/too=
ls/lib/perf/include \
>    -c -o path-to/tmp/work/qemux86_64-poky-linux/perf/1.0/sources/perf-1.0=
/libperf/core.o core.c
>
> $ recipe-sysroot-native/usr/bin/dwarfsrcfiles sources/perf-1.0/libperf/co=
re.o
> /usr/src/debug/perf/1.0/tools/lib/perf/core.c
> ...
>     /usr/src/debug/perf/1.0/libperf/include/perf/core.h
>     /usr/src/debug/perf/1.0/libperf/include/internal/lib.h
> ...
>
> This commit explicitly removes `tools/lib/perf/include' to assure only `l=
ibperf/include'
> is used
>
> Also enable verbose for compile to trace the detail of build
>
> [1] https://git.openembedded.org/openembedded-core/commit/?id=3D0a886fcac=
aab0fbce1306c0f99d482f940a8f705
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---

Hi,

Thanks for your patch.

I believe this is breaking the perf build in various configurations:

ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/genericx86=
-64/build/build/tmp/work/genericx86_64-poky-linux/perf/1.0/temp/log.do_comp=
ile.1058247
...
|   x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpma=
th=3Dsse -O2 -g  -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/genericx86=
-64/build/build/tmp/work/genericx86_64-poky-linux/perf/1.0/sources/perf-1.0=
=3D/usr/src/debug/perf/1.0  -ffile-prefix-map=3D/srv/pokybuild/yocto-worker=
/genericx86-64/build/build/tmp/work/genericx86_64-poky-linux/perf/1.0/sourc=
es/perf-1.0=3D/usr/src/debug/perf/1.0  -ffile-prefix-map=3D/srv/pokybuild/y=
octo-worker/genericx86-64/build/build/tmp/work/genericx86_64-poky-linux/per=
f/1.0/recipe-sysroot=3D  -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/ge=
nericx86-64/build/build/tmp/work/genericx86_64-poky-linux/perf/1.0/recipe-s=
ysroot-native=3D  -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wfor=
mat -Wformat-security -Werror=3Dformat-security --sysroot=3D/srv/pokybuild/=
yocto-worker/genericx86-64/build/build/tmp/work/genericx86_64-poky-linux/pe=
rf/1.0/recipe-sysroot -Wp,-MD,/srv/pokybuild/yocto-worker/genericx86-64/bui=
ld/build/tmp/work/genericx86_64-poky-linux/perf/1.0/sources/perf-1.0/libper=
f/.lib.o.d -Wp,-MT,/srv/pokybuild/yocto-worker/genericx86-64/build/build/tm=
p/work/genericx86_64-poky-linux/perf/1.0/sources/perf-1.0/libperf/lib.o -ld=
w -I/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/genericx=
86_64-poky-linux/perf/1.0/sources/perf-1.0 -Wbad-function-cast -Wdeclaratio=
n-after-statement -Wformat-security -Wformat-y2k -Winit-self -Wmissing-decl=
arations -Wmissing-prototypes -Wnested-externs -Wno-system-headers -Wold-st=
yle-definition -Wpacked -Wredundant-decls -Wstrict-prototypes -Wswitch-defa=
ult -Wswitch-enum -Wundef -Wwrite-strings -Wformat -Wno-type-limits -Wstric=
t-aliasing=3D3 -Wshadow -Werror -Wall -fPIC -I/srv/pokybuild/yocto-worker/g=
enericx86-64/build/build/tmp/work/genericx86_64-poky-linux/perf/1.0/sources=
/perf-1.0/tools/lib/ -I/srv/pokybuild/yocto-worker/genericx86-64/build/buil=
d/tmp/work/genericx86_64-poky-linux/perf/1.0/sources/perf-1.0/tools/include=
 -I/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/genericx8=
6_64-poky-linux/perf/1.0/sources/perf-1.0/tools/arch/x86/include/ -I/srv/po=
kybuild/yocto-worker/genericx86-64/build/build/tmp/work/genericx86_64-poky-=
linux/perf/1.0/sources/perf-1.0/tools/arch/x86/include/uapi -I/srv/pokybuil=
d/yocto-worker/genericx86-64/build/build/tmp/work/genericx86_64-poky-linux/=
perf/1.0/sources/perf-1.0/tools/include/uapi -fvisibility=3Dhidden -D"BUILD=
_STR(s)=3D#s" -c -o /srv/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/work/genericx86_64-poky-linux/perf/1.0/sources/perf-1.0/libperf/lib.o li=
b.c
| cpumap.c:2:10: fatal error: perf/cpumap.h: No such file or directory
|     2 | #include <perf/cpumap.h>
|       |          ^~~~~~~~~~~~~~~
| compilation terminated.
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/2431
And lot of other children of https://autobuilder.yoctoproject.org/valkyrie/=
#/builders/29/builds/2414

Can you have a look a these failures, please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


