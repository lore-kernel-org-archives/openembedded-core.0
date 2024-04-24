Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15B5C07E8E
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:34:53 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.11638.1713947687882359557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MlK0+t20;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-518931f8d23so7128464e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 01:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713947686; x=1714552486; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IAAzxjf//Uz8vpmwaKMP+dRWTFzhiPn4RebzSDY73a4=;
        b=MlK0+t20YFm4xFu5s7qYwpY52G3vHHcWKjp0qU0DsP2N61Gytd/g8D+68d+GpX0u11
         TLmTtPQKUejNOrgSxkOTV41AqaGES2L7SIipZXEUoz8cTvyDDs/MGWKtaf+NNvs+rZGV
         hQS3JXB4acHMQzzmlGDr4x+Rl/fRoCeu7C5Ap0TnJWV+UD33xsMyKKxS5eg+OsByADrK
         Jny0BSCnUHbRZ+BAZfIeiq2NodjiGSbGP8HfTZ7pchDGKumxseSLYARzCMryaXzN/hec
         LHrBuI2pSNj8StZTl1nofYAmsNJV6tRf7lNLOxGDb5OMoPb8hKrFW1nyRJf6ayUDKH4M
         UQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713947686; x=1714552486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAAzxjf//Uz8vpmwaKMP+dRWTFzhiPn4RebzSDY73a4=;
        b=KywI4CdvjFpgjAQg1qEXYGkWgGkAen0y4uXfCL1cNeMaHHGffkIIPJl/PHQ57AZEhy
         R8Uu4aJrMBuIcUU/nSuPzPC/cVHjs1xnSp8hULHx2Ho28se8wjkb34jL3K4s2hiMJykn
         j2IOHedf9LDsK7TmyR8gUvIukd2KC3CkJQi3R3qdMuctcwA9rru1HKqRADV52wl/skW9
         Chf6+/sfQAbBr3X0mHDfNs6RVACQs0vVrlPj6bRDNCEvwhGe9Yn86R+CGFtlyBxYVH6r
         ewfWtiU9DSyhr8c1eLobf4Jc8jJM8cPcoqyoRiXn5Gvf9r8EEeodatZx+W2WyaEFdBJL
         gSGg==
X-Gm-Message-State: AOJu0YwoqocawNd8NXUUufG/L/h2zw2Bbk7i9avsXE5WmZ5INOSf3VrR
	iE3CFLqmJyjTMHP8wASzOd420fpvG88z0VollLwkQlL/T2LnzTiCt2Yf+GaF71QhlisD5DFR5R0
	e/0McCQw8QXMHq6gMA8ritFc7InQ=
X-Google-Smtp-Source: AGHT+IHl4G74uaX2sntqFKiwDfPDYVhp93bKSOAO6CGhyVSYaQBjw9ZWp77W1wqoeSuTo/SeogLBaV2sDg+MQbcd0oU=
X-Received: by 2002:a19:2d4e:0:b0:516:d1bd:7743 with SMTP id
 t14-20020a192d4e000000b00516d1bd7743mr1114713lft.64.1713947685535; Wed, 24
 Apr 2024 01:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <17C6E6A289A008EF.28114@lists.openembedded.org> <CALT56yMqnU_vndjxBiEttPQJd=3RForUGPeqKM7us9eGwLjJsg@mail.gmail.com>
In-Reply-To: <CALT56yMqnU_vndjxBiEttPQJd=3RForUGPeqKM7us9eGwLjJsg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Apr 2024 10:34:34 +0200
Message-ID: <CANNYZj-Y6ewMwQ7=y9PUavF2mKYKTeZECKC8FkmTrD=0Mry4_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ffmpeg: backport patches to use new Vulkan AV1
 codec API
To: dbaryshkov@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198643

The patch is fine, and it's in abelloni's staging branch. There's no
separate notification for that. Integration to master for now is a
lesser priority than getting scarthgap out.

Alex

On Wed, 24 Apr 2024 at 04:03, Dmitry Baryshkov via
lists.openembedded.org <dbaryshkov=gmail.com@lists.openembedded.org>
wrote:
>
> On Wed, 17 Apr 2024 at 02:31, Dmitry Baryshkov via
> lists.openembedded.org <dbaryshkov=gmail.com@lists.openembedded.org>
> wrote:
> >
> > Backport two patches from ffmpeg git to fix compilation with the newest
> > Vulkan API.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Gracious ping. Otherwise ffmpeg is broken on vulkan-enabled distros.
>
> See https://storage.tuxsuite.com/public/linaro/nicolas/oebuilds/2fGSSDyVGWy5G5B5QwGHGAOYSlR/build.log
>
> --
> With best wishes
> Dmitry
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198636): https://lists.openembedded.org/g/openembedded-core/message/198636
> Mute This Topic: https://lists.openembedded.org/mt/105567763/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

