Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89F0CA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 09:15:08 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.34711.1756977299945112278
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 02:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XoaM5ann;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 436F11A09F3
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Sep 2025 09:14:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1D00C606BB;
	Thu,  4 Sep 2025 09:14:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3AD11C22C5D3;
	Thu,  4 Sep 2025 11:14:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756977297; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5P1JZiJsh50Xu52qJOG18ybdav0jwCOldboO5V2WD/M=;
	b=XoaM5annb7lc997RdBn+5Z4KTByzy5fjxG3zzgIaXuDzyQBngGBaFKhSWV50h0pP6oSz2h
	UKbfcDuejQkF/oHuAfrVTib4m/QHwfH7XTrCrBUDXs6/Fcks+48DdGJlE0dK5pwDUpq6zv
	UU/rXknwghcBKF0gPCdrtqN9EaOvtGcyh9qDYv0L8XVpJiST3guc2cEJh4J+JdtDWmkqQK
	OueLZM4y5XsUoL5tK6bfb26wS1pKXIM8orbekdz8AnGPLqlbnwu3sBwip0m/Rb+N84qi9U
	F+kxYxFpBe59/GPXpJqyKBC06TNQmM8f6WLm/64DZXAJWop0ECZN9pvVuAzoCg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Sep 2025 11:14:52 +0200
Message-Id: <DCJWGX7G002R.3R8C67J7YSOUY@bootlin.com>
Subject: Re: [OE-core] [PATCH] vulkan-validation-layers: fix compile failure
 with DEBUG_BUILD = 1
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <hongxu.jia@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>
References: <20250901073958.235716-1-hongxu.jia@windriver.com>
In-Reply-To: <20250901073958.235716-1-hongxu.jia@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 09:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222911

On Mon Sep 1, 2025 at 9:39 AM CEST, hongxu via lists.openembedded.org wrote=
:
> When building with GCC 14+ using -Og (DEBUG_BUILD =3D 1), got
> the following errors:
>
> $ echo 'DEBUG_BUILD =3D "1"' >> conf/local.conf
> $ echo 'DISTRO_FEATURES:append =3D " vulkan opengl"' >> conf/local.conf
> $ bitbake vulkan-validation-layers
> ...
> |TOPDIR/tmp/work/core2-32-wrs-linux/vulkan-validation-layers/1.4.309.0/gi=
t/layers/./external/
> xxhash.h:4822:1: error: inlining failed in call to 'always_inline' 'void =
XXH3_scrambleAcc_sse2
> (void*, const void*)': function not considered for inlining
> ...
>
> Refer [1], using XXH_NO_INLINE_HINTS when compiling with -Og (DEBUG_BUILD=
 =3D 1)
>
> [1] https://github.com/Cyan4973/xxHash/issues/943
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../vulkan/vulkan-validation-layers_1.4.321.0.bb                | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.32=
1.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
> index fa7873b62d3..466e757a908 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
> @@ -26,6 +26,8 @@ EXTRA_OECMAKE =3D "\
>      -DSPIRV_HEADERS_INSTALL_DIR=3D${STAGING_EXECPREFIXDIR} \
>      "
> =20
> +CXXFLAGS:append =3D " ${@oe.utils.vartrue('DEBUG_BUILD', '-DXXH_NO_INLIN=
E_HINTS=3D1', '', d)}"

Minor optmization: could we use "CXXFLAGS +=3D" instead of :append here?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


