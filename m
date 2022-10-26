Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9777BC38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 13:12:43 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.7430.1666789956486901282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 06:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rq+1PU0R;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-13b23e29e36so19171418fac.8
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 06:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lbr4VEugn69Dho0UheOFUDDGuOW0cayNdTUdH0OzY84=;
        b=Rq+1PU0R0PoKKVivdbLFQ7+8OlSNqcfzyw5TPbJRDMbLHF/dBI+0lJtPqMhLz3HxTm
         wGM0c03oSj9Oeyeh1fv/SUTxwTmglVUzDoSwlXOropkyOnHFgPdAlIBsWHtJSTelwfvy
         RiChP5GMSIg7pjQWaFbuoSrkTR3gxsEeM4PY/pO2GqYprMoptbNrYRehshF/3tO1Xj0c
         fvh6HIjDY9t8BXeRQCM79QQgcaTTGtoYw7EDD7SssL/wlBOp2/iNLmsk+cCwRT3tHNAp
         o+jrZBCCIH/HFxXTKNhNlVXUI3HTRGxLo+8aRWxdYh0mPL4vYR8+yvMeFXemQHPNmELf
         AK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lbr4VEugn69Dho0UheOFUDDGuOW0cayNdTUdH0OzY84=;
        b=jsFrj2Ph+9wrwdNJi1f/H/JVc06hhfF1rwBtf/IW8Z72OYmN1BC/ZDmMNTZf3Vv9fT
         JQg8ttTDXuXRqgt1l6J71E1U7ByqHq9LTJSWKpXYingB2TjCrdC/eMe9tzBv97ECBQQ1
         8QT8UMm7uMKHkCPxJYCWivnctZPWN+KxMFWB7ntTAhVJZoCMGz4YYHif4iRw6CK7vfUP
         V/FRIEMdcdwnrUh80LzfAQMSjK7eD8EFRm+lR+EiVAYmiTZLvCa9Fmr2/RcJh9GAv/zB
         Uird+v1BfGrr6jN4AfcbVu/bat2DOz0Md9iSLYpe2P1+bx2dUH2NUK5NlCOTSMEgPi8H
         2tWg==
X-Gm-Message-State: ACrzQf1bX9SNJSyptTqovJr5So6tsi9eU9whzErDQ08eX2z7xxWAv+aN
	rnkoTtioRIewHgZNiSqZGsmewTNNEtzYITUEDgLtTRfk
X-Google-Smtp-Source: AMsMyM5prAqfVz65ntmH9TfnhilNavcRM6k+yEOT87rPjuu5t1D32APzNWszMxjRhro9mvkuf2V7IjxUct5YpRWP8EU=
X-Received: by 2002:a05:6870:80cd:b0:13b:9ee7:34cc with SMTP id
 r13-20020a05687080cd00b0013b9ee734ccmr2011867oab.55.1666789955643; Wed, 26
 Oct 2022 06:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221020223004.1665512-1-raj.khem@gmail.com> <17207C5BC457528C.2993@lists.openembedded.org>
 <CANNYZj8d9b-se+mjFJwcm_TuyNY74np-=hi+QjGjt8zgh874Dw@mail.gmail.com>
 <CAMKF1sqthWA=ZyfVVfcrdYYemLT3VkFnSFP-aUJ8bbBr_0Pqcw@mail.gmail.com> <CANNYZj8ZLcCN7MU-ypibERTDsS5ju=upZXXMzZFY4cJ0=r5oiQ@mail.gmail.com>
In-Reply-To: <CANNYZj8ZLcCN7MU-ypibERTDsS5ju=upZXXMzZFY4cJ0=r5oiQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Oct 2022 06:12:09 -0700
Message-ID: <CAMKF1sqF44sUxrbAWAyjA41R-1dw1LdkgA-HSFcxAT=owVJo1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Disable 64bit atomics on crossbeam on riscv32
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 13:12:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172153

On Wed, Oct 26, 2022 at 12:58 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Wed, 26 Oct 2022 at 02:46, Khem Raj <raj.khem@gmail.com> wrote:
> > Thanks, I think we can also unbolt the workaround in librsvg as well.
> >
> > diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
> > b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
> > index fc52ae61c5..daf60217d4 100644
> > --- a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
> > +++ b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
> > @@ -35,7 +35,6 @@ export RUST_TARGET = "${RUST_HOST_SYS}"
> >  RUSTFLAGS:append:mips = " --cfg crossbeam_no_atomic_64"
> >  RUSTFLAGS:append:mipsel = " --cfg crossbeam_no_atomic_64"
> >  RUSTFLAGS:append:powerpc = " --cfg crossbeam_no_atomic_64"
> > -RUSTFLAGS:append:riscv32 = " --cfg crossbeam_no_atomic_64"
>
> Not yet. librsvg carries its own copy of crossbeam which is not
> patched to use the provided standard lists.

right saw that

>
> So we should first merge some variant of crossbeam_atomic.patch
> upstream. My previous attempt went nowhere:
> https://github.com/crossbeam-rs/crossbeam/pull/751
>
> Alex

