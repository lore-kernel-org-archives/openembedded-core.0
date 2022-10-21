Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10D2C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 16:19:18 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web08.12010.1666369150647955166
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 09:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ik3nfxX8;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id a25so4477298ljk.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 09:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wpL7yaCEJbnA6pkxXvcR8VXbt6Xp9jHui3mYtnWNmTA=;
        b=ik3nfxX8rIZU5I3iTUyfGnJwe31hRfv2zBp+yAAl8v7ddwwSwGdbjit93+yUCohS4q
         Y6DTKFSB2oQGuULCzj0woUjGGh0h7ofAt9aNyzweme8xcPs3K8x5CbiqC8T4IirrBHdo
         5U21PqRLGfRYzrYvJm1QGe4Ge9P/KbuxCAVaHwtnaTr3gW3l8e+d8/cDRwZOcnKikFPS
         CKZMV0Z0o8/O603ACVd+lTheE2zx6Q5uyGPzBIiWELHNi4eEIT8cATxq5cHW3aa87zP/
         ZaRMSk8YXdY9f5+NBOplGhqfeCRQsnurrLj8nVEEs+yd0k0VXeCkhf0DGtVcNtFhJxen
         ySqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wpL7yaCEJbnA6pkxXvcR8VXbt6Xp9jHui3mYtnWNmTA=;
        b=TUqarRuch9Hn5MWI/tlqr4eKBgfrFroRCjfMCCLc058PiLd1TLEtbrFoQ5jDoX4uRI
         hwsA3OcxoESiGPWY9Q/4QZilCuNxyiDZNtw17BOI/6fmdgbhlEQ2wtGaZItPDgP1xbAg
         46fYpfre8Mxz36dj5hNiVlC+mRveRtaGBwRLPYU+JXZIfL008xYw7A9leO96wKGYUFgc
         Z/bHdKjAMPM5T1xbk0dSbUwBrSFD5EEff57rWfmdNLOcsM73F/VDzce38B/qHpJ7vwQY
         WL1jWkpe8/4u72R3ivSxASLcAvUOsqKmEIWVBuJ2RCnrJhdK+xffvQh6ntSDGc5JgxbI
         39QQ==
X-Gm-Message-State: ACrzQf0X+gKrM/9ESRCaO4JXip2PfjMgMb4Y24QELP2a1MWm/noYjM+Z
	xhtQt0GYp4uMmH+E8LqEGx9h21w29tjR9BqqOEs=
X-Google-Smtp-Source: AMsMyM4JfvveU9Y+2RdGn4rHvoV/Kd+jNTCEmw/2YtqAMTZSgT7TZATDKOSBbXKnH85SYHTvy8ezD/ZlG7HKPiW/8xE=
X-Received: by 2002:a2e:b5af:0:b0:26f:d634:2f0d with SMTP id
 f15-20020a2eb5af000000b0026fd6342f0dmr7490339ljn.33.1666369148642; Fri, 21
 Oct 2022 09:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221020223004.1665512-1-raj.khem@gmail.com> <CANNYZj_-7o3VNCONa1sTgscrWOZtSKy6iB1mL6pOT40wt5fTow@mail.gmail.com>
 <CAMKF1spz7=2NNxXj5w-ZAAohUz9ZxJ=d=eGvCg2N_fsKe1a0aQ@mail.gmail.com>
 <CANNYZj-0DUfDdJbnwZPc7kof90ZYGj5-8u5vuZtVH_dbUbSb6Q@mail.gmail.com> <CAMKF1spz+swUnVW3=GdTLwd0xGNnuMf7F1NqnufGyk+eoTkPnw@mail.gmail.com>
In-Reply-To: <CAMKF1spz+swUnVW3=GdTLwd0xGNnuMf7F1NqnufGyk+eoTkPnw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Oct 2022 18:18:56 +0200
Message-ID: <CANNYZj-6BPL-oou21RLszJiJB6rOC4niAh4-1U9kn1-MV-sFGg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Disable 64bit atomics on crossbeam on riscv32
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 16:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172032

On Fri, 21 Oct 2022 at 18:07, Khem Raj <raj.khem@gmail.com> wrote:
> Looking briefly over the code, my educated guess is that target names
> are still not matching
> rusts tuple uses riscv32gc but we use riscv32

I believe we have a remapping in meta/lib/oe/rust.py, can you check if
that works?

Alex

