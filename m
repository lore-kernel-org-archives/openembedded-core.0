Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9332BC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 13:07:26 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.12106.1738156041879620629
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 05:07:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bWniZIlM;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6dd1962a75bso49410056d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 05:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738156041; x=1738760841; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtBNjdcdbWUQ3iuV3oihs6mLcGsfkSDqxbmFEiaPVUA=;
        b=bWniZIlMtrooPkskvjY4bleHHFNxZyAr667Al4GaPvoHooqn4vBIhvG1Z6QqQgZIyz
         anxHoH/pBqkadA7DzvcQ6z2g+NVOAhktA4q4k954qdAU/mCuxE9wB+O7jk3GX28bHM0S
         T7Z+f/Hg44KFSR+KJybYYdzEIVPsZ0fMzqlrA2qOWlMSVZOz7zKn6Mq/J4N5i3rrMX5s
         b8nujELoQPRJ1bOP2Tjy+3iMBR+AVM5DwviThFw3p9Bi4/O0Q9XHf0clvVMsv9KgTmlu
         6umU9dSfAuWDkq6cvLD51w2rqWlkAeSvPdKvOKuqQRuRVKG0Pj1z4HVvlTxllN3nMJFx
         c2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738156041; x=1738760841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtBNjdcdbWUQ3iuV3oihs6mLcGsfkSDqxbmFEiaPVUA=;
        b=qHd4f9vKfK/ixu6TkWtubaHYLhd0bnBqvpbu0gs8uUbZLwsK8vlB65WI9NSJwhoOvD
         NbaSTrR667KGG5YBc6WdZen+4AclE55w7QR9dJIsLNsrvRq4iVTGQaGvtbtYXINUY4IS
         DoE0bTPEyRUnnCF6M6jfxy2KnqY0uz4o75s/LCqb7sP4tL6VEb8U6SccuRor1YD1IKg/
         XcSkl39LTF++NI415b1Dv+Npc5G0ipftxdmROj/UhqXAJMHnjZlup2y3UK5WAq5a8n5/
         sbWn1RwHaT0T8gyga9YcMsXu88wnGydobZZgX31waZgCY7jvpg/KpxFPhTxs5y3a3aLn
         Umgg==
X-Gm-Message-State: AOJu0YznPVlHJJtM3lNN4OmDw1luaHcszDGgj14ctis+cbmbZjsVu5+2
	lS7ZA9HG3SGlAEI3xX/6k+ObXr4quOfyyqRZTt6JGuoes4vVLXK/2hcAhF9D+t3NdCB2GcLBtBb
	d4owHY+TgICi+ZNpOcqV0hV2RpgU8rg==
X-Gm-Gg: ASbGncvw/f1H+wjdIdduMtQyD/q8DPhNJ0ZKU54p5duKRGdbuVl7E+uK234yGGj2Loy
	1cWSAUmFCphejOk6OUrGvMgRCPwZNN72RfjqVF7cRx7N87HkHBFfwfYbtqrMSdekdHUlGGTuS+p
	PG5MLCadbBlzZPbARAjDW82ztpYmRj+EU=
X-Google-Smtp-Source: AGHT+IHG+MbTikTRHilJDjfnxMIVBIXgxSIrjpWkhckwgAofztoDfwqpgEgmSkam0WTcLItfX7GfcjDLQZtwBXsvjP8=
X-Received: by 2002:a05:6214:598c:b0:6d4:36ff:4356 with SMTP id
 6a1803df08f44-6e243c39700mr52822486d6.19.1738156040823; Wed, 29 Jan 2025
 05:07:20 -0800 (PST)
MIME-Version: 1.0
References: <20250129104150.2391653-1-zboszor@gmail.com> <20250129104150.2391653-2-zboszor@gmail.com>
 <CANNYZj8V4Zq96iFLPOjBzVJsDpb3f-m99UGNnUjS9dd0qRsvTg@mail.gmail.com> <481ae88d-e8b0-4f97-a56c-1ffe7a0993e7@gmail.com>
In-Reply-To: <481ae88d-e8b0-4f97-a56c-1ffe7a0993e7@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Jan 2025 14:07:09 +0100
X-Gm-Features: AWEUYZl1SZJ6YKckOhg5qa0Wy579p-42jSyxGCwZADh1EGKza6FjIYeR2QJuqN4
Message-ID: <CANNYZj_FL8gRqKv1gGoh9zygv7wYMr51hC1zeALYFeTGPtweRA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 2/2] rpm: Re-enable signing
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 13:07:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210383

On Wed, 29 Jan 2025 at 13:52, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
> I can't run the selftest using my custom distro. It was originally
> based on meta-angstrom but over time it deviated too much
> from how things are supposed to be with more recent Yocto
> versions. Hopefully the test case can be run with the pure Poky.

You can clone poky master, apply the patches, and run the test in that
setup? If the selftest fails on the autobuilder, you'll have to do it
anyway to reproduce and address the fail.

Alex

