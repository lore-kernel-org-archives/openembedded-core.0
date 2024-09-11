Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED36EE499B
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 12:10:43 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.20150.1726056634385185159
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 05:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cUnbs6ci;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f754d4a6e4so59259921fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 05:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726056632; x=1726661432; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AWKQ/UiFkenbYjLZ4I+topr45kka7dPWwwh06qw18M=;
        b=cUnbs6ci7FUwwJN8XgdzheMjnYf05LmZzRUGUeGxNRV+wtEaHSxUlCV1ZtJ99fdG8t
         ND/4paoR2dLNv+X8lIy+tt+QHvbKFftb6c295xCPdMJq30JbYbWeHAHkriXLRvXUatdM
         DNBWzLrLIvKfr/iVTTzJeiKGRZvnmMgSiP8oZFRPdaJeVtDWiuK3516TAWe9j8LPoZZf
         Ip6cuoswwKO0rlt79fMp5oT99FKKqSqHsIFCFnOn4/AyArZpJ8bj+d1FGYkAA/XuvhfN
         9sKOyRAKVQTzrotkN+b1fXdcQPhx7TnwZ+Q1GSBDeg8zgJ+PnlKMBmf+LZ+gagS9ehfx
         0QYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726056632; x=1726661432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3AWKQ/UiFkenbYjLZ4I+topr45kka7dPWwwh06qw18M=;
        b=Ey7ATLMrjNftIOIdhnsIP83WvX16gMtl4eduMVZ1cwuWUGzWAspAoFpknWhkLu6IgU
         aGECg3/l9tZVGOXicjPaX3QeQ72U/UKIfrHNpmhs3emfPGsFJvUPzcYjil8i52kdBijc
         s2InwDpwg9N2qQF3wSil3A/TsueMBdlfFwcTbshCRJB7AZx4hHP+5SU8h1LgjFwC0j3G
         5LDKwhJQuCszb/nov3r4oFO6RuupcNq1Cvori27pkgjDI2vJxEQDIiiDji4WG6V+VZnz
         NQ+WUCgRcUlwLa/+ZGdiK+U+MWXjs03oR2ETP+sWxZF61nyyZdDK49HVsGcI0cRVvuY+
         OJ4Q==
X-Gm-Message-State: AOJu0YzJ179+nLiJxz9cet9qnklf19DOMalTIjmo1TLnYLgTYLnOE31r
	gOtq3qjIR7syLwzS8phaWcO+33YUN/UzHEeGMPf3TlrhYDhKkjIvgTd5XjVCakAR/Eyc10MZzJd
	90+OnKRpYQuCtj4/5delpHJGMvek=
X-Google-Smtp-Source: AGHT+IH9s5ESkivXs5lCJjxlo4wXknJ97y4GaT3xPBM/V8Q4/pDsrVRdxVPkWwpQwFAkAR79MjAdM4QNQ5Z8PLJFt/M=
X-Received: by 2002:a05:651c:548:b0:2f7:58bc:f47e with SMTP id
 38308e7fff4ca-2f758bcf822mr96161201fa.5.1726056631497; Wed, 11 Sep 2024
 05:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240910184143.2820792-1-ejo@pengutronix.de> <20240910184143.2820792-2-ejo@pengutronix.de>
 <CANNYZj92yih_U+qQ=Ow8sOV6BZ2vWZFXmwajzT6e=bHe=ej6gQ@mail.gmail.com> <2ff3be0dce3a39f59ba7d0dc2dc78fc43a54bcee.camel@pengutronix.de>
In-Reply-To: <2ff3be0dce3a39f59ba7d0dc2dc78fc43a54bcee.camel@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Sep 2024 14:10:20 +0200
Message-ID: <CANNYZj-0LGjTFq8+wfQbjzn=NPnf60abWHLzMq=Aw+XUhsQc0g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 1/7] barebox: add initial support
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 12:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204382

On Wed, 11 Sept 2024 at 13:16, Enrico J=C3=B6rns <ejo@pengutronix.de> wrote=
:
> I kept it in the version-specific .bb file since this is the only informa=
tion that would necessarily
> change when bumping the PV.

Yes, but barebox and barebox-tools would have to be upgraded in
lockstep, and sharing the checksum between them would ensure it
actually happens. Also, the resulting diff becomes shorter.

> > Also, is there a need to keep barebox.inc separate? Why not merge that
> > into barebox.bb?
>
> Personally, I find it easier to diff recipes when they don't move with ev=
ery version bump.
> Splitting .inc and .bb up is one way to achieve this.
>
> I see a notable number of recipes having a .inc that is required by only =
a single .bb.
> Is there any generic rule when to (not) use a .inc file?

These recipes are a relic from times when oe-core had multiple
versions of the same things. Over time, we merge the .inc into .bb, so
there's less of those now.

I prefer having everything in a single .bb, because splitting
functionality between multiple files hurts readability a lot.

Including .inc from a different layer is an anti-pattern, and I'd be
strongly against doing that.

Alex

