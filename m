Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9C3E92732
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 19:28:52 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.25055.1696534130976974466
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 12:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pDm5WIOt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5C4AFF80E;
	Thu,  5 Oct 2023 19:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696534129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s0wlhruPxTN8sul0t1nhKRt9zlrVIZsGvZogaRpkq6Y=;
	b=pDm5WIOtDWSUrwqqqzxoGSdXPzikea/iB/ZGVEUeRnT5X9wOWpwaUeagYjn5hymYi9e+cZ
	47UD/mAvLN5vwb2TL9hMNxozVmP8ltl7NC2RIwUWDoAA2hzDGIxZIFMfmiMcueY2HEicfr
	Aw/ZEdON6aU8qODIiNm+NLG51VtUqk8eZlZomrHhfc4HCM/DAVt+QmAXadbPsKV77ACoBJ
	htO5mPIH8U6oXFUnWAM79iIreLVGvtSGLlRK1zM5J0kDusCr8vmf2bapodV4MPKi0tdVhG
	zIO7CU67mqNyHyOk8oZep5EaZ4/LYTuz63CmmkMO66PVLZUfc1TEHQ+GYAZfyQ==
Date: Thu, 5 Oct 2023 21:28:48 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Pavel Zhukov <pavel@zhukoff.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/3] dummy-sdk-package.inc: Filter packages
 which are marked for installation
Message-ID: <202310051928481b3031dd@mail.local>
References: <20231004161318.576312-1-pavel@zhukoff.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231004161318.576312-1-pavel@zhukoff.net>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 19:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188734

Hello,

This series causes the following failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/8312/step=
s/12/logs/stdio

| Can't locate Text/Tabs.pm in @INC (you may need to install the Text::Tabs=
 module) (@INC entries checked: /home/pokybuild/yocto-worker/buildtools/bui=
ld/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarbal=
l/1.0/testimage-sdk/bitbake-build-2946y_hb/tmp/work/x86_64-linux/automake-n=
ative/1.16.5/build/lib/ /home/pokybuild/yocto-worker/buildtools/build/build=
/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/te=
stimage-sdk/bitbake-build-2946y_hb/tmp/work/x86_64-linux/automake-native/1.=
16.5/build/../automake-1.16.5/lib/ /home/pokybuild/yocto-worker/buildtools/=
build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tar=
ball/1.0/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/../..//usr/lib=
/perl5/site_perl/5.38.0/x86_64-linux /home/pokybuild/yocto-worker/buildtool=
s/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-t=
arball/1.0/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/../..//usr/l=
ib/perl5/site_perl/5.38.0 /home/pokybuild/yocto-worker/buildtools/build/bui=
ld/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/=
testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/../..//usr/lib/perl5/ve=
ndor_perl/5.38.0 /home/pokybuild/yocto-worker/buildtools/build/build/tmp/wo=
rk/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage=
-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/../..//usr/lib/perl5/5.38.0/x86_=
64-linux /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_6=
4-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/sys=
roots/x86_64-pokysdk-linux/usr/bin/../..//usr/lib/perl5/5.38.0 /usr/local/o=
e-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/perl5/site_=
perl/5.38.0/x86_64-linux /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86=
_64-pokysdk-linux/usr/lib/perl5/site_perl/5.38.0 /usr/local/oe-sdk-hardcode=
d-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/perl5/vendor_perl/5.38.0/=
x86_64-linux /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-=
linux/usr/lib/perl5/vendor_perl/5.38.0 /usr/local/oe-sdk-hardcoded-buildpat=
h/sysroots/x86_64-pokysdk-linux/usr/lib/perl5/5.38.0/x86_64-linux /usr/loca=
l/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/perl5/5.=
38.0) at ../automake-1.16.5/doc/help2man line 28.
| BEGIN failed--compilation aborted at ../automake-1.16.5/doc/help2man line=
 28.
