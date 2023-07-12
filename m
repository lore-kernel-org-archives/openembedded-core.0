Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5A6EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 16:54:15 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.1110.1689180847981068978
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 09:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eQ5SP/4t;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86ED240003;
	Wed, 12 Jul 2023 16:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689180845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Z1qdECwZOn5om63OHM+h3bW94QYKs2VBA9A5GCR+o0=;
	b=eQ5SP/4tY76FD/Kg5c8TRKJZAgcMI1+/XfSr883hiY1uh+g19qlOnCqzVlLcsJBiGB2jpL
	N9xZTGZcY1ra5hyd+6fjKbCVIVPLOWRpV6XTQhoAIO+BQDmUH2Q908rrYesyZ8Fs+h5hFr
	0fBTeGkjalqnlHYnJONE9Az09g6wEr4EEUDyBULxciJwAzV+vokrK+Xa3bq/XXKdUXmZY9
	LAZSm9KmBC3vuXzE0tXpxs1pMi37h7rsIJL7FdDXK9K4y/zVt6Q72yNlRjaCk+twHQYes6
	F9jsgB9ankXruv4xlgvbZE/XIS2MRheuFsrYXN4JLQkATfQaTYe6XnhUwmRAbw==
Date: Wed, 12 Jul 2023 18:54:05 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Piotr =?utf-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-Core][PATCH v4 2/5] package_ipk.bbclass: add support for
 ACLs and xattr
Message-ID: <202307121654058c48624b@mail.local>
References: <20230712122558.711029-1-p.lobacz@welotec.com>
 <20230712122558.711029-2-p.lobacz@welotec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230712122558.711029-2-p.lobacz@welotec.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 16:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184207

I tested a previous version and got:

ERROR: run-postinsts-1.0-r10 do_package_write_ipk: Fatal errors occurred in=
 subprocesses:
Command 'PATH=3D"/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/sys=
roots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/poky-tiny=
/build/scripts:/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/=
all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/usr/bin/allarch-=
poky-linux:/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-=
poky-linux/run-postinsts/1.0-r10/recipe-sysroot/usr/bin/crossscripts:/home/=
pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-poky-linux/run-po=
stinsts/1.0-r10/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker=
/poky-tiny/build/build/tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe=
-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/poky-tiny/build/build/=
tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/sbin:/h=
ome/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-poky-linux/ru=
n-postinsts/1.0-r10/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/=
poky-tiny/build/bitbake/bin:/home/pokybuild/yocto-worker/poky-tiny/build/bu=
ild/tmp/hosttools" opkg-build -Z xz -a "--memlimit=3D5% --threads=3D8" "" "=
" run-postinsts /home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work=
/all-poky-linux/run-postinsts/1.0-r10/deploy-ipks/all' returned non-zero ex=
it status 1.
Subprocess output:Usage: /home/pokybuild/yocto-worker/poky-tiny/build/build=
/tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/usr/bi=
n/opkg-build [-c] [-C] [-Z compressor] [-a compressor_args] [-O] [-o owner]=
 [-g group] <pkg_directory> [<destination_directory>]
Command 'PATH=3D"/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/sys=
roots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/poky-tiny=
/build/scripts:/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/=
all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/usr/bin/allarch-=
poky-linux:/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-=
poky-linux/run-postinsts/1.0-r10/recipe-sysroot/usr/bin/crossscripts:/home/=
pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-poky-linux/run-po=
stinsts/1.0-r10/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker=
/poky-tiny/build/build/tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe=
-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/poky-tiny/build/build/=
tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/sbin:/h=
ome/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-poky-linux/ru=
n-postinsts/1.0-r10/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/=
poky-tiny/build/bitbake/bin:/home/pokybuild/yocto-worker/poky-tiny/build/bu=
ild/tmp/hosttools" opkg-build -Z xz -a "--memlimit=3D5% --threads=3D8" "" "=
" run-postinsts-dev /home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/=
work/all-poky-linux/run-postinsts/1.0-r10/deploy-ipks/all' returned non-zer=
o exit status 1.
Subprocess output:Usage: /home/pokybuild/yocto-worker/poky-tiny/build/build=
/tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/usr/bi=
n/opkg-build [-c] [-C] [-Z compressor] [-a compressor_args] [-O] [-o owner]=
 [-g group] <pkg_directory> [<destination_directory>]
Command 'PATH=3D"/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/sys=
roots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/poky-tiny=
/build/scripts:/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/=
all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/usr/bin/allarch-=
poky-linux:/home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-=
poky-linux/run-postinsts/1.0-r10/recipe-sysroot/usr/bin/crossscripts:/home/=
pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-poky-linux/run-po=
stinsts/1.0-r10/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker=
/poky-tiny/build/build/tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe=
-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/poky-tiny/build/build/=
tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/sbin:/h=
ome/pokybuild/yocto-worker/poky-tiny/build/build/tmp/work/all-poky-linux/ru=
n-postinsts/1.0-r10/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/=
poky-tiny/build/bitbake/bin:/home/pokybuild/yocto-worker/poky-tiny/build/bu=
ild/tmp/hosttools" opkg-build -Z xz -a "--memlimit=3D5% --threads=3D8" "" "=
" run-postinsts-dbg /home/pokybuild/yocto-worker/poky-tiny/build/build/tmp/=
work/all-poky-linux/run-postinsts/1.0-r10/deploy-ipks/all' returned non-zer=
o exit status 1.
Subprocess output:Usage: /home/pokybuild/yocto-worker/poky-tiny/build/build=
/tmp/work/all-poky-linux/run-postinsts/1.0-r10/recipe-sysroot-native/usr/bi=
n/opkg-build [-c] [-C] [-Z compressor] [-a compressor_args] [-O] [-o owner]=
 [-g group] <pkg_directory> [<destination_directory>]


any chance this is solved in v4?

On 12/07/2023 14:25:55+0200, Piotr =C5=81obacz wrote:
> Extend OPKGBUILDCMD variable, with additional parameters, depending
> on target distro features, in order to support ACLs and xattr.
>=20
> With fix pushed to the opkg-devel:
> https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8
> opkg-build is able to create tar archives with ACLs and xattr.
>=20
> Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> ---
>  meta/classes-global/package_ipk.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-globa=
l/package_ipk.bbclass
> index b4b7bc9ac2..5e151be3cd 100644
> --- a/meta/classes-global/package_ipk.bbclass
> +++ b/meta/classes-global/package_ipk.bbclass
> @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET =3D "${WORKDIR}/opkg-sdk-target.con=
f"
>  PKGWRITEDIRIPK =3D "${WORKDIR}/deploy-ipks"
> =20
>  # Program to be used to build opkg packages
> -OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
> +OPKGBUILDCMD ??=3D 'opkg-build -Z xz -a "${XZ_DEFAULTS}" "${@bb.utils.co=
ntains('DISTRO_FEATURES', 'acl', '-A', '', d)}" "${@bb.utils.contains('DIST=
RO_FEATURES', 'xattr', '-X', '', d)}"'
> =20
>  OPKG_ARGS +=3D "--force_postinstall --prefer-arch-to-version"
>  OPKG_ARGS +=3D "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMEN=
DATIONS") =3D=3D "1"]}"
> --=20
> 2.34.1
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184190): https://lists.openembedded.org/g/openembedde=
d-core/message/184190
> Mute This Topic: https://lists.openembedded.org/mt/100098284/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

