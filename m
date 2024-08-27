Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13F1C54731
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 20:48:10 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.991.1724791681640508702
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 13:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fDI0gUWO;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5342109d726so54208e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 13:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724791680; x=1725396480; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qw/S7KjKis5d3hOEABVAw7sy/CJJ9bwSM/mTG/uTItA=;
        b=fDI0gUWOGmkO5pVDNVat6LiYXHL233c1szcRY652IYofZEgijHZGUg5gkDgyr3OPzF
         lT+qgHWjwng5QoGuG+Td3276R1zU0BoGFZaPVkmrr4CI3Myqh7J49oAhfqol3puYRY57
         keDO1n0+hT82AfvmnyBZGVTWaMwMd6vK9+r+XUtNMFbl6SKjqSmw69J9gIk9zrizrUCP
         jMDPzlVYx/j+LmFZ7t7zlb9IaE4t50Yv2L0s351jC81Vob5TxYAmCmCVI9ymV7esxWK5
         YWc3TnU5axvFunauglFw1H8VS2hXnp8YHhLTMcFzr2twwWkC30HrUwHfT8h0wd9ZnVwu
         CeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724791680; x=1725396480;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qw/S7KjKis5d3hOEABVAw7sy/CJJ9bwSM/mTG/uTItA=;
        b=wUUs8SvQCob506GJXl2NbbIO2qmDFLZI7lmjWyon7wTETQ4XtYe6yUftxWZ3d3foh9
         s4yQRDjxmq7JrsChJTEM6lWuxzAMVjExzGw2iUoNdH7CatGa5L4LKyp4nQ3QnZkqB1x4
         km1pJUxpTOyld4j6Y8jpqGI118bd7xA2yRrJ2SdDwVBuIvMHF5pvjMpQE73cuq2ddeJL
         kL4t3UNtOY6nBiuqIizz/Et9b7HjS0BeoYaIGt8QbMMTforiTURPA8zwpzHwgaMvBbJb
         8Wmk1GJy1udW6MLjyDDtRKG/b8ijJpi35VnEfsY92XZ1wZhVl0fzFQQgOP5dHEVqIfgW
         1sQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqmY0G2jesLR1k1WSWVyeq3TmJSoO98C6ypfSf/7r15K/vvbD3ShQcKZdoNHHJWPq8w6WoDelxUepNd8wlGzknUQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwZU0Rcc3gyisib7KIIri6vnp+eXo9F9OAhBSVo+7PxXXIIChqi
	ILFDXXhWE1g/s322s8CXO/oFloF+11VkRGRnE0f0ILt2tyLY3MIkkFR9zGk9VhN0kzq0ggqW13m
	nh1YKz0ksXE6aZJYEAVKpD5mMQe8=
X-Google-Smtp-Source: AGHT+IE1ur1WTbUE3czaNIypd+hNPupryVQk1Wn0ll0+LNzYh/smXC2+AsJlgueniqk+AKYJ8l0d7+0GzzY28ymtWD8=
X-Received: by 2002:a05:6512:1051:b0:52d:ab43:b276 with SMTP id
 2adb3069b0e04-5345673d625mr7415e87.2.1724791678955; Tue, 27 Aug 2024 13:47:58
 -0700 (PDT)
MIME-Version: 1.0
References: <20240825170553.566798-1-Yash.Shinde@windriver.com>
 <20240825170553.566798-2-Yash.Shinde@windriver.com> <bbbe564b9b6191edbe62abd69fa3b337ada2ad4a.camel@linuxfoundation.org>
 <15bf0cae-b114-4ac7-89d9-3f7df77b41bd@windriver.com> <CANNYZj-2yiGpKNc1Jcc6NO8+8MhNYiYV-3xh3BbJqTw4nyJT0A@mail.gmail.com>
 <1356a3e7519ffca6f65810ea2953429fbe08fa1e.camel@linuxfoundation.org>
 <152b3da8-8d5d-4dc2-ad60-ab03bc4b361b@windriver.com> <5216855652e912043a3b7a06e1d76956d2babdd7.camel@linuxfoundation.org>
 <17EFA275ACF95534.20373@lists.openembedded.org> <17EFA28FD32C2C48.20373@lists.openembedded.org>
 <CANNYZj_p+3JR8QtntEB+PktAhuuxOg7e-dbHv+1nFC=SzzVcSg@mail.gmail.com>
 <a16d7b2506544ee5ac1df57e98bd160126dcb4b1.camel@linuxfoundation.org>
 <CANNYZj-ozQ+3JPRCJyigf2LFJnAzsWNWK7dtfORzZH_Jz+bLuw@mail.gmail.com> <bcf7e4329803a86e3f9cf8ddf3b62564ee5e8532.camel@linuxfoundation.org>
In-Reply-To: <bcf7e4329803a86e3f9cf8ddf3b62564ee5e8532.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Aug 2024 22:47:47 +0200
Message-ID: <CANNYZj9JH172tBuyf+7WsqgYBAqT0hfoXom=q0pS+P1qS=Dm1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] rust: Upgrade 1.78.0->1.79.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 20:48:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203863

On Tue, 27 Aug 2024 at 22:41, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2024-08-27 at 22:38 +0200, Alexander Kanavin wrote:
> > On Tue, 27 Aug 2024 at 21:51, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >
> > > Shouldn't rust complain if it doesn't work with old compilers? Are
> > > the
> > > compiler requirements for rust documented anywhere? I'm reluctant
> > > to
> > > throw buildtools at anything that breaks. In theory we also would
> > > need
> > > to change the sanity.bbclass compiler versions tests and so on too
> > > :/
> >
> > The specific error seems to be about libz-sys, which carries a copy
> > of
> > zlib and that is built using host gcc - I suspect that somehow alma9
> > gcc is used incorrectly there. This could be a problem on our side,
> > I'd need to first try building cargo 1.79.0 directly on alma9 and see
> > if that breaks too in the same way, or not. Don't have any more time
> > to look into it today.
>
> The failure is building cargo-native iirc so using the host gcc would
> be expected there?

Yes. I want to establish if the failure is seen when building cargo on
alma9 directly from rust source tree without yocto as well, or whether
there's something the recipe does that triggers it.

Alex