| make: *** [Makefile:3741: doc/aclocal-1.16.1] Error 2
| make: *** Waiting for unfinished jobs....
| if LC_ALL=3DC grep '@[a-zA-Z0-9_][a-zA-Z0-9_]*@' runtest-t; then echo "ru=
ntest contains unexpanded substitution (see lines above)"; exit 1; fi; chmo=
d a-w runtest-t && mv -f runtest-t runtest
| Can't locate Text/Tabs.pm in @INC (you may need to install the Text::Tabs=
 module) (@INC entries checked: /home/pokybuild/yocto-worker/buildtools/bui=
ld/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarbal=
l/1.0/testimage-sdk/bitbake-build-2946y_hb/tmp/work/x86_64-linux/automake-n=
ative/1.16.5/build/lib/ /home/pokybuild/yocto-worker/buildtools/build/build=
/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/te=
stimage-sdk/bitbake-build-2946y_hb/tmp/work/x86_64-linux/automake-native/1.=
16.5/build/../automake-1.16.5/lib/ /home/pokybuild/yocto-worker/buildtools/=
build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tar=
ball/1.0/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/../..//usr/lib=
/perl5/site_perl/5.38.0/x86_64-linux /home/pokybuild/yocto-worker/buildtool=
s/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-t=
arball/1.0/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/../..//usr/l=
ib/perl5/site_perl/5.38.0 /home/pokybuild/yocto-worker/buildtools/build/bui=
ld/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/=
testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/../..//usr/lib/perl5/ve=
ndor_perl/5.38.0 /home/pokybuild/yocto-worker/buildtools/build/build/tmp/wo=
rk/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage=
-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/../..//usr/lib/perl5/5.38.0/x86_=
64-linux /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_6=
4-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/sys=
roots/x86_64-pokysdk-linux/usr/bin/../..//usr/lib/perl5/5.38.0 /usr/local/o=
e-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/perl5/site_=
perl/5.38.0/x86_64-linux /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86=
_64-pokysdk-linux/usr/lib/perl5/site_perl/5.38.0 /usr/local/oe-sdk-hardcode=
d-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/perl5/vendor_perl/5.38.0/=
x86_64-linux /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-=
linux/usr/lib/perl5/vendor_perl/5.38.0 /usr/local/oe-sdk-hardcoded-buildpat=
h/sysroots/x86_64-pokysdk-linux/usr/lib/perl5/5.38.0/x86_64-linux /usr/loca=
l/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/perl5/5.=
38.0) at ../automake-1.16.5/doc/help2man line 28.
| BEGIN failed--compilation aborted at ../automake-1.16.5/doc/help2man line=
 28.
| make: *** [Makefile:3743: doc/automake-1.16.1] Error 2
| if LC_ALL=3DC grep '@[a-zA-Z0-9_][a-zA-Z0-9_]*@' t/ax/shell-no-trail-bsla=
sh-t; then echo "t/ax/shell-no-trail-bslash contains unexpanded substitutio=
n (see lines above)"; exit 1; fi; chmod a-w t/ax/shell-no-trail-bslash-t &&=
 mv -f t/ax/shell-no-trail-bslash-t t/ax/shell-no-trail-bslash
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.

On 04/10/2023 18:13:16+0200, Pavel Zhukov wrote:
> if packages is provided by dummysdk and in the same time marked for
> installation with IMAGE_INSTALL it causes conflict in apt because virtual=
 providers are
> not taken into account if package is asked to be installed explicitly.
> Filter such packages from provides/conflicts to workaround this problem.
> This workaround brakes RPM usecase because of file conlicts with
> DUMMYPROVIDES, use DUMMYPROVIDES_PACKAGES_MULTILIB instead (which
> doesn't include file based conflicts).
> While this is needed for the case of package_deb only adding it for all
> package managers to not complicate the code.
>=20
> Fixes: [Yocto #13338] [Yocto #14066]
>=20
> Fixes:
> The following information may help to resolve the situation:
>=20
> The following packages have unmet dependencies:
>  target-sdk-provides-dummy : Conflicts: bash
> E: Unable to correct problems, you have held broken packages.
>=20
> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
> ---
>  meta/recipes-core/meta/dummy-sdk-package.inc | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-=
core/meta/dummy-sdk-package.inc
> index bd26e39ad3..6ccafbf8bc 100644
> --- a/meta/recipes-core/meta/dummy-sdk-package.inc
> +++ b/meta/recipes-core/meta/dummy-sdk-package.inc
> @@ -19,13 +19,14 @@ PR[vardeps] +=3D "DUMMYPROVIDES"
>  PR[vardeps] +=3D "DUMMYPROVIDES_PACKAGES"
> =20
>  DUMMYPROVIDES_PACKAGES ??=3D ""
> -DUMMYPROVIDES_PACKAGES_MULTILIB =3D "${@' '.join([multilib_pkg_extend(d,=
 pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split()])}"
> +DUMMYPROVIDES_PACKAGES_FILTERED =3D "${@' '.join([pkg for pkg in d.getVa=
r('DUMMYPROVIDES_PACKAGES').split() if d.getVar('IMAGE_INSTALL') is not Non=
e and pkg not in d.getVar('IMAGE_INSTALL').split()])}"
> +DUMMYPROVIDES_PACKAGES_MULTILIB =3D "${@' '.join([multilib_pkg_extend(d,=
 pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES_FILTERED').split()])}"
>  DUMMYPROVIDES +=3D "${DUMMYPROVIDES_PACKAGES_MULTILIB}"
> =20
>  python populate_packages:prepend() {
>      p =3D d.getVar("PN")
>      d.appendVar("RPROVIDES:%s" % p, "${DUMMYPROVIDES}")
> -    d.appendVar("RCONFLICTS:%s" % p, "${DUMMYPROVIDES}")
> +    d.appendVar("RCONFLICTS:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}=
")
>      d.appendVar("RREPLACES:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
>  }
> =20
> --=20
> 2.41.0
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188690): https://lists.openembedded.org/g/openembedde=
d-core/message/188690
> Mute This Topic: https://lists.openembedded.org/mt/101758725/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

