Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17851EE57DF
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 15:20:04 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.62287.1694445594847491301
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Sep 2023 08:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=mznHENHQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2bcd7a207f7so72825911fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 08:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694445593; x=1695050393; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g24aEaStpFiG9uPGmt/NrUSHtyyIz+KmwIGEz+Ac6xk=;
        b=mznHENHQehKg2VqcRgybLUUz5AqxQSVdPho/WvBcM9zhmcNcPhqwDygqLxLrHEGg7w
         BRAhN6EFL6e3dcxKZbrkr+V3f6CYpMulMW8qsefMwNoeLEqTNDztE6JpmIGfNI8zOAAw
         zV0+BrstenfnMymMc3v+OQ62jWClTz+NtVNJjnEnhAN+bx4WsLtQc3CM9ZU5/eGLoYiq
         PL19UCZC/TJ4n7pW+zJJSGMfqXU43Mfgjb3mvSEI4FWIBQVfDW7olJ5c+BDW6Ysu54Ks
         ejp6p/xLEC14KGt6cJKUAP805C9gD8x9sQse7uwYMNj6dseM7Y5DbIXDnQm9nxAKIoB4
         JrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694445593; x=1695050393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g24aEaStpFiG9uPGmt/NrUSHtyyIz+KmwIGEz+Ac6xk=;
        b=HYA2furPUPco4GbIx+2mx4Gj6ANVb2r5K1LkAH5KcfuY0zd9XeSsptI5dqXKWev4Cp
         UrDW13kJhxsVnfzAoUHAQglalXTJpkIRn0F1MKE8s10Pby+TNeO3vmkumJt2redEpBkq
         N2LdlvjqXilz89wdC4vGKz0mGRhPUH1JHVGuG5bZB9y3AdzMbKb5aUCfOPc6W/CRm44y
         kJegxC857VfFdtldBtYydV4b29zTdyCkMmtkZ0j0EpBpfI0WXQB59Dt5dLvyp9c9Sjjp
         kvGSHjRQLW0OODJvBGSmFLUEO0Im/zSeQsHoFH9VfDIxe6Pc1ziffNRQ4tE4kaS2PUQz
         ZVQQ==
X-Gm-Message-State: AOJu0Yxemb6my/eoRwncUiW2Ju7fhAyDsgMz/sKezFf5iMZUhtfLaH4b
	dmHF3jflz1b2eA4LRrQXVc3RTdxcNVVCtVdGjzY=
X-Google-Smtp-Source: AGHT+IFBcsM2szBcEC8t6FVeSOHiU6Zmy3ob4/RgRZXdCGLvIt0Ux8NknPXLdfkC8DyQW3n8UnXXXDuFieYDMu7OIJo=
X-Received: by 2002:a2e:a313:0:b0:2bc:be3c:9080 with SMTP id
 l19-20020a2ea313000000b002bcbe3c9080mr8023944lje.27.1694445592682; Mon, 11
 Sep 2023 08:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230906165633.2382629-1-alex@linutronix.de> <20230906165633.2382629-16-alex@linutronix.de>
 <18264a59f21e43aed1138bc58ffdf2471c5ccc05.camel@linuxfoundation.org>
 <CANNYZj_ptnLNvwPGDcAciok0bsE7Ctzww4WkAJmamgkCyB19CQ@mail.gmail.com>
 <781c93976fbd19e146ab2626a6202a0ccb23ab82.camel@linuxfoundation.org>
 <CANNYZj_RfCwHmt_TnUgdHeoTNdqMcX+f7aAzZ7e=MYSx+E-rXg@mail.gmail.com>
 <02407d75fc40487431a84d18b60476552083b1ce.camel@linuxfoundation.org>
 <CANNYZj_HBxGaz9c8X875fZ8rgPGD4MNCjv6mkANAiVZKD4vswg@mail.gmail.com>
 <ffda1a9441f4d6e947bb6aa383f5a1e2e2e0d39b.camel@linuxfoundation.org>
 <CANNYZj8zRk0SYzX-GYdwhSQGQidGrK1PT9mCH7LPeSp4ANERhg@mail.gmail.com>
 <e4706c56b8faab51081682ec06f1de645306f82a.camel@linuxfoundation.org>
 <CANNYZj8PfsZdgYjwUXEm2vy2wEqO2bksNSvDb02smLvMxiAoLw@mail.gmail.com> <e1e5f66bf13da82c0a8d06a3479f4881bbbef7ee.camel@linuxfoundation.org>
In-Reply-To: <e1e5f66bf13da82c0a8d06a3479f4881bbbef7ee.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 Sep 2023 17:19:40 +0200
Message-ID: <CANNYZj9NtRqy0NL_r5QR6fcVRqp_rMV2pW-jttRPjRHk3w3-WQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 16/17] build-sysroots.bb: run tasks one after
 the other
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Sep 2023 15:20:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187492

On Thu, 7 Sept 2023 at 14:04, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> See meta/conf/distro/include/no-static-libs.inc which does things like:
>
> meta/conf/distro/include/no-static-libs.inc:DISABLE_STATIC:pn-openssl-native = ""
> meta/conf/distro/include/no-static-libs.inc:DISABLE_STATIC:pn-nativesdk-openssl = ""
>
> I wasn't sure how easy the shadow patch would be, that is hopefully the
> main tricky part. sqlite-native used to be built allowing static for
> pseudo iirc but I don't think we need to do that there any more.

I poked around at passing options from the shadow recipe, but couldn't
arrive at a working combination. libtool and automake insert too many
abstraction layers on the way to the linker invocation.

So there has to be a custom, most likely non-upstreamable patch for
Makefile.am files all over the place, which I think is worse than
manually unrolling setscene dependencies.

Alex

