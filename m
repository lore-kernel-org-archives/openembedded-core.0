Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25359C25B79
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 07:47:29 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.10768.1716536846969090726
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 00:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WIcUbzx2;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52965199234so562138e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 00:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716536845; x=1717141645; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsrJQS6M7Io1nKyEoAGFRUFc8UeK2I7OwIiVCOHKAs0=;
        b=WIcUbzx2nwkiwRioru7GDjqYOqD6pPEYUE/iz+FQImgEM46i1a3y62tSa+QxuPcfxC
         ZmglUp1TmzdBVH2HvI6TqAKD8y02R5104f4dYQWvExf2DA8+WnTyNq+Mw+cExH/k2wnm
         TQQWQ1HBqqnKHPjjYGJk3FEgksFd+klH+OY86UXTXIB+Ty3rxjgXiaQpG3E3YN8hCcyy
         +nuVNDLWkhv4yaYBUb6p9QAwLFm1n9CDOQ1WoY3huHYSisb7ibDphqCJ0swbAGVbgp2d
         AKyfJnWMMH0yHRXCtzg829wzNdgXwZ1Te6PFmkwyhyu+tDUUF3QLmQ93esSyfIg3j0YY
         kH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716536845; x=1717141645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AsrJQS6M7Io1nKyEoAGFRUFc8UeK2I7OwIiVCOHKAs0=;
        b=U7Y0Fvaz5XP09CyF2iKjDEiY91ec6cGi3JpUmfL4xzAo0fRfo/ou95COWzTBwbNdh9
         yE8RuUTm59TPAtf9hpS/De7kLt1exfGIO/k6vYlEVLwteGj9gE+T8EtMJ/BzCcWF6RzC
         4BXR/imvHksDhbuSV9Sn35oXdbsbJZ9GeE87VLMWFL7/KCvJoAVQ5KCvicdkM2jAOehl
         /5sg74xkglTsVF4C4vqBKo/aoVQiQIwrL5lV62Hu1Ntvr8MA9ClbNSfVtMTIPGCVjlMc
         YHscghTPPmGGIJdVY+K2uUJpvBQsO4XMBx+DgAzz02+gBONe7nMjK1RwfNmX0WzzpaPO
         g3Cg==
X-Gm-Message-State: AOJu0YxPE3vqSeN2IU5LHNgJwpf6JM/fk174LRcSfY2yMWXbYBzdKQuI
	iOf1Wetr8CPDwTluqn3ldi8CuiU/eK19pl+/bb5WgoHuQrG5AhvNyswi+VWYb8JmTz4sHzgTfga
	+w3huUVma7OVXmAkXAC0d4ohuWK8=
X-Google-Smtp-Source: AGHT+IENM1oUKi+f0p1LDomvmxiEr47SyeKwn2a7KFnmBE0GL/ncIZd1AWGPdGraw+RMu+qlvVxC0Lprt8jYo60d/4M=
X-Received: by 2002:a05:6512:b1f:b0:51d:38ee:ddda with SMTP id
 2adb3069b0e04-529663e5839mr1229775e87.52.1716536844788; Fri, 24 May 2024
 00:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240516072439.2998567-1-philip.lorenz@bmw.de> <a1e882da-6a83-46cd-904f-f1df8f586701@bmw.de>
In-Reply-To: <a1e882da-6a83-46cd-904f-f1df8f586701@bmw.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 May 2024 09:47:12 +0200
Message-ID: <CANNYZj8xRXmrYDr6iX8vWHU2rFQHxGCYHEfKAzAU6-9RY0qw4Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] package_manager: Clean up shared deb / ipk helpers
To: philip.lorenz@bmw.de
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Stephen K Jolley <sjolley.yp.pm@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 07:47:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199831

It's staged here:
https://git.yoctoproject.org/poky-contrib/log/?h=3Dabelloni/master-next

Maybe it's worth including this link in weekly status emails. Or have
poky/master-next-extra which would be directly visible.

Alex



On Fri, 24 May 2024 at 09:38, Philip Lorenz via lists.openembedded.org
<philip.lorenz=3Dbmw.de@lists.openembedded.org> wrote:
>
> Hi,
>
> I haven't received any feedback on this so far and couldn't spot the
> series in master-next either. I'm not too familiar with the review
> process so please let me know if you require any further input from my si=
de.
>
> Br,
>
> Philip
>
> On 16.05.24 09:24, Philip Lorenz wrote:
> > This patch series fixes one issue which I missed in
> > "lib/package_manager/ipk: Do not hardcode payload compression algorithm=
"
> > (2ad05635a6da403b4fadcc126fe7734067c12c73). Default configurations usin=
g
> > zstd are not affected but I'd still like to make sure that things are
> > cleaned up.
> >
> > Additionally, this series cleans up some deb / ipk related code by
> > moving their common base class to a shared location. This originally
> > used to be the case, but as part of a larger refactoring, the class was
> > duplicated into the individual packages. If there was some kind of
> > rationale for doing this (I couldn't think of one and couldn't figure
> > this out based on the commit history), please let me know.
> >
> > As part of this clean up, the `extract` method is moved into the common
> > base class to ensure that future adaptations apply to both
> > specializations.
> >
> > Philip Lorenz (3):
> >    ipk: Fix clean up of extracted IPK payload
> >    package_manager: Move OpkgDpkgPM into common module
> >    package_manager: Share more common DEB / IPK code
> >
> >   meta/lib/oe/package_manager/common_deb_ipk.py | 97 ++++++++++++++++++=
+
> >   meta/lib/oe/package_manager/deb/__init__.py   | 85 +---------------
> >   meta/lib/oe/package_manager/ipk/__init__.py   | 95 +-----------------
> >   3 files changed, 101 insertions(+), 176 deletions(-)
> >   create mode 100644 meta/lib/oe/package_manager/common_deb_ipk.py
> >
> --
> Philip Lorenz
> BMW Car IT GmbH, Software-Plattform, -Integration Connected Company, Lise=
-Meitner-Stra=C3=9Fe 14, 89081 Ulm
> -------------------------------------------------------------------------
> BMW Car IT GmbH
> Management: Chris Brandt and Michael B=C3=B6ttrich
> Domicile and Court of Registry: M=C3=BCnchen HRB 134810
> -------------------------------------------------------------------------
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199829): https://lists.openembedded.org/g/openembedde=
d-core/message/199829
> Mute This Topic: https://lists.openembedded.org/mt/106130311/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

