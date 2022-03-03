Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B13C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 09:53:51 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web09.9215.1646301230684949429
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 01:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I37B62K0;
 spf=pass (domain: gmail.com, ip: 209.85.217.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id t22so4899016vsa.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 01:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0mtoeWGUxAH5jhofK3koAQTrEMJLXUyCoKgAtT0/kBo=;
        b=I37B62K0gOn/hEMuei4+mjnjaIdrqt0QsfrfQP/ATTOaMaQrhG3mpUCOdhu5eu/y5H
         OYZvu1edsE8+ra9YsFnakHMiGONrYrr4xDT4lCVEY3SxIvOoLyogdwXZaLMNiirRYsbu
         gL/JRWxRxgltGLfLLzNwqMdqdAbhSZOcj2igpUj1dyWJZx4db9aVq1Q00QoBfgGagY8U
         +D+M+Si5+vuckEhebhARToWMN4rEwT14gDbtZYpqec+E7Z6e83hP/3CCwj0/4/fBs0US
         3ntyiq67VvdMYLGEEg8Otg9fV3He2yZXfvvSihUscM6Odkxe22xViNvPoS3sBCvJuhFi
         NfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0mtoeWGUxAH5jhofK3koAQTrEMJLXUyCoKgAtT0/kBo=;
        b=i4F8HxJcn1uC+6a3uHxKFyiBZHpEmiye39OQ5VrtODNm6d1Mn1gA0nqn3x4DJEiswk
         qQOl55+od1cMlRq9nS4B9rmLGw2ypM9G1ZrI6oaE+FgGurKE845ifzWanIJ2J0af9+9a
         o2bXay18VOpz1pxlz1G8qtqcBkT87Hzhxt5QLqR4s3wyO2n4JrFAy0IWHdl4m9SzYv2r
         /+vm+E56WhGlXOACOEa/F2BgzRe0uCOARJBzyhrSIEojhWITM1tNzUo4wN1EAA/3Re1T
         H/1QG9HKwo+XzBD86oWMOnY26FUlk2wu3CKmwk8GIWmjWPBDZw75hOKmB0sFXb7qwTC7
         MADg==
X-Gm-Message-State: AOAM5318DyHSq0TPH5ZL/Z2RkVDHmpK1Tn56wPzqvJi5SYyVPAiUwmW4
	r07DjufV83ytutncU9YrLynOO7OnhSz/RxeudDE=
X-Google-Smtp-Source: 
 ABdhPJyDuO9eWL0pzDverHh4CKlVPs1aPVyweEUB8rnwmUIr/acdq5fhU3rMVcwdLqTUWQnum5d0CXvCm3hOabUD3Lc=
X-Received: by 2002:a67:b447:0:b0:31f:6e94:af99 with SMTP id
 c7-20020a67b447000000b0031f6e94af99mr2867678vsm.81.1646301229709; Thu, 03 Mar
 2022 01:53:49 -0800 (PST)
MIME-Version: 1.0
References: <20220303093324.1663870-1-alex@linutronix.de>
 <20220303093324.1663870-3-alex@linutronix.de>
 <CANPvuRnmai3wQZY-P9PT0z=iYephBnYkwf1E=7qFAuD5vMqjxw@mail.gmail.com>
In-Reply-To: 
 <CANPvuRnmai3wQZY-P9PT0z=iYephBnYkwf1E=7qFAuD5vMqjxw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Mar 2022 10:53:38 +0100
Message-ID: 
 <CANNYZj-v0L_gm8d0Wtjcvt+gAVBQE4qMDhAkroTiXThR+ZiaOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] glslang/spirv: synchronize with the rest of
 vulkan items
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 09:53:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162642

On Thu, 3 Mar 2022 at 10:45, Jose Quaresma <quaresma.jose@gmail.com> wrote:

> Is it possible to add a reference on the commit message for this change?

What kind of reference, like a link to some kind of upstream statement?

Alex

