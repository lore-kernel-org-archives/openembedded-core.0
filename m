Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C62BAC4167B
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 14:37:03 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.51473.1671547019700145350
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 06:37:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=V0fTjpoU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BBECC240010;
	Tue, 20 Dec 2022 14:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671547017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z2lX3TgrymbPqDTi7c38q3C/8N6LQAMFSz/E7t8lK74=;
	b=V0fTjpoUDMLQ//TL0fg/Y4JFvKRQhEme9nZq3Zz08eEhy8hiDiJEQvXvpGNkHe+7GC5xr6
	R4m293SC/B636HT22zV6ZKZfhtQ92SXU60kzDb8SnBfkw+vz37yi6EQQfQiJ/W08DMSb3k
	Rsr+nvy/ZtqCWYnAtOdazl3xPtJmcrdgys4XFf5FIm0rYv52UWewBntOlo+rCnQRkb3Tab
	Dg/WgP0CK4tQiJGiApUxlgAEurES15QWhFMX1S+OZurCURd7WA73dq2HbcitBYMw3mokMb
	8TVQ/6FjJQkrd90S1MJK8r8ideStdHb3S0FdVOY4zXcEuIDL+ZWsJZFO7LojRA==
Date: Tue, 20 Dec 2022 15:36:56 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Manoj Saun <manojsingh.saun@windriver.com>
Cc: openembedded-core@lists.openembedded.org, narpat.mali@windriver.com,
	hari.gpillai@windriver.com, kai.kang@windriver.com
Subject: Re: [OE-core] [meta-oe][PATCH 1/1] libksba: fix CVE-2022-3515
Message-ID: <Y6HIiLJgv/iDcCnM@mail.local>
References: <20221220062956.609061-1-manojsingh.saun@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221220062956.609061-1-manojsingh.saun@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 14:37:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174855

Hello,

This doesn't build:

