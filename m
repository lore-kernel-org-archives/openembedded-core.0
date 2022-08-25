Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECD9C04AA5
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 09:19:38 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.21889.1661419168334351828
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 02:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FJmxpz61;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id n15so6324402lfe.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 02:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=CkCipoSTDl9lkMP6ffYQBF4WducJ3YA9SmBDnQ87Erg=;
        b=FJmxpz61RR5et0xe0r0UNgq7fzHr5gR/Dhyyf4vV4yi/oASDyuBdB6XuYgX5i4BqXL
         Yukv9gSAxw6C8Z9jywYtYZr2Xt7W/7y1fJMl/nSQhfvVVZAQXq4wDwhc1Z/xJExedMmm
         Kn+NrYJfciQopwUcqIpeXWK8mHmF9FkA7ThL8LrZuckyKPoMMIazO1BnVNCN3Fusf6qG
         7XKNpfcqTxSEIIJTkmVM2biqjF0Twwr6d223ZT3V96FSq00FXISY1hEgxS2sQawUxI6R
         6+0NnzaeenA9iBrThIQ0NCCUhgF9caWlrlXGq19BWPYzth5KYPtfDpZW507vc8bSlTqq
         yetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=CkCipoSTDl9lkMP6ffYQBF4WducJ3YA9SmBDnQ87Erg=;
        b=wToGOSFidDyh3yVWk8Q7cCw0BNAXZ18SvMwrAk6tf0Xkt5xtXrQL/yOfCl8RnEah2d
         o3Jin2tyDjRBKAPncnEoy+/vY1WFJAv8/97xCQoOajmZ38Ty1LcoJFuXyG0VuRci1yrg
         NvQGsWN/7Oo2HM8h8aAsZd2gjWzyRXv3bj/nKHr9dJuXTyoeoAWjaW5G1tps1y6Bj7ur
         z4ZAIygeIW3w8ajp43HEY74T9OH+kbMoJ1+jquvMZfCt/8FJ7A1W6bnh/H0UspG37fgT
         M4Z3qlfNrtAisFsrb0jF1dab4H2YhPIldxTraMayuLTyDxsnLTCJbTz3oh8fnK56CV2w
         eoYQ==
X-Gm-Message-State: ACgBeo03v+algKGN6biYBpT+jXiMeQ7qA8cG3FQOrsUW2FY0oKCQeKam
	w2HbRglhLMtj91prYm9hJySxxyGTRbp1cdjvX1U=
X-Google-Smtp-Source: 
 AA6agR6Iwt0+pT85u8JulQ/FuevzNp4uzF8Smnu+Y6GXoStHNq57y49Em3h0CncWqAND11aaYzM0TW/FRFY5Fj6qzwM=
X-Received: by 2002:a05:6512:2511:b0:493:50c:ec3 with SMTP id
 be17-20020a056512251100b00493050c0ec3mr823170lfb.665.1661419166413; Thu, 25
 Aug 2022 02:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220824124234.3549247-1-alex@linutronix.de>
 <20220824124234.3549247-2-alex@linutronix.de>
 <c1b4303568ad4fd2a1c7133bde18ad53@axis.com>
 <CANNYZj9KH13zkN2Lu7ToaqRGcXdPBxbUT+v3U0HezM5sYa0bTw@mail.gmail.com>
 <aa755beb07f143619c3c7fec974ce2a3@axis.com>
 <CANNYZj-FYOOBqPBs3sZuXQqse1nrtRZXeKrKjMg=YZgt2neSKw@mail.gmail.com>
 <57b46d76a2174cc487c8a210c3539b03@axis.com>
In-Reply-To: <57b46d76a2174cc487c8a210c3539b03@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 Aug 2022 11:19:14 +0200
Message-ID: 
 <CANNYZj94cymsa-TmkcMmHWm2FQ6CvRvKE3_eCy=t63x9NFZnhA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] scripts/oe-setup-builddir: add a check that
 TEMPLATECONF is valid
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 09:19:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169839

On Thu, 25 Aug 2022 at 09:19, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
 >
> > We are trying to move towards standardizing build configuration
> > management. One step towards that goal is that config templates must
> > live in meta-some-layer/conf/templates, and aren't scattered around,
> > or generated on the fly. This rule only makes sense if there is some
> > way to enforce it, which is what this change does.
>
> Well, we gave up on the static templates almost immediately after we
> started using Yocto when we realized that they did not fit into our
> idea of being able to mix layers in different combinations in different
> builds. We rely on repo fetching the layers that are supposed to be part
> of the build, and then we generate a bblayers.conf.sample that matches
> the fetched layers.

The static templates is only a starting point. The next step would be
to support prefabricated 'configuration fragments' stored inside
layers that can be dynamically added/removed into local.conf and/or a
distro definition, so ideas for the design and UI would be welcome.

Alex

