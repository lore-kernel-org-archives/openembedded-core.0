Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A3FC433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 12:11:55 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web09.4720.1668514308798521562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 04:11:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gcoH+5uy;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id r12so24116463lfp.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 04:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g/9wQAxiJ1X3gwCOfcO8INMgkcB1NMiI3WWkguOCkaY=;
        b=gcoH+5uytMQCgzHOQTuwkqePQpN5Ib2dU+mhcU4YfX+QMHn30bWQOVNq6klDSMDIHu
         ckQ4V3SoNhKte235E73irIO2Grcwf8cZ5yRuMEbeKDre6ZFFppLC2S30gw8niiSP0IBU
         zLzGEXpWZzdQb4BWEOxvEIgIIPVbt/E+oxzs/yHuQB4bdU23mx1PpFY3MEkiQLljr5xi
         BGb1+CIVNxShYhul8hbcB7oFniYEhkrMyu2QM54HcdSnNDGTz+U4R/HRaDlDZZy/1kGK
         T/Wn+Uhi2sDx2BGoi0XEavzQKlveg9ll9xAkpsB3J23UyRqod6263x7LT19ds/X06zvX
         CQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/9wQAxiJ1X3gwCOfcO8INMgkcB1NMiI3WWkguOCkaY=;
        b=QlC/dkafGY6zkfKuUAo7WECtIGlw3ebGo8Jh7j+TUXKq3iUpG6Qey5j1t8PGgHI1mt
         iZtFQbcT8PMAujxKkqL7rAdnpHOudJ9GOHC6Y4oe33vlf8Q+0w7CBWt+ieJ7lhb0VXoD
         vTVfDVoYAya05AK8YkkHTQMK4eiP4EaORxO8CFsn1SDAlIcQZ244AIjSsOdWAwYwwSe6
         LYlJSBKD3y0ZxZLLFUXhdUlnRQpQw4vyAUOuS5kJlpfE50FOtMwoWj/G8RTcbh6yrXUl
         r/ED1m2uV9dFfOYeMQ12rF+U1xH+ldbwPh+R+DVGvhYdqIsdKaLp+0TIh8YCH0QBfFaT
         beTg==
X-Gm-Message-State: ANoB5pn21bAmeQ+BDxDelkrTzGO0+tR8+gx8nFGgNGS5eZqOIlyDS8+J
	sVH7bi0gOQthUkaMdUZRvNy1LwFy7MkS2eBhh3SZqB6R
X-Google-Smtp-Source: AA0mqf6Vafgr/6Esrpw4UioBugcUIgnS5D8Iz/LD7r7lyvO5bIszsCqG3u/lquOWFy6VQbywwW6JI8j9p7Vva7ddjOA=
X-Received: by 2002:a05:6512:3d8d:b0:4a2:4aad:8fff with SMTP id
 k13-20020a0565123d8d00b004a24aad8fffmr5183005lfv.445.1668514306206; Tue, 15
 Nov 2022 04:11:46 -0800 (PST)
MIME-Version: 1.0
References: <6D11494A-84C4-446D-A736-49841179EC70@arm.com> <20221115120314.325-1-cp0613@linux.alibaba.com>
In-Reply-To: <20221115120314.325-1-cp0613@linux.alibaba.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 15 Nov 2022 13:11:34 +0100
Message-ID: <CANNYZj__xRRNe6y7MHzNQ2Nf0oihwLzyb1qmk4m-_bRiwU0kFw@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe] [PATCH V2 1/2] Support bitbake compilation
 when the host is a RISCV platform
To: cp0613 <cp0613@linux.alibaba.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 12:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173272

This is not what the commit actually contains. The commit adds a
riscv64 definition for a SDK host machine, and so the commit message
should say that.

"machine-sdk: add a risv64 definition"


Alex

On Tue, 15 Nov 2022 at 13:05, cp0613 <cp0613@linux.alibaba.com> wrote:
>
> From: Chen Pei <cp0613@linux.alibaba.com>
>
> I have a RISCV board running Ubuntu, and then clone the bitbake, meta-oe... to compile,
> just like using yocto in ARM board, so I need to add machine-sdk:riscv64 to support it.
>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>  meta/conf/machine-sdk/riscv64.conf | 3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100644 meta/conf/machine-sdk/riscv64.conf
>
> diff --git a/meta/conf/machine-sdk/riscv64.conf b/meta/conf/machine-sdk/riscv64.conf
> new file mode 100644
> index 0000000000..155c195d7d
> --- /dev/null
> +++ b/meta/conf/machine-sdk/riscv64.conf
> @@ -0,0 +1,3 @@
> +SDK_ARCH = "riscv64"
> +ABIEXTENSION:class-nativesdk = ""
> +
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173269): https://lists.openembedded.org/g/openembedded-core/message/173269
> Mute This Topic: https://lists.openembedded.org/mt/95040940/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

