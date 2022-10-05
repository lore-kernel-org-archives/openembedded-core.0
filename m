Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034CEC433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 17:09:47 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web08.526.1664989779141042991
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 10:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lIX430Vy;
 spf=pass (domain: gmail.com, ip: 209.85.222.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id g2so10579768qkk.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 10:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Bkemdf+wSr/AcaV3ty3GRUror4q/oCTa2/x0oztnOf4=;
        b=lIX430Vy8MoMGf0MxyGdgjL28KUdmoTgnctWnWQL0msLruTaTqafKluY7tm2aYcqHa
         BAKE/rpPIZLjXoblhfOwNDu7qW8WUigd9EP+v2C8VIeqNHSEVc7JMFEoWuOnr20PLjK5
         SN9iJyaa8bIfivHhJJMIeOvw9H5oVEGB0EO2RYqnkYcMUDqBepAW6wch3r1QFqwyv5pH
         nYB4IWs7Z8AiM66sHSZ67RL6Pb9LrJNpp3BMWR6Bf054yWE6OrtRZjkxf7EtNo3DrpuJ
         eKsTBrjf9achhS50LyuR+ZKZ0wUmv0Jh/WL8Id4fhlDHosY/vj/PSv6dTI9pkG5qUCTJ
         JMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Bkemdf+wSr/AcaV3ty3GRUror4q/oCTa2/x0oztnOf4=;
        b=2hgfBnQtHgYtQdkEoUBPvoUGs72kEqQbWHp+ONTY6rMVOJyvJpnN27V0kd8ixITB2G
         8oETzf1rg8ouGSIO6d0uxu7nkErW2zG4veY/DbqpkyJWXlQ38XB2L4/yr4wUDHtV5yOD
         w7usxGnl3ybniJZ3F5YZv8Z+vl4mr0HZBDFaFMMdKLEjDWy2vvP8shFnb8XChamMw385
         acDd2ZKcPnXE1Xmsrs4E+m5rgDNR5481Gcat3fFoYsayfYDIJ+CnUM+FRKkfu8JE5+DA
         wfmO+Nz7cynezA5cIvJA+d3BAoU9CjKOGegb/wbomXY+QF44PEwR6xQgq1/FvV8knPVM
         i+7g==
X-Gm-Message-State: ACrzQf1lN18C7SgDVytvK3kUcA5bVL/hOpg2hY2jIvmwDs8uPlssOOCE
	OYm17KKUL9YxXPql6rv7lw7ftZH4spOq1fg+tXOx0FnS
X-Google-Smtp-Source: 
 AMsMyM6vwnGpQsbVp9QltaIem1EZ3eaxpp0p8fLNbfLQ6G8yV9HDpwy/WTq4Yv54GXm3TYleJUozxt6ntiK7V1Rw7PA=
X-Received: by 2002:a05:6638:2056:b0:35a:d11a:e814 with SMTP id
 t22-20020a056638205600b0035ad11ae814mr196574jaj.44.1664986499005; Wed, 05 Oct
 2022 09:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221005150138.2538539-1-thomas.perrot@bootlin.com>
 <CANNYZj9zy23Vud+41johxrg6MTvx-rZAWQbKmB52NMYBjgYp4w@mail.gmail.com>
 <20929425292b86e535e9e86c599c5e9b60406c82.camel@bootlin.com>
In-Reply-To: <20929425292b86e535e9e86c599c5e9b60406c82.camel@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Oct 2022 18:14:47 +0200
Message-ID: 
 <CANNYZj9BjotP+h8vjp9-v0kMtJJXK9xizzJGBryznu6wuFOnBg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] core-image-sato: install virtio input for Qemu
 targets
To: Thomas Perrot <thomas.perrot@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 17:09:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171470

Then please add this to the commit message.

Alex

On Wed, 5 Oct 2022 at 18:10, Thomas Perrot <thomas.perrot@bootlin.com> wrote:
>
> Hello Alex,
>
> On Wed, 2022-10-05 at 17:31 +0200, Alexander Kanavin wrote:
>
> Has this regressed at some point? Why was it not needed before?
>
>
> This issue occurs when the rrecommends are not installed.
>
> Kind regards,
> Thomas
>
>
> Alex
>
> On Wed 5. Oct 2022 at 17.01, Thomas Perrot via lists.openembedded.org <thomas.perrot=bootlin.com@lists.openembedded.org> wrote:
>
> Otherwise, it isn't possible to interact with the UI.
>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>  meta/recipes-sato/images/core-image-sato.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
> index e63a229d1257..0e37c15097b3 100644
> --- a/meta/recipes-sato/images/core-image-sato.bb
> +++ b/meta/recipes-sato/images/core-image-sato.bb
> @@ -12,6 +12,8 @@ inherit core-image
>  TOOLCHAIN_HOST_TASK:append = " nativesdk-intltool nativesdk-glib-2.0"
>  TOOLCHAIN_HOST_TASK:remove:task-populate-sdk-ext = " nativesdk-intltool nativesdk-glib-2.0"
>
> +IMAGE_INSTALL:append:qemuall = " kernel-module-virtio-input"
> +
>  QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
>  QB_MEM:qemuarmv5 = "-m 256"
>  QB_MEM:qemumips = "-m 256"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171465): https://lists.openembedded.org/g/openembedded-core/message/171465
> Mute This Topic: https://lists.openembedded.org/mt/94137249/5443093
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [thomas.perrot@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>
> --
>
> Thomas Perrot, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
>

