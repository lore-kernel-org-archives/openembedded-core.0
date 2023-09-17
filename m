Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF2ACD37B3
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:20:55 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.27272.1694942454146162342
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fx6H3G1N;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2bcde83ce9fso57067511fa.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694942452; x=1695547252; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fl1p4MelQS3kp8ciWHaxTGwQKP6dxV+GUP6L4fIHDTo=;
        b=fx6H3G1NmDL6IiRLdlYH7YOTdtCzUGykJsbhSMaJ+j08g8UYUSQeWnCRHG7T2Qy3Fr
         c0TeI+YXxb+VGZJvuwPP31LkcKOf9NLWBiPSYEHKEMpuXHOloTuMcGOjLYo8RSBpl2tx
         Q4Vk7WcksTnbRQVl6oImGeE1AuDbIyfSDQ3JqL6RQwdH00m0Ay9ngC5lnaXupcNAuxvv
         UaDvqn4xudWfZgSp05SDfKYUanowTw3wHkVyjOqbPNQifOG7khM9kVrMZ8zITu9gSIWa
         Bqr0YRwGujpiEQ1ixdz4T7EAjo/PG5Q/y20t7NLrCx87OqDD++WCb7V5kQ6ptFhg84DU
         IOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694942452; x=1695547252;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fl1p4MelQS3kp8ciWHaxTGwQKP6dxV+GUP6L4fIHDTo=;
        b=vqTnfWpOAGCJ8cycT9RvJR8fxBP3ZlL9FGye8QDktjahEnx50ua5Fg5Eo+eIqjQMK2
         CLV5KaVMEmczXmf/YVn7HFu1OgtJcP/BZjWZcTAZscEZQuU7jBSOjxgBuVzqfIRTWdSO
         /bevNcZCjvutwJtJ+kS4IqkPSrHr52E3OmA7h0eWJuW/BNpKjAMdhkkiY1bTCLHyPakk
         o1Lks3APCzrUzEwAGr42Js+TVQf6sF/WfuMJxSB7dLzy+Tq1BOiTakB18RhHzN2xMtrU
         AGIhAvnbfAB7wNLeSRNvYj0o7gIi9G4EkloMJScOg2oMBioQb4nhRNC/SGGcbPBhCUf0
         yU7Q==
X-Gm-Message-State: AOJu0YyEIC5/P4MvNc6pNgnXfQkW8plB97N2CO/ymedCO7Rl6fmTIiLP
	Ltz0L0pDzEnwesmBuNVuu6P0MByfesO1zSTXDUs=
X-Google-Smtp-Source: AGHT+IEfBVkF1kWEAIacWnt++Opds534l7aV1f3IkMlKhg3dzQpsEQ6pXqeitO41JBUJQJohfucD6ki//vBTK5pWaEg=
X-Received: by 2002:a2e:3e0e:0:b0:2b9:4b2b:89d8 with SMTP id
 l14-20020a2e3e0e000000b002b94b2b89d8mr5197615lja.35.1694942451483; Sun, 17
 Sep 2023 02:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <1785788B07E13340.9824@lists.openembedded.org>
In-Reply-To: <1785788B07E13340.9824@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 17 Sep 2023 11:20:40 +0200
Message-ID: <CANNYZj8KfaXkwandN0=S4=n3NFT80YE_EKkr4zJ9AA_pf3R7Ag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] groff: do not build in parallel
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187773

Please ignore/drop this. Upstream has quickly fixed the issue, so I'll
send a backport:
https://git.savannah.gnu.org/cgit/groff.git/commit/?id=22e0153d6c204dc2dfe34bc2b6e3be7d878ca8b1

These things shouldn't be happening on Saturday night, and we should
all get a life. I know :)

Alex

On Sat, 16 Sept 2023 at 21:42, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> Sadly a race has been observed, and so serial
> build has to be reintroduced until upstream fixes the issue:
>
> https://savannah.gnu.org/bugs/index.php?64681
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5622/steps/11/logs/stdio
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-extended/groff/groff_1.23.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-extended/groff/groff_1.23.0.bb b/meta/recipes-extended/groff/groff_1.23.0.bb
> index 1dcd0bb605c..2c8c37cd563 100644
> --- a/meta/recipes-extended/groff/groff_1.23.0.bb
> +++ b/meta/recipes-extended/groff/groff_1.23.0.bb
> @@ -21,6 +21,9 @@ inherit autotools-brokensep texinfo multilib_script pkgconfig
>
>  MULTILIB_SCRIPTS = "${PN}:${bindir}/gpinyin ${PN}:${bindir}/grog"
>
> +# make race reported here
> +# https://savannah.gnu.org/bugs/index.php?64681
> +PARALLEL_MAKE = ""
>  EXTRA_OECONF = "--without-x --with-urw-fonts-dir=/completely/bogus/dir/"
>  EXTRA_OEMAKE:class-target = "GROFFBIN=groff GROFF_BIN_PATH=${STAGING_BINDIR_NATIVE}"
>
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187772): https://lists.openembedded.org/g/openembedded-core/message/187772
> Mute This Topic: https://lists.openembedded.org/mt/101404233/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

