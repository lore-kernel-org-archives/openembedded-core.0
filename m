Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104D0C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 18:02:32 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web09.3620.1667325742284284554
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 11:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qajMH718;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id f37so24504421lfv.8
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 11:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iIXzw+wEMo8sFb4UuEghsG04KtYkAO7sPoRQ4dZN9o8=;
        b=qajMH718pjZ4RTCIXLHNWb0nV3jjf0WZJjGti7ELQdyIk3iX7W45HU0nIRyDrR/4Lw
         isbY0OCUtc4wgaW/f0CEl2J50JOgJ4tv73xEXf6H1tQPvddnzCl5zIsq4Aov0cxYnXH9
         8oEbY4q/vh+yyMrBQJJfXirKZh4evUaOI6NWBED9zUrbW1WDjti+mtvYSMEx44AdXSJS
         qv9iR8NX/uOvGTQnijsyu/dv8F/ftC8rqfqHrfETas/WMq/FNa68fOz7zBwg5AoL0Bk8
         X7jx+BGeb35YFGqLZcTjBba9Ecux1tZC3YxGbmwtOosDLCEIcPm5GRviU/xvtVNDy6IA
         RwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iIXzw+wEMo8sFb4UuEghsG04KtYkAO7sPoRQ4dZN9o8=;
        b=hOxx3AjUj/hxTUSuxAm+ZS85Oc5hXHm/5pMHhoV8vBv6zbboGFJaH4N3luO3Be/8hg
         rSBWdrKWGBP6kslt2YtyUipgJTXeJJ/xd6hpW4t3tfGzDFs6/+BxS+5ofZdgUo4fWRCX
         IKwzDhFIm6e+bmkPDWzal0Wo+TViv5E7JpIDKHM6mBL03Oc9lripNdYN9FzJX2I7ka3i
         0sBYjZVa1AXgxt5h858FOrXmQtzFRxp4t1chiX4GTPVWQA/1aSPhnn/oE3H7oZsAo060
         z+YxO4fjZHYEDUgeuTOdhbnTTAQMHv1tN1dctdoU2gnvZcJBvhcRJ9910F+hUsOzZlvH
         DF4Q==
X-Gm-Message-State: ACrzQf3esjGY3BL9jiElbh5J3s+VdtvWqtQKX7lrWGRluyZA5CKAaau/
	yralzUQBJT06evKnSDBy831K8A0nN/JJu4xtn04=
X-Google-Smtp-Source: AMsMyM7COxv+VvviLLkCzwK06WOtxTQVCpUtOPWMGdCsmlzc3HW34+tdulvAvMJ7u80IFZZr+Tb7QnXIh8q51jEEUow=
X-Received: by 2002:ac2:4c8e:0:b0:4a2:7d0d:c7a5 with SMTP id
 d14-20020ac24c8e000000b004a27d0dc7a5mr7462534lfl.367.1667325740425; Tue, 01
 Nov 2022 11:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221021233726.1751124-1-sean.anderson@seco.com>
 <20221021233726.1751124-7-sean.anderson@seco.com> <f8039bfc391404e83464c6894ce3ebf5496f1da1.camel@linuxfoundation.org>
 <dbd14d02-ad22-1036-d659-f71eb09a0e83@seco.com> <514b492351ff6be577b80881adbc6b508fc04071.camel@linuxfoundation.org>
 <b0708cba-a038-7031-58b0-c08ef0fe6625@seco.com> <1c053ef1a0c03728cb09f5259a1d52adc631460c.camel@linuxfoundation.org>
 <cf9846db-f142-e8bd-3fbc-51a430b5684d@seco.com> <3720dadc9a760c068eed340cd7877c92b6ffd482.camel@linuxfoundation.org>
 <3b106bb0-ecdb-efb1-1a54-7ad6ae345852@seco.com> <42bd04f74f012c2bf921c486087a6659c9534756.camel@linuxfoundation.org>
 <3eccb82e-73ac-1e79-8a99-0d6b3cc7839d@seco.com> <ea92c4e3fda1e06defc28532e8f0b1c7205e09c1.camel@linuxfoundation.org>
 <c4d27774-ec17-e171-6470-1730441b5b02@seco.com>
In-Reply-To: <c4d27774-ec17-e171-6470-1730441b5b02@seco.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Nov 2022 19:02:08 +0100
Message-ID: <CANNYZj_z52Y+nkU-uJFYPJVRj2a1CgT9xbHqs+rj0c3TtuPH6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] u-boot: Rework signing to remove interdependencies
To: sean.anderson@seco.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 18:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172378

On Tue, 1 Nov 2022 at 18:54, Sean Anderson via lists.openembedded.org
<sean.anderson=seco.com@lists.openembedded.org> wrote:
> If you use a tool like b4 [1] it can automatically generate a summary thank-you message.
> As an example, [2]. This keeps the number of messages down and is not terribly
> burdensome for maintainers (since it fits into the usual patch workflow),
>
> You can set up something like pwbot [3], which integrates with patchwork
> and your repository. It produces messages like [4] automatically when it
> notices they have been merged into the repositiry, and marks them as
> "Accepted" in patchwork. This is even lower effort for your maintainers.

You are very much welcome to set these things up for the project and
maintain them.

Alex

