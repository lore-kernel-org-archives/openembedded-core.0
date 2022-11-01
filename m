Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37696C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 18:41:12 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web08.10301.1667328071325556158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 11:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bVddT2Im;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id o12so24642650lfq.9
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 11:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dQ2HP1TReWsOkZDQwmsQe/SXi0bJ9FPWmlZmsjesakM=;
        b=bVddT2ImB7MHOt+zjilijUpEJSXKGQf5pR9yntwlr+iIY9m4u9mVSNcQcXIGnDb3y1
         waTxU9sO0jxtHyMZbZCcr4Sa73fWOHkXIJTDlVLxqIjNdyFDh1DYNkXn4wjp+r3tIyTe
         lR+Z1VQ0Cy9tSUj4r/GjKzVUk0asUyFZRoinjRtna6p2mFen7aSFH6UieN1e+dWtMhnX
         rHnUIo/z5AQeda6Fw4Ra4Fp7K8hohrXlZCiO1QLgU1nNzTgfV4G+Qzz8HX75vBj+UlGL
         qa+54QG+tceVtB5z9SaPRYnd5Ae15MGfTBPOXfcvrDbeDT3K4yvYKJVBRLmybMFrOhR9
         u/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQ2HP1TReWsOkZDQwmsQe/SXi0bJ9FPWmlZmsjesakM=;
        b=GTqk9i1OojP3KSNwJdv1VSVBHQ/ug0RxR6Fqr/23CDRLRP65sLeuTEac+fur55YDt2
         HAw/Y4fWPKi8/yC3zvKvHzqWPwL4eGrk9AV/+CDJhmhHFRSzZLhduAwUqBg/nDSp6awz
         edKp/j3CtLDRAVZj9GPizstY/LePYu2PFCEF4oC6tRT4SAzpEIkX3EGpzoqJ3V9vyiti
         WEF03taSB6hwVxntCZOWKyquTiQ3Vx9ykiqvHN1YwCZK/SzR5FNFc1aKNozomLmNHvGe
         6/73NPCiJ7LONL1YdIZuKtEpjc/2iuQf0wz5fQLt9OixT0aLzMIqznTyY/ZHh21nQJHX
         PosA==
X-Gm-Message-State: ACrzQf35Odiyr9kWyL5+YCXv4vVvvber3PLCdDGIqRZ3tJ3n7jTJrjbp
	1OFF9wacZQ5F9py087XINcj/iH3pknJaPUHTJvk=
X-Google-Smtp-Source: AMsMyM4iuJHCh/tX37hwe9q2d45myXiCq3XPTx3GRRZHUZqlRUvT8e98Zv1JAYx1OQMb07tOIG+HKlvAljGOwHaNjuI=
X-Received: by 2002:a05:6512:1154:b0:4a2:4f74:f47c with SMTP id
 m20-20020a056512115400b004a24f74f47cmr83015lfg.367.1667328069105; Tue, 01 Nov
 2022 11:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20221021233726.1751124-1-sean.anderson@seco.com>
 <20221021233726.1751124-7-sean.anderson@seco.com> <f8039bfc391404e83464c6894ce3ebf5496f1da1.camel@linuxfoundation.org>
 <dbd14d02-ad22-1036-d659-f71eb09a0e83@seco.com> <514b492351ff6be577b80881adbc6b508fc04071.camel@linuxfoundation.org>
 <b0708cba-a038-7031-58b0-c08ef0fe6625@seco.com> <1c053ef1a0c03728cb09f5259a1d52adc631460c.camel@linuxfoundation.org>
 <cf9846db-f142-e8bd-3fbc-51a430b5684d@seco.com> <3720dadc9a760c068eed340cd7877c92b6ffd482.camel@linuxfoundation.org>
 <3b106bb0-ecdb-efb1-1a54-7ad6ae345852@seco.com> <42bd04f74f012c2bf921c486087a6659c9534756.camel@linuxfoundation.org>
 <3eccb82e-73ac-1e79-8a99-0d6b3cc7839d@seco.com> <ea92c4e3fda1e06defc28532e8f0b1c7205e09c1.camel@linuxfoundation.org>
 <c4d27774-ec17-e171-6470-1730441b5b02@seco.com> <CANNYZj_z52Y+nkU-uJFYPJVRj2a1CgT9xbHqs+rj0c3TtuPH6Q@mail.gmail.com>
 <a0b45f0c-e85a-a39a-0194-cac78767fc84@seco.com>
In-Reply-To: <a0b45f0c-e85a-a39a-0194-cac78767fc84@seco.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Nov 2022 19:40:57 +0100
Message-ID: <CANNYZj8S_6UgotwvafdXcCWthTdUD5Nj9OvmTJXCfM_q-JghMQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] u-boot: Rework signing to remove interdependencies
To: Sean Anderson <sean.anderson@seco.com>, 
	Michael Halstead <mhalstead@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, akuster808@gmail.com, ticotimo@gmail.com, 
	RAJ.KHEM@gmail.com, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 18:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172382

On Tue, 1 Nov 2022 at 19:30, Sean Anderson <sean.anderson@seco.com> wrote:
> I believe in order to set up pwbot you need a computer with
>
> - The git repository you want to track on it. The easiest way to do this is
>   probably to run it on git.openembedded.org itself.
> - A patchwork API key (to modify the patch status)
> - A working email with smtp access (to send out the emails). This probably
>   means a local sendmail (or other) server.
> - cron (or something else)
>
> Although I would be happy to help set things up, I'd need some help from the
> people responsible for maintaining these existing services.

I think Michael Halstead can help you with access rights, if you'd
like to look into existing patchwork instance?
https://patchwork.yoctoproject.org/

I would very much like to see confirmation emails when things get
merged into master. Complete absence of feedback in case of success is
not friendly to first time contributors, or someone who does it
rarely.

Alex

