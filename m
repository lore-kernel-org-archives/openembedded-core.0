Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9609DCA5FA5
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 15:07:33 +0000 (UTC)
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60759.1790608051762700412
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 08:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qvv7iwoG;
 spf=pass (domain: smile.fr, ip: 74.125.225.99, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4888129c46eso1718882f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 08:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790608050; x=1791212850; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FoAIKoG/noIc+SDqvxGL5Fp8tSHp3JOm22sr6HyhEWw=;
        b=qvv7iwoGFPNUNNiJO83cvbSXmLtX+m5Dr422gPnv78UNY7g38kDPBxIYbgNmuFh2Nf
         jh73g9NKZUBGqKd39JCEyB8u2nnH2G/02w013gYaRgCMJZadnMQwyh0CZDcovt8o2A3J
         hwul1tK6TAiVReL1So1LQMtJCxwCvCig11BSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790608050; x=1791212850;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FoAIKoG/noIc+SDqvxGL5Fp8tSHp3JOm22sr6HyhEWw=;
        b=jH43sqy8BUAK1TnSSNO62BdhzXunh3TpD+j+VpqmFxc2iRRBPb0XWwPGNAr7NaxzMo
         thdhTTwRVwC4/p9SRydC3dZVwSx2CZb5Sv/Wfz/yjRVQFdp4vTZvdEkG5ISh/9Og5/AB
         m9ha/RqD8GGAzoFidJV36ihnweOsgDwsIPjDnsMkeCXcLGgovx6zpiwDpmTBSu1HB+9z
         D2B+LCeJAD9CrVpgz2zmZACt6nbDpYtFR+XOVmjCvJ2uJzngd9x4iONly6OG6wbfduHA
         dQIzmJBHASarkGf45Ag4+3+GKwilKiLBoMGQ/Cz5LB7SZVnoCtX0zvWswDYETs04EhpL
         dkMw==
X-Forwarded-Encrypted: i=1; AKwUvByN9PDgOqbNBzD4ogUv57DBshE6oBli+WHwOCftpi2PJolwdBc0P5J0R9Hvm57UmxNgNPjUDYI0ZkkFfkkzo7tyzw==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJKlWGybSQK3MYsjA1bjO1bOVwbCZnSXrVjtRSvexvEAn5oFhqa
	eY2CqBoDZo1YurZH6WotAtn/Vb29cxB3AXXRp0E1EAZJ9LGuhqSqbbZNjI5VQhgseNs=
X-Gm-Gg: AYBFou1NufU9bxQKZfg3I1sZBjZwGNLLQYiShqFx4gRFcDEDXNzbrxNpoYkf8JumiS1
	GYGqyr3ps8x/+eLEeflcb/bJl1zchXq/jq71qLYGs5+yIf+UNTzNGSgctDCpTLtYN5Ya+NuzF5U
	5XgsuEpEJtg6jHlMNA1QGpoStzJg1+evsMmg6yFrrppouM0UdhIzjtD11vdxEQt+KeIZ2Y10Cc5
	FalJO4fe9p46Tt2ZtDitOoxwBG9bhBEkpaz+Rs7adt7+qRfcCit7yLtAS08sDnIQMvHCimJ+1qY
	WgJ0r/feQc1W1m9kk/4S/oy/R80M49Z3tNajy1issleL6p9HHZ1G9pbNFiN2xBrfwTHvQG+p1RU
	kns85QOxShMKfO1l+9hpe7cYujpVEJja6KVV3z/WETavk8T/+Db8S5qXYtHAZo/r1zdeUQAFAiB
	3nHFGTrfmQZ30VDP2yfp486Jc/L7GBSEgfBl6q12KfXg2Hfp5xRKGzbLqc8JCDh2EBYXZ/GzDpy
	VyQChenWqoc2sibGjvFp9XkAWXnIdCCQgB0yjNaS7wE/7bsljxdypUhg8eKLXoU0wkd/5cc
X-Received: by 2002:a5d:6f03:0:b0:486:f767:8be0 with SMTP id ffacd0b85a97d-4887165e9edmr24180035f8f.12.1790608049924;
        Mon, 28 Sep 2026 08:07:29 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6456f8sm27901101f8f.26.2026.09.28.08.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 08:07:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 17:07:28 +0200
Message-Id: <DLR1KTLSD0BG.JGCJG5X7S0UE@smile.fr>
Subject: Re: [oe-core][wrynose][PATCH] alsa-lib: Add ptest
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Sana Kazi" <Kazi.S@bmwtechworks.in>
To: <UpStream_IP-SK@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260921100829.1107581-1-UpStream_IP-SK@bmwtechworks.in>
In-Reply-To: <20260921100829.1107581-1-UpStream_IP-SK@bmwtechworks.in>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 15:07:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246769

On Mon Sep 21, 2026 at 12:08 PM CEST, Sana Kazi via lists.openembedded.org =
wrote:
> From: Sana Kazi <Kazi.S@bmwtechworks.in>
>
> alsa-lib is a user space library that provides audio and MIDI
> functionality apis for simplifying application programming
> and provide higher level functionality
>
> ptest executes below binaries on target:
> 1.config
> 2.control
> 3.client_event_filter
> 4.midi_event
>
> The following changes are introduced:
>
> - Add the required include path to CFLAGS to resolve:
>
>   fatal error: alsa/asoundlib.h: No such file or directory
>
> - Remove the test suite execution "make" call using sed to avoid
>   executing tests during the build.
>
> - Build the test sources using:
>     oe_runmake check
>
> - Install the generated test binaries through do_install_ptest().
>
> Signed-off-by: Sana Kazi <Kazi.S@bmwtechworks.in>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../alsa/alsa-lib/run-ptest                   | 14 +++++++++++
>  .../alsa/alsa-lib_1.2.16.1.bb                 | 24 +++++++++++++++++--
>  3 files changed, 37 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/run-ptest

Hello,

I'm sorry but adding ptests is not allowed under the stable policy.
I have to reject this.

Regards,
--=20
Yoann Congal
Smile ECS


