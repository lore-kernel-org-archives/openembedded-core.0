Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CB4C5ACB2
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:48:27 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.14981.1700059701877371259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:48:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JgQk1eEs;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c501bd6ff1so92577471fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 06:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700059700; x=1700664500; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sH/BqJCtosUN0rrWqr90KDyeWeAfP+WBES+t+MKel1Q=;
        b=JgQk1eEseC98tbgk+7siWymNtSHI3B0RS+ejDWm1pvWSCMW8KJsX7O04Y7LxTqzi11
         LkuV9wGAHrikkckj1hNAKTq/i/5/3W7dDJszBfL/JiZrCY8IHKltkGHPvr21aRKuZJil
         XNCSjGgi4Xv1xVbM3Pr0SNq4D5WZA0MkXYifyUJ0RfYK70VeSNsRMMgZVeEYRV+NWhl0
         Jezlkqz0ti84bbNZrf8l7qQwP/TPRFFevrFz68P9TYjq/RS2dR+9ZN7n6c3hTsq+jpDi
         nFxqsC+vx9Q+YKIFUStn6RJTfvpPFoElvZo5ksl8mtzKIH2dWEHRnB7ajub1URO7cC8r
         Uy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700059700; x=1700664500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sH/BqJCtosUN0rrWqr90KDyeWeAfP+WBES+t+MKel1Q=;
        b=iId8j4M1fyEDHwXugUVxkxuXq/Qm1DLQMqwEaW7QzLF9ldW0wUWN2eecM1HMqwfAqD
         BuZZPjJvZjC9WEq/4c2DDrFPg5syHT6sRsGWmZh/xzPU3LFfYvhlmSjPKynNvco61EJC
         I2Pj7B2xKOaKHbDzX870SbSbgVmvrBRgYXTeThqgqMFfHKhum0wB57Nc8CtX/jYTPItk
         dyHv5VIh1aJoZXk6ewViXBXp/eaZaV+rWIshVn5vuGarQiuByAgI/75Jkx8Gdt6rFLgJ
         LYOz8To3j8vx9/0qPsGOSWLQaMiNUUuySLcc81VfFtCyhPW4DANck3ice24buyN8p4X3
         8juQ==
X-Gm-Message-State: AOJu0Yw5/vj7t5FOj/D3Gg0ftgZ0Fbsn1eEjMsoY+mwsnbcKVRK7+QU9
	FcNG/XF/B05hLq9SNYE2CBniy4Ctoyrhnj42voQ=
X-Google-Smtp-Source: AGHT+IGi2T8nwdWwsJ1IjWzb68y6XdMuV8VThPFI4TLPil3Fm6A1CL6A+OPc9m1SpQqi9iygtRaRwLPZukS4nFEDRWY=
X-Received: by 2002:a2e:8648:0:b0:2c5:32a:cfe8 with SMTP id
 i8-20020a2e8648000000b002c5032acfe8mr4645714ljj.44.1700059699432; Wed, 15 Nov
 2023 06:48:19 -0800 (PST)
MIME-Version: 1.0
References: <1795D005C571B567.15940@lists.openembedded.org> <94196e06-f078-4df5-afee-e29c05f11b37@windriver.com>
In-Reply-To: <94196e06-f078-4df5-afee-e29c05f11b37@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Nov 2023 15:48:08 +0100
Message-ID: <CANNYZj9+N9ezYB9yiPsHUjgHCUdStYJWEq3_8mQDQXxswxfVOw@mail.gmail.com>
Subject: Re: [OE-core] [RFC 1/5] valgrind: make ptest depend on all components
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:48:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190730

On Thu, 9 Nov 2023 at 03:00, Randy MacLeod <randy.macleod@windriver.com> wrote:
> As I said previously, I may not have time to get back to this until next week so
> if anyone picks up this work, they might want to confirm that this is really required.
>
> I should have just waited until I had time to complete the update before spamming the list.

Thanks Randy, I hope you find time to complete this, as I'm planning
to work on other updates. We're falling behind all over the place, as
seen in the latest AUH report. Rust would be nice to do too.

Alex

