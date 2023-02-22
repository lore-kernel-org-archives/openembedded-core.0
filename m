Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A4DC61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 18:22:38 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.581.1677090156587160255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 10:22:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PorreLnh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CD252C0006;
	Wed, 22 Feb 2023 18:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677090154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EQe5TqJDr+pf4t2WX8+cdMYKjh+gnx9tDGIc/vznKuQ=;
	b=PorreLnh9ePT1QZ2E5VuWcp3DA+hYEkyfIFHK1818CAH6XB3xB/UiggaOytjbJz3ATcO97
	/nlIp/n3NOJ/tYIbJKJ0xCBFWAE1dUdWgRC+XeM0yo84BEdBZ0wZWfrMr5akRJqdQkoHkb
	OoJUw1JzZ06IkCowZ6ya33htcaN3tPtrZmLxsnQGaIO9EYAKGrrTqzItTgBSG1moUnCuos
	dNOUEgRbvSAHzqPlcyzISM/Z9gjyV/kd+pGR/pe6SOgtuvp2KbbyGiH2gAwpgH8/CR7O6i
	4pR8PXyVSAiiZJ8Yb0k0ueesLaKx3dIpaizRjLlvCi2kps0/PNXJFzSyk0SEAQ==
Date: Wed, 22 Feb 2023 19:22:32 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Pavel Zhukov <pavel@zhukoff.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] kernel-arch.bbclass: Map arm64 to arm
Message-ID: <Y/ZdaL36qd93d8NY@mail.local>
References: <20230220124231.17673-1-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230220124231.17673-1-pavel@zhukoff.net>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 18:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177580

Hello,

This is the cause of:

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/995/step=
s/14/logs/stdio

2023-02-22 11:33:00,834 - oe-selftest - INFO - fitimage.FitImageTests.test_=
fit_image (subunit.RemotedTestCase)
2023-02-22 11:33:00,835 - oe-selftest - INFO -  ... FAIL

|   OBJCOPY arch/arm64/boot/Image
| NOTE: make -j 16 -l 52 CC=3Daarch64-poky-linux-gcc   -fuse-ld=3Dbfd -fmac=
ro-prefix-map=3D/home/pokybuild/yocto-worker/oe-selftest-armhost/build/buil=
d-st-3486447/tmp/work-shared/qemuarm64/kernel-source=3D/usr/src/debug/linux=
-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0  -fdebug-prefix-map=3D/hom=
e/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/wor=
k-shared/qemuarm64/kernel-source=3D/usr/src/debug/linux-yocto/6.1.9+gitAUTO=
INC+d7393c5752_1caf99d568-r0  -fmacro-prefix-map=3D/home/pokybuild/yocto-wo=
rker/oe-selftest-armhost/build/build-st-3486447/tmp/work/qemuarm64-poky-lin=
ux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0/linux-qemuarm64-st=
andard-build=3D/usr/src/debug/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf9=
9d568-r0  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/oe-selftest-arm=
host/build/build-st-3486447/tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9=
+gitAUTOINC+d7393c5752_1caf99d568-r0/linux-qemuarm64-standard-build=3D/usr/=
src/debug/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0  -fdebug-pr=
efix-map=3D/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-=
3486447/tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c57=
52_1caf99d568-r0/recipe-sysroot=3D  -fmacro-prefix-map=3D/home/pokybuild/yo=
cto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work/qemuarm64-po=
ky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0/recipe-sysro=
ot=3D  -fdebug-prefix-map=3D/home/pokybuild/yocto-worker/oe-selftest-armhos=
t/build/build-st-3486447/tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9+gi=
tAUTOINC+d7393c5752_1caf99d568-r0/recipe-sysroot-native=3D  -fdebug-prefix-=
map=3D/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-34864=
47/tmp/work-shared/qemuarm64/kernel-source=3D/usr/src/kernel -fdebug-prefix=
-map=3D/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486=
447/tmp/work-shared/qemuarm64/kernel-build-artifacts=3D/usr/src/kernel  --s=
ysroot=3D/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-34=
86447/tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752=
_1caf99d568-r0/recipe-sysroot LD=3Daarch64-poky-linux-ld.bfd    --sysroot=
=3D/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/=
tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf9=
9d568-r0/recipe-sysroot HOSTCC=3Dgcc  HOSTCFLAGS=3D-isystem/home/pokybuild/=
yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work/qemuarm64-=
poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0/recipe-sys=
root-native/usr/include -O2 -pipe HOSTLDFLAGS=3D-L/home/pokybuild/yocto-wor=
ker/oe-selftest-armhost/build/build-st-3486447/tmp/work/qemuarm64-poky-linu=
x/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0/recipe-sysroot-nati=
ve/usr/lib                         -L/home/pokybuild/yocto-worker/oe-selfte=
st-armhost/build/build-st-3486447/tmp/work/qemuarm64-poky-linux/linux-yocto=
/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0/recipe-sysroot-native/lib       =
                  -Wl,--enable-new-dtags                         -Wl,-rpath=
-link,/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-34864=
47/tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1c=
af99d568-r0/recipe-sysroot-native/usr/lib                         -Wl,-rpat=
h-link,/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486=
447/tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1=
caf99d568-r0/recipe-sysroot-native/lib                         -Wl,-rpath,/=
home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/=
work/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d56=
8-r0/recipe-sysroot-native/usr/lib                         -Wl,-rpath,/home=
/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work=
/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0=
/recipe-sysroot-native/lib                         -Wl,-O1 -Wl,--allow-shli=
b-undefined -Wl,--dynamic-linker=3D/home/pokybuild/yocto-worker/oe-selftest=
-armhost/build/build-st-3486447/tmp/sysroots-uninative/aarch64-linux/lib/ld=
-linux-aarch64.so.1 HOSTCP
=3Dgcc  -E HOSTCXX=3Dg++  HOSTCXXFLAGS=3D-isystem/home/pokybuild/yocto-work=
er/oe-selftest-armhost/build/build-st-3486447/tmp/work/qemuarm64-poky-linux=
/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0/recipe-sysroot-nativ=
e/usr/include -O2 -pipe PAHOLE=3Dfalse zImage
| make: *** No rule to make target 'zImage'.  Stop.
| ERROR: oe_runmake failed

On 20/02/2023 13:42:31+0100, Pavel Zhukov wrote:
> The kernel calls AArch64 'arm64', but U-Boot calls it just 'arm' so
> adding arm64 case to existing map.
>=20
> Fixes:
> | install: cannot stat '.../u-boot/1_2023.01-r0/build/arch/arm64/dts/u-bo=
ot.dtb': No such file or directory
>=20
> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
> ---
>  meta/classes-recipe/kernel-arch.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recip=
e/kernel-arch.bbclass
> index 777f900241..4f88c47ef1 100644
> --- a/meta/classes-recipe/kernel-arch.bbclass
> +++ b/meta/classes-recipe/kernel-arch.bbclass
> @@ -55,6 +55,7 @@ def map_uboot_arch(a, d):
>      import re
> =20
>      if   re.match('p(pc|owerpc)(|64)', a): return 'ppc'
> +    elif re.match('arm(|64)', a): return 'arm'
>      elif re.match('i.86$', a): return 'x86'
>      return a
> =20
> --=20
> 2.39.1
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177399): https://lists.openembedded.org/g/openembedde=
d-core/message/177399
> Mute This Topic: https://lists.openembedded.org/mt/97084683/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

