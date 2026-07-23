Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B591FC531F7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 16:33:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.999.1784824381660813941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 09:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=o3ElC//o;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 673C41A119C;
	Thu, 23 Jul 2026 16:32:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C1D66038D;
	Thu, 23 Jul 2026 16:32:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F1F611C1122F;
	Thu, 23 Jul 2026 18:32:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784824378; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vGUNKegrEAr1ke3ZxVmWC6bq75qs0PmDVVhlq7pHvlo=;
	b=o3ElC//ovRlG03v3LSe1O8JL7wpEOOIYvuJb8Kb3QDO2fdt8mr6WXuttYxtsPqIwBkhFWv
	LTmanIaNR9O3gP2044pqsCtrxw2CLRdgXfOxWBotp7KMdcf2zjqGLspczyUCYztJOaUiny
	IK/+EeHIBoiIfakGim4B8O8QJ9tj6yZqyA3otwxuue7mOoQbcEi779hTLqf56ve5vaB5uP
	G4SpJw2Niq5CfGDv3zHV+ySUGVFYAMgc2TMK4UkGwQwC+nUYyhXWdPTUGXZi4axjtcV12q
	0k8mPZQNvM/Ou1ZV74vVaiwP5p+BVsW7bYP2HEgI+lnWrQ6h22d7iZySFWPgNQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 18:32:56 +0200
Message-Id: <DK63FRAJRSGX.FKZ2NYM616PN@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 2/4] libpsl: convert to meson build system
Cc: "Khem Raj" <khem.raj@oss.qualcomm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260722215737.1940382-1-khem.raj@oss.qualcomm.com>
 <20260722215737.1940382-2-khem.raj@oss.qualcomm.com>
In-Reply-To: <20260722215737.1940382-2-khem.raj@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 16:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241864

On Wed Jul 22, 2026 at 11:57 PM CEST, Khem Raj via lists.openembedded.org w=
rote:
> Switch the recipe from autotools to meson:
>
> - inherit meson instead of autotools; drop gettext (the meson build has
>   no i18n)
> - Map the PACKAGECONFIG knobs to meson options: --enable-runtime=3DX
>   becomes -Druntime=3DX, and builtin PSL data stays enabled via meson's
>   default (-Dbuiltin=3Dtrue), matching the previous --enable-builtin.
> - Disable the bundled tests and fuzzers with -Dtests=3Dfalse.
> - The gtk-doc class drives -Ddocs on its own via GTKDOC_MESON_OPTION.
>
> Unlike the autotools tarball, meson regenerates psl.1 at build time and
> stamps it with `date +%B %Y`, which is not reproducible. Backport the
> proposed upstream fix to honour SOURCE_DATE_EPOCH.
>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---

Hi Khem,

> --- a/meta/recipes-support/libpsl/libpsl_0.23.0.bb
> +++ b/meta/recipes-support/libpsl/libpsl_0.23.0.bb
> @@ -12,15 +12,18 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D49296c1806=
ef92c28297fb264163d81e \
>                      "
>
>  SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
> +           file://0001-Support-reproducible-builds.patch \
>             "
>  SRC_URI[sha256sum] =3D "f39b9631b3d369a21259ea4654f8875c0ec6995ce9551c0e=
b5d423e4c011f911"
>
>  GITHUB_BASE_URI =3D "https://github.com/rockdaboot/libpsl/releases"
>
> -inherit autotools gettext gtk-doc manpages pkgconfig lib_package github-=
releases
> +inherit meson gtk-doc pkgconfig lib_package github-releases manpages
> +
> +# Do not build the bundled tests and fuzzers.
> +EXTRA_OEMESON =3D "-Dtests=3Dfalse"
>
>  PACKAGECONFIG ?=3D "idn2"
> -PACKAGECONFIG[manpages] =3D "--enable-man,--disable-man,libxslt-native"

It looks like we have some user of this PACKAGECONFIG:

ERROR: libpsl-0.23.0-r0 do_configure: QA Issue: libpsl: invalid PACKAGECONF=
IG(s): manpages [invalid-packageconfig]
ERROR: libpsl-0.23.0-r0 do_configure: Fatal QA errors were found, failing t=
ask.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/4039

Looking at oe-core it's not obvious to me where it comes from, and why
we have this error. I also note I did not reproduce it locally on a
quick test, maybe we have to use a specific configuration.

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


