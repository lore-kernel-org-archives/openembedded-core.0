Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E49A6CF258D
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 10:42:15 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.52048.1728902535085978137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 03:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RqSH/JHr;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e690479cso1600811e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 03:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728902533; x=1729507333; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKCuI44+vrbQRk2p/5sZTMb0jpeYZW3fMCi6JvwY9OI=;
        b=RqSH/JHra8yCVHljT8RxHW3ePXq95f0Jje/yzluziEy4ISnk0OsBrgXhWqCV1lk3Pd
         yy+8wZfRp4wWQzyVZrcu8mBFPdQzuvmrkJhpcKVJ3/EfCtix1MgsyrQ3AYc9zEJ29qOX
         sm578JMCI6e9CWlbZwYQyuAwTPPfvwaOm+IN5LwU/PM+0Vyu7A5qQ0VRVssYoMJF4/+j
         E+b6lGWhPbW72z3A7c0WwwYkgns+TQKggIZVqxYJO0w3oFFdjWkSI/A2w2ISgDZrJaBK
         62ovYEij4YwUmTR/RNW1XqhfNJ5jcHSFtDdgJMYkmKdHQ45NKDX4+ky3KL8JPJD+v9Qc
         pHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728902533; x=1729507333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKCuI44+vrbQRk2p/5sZTMb0jpeYZW3fMCi6JvwY9OI=;
        b=eTMBE/SJnoZtUwzN+jnP+6WhqIKA1Iz88yqk2zvN6UZCJj8TOEahzGvBeRVyPc82lE
         BMOjtCHzN82qnFQtdubNh5CN8/TQfh8IOQNTGtoKaMK0zA5VIeNPkEBs8VDYFsM3bkde
         /WUf+/aRYz/phqoTckA2I6q6wnPeCrn9x1p3RQciYHkDE6XnYpwruQzOrHl2BiiYwL/8
         jF2OjVX7IS+m/s/HmilUE2H+cPYCLGUUxMTOK4kwBkpkLm3/uBOfy+RNofWhiHtG15Tw
         x8KdpwgaRVU0RRzD1bZC0roTgOIhiLHIKHG/dK7iXUY7+YMB6ERhS7P/hDgXrAWUibQX
         m9Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUTmVAe3uGC98iPWXr+QjIUqAUVYDTD9OSrOuGk0L8L+apT2Isxf68flObsdMWg0gnuhsZZzcykOx3SrY4myXmFDA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yys2S5YvCMMz5CoTZ/3jgpJgMHzYRvzUw42EzSYxMrwBJPnVUc4
	ytPezHHyEtj9EbbnQRbvOW7/hni3ABsCXHpAF0yS14QjPMNBzbHtXYIamqBviNsheRjkzXlfpoC
	WClQvfgizIBIX2NFYFZSuBhAN9wc=
X-Google-Smtp-Source: AGHT+IGSZiJnOzGYZl6BbTjuToffT+Zhe2dlTiXAmDY2jdu5g/GqF/k7hJ4jd2Ti0Ni3Asd9rMrJ77rC4VONI1q2Tg4=
X-Received: by 2002:a05:6512:138c:b0:539:8d2c:c01c with SMTP id
 2adb3069b0e04-539e571dd25mr2937604e87.41.1728902532825; Mon, 14 Oct 2024
 03:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20241010205033.159589-2-t.f.g.geelen@gmail.com>
 <CANNYZj-NujKn-r+j_KgGs4PRCAxUY5Z1v=gU_hx8fg1hBa+KSw@mail.gmail.com>
 <CAJo0Az5a=-diCyNyAC14Ef6JTS4auzcSO2NQnaiYG1k3WpCw0g@mail.gmail.com>
 <CANNYZj_w+Ba7mhS4Jd=LaiVPZse0+pqGL3KSFN1uyHXTmuEkRg@mail.gmail.com>
 <CANx9H-CksfTYqbSbiirRT0cWeDy9sOPJgrA_s66Oj52d6Q44Yw@mail.gmail.com>
 <3d120a63-7fbf-43fc-8f44-5ad50ab1a061@smile.fr> <CANx9H-Bi0CKSMdH9fsQ8hAzabuyk2bX3hm3ZqUoPdmuupLeK_A@mail.gmail.com>
 <CAJo0Az6nDT-av_8HuudUt5Ob5ga7+=Qofaaa2Z2RTjKpsC1T+w@mail.gmail.com>
 <3831edba-2e59-48a8-9186-52c5a4081fd1@smile.fr> <CANx9H-C3W5A=gQWR=x7GS4OuS1m9qB6tv7H3s+GMD1Lj25g89Q@mail.gmail.com>
In-Reply-To: <CANx9H-C3W5A=gQWR=x7GS4OuS1m9qB6tv7H3s+GMD1Lj25g89Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Oct 2024 12:42:00 +0200
Message-ID: <CANNYZj_tzSQ5a-CrBCka9ARa7ou2mudPfW4j3wOjbX0Pypmn4A@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCH v2] python3-cryptography: upgrade 42.0.8
 -> 43.0.1 -> reproducibility doc improvement
To: Tim Orling <ticotimo@gmail.com>
Cc: Yoann Congal <yoann.congal@smile.fr>, Tom Geelen <t.f.g.geelen@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 10:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205743

On Mon, 14 Oct 2024 at 04:00, Tim Orling <ticotimo@gmail.com> wrote:

> Yoann and I were able to figure out a promising fix for maturin which is =
the root cause of the reproducibility issues. It needs a little more testin=
g and rewording the commit message before we submit upstream (I mentioned d=
ata.tar which is a .deb thing not a wheel thing)
>
> https://github.com/moto-timo/maturin/tree/sort-records

It's a bit more complicated and I thought I'd document that. There are
three separate issues here:

1) Maturin creates a .whl (zip archive) where files are listed in a
non-deterministic order in the archive index. I'm not 100% sure if
your patch addresses this problem - does it? Are the files supplied to
the zip writer in sorted order?

2) Maturin writes a RECORD file into that same archive which is as
well listing files in a non-deterministic order. This is certainly
addressed by the patch.

3) python3-installer takes the .whl from maturin and processes the
files in it in the order they come, then writes out *its own* RECORD
based on that order, discarding the RECORD from maturin. So it
implicitly relies on the intermediate .whl being reproducible.

I've fixed the third issue [1], and it does fix the reproducibility
problem in the actual target install of cryptography. Installer
shouldn't be trusting that its input is already sorted.

[1] https://git.yoctoproject.org/poky-contrib/tree/meta/recipes-devtools/py=
thon/python3-installer/0001-src-installer-utils.py-sort-entries-before-writ=
ing-o.patch?h=3Dakanavin/package-version-updates

But the fix for maturin is of course is also welcome.

Alex

