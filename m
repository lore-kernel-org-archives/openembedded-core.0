Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BC4C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 09:19:24 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.40235.1702891163081761237
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 01:19:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FWwv8Pxo;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50e239c49d0so2149237e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 01:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702891161; x=1703495961; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=it0sfQA7P+t96SCliiiJ/fcIP6nLFFIPDsJd672sDSM=;
        b=FWwv8PxoDakMwvXkqFyyFr4hMWlZbpvl2abw9AP+D90zwOREmfJ4aViVQUEp6WoJxt
         8rQAQpj9gOGtjETXHMBcHX4GbACfbUOlYIdFMpgVaFJXFcisMXJPxJOdDLkC+PQ2bxIp
         NryPwM8GTizGF7qMLosMQw/ivN+wbys/EJ+qPe8j0XMMbnoRy59vNtEHLb+QWPSvTaCJ
         wNv0yCAem9Jr1/YODNMXuD23rQtXsffBVguIh9SSl3516v4cktirsYTgTKUPr2wfILaE
         R3iPfYRVPQ/8HXFWCgqhyljzWxNqbxkDbxAtwFuedFWNyEgQKV7MgIpWNCDyV1hxd2Tk
         fFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702891161; x=1703495961;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=it0sfQA7P+t96SCliiiJ/fcIP6nLFFIPDsJd672sDSM=;
        b=o1QK00F3wM5M8ULOE/SpGxW6x7gg0ZpjFsJXiFNLpoAV/4BWp06Ytc6H1yFugOSnxi
         IK1cQdUKqkp6wEKHWmi8zMTwJwH5M7BF7IHcSRc1B+ZuzjJDRbPQtHEklVjHOQ3CgJCy
         ogFxjFf1VR4Vm6tR1hw5ra/GD5Vvfp+YmVh18iJx0ODvexPdFOg1hxNFBT+KWQpoRAXA
         OxVwjMPgrd8RYJCbabtME6VFjUN/4W0tgfEHdLt+iwdQGnoHVodpbthNi/1xUldX+O+L
         e1nuFnp4vOwaWKIHxsFzBD/eeDoAGj91u94hYMGpQCL0ev4XLniqicVBtRCVEm628jHU
         bbJg==
X-Gm-Message-State: AOJu0YywRWOinC1tCpIMUDZIebg/vsQZSmGM+5GceXEWt9wgliDwCB+a
	4lPHKYVy1/qAtCzN/GXIAkxXrTleSJ9wexQOtLK8rsnwrM8=
X-Google-Smtp-Source: AGHT+IGC/ah7mge1ZhBUbBfcLC1iqFnSEaHJxigY8gzGmuMvDrOPzUqYCVkSm8JXBb49DVf3YbRCCgle4w54MsYKRyQ=
X-Received: by 2002:a05:6512:3582:b0:50e:3a64:f8e2 with SMTP id
 m2-20020a056512358200b0050e3a64f8e2mr329385lfr.115.1702891160679; Mon, 18 Dec
 2023 01:19:20 -0800 (PST)
MIME-Version: 1.0
References: <0101018c7c33043c-9fbbdfa7-effe-42bc-abf8-99095cb1bee8-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018c7c33043c-9fbbdfa7-effe-42bc-abf8-99095cb1bee8-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Dec 2023 10:19:09 +0100
Message-ID: <CANNYZj9xOjf1atSdT4hNOxmVEz+9PcdhrpR_jjeJ8JU5v_qFGw@mail.gmail.com>
Subject: Re: Patchtest results for [PATCH 5/7] bitbake/runqueue: prioritize
 local stamps over sstate signatures in printdiff
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 09:19:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192625

On Mon, 18 Dec 2023 at 10:12, <patchtest@automation.yoctoproject.org> wrote:
> FAIL: test target mailing list: Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists (test_mbox.TestMbox.test_target_mailing_list)

I know, this was on purpose as the patchset is tightly coupled and
bitbake bits won't make sense in review without oe-core bits and vice
versa.

Alex

