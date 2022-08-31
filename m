Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64E8ECAAD1
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 07:36:29 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.22754.1661931386036274192
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 00:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mHLs8JCk;
 spf=pass (domain: gmail.com, ip: 209.85.219.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id g5so2953759ybg.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 00:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=EeTA3hdmr12uUJZJ/nmhA4kvPrjd0FGmBR3j69w7yME=;
        b=mHLs8JCkSQ6HjL8oH9eck80ZKKIf0iqUzM9Y2hJF8ZZ+NIrEaSoomJP5dl6X5YrTFc
         NxZb8zK/Ox6e2q9j2sRB2EiZWS0MX9lanXy9pAEK6ZDauPw+l0cEFhNdww+/AiUSZ4Yy
         GEjVKMElEuxUjR8wQykz3JDpVefWGocI8L6imsH46oC5vaLM+SCxIFAk8ySyyeGrXVLT
         s7xLXJcexUFTNv8F6OUEGfkMqHb4ZabktRayn9JJjHBkLYuvFCWmJG4UEwVRuGrVtmdF
         GPypy/jsW+BWmtB0K3P6t/ycg8NrSb6iQKHUF/fHAD+OpvvR7K2sgwphXqqo/dueYzo8
         fC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=EeTA3hdmr12uUJZJ/nmhA4kvPrjd0FGmBR3j69w7yME=;
        b=A8V+sV7dUW/FgBSeuvgx6QUqSeKFgwjdNsYQubJspjzKkjImQDLSmgGKB0C8Kxiejk
         +O22xBFFM13UyA9aRQib5KGzuPYqbfZmhHQeSsLxyBfB6S0sUfAs/t2NnQlPTZK8xv5L
         5daJ4pYVp8y7PTUgvDpBXa0RF54at8m070s8BaDR/g3qLKazzcFsgcSuZBPalVwWSNwN
         NFhBjxVMsZRQxXswAPivAiauG/6NRQFMd66PBHO2LE7v+nNeQpq94RpyzSA754hzMXrJ
         RVzy1PgTHZFc8oZsSohXIYMOA+NNs/4SIpgHN8OS6Mw3Y5VfKoYrHfgHS8oUJOrwqdNw
         e8Cg==
X-Gm-Message-State: ACgBeo26oYCYhtHLCUyhzz28TdYFyxu/lWoHITom2NEz0tB/fjNP+uDE
	VK9X8LIHr0ATOgHX54Oe+cwBTy47waZV44kt7Ao=
X-Google-Smtp-Source: 
 AA6agR7saBzCzwPJMI4SO0lJFa44sQDoFlmM3CxnXXSD+MhkldYnHDGUZe2Atp395w0qqBPHfeS7jSu6Q9EfMcGhlkU=
X-Received: by 2002:a25:db42:0:b0:695:8d22:3a8e with SMTP id
 g63-20020a25db42000000b006958d223a8emr14135084ybf.428.1661931384714; Wed, 31
 Aug 2022 00:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220830225832.2700943-1-raj.khem@gmail.com>
 <CANNYZj8kG+k3_E-f5KAp6Q5PZGKQy0kzNHUgBgRYzVnU5GGjnA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8kG+k3_E-f5KAp6Q5PZGKQy0kzNHUgBgRYzVnU5GGjnA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 31 Aug 2022 00:35:58 -0700
Message-ID: 
 <CAMKF1srm2raF3E6ut_pap32-J_v6t3h4JG-9KDKtV8s-Dnn6pg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ncurses: Fix configure tests for exit and
 mbstate_t
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 07:36:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170094

On Tue, Aug 30, 2022 at 11:08 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Wed, 31 Aug 2022 at 00:58, Khem Raj <raj.khem@gmail.com> wrote:
> > +Add needed headers for including mbstate_t and exit()
> > +
> > +Upstream-Status: Inappropriate [Reconfigure will solve it]
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> This would benefit from a better explanation: why isn't configure.ac
> being patched? What is 'reconfigure' and how it will solve the
> problem, and when will it happen?

its obvious in recipe, do_configure does not regenerate configure
script like most of autotools recipes do.
autoreconf will use new macros when regenerating the configure script.

>
> Alex

