Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA59C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 08:21:22 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web11.17859.1646036481593997810
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 00:21:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DdGvx2wY;
 spf=pass (domain: gmail.com, ip: 209.85.221.179,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id bj24so4726669vkb.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 00:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZF/xRU1R8r2ybIoY/WQan6458FNwM+SF6aRQFO0cfDk=;
        b=DdGvx2wYZf+HKqbI9IZuZZbdoZ0SvesX0u9Ii7kFH39Nk1UGEiKSpjYz9byezM0KCo
         I/utDVpPLfrPuwKmGvCyQ1DV03M1FJ2n7S20A+uyMHv5BhgEHTvPxwFzAGX/6U7PxGvQ
         DP8hCr1rFFm2qoSDPm1MQnj3qwFHzZjakWTF46gejEtZCD8SZstaskk4aq6TBTnOQpv1
         uZlT1pP2NprmKylczt2lluPXxdCnapRfDnuJhDB+gE61e3+4tSr/qigivhfRbHTq1EJf
         5q1XvI3pyl7AyhwkOTaLv+NboobYXFBtOFdK8iuInGQl1UI8b5zXO3qD/bqBaEi6AVD1
         37FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZF/xRU1R8r2ybIoY/WQan6458FNwM+SF6aRQFO0cfDk=;
        b=b1JVZcTp/OXokkUraiYFbZCCfsK/W9oz9jyOTxKmRblK81ZljMWDm3UXehw32YCjf4
         XXtNRW39hb1SUIj8wGWHOyQkjl0HO+5NqEnezy5Qo1mNTYScALlEWLb4ljGsuQkOEkza
         VqB8jF681GwAsZbynrsBu7XhdISvcUx0Gelwmp1hcahvqgrlL25oWhICrSyCfS1D/BXd
         Tt3FUYRis1fxibSvlXvhLbM06Xh83nWJ1nL3o1wyD89b5nU3MIfpmd9co7Az/ES3W7Nf
         QUe7mGWHhZLVzWeuSpyewLE8I+x+XalGFqhQrDVR5DsD/KoFHCcuTzlpjQ4crQ94UCLI
         PKjA==
X-Gm-Message-State: AOAM5309kOgywxCy9EctOkfJG7CDJxBE3NlKU/XpqnLS3zr35ofKLLJu
	hBS4kZ5IqE0XpYF0syj2T6FG+4aR7t4JE2vk120=
X-Google-Smtp-Source: 
 ABdhPJxy3l5PWE5XbcHnTG+xsIRvNcnVgxjA5AAPaRRR/qGVXe/wiTGZFVoCBwlNGtYSXVcUk1mwsiNd9IocFyjwmjE=
X-Received: by 2002:a05:6122:20aa:b0:32d:4894:f680 with SMTP id
 i42-20020a05612220aa00b0032d4894f680mr7842342vkd.1.1646036480603; Mon, 28 Feb
 2022 00:21:20 -0800 (PST)
MIME-Version: 1.0
References: <20220222035234.463162-1-andrew@aj.id.au>
 <20220222035234.463162-7-andrew@aj.id.au>
 <CANNYZj8uEbibb6POcuhc+fEvViJCXb8_yAC28wMyGSgiAJA35Q@mail.gmail.com>
 <e77a8568-cc54-4706-84a6-718657532662@www.fastmail.com>
 <eed550ec-96ac-4dd4-96e2-ce139db13a5b@www.fastmail.com>
In-Reply-To: <eed550ec-96ac-4dd4-96e2-ce139db13a5b@www.fastmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Feb 2022 09:21:09 +0100
Message-ID: 
 <CANNYZj_21ZYm1vz33FbbmVZ5md-GaQEVpvbrtCNkbh5Ck-0snQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 6/8] rust: Mitigate duplicate sections on
 matching architectures
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 08:21:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162451

On Mon, 28 Feb 2022 at 01:13, Andrew Jeffery <andrew@aj.id.au> wrote:
> Okay, so the root cause of this was I was setting RUST_{HOST,TARGET}_SYS
> to "powerpc64le-unknown-linux-gnu", which matched RUST_BUILD_SYS. I did
> that because rustc seems to be quite unhappy when supplied with
> `--target ppc64le-linux` or `--target powerpc64le-linux'. I'm trying to
> understand why, but I'm struggling because rustc seems just fine with
> `--target x86_64-linux` despite none of `ppc64le-linux`,
> `powerpc64le-linux` nor `x86_64-linux` appearing in the `rustc --print
> target-list` output that I could gather.
>
> How/why does `--target x86_64-linux` work?

I think in the context of oe-core, all targets are custom ones,
specified by writing out json files and directing rust to use them. So
you need to do two things:
1. --print target-list is useless and irrelevant, as it only prints
built-in targets, don't try it.
2. When there's a problem inspect what json files are in the sysroot,
what they contain, and whether rust is able to find them.
x86_64-linux.json is made specifically for building native items.

Alex

