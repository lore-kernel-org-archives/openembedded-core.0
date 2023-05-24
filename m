Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0175C77B73
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 14:56:05 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.11150.1684940162117999673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 07:56:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=QN4U8G3q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-30a1fdde3d6so919497f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 07:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1684940160; x=1687532160;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3RkjdWourbP5ibSUHjwrqBXEroemXguZ9UQdLyKWTk=;
        b=QN4U8G3qwLttBUvkIRH07NNFVceSMCQ7f8SDMMlOidzNPeXaCnGJ/ULQwCVEdEke7w
         HyoatgmL6EH1ISG2grrBlNrzVdnHcX756TMfeV1AfE1GY8fssT8IZVidEFeRVux3vfF5
         p819plI2HEFrEzJn/8QAehQ8pO3QNZsRUWJxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684940160; x=1687532160;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S3RkjdWourbP5ibSUHjwrqBXEroemXguZ9UQdLyKWTk=;
        b=gNRdyOucw/vvgvO3Lf7URlHJNuSepjtVt271dGk1KhajhQnb86GSWCnbdoCLrmNnOX
         bYoSCtvAdhsc/HPcoMtDV6ocSTjmZjQXh2YPAI3VfEcx9Ir0ngGJBp7rAOx5VY2wVS3S
         OU+EWKsWQQ4akHONci8YWU3CgKXZ2W97I+FINqlDLbx5vs+McS5c6hK/4i8Xql5ZnD1/
         OlJWk8y2pvmUiqFZ7ouMLJMxLv4sHPeBB03p8fucpAvp/Ww+JkcSi+kZ+4PcVGFIM4hp
         J+virlZcKoFqOrhctrVVBOQcFEOKzvdjeOCSEUZIIXPwSerJah+AWOlIJepw92qe2qY6
         FDwA==
X-Gm-Message-State: AC+VfDwfdpgvzSk0q1z+gbpPMJVwmaCI/a1RNFegfcnc26osw44fXsRU
	ykCPNgbAgYOI8z73EE5wmhHQQg==
X-Google-Smtp-Source: ACHHUZ4xKZKjfl6YUsAEVoNes+AhcToqhQMAEaR2RP7yrgiFK+DkLTf3p9mzLWAR4RNWPcmeZCVnog==
X-Received: by 2002:adf:cd89:0:b0:307:a52c:26b4 with SMTP id q9-20020adfcd89000000b00307a52c26b4mr29636wrj.66.1684940160404;
        Wed, 24 May 2023 07:56:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e50f:20dd:d0e2:cad5? ([2001:8b0:aba:5f3c:e50f:20dd:d0e2:cad5])
        by smtp.gmail.com with ESMTPSA id x2-20020adfdcc2000000b003077f3dfcc8sm14635474wrm.32.2023.05.24.07.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 07:56:00 -0700 (PDT)
Message-ID: <1bf7c08ac92b3ddb011ee28c0517bb983c6b579a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cpio: respect MLPREFIX for PACKAGE_WRITE_DEPS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 24 May 2023 15:55:59 +0100
In-Reply-To: <20230524105631.517832-1-Martin.Jansa@gmail.com>
References: <20230524105631.517832-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 14:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181676

On Wed, 2023-05-24 at 12:56 +0200, Martin Jansa wrote:
> * unlike DEPENDS/RDEPENDS the PACKAGE_WRITE_DEPS dependency isn't automat=
ically
>   extended with MLPREFIX, causing lib32-cpio to depend on 64bit ptest-run=
ner (and
>   all its deps)
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-extended/cpio/cpio_2.14.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/cpio/cpio_2.14.bb b/meta/recipes-exten=
ded/cpio/cpio_2.14.bb
> index e55fb70cb1..d6473dc08d 100644
> --- a/meta/recipes-extended/cpio/cpio_2.14.bb
> +++ b/meta/recipes-extended/cpio/cpio_2.14.bb
> @@ -66,7 +66,7 @@ do_install_ptest_base:append() {
> =20
>  # The tests need to run as a non-root user, so pull in the ptest user
>  DEPENDS:append:class-target =3D "${@bb.utils.contains('PTEST_ENABLED', '=
1', ' ptest-runner', '', d)}"
> -PACKAGE_WRITE_DEPS +=3D "ptest-runner"
> +PACKAGE_WRITE_DEPS +=3D "${MLPREFIX}ptest-runner"
> =20
>  RDEPENDS:${PN}-ptest +=3D "ptest-runner"
> =20

This triggers warnings:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5336/step=
s/13/logs/warnings

although that does raise some questions about what is going on with
nativesdk...

Cheers,

Richard

