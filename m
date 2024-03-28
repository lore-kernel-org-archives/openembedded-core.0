Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C13CD11DD
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 16:28:45 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.938.1711643315547789382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 09:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mu4q5IJG;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2a209b8af12so500096a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 09:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711643315; x=1712248115; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hG2zVXuLJiqV102M/tmKfPsgMFl40rNIHmi2uo+KhyM=;
        b=mu4q5IJGsItgmIKIPANOYTNLmOkR/P9/Ou2ImOGqHs3yz6IK5jIOQ2JVJpA9pN0AlL
         3g4LhKcYX2EFXEcNaVeK23EK0gw3s8spt6KtSnL+zugZhMCQtqq6RfGxqjYnVmml4B+j
         8W1X03oYmmgjxbm+HL0NhoowBR4L9i+bSoj+KPHymcDYNfu/fv6lPuk9NAtKsyJYcYkb
         4R+pEsF6LbJ+JZgpPHndlXqYLpMmc4+gnsXaRD/AQWYCQvtCRboHqF8dIQZ+Fe7Z4jPL
         yldz3OelzvHWvhoE0eah40j1pGWMKftAkEQTSrW5BDzGLTBs4ibdNoZxPMnK5j4hdTZ3
         PbZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643315; x=1712248115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hG2zVXuLJiqV102M/tmKfPsgMFl40rNIHmi2uo+KhyM=;
        b=dKvMY+QaXREYIxxlT0uCp8da8A8tPe8FI6iVEo2ypRzRbzQFbaswECosozDMyhQN1F
         6cdATXL2yeRod8CF8h+oh18LwHH1QgoonZfbFwXTyXjYn0W4mgoeHSkh9hL/e70wBkjx
         MbQip9k8wP9+05Gfnd/4jMen1PjD/QaUfG4UqyvtekPvfSNQrORTK05F87zWd5a6uoeR
         /4syFlNY0Yo/8ARuIvG0j49fdadjhdIANQWHa+NDuHD3GWrHjRSObQHqUzINCjadUyEI
         Ujj7kTqU3SErvpVHA01MDe5O/LxnlPiekb1Ycm167cVBqCl9HVGjxRDp3GJ63r0NHnuW
         r2Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXWrslH8PpGXk5D/eYblushxkPtoYEV2vND4dG9/jUnMJskcDyUWnJP5n/tPVaJoVG+EqKDE4X0k+H/A+3CWNQ4EDitNYferijvPBDmVSNxFapmtt4pIQ8C
X-Gm-Message-State: AOJu0YxcftIVcGfSK3KuohI5Xg9dKFrdOmGAoAg5oiVghuWveQDxdLhM
	D7mPYfkGPKLuHUdA9c8zOlhWSxWK6TE8Md9WsCx39mOeOcXMyKo1H3P5wN5c5kZZgJRh8BjpktT
	WP7MZplW6QylQ3XVK2Z4HuyuxscA=
X-Google-Smtp-Source: AGHT+IELO+gSkb6ZgAWhGoKRPdBqjByFChJCaLL6cil4xlBJaZT2tbpb3zsVjnQHhmyj1C8TwRxHLbwK0D81NDuZdBI=
X-Received: by 2002:a17:90a:da03:b0:2a0:3813:773b with SMTP id
 e3-20020a17090ada0300b002a03813773bmr3520870pjv.9.1711643314901; Thu, 28 Mar
 2024 09:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240324111853.237AD1068FC@builder.sakoman.com> <CANNYZj_4S4KWy0YMdQuvnjEX5rMXO+rGyUemMDWQgw1z4+1OyA@mail.gmail.com>
In-Reply-To: <CANNYZj_4S4KWy0YMdQuvnjEX5rMXO+rGyUemMDWQgw1z4+1OyA@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 28 Mar 2024 17:28:22 +0100
Message-ID: <CAApg2=RLShi99noHxjR4Rr7nVr84of0xk=7EhsjoXLJ=eA7fuQ@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 24 Mar
 2024 01:00:01 AM HST
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 16:28:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197591

On Sun, Mar 24, 2024 at 3:11=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I=E2=80=99m getting slightly concerned, no new CVEs second week in a row?=
 Did the checker break?
>

I think you weren't there at the weekly meeting when we discussed
that: it started around Feb 14th and I see that in my data
(I have a daily report).

To make the story short: NVD is close to 0 activity since mid-February
and there is no communication for now on why, what are the reasons
etc.
The security community is concerned and there are multiple ideas:
amending/replacing the database, there is an open letter in the works
etc.
From our practical view there's no automated solutions we can
implement right now. I have some ideas and it would be good to discuss
them,
the next weekly meeting might be a good occasion.

Regards,
Marta