| ../../libksba-1.6.2/src/ber-help.c:198:3: error: expected identifier or '=
(' before 'if'
|   198 |   if (ti->length > ti->nhdr && (ti->nhdr + ti->length) < ti->leng=
th)
|       |   ^~
| make[3]: *** [Makefile:739: ber_dump-ber-help.o] Error 1
| make[3]: *** Waiting for unfinished jobs....
| libtool: compile:  i686-poky-linux-gcc -m32 -march=3Dcore2 -mtune=3Dcore2=
 -msse3 -mfpmath=3Dsse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -=
Wformat -Wformat-security -Werror=3Dformat-security --sysroot=3D/home/pokyb=
uild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/l=
ibksba/1.6.2-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../libksba-1.6.2/sr=
c -I.. -I../gl -I../../libksba-1.6.2/gl -O2 -pipe -g -feliminate-unused-deb=
ug-types -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/b=
uild/build/tmp/work/core2-32-poky-linux/libksba/1.6.2-r0/libksba-1.6.2=3D/u=
sr/src/debug/libksba/1.6.2-r0 -fdebug-prefix-map=3D/home/pokybuild/yocto-wo=
rker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/libksba/1.6.2-=
r0/libksba-1.6.2=3D/usr/src/debug/libksba/1.6.2-r0 -fmacro-prefix-map=3D/ho=
me/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky=
-linux/libksba/1.6.2-r0/build=3D/usr/src/debug/libksba/1.6.2-r0 -fdebug-pre=
fix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/=
core2-32-poky-linux/libksba/1.6.2-r0/build=3D/usr/src/debug/libksba/1.6.2-r=
0 -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/bu=
ild/tmp/work/core2-32-poky-linux/libksba/1.6.2-r0/recipe-sysroot=3D -fmacro=
-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/w=
ork/core2-32-poky-linux/libksba/1.6.2-r0/recipe-sysroot=3D -fdebug-prefix-m=
ap=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2=
-32-poky-linux/libksba/1.6.2-r0/recipe-sysroot-native=3D -Wall -Wcast-align=
 -Wshadow -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -fvisibilit=
y=3Dhidden -c ../../libksba-1.6.2/src/asn1-func.c  -fPIC -DPIC -o .libs/asn=
1-func.o
| libtool: compile:  i686-poky-linux-gcc -m32 -march=3Dcore2 -mtune=3Dcore2=
 -msse3 -mfpmath=3Dsse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -=
Wformat -Wformat-security -Werror=3Dformat-security --sysroot=3D/home/pokyb=
uild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/l=
ibksba/1.6.2-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../libksba-1.6.2/sr=
c -I.. -I../gl -I../../libksba-1.6.2/gl -O2 -pipe -g -feliminate-unused-deb=
ug-types -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/b=
uild/build/tmp/work/core2-32-poky-linux/libksba/1.6.2-r0/libksba-1.6.2=3D/u=
sr/src/debug/libksba/1.6.2-r0 -fdebug-prefix-map=3D/home/pokybuild/yocto-wo=
rker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/libksba/1.6.2-=
r0/libksba-1.6.2=3D/usr/src/debug/libksba/1.6.2-r0 -fmacro-prefix-map=3D/ho=
me/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky=
-linux/libksba/1.6.2-r0/build=3D/usr/src/debug/libksba/1.6.2-r0 -fdebug-pre=
fix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/=
core2-32-poky-linux/libksba/1.6.2-r0/build=3D/usr/src/debug/libksba/1.6.2-r=
0 -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/bu=
ild/tmp/work/core2-32-poky-linux/libksba/1.6.2-r0/recipe-sysroot=3D -fmacro=
-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/w=
ork/core2-32-poky-linux/libksba/1.6.2-r0/recipe-sysroot=3D -fdebug-prefix-m=
ap=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2=
-32-poky-linux/libksba/1.6.2-r0/recipe-sysroot-native=3D -Wall -Wcast-align=
 -Wshadow -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -fvisibilit=
y=3Dhidden -c ../../libksba-1.6.2/src/writer.c  -fPIC -DPIC -o .libs/writer=
=2Eo
| libtool: compile:  i686-poky-linux-gcc -m32 -march=3Dcore2 -mtune=3Dcore2=
 -msse3 -mfpmath=3Dsse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -=
Wformat -Wformat-security -Werror=3Dformat-security --sysroot=3D/home/pokyb=
uild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/l=
ibksba/1.6.2-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../libksba-1.6.2/sr=
c -I.. -I../gl -I../../libksba-1.6.2/gl -O2 -pipe -g -feliminate-unused-deb=
ug-types -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/b=
uild/build/tmp/work/core2-32-poky-linux/libksba/1.6.2-r0/libksba-1.6.2=3D/u=
sr/src/debug/libksba/1.6.2-r0 -fdebug-prefix-map=3D/home/pokybuild/yocto-wo=
rker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/libksba/1.6.2-=
r0/libksba-1.6.2=3D/usr/src/debug/libksba/1.6.2-r0 -fmacro-prefix-map=3D/ho=
me/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky=
-linux/libksba/1.6.2-r0/build=3D/usr/src/debug/libksba/1.6.2-r0 -fdebug-pre=
fix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/=
core2-32-poky-linux/libksba/1.6.2-r0/build=3D/usr/src/debug/libksba/1.6.2-r=
0 -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/bu=
ild/tmp/work/core2-32-poky-linux/libksba/1.6.2-r0/recipe-sysroot=3D -fmacro=
-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/w=
ork/core2-32-poky-linux/libksba/1.6.2-r0/recipe-sysroot=3D -fdebug-prefix-m=
ap=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2=
-32-poky-linux/libksba/1.6.2-r0/recipe-sysroot-native=3D -Wall -Wcast-align=
 -Wshadow -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -fvisibilit=
y=3Dhidden -c ../../libksba-1.6.2/src/asn1-func2.c  -fPIC -DPIC -o .libs/as=
n1-func2.o
| libtool: compile:  i686-poky-linux-gcc -m32 -march=3Dcore2 -mtune=3Dcore2=
 -msse3 -mfpmath=3Dsse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -=
Wformat -Wformat-security -Werror=3Dformat-security --sysroot=3D/home/pokyb=
uild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/l=
ibksba/1.6.2-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../libksba-1.6.2/sr=
c -I.. -I../gl -I../../libksba-1.6.2/gl -O2 -pipe -g -feliminate-unused-deb=
ug-types -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/b=
uild/build/tmp/work/core2-32-poky-linux/libksba/1.6.2-r0/libksba-1.6.2=3D/u=
sr/src/debug/libksba/1.6.2-r0 -fdebug-prefix-map=3D/home/pokybuild/yocto-wo=
rker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/libksba/1.6.2-=
r0/libksba-1.6.2=3D/usr/src/debug/libksba/1.6.2-r0 -fmacro-prefix-map=3D/ho=
me/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky=
-linux/libksba/1.6.2-r0/build=3D/usr/src/debug/libksba/1.6.2-r0 -fdebug-pre=
fix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/=
core2-32-poky-linux/libksba/1.6.2-r0/build=3D/usr/src/debug/libksba/1.6.2-r=
0 -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/bu=
ild/tmp/work/core2-32-poky-linux/libksba/1.6.2-r0/recipe-sysroot=3D -fmacro=
-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/w=
ork/core2-32-poky-linux/libksba/1.6.2-r0/recipe-sysroot=3D -fdebug-prefix-m=
ap=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2=
-32-poky-linux/libksba/1.6.2-r0/recipe-sysroot-native=3D -Wall -Wcast-align=
 -Wshadow -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -fvisibilit=
y=3Dhidden -c ../../libksba-1.6.2/src/visibility.c  -fPIC -DPIC -o .libs/vi=
sibility.o
| libtool: compile:  i686-poky-linux-gcc -m32 -march=3Dcore2 -mtune=3Dcore2=
 -msse3 -mfpmath=3Dsse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -=
Wformat -Wformat-security -Werror=3Dformat-security --sysroot=3D/home/pokyb=
uild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/l=
ibksba/1.6.2-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../libksba-1.6.2/sr=
c -I.. -I../gl -I../../libksba-1.6.2/gl -O2 -pipe -g -feliminate-unused-deb=
ug-types -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/b=
uild/build/tmp/work/core2-32-poky-linux/libksba/1.6.2-r0/libksba-1.6.2=3D/u=
sr/src/debug/libksba/1.6.2-r0 -fdebug-prefix-map=3D/home/pokybuild/yocto-wo=
rker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/libksba/1.6.2-=
r0/libksba-1.6.2=3D/usr/src/debug/libksba/1.6.2-r0 -fmacro-prefix-map=3D/ho=
me/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky=
-linux/libksba/1.6.2-r0/build=3D/usr/src/debug/libksba/1.6.2-r0 -fdebug-pre=
fix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/=
core2-32-poky-linux/libksba/1.6.2-r0/build=3D/usr/src/debug/libksba/1.6.2-r=
0 -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/bu=
ild/tmp/work/core2-32-poky-linux/libksba/1.6.2-r0/recipe-sysroot=3D -fmacro=
-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/w=
ork/core2-32-poky-linux/libksba/1.6.2-r0/recipe-sysroot=3D -fdebug-prefix-m=
ap=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2=
-32-poky-linux/libksba/1.6.2-r0/recipe-sysroot-native=3D -Wall -Wcast-align=
 -Wshadow -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -fvisibilit=
y=3Dhidden -c ../../libksba-1.6.2/src/reader.c  -fPIC -DPIC -o .libs/reader=
=2Eo
| libtool: compile:  i686-poky-linux-gcc -m32 -march=3Dcore2 -mtune=3Dcore2=
 -msse3 -mfpmath=3Dsse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -=
Wformat -Wformat-security -Werror=3Dformat-security --sysroot=3D/home/pokyb=
uild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/l=
ibksba/1.6.2-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../libksba-1.6.2/sr=
c -I.. -I../gl -I../../libksba-1.6.2/gl -O2 -pipe -g -feliminate-unused-deb=
ug-types -fmacro-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/b=
uild/build/tmp/work/core2-32-poky-linux/libksba/1.6.2-r0/libksba-1.6.2=3D/u=
sr/src/debug/libksba/1.6.2-r0 -fdebug-prefix-map=3D/home/pokybuild/yocto-wo=
rker/genericx86-alt/build/build/tmp/work/core2-32-poky-linux/libksba/1.6.2-=
r0/libksba-1.6.2=3D/usr/src/debug/libksba/1.6.2-r0 -fmacro-prefix-map=3D/ho=
me/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2-32-poky=
-linux/libksba/1.6.2-r0/build=3D/usr/src/debug/libksba/1.6.2-r0 -fdebug-pre=
fix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/=
core2-32-poky-linux/libksba/1.6.2-r0/build=3D/usr/src/debug/libksba/1.6.2-r=
0 -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/bu=
ild/tmp/work/core2-32-poky-linux/libksba/1.6.2-r0/recipe-sysroot=3D -fmacro=
-prefix-map=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/w=
ork/core2-32-poky-linux/libksba/1.6.2-r0/recipe-sysroot=3D -fdebug-prefix-m=
ap=3D/home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work/core2=
-32-poky-linux/libksba/1.6.2-r0/recipe-sysroot-native=3D -Wall -Wcast-align=
 -Wshadow -Wstrict-prototypes -Wpointer-arith -Wno-pointer-sign -fvisibilit=
y=3Dhidden -c ../../libksba-1.6.2/src/asn1-parse.c  -fPIC -DPIC -o .libs/as=
n1-parse.o
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/genericx86-alt/b=
uild/build/tmp/work/core2-32-poky-linux/libksba/1.6.2-r0/build/src'
| make[2]: *** [Makefile:510: all] Error 2
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/genericx86-alt/b=
uild/build/tmp/work/core2-32-poky-linux/libksba/1.6.2-r0/build/src'
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/genericx86-alt/b=
uild/build/tmp/work/core2-32-poky-linux/libksba/1.6.2-r0/build'
| make[1]: *** [Makefile:482: all-recursive] Error 1
| make: *** [Makefile:414: all] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/work=
/core2-32-poky-linux/libksba/1.6.2-r0/temp/run.do_compile.1534480:182 exit =
1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/genericx86-alt/build/build=
/tmp/work/core2-32-poky-linux/libksba/1.6.2-r0/temp/run.do_compile.1534480,=
 line 182
| 	#2: die, /home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/wor=
k/core2-32-poky-linux/libksba/1.6.2-r0/temp/run.do_compile.1534480, line 166
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/genericx86-alt/build/build/=
tmp/work/core2-32-poky-linux/libksba/1.6.2-r0/temp/run.do_compile.1534480, =
line 161
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/genericx86-alt/bu=
ild/build/tmp/work/core2-32-poky-linux/libksba/1.6.2-r0/temp/run.do_compile=
=2E1534480, line 156
| 	#5: do_compile, /home/pokybuild/yocto-worker/genericx86-alt/build/build/=
tmp/work/core2-32-poky-linux/libksba/1.6.2-r0/temp/run.do_compile.1534480, =
line 151
| 	#6: main, /home/pokybuild/yocto-worker/genericx86-alt/build/build/tmp/wo=
rk/core2-32-poky-linux/libksba/1.6.2-r0/temp/run.do_compile.1534480, line 1=
95
NOTE: recipe libksba-1.6.2-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-worker/genericx86-alt/build/meta/recipes=
-support/libksba/libksba_1.6.2.bb:do_compile) failed with exit code '1'

