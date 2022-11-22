Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A7EC4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 14:13:20 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.19962.1669126396557159004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 06:13:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=GqZ+xQAu;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.47, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f47.google.com with SMTP id i10so36044830ejg.6
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 06:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xARaAduFnLeqwd9anJjI7iYG7rjh5FJfSrQq15j0XcY=;
        b=GqZ+xQAu5JdqXDdeSBMZnbHmYIBwLRxpWiYgedGiYLoAYcujNwC7dhJJ+DSdh44K6I
         YEQchuNaRhAoYzZrHevocOO9jXGO1p8uUpTPDoQNapUsdnnznTR6n5AuL4kyW1oD9lky
         IWfD6ydoC5KC7mjS/TGW7lH79D1LhDkyL/kNhjl+VNgY7/UZPYGiXq1CIELpeVgEo1Qu
         TqHo40wLSt0kTOoUbdjfZ3EYRdx+i7AbkepODdAHyR7sXcMgLW/lvPgICCBClinwE2LJ
         f7HoGyT566t8XN+HEt7QBRmN+wfODfnZbE5Z5TxBu8AS+B46CD66Ty7CzTJvQGSzzwFE
         LaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xARaAduFnLeqwd9anJjI7iYG7rjh5FJfSrQq15j0XcY=;
        b=oaBpDox0FRJLi3kPT36hw7DLB0okuz4QLQ46m32qwURoJimfhu+owFUpzWDvGWx52c
         f0rDFCk0WbBQVBor3hjUFCi1KMnESzeOJO3pRf5Rut2ktUqKyy9MkEGI4/PrCnON1+Iv
         y68Gz7ZOlsqdAHr7Acb+8LH/CqsoOX+sdycr+nwiVidpYmIG4K5fIZCOjLoxPp8KeuV1
         LaYWmFNwuSh+ng8kccc2vvtJITXxemtwUD/4qs/ZpDOliW/BIEVyzEGYcEGbBcWlL8mR
         H+9OAHLiv+eMFYQ2Yj5AFs8CFwvZSVGI5ebwg8l8UWm72pxbbrD/T8FB0wvf4M/ZIAif
         KFlg==
X-Gm-Message-State: ANoB5pkDWHlzS1Cf2ajdW05xnYv1q6N6uhmagtjx+3Yedil9I0PBfY7R
	y/432RiVNrkU2zTWXhMN+9+czy4H3ByLpVjlFlNpIA==
X-Google-Smtp-Source: AA0mqf4lk1kfYI6S2iRMDqDWGyTYDugNj/pRo4QcnKkG/ZxmdX1vCyG/o7BcH38mlmb9xdp/BYJzi4EswrMWQUiLHbY=
X-Received: by 2002:a17:906:38c:b0:78d:4ebb:7ea1 with SMTP id
 b12-20020a170906038c00b0078d4ebb7ea1mr4861135eja.357.1669126394669; Tue, 22
 Nov 2022 06:13:14 -0800 (PST)
MIME-Version: 1.0
References: <86508b235df8fd9da34ab1f420c6a98f3edf2ba5.1669100497.git.diego.sueiro@arm.com>
In-Reply-To: <86508b235df8fd9da34ab1f420c6a98f3edf2ba5.1669100497.git.diego.sueiro@arm.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 22 Nov 2022 04:13:03 -1000
Message-ID: <CAOSpxdYwmRYG54CMUXv4iG-0j4pYws54q+TRa+CSdaH_6aoBtw@mail.gmail.com>
Subject: Re: [OE-core] [langdale][PATCH] kernel.bbclass: Include randstruct
 seed assets in STAGING_KERNEL_BUILDDIR
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 14:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173681

Hi Diego,

This patch is already in the patchset currently out for review:

https://lists.openembedded.org/g/openembedded-core/message/173569

I'll be sending the pull request later today, so it should appear in
the langdale branch in the next day or two.

Thanks!

Steve



On Mon, Nov 21, 2022 at 9:04 PM Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> When building with CONFIG_MODVERSIONS=y and CONFIG_RANDSTRUCT=y we need
> to copy the build assets generated for the randstrutc seed to
> STAGING_KERNEL_BUILDDIR, otherwise the out-of-tree modules build will
> generate those assets which will result in a different
> RANDSTRUCT_HASHED_SEED.
>
> (From OE-Core rev: b36303158b2e0273ff415bdedefb379f680b30fc)
>
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-recipe/kernel.bbclass | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
> index 7bb3449223..3834a42fb9 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -591,6 +591,22 @@ do_shared_workdir () {
>                         cp tools/objtool/objtool ${kerneldir}/tools/objtool/
>                 fi
>         fi
> +
> +       # When building with CONFIG_MODVERSIONS=y and CONFIG_RANDSTRUCT=y we need
> +       # to copy the build assets generated for the randstruct seed to
> +       # STAGING_KERNEL_BUILDDIR, otherwise the out-of-tree modules build will
> +       # generate those assets which will result in a different
> +       # RANDSTRUCT_HASHED_SEED
> +       if [ -d scripts/basic ]; then
> +               mkdir -p ${kerneldir}/scripts
> +               cp -r scripts/basic ${kerneldir}/scripts
> +       fi
> +
> +       if [ -d scripts/gcc-plugins ]; then
> +               mkdir -p ${kerneldir}/scripts
> +               cp -r scripts/gcc-plugins ${kerneldir}/scripts
> +       fi
> +
>  }
>
>  # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173670): https://lists.openembedded.org/g/openembedded-core/message/173670
> Mute This Topic: https://lists.openembedded.org/mt/95191269/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

