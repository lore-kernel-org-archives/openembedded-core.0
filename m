Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335E7C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 22:14:26 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.88005.1674771265707385096
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 14:14:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=irOl1A+I;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id g16so1408400ilr.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 14:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WeV77HvXY3SGNSAmkDToMIqrC3nSgqp+3hWrb+qjwZY=;
        b=irOl1A+IEX28/c5FMjaerdhV6mj+tSicd3AFlAwG9ou5YaEmx+46+kOGpTupS/CFlc
         FPna+vff01wVGPinh8LG2hHPbdxygzhGeRpdyW4vI/TYzII7e7oG0gc0E7Xk1ECZxx36
         k8PXGcYGqzd1WD4Uaj1zBhSf6cvmKlh44SjkGLE9VTVZscfMcXt3cGIfWKq20eNzYyRi
         M2uCjPWTTKF/GG+R7BG8rtWXgUkYiU6If6J+HwBnDJ2agLglgkAyOEI4UqM11H9u0ZlS
         SKnP/jLUmHE051E1Nbd/zzVgh5l+nlriT6HDUoAM7JHdNrISEhX5Z+CQV+5VrxiRfCG0
         M4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WeV77HvXY3SGNSAmkDToMIqrC3nSgqp+3hWrb+qjwZY=;
        b=6+h/sZ2eyHWWYd22pWEzOfHSG1aRn4jfvR17yNwwdaqzI5GjvtM+nW8/UcXLHqDam3
         s2BHviYNGYi217UvWI2tZ5Bdp4hQC/iYjMUAfm9adU2E27tE3RsEltpuGOMtAcHy9ga3
         +My4yEX6Byb9dm8Sa4fTZv9SnvNnbg5HffVb2Gj1l2+ogs8sfDYRoyqVZBwH8bEpOujF
         T4aKY4pIB6vWPhRBnac4+JBQJFcW1RG+O5zhkfUPBTV5/R7kjTEN5ySOoP6G+r4rm8cH
         sHZqyHN3gRcwrzK2ohI6gshRhaH44r5O3PiZLip9pnqgz/sscBmwX3JM7VKF2tH1zP1Q
         orNA==
X-Gm-Message-State: AFqh2kpd2rhCLUu+RZSMMcTaWUIZ5T9dSkdHB+Gs8xY9+LTr9Cf7943D
	pz+vDn35mVqk9O7wriN2WsGqQx7Dq6oK8Rf3Zzo=
X-Google-Smtp-Source: AMrXdXucNIHszatbCUYGX67oan1mFCaIaQsKHmn5VBh1OionpBDQ+7NTJ3xL+wzq7780pu6NB0os4kSzE43ksIJc6s0=
X-Received: by 2002:a05:6e02:1201:b0:30e:ec1e:2dac with SMTP id
 a1-20020a056e02120100b0030eec1e2dacmr3698162ilq.75.1674771265058; Thu, 26 Jan
 2023 14:14:25 -0800 (PST)
MIME-Version: 1.0
References: <20230126221009.2550277-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230126221009.2550277-1-richard.purdie@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 26 Jan 2023 17:14:14 -0500
Message-ID: <CADkTA4O84Jx_SywYmV12PYGftcuH19eoF3MOw51KJpOn9AaJTw@mail.gmail.com>
Subject: Re: [PATCH] kernel/linux-kernel-base: Fix kernel build artefact
 determinism issues
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 22:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176432

On Thu, Jan 26, 2023 at 5:10 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> With the 6.1 kernel we've seen reproducibility/determinism issues where the kernel
> seems to rebuild headers referencing the hostname or local user. kernel-devsrc
> building after the kernel seemed to trigger it in some cases.
>
> Moving the definitions to the bbclass used by all the kernel recipe code including
> kernel-devsrc seems to be the best way to ensure this doesn't happen.
>

This is the right thing to do.

I haven't been able to root cause how the 6.1 kernel file generation was
being triggered by devsrc, and how it raced with the main kernel to change
the build-artifacts .. but it most definitely did do it.

At the very least, this rules out a lot of paths to the generation  of the
header files, and if it happens again, it will be easier to track down.

Bruce

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes-recipe/kernel.bbclass            | 3 ---
>  meta/classes-recipe/linux-kernel-base.bbclass | 4 ++++
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
> index bd3b6471c6b..4fbe84c4e42 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -210,9 +210,6 @@ PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
>
>  export OS = "${TARGET_OS}"
>  export CROSS_COMPILE = "${TARGET_PREFIX}"
> -export KBUILD_BUILD_VERSION = "1"
> -export KBUILD_BUILD_USER ?= "oe-user"
> -export KBUILD_BUILD_HOST ?= "oe-host"
>
>  KERNEL_RELEASE ?= "${KERNEL_VERSION}"
>
> diff --git a/meta/classes-recipe/linux-kernel-base.bbclass b/meta/classes-recipe/linux-kernel-base.bbclass
> index cb2212c9485..65cc48f304d 100644
> --- a/meta/classes-recipe/linux-kernel-base.bbclass
> +++ b/meta/classes-recipe/linux-kernel-base.bbclass
> @@ -43,5 +43,9 @@ def linux_module_packages(s, d):
>      suffix = ""
>      return " ".join(map(lambda s: "kernel-module-%s%s" % (s.lower().replace('_', '-').replace('@', '+'), suffix), s.split()))
>
> +export KBUILD_BUILD_VERSION = "1"
> +export KBUILD_BUILD_USER ?= "oe-user"
> +export KBUILD_BUILD_HOST ?= "oe-host"
> +
>  # that's all
>
> --
> 2.37.2
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

