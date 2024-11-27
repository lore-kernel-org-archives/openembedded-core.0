Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D9DD66BA5
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 00:53:36 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.61733.1732668810541310336
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 16:53:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cHeTEHum;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-71d4182b2cbso1715289a34.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 16:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732668810; x=1733273610; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apH2EFW0bJWrTjxWRt1JIlPLbrvLFWSSbENiCkFjiTw=;
        b=cHeTEHumgPX3hrMl8yCHwgX3tlWTGFzwKRTRl2n0xuVy3JjqR6s1AorWPtZuuKZ54S
         N659ncjLeEUHQUE1vNTJXmNaok3rgTAxFLTkhAT8OB5BtaRZ2l7FiGhsQlUwMIpcDYyv
         Vg6s2NCX89KfkIfvJys7jdBv0VkcbL/LuiJZW06LNV3lGmqywoHi3pow5gjRIj4fPgq4
         IlZUjSltuOGkfD+RU1r7lcayrlG2Q+Hs7RKxyRddyzmHJZG9qRiVVlWpzDhw6uSJ9c9Q
         mJGANpH0dwmLPb7wdlnWRamkwBzq/o/BZdxKeciTgiYT0qpJnkOodzm6THb3ysaVPqdg
         f+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732668810; x=1733273610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apH2EFW0bJWrTjxWRt1JIlPLbrvLFWSSbENiCkFjiTw=;
        b=H+WqJD/h6iiIrRs2Xe6wwwSiHoo9IjoHfwRr1lHYr+wZQj3N1nA8LWogkcxaIHO4m2
         n/zHgH0s6qeDz6k5KC0lABBE/WyMhcVLv7MSA03s+a7cM+5HQxJ4qMWQNtAm32R96dOQ
         qjFPRXjKIpzCl/px8pJS4Oy7Xl2Que+zZv9iWq+XTf8thCygk9TfWDS0tXdqfVN3GAex
         XiS/oZQwTye/61Lb4d52hM5a4bYZTcFUtAVdTC+/f9b6wNR76J7A90qEZJL1Ng1hFXxU
         jsexcPDSHztdfzTCoF13C1Efx4Qs36HriMEYDNkrsoZ+hi6kwms53aHy29xzFqhWak2Q
         JOmA==
X-Gm-Message-State: AOJu0YxLJ1k1/GzzbnKjVGnSJ7qBGg+dextr0HP8HcQxs7K6Zi9VgToy
	TVbN1CoKWT910cWb1K4SY6zpviRB0Ve/vxsW1hzHNRfLOt4/FqdN1vNNvnLnm5/J9yg4VXUnvL+
	BAIGnEpgZXexQmzae4lm2kt/rlc8=
X-Gm-Gg: ASbGncvsJLwfNZcv+AZlcuEVBlxwHTftghugvMrNcP8puntUERu0do+muk/Lo7DAYO/
	R8qmBIU0J/lq1z4ITH29ysoTv+cG3xQ==
X-Google-Smtp-Source: AGHT+IGS47NujoPocG7utLnh0fYIVx8ffYx9f4wWZBoxgoGkDbaxtJNpEe/tdOjRGujsD0fWaoWeTNLMMl6pZK8iu6g=
X-Received: by 2002:a05:6830:4389:b0:71d:4488:19f2 with SMTP id
 46e09a7af769-71d65d287c0mr985710a34.26.1732668809652; Tue, 26 Nov 2024
 16:53:29 -0800 (PST)
MIME-Version: 1.0
References: <1731403483-21399-42-git-send-email-wangmy@fujitsu.com> <20241126232634.612174-1-raj.khem@gmail.com>
In-Reply-To: <20241126232634.612174-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Nov 2024 16:53:03 -0800
Message-ID: <CAMKF1sr759RNQ7B0dap5Zzk4phMkRvjRZE5L3T=T+1s4QtZkHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 42/47] seatd: upgrade 0.8.0 -> 0.9.1
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 00:53:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207892

On Tue, Nov 26, 2024 at 3:26=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> I am seeing a strange behavior on RPI4 after this seatd upgrade where def=
ault tty is now tty0 instead of tty7 on which the weston is running. So on =
boot into graphical.target previously one would see the weston UI on screen=
, now we see a virtual console. After logging in doing
>
> chvt 7
>
> does bring up the UI onto screen but this is not an expected change. I am=
 also seeing same behavior on IMX8 machines.
>

I have sent fixes for this problem.

