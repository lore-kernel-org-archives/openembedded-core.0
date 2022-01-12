Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B525C433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 19:23:51 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.2146.1642015430318601633
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 11:23:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=n95WPveX;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id kl12so4046863qvb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 11:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P6bBhhQ3sOTqISFD3LqGZ0xQWmdq7iBduVQocKB2EyQ=;
        b=n95WPveXiwjBg9XWMWQDhGZfeIlF4J4XmG1jXy3HA9AEQuGCFL5Q4C/eDC/y8vYacM
         i98bftewUfUIGzr99qgFglHksPExZh+OBfZQiJ267R5jBxPw6OB4lBg5Fz4RRNP7taOS
         sSheumHPQQmx+7a883XkcXRQc2A0VeACHqTC0kHRkcM9y2qh+JIgokz68Ry/niWm1+Re
         B2/52DfQOjrmDx1Lmo/VK605qMIVtaMBnJE0f+w/R/QpojAeJkXY8taI1FLq8XmpKL2I
         0NWf3wbqnyZlo3MEh5Xv9J0MMQni2b2o3+MT+jT1eMay7mv3Xkfpd6mFM85X+U1WGiPw
         6hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P6bBhhQ3sOTqISFD3LqGZ0xQWmdq7iBduVQocKB2EyQ=;
        b=1osVRCP2Uz4eB+RODAEkzM7p5N6eqnfAN/03A/VbuIS/yn0a4fj8qSHHi8crLee0Bp
         RfdNODtMRnva/V38W6Gy3eVqwOMnCzXhqVZC+TTFzy67Nouyw52/zINPCS5btsPpgD+M
         VQxSa9GWqFzW9oicT7PYbCVFH6WDmW/+294SLYrywi/Ypy4YbkAtNdlEY1YVBHCwvJb9
         JMZvgYNRgqbyIdPTj+Qn4746R30ENeGmEC0sx06X4t/xtzMfw91ea+ryyEa1AAsYjEzs
         DB42jt4/XGB+M8Qc/TYnqinulqfeqE1nCrA00nrl5I/WmtEEZY97cBs42yB+H1BBiyFx
         UsxA==
X-Gm-Message-State: AOAM530TBwlcM6JpffnraR3g3P0qk23+MBKCY6D2z2JzvRAb38hEOKlV
	wD9f45y62n96CnYP3UDb3qK5g9XwY+4d3YwpvFhyyQ==
X-Google-Smtp-Source: 
 ABdhPJy7X2jexPwpHqf4REOIGfRALWVi6aNyqf6xBkOVTy27WXbxlUfgk+RcJacf6HJQW2KtWCRUwGtWsvclG/4p5j0=
X-Received: by 2002:a05:6214:20a2:: with SMTP id
 2mr1242172qvd.57.1642015429410;
 Wed, 12 Jan 2022 11:23:49 -0800 (PST)
MIME-Version: 1.0
References: <20220112090708.1597301-1-kexin.hao@windriver.com>
In-Reply-To: <20220112090708.1597301-1-kexin.hao@windriver.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Wed, 12 Jan 2022 14:23:38 -0500
Message-ID: 
 <CAPoiz9wdB1z_mC5Td6RpN63ED_7Mm+7vBmDQtf=XoRmYLwCrVA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tune-cortexa72: Enable the crc extension by
 default for cortexa72
To: Kevin Hao <kexin.hao@windriver.com>
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 19:23:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160498

On Wed, Jan 12, 2022 at 4:11 AM Kevin Hao <kexin.hao@windriver.com> wrote:
>
> The crc extension is optional for the ARMv8.0 but is mandatory for the
> cortexa72, so there is no reason not to enable it for the cortexa72
> tune. With this change, the cortexa72-crc seems redundant. But we
> had better to keep it to be compatible with the BSP which already used
> that tune.
>
> Signed-off-by: Kevin Hao <kexin.hao@windriver.com>

Acked-by: Jon Mason <jdmason@kudzu.us>

From the GCC sources, it's hard coded for A34, A35, A53, A57, A72,
A73, and almost all of the others listed.  I can patch the rest.

Thanks,
Jon


> ---
>  .../machine/include/arm/armv8a/tune-cortexa72.inc    | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> index 3651cf6e802b..4c9add32f5f5 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> @@ -10,12 +10,12 @@ AVAILTUNES += "cortexa72 cortexa72-crc cortexa72-crc-crypto"
>  ARMPKGARCH:tune-cortexa72             = "cortexa72"
>  ARMPKGARCH:tune-cortexa72-crc         = "cortexa72"
>  ARMPKGARCH:tune-cortexa72-crc-crypto  = "cortexa72"
> -TUNE_FEATURES:tune-cortexa72          = "${TUNE_FEATURES:tune-armv8a} cortexa72"
> -TUNE_FEATURES:tune-cortexa72-crc      = "${TUNE_FEATURES:tune-cortexa72} crc"
> -TUNE_FEATURES:tune-cortexa72-crc-crypto   = "${TUNE_FEATURES:tune-cortexa72} crc crypto"
> -PACKAGE_EXTRA_ARCHS:tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS:tune-armv8} cortexa72"
> -PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa72 cortexa72-crc"
> -PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72 cortexa72-crc cortexa72-crc-crypto"
> +TUNE_FEATURES:tune-cortexa72          = "${TUNE_FEATURES:tune-armv8a-crc} cortexa72"
> +TUNE_FEATURES:tune-cortexa72-crc      = "${TUNE_FEATURES:tune-cortexa72}"
> +TUNE_FEATURES:tune-cortexa72-crc-crypto   = "${TUNE_FEATURES:tune-cortexa72} crypto"
> +PACKAGE_EXTRA_ARCHS:tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS:tune-armv8-crc} cortexa72"
> +PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc} cortexa72"
> +PACKAGE_EXTRA_ARCHS:tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72 cortexa72-crc-crypto"
>  BASE_LIB:tune-cortexa72            = "lib64"
>  BASE_LIB:tune-cortexa72-crc        = "lib64"
>  BASE_LIB:tune-cortexa72-crc-crypto = "lib64"
> --
> 2.31.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160480): https://lists.openembedded.org/g/openembedded-core/message/160480
> Mute This Topic: https://lists.openembedded.org/mt/88369540/3616920
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jdmason@kudzu.us]
> -=-=-=-=-=-=-=-=-=-=-=-
>

