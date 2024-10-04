Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB67CFA74C
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 07:19:52 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.17030.1728026386720062596
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Oct 2024 00:19:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i2isCHnf;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-287b8443affso498454fac.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Oct 2024 00:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728026386; x=1728631186; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwnhamEo8W8+6HIbzWGJpg59DOJzsgEK2C4lPNLD49Q=;
        b=i2isCHnfIvABpiYzTm0Ijj0EuHBMHEq/fj21Zg8RgcxKc41uUIg6Vk87HvBh4WDmhE
         PXMiCpCJgTY1QDnsvX85u1KUYI5PLNZwIWv73lQOIpiSeUJre8QU/CjBpEipAnP2ul+m
         VAzmFqxwM+vegtrbgVB7jrnHteEZoV+d5vJDt9ZydpuDlpciJQtvJRYgZcD8CpDJx6q0
         NEqDWmy79eS45w7Yeql5uY9qXXFoiQWKqDvNU7n/3zU2yMHvcIqVxoQKB6tFvcLzKFso
         krQUnl8zHTigEveCzse0i/HlRWM2ARe1RktBIx/1R9M6xaRFn7hhFHu5zHuB753/bzv/
         HGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728026386; x=1728631186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwnhamEo8W8+6HIbzWGJpg59DOJzsgEK2C4lPNLD49Q=;
        b=TqKwD1IXTn2dVeLP4nK2q0/3ySpmfqQWSIezCCM3COH9Ot5fAlQ86RtlI6xSrYIIsy
         gFlWAY1vxsgmK7mM0ADCkMvJzCiaiOX5tDVtCj2xGH35vDKPBdt+g7ibAdHp8J2hadEC
         fjpmujH8abH/bpbhHlED/XAFmt1x3BzjsoMMNolnmbMQjpcv4y8Uwxz24bc1jmxJ78VO
         GiFPaOZOxjrG3+tYUy3XeQis6AyKETqdl99SkqaV6l58d2y8rPxNgCG8DxOW+yCKt21J
         yR9TjINFVJERG6kyB/a2IOcBLv6k+Slq/JZRdlXpYvIjPrLLOTN/F+T5y1fNE+cAMx52
         JWqw==
X-Gm-Message-State: AOJu0Yy32BiMuhXGnoeGrhvfiAeKdT9dDulxqiiSMKD6uJptVAjbIypZ
	5P78JyZ41iSOUSgXQ5ETMWmW4LyjzXu+9LKCxxWLU+Rc+1A2rlZnCvmPvAGtU6CSOwle2UjpHoW
	Fg66Vjdp7S70K9TYJWSfdmeZh/jk=
X-Google-Smtp-Source: AGHT+IG5Zdt228VqCyFXZe87CavXkapLJL2v6isWvWVp59Cf9mKxwqbeVIxd8QDh0TgMkNpKcO97jwYOL2F8BIWFups=
X-Received: by 2002:a05:6870:1d1:b0:261:b48:3c99 with SMTP id
 586e51a60fabf-287c1e18b93mr1092281fac.23.1728026385862; Fri, 04 Oct 2024
 00:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20241003230144.900743-1-raj.khem@gmail.com> <53ada3238c3d3f02ac1a69c9808febe11e405bf0.camel@linuxfoundation.org>
In-Reply-To: <53ada3238c3d3f02ac1a69c9808febe11e405bf0.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Oct 2024 00:19:19 -0700
Message-ID: <CAMKF1spygMMd+cXLK_d8E6pzjBO1W-9WvKtpHULWnxcD6u1zvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] valgrind: Drop patch regressing fdleak_cmsg test
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Oct 2024 07:19:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205224

On Thu, Oct 3, 2024 at 11:41=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2024-10-03 at 16:01 -0700, Khem Raj via lists.openembedded.org
> wrote:
> > This patch is regressing on some distros where systemd
> > is used and /var/tmp is same as /var/volatime/tmp
> >
> > Removing this tweak also passes on poky. So I wonder
> > if we really need this patch anymore
>
> Removing it does not work on poky:
>
> https://valkyrie.yoctoproject.org/#/builders/73/builds/179
> https://valkyrie.yoctoproject.org/#/builders/61/builds/181
>

interesting, it works locally for me. but now I realized, I was using
glibc master, let me try to do it with stock poky.

> Cheers,
>
> Richard

