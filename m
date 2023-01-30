Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5DAC54EED
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 09:08:37 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.36961.1675069707956624203
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 01:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KWq+ya3c;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id o12so11862363ljp.11
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 01:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ALXs/XXi5Yw3wPoD+fONh5Xh2p2uqDg8Df5yqF/rtj4=;
        b=KWq+ya3c82v8mYu/S4ScaJiNTtv+Vwm6uuIyyPeEIVW7TgO216EKODlSMz2rRY4KA7
         Xy/jF5cHOitbOevc3IVLW4Bca+wZHbKWw9D16YeqHqc7u0c095F2Nxk5UDvw0Bs6wL43
         +ZhsdEAOg0z+xymLNFIQJTbcnrBP2nafLYIgg3M1V/AQbzz8Sy0YTmZhtLZPUuy4hY3B
         O3TcX2chmGuVpb5mzcYLgNO7AiL5dk5Cw+0V6+8DiG7xXQUGBLqQngvsleMSvXkiy9fb
         R+JMSuMkKYupnm4BAW6iqioHTWAiQXaMGlqfq0YJaXQ/TuoTnx1ZoEM5qeiEQwoH3OMQ
         nizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALXs/XXi5Yw3wPoD+fONh5Xh2p2uqDg8Df5yqF/rtj4=;
        b=QjbA7kiWV0V0qgFaq6+wycB3oq9FmulOZD9CWcqn8/Lv+vlQXB4XeXIsUy01q+ZVrh
         vIh4MS8HysZsS/cRFbaClsikPcXYVw1ny3aRtfqXClWkOJM73T0MAa9IhnW9GmUphahT
         rvw6Eherc8YodBS9Au8Ev2PQbJZvB7wqaHAoHqjgB2mqFHJARZtjD9xqhYwFBH6gtzoy
         WSL20CBmBQtMNitf6XTHugRPbQBWdXpnBdWzrmsAqab9iDNNQ+bQJt3jioXClwrjJ+d1
         /Ko/K+dm3F66RlHP8mIEsMAKlH+ZPfNNGeMOMQF24pC0OpS5Hx/zK5JxhswygphYbghX
         mbSg==
X-Gm-Message-State: AO0yUKU76ujc7RZERbCaIVTqHxKF2vJoEvNJXI+RDmmawsvHPUYG8taO
	J9Slqx6oVOKO3YNiGE0a9qGGdXD2F/onkLRtjrc=
X-Google-Smtp-Source: AK7set+hkIcXZtDWWfjer1bnwiT7yWQ2iGoGMdq/0d1mbCWnBdPZ0lB5pibnUgZTIMlhWkChmqT0Q6Bm9cD2kEupe6s=
X-Received: by 2002:a05:651c:232:b0:28f:7d5c:4507 with SMTP id
 z18-20020a05651c023200b0028f7d5c4507mr1242830ljn.162.1675069705660; Mon, 30
 Jan 2023 01:08:25 -0800 (PST)
MIME-Version: 1.0
References: <20230123081621.7517-1-ravineet.a.singh@est.tech>
 <CANNYZj8pETWuN8FuyAke2rZ9d2TH6_Ly0goWMnYHuZaYj7xetw@mail.gmail.com>
 <20230125142035.u3ogfurrd5vomuiy@serber-ng.hemma> <CANNYZj-CYSqWju0RbpDkDnpZ18k3qit8r2czQ1e3JoWLx2=1hw@mail.gmail.com>
 <20230126080308.auqnqs4t2rzrynog@serber-ng.hemma> <CANNYZj-htG+xS+fTiE8esuJ8B9DonHm5G+VfMxM7zOVTN6R-Tw@mail.gmail.com>
 <20230126120741.ukigfn7yshbaon6s@serber-ng.hemma> <CANNYZj8NY9RVd0wTxV97eiUvn8-vxGduVDEi_WSZuHMKi5R8=Q@mail.gmail.com>
 <20230130082527.jgp4m7uareflgbdv@serber-ng.hemma> <CANNYZj_=pLpH0+SVZE2DezpuPVkj2VjyteLKFYV_LuJYCPKZZw@mail.gmail.com>
 <20230130084934.rzncscvy3mmol4xc@serber-ng.hemma>
In-Reply-To: <20230130084934.rzncscvy3mmol4xc@serber-ng.hemma>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 Jan 2023 10:08:13 +0100
Message-ID: <CANNYZj_HXLnhbv_97AcE050JY_QMnEsL-xSyo_MEUBte6qQQbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gnutls: add initial ptest support
To: Ravineet Singh <ravineet.a.singh@est.tech>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 09:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176483

On Mon, 30 Jan 2023 at 09:49, Ravineet Singh <ravineet.a.singh@est.tech> wrote:
> > Those local files are provided by something, so you should find out
> > what that something is. Is it gnutls source tree itself? Or some other
> > component? Do we have a recipe for it?
> Yes, these are from gnutls source tree itself.
> I did not want to have the logic to install these files in this patch (want to keep it short),
> rather later as I progress in my learning of bitbake magic.

That's okay, but making the test set as complete as possible would be
appreciated. You have the knowledge and context for it in your head
right now, and it's going to be harder for someone else, or even for
you later on.

Alex

