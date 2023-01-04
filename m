Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A5DC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 16:08:04 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.16041.1672848478613735637
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 08:07:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zy8x/lAp;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id o13so19669175ilc.7
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 08:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iuguMKDauhFK7ckcAGz4pEzMVZvdgj23yDKPTD99U2w=;
        b=Zy8x/lApq69G/CcZzT6uDUvSkk+jrt/qp/nU7FDeqhJHhqo61/xiZzmIWuWNEhcs06
         04yE4LNQJnTBASJuyg03b7yjGm1Ig9BY+WoJRqcayazckaPT2FJEqcjKZi7gKXIqWdvM
         A+mn3tjLSr4Hax6DkHeqipOHov2z7hjdZbKwR0PvAIR5CtAv2ZvXB33YrzyQ5aNAxHCG
         ydvzIcsuPeLI67c3WafhSJpO7TP+q/3dqcVcYcBfcWzV1FMEZdyZrRrTjaWSwWe7qAp/
         tUBSytRqRhlYoaXoGPvYndIyoLhAGlOJm9Hoat0MeMuTOEP5ZO31izNDRUGxmQvC3yNL
         4USw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuguMKDauhFK7ckcAGz4pEzMVZvdgj23yDKPTD99U2w=;
        b=WsP83ucbiMrhy9HW4LJ5iH6C1JxWp5NjEESx4R0BykJXNZNJ04NKkUGO4uoBI1On3Y
         GaskV6Ven1Zuk+rc0oGokC9y+YE8U9gJ1iX0ot41xcq2KsifhbcHa44v2QGvSHmvEGT+
         5/Z4my0gnUWw2WnkPJbgDbRoI6qMvyVdTsoNXN71NEJ+7CLQtrJKuVz06zMrtm5KBCFo
         NfnJBcPGYNK8SJQd8/5NlnEbJSqGSUUTfA3Bqg+bkJGIqJk4dhM/xLgbD/jz09zDeI/5
         42F92sYh2rFShKRk5QoGXR/hINX7c4UN7RMNNcyDj0as05NGK4/PLGCppN6ArRL6DdcR
         L2Bw==
X-Gm-Message-State: AFqh2kp2rcFyoDHKNJWo/p19zYpdnL3BGCd3U64Yap5GKVPQjg3PgPMB
	mDo9otypt1tQmb+pIeB7JUGoSes0xzqoR4M2ueQ=
X-Google-Smtp-Source: AMrXdXvcdPp5i1TDccvYX1ylpHNmyl5Avar84Ue4HuS8ZhZPJQiNlQntfF7dfshEAGin36bKa+yma8GCZVld6NNxHoU=
X-Received: by 2002:a92:cda1:0:b0:30c:21d5:5ce0 with SMTP id
 g1-20020a92cda1000000b0030c21d55ce0mr2623342ild.28.1672848477920; Wed, 04 Jan
 2023 08:07:57 -0800 (PST)
MIME-Version: 1.0
References: <20230104121808.1065203-1-toertel@gmail.com> <20230104121808.1065203-3-toertel@gmail.com>
In-Reply-To: <20230104121808.1065203-3-toertel@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Jan 2023 11:07:46 -0500
Message-ID: <CADkTA4OBb1J9Ld19rzvuQntdj04rRUdH9sP=cPSKwvO=U1s-Tw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] linux-yocto: Autoload sound driver on QEMU x86
To: Mark Jonas <toertel@gmail.com>
Cc: openembedded-core@lists.openembedded.org, michael.opdenacker@bootlin.com, 
	richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 16:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175499

On Wed, Jan 4, 2023 at 7:18 AM Mark Jonas <toertel@gmail.com> wrote:
>
> From: Mark Jonas <toertel@gmail.com>
>
> If DISTRO_FEATURES includes ALSA then automatically load the
> snd-intel8x0 kernel module on qemux86 and qemux86-64. This matches the
> machine configurations conf/machine/qemux86.conf and qemux86-64.conf.
>
> Signed-off-by: Mark Jonas <toertel@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index 091003ed82..c8a9b0a1e3 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -37,6 +37,11 @@ KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/
>  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
>  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vfat', 'cfg/fs/vfat.scc', '', d)}"
>
> +# sound driver recommended by conf/machine/qemux86*.conf
> +ALSA_MODULES = "${@bb.utils.contains("DISTRO_FEATURES", "alsa", "snd-intel8x0", "", d)}"
> +KERNEL_MODULE_AUTOLOAD:qemux86 += "${ALSA_MODULES}"
> +KERNEL_MODULE_AUTOLOAD:qemux86-64 += "${ALSA_MODULES}"

This gets us most of the way, but if we are going to do this we should
complete the job.

We really need to make sure there's a configuration fragment that
explicitly enables
the modules we need (and not count on defaults, or other selects). That would go
into the kernel-cache.

It would then be something we'd add to the KERNEL_FEATRES triggered off the
distro feature. Just like we are doing with numa and vfat that is visible in the
context of the patch.

Bruce

> +
>  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
>  # by the kernel. This is typically the branch that should be built,
>  # and it can be specific to the machine or shared
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175471): https://lists.openembedded.org/g/openembedded-core/message/175471
> Mute This Topic: https://lists.openembedded.org/mt/96048827/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

