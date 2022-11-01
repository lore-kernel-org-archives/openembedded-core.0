Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CEEC4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 17:40:51 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web09.3349.1667324442685321986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 10:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BSYQXl1V;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id x21so20579245ljg.10
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 10:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9uAQvEaTojP2LS97rcB0nsgt+WUGo9ZLhZud29G4zaI=;
        b=BSYQXl1Vh9MC71+t3Fcpfz+6nLLITGtD+QogQztByrshmMtYWGjS7rAte165PHb9Oi
         WduWh3u6iq85+AZQjJ4aqSCdt5SKWBkWu1+3MEX9f6iY24B82Yu266/VCPd6dlHVyHds
         waeK12ySz2BN+32l/vCflCOwLnB2c9lQWgKIjHquVBSGt/U+0DYFiwWXSV/wx9sfgmPO
         b2f5TIy03KF6quBplUYCPumcX/wn7GU+eTO+Tsg63NLIN/VTO+OyOVfsNg539rvJBWOX
         a/hS0f2T4AP5h+TUAGHqermQEH0vT7pbKJoUvhjp9BANLQgXUjTZLfie85Fbrr4Ol1Wk
         6Owg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9uAQvEaTojP2LS97rcB0nsgt+WUGo9ZLhZud29G4zaI=;
        b=04F6iWDjZyqVBVffwLaep8n+vrrlhjF4r/IcCtO6IqoWjUoGN0LbWnplD4AutBp3wF
         P2MffMTihQJtPjU9vf+B2XhapAxnjHTenL9WBWp+MmgqvdBeX9uEGy5VFhxFjsj09s8k
         p7Kkcdzdqd4nTbfU/HcxtiAoO/XVgbkvqdTDLv/PSH9pRt4LxjFFXye8idHJ8iezgUn9
         /5X+2onho+sSiLvTAy7hE2wFm32/92Dl/Ig7/WSGYoNvxYJfqoQJ0p21eBg+RLf/+dHw
         LG4ssj5AKPPEGQmkq1sDBqzzYI+4AFQIpFbE4INI8V0APGepycB7wojVpDP6gSbl+sth
         JekA==
X-Gm-Message-State: ACrzQf3qCuh7zkv1FKja1UNXUJ3aKhoB396zcE3gtZzgU0dWCLSfXLzu
	rhj6npM02HI2u/ENzgrvWXS2EJEVJS7HZDPoMJWb6d0Q
X-Google-Smtp-Source: AMsMyM5KYwC/GAffP+7ohU1NDj+N2Q4XV/4fTUm2an/C0NyIUipX+5T4Ncu/+Q6x7m2SY/kAniwX6EmlNof2Ln0HmIo=
X-Received: by 2002:a2e:844e:0:b0:26b:f5ee:b2bb with SMTP id
 u14-20020a2e844e000000b0026bf5eeb2bbmr7790663ljh.403.1667324440833; Tue, 01
 Nov 2022 10:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <17236B468C317B4F.4295@lists.openembedded.org>
In-Reply-To: <17236B468C317B4F.4295@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Nov 2022 18:40:29 +0100
Message-ID: <CANNYZj89oYwS2fGXZJntte8ShdSNGRisS7mBRUdhU1PQiFxtFw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust-common.bbclass: use built-in rust targets
 for -native builds
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 17:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172375

On Tue, 1 Nov 2022 at 10:17, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> Rust targets have the form of 'arch-unknown-linux-gnu' while
> oe's native targets are 'arch-linux-gnu', e.g. omit the vendor.
>
> The effect this has on rust-native builds is that rust first builds
> itself as stage0 for arch-unknown-linux-gnu, then builds itself
> again for arch-unknown-linux-gnu, then finally uses the compiler
> from second step to 'cross-compile' a compiler for 'arch-linux-gnu'.
>
> This last step is really not necessary, and we could save 4 minutes
> out of 12 if it is eliminated. Which is what this patch does
> by setting the target directly to 'arch-unknown-linux-gnu'; rust's
> build system then shortcuts the build process after the second step.

This begs the question of whether we can use the same 'unknown'
targets for actual cross builds, and the answer is that alas, we
cannot. Openembedded builds things differently (for the same target)
depending on whether they're intended for the build system ('native')
or for the target syste. One particular point where this matters is
whether the resulting binaries are linked with a uninative ELF loader,
or with a regular loader, and this difference is encoded in linker
wrapper scripts which are different and are associated with target
names.

Rust has no concept of host vs target: the only thing that defines a
build is the triplet string: 'arch-vendor-system'. There is no room
there to make a host vs. target distinction, if using only standard
targets. Which is why we have to continue with the custom targets, and
the replication of upstream definitions for various llvm settings - a
significant maintenance overhead.

Alex

