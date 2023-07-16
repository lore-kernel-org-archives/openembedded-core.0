Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734C4EB64DD
	for <webhook@archiver.kernel.org>; Sun, 16 Jul 2023 21:39:06 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.7183.1689543540093073123
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jul 2023 14:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=CsDA0FHI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C839D240002;
	Sun, 16 Jul 2023 21:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689543538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UqFBi+xqr42sLmxcpKptgvi7nKnrvsh5UyKtJGKGkV4=;
	b=CsDA0FHIwQ2KnckYcinfV/fo9KEWT7UTl1vh+hMZwgxgxs5W+Unv9a0RiykAMO9zpIk6Em
	S4fHTWfqvkkOo6JHaI65iflaHAY++1s0QVM5HSggRio0h/gwXi4/KKC/LJId7T/luQDVxL
	y6nnNfT8UvCd8xXX2Kme9nt8RG6Kc+GYrJHpp4ewbNaROKksKY46xQFIc5jfkIuYSOW5nP
	wKy+iHFIuyycXwrl//xUtpt56UzQg8srpAbbyLyrUo7RtW5VpUn92yk6YnofgsMl7YRzuy
	cbMa3BAQuxBfboObIOonywnXkbaEZxNJbDz8ZH85h/ePnYjMsuwLf3rVzbASbg==
Date: Sun, 16 Jul 2023 23:38:57 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Piotr =?utf-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>
Cc: Alex Stewart <alex.stewart@ni.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: ODP: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr
 distro native features support
Message-ID: <20230716213857fea03b3e@mail.local>
References: <20230712190428.379909-1-p.lobacz@welotec.com>
 <0cce368f-36b7-672e-df83-94b4914a1344@ni.com>
 <VI1PR04MB5373A7CF0029527D7AA884689134A@VI1PR04MB5373.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <VI1PR04MB5373A7CF0029527D7AA884689134A@VI1PR04MB5373.eurprd04.prod.outlook.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 21:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184422

Hello,

On 14/07/2023 10:14:50+0000, Piotr =C5=81obacz wrote:
> OK so, does any one have any thoughts regarding this patchset?

This still fails on the autobuilder, most of the builds failed:

https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/7477/step=
s/11/logs/stdio

ERROR: nativesdk-xcb-proto-1.15.2-r0 do_package_write_ipk: Fatal errors occ=
urred in subprocesses:
Command 'PATH=3D"/home/pokybuild/yocto-worker/genericx86-64/build/scripts/n=
ativesdk-intercept:/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/gen=
ericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-=
proto/1.15.2-r0/recipe-sysroot-native/usr/bin/python3-native:/home/pokybuil=
d/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-li=
nux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/chrpath-nat=
ive:/home/pokybuild/yocto-worker/genericx86-64/build/scripts:/home/pokybuil=
d/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-li=
nux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/i686-pokysd=
k-linux:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i68=
6-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot/usr/=
local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/usr/bin/crosss=
cripts:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686=
-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-nativ=
e/usr/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/=
i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-n=
ative/usr/bin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wo=
rk/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroo=
t-native/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wo=
rk/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroo=
t-native/bin:/home/pokybuild/yocto-worker/genericx86-64/build/bitbake/bin:/=
home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/hosttools" opkg-b=
uild -Z xz -a "--memlimit=3D5% --threads=3D8" "" "" nativesdk-python-xcbgen=
 /home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativ=
esdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/deploy-ipks/i686-nativesdk=
' returned non-zero exit status 1.
Subprocess output:Usage: /home/pokybuild/yocto-worker/genericx86-64/build/b=
uild/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/re=
cipe-sysroot-native/usr/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] =
[-a compressor_args] [-O] [-o owner] [-g group] <pkg_directory> [<destinati=
on_directory>]
Command 'PATH=3D"/home/pokybuild/yocto-worker/genericx86-64/build/scripts/n=
ativesdk-intercept:/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/gen=
ericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-=
proto/1.15.2-r0/recipe-sysroot-native/usr/bin/python3-native:/home/pokybuil=
d/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-li=
nux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/chrpath-nat=
ive:/home/pokybuild/yocto-worker/genericx86-64/build/scripts:/home/pokybuil=
d/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-li=
nux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/i686-pokysd=
k-linux:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i68=
6-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot/usr/=
local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/usr/bin/crosss=
cripts:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686=
-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-nativ=
e/usr/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/=
i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-n=
ative/usr/bin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wo=
rk/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroo=
t-native/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wo=
rk/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroo=
t-native/bin:/home/pokybuild/yocto-worker/genericx86-64/build/bitbake/bin:/=
home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/hosttools" opkg-b=
uild -Z xz -a "--memlimit=3D5% --threads=3D8" "" "" nativesdk-xcb-proto-dev=
 /home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativ=
esdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/deploy-ipks/i686-nativesdk=
' returned non-zero exit status 1.
Subprocess output:Usage: /home/pokybuild/yocto-worker/genericx86-64/build/b=
uild/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/re=
cipe-sysroot-native/usr/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] =
[-a compressor_args] [-O] [-o owner] [-g group] <pkg_directory> [<destinati=
on_directory>]
Command 'PATH=3D"/home/pokybuild/yocto-worker/genericx86-64/build/scripts/n=
ativesdk-intercept:/home/pokybuild/yocto-worker/genericx86-64/build/build/t=
mp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/gen=
ericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-=
proto/1.15.2-r0/recipe-sysroot-native/usr/bin/python3-native:/home/pokybuil=
d/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-li=
nux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/chrpath-nat=
ive:/home/pokybuild/yocto-worker/genericx86-64/build/scripts:/home/pokybuil=
d/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativesdk-pokysdk-li=
nux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-native/usr/bin/i686-pokysd=
k-linux:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i68=
6-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot/usr/=
local/oe-sdk-hardcoded-buildpath/sysroots/i686-pokysdk-linux/usr/bin/crosss=
cripts:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686=
-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-nativ=
e/usr/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/=
i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroot-n=
ative/usr/bin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wo=
rk/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroo=
t-native/sbin:/home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/wo=
rk/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/recipe-sysroo=
t-native/bin:/home/pokybuild/yocto-worker/genericx86-64/build/bitbake/bin:/=
home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/hosttools" opkg-b=
uild -Z xz -a "--memlimit=3D5% --threads=3D8" "" "" nativesdk-xcb-proto-dbg=
 /home/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/i686-nativ=
esdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/deploy-ipks/i686-nativesdk=
' returned non-zero exit status 1.
Subprocess output:Usage: /home/pokybuild/yocto-worker/genericx86-64/build/b=
uild/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-xcb-proto/1.15.2-r0/re=
cipe-sysroot-native/usr/bin/opkg-build [-A] [-X] [-c] [-C] [-Z compressor] =
[-a compressor_args] [-O] [-o owner] [-g group] <pkg_directory> [<destinati=
on_directory>]


> ________________________________
> Od: Alex Stewart <alex.stewart@ni.com>
> Wys=C5=82ane: czwartek, 13 lipca 2023 00:04
> Do: Piotr =C5=81obacz <p.lobacz@welotec.com>; openembedded-core@lists.ope=
nembedded.org <openembedded-core@lists.openembedded.org>
> Temat: Re: [OE-Core][PATCH v5 1/5] bitbake.conf: add acl and xattr distro=
 native features support
>=20
> ACK this patchset, assuming the other maintainers are happy with how
> we're handling the DISTO_FEATURES.
>=20
> I chose not to include Piotr's opkg and opkg-utils ACL/xattr changes
> into the 0.6.2 release, which I have just pushed. They've been merged
> afterward, and can still be applied atop 0.6.2, and they'll be merged
> into the December opkg release.
>=20
> I have a branch ready to upgrade the opkg and opkg-utils recipes, but
> I'd like to wait for this patchset to clear, because they will otherwise
> conflict.
>=20
> On 7/12/23 15:04, Piotr =C5=81obacz via lists.openembedded.org wrote:
> > Include support for ACLs and extended file attributes for native
> > builds, by default.
> >
> > Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> > ---
> >   meta/conf/bitbake.conf | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 9625a6fef4..8daaaad615 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
> >
> >   # Native distro features (will always be used for -native, even if th=
ey
> >   # are not enabled for target)
> > -DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
> > +DISTRO_FEATURES_NATIVE ?=3D "acl x11 ipv6 xattr"
> >   DISTRO_FEATURES_NATIVESDK ?=3D "x11"
> >
> >   # Normally target distro features will not be applied to native build=
s:
> >
> >=20
> >
>=20
> --
> Alex Stewart
> Software Engineer - NI Real-Time OS
> NI (National Instruments)
>=20
> alex.stewart@ni.com
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184256): https://lists.openembedded.org/g/openembedde=
d-core/message/184256
> Mute This Topic: https://lists.openembedded.org/mt/100138221/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

