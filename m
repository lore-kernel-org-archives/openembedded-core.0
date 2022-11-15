Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18651C4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 12:13:55 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.4861.1668514425468428237
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 04:13:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JueM5PYE;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id s8so6969271lfc.8
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 04:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BCfp7krgl7sj5hUAEReKiB8N4bnnIkKBshx6kXtmywo=;
        b=JueM5PYEamPmTAmS3nDm2ENDDt+WN4BqNoXaefdo0tRT2KZEU0Pq1w5EgHXtWXfqGu
         8LHXnw8diOpZwJiX7PcgmbiiG9JGQ0kDlBV2fpZ3xolYkADZnFcNJ+0FXxoWnOFMBzlC
         QDK229Yek7eNFcDu5BQf0x6Gzbtvytjk/xnMkEP2xHfTGvnY3lkFf3fGpvRWbM80dJuu
         5OExagfjXtIhr9nz+t5CycLU85cR+nwE4NrJ4/Bm8nHwxlK74iugHJ8ek63cD9tRmP8C
         ON7a4eSkoA2cGGhOQ3FWNTegqGPGPYwXUCAr+C2cH/3R7tmHKOZ/DtI9FCUi/hpBHH1I
         kxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCfp7krgl7sj5hUAEReKiB8N4bnnIkKBshx6kXtmywo=;
        b=feXLytOI941YG5ffERaayPvNVcvjhntl2HaiFhIZxTCGbldFVrvQ62V9/kEyOFjErK
         aKHJveQSXk0dXVdy3k0IVcftV5cnxoZsCHDINV6jsdr0cPqvp0SiDMBYs5t5VSaNeR14
         jFYf6KE8JpQUQwrqUaOXKUHU/IeZ2jL5tDccz2HmYWgk+C/f3qfymZlnUE89c3JpFHiI
         s5upCvJ0j9kjEnAi0v1CZmWrC6osejCJrR9qra+KGVV7bwZjpZ7ZIA2CNfd4+MnICYRO
         WBTaXRJLxbdc/hJnLHNejmCaQ6vMsDd6hUgJwlhzVShibs27SHRq+f7P/5HlOX0CNgaB
         YjsA==
X-Gm-Message-State: ANoB5plDbfwtuKlRTqbOIWdHyuKHJZpE9CrvPBpjA9mJAeOanR29vJ/t
	PQJDSljVsVUVboCFC2dpi7DOYFSSIEYoBU3t5Ig=
X-Google-Smtp-Source: AA0mqf7k5lesWYFXGIey0KAlWUMBeyWCwBZvAq3LiA0i2wf7KYLtAWPY5a542YpCZ6TqEkKDNC1ACKLUD+LnzTEi8os=
X-Received: by 2002:a05:6512:2203:b0:4aa:323f:e850 with SMTP id
 h3-20020a056512220300b004aa323fe850mr5521759lfu.492.1668514423826; Tue, 15
 Nov 2022 04:13:43 -0800 (PST)
MIME-Version: 1.0
References: <6D11494A-84C4-446D-A736-49841179EC70@arm.com> <20221115120314.325-2-cp0613@linux.alibaba.com>
In-Reply-To: <20221115120314.325-2-cp0613@linux.alibaba.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 15 Nov 2022 13:13:32 +0100
Message-ID: <CANNYZj8-5A7xjgp+0A=2eN1cfeuRfRLu-z9aBaM2Nhq6Ad=Wiw@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe] [PATCH V2 2/2] Support bitbake compilation
 when the host is a RISCV platform
To: cp0613 <cp0613@linux.alibaba.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 12:13:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173273

On Tue, 15 Nov 2022 at 13:07, cp0613 <cp0613@linux.alibaba.com> wrote:
>
> From: Chen Pei <cp0613@linux.alibaba.com>
>
> meson should add build_arch:riscv64 to support bitbake on RISCV platform

The commit title is "Support bitbake compilation when the host is a
RISCV platform"

Imagine someone reading the commit log; will that title help them
understand that this is a meson fix, or what 'support' actually means?

It should be "meson: set dynamic-linker for riscv64 targets"

Alex

