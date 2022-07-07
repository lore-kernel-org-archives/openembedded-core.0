Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E78CCA481
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 14:48:35 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.6410.1657205311807154333
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 07:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EZyV7pUJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id t19so30904353lfl.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 07:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gg3HBIaQDWnokFpJ1LnRhcvRIrkQgLfvNCgb0itjLrQ=;
        b=EZyV7pUJdPwERcRCcSE137zOAQZ/65lnEVsLl3CGSSHontD9hmDghlfYCQLnA1rFmP
         lr+7QGAHQXPx3eJiK0KQUgGntifqWlee+/GEdY/EMNY6Kmj+Vlh2BC+zQwA41RYDLB9f
         kbw8MHqk3QN5bFQhVarRroMg9MxBiB0j/4KsqNbmSkBVCH0L/GhWMREOAaQu10le6SsL
         S+NGlA3kG0cx36Ud/76f3qylT7Gqc37e1Y13wns8lHWVu9fhfnFojiuKnj66bm3eiHQg
         unibfXCzZvm/yjhmhQsA4E40XGQabDcYm/kzAuRvuXKbXqS/9fps1wShvoTyhupKSp1G
         1prA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gg3HBIaQDWnokFpJ1LnRhcvRIrkQgLfvNCgb0itjLrQ=;
        b=Bq8DjcgDnHQFDxsBofBKQKbVvfjMKzGX1qFfJMlOwjifzPnIGleUGpKq/HnHNoPh9A
         mvxzSeTwRh8RI4m52dqplW1GC8h3R9id05yM5pQp1eEAIcnfBXWRD2WXDqe+CZO0SSQj
         yxk6FRqEh2x2wHPblRhJJ+UFD5p0G+sPqok65DcPK6D4e880WIFuN0BZSuFRHBcNwhbl
         Z+Fw/Izyp9tsDuZvu+1i+fvRYULW9ZUBNZFtF4a+LypQmXvI5zWWwOAJI0FveJqMAiHX
         U5DhHRYG1xVk+SOsYz7PdhpWt101Vijvt+pUygYQ2FTW5Lz0YUeQbtVDy6NY39USObzQ
         r95A==
X-Gm-Message-State: AJIora+u6m+lG5R86UmcFLUIvcoGI3UBu4cBe4OfpW4dktvJJiVsYE3C
	5NptMo/XhifblywhMOd0/lx51L4FCmXbHzBiT30=
X-Google-Smtp-Source: 
 AGRyM1ulBgiALpEhX3x41kG/fUtSk1mK/nOd2Aq3FNnyEmSWgQPn4+cUQtTqR0qqEFV4T8Jvgh43O4q/MPzd24jgXEQ=
X-Received: by 2002:ac2:5597:0:b0:47f:8d1d:c63d with SMTP id
 v23-20020ac25597000000b0047f8d1dc63dmr29367554lfg.521.1657205309884; Thu, 07
 Jul 2022 07:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220706182329.3085564-1-alex@linutronix.de>
 <d04fa3ca7398489a99f8356b17f1174a@axis.com>
 <CANNYZj-Dtx6ETvTTgtJUE6Eizn-S=vm=Oug=cB3zRsQCC7AM=g@mail.gmail.com>
 <4573c371d989428899b884116c47fff3@axis.com>
 <CANNYZj8pEFcM1g_qOVbP1HDUE05yjQwyxsJpLM_em3NRPnM6kw@mail.gmail.com>
 <9ae77d11ee2848b4992c5c104928664b@axis.com>
In-Reply-To: <9ae77d11ee2848b4992c5c104928664b@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Jul 2022 16:48:18 +0200
Message-ID: 
 <CANNYZj_QKZzhhiDEcor5PRV2XgZ70CH+koyaH_oaP_dJW+QORQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] scripts/oe-setup-builddir: copy
 site.conf.sample out of template directories (if it exists)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 14:48:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167784

On Thu, 7 Jul 2022 at 16:38, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:

> And in case you wonder what that wrapper actually does, it creates the
> bblayers.conf.sample file based on all layers that are found in the top
> directory. It also creates a local.conf.sample file by combining fragment
> files in the layers (i.e., local.conf.sample.XX where XX is a number
> between 00 and 99). The local.conf.sample from meta-poky is considered
> to have XX == 50. The reason for this is that we quickly realized that
> the static templateconf directory setup was unusable for us when we
> want to be able to use layers in different combinations.

Cheers. I'd say if you need to place lots of customizations into
local.conf that's not a recommended setup to begin with: as said
elsewhere it should have precisely two definitions: distro and
machine, and nothing else. What kind of things are in those fragments?
Should they be consolidated in machine and distro definitions?

Alex

