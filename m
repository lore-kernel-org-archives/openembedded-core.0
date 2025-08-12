Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963EFCA0EC4
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 19:52:36 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.83987.1755028354731112901
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 12:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kO6BFR94;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-709e781cf2eso1773106d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 12:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755028354; x=1755633154; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1knmoT8h1vllKRdUajEfCgS9sXshx24Ba//GYBWF3jY=;
        b=kO6BFR94ncwLVt/WBK5K/hvWi3+utjX79ldeIiFYvXMJOc8PlfIiIhdHiCVW04aBaK
         ZdaVoMMHIktuiVWELj37Un71/yJWocw0skkaq8E+RnKV/qLTlABFrdvEVYoittNdukmi
         ptGaQHAhC60V3lIhkyl4q1jRLMSPnhRqlWp701zs7xFMV7DH/qqmBeIoZYT7LcF6jcf2
         JQMMd9pKyQOQvUPeur8i0LQxY71AQmov4EAcIbiXy4NFZczL1ZbuRBNVUnF8iawSE8C3
         GMSPxMzY09UB6UKvCIOBMWguTI55a+4CdyoZbCJURdabSU35K2Uz7ZxeSlp/MDJLGQWc
         xubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755028354; x=1755633154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1knmoT8h1vllKRdUajEfCgS9sXshx24Ba//GYBWF3jY=;
        b=RHBMGsr/QqKO1k5B003fOxoe2lPX03rARFnqJCROSkNLHI87oMAeDikaBM46L4UqZC
         E9My8LY5vNNfPbF/G69pYSQZl7bUce6L0DkcIDaM4nHb9H/8du7WXdYu8pawlVVxJg4K
         +89VSLj/gSXF7WXREZC9SHYxzA11YaImBejNwjjhIjBa4RbWsMjT4/8e69i5+bc52cmC
         rVpsmYU7W9s3NASXLmNf4Ywlueisr9aqIuQabNt4+cqjUNV7FdnWWiFhayUX0ipBOkbC
         /UQnPtoNrYTnSZdCegiiLqkgaqfEO4110t4PyszgaIkI1/B26nmYkNvMIxvLqQJxWzFC
         CJiA==
X-Gm-Message-State: AOJu0YyUzTYBenY4y6qpBVuo+a7WKfpMdnZTSBCGmH10QYHFb1yFdNQJ
	TQL8d/WkYEIHWDckRGKFYogAibyqXlyf3zxts1aY//yO8ZjkIAKLZK7ReUwGEEq8fwsrWMUpoJr
	2l7vFiG41TXiKRTp2MJULzvycH3PwCPY=
X-Gm-Gg: ASbGnctJCvXu6CU4JRxebjqfVauKA51CrcCnJoWAkFxsEOGWQDFP2iNPJO7dFj+K7iA
	c8CVsRZZU0DsX+bm6ZK6eLy7BNthSkyscjTwMjHfx8hRyymFTpGywyVbjyEEarmE7Ro8QhG66G8
	b9cnvnW8aRck4MxFwuQEqwsrn8XDUJei41V5mP482A068QEGBYpt7aRmqXcgH7foPwwjIVvpfGC
	nQOfpcKi1LsMGYVkKeADcsL0DwY/+5T31Mn5mtL4A==
X-Google-Smtp-Source: AGHT+IEoyiaYTQ9RXGElkmDFxbpx0C2bKIc7O1eXB3Fr6yOibISLzcGmfOk/Q+iEe/YVGVnpOBrsy34Htof64y/V7+o=
X-Received: by 2002:a05:6214:242a:b0:707:6524:2345 with SMTP id
 6a1803df08f44-709e77043e6mr8228576d6.17.1755028353669; Tue, 12 Aug 2025
 12:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj8_EA6U=o8fR98TA6upx9AzmSh+bf11bKfAuXJhY2G9xQ@mail.gmail.com>
 <14837.1754686511622096879@lists.openembedded.org> <CANNYZj88MnY2QDEuK6cZtQt1xyBMeCB6LPp2xqLQzd0OgwB4Cg@mail.gmail.com>
 <CAEWn9yvzWa+bruBTrM62QuMDosecDrYviY6mbTsE3uR294Y+hg@mail.gmail.com>
In-Reply-To: <CAEWn9yvzWa+bruBTrM62QuMDosecDrYviY6mbTsE3uR294Y+hg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Aug 2025 21:52:21 +0200
X-Gm-Features: Ac12FXzdVacVzu4jT1_MgEZUi6GNf9ahLwZpuRFyxSQd8SjiwRqBxxwM05zQz6Y
Message-ID: <CANNYZj9N0PeqeEXM_tMKNLK10fshAJ8fm-+RhHwiSuXCztDNxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go-cross-canadian: fix binaries install and GOARCH
To: Osama Ahmed <osama.abdelkader@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 19:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221777

On Tue, 12 Aug 2025 at 00:22, Osama Ahmed <osama.abdelkader@gmail.com> wrote:
>
> If you set MACHINE to qemuriscv64 it will be go-cross-canadian-riscv64, the bugs were reported for arm/arm64 not riscv64
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=15204
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=15775
>
> Also, the majority of Yocto SDK users run on x86_64 workstations, so SDKMACHINE=x86_64 is the primary supported path
> and go-cross-canadian-aarch64 is supposed to work for any supported SDKMACHINE, as long as the host architecture is valid.
>
> Currently, if SDKMACHINE=x86_64 (the default for x86 PCs) building go-cross-canadian-aarch64 fails,
> with this patch build pass for both SDKMACHINE=x86_64 or aarch64.

The point I was trying to make is that this patch needs to work even
when all three architectures are different (e.g. the build host where
bitbake runs, the cross target (defined by MACHINE), and the sdk
target (defined by SDKMACHNE)). That was not obvious from just reading
the changes and the commit message..

Specifically, it wasn't clear from commit message why GOARCH =
"${HOST_GOARCH}" is necessary, and why it is correct. It is necessary
because GOARCH defaults to TARGET_GOARCH, which is set from MACHINE,
and it is correct because HOST_GOARCH is set from SDKMACHINE. I have
now found a bit of time to set up a build and run it, and the patch
seems to be doing the right thing, but its commit message should be
adjusted to include the above bit.

Alex

