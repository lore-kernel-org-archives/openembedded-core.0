Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1522EE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 10:29:53 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.7895.1692613789474520190
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 03:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QjArvNni;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fe1b00fce2so4603922e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 03:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692613787; x=1693218587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=unvj+P6IXztBldnCu4EAjI3Fusvc8/+FWGB4Y0n/hbo=;
        b=QjArvNniz35Jl+78IEwtXE4wCddV5GI1EVQ2YfK66CoxJPzFw35EmtwziH2pYVzA5n
         +L/fT2zH3syHfgkxVvDJNNs9Xw8rbLfwcOUP62q4a702M7PK9wQLetUTo5WdtZww6JJk
         EeQCk82s5QMghANp/j8M9r/O95KFWd1QKFchyWQ+kcnrtVgjtN9EWisvjRWZIWvx5Aha
         kE4TNtlXQTX6q3GuF9aonjiVdgSOqqebUHV8LkK73FctjiAqJfE2NmQI39E5G4RV9b6R
         BOEc4iaampEzEXksj6dSh573WizW5FPqQLX5LcCdgvoBteiPDD8s2rGWAm1wntjEM5ra
         fEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692613787; x=1693218587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unvj+P6IXztBldnCu4EAjI3Fusvc8/+FWGB4Y0n/hbo=;
        b=ccFfHyTm3p1Mev8EHUM/zUr55qBw/fMRfM1M3b1jdHxSfN3xkQwUdrfogCtBNs2z0E
         ee+FhuUExcFIemrYI6GPFH00agF+gKPGYDcyDWl9z0u+QOSk8Eq37Fp9mVHsvqHVqPDR
         2Tfo6Sb7vuyUpyxikmatKZKcv7aSdXeD1AA2epPr2S8PKIPGKUUpNGEI4Cw//4/EYn5F
         byIBKD0uL/fn2uyNUJWLuQthSteBvjfrgP7Xx4rIn9SfDZ8IiB2yaUlB9Jvr4RM/ptIZ
         2iCMUitDBSJcJZUnDpL4rOfL6ovY1PhsacjNwIk9bl4Da3Dd/MiB4eNljvelFwUeb2+i
         04IA==
X-Gm-Message-State: AOJu0YwSB1J4Mv6JzcZleqGsJB2bJUse0yKBubFmjFLTV/UvpB+nMb4e
	pQ73FtAtBRPLMAE71Uk+KG12Nz+MA1rTib1Z7hg=
X-Google-Smtp-Source: AGHT+IHR/96VNGlBPfkBgAFfV7u2gJ4cz4GluTJthPS7l40IAs/pQxpuUrrQrMlkzIIWKt1O9Q/anzxmjaGAr3Uz8bk=
X-Received: by 2002:a19:6d1b:0:b0:4fe:f2e:6cfd with SMTP id
 i27-20020a196d1b000000b004fe0f2e6cfdmr3929182lfc.62.1692613787124; Mon, 21
 Aug 2023 03:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230818114413.3236712-1-Markus.Niebel@ew.tq-group.com>
 <CANNYZj8_T6g2Y891K3Qm0s2H5rkhaZV6ewh=m57HRDpT6W3uzg@mail.gmail.com> <d61668104287bd42d63aa28b8ef75ef946dde1a7.camel@ew.tq-group.com>
In-Reply-To: <d61668104287bd42d63aa28b8ef75ef946dde1a7.camel@ew.tq-group.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Aug 2023 12:29:35 +0200
Message-ID: <CANNYZj8m1Mi7=Csk-N1RT15Ba2EpZq9_D52-iDdEKCj_b1M3YQ@mail.gmail.com>
Subject: Re: Re: [OE-core] [PATCH] wic: fix wrong attempt to create file
 system in upartitioned regions
To: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"oss@ew.tq-group.com" <oss@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 10:29:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186429

On Mon, 21 Aug 2023 at 12:26, Markus Niebel
<Markus.Niebel@ew.tq-group.com> wrote:
> > Does this mean there is a missing test for wic? Can you add one?
> >
>
> sorry for being not an expert. I hope the basic test I will send with
> v2 of the patch is usable as a starting point.

As long as the test fails without the fix, and passes with the fix, it
should be fine, thanks. Can you check the former (i.e. that it does
fail)?

Alex

