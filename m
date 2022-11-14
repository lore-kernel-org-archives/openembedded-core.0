Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096E1C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 13:51:00 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.5659.1668433853910801438
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 05:50:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GWl0vsPO;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id r12so19383908lfp.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 05:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NgFn+1AKDlKc7VbXqVypSXlsXTWuNAYYaGumu45h1Yo=;
        b=GWl0vsPOGxKTLulWfT9MuQu7pxbNxtx+marZMvL9r1WRWVaV7Zju0s9uKzJ5BE+8zG
         J+LbTSunZseKXOjg1y+KNfZvZrL3HlfXsa+fgD48VvQGu3CdEcKzPNUgHBnCUy2BaUL/
         WVDgPPmis+loyMLGKNehk6cEjATSifjg2zOeG7lWNPU/VKiN4YMyLkggriE+KJJ7MA5u
         iVjLHZZaE4QnpMbFFASsLK3PnmPlbHCurrpOkHUOPgOFsFnPXU76tjwz+piyIw+kNetv
         OESfSSeegfDypxTh2feMVjaJcE+mTQBgJAoxospJFm3wwqjS/q+koJC+S0pykkMH1mLB
         pkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgFn+1AKDlKc7VbXqVypSXlsXTWuNAYYaGumu45h1Yo=;
        b=7WSdBHHhxtPf+nI/Y+nZhzgKlrVpOdIQKAm8WjF4xYOAnPeaMjERO24av6qTKnVsa6
         GbFiQt7KaxHij1fAaGbOJxop02a6v0u/j/JUhhMM8cF6Qz4bGzBQA6skTlI7YbLzKcFI
         TOvKeLplQKo65zq1BejbfgqY0jKS57awW8iKGO3lLzRY6hcS9FgDBk8x8jd1Y+Wdoxtk
         xM0ZJuNzOIhubHU1DQlanI7l7luAk4QoB8pLHazqZnXTgRE3HS+Ak7inzFXIoFBnFERt
         TwGyjMuZqGWf5hK9RBljbdsG/E7eUHVLFC1mZ+so1N/cxp+fMuiG9K8XSleBtdmpS4EM
         7MUg==
X-Gm-Message-State: ANoB5pkib6vxrRHb/gfmgkSig7sPO/wzuvQNvAZ//A3BOgo+j9P/rMR4
	TlGIf1tZkoFDis9SubAawh1RzGcwAizDnfXHSyw=
X-Google-Smtp-Source: AA0mqf7IqP4SAW3WXbakmfbXleMuEskPWDt/qLp+V0RXcIezfm8cvPxSopniOfHn9/B3mlcFVEju2x2Xj7ifkH8isvc=
X-Received: by 2002:a05:6512:2203:b0:4aa:323f:e850 with SMTP id
 h3-20020a056512220300b004aa323fe850mr4144371lfu.492.1668433851853; Mon, 14
 Nov 2022 05:50:51 -0800 (PST)
MIME-Version: 1.0
References: <20221114133504.2392154-1-alex@linutronix.de> <9417858a6829fc4dc81546e94a78542fea51989c.camel@linuxfoundation.org>
In-Reply-To: <9417858a6829fc4dc81546e94a78542fea51989c.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Nov 2022 14:50:40 +0100
Message-ID: <CANNYZj8nz0udm2vjAp3CMV4dCKC_0ADNy8FB_mCEXmYr4deM3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: do not rely on native llvm-config in
 target sysroot
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 13:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173243

On Mon, 14 Nov 2022 at 14:41, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> The trouble is how many people are ever going to check whether the
> output of llvm-config changes? We really need to work with upstream to
> make this util cross safe...

Yes, by making it a thin wrapper over pkg-config. I am completely
baffled why many projects, llvm included, have some kind of lifetime
allergy to pkg-config.

Alex

