Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF75EC369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 07:53:56 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.2077.1745567634908580179
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 00:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YqUhHHja;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6ecf0e07954so27887106d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 00:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745567634; x=1746172434; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J6DcUK5mb+p1wG12x6kCINR5gOdnIwfNjqgVCMHKAsc=;
        b=YqUhHHjaPXJp8mnb3M7FHpr2bAO8WmTEAe1Dr+0Au/FJb0+pAnmhXT6Zhs7J5b/jej
         DL+gwOqdOA/a7ihGTQ/Q2kFbWOkZsS8GyNXzMrdqW44KzEYJnLMurbeloc3XXMw4owbH
         5yTKjkGxfQw2Zfa++eTX0q5ddhi/AyORa+0nlqkFpu05Z8cYKfRaXbUODEThaUuCDY4V
         CRQLRxyd0PzqJXmAoMSqnZEZI/QFNaP8ArOzZR2u/Ic454RpvmephVzYJ2SEmI0qCJo0
         9/njkAwGFH79AE1EjV0z/THEs6U/mPZl0M/2sdNJjIaZD8MZduuxumLlJVVs/1w2Ib6W
         xclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745567634; x=1746172434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6DcUK5mb+p1wG12x6kCINR5gOdnIwfNjqgVCMHKAsc=;
        b=WphvneC+DvD2DvwSXqNUMYnbZevp/ndQ+0Mcho04eNGlCD41QV+4gs0QaQ+0m4tvpd
         rkRZVq5k8k+gRfd+x9WQ2vX70b2zDvEo4EW3XCs50/Z+aAlQdwA4zPANDsvwwWEKugh0
         5lcbqgG6RIyQOSB815II4hJdKO4zmyTpTmGR0/o2g2+rW/rxrWa2hVjhQZgaeQt9RJhY
         SiED7bLY/q2VqRNZ7CRTeNwxTZXaVBnDzCHuX6ma1qrzbYjMLXRWXC7HP65MWXpoe0Hy
         aTYJubknyFyoSlSbkKPH0moaQEnOfuk+spIxyqo7NSa8j4q0ohQW7RR0ykXRWNRcdths
         GXVw==
X-Gm-Message-State: AOJu0YygZWr2T7vSSNecLYEiUMrDpL0kvm2oiFT/D8JKvC32mbFCmCsn
	1r3qZC870Vx0Ri00ALmozE6/tfRIyXZWdJeUMLNWhWsjMnpkwJ1UnfQ0u9PwNRzDAUp/09h1bB4
	eV2Erz/HiBkTKXRZ602NTAKYxYh4=
X-Gm-Gg: ASbGnctp4IJnm8fgIANGtjJxQr/M3ZA/x3ce0ilw0sVqpIsyg7kHVlER1+AJr4gbiph
	hr8pA/ePAEUdpDsCYpBgQgN6r0bBrxdUciFTB9fVyQ0vcDDHnqUCkVk8VwBQIEuwIbA0fGyPjGo
	+Mfuu96Zsl9qW/F2cIZtPQfuJaK87Z13GdA4J2hjQn0yRUYSsHIhJjfmU8
X-Google-Smtp-Source: AGHT+IGxaxesCTub1w5iwJyG7GGjH0yxfRmthhDJCfDuZz4a5ZzCt1wvccyZ8AuuMiYWLz3Nw1rWAYnckUelfCFB8xA=
X-Received: by 2002:ad4:4eed:0:b0:6ea:d033:2846 with SMTP id
 6a1803df08f44-6f4cb9e51e4mr25047776d6.25.1745567633906; Fri, 25 Apr 2025
 00:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250424144848.790383-1-semc.2042@gmail.com>
In-Reply-To: <20250424144848.790383-1-semc.2042@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Apr 2025 09:53:42 +0200
X-Gm-Features: ATxdqUFTbFoyfi-To6-azuL6cLuhulw9BTe4b0jeLrN6LLh2RHkudjTdzSqFvr8
Message-ID: <CANNYZj9ArEu9aVutHmDgeF48LzmCq=333GwS0x-GFz1c14e3=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc-y2038-tests: remove glibc-y2038-tests_2.41.bb
 recipe
To: semc.2042@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 07:53:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215437

On Thu, 24 Apr 2025 at 16:48, rajmohan r via lists.openembedded.org
<semc.2042=gmail.com@lists.openembedded.org> wrote:
> Upstream-Status: Pending

This is not needed here; upstream-status only applies to patches added
to a recipe that directly modify upstream components.

>  .../glibc/glibc-y2038-tests_2.41.bb           | 107 ------------------
>  meta/recipes-core/glibc/glibc/run-ptest       |  37 ------

There's a few more files that refer to this recipes and need to be fixed:

meta/conf/distro/include/ptest-packagelists.inc
meta/conf/distro/include/time64.inc
meta/conf/distro/include/maintainers.inc

Alex

