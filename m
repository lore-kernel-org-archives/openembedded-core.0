Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC67C61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 09:13:56 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.15435.1700644427355888516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 01:13:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YMDr8TuA;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c8880f14eeso30512031fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 01:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700644425; x=1701249225; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FbOfTYtSx7rQehRsZ9zt9ankP9t5RI6fYbuiK3FWQFY=;
        b=YMDr8TuAIkjk8UHHaNmzj7VFjooxRlEa/ZTtRbUZYo8jui1WDe+DxbWbQkIQuXaqbG
         +JOGYx//n/a+pRfX92QJcD37kYWI02cPaun93cB+fBXNhvHMk7I7X8Rbo5M9mNtdq+u8
         3Ac50sS6TCmG31CY+6z7q5bxJCozCwjLYlV9wOf1PUWf0PS1BN2g8c4Yeh8KlgV3Phus
         76aAQ8qAX2uhEiYNTiua0en0vEweoTbeAQrc+5sy0WOWCf0Hd84JVfCqY/seGjOhDaXy
         ACkcyFdHZD1AtkgMx/yRedFvolRmco4XBMnbGlahauAXdJz0+ztRI5MxUgVjS7HGiwO5
         o/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700644425; x=1701249225;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbOfTYtSx7rQehRsZ9zt9ankP9t5RI6fYbuiK3FWQFY=;
        b=VULGE39eTA7eHBF1Wn+VrH2I/aSui8+JPHBWun+RecxWaCnBIyHgFWph/FHH4Kfjoc
         I5EIaibFrrgEjNmM7PN/A98El8A2fH7f4oG9hLCy6HOA6Zc3KT7UpEzzPxFfmq7v09k/
         7Vr5oVMB1eJZ2mZpgo6yy+iVbUpqZSANhB6pQ3Lq6onHv85dI9uqevs8DutgiXIlkZVG
         pYE744BvjF3efLKq1YgNcrlEtOeiX4Lg7s/7Q538miwUzqVJsbzDNbVOZBC/76nVfvlU
         BqGbdk3Qc9E8f3/WV5rh1fwfv7a+jwgIuvY177Gy0Fa8kNkJF8oY5I5kyOLq41Kcpk4a
         8oEA==
X-Gm-Message-State: AOJu0YyJSpyut09nyuwDDNNISnWcf2gYjZWyRJBm+M3BTebWH/wRmis0
	G3u8JpUw6aHhFa1hs/flRIn1JOw23CvlF613TLI=
X-Google-Smtp-Source: AGHT+IH1sK4mWOz1vNEeM/hz5jCrag8cQ+nlBhBYvhkVAbFq8sAO0pv+uBmRqJ8f/R3e5hsW2OoUfWzXi00OmXeexdw=
X-Received: by 2002:a05:651c:229:b0:2c5:14da:91f2 with SMTP id
 z9-20020a05651c022900b002c514da91f2mr1112587ljn.22.1700644425440; Wed, 22 Nov
 2023 01:13:45 -0800 (PST)
MIME-Version: 1.0
References: <20231122090402.7643-1-alb3rt0.m3rciai@gmail.com>
In-Reply-To: <20231122090402.7643-1-alb3rt0.m3rciai@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Nov 2023 10:13:34 +0100
Message-ID: <CANNYZj973T=WtUyMjnP3dTtp1y3JAceB_ZQoP7pV4j41g9giEQ@mail.gmail.com>
Subject: Re: [PATCH] poky: kirkstone: eSDK: fix build-in eSDK environment file generation
To: Alberto Merciai <alb3rt0.m3rciai@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 09:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191042

There is still no description of how to observe the issue, no answer
to my question, and I did not suggest any of this at any point (I had
to go and check - some of my old patches were used as a reference,
this is not the same as Suggested-by).

NACK.

Alex



On Wed, 22 Nov 2023 at 10:04, Alberto Merciai <alb3rt0.m3rciai@gmail.com> wrote:
>
> From: amerciai <alb3rt0.m3rciai@gmail.com>
>
> - Following Setting up the Extensible SDK environment directly in a Yocto build
>   https://docs.yoctoproject.org/4.0.14/sdk-manual/extensible.html#setting-up-the-extensible-sdk-environment-directly-in-a-yocto-build
>   The generated environment file does not point to the
>   correct sysroot folder, then the end user is not able
>   to cross-compile by sourcing the file.
>
> - The same for kirkstone-4.0.10
>
> - By analyzing
>   https://lore.kernel.org/all/20220622103312.1098389-3-alex@linutronix.de/T/#m7eadf6c722410f5b233ebba9fc700a895af9f052
>   I found that changes apllied to
>   meta/classes/toolchain-scripts.bbclass
>   solve the issue.
>
> Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
> Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
>
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index d735d434e6..ec50a1efa0 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -70,15 +70,23 @@ toolchain_create_tree_env_script () {
>         script=${TMPDIR}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
>         rm -f $script
>         touch $script
> +       echo 'standalone_sysroot_target="${STAGING_DIR}/${MACHINE}"' >> $script
> +       echo 'standalone_sysroot_native="${STAGING_DIR}/${BUILD_ARCH}"' >> $script
>         echo 'orig=`pwd`; cd ${COREBASE}; . ./oe-init-build-env ${TOPDIR}; cd $orig' >> $script
> -       echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${STAGING_BINDIR_TOOLCHAIN}:$PATH' >> $script
> -       echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >> $script
> -       echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
> +
> +       echo 'export PATH=$standalone_sysroot_native/${bindir_native}:$standalone_sysroot_native/${bindir_native}/${TARGET_SYS}:$PATH' >> $script
> +       echo 'export PKG_CONFIG_SYSROOT_DIR=$standalone_sysroot_target' >> $script
> +       echo 'export PKG_CONFIG_PATH=$standalone_sysroot_target'"$libdir"'/pkgconfig:$standalone_sysroot_target'"$prefix"'/share/pkgconfig' >> $script
> +
>         echo 'export CONFIG_SITE="${CONFIG_SITE}"' >> $script
> -       echo 'export SDKTARGETSYSROOT=${STAGING_DIR_TARGET}' >> $script
> -       echo 'export OECORE_NATIVE_SYSROOT="${STAGING_DIR_NATIVE}"' >> $script
> -       echo 'export OECORE_TARGET_SYSROOT="${STAGING_DIR_TARGET}"' >> $script
> -       echo 'export OECORE_ACLOCAL_OPTS="-I ${STAGING_DIR_NATIVE}/usr/share/aclocal"' >> $script
> +
> +       echo 'export SDKTARGETSYSROOT=$standalone_sysroot_target' >> $script
> +       echo 'export OECORE_NATIVE_SYSROOT=$standalone_sysroot_native' >> $script
> +       echo 'export OECORE_TARGET_SYSROOT=$standalone_sysroot_target' >> $script
> +       echo 'export OECORE_ACLOCAL_OPTS="-I $standalone_sysroot_native/usr/share/aclocal"' >> $script
> +       echo 'export OECORE_BASELIB="${baselib}"' >> $script
> +       echo 'export OECORE_TARGET_ARCH="${TARGET_ARCH}"' >>$script
> +       echo 'export OECORE_TARGET_OS="${TARGET_OS}"' >>$script
>
>         toolchain_shared_env_script
>  }
> --
> 2.34.1
>

