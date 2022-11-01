Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39ECCFA373D
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 09:11:09 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.4103.1667293858794723440
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 02:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nXBQNO8l;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id h12so13253043ljg.9
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 02:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uKzRCAfqqqoKYKetyDFiB7LbXH4qeiPdjBxHgY3S8RI=;
        b=nXBQNO8lHpnkZz8yyDVLHidP6lA6mCSz5DhuxqgMCYxhCR7cyQCBMam2JNuANabbM9
         ImNXwOw6V4dxTeOogwRuIM8yIMNF3B6syIdrPoUwIfTYs0mqJJyUVClhM6mEpSeysWFx
         qWadI/Arp/4zUwGIrC5l2MXwzuzdLrqKh48JMcEfRASyc2PBoPWXqgBYmNs11C2Wv0GQ
         9MY+IgqGFWZlJPgTApwVSy7ING0chOSMoAoUO6YfjbFIEokJZwFmNgk1GDOeX/fdbGi0
         6CEic7FpD/49/RYQ33J4zJ/fciGCuGSz6rP2UMu6CHXoWkQLzHpkO1wEOhW7JzuhQVzP
         s9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKzRCAfqqqoKYKetyDFiB7LbXH4qeiPdjBxHgY3S8RI=;
        b=WZcVRpwLzxXa5qg36bNtNtsx07mPELUStDHavEhHo58kiAFRBFNk/3Q41INxyIClTz
         gBKUOt4Tg59DeDbaM2exahuxwZn/78Esm61n59mzLKDuTGGPQMIu6ignfd28vbNG5RCg
         YhARibn7q8juIouvMnIk+PangkyfdyT0QreMTJLzWm0Mb80Zk8uzj0sb23EBnU3Q7cMl
         RTFwjdYporZwxmnFraYOgGivBT2SX26ZLhw1DdDf+HE2RwtJlZToy7Y/72UZFYJZYaAJ
         +ary3y2dfOFi/zzaUK3Elsfo8b1PV+CGVAGRuBrFxAAZk1VaAovGKF9p4zxFBQZf2td4
         FVjw==
X-Gm-Message-State: ACrzQf1McaulJKC96c7fvpiV/KTB09QSgzzcZ6LTF6zWoyCjaqVWyikc
	hJvdEJeeZ5f8WRBhjnoPgOlNgUlDVXYOWakm4us=
X-Google-Smtp-Source: AMsMyM5vrLr1A5+KwgFzzvUF069Is3og/fy5zKmANNABtIWLMkNHbbn+8r7Mv6u+sJo1tQleB3gWsesthDvU/rD8vm8=
X-Received: by 2002:a2e:885a:0:b0:277:eba:852 with SMTP id z26-20020a2e885a000000b002770eba0852mr607130ljj.31.1667293856687;
 Tue, 01 Nov 2022 02:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221031210902.169924-1-peter@berginkonsult.se>
 <CANNYZj81UaR6CojRriPNwGbq76mk+0Y+j8khBy2ZTrUqm4R1jA@mail.gmail.com>
 <e95e1314-a709-1f5a-548b-e27b4e5d3362@berginkonsult.se> <CANNYZj_A3cUHCjkys1_7DtasJU5sD5z0ruQv=WjSVCkwGKjbbg@mail.gmail.com>
 <35e2faf3-7cc5-a266-12f3-73ef600be8b7@berginkonsult.se>
In-Reply-To: <35e2faf3-7cc5-a266-12f3-73ef600be8b7@berginkonsult.se>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Nov 2022 10:10:45 +0100
Message-ID: <CANNYZj-8-Ao5yj=rU7qS9oK=mBASs0Fm0=28sxp849DCOSVw-g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: change syntax for SRC_URI append
To: Peter Bergin <peter@berginkonsult.se>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 09:11:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172353

On Tue, 1 Nov 2022 at 09:12, Peter Bergin <peter@berginkonsult.se> wrote:
> This opened my eyes for the way systemd recipes are built up in oe-core.
> It seems a bit the other way around. systemd.inc contains almost only
> version information. systemd_251.4.bb is huge and contains a lot of
> thing that I think can be shared among versions. If it had been the
> other way around it had been easy to have a systemd_git.bb, including
> systemd.inc, in my local layer (or upstream if desired) that build
> systemd main branch. What do you think of that? Is is worth working on
> such a patch? Or are there reasons for that setup?

I prefer the opposite actually. Where possible, I fold the .inc files
into the main recipe because that makes maintenance easier, and if
someone needs to change that in non-upstreamable manner, they have to
perform a full fork in a private layer. I do not like bits and pieces
of code scattered all over the place and gathered together by bitbake,
that does not help readability.

For systemd, I think the reason for systemd.inc is that something else
in the same folder is using it.

Alex

