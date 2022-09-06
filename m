Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D60ECAAA1
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 12:35:15 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web12.3435.1662467708720678215
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 05:35:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N1ujBbTt;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id k18so12078126lji.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 05:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=cD5AyRBnF3WKb0dpAlPa84ZfGAGjKsc74yiogeFZc2w=;
        b=N1ujBbTtuZ4VfQIQEvy7kprHN63Mq3f9vwGI1PZGCf+NGXnUhxY2YDp8bu6e0qgpsT
         fgWpDB5jpA4/fUuNM869h2bqgAG+vxLOyJMF7Hv11f84IEshXyeYj84pqSpxqNU/9WAS
         F7Jca7xyg5nLkMQPiE8+QecNzxM+6ig7jW/8g4sz7aiQKV7j6fmf+mNxLbwaP5Xel5aV
         6YFDshZs6THzABeASnBLRjjEboKHsRluMu/18Jso5rCnY39foduxG7zPgHc4zpx1k1PT
         hxhS/HEoitldVez76MZVIkz4l611vTUXcbG68vVpAbrr3nveCMGJ2pQOUfeT5eq1mmDH
         1mAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=cD5AyRBnF3WKb0dpAlPa84ZfGAGjKsc74yiogeFZc2w=;
        b=3pdmW1dlNCwTJosnnZoM3vax0IElhKyMeJ9gDd2iuyIHRa+gfpFPFh/gfNDAqqiOly
         y/4WEpON2kYvVtKSnwQie120CjumCY5gYW7SCQ3g8+sNoftzKEspUqhxUK68Ve2xmQeF
         zh0bM5iLEvLh6m1y2FbIQ6P9zKu37f+sqP+ZSIs7KqBefjCKes/LI2ZJuCo/aOS6qCsM
         92d2MUC6uLHCS0wzZ5twzwT5+oTW4aGWGYp0UGUYiDZX70w3Opd5/Lkp4SOz96itYoOO
         YGdi45Y+PZzzT0DONwmKJUIuXLw8h8cKM/8usR3ULGxoeAeWTdLyuWF6OnYYnUF6RtQu
         8Ffg==
X-Gm-Message-State: ACgBeo0EatfuJppw21cupIwreaBAqvmfdtnvW3pSakSRUdJmsMvYDM2D
	MI0G3aH43iq8M0GtFiHAhl5UuTFfR4uZ+7J3MVs=
X-Google-Smtp-Source: 
 AA6agR5/iKXXE3pNWTDRxELuNQBPLJRuLkO4zv2q2mssCvNOngROGnNaKnBxEt6zrwoRJ8QAmopdIgtRk4nUHPlvA5s=
X-Received: by 2002:a2e:9415:0:b0:25e:477b:adc9 with SMTP id
 i21-20020a2e9415000000b0025e477badc9mr15005328ljh.109.1662467706948; Tue, 06
 Sep 2022 05:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220905182141.1091053-1-alex@linutronix.de>
 <87leqwztwp.fsf@jogness.linutronix.de>
 <171241B5563541EC.6347@lists.openembedded.org>
 <CANNYZj_sTxPuZtdVk68A8AGqwnT6=RNXmJ6u1LVuc6BQiHRvkw@mail.gmail.com>
 <6632fb17a872496ea3b7a61a42f2ae06@axis.com>
In-Reply-To: <6632fb17a872496ea3b7a61a42f2ae06@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Sep 2022 14:34:55 +0200
Message-ID: 
 <CANNYZj8CeYoB9tDaU4Tz+X+Kg-jV53cpLNAiR7TDkRa9jmY1gw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] oe-setup-build: add a tool for discovering
 config templates and setting up builds
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 12:35:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170351

On Tue, 6 Sept 2022 at 14:25, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:

> Given that the tool is called oe-setup-build and not oe-discover-build,
> making the discovery mode the default is actually a bit weird.
> Subcommands sounds fine to me though. Maybe you should call it
> oe-build-env instead, since it has multiple modes?

I'd like to keep it within 'oe-setup-..' family though:
oe-setup-layers, oe-setup-build, and then later oe-setup as a general
integrated one-stop thing that ties it all together:

oe-setup kirkstone
oe-setup master +docker +systemd
oe-setup yoe riscv64
oe-setup webos
oe-setup some-custom.json

Like RP suggested.

I think having discovery functionality in something called 'setup' is
actually fine, as the setup actually happens from the available
choices, and one would want to know about them first.

I'll certainly switch to subcommands; this will allow adding config
fragment management as well.

Alex

