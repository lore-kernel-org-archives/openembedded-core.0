Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58856C36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 16:30:17 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web10.14049.1743265807352957394
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 09:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iDnWVat3;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-601f3674116so793634eaf.2
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 09:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743265806; x=1743870606; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHqIea9zZrG1TItyuAwqgTw8zvvUAIZiswLpJKE7Kug=;
        b=iDnWVat36+2m2JieGKY8L8yCF4NMDhvgUSS4A/jGtiy5KwuhOaK8P32UsP1veLD7Y9
         5bE8VhH96Hy+5V5hcjUBM79RMcYpsnrhfnPA2pD39Di3P4dmiOeBjUn3Pjm8I4vL2RO9
         AvFfxd+hosjsi9ZjDJi7RsftymSw2w+XpHIPecWLRonmBpnEYtgRMCiDe0goiHJ59wWq
         pnxaN1NIBw2ed+yGUJjMtup7YevlIt9spC2cL7/LzVuhouDVD7J0+EsSOdVi6Iv0rLHS
         lFmi6ypvvXvGQR3zQrgfvsUinTK/oQV6efccq+MySA456uLR1vdvfRUJkl0aXVu4zPlg
         qxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743265806; x=1743870606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHqIea9zZrG1TItyuAwqgTw8zvvUAIZiswLpJKE7Kug=;
        b=FP52M1+tVAjvbsrVk3NCuHXT10RE56pf0U7gdte9foAUCLdRDYCU6QqDViidPKs3P+
         Yx7A793XuvJCoB4gSusfPVcQ3uCqisaDqxavDdVHb5WBfuUIcdL5waRBU1IpG8R94IH3
         +VR44xzm/e3lP3vsDm3dDchUaYrc8ba+tkdqeto4F0GD5nX1TM8+6zQhnPKKpt8iJWjD
         lDjjjxde2JmQhcgR1CYHmKzFYtAANiZCnhosx8jmHEUZdab5C6CO+6WyFU1cibKg5n39
         BvIhW2u8PYNQc0G3HdBwmoD9yML2ucR78HLqnoYWC1UYZilbTQ/xsbJfsbtur/OBr7cX
         J0uw==
X-Gm-Message-State: AOJu0YxM8VZUpyANTbX2AIqrXmcrBcQDCIGRBBJMYiHyjEPyyPiYwewd
	Z+me1wAyQ+oSyMZsey1Unbt6skR4t0dcWCnoHlENL8uBPUmqN4XXQ4X4Gg+8ohfXy0B5RUiKhjI
	lkZ/OND9JadSBJtWrWo7+pn9+9CI=
X-Gm-Gg: ASbGncsfx4+woKQpUzdSJJyz252R4BqZfOUi4vuw3c17n1o0YD+Lj3d1LsYK8dqBy/N
	8tsonhCsnIUn/SfhAEDOu1obDxsyaQS8V8wr9btBjoAts3PPLOOLKzLMDo2oZQi5TVe+WJswXz/
	SIj3h41ev7PRT8lOPirabpR6qO1A==
X-Google-Smtp-Source: AGHT+IHH5mBiM+hi1dbKd22oQ5YP+Mu2gbAvihG5KieKhHkUcQjba1qaNjjtWcoAHOpzeDg7lV6I5iutoTPNMADYKBU=
X-Received: by 2002:a05:6820:1e04:b0:601:a927:351e with SMTP id
 006d021491bc7-60290f7a91bmr1565804eaf.7.1743265806508; Sat, 29 Mar 2025
 09:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <19c7cc6289d7aab486e74ac50bdbf17a22e86363.camel@gmail.com> <8404.1743264073178142467@lists.openembedded.org>
In-Reply-To: <8404.1743264073178142467@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 29 Mar 2025 09:29:40 -0700
X-Gm-Features: AQ5f1JrlFM9kozOWHk5EY3EcK5o7Ok1DLznsan4PLwGIcvgcl9JWZ7fOObsPWhI
Message-ID: <CAMKF1spsxXoWi_GMqcBqip7yvJGSvsPMXe3RXGBi8FfLaDMdNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] initramfs-framework: remove hard dependency
 with busybox
To: gavrosc@yahoo.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 16:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213886

On Sat, Mar 29, 2025 at 9:01=E2=80=AFAM Christos Gavros via
lists.openembedded.org <gavrosc=3Dyahoo.com@lists.openembedded.org>
wrote:
>
> hi Adrian
>
> thank you for the comment. I had a look in commits log and it looks that =
'-c' was there since the beginning in 2008/09/10 in script 'init-live.sh' a=
nd then moved in 'finish.sh' in 2011/12/08.
> I reproduced the issue by using qemu and I described how I did it in deta=
il in bug #15716.
> After I applied the change I tested both busybox and packagegroup-core-ba=
se-utils. The boot was successful in both cases.
> Also '-c' is an option in busybox: https://www.busybox.net/downloads/Busy=
Box.html
>

-c option is to redirect the console after switching root. Some
devices it did not work properly because util-linux version moved the
pseudo filesystems like /dev automatically
but busybox version did not, maybe things have changed but I would
suggest that this operation is now happening with both switch_root
versions with you script manually doing so.

> I will wait for more comments and then I will extend the commit message a=
nd send a v2.
>
> Br
> Christos
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213885): https://lists.openembedded.org/g/openembedde=
d-core/message/213885
> Mute This Topic: https://lists.openembedded.org/mt/111959232/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

