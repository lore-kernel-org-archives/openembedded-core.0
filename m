Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B579C678DB
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 06:40:23 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.8800.1678171213651201318
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 22:40:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QaUwLLHx;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id n2so15737924lfb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 22:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678171212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fgL6WM+iv7CaRUl7V49gWanGFCZ1c76HVB297e8YZeE=;
        b=QaUwLLHxTumT7X5o/RbDZRbP6uDjfSnCw/hwbEVLW1Jy+/7qDFfLaUEnzlcH/v37CV
         saHLm0b2sqABO3w55a5080l/flPc8y/16qbRoEII/EtWWXqWXDRWFywqHAVfNpiOXuZS
         3CtZsA3HnJPok1W0fsAhC0d40zm9Y8dpYXcz7tOadpFddec4g3QSIAU5UVGgU0Jscamv
         CbwxaDX/f07W7IMaoEEERueFyAIRGOTGGTIs8Zc4ihtU7EHBTG4a7FI/M7tOoeItuihN
         oDJQKOdIbYTBlKYlb79XvNGf+mN8vHbpPC9Se5qRcMQ/wmk4PIiGXapNGE3nwghUJRdx
         ZRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678171212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgL6WM+iv7CaRUl7V49gWanGFCZ1c76HVB297e8YZeE=;
        b=2LXczTzf9k6p75OIWwL4chky39PbMIMTpg33MNrGu9uJQXHkB3wtsNKxXCKpHr/3ZT
         iee7istAIFXV/qYJ7YDdfjiYJe0pcjofc9SXZsQRAs0GFLsEJJCSC5AxJkHEPaz2h1T0
         aRPpB79zR7tui7f8BYZ66UJK3dhPqfsJkz25olWVYQQOsxDSubE4B2sUiBt1L4Yjnn8Z
         LGKOQJxPv53qJNGxUFyYNwbjFswUFhWVO6BSCPOkWe0eli0eq6GCIrFQwQtTF+CZiOYq
         248KvfL2MHtcl89jDsN0FGAZgavNHryo2L6PQWVP94lu1AUghWN+pd/hIEAX6u95L1W5
         vqqQ==
X-Gm-Message-State: AO0yUKU+jNISGn7tRbL8Wi1XJezQMpWntxCkYsyyiiQ0Ibge3HnapNqQ
	99f7GzUJineedpUbz8+hqqbY7q/f+MzOWUvIumzD+UQ2x9c=
X-Google-Smtp-Source: AK7set+sEZCO9B31//Z4w86bhA6SaEVXv9Nj9rDSi8hH+NCsvqWWsoUBJWI2IUBDSUozB+Im7UPVRHDklxhVZ8Uodc0=
X-Received: by 2002:ac2:5fa7:0:b0:4db:f4b:a552 with SMTP id
 s7-20020ac25fa7000000b004db0f4ba552mr4050923lfe.13.1678171211783; Mon, 06 Mar
 2023 22:40:11 -0800 (PST)
MIME-Version: 1.0
References: <1678168291-14150-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1678168291-14150-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Mar 2023 07:40:00 +0100
Message-ID: <CANNYZj8tDcfbq6wGF9_Pyg_zUUjHQRUL2my_Rg8c1hpLGswvrg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] vala: Fix install conflict when enable multilib.
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 06:40:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178091

On Tue, 7 Mar 2023 at 06:51, wangmy <wangmy@fujitsu.com> wrote:
> @@ -42,14 +42,20 @@ EXTRA_OECONF += " --disable-valadoc"
>  # Vapigen wrapper needs to be available system-wide, because it will be used
>  # to build vapi files from all other packages with vala support
>  do_install:append:class-target() {
> -        install -d ${D}${bindir_crossscripts}/
> -        install ${B}/vapigen-wrapper ${D}${bindir_crossscripts}/
> +        install -d ${D}${bindir_crossscripts}
> +        install ${B}/vapigen-wrapper ${D}${bindir_crossscripts}
> +        install ${B}/vapigen-wrapper ${D}${libdir}
>  }
>
> +FILES:${PN}-dev += "${libdir}/vapigen-wrapper"
> +

The correct way to fix this is to simply delete vapigen-wrapper from
target packages in vala_package_preprocess(). It is only needed in
sysroots, not on actual targets.

Alex

