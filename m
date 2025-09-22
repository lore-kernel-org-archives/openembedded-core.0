Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D52CA100F
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:03:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.57993.1758560595154815847
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 10:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ZZS3DAEK;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 467F44E40CD3
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:03:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BC4C60635;
	Mon, 22 Sep 2025 17:03:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2548F102F1929;
	Mon, 22 Sep 2025 19:03:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758560592; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c3tGYFeZSVwoTev2g47NenR7gkBWKJJxfBu716chQcE=;
	b=ZZS3DAEKnhtNhu1NIXFjBpXlrTuQbxp2P7BiDy7V+P4Vj/aRNxcB8IgboV/w0oYKT4AD/c
	elK2Y2G74mlQWoTVpiDTxjKGSvGKBngOGhOLY6T2sXapOTEw4+9umnMph7JhsFi42ylWBZ
	U66GgkiY0DkAUV5cBGBNtDeVDLJRmJ4jbkAFx/JjbMY8vQgbSVQpgfmm8azb1DWCEf0mvQ
	VxoZrzZsrzr3fMgbU02sJXg/SBt8egOQKjlVVU041x9UZ1zUHlhKOPHD6PoK6CZO9DzsqI
	pgFRYERgxOemacsU14WVqYGa/AGWPXDyrTE4zkW3tqKcxgYBuaKvHU2o/AGt8w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Sep 2025 19:03:08 +0200
Message-Id: <DCZHP9FR7V02.2SO4MZM8WKHJ@bootlin.com>
To: <nmjain23@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libmd: add ptest for 'libmd'
Cc: <Virendra.Thakur@kpit.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250919120527.1517036-1-namanj1@kpit.com>
In-Reply-To: <20250919120527.1517036-1-namanj1@kpit.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223831

On Fri Sep 19, 2025 at 2:05 PM CEST, Naman Jain via lists.openembedded.org =
wrote:
> diff --git a/meta/recipes-support/libmd/libmd_1.1.0.bb b/meta/recipes-sup=
port/libmd/libmd_1.1.0.bb
> index dc588a0f95..a39a5ec65b 100644
> --- a/meta/recipes-support/libmd/libmd_1.1.0.bb
> +++ b/meta/recipes-support/libmd/libmd_1.1.0.bb
> @@ -11,6 +11,21 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0436d4fb62a=
71f661d6e8b7812f9e1df"
>  SRC_URI =3D "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.=
xz"
>  SRC_URI[sha256sum] =3D "1bd6aa42275313af3141c7cf2e5b964e8b1fd488025caf2f=
971f43b00776b332"
> =20
> -inherit autotools
> +inherit autotools ptest
> +
> +do_compile_ptest() {
> +    sed -i "/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d" test/Makefile
> +    oe_runmake check
> +}
> +
> +
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/test
> +    for bin in ${B}/test/*; do
> +        if [ -x "$bin" ]; then
> +            libtool --mode=3Dinstall install "$bin" ${D}${PTEST_PATH}/te=
st/$(basename "$bin")

Hi Naman,

Can you use ${B}/libtool here instead of libtool? It looks like it
should fix the issue we are seeing.

> +        fi
> +    done
> +}
> =20
>  BBCLASSEXTEND =3D "native nativesdk"

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


