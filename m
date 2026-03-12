Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13EF8FED2F4
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 09:02:17 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17126.1773306134686078374
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 02:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HxYB6TH/;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-506aa68065eso6458001cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 02:02:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773306134; cv=none;
        d=google.com; s=arc-20240605;
        b=eqmniuyHpcvwVYAfeFoOX9by03clVzJFWq6zOYccRTmwS0tHCz/zRZ7ZeFMoasqtSM
         /VBQV0upGLyiC+7ir2dIdeW43XjvKuakaCvsgPPML1QKzDac68VZXoBAv1ZlCe5g/q9r
         qes/rVVFET5aRQw+dfUKZkRi3JL9VA7oahtDAmseMFu7Xd4kECftPmJyxnZ10pOl8OOt
         wt0xZJ0oRw1XBYxbxP8/bU4fVRI8sMu9NmZNOaPLYt5HU3elYyJMXoEurBdNXBReh0GP
         wPGsFcfYp/QGQ0G3inGcC6GbhBboxdbHm4qnckbnA2LeQaH402Njsv9DS9XXNe1HiU/9
         bPGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ChN9xr6F6ZAOCI7Sa8XyYm4XmWVqVe/z4OlOcLDtrcA=;
        fh=JhdMsNDuFlWtDqxdxN90yTw+hwpK0QqgyxqxkhcxeHE=;
        b=HkOX0sjBi3gXy9zzQpWfh9zmi2IMSEb/Cjp4OU9JhzqIl7rmI/BRikU7+exvlWmUmY
         4VUp4aA6DuUqZv5N39C9nOh4h9B25SQAuG5oEk/Ucjq4AS0g4OfgPwXWj7FVhAJj0psf
         qSz6+NGljGugQcMe+IHkvr+uQopzEb68X+gg5LTkKZEJ9o+w/TOGiUwL0D/2z1sMR7C2
         DUZf/kC6Sg+BY6f0Id6RHiP7ju6YxnyBgK78KNfImf2cSlxUWOpneSsv21pmAnGq2JQB
         DXtFggjTTQh/iJawV9IcQ3Ze85YQK6yLG2EkMxWM1yfSZwR8HayjwTmgMat4jk4YlAF3
         9/UA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773306134; x=1773910934; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ChN9xr6F6ZAOCI7Sa8XyYm4XmWVqVe/z4OlOcLDtrcA=;
        b=HxYB6TH/LZb+TIdujAdfVnvDUhGbkjfZ7fjVb2CHA6lqnsIippIt/srDoTc4ZVi9XA
         yLHvJlS6O71xrKCRhZl1iLHeLisOoxm2fNq1B2cfQLkqLOl1vhP/J9H0RfzHGl2FOS+V
         wPbcorFggTeG48dUtN5gMRJajSAgbvSAsutXsmZuUSjPSIGXNY8Nf3qCmu0lpq/bQPx4
         aklE526oQfTxLa1d/Kdg5zRRfurBf+5cgY8Kn8CH/lVnirV/xQxOGmtWbjnrbfsHjD3S
         jabx47UDI4cK3Cdo9JRw6HQjZEumDUaiGiU55flYnAA6fYouWUoXPb2N+mqWCNtSF+cQ
         dMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773306134; x=1773910934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ChN9xr6F6ZAOCI7Sa8XyYm4XmWVqVe/z4OlOcLDtrcA=;
        b=Vr8wjnS6u/Ipj0p0hOHeqv0XUR8hnlj2BrlnOgxEm0b/JlAEKsTxcqU4zTLbKA8pIb
         1HSONsBxToZwnBpP+dZUxdNMeJpznHdQlvPrqRFgI8niJDsnwHIx3P712GB2dBMAoxEB
         xN6NjPxOEDe7otIOhGPk+HaMbyfDdyLm0zBWiG/NAEeagT4DOA3KoxxS9SfhLRSeFAAq
         ABz9O7lxE2QNwOp5+IhPQ4EWA0RA0fPKIUYjulED6K2/90xzci6ABGKvkqfE2cJVkoEN
         lYaU89ZlrLNYi/7gFDO4DAypOt8ncRaAy2j/lmehYUikl6FuIteyapk4Bf2/lvsvGWWy
         MzvQ==
X-Gm-Message-State: AOJu0Yzu08gF7hliwsCTQigr442ODqUxuRvUk82pQtaQGawNMe+KplAf
	B+UeYYelDy96+XZLsjMKyISluEgGwjnVP/LzpiGGKW0iQd4Z3Q08UgDNM5eUdUpKNDQ8gdgtoFx
	8a5pNeL7D5X95hpJQsBixprdVLpqNZoaL4tmA
X-Gm-Gg: ATEYQzyB44z/mFGwRP0dvrXzpxeWB9k6fgnMW3ex/lQKXWDaC3jpDbLQrnvbOIMCv6z
	EFGmAU4KsjkHE+Fn7oIO1cx3vJrAUnmlIMJGqH0rQcuAe03ZoK65aa8sTlXEjvIJmd0mJAb3vNY
	/iJnR5hEa2t39YSt72KpyLgY6Uld1tuc1Fr9lpSIe1bMcvgtlqM5Qn7iPhQpnEodqxs+4c4ZQ4Z
	sE6batKC4sj37+J21KTKq7O3nKGiirPe6eanpJWaMpkIAvc60s1XKSJH6iPZFGiDSOOTk2QfKCl
	wY9L1MXENxlh5VMAPtH9olfEbHiBlKgunAfwa2CHiQ==
X-Received: by 2002:a05:622a:180c:b0:509:2e47:138b with SMTP id
 d75a77b69052e-50939f530e0mr72249171cf.14.1773306133537; Thu, 12 Mar 2026
 02:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260312040703.1487119-1-sundeep.kokkonda@windriver.com>
In-Reply-To: <20260312040703.1487119-1-sundeep.kokkonda@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Mar 2026 10:02:02 +0100
X-Gm-Features: AaiRm50LZ8P6nVWgNdy5_40tP155ufcha-Fo5f8VFMezcVxCbLQAAuUqXd1Zo9E
Message-ID: <CANNYZj_D=9z-ZjjP2D+RqVUAF2Kq0a8cd62dqE5doHzSYdPQnA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Enable parallel-frontend-threads
To: sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 09:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232934

On Thu, 12 Mar 2026 at 05:07, Sundeep KOKKONDA via
lists.openembedded.org
<sundeep.kokkonda=3Dwindriver.com@lists.openembedded.org> wrote:
> Test Results:
> A few tests ran by, with and without enabling this option.
> - Avg. default build time (w/o this option) - 56m 50.104s
> - Avg. build time with this option - 49m 17.224s
> - Performance Difference - 7m 32.880s faster builds (=E2=89=88 13.3%)
>
> Tests were performed by setting thread count as 8 & 16 but no much differ=
ence is seen.
> So, the parallel-frontend-threads =3D 8 is set.

It would really help to provide specifics. What tests did you run, and
how were the numbers obtained? How can these tests be reproduced? What
CPU was used and how many cores it had?

> +    config.set("rust", "parallel-frontend-threads", "8")

I'd suggest we don't hardcode a number, but rather set to oe.utils.cpu_coun=
t()
(grep oe-core for examples).

Alex

