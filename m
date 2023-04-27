Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E768C77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 07:20:31 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.14662.1682580028769612213
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 00:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Ex+5p0KC;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f00d41df22so2205976e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 00:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682580027; x=1685172027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SzXezBsskA7zgG7bG5qKf8TgStYsT7rThXyU2mHj6oM=;
        b=Ex+5p0KC9c8lSIucgvxoX9dfJ+7Q5MXaWBNeJ88kZsfLrb/wNTIucQk5nmxDFnK601
         N2J0dCgw6I+sBiwLMoDYyUMT6eQCdeb2KmKyiduIgeiLGGVwoog2g/j8cOSqIfKfthTl
         wm5WeEQlkCJkubcpA6j3E75Lj15UxmEHe4ETz2FwoQMpywo3yY/vaQlkoxwL7XqLjTUR
         9oLt5+AAGypyPuKDWNX6X8UMog7QVlY6zica40YwSEMCif+scHpIGOjc0rF6ckD5lIJT
         wkom/jn7ZDl8u2LPRly4fEXsVyZGm2yJM9cNwYPK6idzPvDNAjzyqt6EGy5zt6+R7J55
         fmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682580027; x=1685172027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzXezBsskA7zgG7bG5qKf8TgStYsT7rThXyU2mHj6oM=;
        b=CbCMbzflkYtMekzRd8+zG2aFkdevI2eWNbUWN+M3Q3rbCRKB4JPX42LEAzqP7PTSlo
         Sx0JRNO9qnR71yOuGbeKpJ6KHPu1MzPfMk5zPAOhu9aBEbwLVEW5UQkvDy6lzvGiEZhu
         48S34t0VJY53xh9tHO0lYaP275NDAeCyCTWANVSoV7zVGndw48tjy0HGMU6EFHrc3KMl
         NAOueqdalrO1t0gjuY/D1gSO8GruwL8OVKQsvjQNNE+rnkhDW6bv68DZ1Q6wOiAYy7F3
         RqdLPqhg7vOD8Q9DCYTantXGbZMfus6zZ2iYTFBvJtDis8wLHJZ0q8HRbCnYkWa1m3//
         3jSw==
X-Gm-Message-State: AC+VfDySe0i/brP+oAGSUdfE2C3G2GYGG5JAAI/roEaYMH5KbWBUBk1z
	73F0f8ZVZ95C/qoLJZ6etgfAWix2c4PvCjLYKuU=
X-Google-Smtp-Source: ACHHUZ5IgSEJvUnEkbxi5G7iTYsspfS/eX0BijiPM6+nDbWMhRTQ+Jiz84Afj3kzYLCwtw7pGnZDaKCcJq54jsGui0o=
X-Received: by 2002:a05:6512:a84:b0:4ef:840a:ba71 with SMTP id
 m4-20020a0565120a8400b004ef840aba71mr1481286lfu.12.1682580026413; Thu, 27 Apr
 2023 00:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-5-alex@linutronix.de>
 <CAMKF1sqsu_F4JS6f+=TfzJmv_Eq7VKpTFDd5OeBXjzRez76P8w@mail.gmail.com>
In-Reply-To: <CAMKF1sqsu_F4JS6f+=TfzJmv_Eq7VKpTFDd5OeBXjzRez76P8w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Apr 2023 09:20:15 +0200
Message-ID: <CANNYZj992xUKdM6pLka6wUGDNyXcc+p5ZaL62E6i_7s_RLPRmw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/11] bitbake.conf: set minimum required kernel
 to 5.15
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 07:20:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180471

On Thu, 27 Apr 2023 at 09:04, Khem Raj <raj.khem@gmail.com> wrote:
> While this might be good, does this fix anything specific for enabling
> 64bit time_t.

Yes; please see the link.

> This change means we are implying that yocto wont work with kernels
> older than 5.15  and maybe SDK would also need
> 5.15 on SDK hosts and similar need for build hosts might be imposed
> too. Perhaps it would be good to do some due diligence before
> applying this.

I was waiting for someone to say something like this. :)

SDKs are not affected. There's a separate setting for them,
SDK_OLDEST_KERNEL which stays as it was, at 3.2.0. Kernels versions on
build hosts don't have a setting or check, and that never causes
trouble. The focus here is specifically on removing all uses of 32 bit
time on 32 bit targets, and as a bonus, enabling other optimized paths
in glibc that are only supported with newer kernels.

The implication is not that yocto won't work with < 5.15, it's that it
is not tested with such kernels. Which is fair enough, isn't it? If
someone does need an older kernel (and yes, I'm waiting for the
'outdated vendor kernels' squad to come out and lynch me for this
change), they can reset OLDEST_KERNEL locally, which would confirm
that they should be doing their own testing.

Alex

