Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6E0C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 20:21:35 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.1969.1632860494655502790
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 13:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KPldPpHb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id z2so15531wmc.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 13:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=NQMWmUejFVqxoiXGAecfxt7aowHAlf5Q9f5aoHB9vSA=;
        b=KPldPpHbGLEVerPC21GHAQrKRJy40DIB73+G9nCEEUjAPEhMyXdqKVProZpHdfY/DH
         V/5I9UPHXPxe3SnKqmcUw5oyg6ygIvgSTxWU7ewesnjWHPPZSDKkhWjKzcHRMMqT6+gN
         zAh8SO4fteeVZeEyuZWyLgt6XWeFDmZStU6gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NQMWmUejFVqxoiXGAecfxt7aowHAlf5Q9f5aoHB9vSA=;
        b=GMd48ZELEMTWD6lZq5JHdHaFUi1Qj3nW0ihXREqqKqIcXxqi0KMGCjKcN+WX3Z8GT/
         nOXdwQt89D+fh0+zk0QImZiMEzaO2Roudn2aSl+qIy/B7wpEUt3rnqhmd3xuxRzPF5eI
         Cqdd2sCGGI2hlZNP0n1vT3Wo7osJEZwei/l9dUdPet/qAGCOgkwCOxK4xSYfHYK81v1S
         fi9ECPqOIp3oMOuz//9RLR/g3y4kS7yBZOO3ygrDNe4cudmBlI4f0F2z02kiD9ontGze
         NmysSWgG8hNhNzGwBgV6/m+fxuaG5X+84vnpXisTL672zeinyIWd7UAWj0+zaQ5ewrU8
         6icQ==
X-Gm-Message-State: AOAM530ccyQAwUywNt+UXgUojTmUl5yuS4n2jywigW2wOBd4GVk8QT8v
	CHxoZBmRN6biziLjg8uJn6R//Q==
X-Google-Smtp-Source: 
 ABdhPJzFXXsQqRrkWiTESSC8nO1t+LgITR3nt7nHRaEYMlmxkSiVY3bRXFlrGVrNCu5Ne+wykILmZA==
X-Received: by 2002:a7b:cb49:: with SMTP id v9mr6587139wmj.76.1632860492757;
        Tue, 28 Sep 2021 13:21:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4a38:6a33:4c6c:a572?
 ([2001:8b0:aba:5f3c:4a38:6a33:4c6c:a572])
        by smtp.gmail.com with ESMTPSA id d24sm43658wmb.35.2021.09.28.13.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 13:21:32 -0700 (PDT)
Message-ID: 
 <6473ab6832d9e7647a8921bd8a7735394379f12a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] state/staging: Fix directory not deleted for
 race
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: pgowda cve <pgowda.cve@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy MacLeod
	 <rwmacleod@gmail.com>, umesh.kalappa0@gmail.com, Vinay Kumar
	 <vinay.m.engg@gmail.com>
Date: Tue, 28 Sep 2021 21:21:29 +0100
In-Reply-To: 
 <CALY4984U1txY2y6yJQQKts20Hb6x-86gtXhHx9UoEeDxF1yyTg@mail.gmail.com>
References: <20210915114618.157245-1-pgowda.cve@gmail.com>
	 <16A53DBD300C0C8E.4388@lists.openembedded.org>
	 <07fc5dc3d216f0fa6c081506aa92701508604bab.camel@linuxfoundation.org>
	 <CALY4984U1txY2y6yJQQKts20Hb6x-86gtXhHx9UoEeDxF1yyTg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 20:21:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156431

On Thu, 2021-09-16 at 13:58 +0530, pgowda cve wrote:
> Hi Richard,
> 
> Thanks for reviewing the patch and your comments.
> 
> > Looking further at this and your description, I think you might be saying there
> > are multiple levels of empty directories.
> 
> Yes. There are multiple level of directories as follows:-
> 
> /tmp/work/x86_64-linux/rust-cross-x86_64/1.54.0-r0/recipe-sysroot\
> /usr/include/c++/11.2.0/x86_64-poky-linux/ext
> /tmp/work/x86_64-linux/rust-cross-x86_64/1.54.0-r0/recipe-sysroot\
> /usr/include/c++/11.2.0/x86_64-poky-linux/bits
> /tmp/work/x86_64-linux/rust-cross-x86_64/1.54.0-r0/recipe-sysroot\
> /usr/include/c++/11.2.0/x86_64-poky-linux
> 
> > I would also like to understand why these files overlap and are symlinks in one
> > case but directories in another. Can you show some specific examples of the
> > files in question?
> 
> It happens when we build rust-hello-world for glibc followed by musl
> as follows:-
> TCLIBC=glibc MACHINE=qemuarm bitbake rust-hello-world
> TCLIBC=musl MACHINE=qemuarm bitbake rust-hello-world
> 
> The recipe do_prepare_recipe_sysroot tries to populate the sysroot file.
> The glibc build had already generated the sysroot and copied properly.
> When we build the musl later on, it tries to remove the above
> directory and symlink
> the newly built musl files. It was deleted properly before the race
> issue was observed.
> However, after the race issue; files are being deleted but the
> directory and sub directories
> are left undeleted which resulted in the error.
> 
> > The missing json file sounds like there could be some file not being handled by
> > sstate but it is hard to know without looking at the code.
> 
> Thanks. I will try to debug the issue further.

I did think about this a bit further. "cross" recipes are hard and I suspect in
this case we may need to account for musl/glibc in the recipe name or it's
workdir if it is going to be "picky" like this.

Cheers,

Richard



