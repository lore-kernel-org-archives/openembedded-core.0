Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F305103E16A
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 12:12:25 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12463.1773835941103705786
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 05:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xvudZWYm;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E541A4E426E7;
	Wed, 18 Mar 2026 12:12:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA40E6004F;
	Wed, 18 Mar 2026 12:12:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 682231045080D;
	Wed, 18 Mar 2026 13:12:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773835938; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gzYke6Pv86q7QjAcE6RuxvB74OPuVVTxDKCxSUln8MU=;
	b=xvudZWYmgXds/9oT0T0P1yX6ibD5P5kimmY4kr4YQfNzjtGpWsheQnLRF0Ekc7Ly2qzxVs
	1+RZi2zBwX+pQlGXDFglOAXUEwfsS2rN9v1pwYCMSBwYKdJaeSFav8stgsQyhYvF7U/1Qq
	jPRdfWqd94lqUanUFt7GzKK2vXmRsimkU9Dh/dpqh8yNtMADPZmYPLXD7t2trYccNjNP53
	K6pK4QG4fYR3OI7WeyYbZLVlLO9DkKeKHwEA/Ir8TaRpJ4kmnlQkI/7+eiL3UClMV/T13D
	uzsw+PQ4EjeL01pFAzedDsbtV3iuXT185NBrAQ2s/0ZsGSQWX0s++BrGgHp+lw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 13:12:16 +0100
Message-Id: <DH5WCZNFT8GV.3OA9E3ZNR71XY@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/1] weston: update to 15.0.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <scott.murray@konsulko.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1772963425.git.scott.murray@konsulko.com>
 <5f4c8c72cb972c976aa2e95d0288fba6d3369415.1772963425.git.scott.murray@konsulko.com>
In-Reply-To: <5f4c8c72cb972c976aa2e95d0288fba6d3369415.1772963425.git.scott.murray@konsulko.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 12:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233381

On Sun Mar 8, 2026 at 10:57 AM CET, Scott Murray via lists.openembedded.org=
 wrote:
> Announcement:
> https://lore.freedesktop.org/wayland-devel/aZbDU-xtVMLhB0wD@xpredator/
>
> Functional changes:
> - New Vulkan renderer. A "vulkan" PACKAGECONFIG option has been
>   added to enable building it, and it is enabled if "vulkan" is
>   present in DISTRO_FEATURES, similar to how X11 and Wayland are
>   handled.
> - New Lua shell. A "lua-shell" PACkAGECONFIG option has been added
>   to enable building it, but it has not been enabled by defsult to
>   avoid affecting build times.
> - Fullscreen shell and screen-share module marked as deprecated.
>   Their PACKAGECONFIG options have been updated to still work, but
>   have not been renamed to avoid breaking working configurations.
> - Perfetto support. A "perfetto" PACKAGECONFIG option has been
>   added to enable building it, but it is not on by default due
>   to meta-oe being required to build.
> - The "client-no-resize" option for the RDP backend has been
>   replaced with "resizeable/no-resizeable" to match the VNC
>   backend. The example in weston.ini has been updated.
>
> Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> ---

Hi Scott,

Thanks for your patch, and sorry for the delay.

I looks like this is breaking "no-x11" builds. I believe you should be
able to reproduce this just with "DISTRO_FEATURES:remove =3D 'x11'":

ERROR: weston-15.0.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-work=
er/no-x11/build/build/tmp/work/x86-64-v3-poky-linux/weston/15.0.0/temp/run.=
do_compile.2505757' failed with exit code 1
...
| FAILED: [code=3D1] libweston/renderer-vulkan/vulkan-renderer.so.p/vulkan-=
pipeline.c.o
| x86_64-poky-linux-gcc -m64 -march=3Dx86-64-v3 -fstack-protector-strong -O=
2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-securit=
y --sysroot=3D/srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86-6=
4-v3-poky-linux/weston/15.0.0/recipe-sysroot -Ilibweston/renderer-vulkan/vu=
lkan-renderer.so.p -Ilibweston/renderer-vulkan -I../sources/weston-15.0.0/l=
ibweston/renderer-vulkan -I. -I../sources/weston-15.0.0 -Iinclude -I../sour=
ces/weston-15.0.0/include -Ilibweston -I../sources/weston-15.0.0/libweston =
-Iprotocol -I/srv/pokybuild/yocto-worker/no-x11/build/build/tmp/work/x86-64=
-v3-poky-linux/weston/15.0.0/recipe-sysroot/usr/include/libdrm -I/srv/pokyb=
uild/yocto-worker/no-x11/build/build/tmp/work/x86-64-v3-poky-linux/weston/1=
5.0.0/recipe-sysroot/usr/include/pixman-1 -fdiagnostics-color=3Dalways -D_F=
ILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wextra -Wpedantic -std=3Dgnu11 -W=
missing-prototypes -Wno-unused-parameter -Wno-shift-negative-value -Wno-mis=
sing-field-initializers -Wno-pedantic -Wundef -fvisibility=3Dhidden -Wmissi=
ng-prototypes -Wno-unused-parameter -Wno-shift-negative-value -Wno-missing-=
field-initializers -Wno-pedantic -Wundef -fvisibility=3Dhidden -O2 -g -fcan=
on-prefix-map -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/no-x11/build/=
build/tmp/work/x86-64-v3-poky-linux/weston/15.0.0/sources/weston-15.0.0=3D/=
usr/src/debug/weston/15.0.0 -ffile-prefix-map=3D/srv/pokybuild/yocto-worker=
/no-x11/build/build/tmp/work/x86-64-v3-poky-linux/weston/15.0.0/build=3D/us=
r/src/debug/weston/15.0.0 -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/n=
o-x11/build/build/tmp/work/x86-64-v3-poky-linux/weston/15.0.0/recipe-sysroo=
t=3D -ffile-prefix-map=3D/srv/pokybuild/yocto-worker/no-x11/build/build/tmp=
/work/x86-64-v3-poky-linux/weston/15.0.0/recipe-sysroot-native=3D -pipe -fP=
IC -MD -MQ libweston/renderer-vulkan/vulkan-renderer.so.p/vulkan-pipeline.c=
.o -MF libweston/renderer-vulkan/vulkan-renderer.so.p/vulkan-pipeline.c.o.d=
 -o libweston/renderer-vulkan/vulkan-renderer.so.p/vulkan-pipeline.c.o -c .=
./sources/weston-15.0.0/libweston/renderer-vulkan/vulkan-pipeline.c
| In file included from ../sources/weston-15.0.0/libweston/renderer-vulkan/=
vulkan-pipeline.c:42:
| ../sources/weston-15.0.0/libweston/renderer-vulkan/vulkan-renderer-intern=
al.h:43:10: fatal error: xcb/xcb.h: No such file or directory
|    43 | #include <xcb/xcb.h>
|       |          ^~~~~~~~~~~
| compilation terminated.
| ninja: build stopped: subcommand failed

https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/3404

Can you have a look at the error?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


