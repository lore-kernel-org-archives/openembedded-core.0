Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B2EC001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 15:20:22 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.50424.1690212019433263534
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 08:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kU2VdL9m;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4f95bf5c493so6647812e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 08:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690212017; x=1690816817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61OfBRWgZWiuKw6UlWS2gJchzSDSxSywzcwo7maPQSM=;
        b=kU2VdL9mnhBZ27JQDlvzzoIFHr30SsBFh6YLhesViURdqhCJqlEcaZk3fc4lAHgI9c
         aRvSELueqaRKz4RejRs8H+a9W+aPBpgSOmw14QBO2xWPlirgkhRao9NwXf5/w9P2XecF
         H3hKkSzRHJ/fMn3FyucNRc9QTdoadTd24XOrsPzqgGe3S+qu64Veu9Wg+STHMhfz3+s+
         UrFiSNwgg9UpTcx2hi1H+PmD0orAdUPnjqTHr9zrlLiAZsud5iKo2jUBbSxL0Qyl9ZS+
         IJMq5v7z/8CygWW4chIdweiUBB08xyk4oo0kkD8mxlObYrPknZ5ElHZ2grByOWjNSmAx
         /QWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690212017; x=1690816817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=61OfBRWgZWiuKw6UlWS2gJchzSDSxSywzcwo7maPQSM=;
        b=A0b0ZQ3rOhwRRc4+FXdePGkswV0LnfvpbkHC0oDJcP3wQKGK3VrEwJLSyKs0u8jvUn
         TNtxxYyds7xn/FGyzDVhdHKU5sqdY870Bw+MnMweSHu/Z0cJ9759uUw15DQYrA3fu64e
         fU/FVcUTEfZ1WxZZ8GzEFjphVPhUjpuevQrZZA2cDW6H0l5TY4ps+NPtvV+roP9GWG3K
         caiA6UkX4RSPPk7VqucNamTg+/m9E5h4K1eaq9P3xb0tjH09+rtA+Gyp0zBVn0r1IfHq
         lZRcvNda1nNgv4ervn2xXFueXKYXoNQU5nAm7ZKhjRuQAglOLMvTp+xyNhNjpJ1VWEe9
         vvUg==
X-Gm-Message-State: ABy/qLZHmzQmUfwpMxNt3QwS/cXxednwi65KhA01NVliWbOI1v12NmCn
	LXAuYwyFgV69dMgGuIgDNB9SPyPPgLjvc/cIHeU=
X-Google-Smtp-Source: APBJJlG95552DxzhTwnts/eflLop75phInxTxwLdftrYXL8fbQV0TewMCAvJIwRvcNj/94Zo6f3wVgTeNf7UlK9mPJM=
X-Received: by 2002:a05:6512:3b27:b0:4fd:d016:c2e8 with SMTP id
 f39-20020a0565123b2700b004fdd016c2e8mr3598178lfv.43.1690212017292; Mon, 24
 Jul 2023 08:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230724123529.288581-1-zboszor@gmail.com> <CANNYZj9FLbQxnbhd-Lzcr5GB3Ycf+35O1eADZ51EuVNg-eN33A@mail.gmail.com>
 <CANNYZj8HRnoCSBax5VzHU+xU+=XqeS3gF_ys_jFzJYs2+MivwQ@mail.gmail.com> <3040946c-5697-d6f5-567c-7bb85f8e0c49@gmail.com>
In-Reply-To: <3040946c-5697-d6f5-567c-7bb85f8e0c49@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Jul 2023 17:20:05 +0200
Message-ID: <CANNYZj__RUD=T7qgBpAmNs5K9Qf1hgFkjeqnsm_04yAQJkxQow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rpm: Install and/or tweak rpm macros file to
 make rpmbuild work
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <Ross.Burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 15:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184795

On Mon, 24 Jul 2023 at 16:59, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
> I'll rework it using a template file.
> Still, sed would be used, but in a more readable fashion.
>
> Will this work for you?

What would be preferred is a patch to the source code, and if we can
submit it upstream, that'd be even better.

Alex

