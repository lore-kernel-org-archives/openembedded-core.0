Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0709C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 16:07:08 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.11769.1666368421639068064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 09:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m+lUKbIi;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-13ae8117023so4076231fac.9
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 09:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SNi3KQz/POpNMNa8i0g3dz4IYBAVeNccmdbqEb8Iphs=;
        b=m+lUKbIiu9/z+X1U3pqxztI3Pbc6lFcao7+9QQpm+pZfBSwMy6NDD3sq4HKgxtOUmy
         JsNvALXj29C7EcOmZs4XsdVxZb1NLsCFfl27aXCWeT3bk6veoaYrn4a8mywrUFbUydO2
         vLLLGigOZ4KXBuJs2ijVs9DLaWSZyifXypCjCAqfVqoyjevJlGxkZJoRLtPDKMUzvRLR
         qF6/yViqP/t+oZr+Ae85nTluz2nb/t2q2PifiaGdJvGq2HgTn1R+VGSYWwuVfR4kzlvF
         OhAVUF/EoqpyQy/cfNrr+4EQBrPOLQP5DtRfZhn0WHBMrm6EAvxxCijKAQ8knM4Qc/g9
         QP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNi3KQz/POpNMNa8i0g3dz4IYBAVeNccmdbqEb8Iphs=;
        b=8IH1weBEdybh0U4/OYzsHm7wCIzZIGyHp83JJQxTbpM2wyrV+FzfcQ7AmOS2uae6i3
         Fu7es85unlpJdiCmP+FC8vK7mz0lnaCWIzuqucZKEFt26izJdXFXB8MX1WIFngiR/hEs
         1ubyezesEONXgIjjGb6eIHjY1ipqs//xV5ZaiiZj9DKCnVenImPD+T0U5t3/paQLyMxD
         brGZX/JkUCL4luE7lH/IP26PTtDBHJvEbbs+EaRZ57vr3cDLdamMvyW0iaje43fuLthP
         SyWTbeytysFy+bf0LMg/RWfZigSwDaD3Hv4ETpiQQaXp/XD4PREGncsPHaCjpYWx5S5F
         ZWXQ==
X-Gm-Message-State: ACrzQf1A3qEvdTULRfs2mJA7CT3T8XmbZVeFPBMQMM7UOwn4TYQB+rK2
	tWygky67L9E4DV9O8Kuw3hwpGPAcJiVE0iFqmZQ=
X-Google-Smtp-Source: AMsMyM7N5DVLhJKvxvHoQ2nho0fLGQQHPbJ7h8H0hTHnARoBi9DH6REyKAbXG73dHf4DxlDWMYNiWqje+/IxlZQkT9U=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr28956384oae.262.1666368420816; Fri, 21
 Oct 2022 09:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221020223004.1665512-1-raj.khem@gmail.com> <CANNYZj_-7o3VNCONa1sTgscrWOZtSKy6iB1mL6pOT40wt5fTow@mail.gmail.com>
 <CAMKF1spz7=2NNxXj5w-ZAAohUz9ZxJ=d=eGvCg2N_fsKe1a0aQ@mail.gmail.com> <CANNYZj-0DUfDdJbnwZPc7kof90ZYGj5-8u5vuZtVH_dbUbSb6Q@mail.gmail.com>
In-Reply-To: <CANNYZj-0DUfDdJbnwZPc7kof90ZYGj5-8u5vuZtVH_dbUbSb6Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Oct 2022 09:06:34 -0700
Message-ID: <CAMKF1spz+swUnVW3=GdTLwd0xGNnuMf7F1NqnufGyk+eoTkPnw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Disable 64bit atomics on crossbeam on riscv32
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 16:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172030

On Fri, Oct 21, 2022 at 8:41 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Fri, 21 Oct 2022 at 16:05, Khem Raj <raj.khem@gmail.com> wrote:
> > This patch is doing something else where its mapping and broadening
> > the architecture to match crossbeam's understanding of it.
> > Here issue is new where it does not yet realize that some
> > architectures do not have 64bit atomics implemented.
>
> Here's crossbeam's own list:
>
> https://github.com/crossbeam-rs/crossbeam/blob/master/no_atomic.rs
>
> You can see that riscv32 is in NO_ATOMIC_64, and
> crossbeam_atomic.patch ensures we use the list, so why do we need this
> change?

Looking briefly over the code, my educated guess is that target names
are still not matching
rusts tuple uses riscv32gc but we use riscv32

>
> Alex

