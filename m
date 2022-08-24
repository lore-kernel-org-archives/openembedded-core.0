Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3777C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 09:39:51 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.9023.1661333985042692798
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o4U/Fbz+;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id l19so12734158ljg.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 02:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=i5BFDgyauPN7Wbnh5P0TL8hP+e5dEoJhil6eFM72aTY=;
        b=o4U/Fbz+vBKw7hnUPupeiR7AZtKoci/U8cUmCzIdF3mwfj23YId+Lt9wORZeemq4ox
         t5KjKFna+e0I025iUxw6I/XAIT64I0G5eXeC9LtqyuJ3bqQsn0kvFoF/+7bfO2EZilnU
         eHxFffng3wSYnH4IHwHgnQL+112rcQtwkrml+5VdHUp4ZR3eF5FU7My3E0/r7ocDDBpR
         KAzk18cYRe7LUVodVnI5BHGJI3VT4FV++x/1bRB4JWhQtO5W2ea/Aw4i6gG49tdy9VnE
         rfJ31XSluqrtEwfSbkGTDa4fEEByxOyMlO546ye2Gl/Jyn0aLJ0bEK1mdySVa89p4Rad
         iOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=i5BFDgyauPN7Wbnh5P0TL8hP+e5dEoJhil6eFM72aTY=;
        b=lbaeNVJUakc8hiF0BhpDeT6CF6no8IO0h+CKbN1prpMlO7rFv/ZqS2r7rrANlqPhwH
         UkZcCU4Hi21AZBz53Ym2BgLVHP/rNE+hMDC3ab9M4oVKcvG8ITWArsN9g+INjsun/V6t
         wswzB+5q3HBU8/w+ePXiO9L/A2/B9TS2uIRGH7tWdhafn0ZzvsH9vFXqJrldXJJabkpR
         CeK8itZ6FYHuA9gz2VLaizpGs+WDPF43m2VZI9ybeQE+T7qDpHgEU6+FHAAXWLQCvr6n
         8fvggYTA3U5faH4pN3KWIXGVX6R4Ohd8Z9gSRi/fZU1CeuH6XI6kigYlMJM1HqPxWSC4
         uUcg==
X-Gm-Message-State: ACgBeo2cnq2RvkfaC6lfqZYC9HLJep28zoysWOrsfiaWkZ8og3Z8ubyP
	+E8d3Rtwf8Xo1pGvbDV+cxD65V3z5aQr/BHJtfo=
X-Google-Smtp-Source: 
 AA6agR7nACvtdYVY6SLJutLFIEc1G5Y2RNsb3x1FD3peNVHq9DOn59z6vxu19pVHb+K7ACem3VcWcvmovO7pNOczTas=
X-Received: by 2002:a2e:7e0b:0:b0:261:bef1:a32e with SMTP id
 z11-20020a2e7e0b000000b00261bef1a32emr6677389ljc.41.1661333982999; Wed, 24
 Aug 2022 02:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220823235624.2488133-3-andrei@gherzan.com>
 <20220823235624.2488133-6-andrei@gherzan.com>
 <CANNYZj-XzOu-zd1aTn7aQ0DyrsiN8J3mOPuG-4wcJw0DzegRww@mail.gmail.com>
 <c18472e4-db71-491a-8f9c-b82245c47800@www.fastmail.com>
 <CANNYZj-LRM_fR3zuRQrR4kkhY_TuF5pGPBDePDaLbEWSJaoQQQ@mail.gmail.com>
 <d0b7534b-bbec-43da-9a02-2fbd9fa453f4@www.fastmail.com>
 <CANNYZj8+qFQzobfqrow-LmbJ+Q8e249dTpz-xa1Rx4JN8OvSiA@mail.gmail.com>
 <d90ffe02-9459-414b-9c9c-758bfdf6355a@www.fastmail.com>
 <CANNYZj-9x5KFk-FMp9tbfDkPa-8uyhPx2R+rHvfsxufS+w1NkA@mail.gmail.com>
 <d040d16d-1354-4d8f-a5f3-ff681e6efa22@www.fastmail.com>
In-Reply-To: <d040d16d-1354-4d8f-a5f3-ff681e6efa22@www.fastmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Aug 2022 11:39:30 +0200
Message-ID: 
 <CANNYZj8q9otP4D_72P9SJAStrx+FvVfrGbWp=k4iBxr1Jv_-3w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] shadow: Avoid nss warning/error with musl
To: Andrei Gherzan <andrei@gherzan.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 09:39:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169802

Almost there :) As the patch was not actually submitted, the correct
metadata is:

Upstream-Status: Inappropriate [issue reported at
https://github.com/shadow-maint/shadow/issues/557]

Alex

On Wed, 24 Aug 2022 at 11:37, Andrei Gherzan <andrei@gherzan.com> wrote:
>
> On Wed, 24 Aug 2022, at 09:56, Alexander Kanavin wrote:
> > Thanks, can you also resend the patch with the link to the ticket included?
>
> Sure. https://lists.openembedded.org/g/openembedded-core/message/169800
>
> Andrei

