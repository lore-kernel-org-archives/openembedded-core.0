Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3F9CA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 07:51:12 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.7079.1757404266034432635
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 00:51:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ONE7pMtJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4b5f6ad78e4so31308531cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 00:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757404265; x=1758009065; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CdPZFFCxlL7mLGyMJRuahg3Z7oNzhha+ztm6SnIQnXw=;
        b=ONE7pMtJlJ+CCVWnp81mT/gml1XkA2UjtiJLYE+7Fq4RwM6FN0bZlLCq2jvo3e23HE
         KijAdMut3lfJcRMsVQMMQgR9w/UnY+b3krDbH9FiHW4f0Suzu9xbEma5CKQUcq5FK6OC
         G4ueTnKUMiuBG/LB9eyAAwyxouv7q0zoeKKqLoRLTmdKFV1dCxWOie/stdfcWT3fK/cr
         ZTfZA1vXcBEdFsK6theVipCI3nVGRhGg6FrclXe8sLXxZhWyRlJbtp0XFFMPNIUHIOR7
         u4xF/kGDgmmRoFCzgSFQSmPJUIyl9xSRu3UhhQEkgpSPLLdNrj56jr9dnKU0ckNOO0Rk
         +WWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757404265; x=1758009065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CdPZFFCxlL7mLGyMJRuahg3Z7oNzhha+ztm6SnIQnXw=;
        b=oXwZD6Aqxgkt8J+Ycg+jDsm3CnCREMXCrBXPl2SM2G62rcw8dEuLuxm2GGQyyuyOmi
         48Al8PcbN3zTGdF4uWLXH4NnToWF2MTYYUtXIkAwm59Kf4aBuWG63PNAr05vl+SOcOcp
         7CoEKWAiMmQFPSwqD+IlK3GjDH+Nx/oqNdflxnKjNYl5mUzMOUgPwROaN5VUSZsGOqEF
         DBO6CGP380RCYj3yJXcNz3qoqPWqFKZaPFZxeg7VAWMlJvEEdhqq5ECEOYqWKdT0o4rq
         whOW8wqu1mfy2Rc6ssoOY3nVJ+DLHxWunVywA0LOagiywxi4xY6sIa+GZZAQeCelfXm/
         fkpg==
X-Gm-Message-State: AOJu0YwiHa+zN3sevMdFvzMBRMTXcDt1MkuTI/T0VgaRohv3wlWkHzGj
	S2YpjiJjThyqdEyNFXu7gqSx46um4ZnEnogbnzzabZH75/EiIlgKKnfWf4OXOCQryrD2OoXvl2n
	DM8WlXxgKckXqAxKW5oqMN6T3KVrz1FCVNA==
X-Gm-Gg: ASbGncvBmWSKJj3cm1LxeB8wlz4rXJ3xIF7G3upgb2Sr1FEW+J0AsJki4x1TPmM6C0t
	taiE3x7SZmMFURNzNwhQlmuHzMA+6HnX6rZgt47fgrCCjLJujm+4GQ3IxWeOuILQmi8GIdLxJl9
	/NQNitAEwHqh4yIHkQjwgVHtJtzWyuqQaHjC8wiyrf0HTKy9u3hL0VECNKOICqodmuBFTlx0KWx
	oPovfpofaNVPQPzbTJcnD1OExDAGHu7MKFvwXqHYjwmmcHrfSjmH838jqrrHDXAKdsfbJmxCzQR
	OyK6TfNtUEClkcuSchaQtOvSphffBTrywhMzSNqMH5wRoNlLTF4=
X-Google-Smtp-Source: AGHT+IG8TvbDQLNJr1WAZaLt5mDBxsi0HXBTfxCzIK3CkoYK+GM5xDGEDADLG8k0AhAzIFw3a9R0eza/haCeaUZ/eOs=
X-Received: by 2002:a05:622a:1993:b0:4b5:d72d:b7ae with SMTP id
 d75a77b69052e-4b5f838646fmr99614301cf.12.1757404264902; Tue, 09 Sep 2025
 00:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <18635369403092D7.23332@lists.openembedded.org> <20250909074229.1249725-1-dwagenknecht@emlix.com>
In-Reply-To: <20250909074229.1249725-1-dwagenknecht@emlix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Sep 2025 09:50:52 +0200
X-Gm-Features: AS18NWC06D1VwbSOly8OcOEiQXy-Xj6qnwUrfFiKlr73yXmmxI8FDVGCzl8TMq0
Message-ID: <CANNYZj_BN4dFi0QqKY2hQV3wFwAdOJY-Z9MrdxzT7nn1bX_0Fw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] buildtools-tarball: handle missing host
 pkg-config gracefully
To: dwagenknecht@emlix.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 07:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223092

Thanks, lgtm.

Alex

On Tue, 9 Sept 2025 at 09:42, Daniel Wagenknecht via
lists.openembedded.org <dwagenknecht=emlix.com@lists.openembedded.org>
wrote:
>
> The host might not have pkg-config installed, which is OK when using the
> buildtools-extended-tarball, since that contains pkg-config. So the command in
> the generated environment-setup-* script for setting HOST_PKG_PATH is expected
> to fail in some cases without this being an error.
>
> The generated environment-setup-* script might be sourced in a shell with
> activated `errexit` option. Prevent the expected failure of this command from
> being treated as an error.
>
> The only usage of the HOST_PKG_PATH variable is in this script and already
> handles the case of the variable being empty. The variable is not exposed to
> anywhere outside this script so the effects of this change are limited to this
> script.
>
> Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
> ---
>
> v2:
>  - extend commit message to address review comments on unclear impact of the
>    change
>
>  meta/recipes-core/meta/buildtools-tarball.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
> index 02117ab84d..61b98c7387 100644
> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> @@ -73,7 +73,7 @@ create_sdk_files:append () {
>         touch $script
>         echo 'export PATH="${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${sbindir_nativesdk}:${SDKPATHNATIVE}${base_bindir_nativesdk}:${SDKPATHNATIVE}${base_sbindir_nativesdk}:$PATH"' >> $script
>         echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
> -       echo 'HOST_PKG_PATH=$(command -p pkg-config --variable=pc_path pkg-config 2>/dev/null)' >>$script
> +       echo 'HOST_PKG_PATH=$(command -p pkg-config --variable=pc_path pkg-config 2>/dev/null || true)' >>$script
>         echo 'export PKG_CONFIG_LIBDIR=${SDKPATHNATIVE}/${libdir}/pkgconfig:${SDKPATHNATIVE}/${datadir}/pkgconfig:${HOST_PKG_PATH:-/usr/lib/pkgconfig:/usr/share/pkgconfig}' >>$script
>         echo 'unset HOST_PKG_PATH'
>
> --
> 2.49.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223091): https://lists.openembedded.org/g/openembedded-core/message/223091
> Mute This Topic: https://lists.openembedded.org/mt/115146660/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

