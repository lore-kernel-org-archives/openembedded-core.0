Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222F3C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 08:27:59 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.2945.1678868878010434644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 01:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i9VsZAXU;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id d36so23261950lfv.8
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 01:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678868876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Pe3plY7xnLVogHEZYGCFY+TufY77GdFqF/ySu/hIvs=;
        b=i9VsZAXUvx0hC0TRNOVi5mHd+bru/JgPSMMEKsSnTZ3IxzZEXt/jAyAWHuAfKDcdFE
         xoyS79ENrgMndF7fq7SR13aZXqcNfUOTFWNJVpRmYouYupgH82NwMfHMaIo03KXyvXzD
         y9UfV3XU2Yo9EFx2T6v8a03lM+frnez4OT4dg1UfLXm3EenvFT6jAwKA7Dc75W7qloa3
         +Jh7uIKP8HSaLGPSEYeIWspPokNZrjw4eLfnPNFCZoaxfTEZxj9z2cuvA3bHjaTQX3Tm
         5JKQuiIuhnLkRnqub+keDSCzvUsXfFFgWuiQlfShwSrY4eQr1uXahbf1OWRx3gEMWSey
         AW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678868876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Pe3plY7xnLVogHEZYGCFY+TufY77GdFqF/ySu/hIvs=;
        b=LmXupaMOv/pBJFt48SWHx/ryCmzFIqCj63+lfG+YwADz4bnJV65rRyxCQDuh2M+kMi
         ns+2wZk078o30l0PKddWGyI6OmqTnsPZQ3HRop3LVzGmaptBf9cK8vL6FGPErmd2ih/9
         pj9aIzblHVM8zlNSRGmgrkZi/bGZEspP8cUrku3+8DkcM5SqEWz5u30LMo/n9vOtfEJR
         foWGvDzcQVSFKNCGuDeeGhN8wFazCxNAwyw7l7CpGToLX8kvDlZHNhj8bbQaVS1xtOm9
         jSziNnt45VplX+tOgmzPxT8EoqvANskeHEJXYBK1g60AVU7Lcnel+LRPXwo+3JzQc0a7
         OuJw==
X-Gm-Message-State: AO0yUKWfqL4Z1p8rf0s7sk2AotU15Ctkl3VHeV+BTxOIdzNDsn98hI6Y
	cbRtPlzfT82fnMa9VxwAEYcHNtznzihKztcliV4=
X-Google-Smtp-Source: AK7set/W1wvmZAz1sD46WralVsvyvZEkFw4xb4oprh6AmtjX28Ye0I4ict7ik7xtuW726FneS91FrT1Zlt4kkrVxhZg=
X-Received: by 2002:ac2:5f0e:0:b0:4dd:a9e5:aa09 with SMTP id
 14-20020ac25f0e000000b004dda9e5aa09mr1637538lfq.11.1678868875738; Wed, 15 Mar
 2023 01:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230315014728.86644-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20230315014728.86644-1-xiangyu.chen@eng.windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Mar 2023 09:27:44 +0100
Message-ID: <CANNYZj_9ivjNaArbDgci4B8mM+C65NJDa3xbdPap5LBjBY=g-A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] rng-tools: disable rngd daemon start by default
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 08:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178527

I don't think adding a custom variable is the correct approach.

If you want rngtest or other supplementary tools in the image, but
don't want to install and start rngd, then rngtest should be packaged
and installed separately via appropriate FILES/PACKAGES assignments in
the recipe. Can you make it work that way please?

Alex

