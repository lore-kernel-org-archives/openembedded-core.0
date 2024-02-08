Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C3EC48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 11:30:16 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.15621.1707391806964091119
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 03:30:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DtuHToAm;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5116b017503so1492810e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 03:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707391805; x=1707996605; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sgaePAVhJ6Qa1mqg7/U1oADP+w9aIyPfRSAAu16IkGY=;
        b=DtuHToAmldciCVnz/+sOWlXs0rPaVX6BL/bUGlZ03BQ8G1vVHKO9c+cyizDao08IiC
         FoR+7S0jywZcT4T1tyP8sDBqsC1CMGrmPm6GIhdFED5203HxjrfhGrnJed5NrV3beAEx
         HXaNX2CJ2UPsyPJAF9w4rXmaWQLx929scdpGunGiBTkd5YY4u6EUTjj6o9cYvhQf1ZaT
         l7rsHw/Yc3aqM33DYGJsz3U/oNz79YUGUcwCXiB10s7JeX41deZGmd8MHrfvyshE5pPg
         eDRLBZFnk9MWLqKN4USapOUdoZdwJpT8P1lRSDUsRW4qLpuvscGNf2pbVYzvgvKOaplZ
         GWRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707391805; x=1707996605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgaePAVhJ6Qa1mqg7/U1oADP+w9aIyPfRSAAu16IkGY=;
        b=PoQ9HWDCkiwyfprcnNccqK5Ix4g22vRE2F10xe7GvvISmswD08swNOTvj4aWodq7b6
         n9ySXxnSxQOZXx6QF+vHs9L+eDgyaeiFXHlGNnnA0kOwiSQcBfzeXHHho2Zu5K4Uqc5G
         wY4N97UzCEfHRF61L+djOHU7lNXBtI2AanSud7UTvmfQc8MZy8uGlmHv7YZECdqS7y/7
         LfyTgdBNZd0tRAHiGQotzUCNlomVSKDfASCwGR0+vKXg/2lzeAbE9ecAzKKF37SVXqvo
         FHuTmV/Bi0QJpXps/4rkHntSlNaIv76kI405RJhVQ+HgVdaDcLCu0VPgF8I2Cyi/l7y+
         bDDw==
X-Gm-Message-State: AOJu0YyIOB17tEScKBKUC+yU13NUhpZ+wFvuXt+y4JHYHnCGVEF5XmPw
	S64ON9HmeeQIjht8NdMqGMT62Geee3m6OG2ld//ZKongpp4qc5Uj1CgIAF5exhyxQtoSZMGDdP6
	CtUL5LlPkrN2KGgMai/8tpGWFA8K4kg5H
X-Google-Smtp-Source: AGHT+IEN1y1HaG9T3cJHxxFEvMTUg8h2qOY32jpxhn1UQ3G1U9lLqoeWZ2CR8cVfkxscjBlLUbHKGfWwGfC2jr+bmWk=
X-Received: by 2002:ac2:42c7:0:b0:511:720b:fbe8 with SMTP id
 n7-20020ac242c7000000b00511720bfbe8mr377354lfl.54.1707391804811; Thu, 08 Feb
 2024 03:30:04 -0800 (PST)
MIME-Version: 1.0
References: <20240208101156.735389-1-aleksey.smirnov@yadro.com> <f33b3247e9eddcbadf09b85af0efd642926945cf.camel@linuxfoundation.org>
In-Reply-To: <f33b3247e9eddcbadf09b85af0efd642926945cf.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 8 Feb 2024 12:29:53 +0100
Message-ID: <CANNYZj9AZ5OiUXy-GTM5qUcE-TefdB3Fq=HKWQ3nrOc4HkBkWg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] configuration: add Power8 tune to PowerPC architecture
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Aleksey Smirnov <aleksey.smirnov@yadro.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 11:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195137

On Thu, 8 Feb 2024 at 12:20, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> The patch is probably fine but I do have to ask, are you actively using
> Power8 based devices? Are these current/new designs or old ones for
> compatibility?
>
> I ask since I get a lot of questions about dropping mips and power
> support so it would be useful for me to be able to point to users.
>
> Mips and power are also not represented at the membership level in the
> Yocto Project, unlike the other architectures which does make
> maintaining all the testing a bit tricky to justify.

I think we're testing only 32 bit ppc, and this is for the purpose of
building for 64 bit ppc designs? Then dropping the former won't affect
the latter.

Alex

