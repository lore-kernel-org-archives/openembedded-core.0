Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F0EC0015E
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 14:08:23 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.43645.1691762902347966918
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 07:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=BYY7lJbK;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-76c64da0e46so66685839f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 07:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691762901; x=1692367701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0orbdhc4zoIdZhbXp9JoEK/bJOepH1R15/G2NxjFmE=;
        b=BYY7lJbKyHV487PFSGXw20vbWlogHcXrGxavaEMZeljrpNpSxiL5iSWbQrJMt8Lnk0
         PYyNyeMpaPXeSXsxiQvyw5uue1uQQAOmDZbTx39HMDBNZ++K6+f0ekBNt6xQuB2RWTrC
         7Ef/wo7W0/t4rZOpHWez9POUDwnvheF19EQMiIDXxcFm3FHF2KPGCU6Ewt700gU0qRwq
         EvzxTzK85pOmv+1/a14CwZrI6tBSQmbq0a9Q8mJYKtq9RXOdv0jzxGyUXPr1/g1nNgQ4
         CLqKMr5N7AZjp0VkTFTaGIII9/uKnHCil+6S1oSmnFafv+y76gTMMdIHbGwnj6Y8PZaa
         3K2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691762901; x=1692367701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0orbdhc4zoIdZhbXp9JoEK/bJOepH1R15/G2NxjFmE=;
        b=KH6/K0cROAeQ9denIiRy+Q2m3HOjVD/2jJ7eMCukfQerDlKr0pJWwAMyO1Cyg0SAa3
         HLvWL4tKHhhitbW7wlrftYRlC+EBcstaWZzQx3bEVQ+FprUoC248j6W4ef9q7MQu/yoR
         ZRlZGrzd3pE2nNvvDAOXECIMOQvUF/G+NlL74eFiyr/fGLaZb3hjZ5gaSp701g+ZGZc4
         R/3zE7OCS2w3UBtHPif96eCK21Tv7PDwjZpT99EINDyyOzbSKjshLgsU2BWMbly51kQw
         +DxdR4iLJZnoyz1PjnLeqOvaF7yRBz8zsNwMqpV42xlsP8SWuSRpvsANckc0NkJzuwF/
         clVw==
X-Gm-Message-State: AOJu0YzDNJ6DeCIckk4Op907nUhbE9czj9DbEucQZx0jEM/+BpyNeExA
	7DFFkWNNySJg5ZlhwVrLiQgvxMhfPGJBxFXDiL8=
X-Google-Smtp-Source: AGHT+IEUy+eAB+EKptSMuOlFxaBMN3pqdFNy4npR0DBTuj9bPcfsQADXJWhv1WFqNAHajxLfYqypagS+Smjb1ja2bC4=
X-Received: by 2002:a6b:e004:0:b0:783:56f2:e733 with SMTP id
 z4-20020a6be004000000b0078356f2e733mr2679073iog.4.1691762901467; Fri, 11 Aug
 2023 07:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230811133541.32176-1-richard.purdie@linuxfoundation.org>
 <CANPvuR=4dx_Ob_g9wgLHpi+sh029Ge=RGBVko=5eCf0znVkauA@mail.gmail.com> <ef79f3ac2155891e59a9eeef14e8798842d70a79.camel@linuxfoundation.org>
In-Reply-To: <ef79f3ac2155891e59a9eeef14e8798842d70a79.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 11 Aug 2023 10:08:14 -0400
Message-ID: <CADkTA4P=cdJeg5e81nfjWM9doE0GJRYeL+7cVHTogxoOy60RfQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipes/classes/scripts: Drop SRCPV usage in OE-Core
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 14:08:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185845

On Fri, Aug 11, 2023 at 9:49=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2023-08-11 at 14:45 +0100, Jose Quaresma wrote:
> > Something to warm the user about the usage of it on existing layers
> > around will be useful in my opinion.
>
> It is harmless but I'm sure we'll reach a point where we do something
> like that. There are also docs changes likely needed and so on.
>
> Right now I'd like to get the patch series exposed to the real world a
> bit as I'm fairly sure there are some issues going to crop up with
> this.

I'm preparing a similar patch for the layers I maintain. I'll put it
on master-next for soaking once the bits are ready.

Bruce

>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185844): https://lists.openembedded.org/g/openembedde=
d-core/message/185844
> Mute This Topic: https://lists.openembedded.org/mt/100683548/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

