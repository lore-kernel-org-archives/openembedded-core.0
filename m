Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FB2F01823
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 10:18:36 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66251.1772792313995507873
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 02:18:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kBqL7K5b;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D018F1A2D0C
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Mar 2026 10:18:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99A875FF92;
	Fri,  6 Mar 2026 10:18:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 223931036873C;
	Fri,  6 Mar 2026 11:18:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772792311; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sGAfG2o/rJ6UyzaJwkIUgNVzaGTO4i4jffNaG9e4Hlo=;
	b=kBqL7K5bVVqP+Mk+UMajMPRTw0vkJtIxutV9rTFp+AZJJNw0bqbMQOtIrfELOBRTj8ZR0p
	2MDEsArU5mwQS8fhQvjsf5P1bGB/94aP2I3YQvlbb5TNmd+c0nVYppz/evfh09MoGLSI8Z
	wKLyzAQSAqMHVWfdFRUn3oLlt3zOiJjZ7kyZxnuxsMyC2gY3pHi8K1+UBccFp3c0+BfUR+
	tTY2B0mYn3LV92FADjQhIE+lSiQcymdhRnWlAooxGjjfh34Z97kPRWnk0Q3e8UrvX9xALq
	EwZKVFrJPJbbKCKbo0XyzchmLa1OKgmHap9YOJFhWMlHG4wMOQfMvZdp4mV3Xw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 11:18:27 +0100
Message-Id: <DGVMFAY5L9I3.1HXXYSFNG3R14@bootlin.com>
Subject: Re: [OE-core] [PATCH V4] lua: upgrade from 5.4.8 to 5.5.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <changqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <FEAC2A3F-4384-4D3C-B9CE-FDA23332604B@arm.com>
 <20260305105440.3866498-1-changqing.li@windriver.com>
In-Reply-To: <20260305105440.3866498-1-changqing.li@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 10:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232560

On Thu Mar 5, 2026 at 11:54 AM CET, Changqing Li via lists.openembedded.org=
 wrote:
> From: "Changqing Li via lists.openembedded.org" <changqing.li=3Dwindriver=
.com@lists.openembedded.org>
>
> Changes:
> https://www.lua.org/manual/5.5/readme.html#changes
>
> PLATS linux-readline is moved, and readline is changed to load
> dynamically, refer [1], keep readline as PACKAGECONFIG to allow user to
> remove readline dependency.
>
> Lua use dlopen by default, and LUA_READLINELIB is set to libreadline.so,
> but libreadline.so is in the dev package, which will make Lua cannot
> load libreadline even when libreadline is installed. Make readline as
> build dependency and detect the real libreadline name and set LUA_READLIN=
ELIB
>
> [1] https://github.com/lua/lua/commit/366c85564874d560b3608349f752e9e490f=
9002d
> [2] https://github.com/lua/lua/blob/master/lua.c#L520
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---

Hi Changqing,

Thanks for the new version, but I believe we have some errors with it:

ERROR: lua-5.5.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker=
/qemux86-64-x32/build/build/tmp/work/x86_64_x32-poky-linux-gnux32/lua/5.5.0=
/temp/run.do_configure.1720879' failed with exit code 1

The do_configure log is not really verbose:

DEBUG: Executing python function extend_recipe_sysroot
NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/qemux86-64-x32/=
build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_pop=
ulate_sysroot', '/srv/pokybuild/yocto-worker/qemux86-64-x32/build/layers/op=
enembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysr=
oot', '/srv/pokybuild/yocto-worker/qemux86-64-x32/build/layers/openembedded=
-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/s=
rv/pokybuild/yocto-worker/qemux86-64-x32/build/layers/openembedded-core/met=
a/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/poky=
build/yocto-worker/qemux86-64-x32/build/layers/openembedded-core/meta/recip=
es-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot', '/srv/poky=
build/yocto-worker/qemux86-64-x32/build/layers/openembedded-core/meta/recip=
es-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', 'virtual:nativ=
e:/srv/pokybuild/yocto-worker/qemux86-64-x32/build/layers/openembedded-core=
/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:na=
tive:/srv/pokybuild/yocto-worker/qemux86-64-x32/build/layers/openembedded-c=
ore/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', =
'virtual:native:/srv/pokybuild/yocto-worker/qemux86-64-x32/build/layers/ope=
nembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysro=
ot']
NOTE: Installed into sysroot: []
NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'gl=
ibc', 'ncurses', 'readline', 'binutils-cross-x86_64', 'gcc-cross-x86_64', '=
gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'opkg-utils', 'quilt=
-native', 'texinfo-dummy-native', 'linux-libc-headers', 'zlib-native', 'fle=
x-native', 'gnu-config-native', 'patch-native', 'pkgconfig-native', 'pseudo=
-native', 'xz-native', 'zstd-native', 'attr-native', 'gmp-native', 'libmpc-=
native', 'mpfr-native', 'sqlite3-native']
DEBUG: Python function extend_recipe_sysroot finished
DEBUG: Executing shell function do_configure
WARNING: exit code 1 from a shell command.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/3272
https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/3286
https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/3272
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/3328
https://autobuilder.yoctoproject.org/valkyrie/#/builders/65/builds/3289

Can you have a look at this error?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


