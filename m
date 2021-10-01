Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C5EC433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 07:29:08 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 by mx.groups.io with SMTP id smtpd.web11.4754.1633073347273402046
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 00:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P39OPIlx;
 spf=pass (domain: gmail.com, ip: 209.85.221.169,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-vk1-f169.google.com with SMTP id f73so4012061vkf.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 00:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xFHTA5OnGGGxeTlXT/MIfvBlCuyCTHkyMdO3h0sskTQ=;
        b=P39OPIlxKeNO5hRmV2wIqAEkjeTgVaVL/Yl7FsEZvwB4S3RF2sX869v+gZjO7sdZVx
         B57i+Z9zrmwHsnnDVSkf0eImrU9MXY1WAD8g0h0lgcnKVS9aWwyhjWilos5WGROYDnJi
         PsSxOscFOjqNcIpnZKgr3csyts6p61S+wahcTIzMP9eA3bb6RlyuB9bk2hD+mXyh3acu
         DC/CwGYJO7POiwp+iIaWzmGET75/GW6N971tCU7SbUvSPc9OIG7hh8CVB5kMl11sfM3A
         DsqQLkIYTpodb0kQSe1OTAwuuScoVM00LjwJgYuI7fY/3SZ/afoED899XBicora4F5SD
         L7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xFHTA5OnGGGxeTlXT/MIfvBlCuyCTHkyMdO3h0sskTQ=;
        b=TtJ9PzG/pVXsDRKGu2UbIcZL1O22dzcK0GuURLJFbGXfNNnbmMG3OcVS0O9VWIlFq9
         y1yBt+YinWEF7iOj44QxoJPA70bE2SwrybR/1ljgjApJM+nAzSVVeanTfdIYk4z2dEHE
         JybchuE2MLZqbPD7dku9zfd2a6LjJ2mxUkE9HUdWtLYvJCzV8AYuanmLSrW02i4hOfDZ
         GsRDAPIGiqjCCf63tANdSIl/RTRmw26HBZpBji8VLcqzkZuSAoDsoNmAa1tuOi91/osZ
         SVQ9QewXzrP/OhTGFTNKQiLCDDHmQiLykn3/GtiK/uCnmO6Pp6MhzUzJjAIh4/qPsY+g
         zwZQ==
X-Gm-Message-State: AOAM531dnG9oaDD6s/ASrcv35gdMuS6Z1QwK6chJCBTiwcDklqmRmgsZ
	595Y8/lhASDD/VsmuGmMpnU21LG1FYk++jrJfSk=
X-Google-Smtp-Source: 
 ABdhPJwP3KU+FOdlH2uS7Rx6MrjxWRT/Yb94ku2jZdHa92bDFYYM5dfIh71OtIzBU8ngxxg7HdyaGNKvcg9zkiQ7g8o=
X-Received: by 2002:a05:6122:9a1:: with SMTP id
 g33mr6151937vkd.23.1633073346456;
 Fri, 01 Oct 2021 00:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210915114618.157245-1-pgowda.cve@gmail.com>
 <16A53DBD300C0C8E.4388@lists.openembedded.org>
 <07fc5dc3d216f0fa6c081506aa92701508604bab.camel@linuxfoundation.org>
 <CALY4984U1txY2y6yJQQKts20Hb6x-86gtXhHx9UoEeDxF1yyTg@mail.gmail.com>
 <6473ab6832d9e7647a8921bd8a7735394379f12a.camel@linuxfoundation.org>
In-Reply-To: 
 <6473ab6832d9e7647a8921bd8a7735394379f12a.camel@linuxfoundation.org>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Fri, 1 Oct 2021 12:58:56 +0530
Message-ID: 
 <CALY4984aDWZmLHJLJM3wddnLEiERwu7-wUZVBvsXWFZkwF6SyQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] state/staging: Fix directory not deleted for
 race
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Randy MacLeod <rwmacleod@gmail.com>, umesh.kalappa0@gmail.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 07:29:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156514

Hi Richard,

>> we may need to account for musl/glibc in the recipe name or it's
>> workdir if it is going to be "picky" like this.

Thanks for your suggestion on fixing this issue in a better way.

Please find the patch posted at the following link as per your suggestion and
let me know if it's fine.
https://lists.openembedded.org/g/openembedded-core/message/156513

Thanks,
pgowda

