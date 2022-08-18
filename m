Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD22C00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 17:32:33 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web08.45150.1660843947140409283
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 10:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HJyhYn1C;
 spf=pass (domain: gmail.com, ip: 209.85.128.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-3378303138bso19903257b3.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 10:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=F9AhviDM8P5rwucKK9NPFCzjOmsVkEiAYyWZMww8E1U=;
        b=HJyhYn1CcHnJj2fmlDuHj0foXUkSwmGYI6CasN8S5WorGc2GW0tLF0MDvqdnPHPl1T
         w0l4Ck0tpfkbgVodeVY9N4Kxl1NtWFluV0nxccr4w1fWHyh12whYMjUEyyBFfWQ47tRK
         Sz6VX1JiPivTldBj5Vl57RZmChVrY+52aboqKIoUIcO+/oavmNA3nh0h0Cf+hXFJdpJP
         L1eI1o+7Lt42rl4/BLEt80E20snjBWrMpXcNMN1slO3oCE7XR1Ys/m0SnzJQiLuhRPdd
         oOXmkmSLjA0IbEm2YyuGzHY3tj+5TMF14XqHvJtNY9w+59A8VUfzaitvvlILYFCtLOdy
         QbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=F9AhviDM8P5rwucKK9NPFCzjOmsVkEiAYyWZMww8E1U=;
        b=ZKYkWVKMDWk4Mp7VWtysL/wPSIrV3c8p9n3oT6M1TXUtLeBmAMeDOK2EbRcxf1S4ah
         8/yP7dJTLYrAey7Ob02+xFm+gKQ/QFg2Ln8UXS1Fyk9htzyIfquqjcIX/e6GkUsD3mK+
         S55VNmcKbiTFfvFp0YpQ+Rfl3wU0xPO/dWz2qPFBPnMlh492m231ulUvHxjs3nCKKTjr
         Zu8GXCPgjYU+ERsxDBkFm9RKmXmSh3S51YS5RW4kWjWRMA7kvnkbEcEJ6drRaSYtC2ws
         Po8AYCGTXHnw5LlHreYg9/gflbGfdlEBao0y/mHqfHb+FLO1qyiRrR5F1PWkpsB94MbX
         +xJg==
X-Gm-Message-State: ACgBeo0XFkVCKRu4OKITfsjeGZvX5UwoxXA4jyj9odEUC1PRXmtr0hv6
	v+yL7G74FxtxbMBtJqx+b/9Mc/qo8xe7v3noKzE=
X-Google-Smtp-Source: 
 AA6agR6jsY2+LHsyKCoROaCQ9vc8oaBDBKOwMM39/IS5tA+cd3cA/II1KeIU5r6OlrUQqXU6x8cGM+J6uTWqS/qVoSk=
X-Received: by 2002:a0d:f204:0:b0:333:c23f:d793 with SMTP id
 b4-20020a0df204000000b00333c23fd793mr3928578ywf.71.1660843946003; Thu, 18 Aug
 2022 10:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220818111703.1858-1-jlu@pengutronix.de>
 <20220818111703.1858-2-jlu@pengutronix.de>
In-Reply-To: <20220818111703.1858-2-jlu@pengutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Aug 2022 10:31:59 -0700
Message-ID: 
 <CAMKF1spo5nbjvHpxsyff3_dv7Da7a0YP-vkSLXg16D1jHmS78w@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] openssh: add support for config snippet
 includes to ssh and sshd
To: Jan Luebbe <jlu@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 17:32:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169535

On Thu, Aug 18, 2022 at 4:21 AM Jan Luebbe <jlu@pengutronix.de> wrote:
>
> This makes it simpler to set specific ssh/sshd config options by adding
> snippet files to /etc/ssh/ssh_config.d/ or /etc/ssh/sshd_config.d/
> instead of modifying a copy of the full configuration file. As new
> snippets can be added from separate recipes, targeted changes can be
> done in multiple layers.
>
> These specific directories are also used in Debian's default
> configuration.
>
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> ---
>  meta/recipes-connectivity/openssh/openssh/ssh_config  | 2 ++
>  meta/recipes-connectivity/openssh/openssh/sshd_config | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh/ssh_config b/meta/recipes-connectivity/openssh/openssh/ssh_config
> index 05eecb465ff0..ca70f3737596 100644
> --- a/meta/recipes-connectivity/openssh/openssh/ssh_config
> +++ b/meta/recipes-connectivity/openssh/openssh/ssh_config
> @@ -17,6 +17,8 @@
>  # list of available options, their meanings and defaults, please see the
>  # ssh_config(5) man page.
>
> +Include /etc/ssh/ssh_config.d/*.conf
> +
Generally looks ok.
I wonder if this increases security concerns with such blanket includes.

>  Host *
>    ForwardAgent yes
>    ForwardX11 yes
> diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_config b/meta/recipes-connectivity/openssh/openssh/sshd_config
> index 9c5380589013..e9eaf9315775 100644
> --- a/meta/recipes-connectivity/openssh/openssh/sshd_config
> +++ b/meta/recipes-connectivity/openssh/openssh/sshd_config
> @@ -10,6 +10,8 @@
>  # possible, but leave them commented.  Uncommented options override the
>  # default value.
>
> +Include /etc/ssh/sshd_config.d/*.conf
> +
>  #Port 22
>  #AddressFamily any
>  #ListenAddress 0.0.0.0
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169519): https://lists.openembedded.org/g/openembedded-core/message/169519
> Mute This Topic: https://lists.openembedded.org/mt/93100986/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

