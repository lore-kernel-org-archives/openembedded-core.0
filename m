Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C645C05027
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 10:01:31 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.10862.1675936880986629679
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 02:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xouu4GWw;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id y25so2430773lfa.9
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 02:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eN+n2/vE8YO5H7DjAArW3ER2LMkXYHMwGKARfNKjJI4=;
        b=Xouu4GWw6ts4ah0XFnYZz4XN8LOrZEENBvm5D/bunr7djvUrkbCCr5Wwj2+hzRgFCn
         ZUpoB5Gb50br5Pw86zMsuJRCurvvC1MOLNSfSqQ3C/4b/Y16udO/nnsHmW463LP7K16t
         2NE8MaICZRgwSi3HZ0p9fRV+/h5GMZ8BWX2z/dyTbUaJBURhXWKAQXVeEQNiPg/vFN2I
         p0IFPaeMpY1hMLXpaUnQAZ4294I4sfDpKuVvxw2gLkOj6JEHsm4Wqcv6S3yIlEUY1GE0
         VsqJhKRd+pv7bjE7guzS6t3bvgomziU1BIyqMfNLyyGPvi4QJWRsaCRAz3hQrzIqe7mh
         Q3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eN+n2/vE8YO5H7DjAArW3ER2LMkXYHMwGKARfNKjJI4=;
        b=4rCP5CC79xpC/W/iXVFLkaDtnmPTGlK4ujUhSIFKRmMZKxsqWhS1A2frXzvri0NGME
         uyHTXmm7nSBy4M0tZ5Al84Cu5KruV5o89aH0dLFy0pGs94CQOCeC7Ipee2c8m6ujqqDq
         3fCXKrs47OUo03ipM9FD/E8LUdyVxXMrY4/Jnvwgv02NPqg/XLxpZcK9IAaGSl9bbPWD
         CLcEkHToscogghfJGtXhh5G+LMluarF0FDlGLWntXbuq2mDFDJXXmhU/+jdI0MkMbWXq
         bJHlPK2U6bxoYp26Ha0ZhwuuvuBt3yQK9J0UD0B46Pd5zzxBBFCUM0+rgTyXErp4jjJC
         MV2g==
X-Gm-Message-State: AO0yUKXpB3L6oWJhQNv1OUXRmcyyTNjQeMLMhCFgN91tFOAiLjL+xScX
	RfNC51T9rL1UOT1d5exhAeTFCuWl81P/H5ucLqs=
X-Google-Smtp-Source: AK7set9fmaLOKRlrzM+6iRsdi6jhIKpXWN0L0DBhCM4PqKvPxM102Mss6kUX5exRltaqFjHuEoSsHegfE4F5OApofq8=
X-Received: by 2002:a19:760a:0:b0:4d5:a652:e2b2 with SMTP id
 c10-20020a19760a000000b004d5a652e2b2mr1472025lff.154.1675936879115; Thu, 09
 Feb 2023 02:01:19 -0800 (PST)
MIME-Version: 1.0
References: <20230209080936.148489-1-mikko.rapeli@linaro.org>
 <20230209080936.148489-8-mikko.rapeli@linaro.org> <CANNYZj9KXz8-d-LV+z1Pp7dLkt64C4VGM+CJmTii7Fsnsif2mw@mail.gmail.com>
 <Y+TDZ95lZZKLqsTj@nuoska>
In-Reply-To: <Y+TDZ95lZZKLqsTj@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Feb 2023 11:01:07 +0100
Message-ID: <CANNYZj9NfBOyCijZgRGFJ8Z3b6m-gcY0mZPvSkkc_hZA9ZPx+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 7/8] oeqa qemurunner.py: kill qemu if it hangs
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 10:01:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176938

On Thu, 9 Feb 2023 at 10:56, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> It doesn't currently. Should the sigterm_handler() also use SIGKILL if
> it has to?

Yes please. Let's not duplicate functionality. And please do try to
avoid adding hard sleep(), there are usually ways to do things
synchronously.

Alex

