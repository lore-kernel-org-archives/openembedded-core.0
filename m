Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B75EC004D4
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 07:46:12 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.10306.1674027970832333533
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 23:46:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pZafBfFI;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id a37so9799379ljq.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 23:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uxV9hWN7a1u+YY8Tmo+NZmDA1SrDaoRfUOusnYEx5xk=;
        b=pZafBfFIv0I9gAnfyueYSjsk5E/nx5dTbf+j2DmimMYgynWxlOeVsDqEt5szhOTutp
         MkJT4JrLxm97bMSK2q5oWI90LaUxFMpcRp6ps6pteHWHxzPuwiQYdFyoVtOq5W7V53SK
         muZdmg54HDF3/tfIII8K7iHObbRuo6s0Sff6owwzJPhGESF0rEPM1wlVTZzS6FDYtJFg
         PLN2h/Wqyd+yjBBalRvkU/v7OsiW8R0FeFj7ed6ryJ34giPWvwzgE6167N8/Ddyx6nGr
         zD1hp6bQ9UPnsQG3QMSwqrmTHn+bnwgeY4cZl6zp1tCILLSqMRBTwBQB1sD5Hh34uJTS
         kMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uxV9hWN7a1u+YY8Tmo+NZmDA1SrDaoRfUOusnYEx5xk=;
        b=09P4b+CVLB6QZD6WFFZuj2vA8NUw7H4JtCpodBLyR5AQEgHMe4L21YHiWA6gScs4Wy
         vWRkmui8uWPbGYi0M97XNl7hhIv91JS3kuENTcTyl3TURf8hdzQSBEbQT39jU38DSVlX
         VD90d/f34RPWalRxyeFMciV1Yc18+CkOjU3VqRM6Dx1dcOP1R/MZ9QHIbfxuG20CiN/1
         DHMVxood4jCHyoRNZP1Vp2gLtnZz212Qf7SmRBSqlCtRjLXasoSwwHFTNidk7HyF2S0j
         NzTY5C9Ww1VNS6yRi9BLndTt4qBkMVnwsFY10FAtZvhbpJ/ExJZIjAJD1q+a3CX0Mcbv
         WV6w==
X-Gm-Message-State: AFqh2krL8rb1+NcThQ46l0VLWQQokg8Ce5/mQIkST0x8LNz9/KMH3GUi
	KJo+Kret9Rqs7PtglitRF8ZimXjZRRw3h6bgxIA=
X-Google-Smtp-Source: AMrXdXtEP/P1re4OUwMuD/x5vrPcfvVOK7F1Q7N+hVcgOfMEyazWe5MDQWU1QnCDQ+9EUf1DabQmK7V8zCCssl2k9J8=
X-Received: by 2002:a05:651c:2395:b0:282:5f2d:62dc with SMTP id
 bk21-20020a05651c239500b002825f2d62dcmr527861ljb.217.1674027968692; Tue, 17
 Jan 2023 23:46:08 -0800 (PST)
MIME-Version: 1.0
References: <17490.1673869297796319682@lists.openembedded.org>
 <17490.1673882452401971192@lists.openembedded.org> <d74652b6-1342-491f-b949-320cf9f63012@windriver.com>
 <41add1d8b8a0f94c13e6599bd4c400dee7c611d1.camel@linuxfoundation.org>
 <49909f0e-9fc9-cb74-66f4-e6feec95f8d0@windriver.com> <CANNYZj_UxfHNdOyT0t1S=gov7DXDVnNdCOQ4i8-cXfK9VGw0GQ@mail.gmail.com>
 <CAOSpxda3VsmobDFyVCmNH6cqGd+MZahO=g=yf_6XNY0sJAwcLg@mail.gmail.com> <765d5133-42eb-2ef6-7ba0-b5556a7a1d1b@windriver.com>
In-Reply-To: <765d5133-42eb-2ef6-7ba0-b5556a7a1d1b@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 18 Jan 2023 08:45:56 +0100
Message-ID: <CANNYZj8-Y62NRXg9Z+Lbju8ZVcpamE8408B6veYDKG_r-YK3Gw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.66.0 -> 1.66.1
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Steve Sakoman <steve@sakoman.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	sundeep.kokkonda@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 07:46:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176075

On Wed, 18 Jan 2023 at 03:08, Randy MacLeod <randy.macleod@windriver.com> wrote:
> So far, there haven't been many Rust/Cargo CVEs so maybe we're making
> too big a deal out of this. I certainly don't miss the deluge of memory management CVEs that
> C/C++ applications suffer from!

For what it's worth I'm with you here, and I actually have an even
more radical view (that may offend some - apologies). I think this
whole 'CVE backporting' business is both enormously wasteful and never
complete (or even close to it). Backporting CVEs and the stable
release policy is basically a cover-up for bad (or altogether absent)
CI at the project users side. If you upgrade a component, and it
causes trouble, the trouble should be caught by pipeline, and not in
the end product when the update has shipped.

The saner policy would have been 'a Yocto stable release contains
component versions all within their support windows by respective
upstreams'. If the only supported version is the latest one, then so
be it.

Alex

