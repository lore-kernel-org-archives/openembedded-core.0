Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04380C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 14:50:37 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.61191.1749480632938026870
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 07:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=GlYqckBY;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.210.41, mailfrom: jdmason@kudzu.us)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72c16e658f4so2653074a34.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 07:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1749480632; x=1750085432; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJtxsfUut1LtaDvhJNdPxEaMTgoFl+sl2CpodcuHfQU=;
        b=GlYqckBY6KEOeFExxvZfTHBKGnzNKRf6yoPo6ZJCEqIcb7trb2xFewWVTXxa/k5hQa
         LNPJlmLFfH0yHC3EPyBW4XxRskVlASk3jUcxh9xfRHgEOmgn+UVqhrWG49AXCNHP2LbP
         btoYM+OZ+/mVZENQpCR0wt7xru1EO11hevF9vwHlgaLvDPgjNAH15SYeUAUcvvznqgen
         oVQjCJGpu0VGSejYV8saavF3RinmGkGchWGmYBeQsOnkxbexCaszuyTI2b/bCkZXK7/u
         uM16WQNvA4jqYTK6HzNBgcbctK3BEKKtyJ5Uc4yDzzb3a1EZH4s8QkU3FE+cy1EZl90x
         11ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749480632; x=1750085432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJtxsfUut1LtaDvhJNdPxEaMTgoFl+sl2CpodcuHfQU=;
        b=HqJ9/EaJ0OP6S13J0Wy6ladUs1FGUkIOTN7Q6RajJgxRIUqRdlEZz6tPCtcu5EA39z
         KlTYmBoRbf/7/tIO5sKjWZ3TpL8BaIUM7kbgG9fKs3k1hay1xm3MIdpREkk63nyMMJof
         DOXtyJPgNjXGuT0nISwX9paA7LOxTwILaBZtgeuax44cj4zlBbKagH+At3pbxZ1ZdDTJ
         GcCWtmW4q1mcNNL7RB3c2wpbHN3FOkM3qmVxWG+Nz3LBXxLcv80HdRnzQH5lgy8jaXOp
         KOyrOFNb8O9Egvln3HMKhEDJP7MSQV97de/CtjMplkFX3x1AP+0FAlREkAuGBs8EdQ+N
         lDOA==
X-Gm-Message-State: AOJu0YyJSmvoiSLKQhB1UtlFyldkSNsY9lwUg/UsKoANJC9jx40KfH26
	/6b6Hf/VMjDXm6PLYuks31R0kHeOI6KDeAZCPC6uyZTkfDEzp82jvSHjV73kDghAmdK+lPtt3pG
	gVfrJm63ksLEqlkjjrHV8AWAljM39Q7PjNOWc1+aE
X-Gm-Gg: ASbGncu6FMJx+Wh4GqIfkCFTmsNH8EB0K+6oDabbxkNcVIRXLUNKiwAk1+D9Ipz0O/o
	9VdWqlegApkWZ5n/AJjYGAWHlDV6Af7X/qpfXWe+3VT7hKOHRCV2vkai/QXB2oKusamD2pWBWIy
	1qTq6uOwfthpFMweWATfCzZepdKcuwFk69hgOZIfKwEA0=
X-Google-Smtp-Source: AGHT+IEKnwK82ohykKayRafvk643+emWiwMHxxiVhAUynbzjzssA9NJ8ptGrdLynPJL8dZBpZ7+Xr0mKGgE0jPvcgDA=
X-Received: by 2002:a05:6870:f601:b0:2c2:c92a:5789 with SMTP id
 586e51a60fabf-2ea006939b9mr8469544fac.5.1749480632058; Mon, 09 Jun 2025
 07:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250609143639.2388322-1-sandeep.gundlupet-raju@amd.com>
In-Reply-To: <20250609143639.2388322-1-sandeep.gundlupet-raju@amd.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Mon, 9 Jun 2025 10:50:21 -0400
X-Gm-Features: AX0GCFuJoqb6DnSxr6Qe3v6CCbeSgUGuaun1-eiLNV3R7CzQC_Hlbp6DUPkLUCQ
Message-ID: <CAPoiz9ybLJX1X=mU5+rtk4nYa=N5UQESi10wSdcpykmgzG6Zbg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] tune-cortexr52: Remove aarch64 for ARM Cortex-R52
To: sandeep.gundlupet-raju@amd.com
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com, 
	jon.mason@arm.com, ross.burton@arm.com, mark.hatle@kernel.crashing.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 14:50:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218294

On Mon, Jun 9, 2025 at 10:36=E2=80=AFAM Sandeep Gundlupet Raju via
lists.openembedded.org
<sandeep.gundlupet-raju=3Damd.com@lists.openembedded.org> wrote:
>
> Remove aarch64 for ARM Cortex-R52 processor as it supports only 32-bit
> ISA but not 64-bit ISA. Also update ARMPKGARCH for cortexr52hf.

LGTM

> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> Signed-off-by: Sandeep Gundlupet Raju <grsandeep85@gmail.com>
> ---
> Changes in v2:
>    - Change patch subject.
>    - Discard cortexr52-32 patch implementation.
>    - Remove aarch64 for for ARM Cortex-R52 processor.
> ---
>  meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc b/me=
ta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
> index 89f0e09450..e8667bc16b 100644
> --- a/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
> +++ b/meta/conf/machine/include/arm/armv8r/tune-cortexr52.inc
> @@ -10,11 +10,10 @@ require conf/machine/include/arm/arch-armv8r.inc
>
>  AVAILTUNES                             +=3D "cortexr52"
>  ARMPKGARCH:tune-cortexr52               =3D "cortexr52"
> -# We do not want -march since -mcpu is added above to cover for it
> -TUNE_FEATURES:tune-cortexr52            =3D "aarch64 crc simd cortexr52"
> +TUNE_FEATURES:tune-cortexr52            =3D "${TUNE_FEATURES:tune-armv8r=
-crc-simd} cortexr52"
>  PACKAGE_EXTRA_ARCHS:tune-cortexr52      =3D "${PACKAGE_EXTRA_ARCHS:tune-=
armv8r-crc-simd} cortexr52"
>
>  AVAILTUNES                             +=3D "cortexr52hf"
> -ARMPKGARCH:tune-cortexr52hf             =3D "cortexr52"
> +ARMPKGARCH:tune-cortexr52hf             =3D "cortexr52hf"
>  TUNE_FEATURES:tune-cortexr52hf          =3D "${TUNE_FEATURES:tune-cortex=
r52} callconvention-hard"
>  PACKAGE_EXTRA_ARCHS:tune-cortexr52hf    =3D "cortexr52hf"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218293): https://lists.openembedded.org/g/openembedde=
d-core/message/218293
> Mute This Topic: https://lists.openembedded.org/mt/113551273/3616920
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jd=
mason@kudzu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

