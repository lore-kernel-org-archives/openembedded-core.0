Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1882FD3CCBF
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 07:53:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30855.1768463605193743832
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 23:53:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GD+vmqfV;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 21FB71A2878;
	Thu, 15 Jan 2026 07:53:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D541C606B6;
	Thu, 15 Jan 2026 07:53:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 88DAA10B684A6;
	Thu, 15 Jan 2026 08:53:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768463602; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mADcGDvhEapIQlpXBxItk5rCiVQZTiPzgKtAe6UrGl0=;
	b=GD+vmqfVEIKyh/fO3Hy7aOc06FajpkrHEiTzZYEmDeWhY8ufxQQCptF7udf5aLkwCCbLrq
	YBe9C2ZjDtBuyzSwaW92dqCqbkQ4Tdyec46F4uo4UWiNNaanGLTqDrP/rlA9H/6B5ID3TV
	6g8MvDXgbIMxuRnApO2q8lGomDXkzxXFGMvMRwBpvdYADMKq2TwxIBqEtLNfToPTwOv7UQ
	SwVPjeXxl5IaIr336Zz+RD3uv/n3rsWje4TBPHfwMZlXZBSWtIsOuypjXdMyQsqduTVXnQ
	dm/bDcMbUwt9GPBwEdu0+xV4mfiAppQtJD9maQL/DpRJtkYPwdrRA3SLTF6ytQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Jan 2026 08:53:18 +0100
Message-Id: <DFP00XRS6GEY.1ALBCSVFUBBQP@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <changqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] procps: support ptest
References: <20260114044319.2830540-1-changqing.li@windriver.com>
In-Reply-To: <20260114044319.2830540-1-changqing.li@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 07:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229388

Hi,

On Wed Jan 14, 2026 at 5:43 AM CET, Changqing Li via lists.openembedded.org=
 wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> support ptest for procps, procps's testsuite use DejaGnu test framework.
