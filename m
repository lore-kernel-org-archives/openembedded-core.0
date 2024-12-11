Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6E5E77182
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 11:25:14 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.8619.1733916311102205937
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 03:25:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CHjiS1cP;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6d8f1505045so35903896d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 03:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916310; x=1734521110; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eaOVrnIX0wjo1wAOGemblZ+cwf8ASpFXzYm5M7CAsyo=;
        b=CHjiS1cPmwUribBtiSImWc6lk9426CYxI2+69uallnsojc8sBXgeDpcXQbfT1MC5qV
         co+MKVOIh/nULmYo6SBZcoTTPviXi5H0HnvZCTUmv+XgkLbZCagg2+kwtx3SXuHbXXYr
         26xk+aUx+feh1e9PM2sZXqQ8DlI31zhDSJ/kUHk1y1gupBoRWDuiOq8beJCFMDYl90p9
         hz3YW1X7qlVypTIxp+fT7LfErJOQSAT7GbOjd/Rujy0I9nuj7Xr30CugGxhWs5jGvngd
         H2o8M4Bl22PMZT4uiv1JR3sKWlfh92N6Ye+o+ifizLhR2xnauhL67YCWNqBQlOs7Tc7n
         uH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916310; x=1734521110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaOVrnIX0wjo1wAOGemblZ+cwf8ASpFXzYm5M7CAsyo=;
        b=Ut5fkCXpZgaSBdA3ABQpuPHiKBxrgtmhShRfn1P9ZTnAd/33sWc4Xewtv4oLQ2iTgS
         uNMtaQawMAPPBb/0DqVeUBFULkxyPSjDS6FuMYjYF42kaJXN01YPJa5S7DJgHM1oBUzn
         7+NgGK5W9eS9yYFoUlW8OR4LfPl/OMFSeRTWlC8vWss7NNBzwlR/YMy8XkxJw+BA8g/X
         qtFhgyqEZpHPb10wQJjdMgPPzfQlfwhXWJg/NxDGvLY4n8rFL1XTfsVaPZJXw0y8ZAPd
         CzMsaOabypD+tZRGmpKHlLBCfJWC/lvSoW6fT/tsRxvbxFL4N9MFa2ZuGB7/Dj8J1dmH
         o79w==
X-Gm-Message-State: AOJu0YyH7FqtOG5d8ywhTXx3wQjycdNnfD57hUCz7cA0l4iylQtHRtOb
	saT+oCg4tcjNK8wcyrdyxRQa/l/vrS7w1dVZNOgtHq9fNsYiq2kZOKWhO1wx+liIzOHF37mrzGb
	06Zj4WG+it9eUUmskgqWI/b54sBg=
X-Gm-Gg: ASbGncs395/6jpawZvUIjxpUTjO7BiEZLeejbWOmrOa5YFMdMDyedXlLD5F5tuz4FMm
	+Qr/BBSU+kI0UjRxmTKyNhcrrKTlt5s5UC4jG+mSBWHQMh2u25PFHp8XlmiKgqBCDNPIbTg==
X-Google-Smtp-Source: AGHT+IHDMTOOe1wS5SK3mWTR4GwAh0sFxHfgnvQpCju74W/x1/5DY4ue5KUsbEELfFybbNhAcNFGTwgrskEECJXRa58=
X-Received: by 2002:a05:6214:c8c:b0:6d4:fff:f9cf with SMTP id
 6a1803df08f44-6d934bb0addmr49538916d6.35.1733916310179; Wed, 11 Dec 2024
 03:25:10 -0800 (PST)
MIME-Version: 1.0
References: <20241118162643.1423409-1-alex.kanavin@gmail.com>
 <20241118162643.1423409-3-alex.kanavin@gmail.com> <c799588bada27abdf2b412115868c5b84c24a0e2.camel@linuxfoundation.org>
 <CANNYZj_ONOGam=9um4qqqAc_D0gQHrQML3a9eXBEgHLCiRtM1A@mail.gmail.com> <4254d23ae9ad100e70f199fa4949ce00bfe7063c.camel@linuxfoundation.org>
In-Reply-To: <4254d23ae9ad100e70f199fa4949ce00bfe7063c.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Dec 2024 12:24:58 +0100
Message-ID: <CANNYZj-Ox6t8yV7Bh2NePmseYCW843Z5ozq50y2Tyoa=GeDPyg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 3/3] bitbake-config-build: add a plugin for
 config fragments
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 11:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208575

On Tue, 10 Dec 2024 at 16:27, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> > If we start going down this path, we might as well write an
> > interactive curses UI, and keep the command line output 'flat' like it
> > is now. I'm also not sure what is the best approach, we'd need to take
> > fragments into practical use and accumulate a sizable amount of them
> > perhaps. Such things can be easily tweaked from experience.
>
> Having experimented with curses UIs, they're a pain and don't really do
> what you hope/think they would.

We might be thinking of different things: my suggestion is that
interactive 'kernel menuconfig' type UI is worth exploring for
fragments (or bitbake-setup, for that matter).

Alex

