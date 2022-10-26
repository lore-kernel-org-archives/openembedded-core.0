Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA4EC433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 07:59:01 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web08.5066.1666771137889331322
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 00:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mLpP5aQ4;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id r14so27068250lfm.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 00:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ceP06lz1+FNNhzavcUYMq3/5lmg8xu0e4HIgDACgs1U=;
        b=mLpP5aQ4J5a2ze0h0FGU3zUccRZo6gfluVVORGFnzgdsVsNeQmmb/5hAiQyh/c2TbQ
         kmej40JAdPfDD1iW6OoBZ9rlb6XnxJ2KYq80lrVsx9M64VNpEE1ZD6R0GnBp7MWgJn+p
         lWNiTDKL5TDQ95yDHEiNlxr9vxfBP10VZ/j7Pozg7p9eQZJALXMEmqL+dGlesA+EHExh
         katDrKSU0BHvU6ANMAgOVWpK/8ZhgFZqUReXHO3TN7FAGJxl0ggOijq96VrJj+oDUOPd
         k4oVKvF9GkR2xzUGctxYWSUHFjKNTtKvUJxAdUbN5GFlcBroMNpEJW70DqeMxlEgIQ84
         E5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ceP06lz1+FNNhzavcUYMq3/5lmg8xu0e4HIgDACgs1U=;
        b=KGF1vttvQMIEhyT0Ai7//y5TMiDk46BQGaTmIvZjt4Tk3+REQB3kIM75f0vPoN8ABL
         o7i91Z6E0MJYzSv+Aod6R5O1l4+1w1FILmNA7aIoY7oEfJrufgEqGzXjO6Ga33eb2mFh
         v+pGXA3+me5I5fGi8iHOySBOYaeBiixJ3SUvaLRBzAvhwIeg5u5diTfLjo9/a+mCO5yd
         nS6aIQ34V1NBuXXhY+7jxpyOm7gQUNRGdxWwK+nXIERm9qWtzkS0RMBLq4FRj8yMLBB9
         F5AM9PwJrmxnkIZ/EbI6ZtWqajoDsPn34Kj9eHCLDG3MK6/0cnYlF4xKMHpUYQhEZbrQ
         O4iQ==
X-Gm-Message-State: ACrzQf2zdmEho3TXWQHcvAzz38srEwWnJRMB+mHWgL4CzTpyjdbW7R5U
	f6J6RKsr4YLonGB+czUCSD6HVm9NR3bKqX8rvzs=
X-Google-Smtp-Source: AMsMyM7r0uLuCqd+asOgoekHrHaVTVYO84RSi6NLc+sPAt794+p1DmU/B7MIiwwALzZZdr3qfD6ARGzKTy5ocRMSa2A=
X-Received: by 2002:a05:6512:398d:b0:4a2:7d72:8629 with SMTP id
 j13-20020a056512398d00b004a27d728629mr14852642lfu.445.1666771135751; Wed, 26
 Oct 2022 00:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221020223004.1665512-1-raj.khem@gmail.com> <17207C5BC457528C.2993@lists.openembedded.org>
 <CANNYZj8d9b-se+mjFJwcm_TuyNY74np-=hi+QjGjt8zgh874Dw@mail.gmail.com> <CAMKF1sqthWA=ZyfVVfcrdYYemLT3VkFnSFP-aUJ8bbBr_0Pqcw@mail.gmail.com>
In-Reply-To: <CAMKF1sqthWA=ZyfVVfcrdYYemLT3VkFnSFP-aUJ8bbBr_0Pqcw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 26 Oct 2022 09:58:44 +0200
Message-ID: <CANNYZj8ZLcCN7MU-ypibERTDsS5ju=upZXXMzZFY4cJ0=r5oiQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Disable 64bit atomics on crossbeam on riscv32
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 07:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172145

On Wed, 26 Oct 2022 at 02:46, Khem Raj <raj.khem@gmail.com> wrote:
> Thanks, I think we can also unbolt the workaround in librsvg as well.
>
> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
> b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
> index fc52ae61c5..daf60217d4 100644
> --- a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
> +++ b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
> @@ -35,7 +35,6 @@ export RUST_TARGET = "${RUST_HOST_SYS}"
>  RUSTFLAGS:append:mips = " --cfg crossbeam_no_atomic_64"
>  RUSTFLAGS:append:mipsel = " --cfg crossbeam_no_atomic_64"
>  RUSTFLAGS:append:powerpc = " --cfg crossbeam_no_atomic_64"
> -RUSTFLAGS:append:riscv32 = " --cfg crossbeam_no_atomic_64"

Not yet. librsvg carries its own copy of crossbeam which is not
patched to use the provided standard lists.

So we should first merge some variant of crossbeam_atomic.patch
upstream. My previous attempt went nowhere:
https://github.com/crossbeam-rs/crossbeam/pull/751

Alex

