Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E31DC43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 12:33:29 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.8462.1657629199907997426
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 05:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A6TpWnRw;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id a15so7328811pfv.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 05:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ThXJWLJ4jrq94lfyF11iLw9z9o4212VQhIJzw1lXXfM=;
        b=A6TpWnRw+vLDwZmhfjY5lBKddusAi2hrY35nkNA6pqOpp/IRvhg3yxzDxoHSmNHa9Z
         aFG3nUbaIv1IVaOm4G08yNqqYy1dgk9x8H0Qnh0vp8cHX0NA6rsLzuwMG91PxOs1B/WH
         VeCTigAkqLxwtCkB1MgF3mxRI0/KeaLHGDIr/tVR2B/c591wLen5n2nbVdpnW6KkwgKp
         VjPepYpPODWJaXuCMBvYLFx43qFxFDFosY+42+IQz074eEjN8Ch203c5y0incfRgtl6Q
         cVD9Kxmmj8P57E+oD/YgxiebE5DFQQiwvc1dMUVnM+1R2ijl62xQtvO9DktPc9zMS6Gh
         jcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ThXJWLJ4jrq94lfyF11iLw9z9o4212VQhIJzw1lXXfM=;
        b=CSMg7GICVtk7/UF6wnf5QvrgbCjmsxMeOgoaxQXXWLAvOFjnwzRfCr6ZcLBt0BE9ze
         M7U2KPXHCUWtX5YFVGdhS1jzMUd5hP3ZYO+SO8Ig+yj1pple5LXOW8soJJrN18+7SjN4
         hXgxietvWckNwZQMlHP/+u7Q3VWK1SRzEmyj+0nNZbr+mTIgZLGjEXex9fzdAUI++4Dl
         RWYr2pDGeaHJdNLXNOcBiLwwJ5JlG0JU641KTXta0C9zVm3mffOeDd/Oggj056xbaEaB
         8nYNyAxzHaDkqeZ5z5eRL4mtJGKp2xmabbnAOuf3aBhxTY0G15sc1wZ8LgTLHGlKt2J9
         +i4Q==
X-Gm-Message-State: AJIora9w3CCWvgw52g/Yz5HUGYXGhEfA6pybivpFl26kmVmSqDw0XE5p
	iy3MZvBSGqxBUpMiGomPzuUMehw/eLN18B8GbQs=
X-Google-Smtp-Source: 
 AGRyM1uDwZK3Bv2NiKCOomhmPgtcSJHAc2me+O2NAPdVttBCJjeKhWSQzCIplukkf5SQbwFyHxtbQfcfrHY7sm89nLk=
X-Received: by 2002:a63:9041:0:b0:415:c0e8:c588 with SMTP id
 a62-20020a639041000000b00415c0e8c588mr17899628pge.282.1657629199226; Tue, 12
 Jul 2022 05:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220712115054.177016-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220712115054.177016-1-richard.purdie@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 12 Jul 2022 08:33:07 -0400
Message-ID: 
 <CADkTA4PoTTQHOQLuSGLJwAVEZoAB22BrvafB5uvuhUK3jr12Pw@mail.gmail.com>
Subject: Re: [PATCH] kernel-arch: Fix buildpaths leaking into external module
 compiles
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 12:33:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167926

On Tue, Jul 12, 2022 at 7:50 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Building external kernel modules like lttng-modules was showing build paths
> inside the debug symbols for the modules and breaking build reproducibility.
>
> Fix this by adding in the mapping needed to map the kernel build directory
> to something more approriate on target.

Aha. Yes, this makes sense.

Looks good to me (as a logical step, even if more pops up later!)

Bruce

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/kernel-arch.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
> index 07ec242e63b..348a3adf225 100644
> --- a/meta/classes/kernel-arch.bbclass
> +++ b/meta/classes/kernel-arch.bbclass
> @@ -61,7 +61,7 @@ HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
>  TARGET_AR_KERNEL_ARCH ?= ""
>  HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
>
> -KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH}"
> +KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH}"
>  KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
>  KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
>  TOOLCHAIN = "gcc"
> --
> 2.34.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

