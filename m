Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E09D7C27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 22:35:53 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.56196.1717799743733303812
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 15:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jjjHcoLz;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50FB61C0002;
	Fri,  7 Jun 2024 22:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717799741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LNH9ie7XHFs10QHMaxwxIyRM+dpkJbEik3z2i22tLQ0=;
	b=jjjHcoLzIEeOs1idrA1OYTURklIJY0yy6Ww55NvVgyI1vEHdsiBCpElFt5S7Z+JRkrvaeM
	p0Hfxd9ILlmnIoF8f9zc5C19aO3BubNlIKhIb4W4DOgEZcJCq2X9N5HHFUPDWHrUDmUcEo
	c5DFDy1oOARWpxo5wUhJQE79Za8sj4cyUfwQ0v5qoy4frtuMBS16v5Yk2uQeKr/kRvpXNc
	aAQYPSDE6s65pNOQb3xpQOid5upk5u+QG3Jdq/sqa2YlAJWo+XTSf1RqbV0OSgARfd1xLi
	OqDXb4ogDKlFd1rjf3QPIBAGXeJtjj10InBTPwFunD26SybZ6ykInb6J7xjEeQ==
Date: Sat, 8 Jun 2024 00:35:40 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "simit.ghane" <simit.ghane@lge.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCHv3] libgcrypt: Fix building error with '-O2' in
 sysroot path
Message-ID: <20240607223540bfeafc2c@mail.local>
References: <20240606105641.882362-1-simit.ghane@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240606105641.882362-1-simit.ghane@lge.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 22:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200447

This seems to fail:

