Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A026CC54E76
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 17:05:25 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.202568.1673975125158190585
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 09:05:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fuo8HEl7;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id b3so48016243lfv.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 09:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OEU2T/aVsNCdK3ZJLImH4r8LmZv3jKc3xBcUFlYlxxI=;
        b=fuo8HEl7opcV7Un9eAlClmW4u1YXEEuYkqP9fvzYc/z/1OSSvSQuH441ssvHfYuD9o
         6/BUa9lEUcKBb8YZtqgHf6Z48HIcMkxB7fn0p3dUD78iblrmsMQepilgxoCFmZXW4Wt9
         yNuHurwD4UaRahrOsLK637Kw125xpeTYh1mTBOmPizR4iy3az9xD5+n1f2AvF1oZr9iv
         ssLSCDlVu6Lyfte/Z6cEQksMkA92h6vm/f7jc4JgH0DT4QIJPhNxH90RQatv2P1UZyfN
         146yLRKhOG770X9bdZHj4gNZxp6xFS9hWfXU76trsXuKA6rkGGwS12Vk4eRgnk1ukeqv
         WVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEU2T/aVsNCdK3ZJLImH4r8LmZv3jKc3xBcUFlYlxxI=;
        b=sh58jf5ti+rqJUzGseBq9o4tMc2U88zTUnMlJXWHXahQovze50+y4waGQDtpvhRSvr
         oixqgrzZnMf1nnqe6hi05g8oso9hvImIS0f/dFZKYsShnH4Hq+wwxkvsybgebtayKLhP
         YZ5oKSwi4mw88n/GA/aZ9AfxOCT1ozrSSQLmAV5nzZgQvnzBiTVNgyeOcQv9sg5WjbGD
         AYVaDe2hQzvso/7gfCloK9hR2Nh2ft4D9YhDgE3VGEAh8twLd53Fn6B0kn8vDq5Lwx7i
         971A33lElYDvW39lK8sBTEtutUeSEmdgdouRryzay8rV23L48DpFybE6CK+WrAsGwxMz
         ocTQ==
X-Gm-Message-State: AFqh2kp4+T2wNff5KJfDuZVWweXvbaHOX5TCTSEOuV0XaaMW+TLF2MHF
	pNfb2Rc2PemhbmKxh37eU4vWgehm67vZJhLkvis=
X-Google-Smtp-Source: AMrXdXvYhfDkEDiIhwntz19cdoY1N4MySPw9fU+jl84wAb9BFyZyTpDhp2uiR4Z8JeWTQa2hohnHe3waNVhHOppxteE=
X-Received: by 2002:ac2:488c:0:b0:4b5:4502:1323 with SMTP id
 x12-20020ac2488c000000b004b545021323mr246539lfc.345.1673975123417; Tue, 17
 Jan 2023 09:05:23 -0800 (PST)
MIME-Version: 1.0
References: <1673920770-31378-1-git-send-email-chuck.wolber@boeing.com> <20230117180307.52fdcce0@booty>
In-Reply-To: <20230117180307.52fdcce0@booty>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 17 Jan 2023 18:05:12 +0100
Message-ID: <CANNYZj-d-Ref70qgf=+fr8ZDx_KXZ02q36d1Z7Qq4bEF5URAUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] scripts/oe-setup-layers: Make efficiently idempotent
To: luca.ceresoli@bootlin.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Chuck Wolber <chuck.wolber@boeing.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 17:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176057

On Tue, 17 Jan 2023 at 18:03, Luca Ceresoli via lists.openembedded.org
<luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:

> I'm afraind I am unable to apply this patch on my testing branch as it
> conflicts with another patch ("oe-setup-build: add a tool for
> discovering config templates and setting up builds" by Alexander
> Kanavin) which is already on my branch.
>
> You might want to rework your patch on top of Alex's, or just wait for
> it to be on master and then send a v3.

I think RP is not going to accept the oe-setup-build patch in its
current form, so you can drop it for now.

Alex

