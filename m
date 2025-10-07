Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F078FCCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 10:30:32 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.15256.1759833029260892350
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 03:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CA5w6uum;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-80ff41475cdso85894016d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 03:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759833028; x=1760437828; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fLYPM49BWnIu9Zuc4iG6icvMyRcvsBlYlrhYh8Qrpjc=;
        b=CA5w6uum3ZofIRxe9QfQPSFYwczWaSgLkX2F+zLmKLDgk/N2AJ2BDe+6r8JjyF6h4v
         7kOCXBg0/N9nuAh+8LVQLcqMLWV3gwPN7U2LlszPfIy/2mSAY/UrcOBruiT+/NBv4+5N
         BtwKWDo8xiu0gq2yFdM/nTWorT9cFgWZTVWPDlFwe+mPU6sQKm2zj5SYkKiR7A5ABkkc
         MylVHQWJe/noLBNEg1gspktYi1rAegB71j7YN9a7s23zxzjM7jj+pWirqOGWmoxQIR1T
         Y84mWURe3SKZlfuxKkwZGf/b901diFheetlq4ZDbCU3c0yybbRFDg+9oVwWw8SV9WvOL
         gVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759833028; x=1760437828;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLYPM49BWnIu9Zuc4iG6icvMyRcvsBlYlrhYh8Qrpjc=;
        b=T5o9RX/yeVnNKI1cZ67aZU/f19A/qDBDnuBztWJinsBTk77d3Bgc+GGmqZwD0OV1Io
         utOyKQctBlpMT6/Hrq9QW4tUUzunTrdGH5rUksFzmXTye2/pwC3bv+yR8Nnxg0PX2sM2
         nldCxsinRI3dDBsLU2F8dZHc/qWjw4ao8bl7+vlEuofKzfhJNjeSB9B8xVXSMjd5ZOEX
         H4DD6mlRnoGNb/N9wxww23PTqH5gtWlaKxc32/2VjFWSzMnW5OgAe5S+9gPRHPmsYq+k
         SjSWwKaYyk3SJw3NczeoVnaiHiqz67Nphf8hja4rSiCkWecUaZ/PI3ZIQ32sWiL2YpE9
         lESQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/9vJ+xHg9nEPNIWQZGHzj0zn0oL/UVDhzrC0VKG0WUqC2zfOT/JIcSJs1deUcW3LkMJceoSGGOdH6JsCdWCFZrg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyuPhn5LdPGToy7obOVIsr6Bk5AwaTexdXabq+aLIK7qWz1eYCG
	j/DYtGDAJe31SA6QJfZaY2NZI7h2DBskxOMCTj3Gnt82w+FdmUIMDKk461ujJF4Dr9Dg5q9p1mX
	yii5pIq56Xrzp/1idCdR5EILYpsbsm2A=
X-Gm-Gg: ASbGnctqo1cdL2bqKQb/r46PQoclBs1fY4AYjot/JWIrI5maJPP/k8j++fbIPsuboQk
	UUSHNWMmS2OYOYSOIclTJE7EKIVTmkh4qZWmhIwokeq0hwPWCS/Zw4J2JB3UKmV9IksjCV/5hcS
	tZv3bia9IA8QTSJkOBYwEinhx1anv2cM6qdkbZldGd6sGiaaKdxXoC+ugH8qEtX8MNDp+l5Gb6Q
	iipmu/RIhif0XamDznAF+gy0giZx4l2xRI/alXRO/E7QbueJJI8KwNygK5Fj90Z/W9ctMihO53O
	lUp/iYqWLw3v0ystdm76WVjip5Yvb3/4rtfOO/uuMyLgS4B3scd7qgjOz8Hh9v92
X-Google-Smtp-Source: AGHT+IG+3oJUD04xVGyaAfQN/SC/QwXLh6Dmg+tKeW2ikA4mjNWDICsx0k8HqS1Ky8Pjr7oeZWn+dEvOhIW1nBP2Bts=
X-Received: by 2002:ad4:5aeb:0:b0:817:448e:b12f with SMTP id
 6a1803df08f44-879dc83028bmr169151196d6.35.1759833027980; Tue, 07 Oct 2025
 03:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <20251002015030.2464972-1-dmitry.baryshkov@oss.qualcomm.com>
 <feae4e64-0969-4e02-84b4-3ecba5e41a02@cherry.de> <282130EB-8DFE-45D1-A1C1-B7720DCB615D@arm.com>
 <9179d213-ebd5-43d9-8748-6981807c29f6@oss.qualcomm.com> <18ea0a5d-036e-407e-96bd-ac1e6209ccc3@cherry.de>
In-Reply-To: <18ea0a5d-036e-407e-96bd-ac1e6209ccc3@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Oct 2025 12:30:16 +0200
X-Gm-Features: AS18NWDq2q7LPJYNC-Pt2llVlHkNiM4mt4dDXzWQwfbeCCHu3PBvRbgVL_c7Y80
Message-ID: <CANNYZj-KyG5yJKLS8+ew7GEdc_7+NCLSsmmUtT5KXx9_-1PkMA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa-demos: split info tools to a separate package
To: quentin.schulz@cherry.de
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 10:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224517

On Tue, 7 Oct 2025 at 11:36, Quentin Schulz via lists.openembedded.org
<quentin.schulz=cherry.de@lists.openembedded.org> wrote:
> That's making mesa-demos kind of a meta package that pulls in everything
> built by the recipe and at the same time the only package bringing
> binaries other than the info ones.
>
> Can you simply add this to the commit log/as a comment so that we can
> remove this RDEPENDS in the future if we want to without having to guess
> why it's there? It doesn't reflect an actual dependency but a personal
> preference.
>
> We could also use RRECOMMENDS here to show it's even not required per-se
> but we think you probably want the info packages too.

FWIW, I agree with Ross and Dmitry: preserving existing behavior is
the right call here, and that is not a matter of personal preference.
The patch has now merged, so anything needs to be done as followup,
whether you want to add a comment, or split demos into
mesa-demos-demos, and make mesa-demos an empty meta-package is up to
you, but I'd really rather see you spend your time on high-impact
things that matter to the project as a whole.

Such as:
- sorting out the ungodly mess that is linux-firmware packaging (if
the packaging subject is close to your heart)
- solving perf reproducibility problems, which is holding up the
upcoming release
- writing documentation for bitbake-setup
- or any other items that you can find in weekly status reports.

Alex