| libtool: compile:  arm-poky-linux-gnueabi-gcc -mfpu=3Dneon -mfloat-abi=3D=
hard -mcpu=3Dcortex-a8 -fstack-protector-strong -O0 -D_FORTIFY_SOURCE=3D2 -=
Wformat -Wformat-security -Werror=3Dformat-security -D_TIME_BITS=3D64 -D_FI=
LE_OFFSET_BITS=3D64 --sysroot=3D/home/pokybuild/yocto-worker/beaglebone-alt=
/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libgcrypt/1.10.3/r=
ecipe-sysroot -DHAVE_CONFIG_H -I. -I../../libgcrypt-1.10.3/random -I.. -I..=
/src -I../../libgcrypt-1.10.3/src -O2 -pipe -g -feliminate-unused-debug-typ=
es -fcanon-prefix-map -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/bea=
glebone-alt/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libgcry=
pt/1.10.3/libgcrypt-1.10.3=3D/usr/src/debug/libgcrypt/1.10.3 -fdebug-prefix=
-map=3D/home/pokybuild/yocto-worker/beaglebone-alt/build/build/tmp/work/cor=
texa8hf-neon-poky-linux-gnueabi/libgcrypt/1.10.3/libgcrypt-1.10.3=3D/usr/sr=
c/debug/libgcrypt/1.10.3 -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/=
beaglebone-alt/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libg=
crypt/1.10.3/build=3D/usr/src/debug/libgcrypt/1.10.3 -fdebug-prefix-map=3D/=
home/pokybuild/yocto-worker/beaglebone-alt/build/build/tmp/work/cortexa8hf-=
neon-poky-linux-gnueabi/libgcrypt/1.10.3/build=3D/usr/src/debug/libgcrypt/1=
=2E10.3 -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone-alt/bu=
ild/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libgcrypt/1.10.3/reci=
pe-sysroot=3D -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/beaglebone-=
alt/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libgcrypt/1.10.=
3/recipe-sysroot=3D -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/beagl=
ebone-alt/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libgcrypt=
/1.10.3/recipe-sysroot-native=3D -fvisibility=3Dhidden -fno-delete-null-poi=
nter-checks -Wall -c ../../libgcrypt-1.10.3/random/rndjent.c  -fPIC -DPIC -=
o .libs/rndjent.o
| In file included from ../../libgcrypt-1.10.3/random/rndjent.c:99:
| ../../libgcrypt-1.10.3/random/jitterentropy-base.c:58:3: error: #error "T=
he CPU Jitter random number generator must not be compiled with optimizatio=
ns. See documentation. Use the compiler switch -O0 for compiling jitterentr=
opy.c."
|    58 |  #error "The CPU Jitter random number generator must not be compi=
led with optimizations. See documentation. Use the compiler switch -O0 for =
compiling jitterentropy.c."
|       |   ^~~~~
| make[2]: *** [Makefile:775: rndjent.lo] Error 1
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/beaglebone-alt/b=
uild/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libgcrypt/1.10.3/bui=
ld/random'
| make[1]: *** [Makefile:500: all-recursive] Error 1
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/beaglebone-alt/b=
uild/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/libgcrypt/1.10.3/bui=
ld'
| make: *** [Makefile:432: all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
NOTE: recipe libgcrypt-1.10.3-r0: task do_compile: Failed

https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/8078/ste=
ps/11/logs/stdio



On 06/06/2024 16:26:41+0530, simit.ghane wrote:
> Characters like '-O2' or '-Ofast' will be replaced by '-O1' and '-O0'
> respectively when compiling cipher and random in the filesystem
> paths as well if they happen to contain '-O2' or '-Ofast
>=20
> If we are cross compiling libgcrypt and sysroot contains such
> characters, we would
> get compile errors because the sysroot path has been modified.
>=20
> Fix this by adding blank spaces and tabs before the original matching
> pattern in the sed command.
>=20
> It is difficult to control -O1 for cipher and -O0 for random
> at the same time in OE environment along with patch file.
> So, keeping same change as it is.
>=20
> Signed-off-by: simit.ghane <simit.ghane@lge.com>
> ---
> v3: No change
>=20
>  ...ilding-error-with-O2-in-sysroot-path.patch | 52 +++++++++++++------
>  1 file changed, 36 insertions(+), 16 deletions(-)
>=20
> diff --git a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-buil=
ding-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/f=
iles/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
> index cf9ebfb3e6..339bc9c563 100644
> --- a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-er=
ror-with-O2-in-sysroot-path.patch
> +++ b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-er=
ror-with-O2-in-sysroot-path.patch
> @@ -1,31 +1,38 @@
> -From 0f66e796a8522e1043dda03b88d5f6feae839d16 Mon Sep 17 00:00:00 2001
> -From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Wed, 16 Aug 2017 10:44:41 +0800
> -Subject: [PATCH] libgcrypt: fix building error with '-O2' in sysroot path
> +From 7d9817ca935a35fe6c8e2c2c7615825fa08a3a19 Mon Sep 17 00:00:00 2001
> +From: "simit.ghane" <simit.ghane@lge.com>
> +Date: Tue, 7 May 2024 14:09:03 +0530
> +Subject: [PATCHV2] Fix building error with '-O2' in sysroot path
> =20
> -Upstream-Status: Pending
> +Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=3D=
libgcrypt.git;a=3Dcommit;h=3D7d9817ca935a35fe6c8e2c2c7615825fa08a3a19]
> +
> +* cipher/Makefile.am (o_flag_munging): Tweak the sed script.
> +* random/Makefile.am (o_flag_munging): Ditto.
> +--
> +
> +Characters like '-O2' or '-Ofast' will be replaced by '-O1' and '-O0'
> +respectively when compiling cipher and random in the filesystem
> +paths as well if they happen to contain '-O2' or '-Ofast
> =20
> -Characters like '-O2' or '-Ofast' will be replaced by '-O1' when
> -compiling cipher.
>  If we are cross compiling libgcrypt and sysroot contains such
>  characters, we would
>  get compile errors because the sysroot path has been modified.
> =20
> -Fix this by adding blank spaces before and after the original matching
> -pattern in the
> -sed command.
> +Fix this by adding blank spaces and tabs before the original matching
> +pattern in the sed command.
> =20
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +Signed-off-by: simit.ghane <simit.ghane@lge.com>
> =20
> -Rebase to 1.8.0
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +ChangeLog entries added by wk
> =20
> +Note that there is also the configure option --disable-O-flag-munging;
> +see the README.
>  ---
>   cipher/Makefile.am | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> + random/Makefile.am | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> =20
>  diff --git a/cipher/Makefile.am b/cipher/Makefile.am
> -index c3d642b..88c883a 100644
> +index c3d642b2ac..f1c3971c40 100644
>  --- a/cipher/Makefile.am
>  +++ b/cipher/Makefile.am
>  @@ -153,7 +153,7 @@ gost-s-box: gost-s-box.c
> @@ -33,7 +40,20 @@ index c3d642b..88c883a 100644
>  =20
>   if ENABLE_O_FLAG_MUNGING
>  -o_flag_munging =3D sed -e 's/-O\([2-9sgz][2-9sgz]*\)/-O1/' -e 's/-Ofast=
/-O1/g'
> -+o_flag_munging =3D sed -e 's/ -O\([2-9sgz][2-9sgz]*\) / -O1 /' -e 's/ -=
Ofast / -O1 /g'
> ++o_flag_munging =3D sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /'=
 -e 's/[[:blank:]]-Ofast/ -O1 /g'
> + else
> + o_flag_munging =3D cat
> + endif
> +diff --git a/random/Makefile.am b/random/Makefile.am
> +index 0c935a0595..340df38a79 100644
> +--- a/random/Makefile.am
> ++++ b/random/Makefile.am
> +@@ -56,7 +56,7 @@ jitterentropy-base.c jitterentropy.h jitterentropy-bas=
e-user.h
> +=20
> + # The rndjent module needs to be compiled without optimization.  */
> + if ENABLE_O_FLAG_MUNGING
> +-o_flag_munging =3D sed -e 's/-O\([1-9sgz][1-9sgz]*\)/-O0/g' -e 's/-Ofas=
t/-O0/g'
> ++o_flag_munging =3D sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O0 /'=
 -e 's/[[:blank:]]-Ofast/ -O0 /g'
>   else
>   o_flag_munging =3D cat
>   endif

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200394): https://lists.openembedded.org/g/openembedde=
d-core/message/200394
> Mute This Topic: https://lists.openembedded.org/mt/106520599/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

