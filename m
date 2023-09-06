Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F42EE14C3
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 21:27:25 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.2053.1694035642865144644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 14:27:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rXfCC1uL;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5008faf4456so369411e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 14:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694035641; x=1694640441; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2p4oWPx3igYY1ccERtJn/j20Rk7LhTo2vxZbws9o6kw=;
        b=rXfCC1uL34O/v+WI34GLsTeFtIWKStN3tG8SEkCUFgcWhYLWmWEFFT1REldlFMu8ZY
         xndd+S32dBE7qU/EK68ISFRm2GnhtOFxEon86lsDxQYDeOlrVnqB6gST43jc3SQSxgGl
         iZW7DQ91kx1dLeZbT9avsA9U/9GA1JRQvzgmTyhQ0vxQTfMWsWmRt9PeLekr597bVJhL
         +7EAZsbN7nIKgmaW3Egpvasr1xks+BB5UWhGRCVc+zcMn41C3d1ner/8Amr7Hd+zW2oj
         AAw9PelaYCQj45kCre1+MBuZ7s3L6SRQ6a/7VyNMCP1RXBhQxbrbANZfznrmLPfWNymt
         5NGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694035641; x=1694640441;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2p4oWPx3igYY1ccERtJn/j20Rk7LhTo2vxZbws9o6kw=;
        b=RK5fxsBVH0d/tB3K8JS5tjWIAJzDHc3XNrlG9F8A7ZH5k1QYclfYI68jx+C8njESII
         0rc3mlwrJSYkOzneT2nOnEhbrVpbQMkLMeYNBSA5N7s0kVw4qiSFH39WN94r4INvet95
         KOuG8oswr0FIDKUTAmvgXTtiXXyq9O+Ue66FS/X4TUYT6y8H+8+lJz9chb+o+9QqczeT
         UH0YtdWcg7mR7QKAmLiY81yYERmWTadtyNQUIoWCksSp7jvPi+uOdhzx7UsoV1nkKi3+
         6ILiNLtkhGpSV1r3C719voL/MyE7Gxb3GLTe1cl8ITh4c/zZeWPf0vl0JksWVQREv1ju
         KSNA==
X-Gm-Message-State: AOJu0YyTpg90Tknu9IgCgCkGP3uactctdhashwAv42HLIkdRMfMJLmcl
	pzncwcxNzxb41yBqLXXw8pXZqws8QoUvRxU5Oxk=
X-Google-Smtp-Source: AGHT+IEBEbLM8g6wndnrLJNagj7PHzTxf2L8PFEpQKZppUDn/RaOk+dxTZAmHObtjo60IoTX7POkuro/fFaFd5D5UdI=
X-Received: by 2002:a19:4f4c:0:b0:500:76aa:b962 with SMTP id
 a12-20020a194f4c000000b0050076aab962mr3114048lfk.15.1694035640528; Wed, 06
 Sep 2023 14:27:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230906165633.2382629-1-alex@linutronix.de> <20230906165633.2382629-16-alex@linutronix.de>
 <18264a59f21e43aed1138bc58ffdf2471c5ccc05.camel@linuxfoundation.org>
 <CANNYZj_ptnLNvwPGDcAciok0bsE7Ctzww4WkAJmamgkCyB19CQ@mail.gmail.com>
 <781c93976fbd19e146ab2626a6202a0ccb23ab82.camel@linuxfoundation.org>
 <CANNYZj_RfCwHmt_TnUgdHeoTNdqMcX+f7aAzZ7e=MYSx+E-rXg@mail.gmail.com> <02407d75fc40487431a84d18b60476552083b1ce.camel@linuxfoundation.org>
In-Reply-To: <02407d75fc40487431a84d18b60476552083b1ce.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Sep 2023 23:27:08 +0200
Message-ID: <CANNYZj_HBxGaz9c8X875fZ8rgPGD4MNCjv6mkANAiVZKD4vswg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 16/17] build-sysroots.bb: run tasks one after
 the other
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 21:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187357

On Wed, 6 Sept 2023 at 22:53, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> That test/calls were fairly recently added:
>
> https://git.yoctoproject.org/poky/commit/meta/lib/oeqa/selftest/cases/meta_ide.py?id=9b3fcb0d91648ae3b53ec8ffcb31fb6eac9209dd
>
> That test should probably call:
>
> bitbake("build-sysroots -c build_native_sysroot")
> bitbake("build-sysroots -c build_target_sysroot")
>
> om the setup case and then just call the target piece again in the
> specific test.
>
> We could drop the "before do_build" in the build-sysroots recipe.
>
> Note that the tasks are nostamp so they will always rerun. It does make
> sense to have a way to regenerate the target sysroot only but if you
> change it as you suggest, that becomes impossible.

Setting up the 'direct esdk' would become somewhat more awkward as it
does currently rely on being able to run 'bitbake build-sysroots'
directly as officially published:
(yes the doc formatting needs to be fixed):

https://docs.yoctoproject.org/sdk-manual/extensible.html#setting-up-the-extensible-sdk-environment-directly-in-a-yocto-build
https://docs.yoctoproject.org/sdk-manual/extensible.html#when-using-the-extensible-sdk-directly-in-a-yocto-build

I can fix both the test and the documentation to run first native,
then target task explicitly, but I would really prefer to make
'bitbake build-sysroots' just work without chance of failures.

Alex

