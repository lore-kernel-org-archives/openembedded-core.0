Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7845C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 12:17:47 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.20609.1702556258410557829
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 04:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fHgyL+7v;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c9f84533beso92178881fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 04:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702556256; x=1703161056; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BAUl4QBWP/ZYI/SUFRAgC3YLJm5ofWrBmSqOsOWNEPE=;
        b=fHgyL+7vIlLSruh4M4CJW0GDvnEKXk5qcMS5FqbpNQqWRiNX/cBNyEetggUOv8F9Rg
         CQZ+v8CXwEkJV4t2MV3OovUXyY7otyjjaY+CFd/TzNSAX+xrKa6KdBOuPp9vaU11m/XP
         oGlVO16OUgxxfNTcQUmX4KJQA31o9D0/q4WIv7hLRPlcYK8uKiiwfK/ykQiWEkpXAqDe
         WbWt0oDd+NF/dTysrvFKoOLmO/gC/mypkgiLApzyOPlR5wapOufI4Vsyq4GAf/uGGp3z
         Mty5ledkjSioARyGHc9WBpzC8NpPh6BOUor5/iRcyytPHu6UA02z8Tep0+BNHnaXGZ8p
         LCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702556256; x=1703161056;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAUl4QBWP/ZYI/SUFRAgC3YLJm5ofWrBmSqOsOWNEPE=;
        b=QZgzQcHcPhMDTP+NeIT5FRqKaOJsDe8mSx1zWiOErHD2ZJtJ3RDnAnY4r6c35s59xN
         icbbcI6i88m6hs7iF5T2m9/dcU/AJKxV/2glMK6KwgPIBJLiMHwU6PHQ8TMUrQX5z+IP
         Ov3rOHN0HQyEI1Od4d150dBIb8ZeQuA/Ynnzt2O9hD7uw3POzfKiIMUkM5wveCiLM0gA
         T/kPfbSag9q3pN+kIMV6MNcCQLuVi/w0irZTv/dQ7Ah5H9V8SBjRWbhgNBzomY1lf/cC
         krghWdy3o6y17hQfDJSiWBqsgh91hkmIfriPft1dIu+yJtZ8FEKzZkJX7ECUdG3POZ3J
         gWvw==
X-Gm-Message-State: AOJu0YzHNqABvRun+jsh71c3K9EvsWYE62m0KVnEsNsq00aqWPF3HEUr
	wbKUugr+/lY0uMF+utLtT3Q6RM1YI4Bn4rLrJko=
X-Google-Smtp-Source: AGHT+IEREY02VBIThoPP2jNLdS10QuMV648Q8dXMFycWv+u54yhNtnq++cOcU1SGWisC3euSiUTgd2oYJ/QPw0goVvY=
X-Received: by 2002:a2e:9947:0:b0:2cc:42db:e79d with SMTP id
 r7-20020a2e9947000000b002cc42dbe79dmr411520ljj.71.1702556256527; Thu, 14 Dec
 2023 04:17:36 -0800 (PST)
MIME-Version: 1.0
References: <20231213085657.2552223-1-yoann.congal@smile.fr>
 <CANNYZj9mWiEZRf_snYJ0eRcirn746GbkZSekLV3-XVcHjaR6bw@mail.gmail.com>
 <6cfb111def75c0f1549e7f004deac4e8a44365cf.camel@linuxfoundation.org>
 <CANNYZj8iD+LQRz8Sqb=QbYEXd6W_rnXz11pEVmzk9mGFKywfyA@mail.gmail.com> <7924018e34e7e6e76d5e1be046e8aa65481e15af.camel@linuxfoundation.org>
In-Reply-To: <7924018e34e7e6e76d5e1be046e8aa65481e15af.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Dec 2023 13:17:25 +0100
Message-ID: <CANNYZj8bin4UjXK=gj-aR35t=ajQmNFsD8LKsiX_7x2-z08fYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] strace: Disable bluetooth support by default
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org, 
	Tim Orling <ticotimo@gmail.com>, Martin Jansa <martin.jansa@gmail.com>, 
	Ross Burton <ross.burton@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 12:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192361

On Thu, 14 Dec 2023 at 13:11, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> I've wondered about this. The "prebuild" ends up quite slow as it would
> involve rust for example and when I last tried this, it ended up being
> a pain and just increased overall testing times even of the overall
> load on the AB might have been lower. So I'm really not sure. I suspect
> it wouldn't help the pain points as much as you think as there are
> other sstate reuse issues at play too.

But is it worth experimenting with it anyway, to collect some data?
The more we know, the more we can rule out.

Alex

