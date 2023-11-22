Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C8DC61D9D
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:12:18 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.17931.1700655133228555208
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:12:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NXRSehdz;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c87acba73bso47007981fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700655131; x=1701259931; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iC9iFOZVDDR2p2y8RO79d1qfZtVLGt/jGtm1IQGHyPc=;
        b=NXRSehdzzex37VlIFhC4AIFc34rIg8xkNGTVHbw+HzbUI0VZSV6zq7BNlJ1Na31pus
         J2lBqaZj7+JI3SGMcyzOHRYEgo4HXtFGSSnrrTGrx8FVn09nE8LMA0fM4bODNtGPX5oK
         LS+obRjc8G9R8D7rZOsYXLw26C3+lr0E2QNUZnFMzuOfe9hNn49tQ685b+wasJHDznF2
         aIeOXaJUrvtd2mb1P4KFQu8p3EVSwsenDdrQzTTPfgpBP8KJ0+I9X3hFQcaMt0vKqBQN
         3WbSX6Q/5mJXAhqWO/a+keCM3cokiof4ajTcBVYh9q6CO/CAlkyroBaiQYtxdLnBFgzB
         r7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700655131; x=1701259931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iC9iFOZVDDR2p2y8RO79d1qfZtVLGt/jGtm1IQGHyPc=;
        b=PHsoYM7hs6N7b4gefS4AMsmUsIIi9kTxs/I5Ti5jg1g5iudOHz2ZqtRY/ybwTJE51z
         nwbuQovmUODwPpzjsQ9FI+bJ9ACOWmk2rBNwJS0WckQNE0mze4gXI3EhjWfbh/Ij2+xh
         rvk49N93w6d+6Ukucrj1x1xDvEEWdnaMtOAp8C9SZWHrwdwCr0n36FtsgJ+t8iebm6iv
         046pIV/OHkDqq4G2sYvUi4/xoALTk+66vbl0t+8YLo7cdv/Cpvw1h4lLlLqBRZhDwXA8
         lNSE/ESVrYPAHnsXO51DVKEJtsXtxdhTLA/KE0cA8ESbWISepbTJzw+CHIGBg8PO75d9
         d18w==
X-Gm-Message-State: AOJu0Yyyl4/15plsIloCnbeeuDDDJ4LihUN6EyNecoOkIQxUsQPpR5A8
	Ca/aZT6Fd8jBSCjN1wsfwcr6r7FCu1pTbDufvh4=
X-Google-Smtp-Source: AGHT+IEiDWbIzl6q0xHpR9q+c8s82xWQu8VIf6Dy5t7daoTeTXQBNFt+46c0euiaEpoDkHndjLrc8sDR8upe9A1DoTQ=
X-Received: by 2002:a2e:9610:0:b0:2c8:8189:911 with SMTP id
 v16-20020a2e9610000000b002c881890911mr1417685ljh.3.1700655131237; Wed, 22 Nov
 2023 04:12:11 -0800 (PST)
MIME-Version: 1.0
References: <20231122085438.7328-1-alb3rt0.m3rciai@gmail.com>
 <CANNYZj87+-6jte1KYUNg2ueWvsYzxiOQvbTzrCZ_ooo9N7uutw@mail.gmail.com>
 <CAH=B7vfs74f-vyx8JGJyfAu3NPa5xwgumsW+_ahMBXnfUmJw2Q@mail.gmail.com>
 <CANNYZj_XcosMZQHswireb1JHJahUvSy1NuHy_3-f3Km8aWwgbg@mail.gmail.com> <CAH=B7vdEtF7f51uRsN9qMcL_80M3zsPfFUsD4v_HCgJdxXLdsQ@mail.gmail.com>
In-Reply-To: <CAH=B7vdEtF7f51uRsN9qMcL_80M3zsPfFUsD4v_HCgJdxXLdsQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Nov 2023 13:12:00 +0100
Message-ID: <CANNYZj8MKBmCPYnv91aUTJGpMghNyX1KPUGTo9xW9rc8rbLWUg@mail.gmail.com>
Subject: Re: [PATCH] poky: kirkstone: eSDK: fix build-in eSDK environment file generation
To: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Michael Opdenacker <michael.opdenacker@bootlin.com>, docs <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191072

On Wed, 22 Nov 2023 at 13:10, Alberto Merciai <alb3rt0.m3rciai@gmail.com> wrote:
> > Alberto, can you check that this works as expected on master or any
> > more recent release where my commit is present, and the file is set
> > correctly?
> Let me understand if we are both at the same page.
> That feture will be not integrate in kirkstone, right?
> Are you askin me to try that on a more recent version different from
> kirkstone?

That's right. If you have to stay on kirkstone, then you have to
maintain a private backport.

Alex

