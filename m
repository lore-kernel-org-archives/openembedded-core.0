Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F1DC43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 07:51:37 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web12.3877.1654674681365541997
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 00:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F4GdjsSp;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id b5so16934743plx.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 00:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S0V/ryticUNIiIbjXxCG3sygHJffG55tCN2++EgHWS4=;
        b=F4GdjsSp9ZACu2ilrq0wtZhnTsClDnCuM21loLJtDlEQ3CLNA6GBPlJHAgnL1ka/jt
         tWqv3WHiobY/Ib1jL2lIQYVrO55klpuMYQ2WFPf3kEHoCinU+ijTKvi3y7Q6SBIm6f2I
         d7JaXXuBZaCyZ07OhleQlJbLAEfZGrR0a73g87rwOQ7IeTqJLNWS/uOBd4UgF8WAn1Z9
         +sykr9tde4Fe1Pk47feHD+XDam6wI0TPGiZ3oWwVN+xn6qvYyIOM73IMBMrznxOZZMjH
         JVp4ScOcW2FW5U3zNe4yhTZZvrPhbr0s+lw9+ZB0lBKUsKKstxIGkfSJGMIf3EjEHRWS
         qOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S0V/ryticUNIiIbjXxCG3sygHJffG55tCN2++EgHWS4=;
        b=WZYR4gRKqJ2FZY+iyhHDvEvb8Ah+odCstgJfbkOnVCuOJ/Trvet1pXUwJ0I6saWR4c
         9tr3HjHC3h80Ren34m3x//MHMy04lECsTEyTQxtwUwHdXqT1ntoPcMfUnL6iU6oau7zU
         z+4/RXdUJvW1wTc741k8eXM59kn8s9NGqheUD93/hFfG/BT3XriINup3GbRZuWaOOaGj
         wSXjpNp5bKmgJGSA1yPjNVUKsAeCQS1mHeRIQ+KFUdz8qXRp5lmo6xW2AGglLVyPYP2+
         V2N6mEmD3eP4dKCPch4hF6BFqPORJsbRCwsOaNkboqlnuxtoda4KGfwp/9S3em8+e7tH
         0Zkg==
X-Gm-Message-State: AOAM531yn2rL/+W4JmZLETUw7bKyJf6rXC0ClNKPh7i+BnKDQv9/LB7q
	hFktakuth3ZI2SQJFjx1+bV2VTdH7KG4Kvdzkas=
X-Google-Smtp-Source: 
 ABdhPJyCj/m0xbAiYh6JV5nMhVG4LQkzC6F+3LuSr4DThgmQWyGupPXJPF+ytHlpw9s1R+qWN9FBkimwj7tTpaqKKSs=
X-Received: by 2002:a17:90b:4c0e:b0:1e8:859c:6b56 with SMTP id
 na14-20020a17090b4c0e00b001e8859c6b56mr15018408pjb.121.1654674680681; Wed, 08
 Jun 2022 00:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220603085827.2214734-1-rybczynska@gmail.com>
 <87k09u2ujv.fsf@gentoo.zhukoff.net>
In-Reply-To: <87k09u2ujv.fsf@gentoo.zhukoff.net>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 8 Jun 2022 09:51:09 +0200
Message-ID: 
 <CAApg2=Q+2weQLezA040uC=OR1_9ROXYT1iEzwk4Xt1Xf91yLHQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check: move update_symlinks to a library
To: pavel@zhukoff.net
Cc: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 07:51:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166695

On Mon, Jun 6, 2022 at 8:08 AM Pavel Zhukov <pavel@zhukoff.net> wrote:
>
>
> Looks like update_symplinks is widely used accros OE. Quick grepping gave me this:
> [1]. I'm sure there're more occurences.
> This should be somewhere in more accesible place (oe-core libraries).
>
>

This is a valid point Pavel and Ernst. The patch has landed in master
so I will do a followup.
It seems that this could avoid a number of bugs (see the latest fix
from Davide).

Regards,
Marta

