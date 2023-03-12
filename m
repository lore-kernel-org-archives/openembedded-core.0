Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D047BC6FA99
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 14:54:03 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.67908.1678632833781891778
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Mar 2023 07:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XxAHq63l;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id t14so10124525ljd.5
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 07:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678632832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FQt8hVKwo4/2bymCsQlLQr81tT7sIDSgp4m08MsOf6w=;
        b=XxAHq63l6MZuQ1DHvDTQsyQB/AImefTkm2lEVpG7LCBrjHPIkhy4+QeiXntQ1s2iIg
         vTn3MZeYfFOZYFzz0EwOwcreYWE4qQOoAg2yapnbPNRNLqTol4NI9iEC2wfucJzVlnZA
         BHh0MDLFCXS+Tx5+sfeI9uj+eRZFtVRCJUEkevOYBbJ3l4jQDXGTayOmEu1/wSMduYoM
         s7Vo8sm3KdzT/mgXJTfxjOYEpmUeMAaFt85ljnlgi74W8/RoCD/gk537QLUACY6xlor/
         n69vmbFG47kDxgL8SuXrEfeOeFxiRaZu8aEh/JFeTleVKSiv/ww1C7jcf+vm8Yzyb/Wl
         fOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678632832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQt8hVKwo4/2bymCsQlLQr81tT7sIDSgp4m08MsOf6w=;
        b=Q3mTuWeO8TsCmnw7S4sDhBB9x36TwefZWNUQqUTA1rRlI9FDf01oewPL2+KNgK2Fqq
         0SSQygI9meVKvLQhkCW2WlV1zrP9IO0Ka+BltqnbFyobOMxH6gzxqNVZyzgiqclata9o
         40RZRlAcqzc/hJQQ4TlEQlM/j/tAbSoF4SckRbEe3/ttFkNWlfUZFgEKl1gYE8m0kQRQ
         iKW06XBCiThrLCit1WmKLH2bnKU+UROUfcmcdEOdM+AZOUl8Bi8GoS0CfmcqUDcjg9cL
         BYYSwCN4uxtKKaiO9l3JfURzEhVNiXufSHFwC5aLzGBdVUIgxeVYUSV8H8vjHQlx7ViA
         hVqA==
X-Gm-Message-State: AO0yUKX2fDuAUlNwdneAYvvNXkfdjABOjhGG+2WAHuhBlaRvYDny5Sg/
	wE4ivl51IdXlsMdxXlX2Knd7/SRHoHpTieKMgd0=
X-Google-Smtp-Source: AK7set9yRMHbgJTPtmlKKOqsP9qo8O97onH6bIxPqCkGeCZe38nuA0+ooBoebLhBSmpz/Sex/GQAM5SyWlgifCvWYxs=
X-Received: by 2002:a2e:b548:0:b0:295:c401:2e9d with SMTP id
 a8-20020a2eb548000000b00295c4012e9dmr9733819ljn.5.1678632831562; Sun, 12 Mar
 2023 07:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230311224155.3442306-1-richard.purdie@linuxfoundation.org>
 <20230311224155.3442306-7-richard.purdie@linuxfoundation.org>
 <CANNYZj9iktYo1a=+0zZTwnW1PqucFE9FJMrZaLj4ktEz88VCzQ@mail.gmail.com> <9a9b7f6a7c20720803b574c0b39957eed1e7019e.camel@linuxfoundation.org>
In-Reply-To: <9a9b7f6a7c20720803b574c0b39957eed1e7019e.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 12 Mar 2023 15:53:40 +0100
Message-ID: <CANNYZj8xUv5jkm3jrHVNPLwwy5SWenRNjKHFucrPcCF2E4k_GQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/8] core-image-ptest: Switch to BBCLASSEXTEND
 parallel execution
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 14:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178399

On Sun, 12 Mar 2023 at 14:36, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I suspect it isn't arm hardware that is the bottleneck. I have some
> patches locally to split up the oe-selftest sstate tests which is one
> easy improvement.
>
> The next would be to have reproducible builds reuse rust-native from
> sstate. We don't test reproducibility of native recipes anyway.
>
> After that, it would be looking at the toolchain tests, i.e. this step
> in qemu machine builds:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/6780/steps/19/logs/stdio
>
> from the command:
>
> oe-selftest -a -t machine -t toolchain-user -j 15
>
> That step takes a couple of hours which is 2/3rds of the time of that
> target. I was thinking it could be parallelised but I notice we already
> did that! Maybe we should move it to a separate target so it is in
> parallel with everything else?

I also just sent a (tested) patchset that takes mesa-native (and
friends) out of qemu-system-native dependencies by default, like it
was before we had virgl support - should help a bit with bootstrapping
qemu targets.

Alex

