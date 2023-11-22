Return-Path: <alb3rt0.m3rciai@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10636C61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:10:38 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web11.17889.1700655031432609450
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:10:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M4FVTgbg;
 spf=pass (domain: gmail.com, ip: 209.85.222.50, mailfrom: alb3rt0.m3rciai@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7bb4b7eb808so2175651241.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700655030; x=1701259830; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C29DTgrMTueoJdA7LNSJGT8KMem05NvxP73b9sk3/S4=;
        b=M4FVTgbg97Qo80dRpXr6uC9IBZ+0kdufIx6xaPEyPSusSetQo2O2/e1UUQUK598wSB
         mk0/14D/cyuFiAzGprTybOC/IGuiXPGd6/GPn0/DQe9h5vziLZ9BG77IR3EuecfoYbjS
         2713No4UquQlG9mvs/hnd+i4tklCSMsNKcpYRELxy5ecFPcUHOt5Y6anmNA+wevP9MEV
         2NqWNVzDwvqIPDGYmeAw8UDX4RPUg4dO5lx1RKiXe9nKOV0OW70hra4ZyoBR+i02Jpwt
         gPy4Si5vg36rUfyka4i2/9vfM3hozeXbliDNXaAKowk66SA4Df2DYmI1qPQVHE+r+xJ1
         eyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700655030; x=1701259830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C29DTgrMTueoJdA7LNSJGT8KMem05NvxP73b9sk3/S4=;
        b=fZHLfWTUNn+34mAXdkjO3uKkEnt7WVa5k/d+Sx6FpqbAIOP1fCh9KIUVKDXvJXD7yh
         LFMuOq1ETdLBOZbxxvuwXwTFby5bOWmyo5aA1FKkZ3KLglO/Gu9lBdkun9ZXk9cU+QMG
         wrv/e/mNkEPYAEjcLzUbIh8IeI+qBRVU1Pr9qP6acyUGycerqAqZ3kRsa2wUzXfQAn2g
         y9vajaQ5S5rwfnwhdVkle4JosrOCEOGpwZsFLfnuMKjNJNmQftG1rQZgARRD9sHX/2FM
         1cqQQ43CckpgrpBUwsMZXvsUCkKDaA04/2wM4mLGVySRPmvkHvGjRKrmIfPi/DrnzoBO
         qIVw==
X-Gm-Message-State: AOJu0YwpWwI0sEy/Xq1W/nb6owyVHPeqhO3wgTfBmYCEEQHrcbo88v0w
	wYh5ByUlhD50uURcdSJjtUFLPRy1QzwybTQD9+k=
X-Google-Smtp-Source: AGHT+IE+VTgLxDGI3sOuTY5U4ACielYpUvyUjSM//gRDGzWXPAoOceN0fGLY1lRukQrY60lSgAbicqRBwNEct89FmtA=
X-Received: by 2002:a1f:ed01:0:b0:499:dec9:e1a8 with SMTP id
 l1-20020a1fed01000000b00499dec9e1a8mr2268805vkh.14.1700655028968; Wed, 22 Nov
 2023 04:10:28 -0800 (PST)
MIME-Version: 1.0
References: <20231122085438.7328-1-alb3rt0.m3rciai@gmail.com>
 <CANNYZj87+-6jte1KYUNg2ueWvsYzxiOQvbTzrCZ_ooo9N7uutw@mail.gmail.com>
 <CAH=B7vfs74f-vyx8JGJyfAu3NPa5xwgumsW+_ahMBXnfUmJw2Q@mail.gmail.com> <CANNYZj_XcosMZQHswireb1JHJahUvSy1NuHy_3-f3Km8aWwgbg@mail.gmail.com>
In-Reply-To: <CANNYZj_XcosMZQHswireb1JHJahUvSy1NuHy_3-f3Km8aWwgbg@mail.gmail.com>
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Date: Wed, 22 Nov 2023 13:10:16 +0100
Message-ID: <CAH=B7vdEtF7f51uRsN9qMcL_80M3zsPfFUsD4v_HCgJdxXLdsQ@mail.gmail.com>
Subject: Re: [PATCH] poky: kirkstone: eSDK: fix build-in eSDK environment file generation
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Michael Opdenacker <michael.opdenacker@bootlin.com>, docs <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191071

On Wed, Nov 22, 2023 at 10:30:49AM +0100, Alexander Kanavin wrote:

> Alberto, can you check that this works as expected on master or any
> more recent release where my commit is present, and the file is set
> correctly?
>
> Alex

Hi Alex,

Let me understand if we are both at the same page.
That feture will be not integrate in kirkstone, right?
Are you askin me to try that on a more recent version different from
kirkstone?

Thanks,
Alberto

