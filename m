Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E1CE6ADEF
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 10:14:52 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web10.44662.1732356889458135692
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Nov 2024 02:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gtfNF0i2;
 spf=pass (domain: gmail.com, ip: 209.85.221.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-50de14e7d8cso929494e0c.1
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 02:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732356888; x=1732961688; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g1fP4OX8qOsfKWLn/oDREmELnke5XqnCEmqo4ExqoJQ=;
        b=gtfNF0i2+gKYQgJ7UmmQGHGiaEvH+j1OYXZyTLI2i3NCF044ezQsPbQoHULcwkE1AM
         BLB91oFu1eVCDudl45zSkMqBaeBFWqzItDs93QjITcQR8hiOkFkOh+5Ve0tufOeemmS4
         UpeH0o0w9nIRsso/Ef4Cho2iCX0oqKsJgkpKBggWrb8shcOwKQXrv4ETUFqBr+SwrDgg
         u9qJ4TlMovv7mIRVAhVAwqHQf1oUBY91oRtxfqtfvfON1FrrSu6VCnSI6jFISFibg6EJ
         X4NR3Ctn60CWBSIp473DVFJYkq1jkjJMYEvfljw/qRq0SXjQrTzWT+yC9jkyGpcjoHn2
         DgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732356888; x=1732961688;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1fP4OX8qOsfKWLn/oDREmELnke5XqnCEmqo4ExqoJQ=;
        b=QHQ3WxSYkQmkoSgy893pp4N3LqgrxZSptMQV54FLbNpUBzj/zkrzq+RFJmPvUcdaYP
         xIaOOkOF/BYf1eU9BD8nNzBA8+JkBbIAZ4t2BDZIlgUatYx2djiPIZtZaa4jiLZz89C3
         JOnH7gqXI8r7ssarfEDG+oq/1lARfivaTdgoK4/s2ZLMJErydm16blz1BcxHCWmNBSy2
         nzr+QiOhIaM1cFODxqP0mNugU+Qe0Jj42gnsNtVPtwhHZks858zOcoiSVUUXtUTHz2yL
         60bWSBuJu3C8QtBSV3pLzDsDgMQWy4z2/5eUcITJxOQKMcCsg6Gx3iOmaRKl+UdGpx6A
         1cuQ==
X-Gm-Message-State: AOJu0YxPcdQC8wuCgBuhyE9Yvgcu3MoWtaYcPm/Ep8oQ+XMEFUZyan/7
	wRhsubzylvDu+mQgJPUGBHO0UxN+C8/RAPIOblMqK4tTXBiwfqwO7knb2UBessyP56GQzYlOhgc
	nefkX6MHYRwl1UBhPmkjEOis9eKs=
X-Gm-Gg: ASbGncsgHxS5y0F7OIDn+FbLNwTii4PTXubNrg1o/xHBcOX1aBaRsl/Lcb/pgb9ss1s
	fxzAB5olYuEccGupc407a2BlR8dVw2UXOHKnRnbMYaiX6rdJ/N5y0PTzmJ8oRlK5TQQ==
X-Google-Smtp-Source: AGHT+IGCt3foAUjmTNhaSIBmRSoc5+oaTzZB/JPQywrEILEJJJT+fANf2/ss5I7nzbM0cyc/p/JzVqHIWYxb70orOWM=
X-Received: by 2002:a05:6122:d0d:b0:50d:3ec1:1537 with SMTP id
 71dfb90a1353d-515004ec67fmr6435326e0c.1.1732356888422; Sat, 23 Nov 2024
 02:14:48 -0800 (PST)
MIME-Version: 1.0
References: <20241121134300.1074541-1-alex.kanavin@gmail.com> <CAOSpxdaYU3PL3Bc0zzYnbuU3G-WYCHKLwF2R3SHej8_nN2B30Q@mail.gmail.com>
In-Reply-To: <CAOSpxdaYU3PL3Bc0zzYnbuU3G-WYCHKLwF2R3SHej8_nN2B30Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 23 Nov 2024 11:14:37 +0100
Message-ID: <CANNYZj811kEpVrzSyyPZGoKF+Z8hvy7s+umRexVRfOGUs7woWA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 1/2] package_rpm: use zstd's default
 compression level
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 10:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207674

On Fri, 22 Nov 2024 at 17:24, Steve Sakoman <steve@sakoman.com> wrote:
>
> This is causing breakage on the autobuilder for kirkstone:
>
> https://errors.yoctoproject.org/Errors/Details/822859/

Thanks, I sent a corrected v2 just now.

Alex

