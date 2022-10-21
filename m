Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949BEFA373D
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 15:41:58 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web08.11560.1666366909964571232
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 08:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JJ4t5i65;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id f37so5762278lfv.8
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 08:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tY6RDisx+l4Q/yCZ/OSSlOCswLKqRPme+AzVw/nRThA=;
        b=JJ4t5i65suB4mgUmSh2nGrmLFTf/J3HXEa+BkN6AIlW/3xoOP6FkocNr4SUqCHKpaW
         V+9uCBPCm2QdOtx/LxK7dYoVJNGfRZk1y3vRwRAaVLHJ2avw/ikMz+fdgWI39vJf4q5A
         PT5191ja9iQAc9prZNJJy3mFD9J29gMDaOkU078Ah0bfaC26w5iCyPLTC2A+nGE/yzyJ
         ZwAMVTc4zAJ++ulLXJM5CXBlv+AEaEGHAkhZP9urZke2djXuQoIZ47Us5UFMvzfEkxHD
         /PvL2kS/F8AByDTfemzTmD+4IJ5SFJl6KNWeloeIWjUijkqoGH1/YwMzaTlfvBIgPOUc
         lSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tY6RDisx+l4Q/yCZ/OSSlOCswLKqRPme+AzVw/nRThA=;
        b=XVwSpa+SHNiejTELINHUlbbmCXcLxvb1cW+ppssgb7n2b3ah4soSfl2sTP1pwsVDqq
         IUwdfEQfYUBvm9ukrfNjpHI6i0Nl4Bv1yKKFo1btb7KEW1OyX065XiOpej+05JueB8XT
         NYwcDSl/9lwB5HrrE681Gd8qJ2e9Dn+2124h1NGzCe2Hv6XtVqW7HG+TJE/EvMLH5eQM
         JIPcKB3D2+cQIV5tYdY3AZU8v9lBMyTNpLZVivFfmX1oopu32ICcLjb1FedbfXF/CSrU
         4yMzJjMsdV1I9EYDBWE4ETo82pGL2WxUyw0hOOP1ZFg7pNo79BRI+OoqRW6Iiog6c4kN
         DckA==
X-Gm-Message-State: ACrzQf1ivQwDsTVN9zB9F37IY1//2ACv5Vyqma5ZuUipob+tPRy/VZT/
	Gckc0A8zJeYbEtGHe1MHudYup9Hh8/ryWIAxB+M=
X-Google-Smtp-Source: AMsMyM5BsKcM+eudoC/8yH4H8UCwbtz9EG4PvVGKXxuJiwdwDQo1dUijh+vtda+3K2Do169mFURSr2H81wMvB6G2cXE=
X-Received: by 2002:ac2:51bc:0:b0:4a4:712d:1b83 with SMTP id
 f28-20020ac251bc000000b004a4712d1b83mr6687787lfk.345.1666366908059; Fri, 21
 Oct 2022 08:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20221020223004.1665512-1-raj.khem@gmail.com> <CANNYZj_-7o3VNCONa1sTgscrWOZtSKy6iB1mL6pOT40wt5fTow@mail.gmail.com>
 <CAMKF1spz7=2NNxXj5w-ZAAohUz9ZxJ=d=eGvCg2N_fsKe1a0aQ@mail.gmail.com>
In-Reply-To: <CAMKF1spz7=2NNxXj5w-ZAAohUz9ZxJ=d=eGvCg2N_fsKe1a0aQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Oct 2022 17:41:36 +0200
Message-ID: <CANNYZj-0DUfDdJbnwZPc7kof90ZYGj5-8u5vuZtVH_dbUbSb6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Disable 64bit atomics on crossbeam on riscv32
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 15:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172026

On Fri, 21 Oct 2022 at 16:05, Khem Raj <raj.khem@gmail.com> wrote:
> This patch is doing something else where its mapping and broadening
> the architecture to match crossbeam's understanding of it.
> Here issue is new where it does not yet realize that some
> architectures do not have 64bit atomics implemented.

Here's crossbeam's own list:

https://github.com/crossbeam-rs/crossbeam/blob/master/no_atomic.rs

You can see that riscv32 is in NO_ATOMIC_64, and
crossbeam_atomic.patch ensures we use the list, so why do we need this
change?

Alex

