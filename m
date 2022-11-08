Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8DEC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 09:14:48 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web12.5902.1667898883648021953
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 01:14:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Id6HZtRQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id t10so20201951ljj.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 01:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=elypsuoc8+Q6c6vo9DEAkKYZD52+CpOzdzoE9IfkiBM=;
        b=Id6HZtRQlFNMfLVS0Q3GHDzK263B27GGGrfLBw+a85fcWJogyjuRfwdJDON23F7q5e
         kKTRW/gQK2lk8mq60Iex1/9eQ+KMGKJ8S3poabAYZLZcPRjBa6CchzS9vs6zHW6Rd0pN
         pg1weBsAHSpmmTqZax9lof+IsAOknUn/Ej2QRw5+3ISYPlp4EMQnNQ96lLbnJCF/rAJ5
         jaLrnkzB0DrRRkaJWiPo4KycTk5Il869X2c7ZEpoUCwNMTguMuwJnFKNPjQYPCiScAp4
         QbWF/XFDgSH4St+hzhhws4LbmaDQV00iyhFaJpHIPCptzM9Jr4VvzjWwu4+B0JI4fRWs
         2ONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elypsuoc8+Q6c6vo9DEAkKYZD52+CpOzdzoE9IfkiBM=;
        b=SDK3BsYFx+hVQtWN0NILYdeY0FmrgrHMdlISfVNXQNAR86h4TVnZiRk2n0UEUhiocf
         VvPv/jL3jEuN9MBVAg4aFkHfPG/Bj+/k4/7kvCpVY7YySX6Ei0fspESOvD6JhQPklmtY
         DEyfQHsLj8Qrp6oUCY/L9KUe3ZckczpgV06KfwAo2/y4ji3fboY1BL071GUktDqUZd9a
         iPjqWwCkedB+by6lVaGS+/DhDYt5QhHvj9NGeMNBUtcH/WLMZ3OQhHWIJkFBJulSp+RP
         GgKArRtoOXePxSDg4/rMquPuqbIUDlMCWggm7jpkb87LaJ2cDc7Dl1E72umbjquTS06d
         PcCQ==
X-Gm-Message-State: ACrzQf0E6A7uUc5KMsGW0iVlqaHuWtA0IvhKa0Nnm0Kbq5KzY9DTKVCC
	9Qoy43CFQcqBgqtJAw527zjFLNyJuW7UMzO+e/3BK3OJ
X-Google-Smtp-Source: AMsMyM5k1+P8D+/0DvcsmUA6pcDOeCoVCZxWFNM1/FSEjJWQWqfkewfKgDCmymhMR1QLB/+BaIZxH4OYlwNwfrnBnZE=
X-Received: by 2002:a05:651c:23a5:b0:26d:d196:d04 with SMTP id
 bk37-20020a05651c23a500b0026dd1960d04mr6799729ljb.403.1667898881861; Tue, 08
 Nov 2022 01:14:41 -0800 (PST)
MIME-Version: 1.0
References: <20221108000828.42824-1-niko.mauno@vaisala.com> <20221108000828.42824-2-niko.mauno@vaisala.com>
In-Reply-To: <20221108000828.42824-2-niko.mauno@vaisala.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Nov 2022 10:14:30 +0100
Message-ID: <CANNYZj9f2nfRbwU1MXn2a7ruKHhkw318F92Lqp9xYd8acvubwQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 2/3] kbd: Disable 64 bit time with 32 bit glibc
To: niko.mauno@vaisala.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 09:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172955

We do build for 32 bit arm targets, so is this seen only in specific
circumstances? What are they?

Alex

On Tue, 8 Nov 2022 at 01:09, Niko Mauno via lists.openembedded.org
<niko.mauno=vaisala.com@lists.openembedded.org> wrote:
>
> For now add exemption in order to avoid following failure during
> do_compile()
>
>   | .../build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/12.2.0/ld:.libs/libtswrap.ver:2: syntax error in VERSION script
>   | collect2: error: ld returned 1 exit status
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  meta/recipes-core/kbd/kbd_2.5.1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb b/meta/recipes-core/kbd/kbd_2.5.1.bb
> index aa3ab6e121..b623aecd36 100644
> --- a/meta/recipes-core/kbd/kbd_2.5.1.bb
> +++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
> @@ -18,6 +18,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
>
>  SRC_URI[sha256sum] = "ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683"
>
> +# Compiling 64 bit time for 32 bit host is broken
> +GLIBC_64BIT_TIME_CPPFLAGS = ""
> +
>  PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
>                    "
>
> --
> 2.36.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172940): https://lists.openembedded.org/g/openembedded-core/message/172940
> Mute This Topic: https://lists.openembedded.org/mt/94880633/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

