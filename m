Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE57E77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 13:08:42 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.61657.1735564112082698812
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 05:08:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FgyUUCwW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8EC58C0006;
	Mon, 30 Dec 2024 13:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735564110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Fd8pKrq3M2ehW6LA4u3hdrQd4W+Q8aIkJA9MTqex3Q=;
	b=FgyUUCwWgcWWMZ1+4OBYRV3MsbQisVfWQ3+A8BZlxiB3QzdterP4iGBQdVDAZgrF802prg
	O/sD4zEsZWEmKojQ5uBUyJ5L1MLKiKe00H/JlYJCAXTsDYYaELy+pl5QNMr90D1bT9N5pR
	3BFjyuqV8GqUc0eYuBHzQBMzBHwfL2J+TMY6/ojV6eDp1/sJoClJ3dP30zuS9z6uNLpQWp
	XpParyKlP6KdkJiVfi3frDPCDjpqrcDi5jpji89GChmKEQ1+035HQVMMdDpS++s4C/lSgr
	THdphY/NIHwHG5Yct1WLbRz3/kVmAv2E1USb6p3yeKMRJCdYRHvVPyxXGLo7eA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Dec 2024 14:08:29 +0100
Message-Id: <D6P24OTSGHF1.397XLUGN9F28J@bootlin.com>
Subject: Re: [OE-core] [PATCH v3] gettext: fix libtool: Version mismatch
 error
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Vincent Davis Jr" <vince@underview.tech>,
 <openembedded-core@lists.openembedded.org>, "Joshua Watt"
 <jpewhacker@gmail.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241230040546.2158672-2-vince@underview.tech>
In-Reply-To: <20241230040546.2158672-2-vince@underview.tech>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 13:08:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209162

On Mon Dec 30, 2024 at 5:05 AM CET, Vincent Davis Jr wrote:
> Error:
>
> libtool: Version mismatch error.  This is libtool 2.5.4, but the
> libtool: definition of this LT_INIT comes from libtool 2.5.2.
> libtool: You should recreate aclocal.m4 with macros from libtool 2.5.4
> libtool: and run autoconf again.
>
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---

Hi Vincent, Joshua,

This patch is failing on the autobuilder, only with the meta-mingw
build. I believe this failure is directly related to meta-mingw, but I'm
not fully confident.

Joshua, any thought about it ?

