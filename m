Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315DAEE4993
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 12:20:58 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.6523.1692706855221140420
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 05:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OyBINu8+;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50091b91a83so186802e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 05:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692706852; x=1693311652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bh1/Lz370kfIakN8Gwp4MogmQiDPD67/EuKrCZypwvA=;
        b=OyBINu8+K4+hZuDwgk0yX+daVN03MDfofOvSuce21HOkTmmjEEGE0beY/kfsiBwh/a
         UUbN2yiq590hoF2RxZgulkpXa7nznlREIghoJkf5ViXFhGM66wz5wExX0I3kGDux2CQF
         R6D09Kf9BYYi7IcpfVYExO1cCeZ2VH0C5It5NmL04RwGmuMOtd38e4dGIXHDSRUP7wA5
         B/zZenhz/nDd05n7o6/U4Hce9ozPseWjegiQSlOvZznRRxkqGgwAAqvN+zMknZav4P2t
         8XX3v0pqFZdZ9KA1fKuJvJRh4q8TQY4ULmHG4MMb6vgladE6XbSa5sigGBTQdT2si6Q8
         Gz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692706852; x=1693311652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bh1/Lz370kfIakN8Gwp4MogmQiDPD67/EuKrCZypwvA=;
        b=g+t2zWEkv6AJD3Opk+eIvctWsV1eKrGwIRxmekpuE1O5Hun/l2HcFwFQS5wSIlBffH
         rAHxqkFSgUmp+2iRM8eLEQ6g/8nJmP9sakyyy+2fbbe97UCMEe8RZtk8USZ8VbmBHnw3
         RnXarkLf5aJGxsyArsR2TUoBIDTUqgxQvTJ4SGnFvRpMmkLwehMd5hQapdIpWLCv4z5X
         Rrwjp1XRvzAmoYVk4t+3NAv3G0iPN7ZLpWB9qCeK3/JD0mXUn4kWnRkYqeKwLsN0a3uz
         GlFf76EKqryfRwE3D+Ij1Kkp9qVUHMgmRWFnrgzVjc7MNlkp7t42fO9zT4S7uaKYufmC
         esOw==
X-Gm-Message-State: AOJu0Yw4QkKaS1V9CmOXGMVRnHi22ZnuVu9M+1C3ElF6mkB2jzGwQBDk
	JnaWpApVaaX7ejUAeHyyIWkYqA==
X-Google-Smtp-Source: AGHT+IHp4w3qynAyWO0M7NrfLUR4jgLOBd9u7kDvcRvZ73QPCUJ2bz7V94CES7SVxyboMUv9cWUvhw==
X-Received: by 2002:a19:791d:0:b0:4fd:cbd6:d2ff with SMTP id u29-20020a19791d000000b004fdcbd6d2ffmr5545909lfc.33.1692706851580;
        Tue, 22 Aug 2023 05:20:51 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id c11-20020ac2530b000000b004fe27a050fdsm2178944lfh.259.2023.08.22.05.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 05:20:51 -0700 (PDT)
Date: Tue, 22 Aug 2023 15:20:49 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)
Message-ID: <ZOSoIXLG7vH/GC1l@nuoska>
References: <1b3bb1c747644f83156f6269de2c502660c18466.camel@linuxfoundation.org>
 <ZNt45UVb0Ps/kKLM@windriver.com>
 <15f7e67b-afd7-7504-aa23-41a4c3cb62a1@prevas.dk>
 <ZN7j425iXGBPbS5i@windriver.com>
 <177DAAB2E4C3384A.4797@lists.openembedded.org>
 <177DAFEBFB5EB0D2.24073@lists.openembedded.org>
 <d7982e9549e8e8042dfdfdaa4f3173684aa726bb.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7982e9549e8e8042dfdfdaa4f3173684aa726bb.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 12:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186505

Hi,

On Tue, Aug 22, 2023 at 12:47:04PM +0100, Richard Purdie wrote:
> so between 6.1.38 and 6.1.39?

Maybe:

commit b1cdc56bc177c2e182c204bb08ad4e87bfd67942
Author:     Paul E. McKenney <paulmck@kernel.org>
AuthorDate: Wed Apr 26 11:11:29 2023 -0700
Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CommitDate: Wed Jul 19 16:21:01 2023 +0200

    rcu-tasks: Stop rcu_tasks_invoke_cbs() from using never-onlined CPUs

and

commit d58f0f0ce6332ffeb406540295cc49732c26fb51
Author:     Paul E. McKenney <paulmck@kernel.org>
AuthorDate: Thu Apr 27 10:50:47 2023 -0700
Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CommitDate: Wed Jul 19 16:21:01 2023 +0200

    rcu: Make rcu_cpu_starting() rely on interrupts being disabled

?

master branch seems to have larger set of changes to rcu.

Maybe locking debugging options could help to find this on every boot.

Then wasn't

commit 77cc52f1b8d76c995648cb4286e57142cac8ce0a
Author:     Wen Yang <wenyang.linux@foxmail.com>
AuthorDate: Fri May 5 00:12:53 2023 +0800
Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CommitDate: Wed Jul 19 16:20:59 2023 +0200

    tick/rcu: Fix bogus ratelimit condition
    
    [ Upstream commit a7e282c77785c7eabf98836431b1f029481085ad ]

causing some issues too?

Cheers,

-Mikko

