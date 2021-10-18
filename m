Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6FAC433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 07:43:15 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web10.33088.1634542994013674070
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 00:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DcNB9+vE;
 spf=pass (domain: gmail.com, ip: 209.85.221.171,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id l20so5339364vkm.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 00:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lwtb8RWThr0vZyPjlJSpyb2L7e9FVj1YaxdBK5jGo4c=;
        b=DcNB9+vEuFj8m4XgjBVOAHFTxWH5fi3aFgI2mrw2aZsB6oNLiMEMbg4mORQEYniHrX
         9zEpzwVz2XbvvkWl0dlc/G2DzHAccpkaPH5E161czov28HXKekJEArjGHpJVjBiYWP7/
         eZB5BGgYZPmLz5CDKY1f6+rHtloZXLe42EAfuxAFN1nGT7hQzwN7+Q8Q+wtYzE3f0oDv
         hX14lGFR0vGxdvqWLz/6AuXU2HbyP5aI0mTmcsLA4riAUOCFKfJ29GCnWZFvo8lIVfbW
         NOPjRi0zj3A26ceZ5sjcv6uSDHIVH4RxPVNVitde1+Cj465ypdpKvLHhC7NgZeUy+IAw
         wqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lwtb8RWThr0vZyPjlJSpyb2L7e9FVj1YaxdBK5jGo4c=;
        b=oTuEjHBbY+cjbGZKZ7vHpTrcu7EV7gLCjH4i+f9nUQ0gebBo2tT389A4kwHAdFNVn0
         5IBwMYnEU4TZqJZkI/u8JsdMBjFbedtsSyR9jHIA7rEiGB1T/2Zkjf13r8pYg2KQ1ovV
         AuttV6ZDSo2CMlIOOiHZ2cioqKBBVUYOaa7GpA/j0y6jTRp9O4Um8BjdD/kGuoYAQCFU
         7BoBmgx86HCtCB0HA3nU5z5ptvcOfC8XA9WwabBHV+IQ34er1k8MAFxhaznp153qIdIk
         B89VECfXAh5NYQJm6JA7JMNnQd7xmEz1Bw9Sa8pSxyXqPyPNxKRhrwIjx+T4uJpIDKJE
         s/OA==
X-Gm-Message-State: AOAM530QtXfnpjrtqks4KrxW4/cYnp4CV47t8GjlZmiGw4Asys30qsNA
	Kul5TTroaG/WGuwpxRU7/MDPbRR9h+X8aoRJVfo=
X-Google-Smtp-Source: 
 ABdhPJwstcnTKO4+icndzPEJ/H+Sbs0Er941+sukiIIeQnCvyMQm+De71aYnmJCHWXUUqPHxX42kwo2JmJusaxumYHA=
X-Received: by 2002:a05:6122:208c:: with SMTP id
 i12mr318272vkd.22.1634542993059;
 Mon, 18 Oct 2021 00:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210915114618.157245-1-pgowda.cve@gmail.com>
 <16A53DBD300C0C8E.4388@lists.openembedded.org>
 <07fc5dc3d216f0fa6c081506aa92701508604bab.camel@linuxfoundation.org>
 <CALY4984U1txY2y6yJQQKts20Hb6x-86gtXhHx9UoEeDxF1yyTg@mail.gmail.com>
 <6473ab6832d9e7647a8921bd8a7735394379f12a.camel@linuxfoundation.org>
 <16A9D78EAA10C9CD.7289@lists.openembedded.org>
In-Reply-To: <16A9D78EAA10C9CD.7289@lists.openembedded.org>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Mon, 18 Oct 2021 13:13:02 +0530
Message-ID: 
 <CALY49863eVi2-HK0n0xJsmAWNtw6PD15r-wLLeJ1Z8CQ4bdfBg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] state/staging: Fix directory not deleted for
 race
To: PGowda <pgowda.cve@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org,
 Randy MacLeod <rwmacleod@gmail.com>,
	umesh.kalappa0@gmail.com, Vinay Kumar <vinay.m.engg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 07:43:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157051

Hi,

Gentle ping on this patch.

Thanks,
pgowda

On Fri, Oct 1, 2021 at 12:59 PM Pgowda via lists.openembedded.org
<pgowda.cve=gmail.com@lists.openembedded.org> wrote:
>
> Hi Richard,
>
> >> we may need to account for musl/glibc in the recipe name or it's
> >> workdir if it is going to be "picky" like this.
>
> Thanks for your suggestion on fixing this issue in a better way.
>
> Please find the patch posted at the following link as per your suggestion and
> let me know if it's fine.
> https://lists.openembedded.org/g/openembedded-core/message/156513
>
> Thanks,
> pgowda
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156514): https://lists.openembedded.org/g/openembedded-core/message/156514
> Mute This Topic: https://lists.openembedded.org/mt/85625195/6402864
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [pgowda.cve@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

