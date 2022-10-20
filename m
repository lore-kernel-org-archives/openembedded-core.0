Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4060EC4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 15:08:17 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web08.10663.1666278490689468679
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Oct 2022 08:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LvhmTjZb;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-13ae8117023so3329654fac.9
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 08:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jj82ChmOxi6RTSZh6YPjrqfKUcVefdoTUfDt2csvLXU=;
        b=LvhmTjZbLVuBIiznQxOK5I3dVRJaR9MdY265+YBgFtpQOT1I9kXnFPIifiZ1VFYa0X
         gZRIRREZdfArNSM79ufUcq3dLSL6xsEgZRKSGaEqiP7KR2Qs1uW+mGOnUhCogBUreDDQ
         +w16enhllwYEMheb0lBlmqmTDqczTSSzbmQMWcrwgxkm9CjFRkHnqit7VKLMi908pQou
         Y5zUZnOQPZt8M1Od8xfhLVoJaWqZZeirPros8+55gFSkWuF91gAWZApCUsLuCwYpXY4L
         49s7ZXTeID9ajFlwkoyf7Gb0bV7z0rMdACPoOz5Q6Uis1V3DqY6Srbbs/3EhDwIjK65j
         sZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jj82ChmOxi6RTSZh6YPjrqfKUcVefdoTUfDt2csvLXU=;
        b=LPlnTw5P7kbDj7nzODwaojWdBlYZGA4FJl8HEf8jucd2SyacA0JNguslWGO0M7GUYm
         KhAd9rNjuLdFIc+hnGyDdLlGCZlUmMCyu9Se6G5Yu/BWYbpH5IqJsj8HBFbL9QyHNUps
         dwm6yxaq6+uq0fzUR4FYSZ7SHZoiZPC/Pvp4sgibJodo2Tz+4BSlA1wB3ta5FuaQyo7A
         aiVnI4Jni24ItwE6pDvonGyM1zn1v0w47T4m8fOYL9c6Of7/wIqYXTSOrTUOPjXW+Eiy
         h08wgGK+95fOFQr53b3MFgH6/xfSlw8ULw/W+9aX4saaZkJ547pM44uZhvFCa9G4fX9z
         6vrw==
X-Gm-Message-State: ACrzQf2JJvqoyt3Gd3SiVjpaWj4MGNBZ2oher84pAvbi+y/mvWYrk21f
	5NPDfyWdaXVkJhAR4Ga9V2rObyWQAnB38mYw0TZGhcJ/
X-Google-Smtp-Source: AMsMyM7ajEM2TyqMpw0XcOZekUpdmewsNi18N7LEYFs6GeCUBBJ/fxxmdCqRd2IxuMVS8yRTLdp+4kK1g3/fxPlLhgA=
X-Received: by 2002:a05:6870:d1c8:b0:132:1239:2550 with SMTP id
 b8-20020a056870d1c800b0013212392550mr25173740oac.55.1666278489820; Thu, 20
 Oct 2022 08:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <20221020135531.57483-1-arturo.buzarra@digi.com>
In-Reply-To: <20221020135531.57483-1-arturo.buzarra@digi.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Oct 2022 08:07:43 -0700
Message-ID: <CAMKF1sqtNt+5UXRc18LR8Uhq9Vcppg2nadsQVpabKw5ekoNjMA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] run-postinsts: Set dependency for ldconfig to
 avoid boot issues
To: Arturo.Buzarra@digi.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 15:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171998

On Thu, Oct 20, 2022 at 6:56 AM abuzarra via lists.openembedded.org
<Arturo.Buzarra=digi.com@lists.openembedded.org> wrote:
>
> If a package with a postsints script requires ldconfig, the package class adds
> a ldconfig postinst fragment to initialize it before. Systemd has its own
> ldconfig.service to initialize it and sometimes if both services are running
> at the same time in the first boot, the first one will work, but the second
> one will fail with the following error:
>
>     ldconfig[141]: /sbin/ldconfig: Renaming of /etc/ld.so.cache~ to /etc/ld.so.cache failed: No such file or directory
>
> This commit adds a ordering dependency between them to make sure that only one
> service is running at the same time.
>
> Signed-off-by: Arturo Buzarra <arturo.buzarra@digi.com>
> ---
>  .../run-postinsts/run-postinsts/run-postinsts.service           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
> index 7f72f3388a..b6b81d5c1a 100644
> --- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
> +++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
> @@ -1,9 +1,9 @@
>  [Unit]
>  Description=Run pending postinsts
>  DefaultDependencies=no
> -After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount
> +After=systemd-remount-fs.service systemd-tmpfiles-setup.service tmp.mount ldconfig.service

ldconfig is not always enabled, it's controlled via a DISTRO_FEATURE
so this will fail for such
systems. Maybe adding it conditionally via a systemd unit fragment
drop-in file would be a better way to go.

>  Before=sysinit.target
>
>  [Service]
>  Type=oneshot
>  ExecStart=#SBINDIR#/run-postinsts
> --
> 2.38.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171992): https://lists.openembedded.org/g/openembedded-core/message/171992
> Mute This Topic: https://lists.openembedded.org/mt/94453597/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