On 20/12/2022 06:29:56+0000, Manoj Saun wrote:
> libksba: integer overflow may lead to remote code execution.
>=20
> Reference:
> https://www.gnupg.org/blog/20221017-pepe-left-the-ksba.html
>=20
> Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=3Dl=
ibksba.git;a=3Dcommit;h=3D4b7d9cd4a018898d7714ce06f3faf2626c14582b]
>=20
> CVE: CVE-2022-3515
>=20
> Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
> ---
>  ...e-overflow-directly-in-the-TLV-parse.patch | 42 +++++++++++++++++++
>  meta/recipes-support/libksba/libksba_1.6.2.bb |  3 +-
>  2 files changed, 44 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/libksba/libksba/0001-Detect-a-po=
ssible-overflow-directly-in-the-TLV-parse.patch
>=20
> diff --git a/meta/recipes-support/libksba/libksba/0001-Detect-a-possible-=
overflow-directly-in-the-TLV-parse.patch b/meta/recipes-support/libksba/lib=
ksba/0001-Detect-a-possible-overflow-directly-in-the-TLV-parse.patch
> new file mode 100644
> index 0000000000..e2cb842a4d
> --- /dev/null
> +++ b/meta/recipes-support/libksba/libksba/0001-Detect-a-possible-overflo=
w-directly-in-the-TLV-parse.patch
> @@ -0,0 +1,42 @@
> +From 4b7d9cd4a018898d7714ce06f3faf2626c14582b Mon Sep 17 00:00:00 2001
> +From: Werner Koch <wk@gnupg.org>
> +Date: Wed, 5 Oct 2022 14:19:06 +0200
> +Subject: [PATCH] Detect a possible overflow directly in the TLV parser.
> +
> +Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=3D=
libksba.git;a=3Dcommit;h=3D4b7d9cd4a018898d7714ce06f3faf2626c14582b]
> +
> +CVE: CVE-2022-3515
> +
> +Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
> +
> +* src/ber-help.c (_ksba_ber_read_tl): Check for overflow of a commonly
> +used sum.
> +--
> +
> +It is quite common to have checks like
> +
> +    if (ti.nhdr + ti.length >=3D DIM(tmpbuf))
> +       return gpg_error (GPG_ERR_TOO_LARGE);
> +
> +This patch detects possible integer overflows immmediately when
> +creating the TI object.
> +
> +Reported-by: ZDI-CAN-18927, ZDI-CAN-18928, ZDI-CAN-18929
> +---
> + src/ber-help.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/src/ber-help.c b/src/ber-help.c
> +index 81c31ed..56efb6a 100644
> +--- a/src/ber-help.c
> ++++ b/src/ber-help.c
> +@@ -182,6 +182,12 @@ _ksba_ber_read_tl (ksba_reader_t reader, struct tag=
_info *ti)
> +       ti->length =3D len;
> +     }
> +=20
> ++  if (ti->length > ti->nhdr && (ti->nhdr + ti->length) < ti->length)
> ++    {
> ++      ti->err_string =3D "header+length would overflow";
> ++      return gpg_error (GPG_ERR_EOVERFLOW);
> ++    }
> ++
> +   /* Without this kludge some example certs can't be parsed */
> +   if (ti->class =3D=3D CLASS_UNIVERSAL && !ti->tag)
> +     ti->length =3D 0;
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-support/libksba/libksba_1.6.2.bb b/meta/recipes=
-support/libksba/libksba_1.6.2.bb
> index f6ecb9aec4..c25c23ef0f 100644
> --- a/meta/recipes-support/libksba/libksba_1.6.2.bb
> +++ b/meta/recipes-support/libksba/libksba_1.6.2.bb
> @@ -22,7 +22,8 @@ inherit autotools binconfig-disabled pkgconfig texinfo
> =20
>  UPSTREAM_CHECK_URI =3D "https://gnupg.org/download/index.html"
>  SRC_URI =3D "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
> -           file://ksba-add-pkgconfig-support.patch"
> +           file://ksba-add-pkgconfig-support.patch \
> +           file://0001-Detect-a-possible-overflow-directly-in-the-TLV-pa=
rse.patch"
> =20
>  SRC_URI[sha256sum] =3D "fce01ccac59812bddadffacff017dac2e4762bdb6ebc6ffe=
06f6ed4f6192c971"
> =20
> --=20
> 2.34.1
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174842): https://lists.openembedded.org/g/openembedde=
d-core/message/174842
> Mute This Topic: https://lists.openembedded.org/mt/95781520/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