> The testsuite is expected to run during build time, this implementation
> create the same folder structure as the testsuite expected to make it
> can work well.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-extended/procps/procps/run-ptest |  7 +++
>  meta/recipes-extended/procps/procps_4.0.5.bb  | 50 ++++++++++++++++++-
>  3 files changed, 56 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-extended/procps/procps/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index fff2947177..0a4ff49ee3 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -57,6 +57,7 @@ PTESTS_FAST =3D "\
>      nettle \
>      opkg \
>      popt \
> +    procps \
>      python3-atomicwrites \
>      python3-attrs \
>      python3-bcrypt \
> diff --git a/meta/recipes-extended/procps/procps/run-ptest b/meta/recipes=
-extended/procps/procps/run-ptest
> new file mode 100644
> index 0000000000..c999876bd8
> --- /dev/null
> +++ b/meta/recipes-extended/procps/procps/run-ptest
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +
> +cd ./testsuite
> +for tool in @DEJATOOL@;do
> +    runtest -a --tool $tool --outdir ../log=20
> +done
> +
> diff --git a/meta/recipes-extended/procps/procps_4.0.5.bb b/meta/recipes-=
extended/procps/procps_4.0.5.bb
> index 0e0e06f0d2..b4697f7ce3 100644
> --- a/meta/recipes-extended/procps/procps_4.0.5.bb
> +++ b/meta/recipes-extended/procps/procps_4.0.5.bb
> @@ -10,11 +10,12 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69=
f5fce4486a80fdaf4a4263 \
> =20
>  DEPENDS =3D "ncurses"
> =20
> -inherit autotools gettext pkgconfig update-alternatives
> +inherit autotools gettext pkgconfig update-alternatives ptest
> =20
>  SRC_URI =3D "git://gitlab.com/procps-ng/procps.git;protocol=3Dhttps;bran=
ch=3Dmaster;tag=3Dv${PV} \
>             file://sysctl.conf \
>             file://top_large_pid_fix.patch \
> +           file://run-ptest \
>             "
>  SRCREV =3D "f46b2f7929cdfe2913ed0a7f585b09d6adbf994e"
> =20
> @@ -47,8 +48,51 @@ do_install:append () {
>          fi
>  }
> =20
> -CONFFILES:${PN} =3D "${sysconfdir}/sysctl.conf"
> +do_compile_ptest() {
> +    oe_runmake -C testsuite site.exp
> +    oe_runmake src/tests/test_process src/tests/test_strutils  src/tests=
/test_fileutils src/tests/test_shm
> +    DEJATOOL=3D$(make -C testsuite -s -f Makefile -f - <<'EOF'
> +all:
> +	$(info $(DEJATOOL))
> +EOF
> +)
> +    echo $DEJATOOL > ${B}/testsuite/.dejatool
> +}
> =20
> +do_install_ptest() {
> +     install -d ${D}${PTEST_PATH}/testsuite
> +     install -d ${D}${PTEST_PATH}/src
> +     install -d ${D}${PTEST_PATH}/log
> +
> +     cp -r ${S}/testsuite/* ${D}${PTEST_PATH}/testsuite/
> +     cp -r ${B}/testsuite/* ${D}${PTEST_PATH}/testsuite/
> +     cp -r ${B}/src/tests ${D}${PTEST_PATH}/src/
> +
> +     rm -rf ${D}${PTEST_PATH}/testsuite/Makefile*
> +     rm -rf ${D}${PTEST_PATH}/testsuite/README
> +     find ${D}${PTEST_PATH}/testsuite/ -type f -name "*.o" -exec rm -f {=
} +
> +     find ${D}${PTEST_PATH}/src/ -type f -name "*.o" -exec rm -f {} +
> +
> +     sed -i -e "/set srcdir/c\set srcdir ${PTEST_PATH}/testsuite" \
> +            -e "/set objdir/c\set objdir ${PTEST_PATH}/testsuite" ${D}${=
PTEST_PATH}/testsuite/site.exp
> +
> +     DEJATOOL=3D$(cat ${B}/testsuite/.dejatool)
> +     sed -i -e "s#@DEJATOOL@#$DEJATOOL#g" ${D}${PTEST_PATH}/run-ptest
> +     for p in $DEJATOOL; do
> +        if [ "$p" =3D "ps" ]; then
> +            install -d ${D}${PTEST_PATH}/src/ps
> +            ln -sf ${base_bindir}/ps ${D}${PTEST_PATH}/src/ps/pscommand
> +        elif [ "$p" =3D "sysctl" ]; then
> +            ln -sf ${base_sbindir}/$p ${D}${PTEST_PATH}/src/$p
> +        elif [ "$p" =3D "kill" ] || [ "$p" =3D "pidof" ] || [ "$p" =3D "=
watch" ]; then
> +            ln -sf ${base_bindir}/$p ${D}${PTEST_PATH}/src/$p
> +        else
> +            ln -sf ${bindir}/$p ${D}${PTEST_PATH}/src/$p
> +        fi
> +     done
> +}
> +
> +CONFFILES:${PN} =3D "${sysconfdir}/sysctl.conf"
>  bindir_progs =3D "free pkill pmap pgrep pwdx skill snice top uptime w"
>  base_bindir_progs +=3D "kill pidof ps watch"
>  base_sbindir_progs +=3D "sysctl"
> @@ -80,6 +124,8 @@ RDEPENDS:${PN} +=3D "${PROCPS_PACKAGES}"
>  RDEPENDS:${PN}-ps +=3D "${PN}-lib"
>  RDEPENDS:${PN}-sysctl +=3D "${PN}-lib"
> =20
> +RDEPENDS:${PN}-ptest +=3D "dejagnu bash glibc-utils"
> +
>  FILES:${PN}-lib =3D "${libdir}"
>  FILES:${PN}-ps =3D "${base_bindir}/ps.${BPN}"
>  FILES:${PN}-sysctl =3D "${base_sbindir}/sysctl.${BPN} ${sysconfdir}/sysc=
tl.conf ${sysconfdir}/sysctl.d"

I think this triggered the following error on our test infrastructure:

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'glibc-utils' (but /srv/pokybuild/yocto-worker/mus=
l-qemux86/build/layers/openembedded-core/meta/recipes-extended/procps/procp=
s_4.0.5.bb RDEPENDS on or otherwise requires it)

Can you have a look?

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4942697/raw_inlin=
e
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3047

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


