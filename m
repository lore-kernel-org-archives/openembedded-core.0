Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEDDC25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 10:13:20 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.17977.1717495994415531253
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 03:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AZ7z0DJ7;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e95a883101so69190301fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 03:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717495992; x=1718100792; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FCIfr6r6OFshtojYefdMiMyetUz6P4mI3kC+i1nqWc8=;
        b=AZ7z0DJ7JpC5882pOjSxme7krrW/cdCffQESjTQU97fHg0djKSJIplLNopQQj9dh3i
         WK9MIH8qxAMGHJ1SWFZY5rGm3Cc6WKWpbOJULyIY+xwsLO7OhgxucO9gmSJmOE9oi/qf
         MmrEtVX7MqDVjjXqBiI6yx/+8tbKPZHxIJZmO6Cuxwx6xs2TtAzeB15QJs82HzY09E7o
         Qa5m8R4Qxpv9rgkx4mTiVtYkhgl/YsIHGIHrrL5Z+bJlYVyFF/hiEaslSDDQc+Silltl
         f1pAx6XIbExpq7r5eh2H4j1KIhouPidEtEi/M/QB6bHM5ArziFwENnakVvE+R83ViUuN
         cA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717495992; x=1718100792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCIfr6r6OFshtojYefdMiMyetUz6P4mI3kC+i1nqWc8=;
        b=QFDY34rbjd4SSI6oLsmy2u49L6P3XrgueiH5y4IfbHiD5PT86zDJyvvKL515x+jwTh
         q4cLdX684e2A0FCtH1QKJoUN4jHhMrgyRdxZiyeaA+8atMJFSBaS2pjNkay7Cm1N0B5a
         yfG+mrLLrNjWPc7AySrThN+1Ao5zbD6OIqB/SAourHpKRbLZCPy5CsXewaPOVI8U/Utn
         O4JU+RXEDwyUqn6yoNLDHshBB5ByxpodAWQcfINvQEAsvPoQDY0W029+Iviw0N2Ka2ev
         64HedCZlu32Uh5Otvyy0bGaUK4220cvB42eyQl2EHIChMopFqPMco1Uw3/Lx11xJqFN9
         h7eQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAMQCSaIHNEDRJ6ZKRlFqjbIE8rk90Faz9ELYFI9Zl8V27dSheB7FQ9RL+FGSdeQrrmi5ld6UAYx1lWSbPpFX7uXdA8Gik8UyCO8IpsgG72tJ4JYM2mRwm
X-Gm-Message-State: AOJu0Yxa+/YTvxGThXypG8NnkFLMFSeLcCT02WSX4Lm4tiiVls+q3mDQ
	/0mI1/TOJ6IDJrHs2jCw1LgYulc5MG+dcxCmelzIueQgYI6ed6JjlaGv6MmNhssPnBxkrVUPs7m
	bXGiMHA4iddMfLFswbrEVUzihmN8=
X-Google-Smtp-Source: AGHT+IGeDSzVXH9WB+1Ob2NGB2l8RzM/zwHvEPnijbs4aaN+0yROfLiZtz8/OgRPjkRY78a294eqWIa4Z9IcK5r2CVk=
X-Received: by 2002:a2e:8655:0:b0:2e9:81f0:8597 with SMTP id
 38308e7fff4ca-2ea951d2480mr74589111fa.43.1717495992224; Tue, 04 Jun 2024
 03:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <aa532133-c872-4bde-8479-dba12de225c7@bootlin.com> <beedf05b-3b5e-4468-a6d1-46d7d6734246@cherry.de>
In-Reply-To: <beedf05b-3b5e-4468-a6d1-46d7d6734246@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Jun 2024 12:13:03 +0200
Message-ID: <CANNYZj_Nd0Yq2yh9caj0uu+1qv7ybEhMgSsBy1LFxwA32Kk-Qw@mail.gmail.com>
Subject: Re: [OE-core] mesa: build failure in CI, dependency not found
To: quentin.schulz@cherry.de
Cc: joaomarcos.costa@bootlin.com, openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 10:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200323

I don't think you need the full log. The key part is:

Run-time dependency libclc found: NO (tried pkgconfig)
> |
> | ../mesa-24.1.0/meson.build:852:12: ERROR: Dependency "libclc" not
> found, tried pkgconfig
> |

So you could find meson.build in ${S}, find line 852 in it, and see
why that line is being processed and what enables the block of code
it's in. We also have a libclc patch that looks highly suspicious to
me (and should be dropped tbh).

Alex

On Tue, 4 Jun 2024 at 11:37, Quentin Schulz via lists.openembedded.org
<quentin.schulz=cherry.de@lists.openembedded.org> wrote:
>
> Hi Joao,
>
> On 6/3/24 5:39 PM, Joao Marcos Costa via lists.openembedded.org wrote:
> > Hello,
> >
> > The following error was raised in Swat's CI:
> >
> > | Run-time dependency libclc found: NO (tried pkgconfig)
> > |
> > | ../mesa-24.1.0/meson.build:852:12: ERROR: Dependency "libclc" not
> > found, tried pkgconfig
> > |
> > | A full log can be found at
> > /home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/build/meson-logs/meson-log.txt
> > | ERROR: meson failed
> > | WARNING:
> > /home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874:171 exit 1 from 'exit 1'
> > | WARNING: Backtrace (BB generated script):
> > |     #1: bbfatal_log,
> > /home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874, line 171
> > |     #2: meson_do_configure,
> > /home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874, line 160
> > |     #3: do_configure,
> > /home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874, line 149
> > |     #4: main,
> > /home/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/core2-64-poky-linux/mesa/24.1.0/temp/run.do_configure.47874, line 184
> > NOTE: recipe mesa-2_24.1.0-r0: task do_configure: Failed
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6680/steps/12/logs/stdio
> >
> > Mesa was upgraded a few days ago. Could it be related to this error?
> >
>
> Likely yes, can you provide some info on how I can reproduce this
> locally so I don't have to hunt this?
>
> Maybe you also have access to the full log somewhere?
>
> Cheers,
> Quentin
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200321): https://lists.openembedded.org/g/openembedded-core/message/200321
> Mute This Topic: https://lists.openembedded.org/mt/106464279/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

