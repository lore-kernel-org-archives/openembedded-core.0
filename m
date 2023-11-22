Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D505BC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:48 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.18461.1700657142577691563
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:45:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ci1f884s;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c5056059e0so89900201fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657141; x=1701261941; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K4LQEKNCmHcY3/o7dp4S7ALTtBoVeylEQhoU6AytDwo=;
        b=Ci1f884s+4NB6YZ+wgCnvovLw6tR1p11PX0cgo8ytDLYTYJ4MUfQwXPVbod44u/s8F
         cKqH+4HnX3Re412X3zHQaxBN5HjLxnAHxjZFGpXnbM50fhqBm5glXbmT/0wb6Tmaogu8
         tgwErsyy90PRGwpGgvOpYRwUH9HgKqXf+q3PROZseqAuMyOo/mLiEFbyIwp+g4QdEm+j
         NmNQla65SsUvEAb6uzqOzrg/83LhX7mqR1gOEvAbDVKtl0iF6qf9Nz0RtxDoK/YI5e2P
         KT4M/5WUMbwHEr+Haz45sJxR4+ggpTJxGahxPS5aR2iJoerLNHDQpvtFMTbG8Ywb3lN5
         0ylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657141; x=1701261941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4LQEKNCmHcY3/o7dp4S7ALTtBoVeylEQhoU6AytDwo=;
        b=nU5iX4rPUFc9eYGpci48cRVHVlkVLqY6AgenL5Kd/VJqhZe27AgeQm/p3GB1LME+MV
         XBGSk5aLTbY/fw9pOeDUmzZxPqBMaACuV3EHi9KQVjPPNRTZPWZHDBSFS28WMoT3eB7Z
         ITkcULM9uJnp1Om6588n1TQs0uTE04I+2N3t2a19pAXzBRwzRLlnMykGXLZqCzGU7GM+
         WGqbTTX5x1Io6vuOzu1AeZ4gCQFxO8CdKJl7JCX5fO1E2VLuD0G9qPxKTh383CWC4SCN
         vmI2kZMtgj4o7oRUIDgi1qlBP2+vcAtw/wbOyWsOGXseRRHby17RmJ6kp6uOXOrwexM1
         GutA==
X-Gm-Message-State: AOJu0YzoRMqVXRl3xOCzNfyH+zcVosW5rjZF7d9cgrXvhQdPAsZxnVQF
	hSV0Hn600iqs2uaFYCcE4k6IzafsZg38tGGK1qg=
X-Google-Smtp-Source: AGHT+IEO8GAec5zV+sHHhJ0PLCZi+pQhrv1Y0iErHmrPXRPP3aKPHrCTL2frH9FLuCvsFCI0lWrQzvtTaNbWo+HdsL4=
X-Received: by 2002:a2e:88da:0:b0:2c5:1915:9824 with SMTP id
 a26-20020a2e88da000000b002c519159824mr1690821ljk.9.1700657140601; Wed, 22 Nov
 2023 04:45:40 -0800 (PST)
MIME-Version: 1.0
References: <20231122085438.7328-1-alb3rt0.m3rciai@gmail.com>
 <CANNYZj87+-6jte1KYUNg2ueWvsYzxiOQvbTzrCZ_ooo9N7uutw@mail.gmail.com>
 <CAH=B7vfs74f-vyx8JGJyfAu3NPa5xwgumsW+_ahMBXnfUmJw2Q@mail.gmail.com> <CANNYZj_XcosMZQHswireb1JHJahUvSy1NuHy_3-f3Km8aWwgbg@mail.gmail.com>
In-Reply-To: <CANNYZj_XcosMZQHswireb1JHJahUvSy1NuHy_3-f3Km8aWwgbg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Nov 2023 13:45:28 +0100
Message-ID: <CANNYZj-Ac_+_AG3_sW=yObw8peavCb3NfUh11-7YDy5xy91StQ@mail.gmail.com>
Subject: Re: [PATCH] poky: kirkstone: eSDK: fix build-in eSDK environment file generation
To: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Michael Opdenacker <michael.opdenacker@bootlin.com>, docs <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191099

On Wed, 22 Nov 2023 at 10:30, Alexander Kanavin <alex.kanavin@gmail.com> wrote:

> Thanks, now I understand what happened. This feature was actually
> never backported to kirkstone (and won't be because of LTS policy - no
> new features), but documentation was (mistakenly) updated to state
> that it was:
> https://git.yoctoproject.org/yocto-docs/commit/?h=kirkstone&id=5e2ec35e3d63f9c73726122fe2b3dd6d6f85a77e
>
> Michael, the bits about meta-ide-suppport/build-sysroots need to be
> reverted, before more people get misled.

I've now sent a patch for it to docs@ - needed only for kirkstone.

Alex

