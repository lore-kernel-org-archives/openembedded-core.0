Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE74C61D92
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 08:59:16 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.15140.1700643554555547316
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 00:59:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Srhtpj8O;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2c8769edd9fso49035811fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 00:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700643552; x=1701248352; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IbM+9myPUrfjkbeZLUiBYDU/+wEp/kwFSLk3nSHAhpU=;
        b=Srhtpj8OU6+olZvWWUPu7dT0YkS197tMGZd2EJMHuvVZFZpxC3nG8QYPdjKo6Fdfas
         yXoeXStmt+82+1l5Aa/epmykm0IoRoG3JQ6OZcIy+dIQ5Hx8ArmjAlgxLyVCiWnpsfrH
         aiWxfUynplYshmxdkNsvrNkbcLEKWxSfXapEW23gnV6Qs97+Sg0MP6HwwBmEHbDJA1C0
         J1YOFKC6n25r6Ma6tFffcjih5gFp8fHi3qPrRCvZp9FrREoUS3D3N99ePSbOWHA3rsBU
         TnoN1mD6+klCGdvkfOKvPYEWiViAYZ0rgu4zNBOgBECQAELDA38QmK/Ovp9qTZEftAS/
         ZmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700643552; x=1701248352;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbM+9myPUrfjkbeZLUiBYDU/+wEp/kwFSLk3nSHAhpU=;
        b=ZkVDzyf/dJzUGaTvO8PhnPDE0ZPYSui7YECb3fOY7oYdEvCmygtluML3VAhbKm3ksk
         9JgUNjC8bF4zvJ7KOdLFlVS3mFIonjW0w5UbACYzo3Hugc0zY6e/auCvWqpMcJ8RaO/L
         WmQa1pfv4zieMXXCxO0jht5wIpWpqJAjf9hgKN4g5e/kpZPuHGjUhBRLpkMhV9xiNb0e
         TaWw+nAcDCQu8S8LiqWt9mI8Hmk22TntS+UAQrrc4Iey2JOtV3s9epxEKSXfrfw81qIC
         SB5oe+pzUlrx2AvSvS0+7qiu3PuZoyuOz25+O1ljddalTlITFnSFiRT2+Cv41QBlMUF8
         pPxg==
X-Gm-Message-State: AOJu0YzHjc2CelyN6YSRkoeo8YfXPnraQf8W/kroS1UR7SgyNubvdDPm
	h+8+aa2GAh4bqh1rayCWoolN9dWO+l1/4y/JzrU=
X-Google-Smtp-Source: AGHT+IFGGfB7Ju2BBEIlgOezflXrn/h7C2C98KNAYbMrSV4wHkgk/CP/14NFRSBlKeOcn4Y/ICPU5l3MGqnPG3i0nSw=
X-Received: by 2002:a2e:a1ca:0:b0:2c6:edfe:1495 with SMTP id
 c10-20020a2ea1ca000000b002c6edfe1495mr929358ljm.26.1700643552110; Wed, 22 Nov
 2023 00:59:12 -0800 (PST)
MIME-Version: 1.0
References: <20231122085438.7328-1-alb3rt0.m3rciai@gmail.com>
In-Reply-To: <20231122085438.7328-1-alb3rt0.m3rciai@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Nov 2023 09:59:00 +0100
Message-ID: <CANNYZj87+-6jte1KYUNg2ueWvsYzxiOQvbTzrCZ_ooo9N7uutw@mail.gmail.com>
Subject: Re: [PATCH] poky: kirkstone: eSDK: fix build-in eSDK environment file generation
To: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 08:59:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191027

Can you please describe in the commit message how the issue can be
reproduced and observed, because otherwise I can't do a meaningful
review, and would have to say 'no' until I can?

Do we need to improve the tests? Do they miss something?

Alex

On Wed, 22 Nov 2023 at 09:54, Alberto Merciai <alb3rt0.m3rciai@gmail.com> wrote:
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

