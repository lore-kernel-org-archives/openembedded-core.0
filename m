Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAACC43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 14:06:57 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.30399.1655734009192283300
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 07:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aqSChBbP;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: sakoman@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id h8so11176289iof.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 07:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZVaIia9zZpRTxagI819TqknE2FZxrtloW/hlgdPYvY8=;
        b=aqSChBbPU5zbYNmKPfGhew+hO3hzB1JJ+75MUVW9bZF1voH11VK3as7mzjwSj/diRG
         sDW9goDd2fJSAQob40Ui1bFr7XKEVlD7L9ZunGnSNkO6ffV8KKw92M22aUhYNPeTbNbH
         8VQsZ0O7S6gFg5PNWivNLTypJZmZb++IQg1ryse5QYPCLlJA6+dLXP1k3VDlIKA9LlAh
         uu2ZiYDsUsVceAspuMgJpNwGJ3uOsXHBgiwnS8Dd5SiCEPB7Nd5Lk9ARZbtPr9eXVbvh
         lQvZWPy5BVFDsaFFF+iiY4rIlRYgBYEuU2Hmmy9KyGemBdbXNUhFyI+tsEGnB4dFwzeg
         EIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZVaIia9zZpRTxagI819TqknE2FZxrtloW/hlgdPYvY8=;
        b=NsROmaPCRqNJxfInLOwdGRhO5xyL90/aEpvDEbLkBF2n7t9hNhARWKwlgDkTPGZwL+
         9wN1CMHWOajLtC4LuGCj0iWNhazbF2wAUPmlYN0PAOkqEuz4pzK0nLHRahwlXB64Kpvs
         SYU/vk4frt8R2+qGRZFj8fFBof++6CwNc8kvEDeQ68nCZKBL8nh1xYXtqdoUiz0PSKKC
         JrjrAtZfRXd6mElnK49J5MGO8jBscJvueBL6fYLBRZqXJA49FQnLh2yRBGmbc3dmAqke
         0XrH3ID4FjZyvZTqXdY7HnDtN0ZfCu3uUffjOOIVRv+3yIYp+Tvooyel3oaNcYKSN9ub
         +ufw==
X-Gm-Message-State: AJIora9okIBFHTWp5l/NzQjAiaawuF1WyOGuOeoDZO7nGfsKnrJeP6Yb
	8o40qiJz3c2vqV0WmAxTYDAz6o1GS0n172GURiw=
X-Google-Smtp-Source: 
 AGRyM1vxFBzuekhPv1VjtzGlAD0kAcs27+/lm1Y0qw8Q/bi6tLbXUTNCwrXGBDzaCd9zfmv86jSKt2p2OT8HsjnCaks=
X-Received: by 2002:a05:6638:1607:b0:331:bcef:784d with SMTP id
 x7-20020a056638160700b00331bcef784dmr13314607jas.208.1655734008427; Mon, 20
 Jun 2022 07:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220620090819.84400-1-davide.gardenal@huawei.com>
 <CAApg2=T-XaL3b=-wcsAgU3=Gf51KXgBMdfkUHNgDkpNG7LBygw@mail.gmail.com>
In-Reply-To: 
 <CAApg2=T-XaL3b=-wcsAgU3=Gf51KXgBMdfkUHNgDkpNG7LBygw@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
Date: Mon, 20 Jun 2022 04:06:36 -1000
Message-ID: 
 <CAGDS+nkCzPf5nMrNQHZsFg8147hZED25pz2UMepus+OzbKRvjw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH][RESEND] efivar: add musl libc
 compatibility
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Davide Gardenal <davidegarde2000@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Davide Gardenal <davide.gardenal@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 14:06:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167110

On Mon, Jun 20, 2022 at 1:32 AM Marta Rybczynska <rybczynska@gmail.com> wrote:
>
>
>
> On Mon, Jun 20, 2022 at 11:08 AM Davide Gardenal <davidegarde2000@gmail.com> wrote:
>>
>> Backport patch to get efivar working with musl.
>>
>
> Steve,
> do you consider picking this one up? It is blocking the cve-check on world on our side.

Oops!  I was waiting for this to hit master, and then forgot to grab it.  Sorry!

I've got it now.

Steve

