Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C82C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 08:31:01 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.8642.1661329858913556734
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 01:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KadSetWF;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id u24so10142346lji.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 01:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=V5TmrGagSSXj1ErjJj5G97VFiINF7+IdpvliBaR2FrI=;
        b=KadSetWF2cq6diNN/zw7O4g4z9d1TXVNhxR4llPHqCZ5dzN9QxwEU8JH48RrzRrdph
         Yp78GKPIjKfM+l9K/J0nXgh7MzkPGqM8hAOhfXxQdp4JifqPNLKHW8B5r3BHWUquhMgD
         ushkJJDCxruNcfXGfxX1ycFv4lbDhWaH3q/xCkR7x9xj8hSEKDA21Pza+S9Dh7r3o2pR
         0Qoha373kSAx6/K6mIylIEMjQVA4qiPjeMPC/Oz9itcr+hNci2gza3jhTUmB0VW1CsAj
         HCr12L11HGIsF7pEUp6tBJ8qYgFz6vXpW9ekvgBcMwSYGrduag58/hRQHsWUILECXBlg
         nPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=V5TmrGagSSXj1ErjJj5G97VFiINF7+IdpvliBaR2FrI=;
        b=7nopaA/+Jm91jvdJ7oGiq1YAVwGNRqM6DpQare4fqSPe1ISC+g+p3B7UYiaVPaL1vl
         w8tioTV10j0+/tYx1Gss5bHC9TYY5te5MJAzu8NbTz9hZG7BxNfLTu4UqXzn5az2WJLr
         m4aWYBWfIk1q0aTvqlgMcghxWiy7lSZzIxg2zeudPglPqj7+iB/EmvLUXfZ6z4fjAMTr
         hGPHQA42cUj60wkJhOxaw8UOZ84FWCeDPLcUPQOj8PQoD2sMc/lgxxeoeFgAk8xkcVN1
         qjJctv5Bu/XZgjeyBJpn7/RjCaVOJ688yEr5Uq5SUubPHuDEQ8ZcaKcYhFlba5ej3ls3
         909g==
X-Gm-Message-State: ACgBeo3lnYVJMQODWDPyi586tJ8OTLBR8q41tl6ZuvGUZ8so1J1FhA3b
	70K6g/GXjvwoZOVmvbJhmedNmOmCq+Ly57DNOnA=
X-Google-Smtp-Source: 
 AA6agR4ku4xorPclCMp9fkPROUGJhBeHOV7eDPOdhWC11hiYEW0NeqEQv7UFkY/R3JmxAn0Ezu/C8wTNgnUBVAAXwf8=
X-Received: by 2002:a05:651c:31b:b0:261:df26:53ba with SMTP id
 a27-20020a05651c031b00b00261df2653bamr1347635ljp.513.1661329857027; Wed, 24
 Aug 2022 01:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220823235624.2488133-3-andrei@gherzan.com>
 <20220823235624.2488133-6-andrei@gherzan.com>
 <CANNYZj-XzOu-zd1aTn7aQ0DyrsiN8J3mOPuG-4wcJw0DzegRww@mail.gmail.com>
 <c18472e4-db71-491a-8f9c-b82245c47800@www.fastmail.com>
 <CANNYZj-LRM_fR3zuRQrR4kkhY_TuF5pGPBDePDaLbEWSJaoQQQ@mail.gmail.com>
 <d0b7534b-bbec-43da-9a02-2fbd9fa453f4@www.fastmail.com>
In-Reply-To: <d0b7534b-bbec-43da-9a02-2fbd9fa453f4@www.fastmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Aug 2022 10:30:45 +0200
Message-ID: 
 <CANNYZj8+qFQzobfqrow-LmbJ+Q8e249dTpz-xa1Rx4JN8OvSiA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] shadow: Avoid nss warning/error with musl
To: Andrei Gherzan <andrei@gherzan.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 08:31:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169788

I trust the upstream will figure this out. My goal is to avoid adding
more patches that are declared unsuitable for upstream, and so have to
be rebased until the end of time by (usually) me.

Alex

On Wed, 24 Aug 2022 at 10:28, Andrei Gherzan <andrei@gherzan.com> wrote:
>
> On Wed, 24 Aug 2022, at 09:21, Alexander Kanavin wrote:
> > The issue is described by you in the commit message? I think this is
> > good enough for upstream submission as is, as long as you edit out the
> > yocto specific references.
>
> RIght. I was more interested in how you see this issue per se. At the end of the day, it is not a bug, it is more of a warning/log message while the functionality is in place. What would you expect upstream to do?
>
> Of course, there are a couple of options here. Compile macro for musl, change the log format for that specific message, etc. But it can also be treated as a dynamic check with an associated log message.
>
> Andrei

