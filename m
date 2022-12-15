Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AC0C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 09:14:40 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.129659.1671095671271412275
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 01:14:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QGp9uR85;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id z26so14669773lfu.8
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 01:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CVUj3VdAVPFGN3Yc1Q37isKaZ1lAR2BDleThOultbMw=;
        b=QGp9uR85xIZcN1I+zi5PD7CSzLNLoIfVzZqtP1jho2TvAcMnrNN820yRdhahVofiGc
         AUNjFxLiMR2Z6MKPR2E3bty5MXV1RguuPbYHElyWC+8ygGhFOTZQB4F4euuqghqPJ7pb
         /ffxRLsyoLS5QsHCTII92MTqCLr6Zqj92F63Ml58B5WuG3O0ihZZQa0z135MylyHIfLE
         hwasUVPK4nRkQu9Av7+C2wfw/WyCjLsQCiWP44H7RPKeiD8fhlyj3fg23TrxukNtT9TQ
         RAX6RnJUxggxomRAKDDMMTkFltgLBKtF3Z6UK7oZjl9yFkkZo+aLP4t3F40VAZyUUuzw
         Hgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CVUj3VdAVPFGN3Yc1Q37isKaZ1lAR2BDleThOultbMw=;
        b=zgSpGDKmJ5boH82hgbYh2mpqtVhHZeQFsl9+NcTZXmimwWLFizvrl+LAGsExRxItJ/
         Du+MFZvn4LP3aETYOgDl+HMLl/7S7g/aYuF3ieoJTy3HjDNxuBXh7IjqT3Wm9DbSD4a3
         YnUqx02MyuKPGWsYh+Mgw/h+nsAAXYvqWtShVJ4erLrKLfBXLUDOEC8E2EA5h0S62mKW
         c0wc+kjUK1iNMCnGM4rQuoitwRBFUKhFfxEEeA4+bebZveFgKOlEfN6NqIjX8eL5ZZRO
         FpNmMmgnqS4OXqxfJIGDA0Dur7sMV6a2VxckZvNJpUc4K9Z9QM87lZOnAN6P2xWikR70
         jS+g==
X-Gm-Message-State: ANoB5pm45qr3TBzlxrwkQHeKHK+R876L2BReHLdLfyN7bsXMCmauqpFK
	GjqVRLTdeCZ6S9kw/o0G9mSJJuROTOsupN43eWU=
X-Google-Smtp-Source: AA0mqf6dXZWW2thj0bTBBASeubZGwpoTOZql38RuKJ6bSBz8aM4eHCJuH7K3AypCaULeQ6uBMBq/FLEkJ5Qr13fsUR0=
X-Received: by 2002:a05:6512:2616:b0:4b6:ec96:bb9e with SMTP id
 bt22-20020a056512261600b004b6ec96bb9emr789386lfb.445.1671095669487; Thu, 15
 Dec 2022 01:14:29 -0800 (PST)
MIME-Version: 1.0
References: <20221215084546.125368-1-raj.khem@gmail.com> <20221215084546.125368-8-raj.khem@gmail.com>
In-Reply-To: <20221215084546.125368-8-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 Dec 2022 10:14:18 +0100
Message-ID: <CANNYZj_HhjCUekCyn41OVDf6P_UPrV8DcSv=Mf3z4ErcfzjF7w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/11] e2fsprogs: Do not use 64bit functions for
 largefile support
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 09:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174576

On Thu, 15 Dec 2022 at 09:45, Khem Raj <raj.khem@gmail.com> wrote:
> +Upstream-Status: Submitted [https://sourceforge.net/p/e2fsprogs/code/merge-requests/4/]

Development is happening on github, please re-submit there:
https://github.com/tytso/e2fsprogs

Alex