On Wed, 15 Mar 2023 at 02:47, Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> Since we removed the openssh dependency[1] on rng-tools, there are no package requiring
> rng-tools in oe-core, meta-oe, meta-virt, one of the reasons for keeping rng-tools
> build into the image is that it can be used to test[2], so adding an option to disable
> rngd daemon by default since the linux-5.6 and later /dev/random won't block anymore[3].
>
> By default, this option set to 0 to disable the rngd start, when this option set to 1, the
> rngd daemon would start normally (if someone really need it).
>
> Reference:
> [1] https://git.openembedded.org/openembedded-core/commit/?id=868dfb46d96a27ec9041cb902fb769330277257d
> [2] https://linux.die.net/man/1/rngtest
> [3] https://github.com/torvalds/linux/commit/30c08efec8884fb106b8e57094baa51bb4c44e32
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  .../rng-tools/rng-tools/default               |  1 +
>  meta/recipes-support/rng-tools/rng-tools/init | 42 ++++++++++++-------
>  .../rng-tools/rng-tools/rng-tools.service     |  2 +-
>  3 files changed, 29 insertions(+), 16 deletions(-)
>
> diff --git a/meta/recipes-support/rng-tools/rng-tools/default b/meta/recipes-support/rng-tools/rng-tools/default
> index b9f8e03635..02659742fd 100644
> --- a/meta/recipes-support/rng-tools/rng-tools/default
> +++ b/meta/recipes-support/rng-tools/rng-tools/default
> @@ -1 +1,2 @@
>  EXTRA_ARGS="-r /dev/hwrng"
> +RUN_RNGD=0
> diff --git a/meta/recipes-support/rng-tools/rng-tools/init b/meta/recipes-support/rng-tools/rng-tools/init
> index 13f0ecd37c..6c8ce00104 100644
> --- a/meta/recipes-support/rng-tools/rng-tools/init
> +++ b/meta/recipes-support/rng-tools/rng-tools/init
> @@ -12,27 +12,39 @@ test -x "$rngd" || exit 1
>
>  case "$1" in
>    start)
> -    echo -n "Starting random number generator daemon"
> -    start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
> -    echo "."
> +    if [ $RUN_RNGD = 1 ]
> +    then
> +        echo -n "Starting random number generator daemon"
> +        start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
> +        echo "."
> +    fi
>      ;;
>    stop)
> -    echo -n "Stopping random number generator daemon"
> -    start-stop-daemon -K -q -n rngd
> -    echo "."
> +    if [ $RUN_RNGD = 1 ]
> +    then
> +        echo -n "Stopping random number generator daemon"
> +        start-stop-daemon -K -q -n rngd
> +        echo "."
> +    fi
>      ;;
>    reload|force-reload)
> -    echo -n "Signalling rng daemon restart"
> -    start-stop-daemon -K -q -s 1 -x $rngd
> -    start-stop-daemon -K -q -s 1 -x $rngd
> +    if [ $RUN_RNGD = 1 ]
> +    then
> +        echo -n "Signalling rng daemon restart"
> +        start-stop-daemon -K -q -s 1 -x $rngd
> +        start-stop-daemon -K -q -s 1 -x $rngd
> +    fi
>      ;;
>    restart)
> -    echo -n "Stopping random number generator daemon"
> -    start-stop-daemon -K -q -n rngd
> -    echo "."
> -    echo -n "Starting random number generator daemon"
> -    start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
> -    echo "."
> +    if [ $RUN_RNGD = 1 ]
> +    then
> +        echo -n "Stopping random number generator daemon"
> +        start-stop-daemon -K -q -n rngd
> +        echo "."
> +        echo -n "Starting random number generator daemon"
> +        start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
> +        echo "."
> +    fi
>      ;;
>    *)
>      echo "Usage: @SYSCONFDIR@/init.d/rng-tools {start|stop|reload|restart|force-reload}"
> diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> index 5ae2fba215..be88ab125a 100644
> --- a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> +++ b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
> @@ -7,7 +7,7 @@ ConditionVirtualization=!container
>
>  [Service]
>  EnvironmentFile=-@SYSCONFDIR@/default/rng-tools
> -ExecStart=@SBINDIR@/rngd -f $EXTRA_ARGS
> +ExecStart=/bin/sh -c '[ x$RUN_RNGD != x1 ] || exec @SBINDIR@/rngd -f $EXTRA_ARGS '
>  CapabilityBoundingSet=CAP_SYS_ADMIN
>  IPAddressDeny=any
>  LockPersonality=yes
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178518): https://lists.openembedded.org/g/openembedded-core/message/178518
> Mute This Topic: https://lists.openembedded.org/mt/97619573/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