ERROR: nativesdk-gettext-0.22.5-r0 do_compile: oe_runmake failed
ERROR: nativesdk-gettext-0.22.5-r0 do_compile: Execution of '/srv/pokybuild=
/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mi=
ngw32/nativesdk-gettext/0.22.5/temp/run.do_compile.3078389' failed with exi=
t code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/meta-mingw=
/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-gettext/=
0.22.5/temp/log.do_compile.3078389
Log data follows:
[...]
| libtool: link: i686-w64-mingw32-gcc --sysroot=3D/srv/pokybuild/yocto-work=
er/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativ=
esdk-gettext/0.22.5/recipe-sysroot -DINSTALLDIR=3D\"/usr/local/oe-sdk-hardc=
oded-buildpath/sysroots/i686-w64-mingw32/usr/bin\" -O2 -fcanon-prefix-map -=
fmacro-prefix-map=3D/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/=
work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-gettext/0.22.5/gettext-0.=
22.5=3D/usr/src/debug/nativesdk-gettext/0.22.5 -fdebug-prefix-map=3D/srv/po=
kybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32=
-w64-mingw32/nativesdk-gettext/0.22.5/gettext-0.22.5=3D/usr/src/debug/nativ=
esdk-gettext/0.22.5 -fmacro-prefix-map=3D/srv/pokybuild/yocto-worker/meta-m=
ingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-gett=
ext/0.22.5/gettext-0.22.5=3D/usr/src/debug/nativesdk-gettext/0.22.5 -fdebug=
-prefix-map=3D/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i=
686-nativesdk-mingw32-w64-mingw32/nativesdk-gettext/0.22.5/gettext-0.22.5=
=3D/usr/src/debug/nativesdk-gettext/0.22.5 -fdebug-prefix-map=3D/srv/pokybu=
ild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64=
-mingw32/nativesdk-gettext/0.22.5/recipe-sysroot=3D -fmacro-prefix-map=3D/s=
rv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mi=
ngw32-w64-mingw32/nativesdk-gettext/0.22.5/recipe-sysroot=3D -fdebug-prefix=
-map=3D/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nat=
ivesdk-mingw32-w64-mingw32/nativesdk-gettext/0.22.5/recipe-sysroot-native=
=3D -fmacro-prefix-map=3D/srv/pokybuild/yocto-worker/meta-mingw/build/build=
/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-gettext/0.22.5/recip=
e-sysroot-native=3D -pipe -Wno-error=3Dincompatible-pointer-types -Wl,-O1 -=
o .libs/ngettext.exe ngettext-ngettext.o gettext.res  ../gnulib-lib/libgrt.=
a ../intl/.libs/libintl.dll.a -ladvapi32 -liconv
| libtool: link: i686-w64-mingw32-gcc --sysroot=3D/srv/pokybuild/yocto-work=
er/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativ=
esdk-gettext/0.22.5/recipe-sysroot -DINSTALLDIR=3D\"/usr/local/oe-sdk-hardc=
oded-buildpath/sysroots/i686-w64-mingw32/usr/bin\" -O2 -fcanon-prefix-map -=
fmacro-prefix-map=3D/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/=
work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-gettext/0.22.5/gettext-0.=
22.5=3D/usr/src/debug/nativesdk-gettext/0.22.5 -fdebug-prefix-map=3D/srv/po=
kybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32=
-w64-mingw32/nativesdk-gettext/0.22.5/gettext-0.22.5=3D/usr/src/debug/nativ=
esdk-gettext/0.22.5 -fmacro-prefix-map=3D/srv/pokybuild/yocto-worker/meta-m=
ingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-gett=
ext/0.22.5/gettext-0.22.5=3D/usr/src/debug/nativesdk-gettext/0.22.5 -fdebug=
-prefix-map=3D/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i=
686-nativesdk-mingw32-w64-mingw32/nativesdk-gettext/0.22.5/gettext-0.22.5=
=3D/usr/src/debug/nativesdk-gettext/0.22.5 -fdebug-prefix-map=3D/srv/pokybu=
ild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64=
-mingw32/nativesdk-gettext/0.22.5/recipe-sysroot=3D -fmacro-prefix-map=3D/s=
rv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mi=
ngw32-w64-mingw32/nativesdk-gettext/0.22.5/recipe-sysroot=3D -fdebug-prefix=
-map=3D/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nat=
ivesdk-mingw32-w64-mingw32/nativesdk-gettext/0.22.5/recipe-sysroot-native=
=3D -fmacro-prefix-map=3D/srv/pokybuild/yocto-worker/meta-mingw/build/build=
/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-gettext/0.22.5/recip=
e-sysroot-native=3D -pipe -Wno-error=3Dincompatible-pointer-types -Wl,-O1 -=
o .libs/gettext.exe gettext-gettext.o gettext.res  ../gnulib-lib/libgrt.a .=
./intl/.libs/libintl.dll.a -ladvapi32 -liconv
| libtool: link: i686-w64-mingw32-gcc --sysroot=3D/srv/pokybuild/yocto-work=
er/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativ=
esdk-gettext/0.22.5/recipe-sysroot -DINSTALLDIR=3D\"/usr/local/oe-sdk-hardc=
oded-buildpath/sysroots/i686-w64-mingw32/usr/bin\" -O2 -fcanon-prefix-map -=
fmacro-prefix-map=3D/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/=
work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-gettext/0.22.5/gettext-0.=
22.5=3D/usr/src/debug/nativesdk-gettext/0.22.5 -fdebug-prefix-map=3D/srv/po=
kybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32=
-w64-mingw32/nativesdk-gettext/0.22.5/gettext-0.22.5=3D/usr/src/debug/nativ=
esdk-gettext/0.22.5 -fmacro-prefix-map=3D/srv/pokybuild/yocto-worker/meta-m=
ingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-gett=
ext/0.22.5/gettext-0.22.5=3D/usr/src/debug/nativesdk-gettext/0.22.5 -fdebug=
-prefix-map=3D/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i=
686-nativesdk-mingw32-w64-mingw32/nativesdk-gettext/0.22.5/gettext-0.22.5=
=3D/usr/src/debug/nativesdk-gettext/0.22.5 -fdebug-prefix-map=3D/srv/pokybu=
ild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64=
-mingw32/nativesdk-gettext/0.22.5/recipe-sysroot=3D -fmacro-prefix-map=3D/s=
rv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mi=
ngw32-w64-mingw32/nativesdk-gettext/0.22.5/recipe-sysroot=3D -fdebug-prefix=
-map=3D/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nat=
ivesdk-mingw32-w64-mingw32/nativesdk-gettext/0.22.5/recipe-sysroot-native=
=3D -fmacro-prefix-map=3D/srv/pokybuild/yocto-worker/meta-mingw/build/build=
/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-gettext/0.22.5/recip=
e-sysroot-native=3D -pipe -Wno-error=3Dincompatible-pointer-types -Wl,-O1 -=
o .libs/envsubst.exe envsubst-envsubst.o gettext.res  ../gnulib-lib/libgrt.=
a ../intl/.libs/libintl.dll.a -ladvapi32 -liconv
| libtool:   error: Could not determine the host path corresponding to
| libtool:   error:   '/srv/pokybuild/yocto-worker/meta-mingw/build/build/t=
mp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-gettext/0.22.5/gettext=
-0.22.5/gettext-runtime/intl/.libs'
| libtool:   error: Could not determine the host path corresponding to
| libtool:   error: Continuing, but uninstalled executables may not work.
| libtool:   error:   '/srv/pokybuild/yocto-worker/meta-mingw/build/build/t=
mp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-gettext/0.22.5/gettext=
-0.22.5/gettext-runtime/intl/.libs'
| libtool:   error: Continuing, but uninstalled executables may not work.
| libtool:   error: Could not determine the host path corresponding to
| libtool:   error: Could not determine the host path corresponding to
| libtool:   error:   '/srv/pokybuild/yocto-worker/meta-mingw/build/build/t=
mp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-gettext/0.22.5/gettext=
-0.22.5/gettext-runtime/intl/.libs'
| libtool:   error:   '/srv/pokybuild/yocto-worker/meta-mingw/build/build/t=
mp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-gettext/0.22.5/gettext=
-0.22.5/gettext-runtime/intl/.libs'
| libtool:   error: Continuing, but uninstalled executables may not work.
| libtool:   error: Could not determine the host path corresponding to
| libtool:   error: Continuing, but uninstalled executables may not work.
| libtool:   error:   '/srv/pokybuild/yocto-worker/meta-mingw/build/build/t=
mp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-gettext/0.22.5/gettext=
-0.22.5/gettext-runtime/intl/.libs'
| libtool:   error: Continuing, but uninstalled executables may not work.
| libtool:   error: Could not determine the host path corresponding to
| libtool:   error:   '/srv/pokybuild/yocto-worker/meta-mingw/build/build/t=
mp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-gettext/0.22.5/gettext=
-0.22.5/gettext-runtime/intl/.libs'
| libtool:   error: Continuing, but uninstalled executables may not work.
[...]
| libtool: compile:  i686-w64-mingw32-gcc --sysroot=3D/srv/pokybuild/yocto-=
worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/n=
ativesdk-gettext/0.22.5/recipe-sysroot -DLOCALEDIR=3D\"/usr/local/oe-sdk-ha=
rdcoded-buildpath/sysroots/i686-w64-mingw32/usr/share/locale\" -DBISON_LOCA=
LEDIR=3D\"/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-w64-mingw32/u=
sr/share/locale\" -DLOCALE_ALIAS_PATH=3D\"/usr/local/oe-sdk-hardcoded-build=
path/sysroots/i686-w64-mingw32/usr/share/locale\" -DUSEJAVA=3D0 -DGETTEXTJA=
R=3D\"/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-w64-mingw32/usr/s=
hare/gettext/gettext.jar\" -DLIBDIR=3D\"/usr/local/oe-sdk-hardcoded-buildpa=
th/sysroots/i686-w64-mingw32/usr/lib\" -DGETTEXTDATADIR=3D\"/usr/local/oe-s=
dk-hardcoded-buildpath/sysroots/i686-w64-mingw32/usr/share/gettext\" -DPROJ=
ECTSDIR=3D\"/usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-w64-mingw32=
/usr/share/gettext/projects\" -DEXEEXT=3D\".exe\" -DHAVE_CONFIG_H -I. -I.. =
-I. -I. -I.. -I.. -I../libgrep -I../gnulib-lib -I../gnulib-lib -I../../gett=
ext-runtime/intl -I../../gettext-runtime/intl -DGNULIB_DEFINED_ERROR -DGNUL=
IB_DEFINED_GETOPT -O2 -fcanon-prefix-map -fmacro-prefix-map=3D/srv/pokybuil=
d/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-m=
ingw32/nativesdk-gettext/0.22.5/gettext-0.22.5=3D/usr/src/debug/nativesdk-g=
ettext/0.22.5 -fdebug-prefix-map=3D/srv/pokybuild/yocto-worker/meta-mingw/b=
uild/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-gettext/0.=
22.5/gettext-0.22.5=3D/usr/src/debug/nativesdk-gettext/0.22.5 -fmacro-prefi=
x-map=3D/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-na=
tivesdk-mingw32-w64-mingw32/nativesdk-gettext/0.22.5/gettext-0.22.5=3D/usr/=
src/debug/nativesdk-gettext/0.22.5 -fdebug-prefix-map=3D/srv/pokybuild/yoct=
o-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32=
/nativesdk-gettext/0.22.5/gettext-0.22.5=3D/usr/src/debug/nativesdk-gettext=
/0.22.5 -fdebug-prefix-map=3D/srv/pokybuild/yocto-worker/meta-mingw/build/b=
uild/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-gettext/0.22.5/r=
ecipe-sysroot=3D -fmacro-prefix-map=3D/srv/pokybuild/yocto-worker/meta-ming=
w/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-gettext=
/0.22.5/recipe-sysroot=3D -fdebug-prefix-map=3D/srv/pokybuild/yocto-worker/=
meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesd=
k-gettext/0.22.5/recipe-sysroot-native=3D -fmacro-prefix-map=3D/srv/pokybui=
ld/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-=
mingw32/nativesdk-gettext/0.22.5/recipe-sysroot-native=3D -pipe -Wno-error=
=3Dincompatible-pointer-types -c write-catalog.c  -DDLL_EXPORT -DPIC -o .li=
bs/libgettextsrc_la-write-catalog.o
| In file included from ../gnulib-lib/time.h:51,
|                  from ../gnulib-lib/sys/stat.h:51,
|                  from ../gnulib-lib/fcntl.h:64,
|                  from write-catalog.c:26:
| write-catalog.c: In function 'msgdomain_list_print':
| write-catalog.c:251:11: error: implicit declaration of function 'close_us=
ed_without_requesting_gnulib_module_close' [-Wimplicit-function-declaration=
]
|   251 |       if (close (fd) < 0)
|       |           ^~~~~
| make[5]: *** [Makefile:4478: libgettextsrc_la-write-catalog.lo] Error 1

https://valkyrie.yoctoproject.org/#/builders/7/builds/734/steps/12/logs/std=
io

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


