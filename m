Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66E12C38A2D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 21:49:50 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web08.488.1666388981510035903
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 14:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bOgcfA7s;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id g130so4663320oia.13
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 14:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KZ24Kb/lR5HZlk2A7wTdw4gDOz0wmCA7XhOCNK3Lts0=;
        b=bOgcfA7saW7bdtxcXYfLmkWef+P9DhtkzPrRVrRa9wr4jEx4RE6fCtu/uApXJVN0HK
         lkA003+oKG7VhDtqiiC7OWcbEaG9tF37hUgCOlD7YPc01sMvMtxI0t2+WMduseVzP0Eu
         m/PzQgDAnjnNmSLI6/3Jki7cbd7ZaE1cvgezzT0UWPFBbopW1fS+yvDilrmsCtMego8b
         oI599gDHNNQX1Dr5DFKaVbv1Mvc7cHuz2gxGHyiYffNoPJDIW1JASy2WuqAUtGDqox03
         sngv1auMSC72c/s5uVESd8UyZvAIl9nVHpdlDl962oxHnVYpU5m4DmvXDIRt6yAvGEcU
         6plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZ24Kb/lR5HZlk2A7wTdw4gDOz0wmCA7XhOCNK3Lts0=;
        b=QIri6nm0aTHCPLcTABLYYMq80Rev/ORBpi30x2uTjxIRGeDTSW6h3CYr7Pp0Z8cBNP
         L3PY3tVwccmdOwC+Zus20TIJloUg4WlMxIIR1/jOAH7/0OZJSq+7HVEwO4AmzRcOVP+z
         y1LOFxei5da+WATIGKALKzvdM9hXY4Di2N+Oh3Z35YSjAWk7tzZRyx7TZBTGGN7KeaeG
         vpoBTa8Iv6754UzDm02Saett8SPGSKAolPdI+CAYfIz3qMpuzEgQ3SXAz5zDDpgY4b5B
         zOp39IPlcaXotP/LbDvuKmHR1cY4wTH5ujKQ7MXGxZ4r0rQZAy0QeuH4G2CWcaJWgMmk
         UhiA==
X-Gm-Message-State: ACrzQf18x/22AhdzHt/ChpTJ9e7v6MP1q9DMb/GN1RrHdA9b3ZVDQaD6
	KGXR950QkQ88ZLJejnO6jf4W6ao8LwXd9CzBDEw=
X-Google-Smtp-Source: AMsMyM4WGlQOV1Xw/94t5TFWo/8b0vYtn/KyYYB1+IFr5kcEc1CEifojL9+5yT8HJEhiGyp5dmD78FTMrdVQd54tbf8=
X-Received: by 2002:a05:6808:1902:b0:355:3420:6585 with SMTP id
 bf2-20020a056808190200b0035534206585mr15257828oib.262.1666388980814; Fri, 21
 Oct 2022 14:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221021200514.1918359-1-raj.khem@gmail.com> <CANNYZj9X45DmDddF=p=4ZVkwAN5q2a8TB3ref27_rj1YiRFhYQ@mail.gmail.com>
In-Reply-To: <CANNYZj9X45DmDddF=p=4ZVkwAN5q2a8TB3ref27_rj1YiRFhYQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Oct 2022 14:49:14 -0700
Message-ID: <CAMKF1spDPVJXLmWdz=FiG19AAgUcThRfee8JOdBXiS=EYpwW2A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rust: Disable 64bit atomics on crossbeam on riscv32
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 21:49:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172046

On Fri, Oct 21, 2022 at 2:01 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Fri, 21 Oct 2022 at 22:05, Khem Raj <raj.khem@gmail.com> wrote:
> > Update the arch part of tuple to consider OE's names
> > for riscv32
>
> > +--- a/vendor/crossbeam-utils-0.8.8/no_atomic.rs
> > ++++ b/vendor/crossbeam-utils-0.8.8/no_atomic.rs
> > +@@ -49,6 +49,8 @@ const NO_ATOMIC_64: &[&str] = &[
> > +     "powerpc-wrs-vxworks-spe",
> > +     "riscv32gc-unknown-linux-gnu",
> > +     "riscv32gc-unknown-linux-musl",
> > ++    "riscv32-unknown-linux-gnu",
> > ++    "riscv32-unknown-linux-musl",
> > +     "riscv32i-unknown-none-elf",
> > +     "riscv32im-unknown-none-elf",
> > +     "riscv32imac-unknown-none-elf",
>
> No. Updating this patch with every rust upgrade is already a pain in
> the ass due to rust checksumming, it needs to be upstreamed in some
> form rather sooner than later, and you just made it worse. Please
> let's do a proper arch re-mapping.

we should apply the v1 of patch and move on.

>
> Alex

