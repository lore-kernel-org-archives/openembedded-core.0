Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D56C3ABCC
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 20:13:57 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.60372.1747080835644864949
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 13:13:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lyOi179+;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-604f0d27c24so2520147eaf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 13:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747080835; x=1747685635; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R//i2r8tscIHw6/J7U2JCCSKnPGbAXvSX39E9GHau3o=;
        b=lyOi179+J8vFO6qQIhxJ5KwC6sP7c5tZUGJarwjSOQ10Cxy+OmScX6acjaUdAfEx6v
         jo0gWg591lrazYWotf1Xvvz6FvEXW2jzPdOPsKtyTkIC+EN++ODaoh+TIOOwrDrOIDh5
         19+l3mVGBf+l6a2+KZDKXkqvruvHGcCvhkk+C+bn2GGLcypYNSiWUrqLDteh4EQvxPw1
         yhyJ+uo+MvndtSTSa3uYOXhNTsZSNWUaySHAhMvG2uhc5sHs9ab+o9KYpkLgshEiPCPo
         VnwJNYLG6gYAweS2HEl8SmbOYayMD15/JvcIj2s0wBIkTCTNaP97i861xcKhW2hBsEhF
         8/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747080835; x=1747685635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R//i2r8tscIHw6/J7U2JCCSKnPGbAXvSX39E9GHau3o=;
        b=VpQwmmuVDT4blP6nk5ia3/OBQCwWTFv+5jdBUdu1jwOBIQiybUXQzeZep4EMEi3ZJD
         /yoCOaDFB6WExJBBBbSJE13a4Kjp1430DnzminhIRRGt4fxkqrq7GXU/MbhLgPaAXn1Y
         fdRtr6/EuzBLKixHNmOonHQusTBIaSGExT9MWJXOWWUHKKBfArpSmJsrxuBOF+Cf7Mzu
         m/4MqNcd4KKaOncfl1VEh4MXaHKo9vuPsuxkIG8+n5Qw7DamxKLwV+VW/DijunMBQQTJ
         odIQsVHOlwGy4XeBmIGsnP4K95/fGtVav80yZ8rNvhcdWzFWnUalswDZjosbP69xef3u
         ljmA==
X-Gm-Message-State: AOJu0Yxx8spAXFE6Zyj2+o9RDmbzp0IAbakyjb33chL9w2sHwEpm3ZZd
	je96/gc4Ry6tV4U71bJrjD1Afir5+S3jYusK1k51PoRDuy02jpix6ceSimDyF0lNlbbe11WPAlw
	4/dlCaJxu8sGxYifzgRbQW69JV34=
X-Gm-Gg: ASbGncvWYXDCMQtjWzVrfbHaP/0RH607S652ivw0Rb+D1PSRFJJwdKFHJekK7w6duQ0
	zn4jE4EPQfuF5OOcgFYGxiVZA+XW1QIjl9IpmHEfN0nQfDkat81sa1M2qtmlodvHyz+D2U5k4Lh
	jov/hmnsFo5PsPNU2exHespzPYX79jSE+Jx2BlfcWSWHC35x6BHlHhQbUQA+61X5QfKW4vRx0=
X-Google-Smtp-Source: AGHT+IGRRtGzqsdfcU8+1xp1QwgYiNuvTEAQlJ6VCcbF/2bYY6WO/he31wQ+C22mZexNb9DCqgZX99PEyqhhhYyRBCo=
X-Received: by 2002:a05:6820:138c:b0:601:af96:36eb with SMTP id
 006d021491bc7-6084b630096mr8424965eaf.4.1747080834769; Mon, 12 May 2025
 13:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAOazyz0qBLixP2bfONcMs=HfSf6G_rxfz5AHoV+EZ+q8J7Q+8A@mail.gmail.com>
In-Reply-To: <CAOazyz0qBLixP2bfONcMs=HfSf6G_rxfz5AHoV+EZ+q8J7Q+8A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 May 2025 13:13:28 -0700
X-Gm-Features: AX0GCFtP4Q_9FLZDM21wzV5PZ9oA6CBtjr61nC5brL6s9T-HI-wtAGtgUuyIgZA
Message-ID: <CAMKF1sogaVV_UjftSwAadqT0jgcK1ctTeXBrA6YBo-SDM+S3pA@mail.gmail.com>
Subject: Re: [OE-core] [backport] [PATCH] module.bbclass: add
 KBUILD_EXTRA_SYMBOLS to install
To: alon.barlev@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 20:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216387

On Mon, May 12, 2025 at 6:49=E2=80=AFAM Alon Bar-Lev via
lists.openembedded.org <alon.barlev=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Hello,
>
> Please consider backporting "module.bbclass: add KBUILD_EXTRA_SYMBOLS to =
install"[1] trivial patch to Scarthgap and Walnascar, it will allow buildin=
g kernel modules with dependencies without linkage breakage also in stable =
branches.
>
> Master commit hash: 483c6067eb1ee9562c0b21cea0d375c7f521bede
> Into [at least]: scarthgap, walnascar

It will be faster if you can send the backported patches to the
mailing list after testing them out on the releases you propose them
for prefixed in the subject line

>
> Regards,
> Alon Bar-Lev
>
> [1] https://git.yoctoproject.org/poky/commit/?id=3D483c6067eb1ee9562c0b21=
cea0d375c7f521bede
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216370): https://lists.openembedded.org/g/openembedde=
d-core/message/216370
> Mute This Topic: https://lists.openembedded.org/mt/113070483/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

