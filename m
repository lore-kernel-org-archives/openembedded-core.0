Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1D1C3ABC0
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 13:14:05 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.75442.1746537238548114709
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 06:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i5+LyyCk;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3f6dccdcadaso4327805b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 06:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746537238; x=1747142038; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bBgTNCx8pvlHkon4VL25JsIaLRct2XZ+mGD1YRtvLE=;
        b=i5+LyyCkDqMUCnVyp0lpwg+q3xb3X++pOOJigYWQCbtdgflamD+0a1x4VJPjXfecws
         mxAJHBKMM7gz5oWXOYF2DEh3yusy3crG/nVl9+L2G3fjZndMXp3Af9Sp3DJd6YrI+nfR
         j666wWdz0Uyhz64rCvNgBwrlFpGdyIhHcz53mpFAzWfiidDC4lFMHMyZhN4D5qY4i0qd
         nJNLlurpsAeuwFf0iv4bVTQ98f2f7L39h19yVhJTGlTo5r0l6NqikUmap9NFumD9CWDX
         S61m8gmVLKDVgC2YDOH5OYWLNxVEUjp0NJBUPp8fl3o4gS5OIymw7gz438pD25ke+7I6
         uWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746537238; x=1747142038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bBgTNCx8pvlHkon4VL25JsIaLRct2XZ+mGD1YRtvLE=;
        b=UsadGJzKXNhTIBL5Uc4F6Ux6JsJ1Nn1FcTgbI/crnTtEpVVk9rysmpTpbyxK9JRWLe
         9MIYsdR8C1k9R11h+QPKaXSxZ4etc3a+ROTKiHQQpRxVjGdLCH9uUQMSZwa6aMGvTREO
         QonNo3YMnotTK+3IMmsMqVn7wFB/AoJwqjmD7tZGMmtxet4QgkadNhsk5A+0txCtY8Sk
         M2QC/by/Lul1zW1pi201OL1h8AasY7IFLZdqiFhcfsr3ZwbJbYTi2cYsjUGNVXihuSl1
         zZ6LxQT5SVKUlboQc4PxzlHpg0DVdiQemdvIQHaZs4yQgajEANxbkoqaUwscj37eXoCY
         YZ7g==
X-Gm-Message-State: AOJu0YzAlXUSkKLSLqYqZYlQ36pqXNOO7UZDHzirF/udB2upkI1qdFUn
	EENdTw/5DzRJ/dci6eP4zixwkc+qd147yKcm3RodLzByS9jT6DEKxwgTbPFw25/OVQ2EgDyqKfG
	kOp7qGNgZCZHHxDwMFsbLUMTDd5E=
X-Gm-Gg: ASbGncsekLB76XRKrjclY6+2IUNZyu4ObwHAOWyxxC0W9Cvvy8x+3xK453OzhQkrVpS
	Jq5bCpxxPVZ2Eq97jXtldewEhfh8gw8F7K/XtLdimxe8K00DhXt4RaVapb1kxdyAnbc2LQe/Rjr
	It9yFaKzf/jXzjYy4z8PSGOlnTayppr7Cr
X-Google-Smtp-Source: AGHT+IHE7aT3gYHoGzEEHlrahZDpPRaY0hCLiVl2v0CmFcTUVwGhbwLfzFURgl8GNU2VNu0nIW9KQmtWc79HeypHUWU=
X-Received: by 2002:a05:6808:158a:b0:403:5150:c348 with SMTP id
 5614622812f47-4035a533eabmr8119620b6e.4.1746537237682; Tue, 06 May 2025
 06:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <0a4bac6d-292f-4278-ac5b-348a160a319c@windriver.com> <23053.1746531517602060473@lists.openembedded.org>
In-Reply-To: <23053.1746531517602060473@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 May 2025 06:13:31 -0700
X-Gm-Features: ATxdqUFxQHwjz3eUBSUrxrivwGYMsZa63IEa9g_Zw2NdQtgYgyPMeypbOoGJo1w
Message-ID: <CAMKF1spM6xrsWf1CvUsHr+1BF5Eo+X+ZKSN=DOiXq0Y4DrGYMQ@mail.gmail.com>
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64: gcs required
To: sathishkumar.d.cbe@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 13:14:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216045

On Tue, May 6, 2025 at 4:38=E2=80=AFAM Sathishkumar D via
lists.openembedded.org
<sathishkumar.d.cbe=3Dgmail.com@lists.openembedded.org> wrote:
>
> Hi all,
>
> I am also facing the same build issue. I tried to understand the issue. F=
rom build system for both openssl and systemd, -mbranch-protection=3Dstanda=
rd   enabled. In fact the support this flag added long back, https://github=
.com/openembedded/openembedded-core/commit/8905639d1cdc5ce809cc5ecd9672f5e8=
6bf8a579 and tpm2 introduces additional dependencies for systemd as in comm=
it https://git.yoctoproject.org/meta-security/commit/meta-tpm/recipes-core/=
systemd/systemd_%25.bbappend?id=3D6eb3098e57881895e62fc811f714c2aa4ecfcf8f.
>

is this flag passed to linker as well ?

> So something issue with gcc-15? or what makes openssl to loose gcs?
>
> Regards,
> Sathishkumar D
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216040): https://lists.openembedded.org/g/openembedde=
d-core/message/216040
> Mute This Topic: https://lists.openembedded.org/mt/112627480/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

