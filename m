Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AB8C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 23:40:36 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.983.1745365235542983675
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 16:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TCPyYOHW;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8f8657f29so53603076d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 16:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745365234; x=1745970034; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2pQvmYDqtOi+uAO2CSNY/DOUPAxEQVPfTjeSjwUZrEU=;
        b=TCPyYOHW0O+ZOc68RU90orNbXduzCgEzrTSVVpwmMysXS1ls7Fq4ZmWYlePBfiv9uN
         vwbmEipzFp9N1a7v/+senEl6j4cOXzc57J+Tl4h2Ky0whkE9hgZe0Hx41me386C/tWSL
         ygmQlgUpROJt+LooEm2szVS7ofdbS8nZhSCiNOELdQ0kbpmJKQuFhw8wUn2SczKYeB/m
         0L37Sbjz6PZ54P4BtpNPgThqZekPLzIzfhz1ZwziGPMS54+mB6q91cY240SP/GtdG2wH
         u8OiDUnzfao33aRZSxanVVvatjQ/AblQQGLvw8V5HYfBlmrKSW+qhbmXvJZq5bjc1bQX
         i1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745365234; x=1745970034;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2pQvmYDqtOi+uAO2CSNY/DOUPAxEQVPfTjeSjwUZrEU=;
        b=l5Us2aOqDVHrpqJ2bCvS5t+ckI0YO2rPnX6Yl0sR81YMUmAYJdNtfSN7qHPyHGiiVI
         WGqLoGrAaUF21jEnRVib8s9C0RZP1IsYQ8Iq+1dtmuSgKwJZ9H/mt6OQfwSDyo2thwwb
         i5oorrcGHZXlWND5UzzGDdT1fzQDUTT3gEkE7BByACHPGPkjChrNXUvHZT1SrkcA538D
         7YU8Bo7dARxF8IvrNE94W3bJ++Yqs9On3YX3OoCfELhiCN4tkd0vG8fLw5TOxYaCBt6Q
         FB9rsXcodIiy0/frCaIP8+5CnfcFbAMdgHR7qAb4/1BQrxv8Dzo/84cT6hb4ksA20jJt
         NNIg==
X-Forwarded-Encrypted: i=1; AJvYcCXZW4Ph9jXzfRqAz5gao+hK0Lq20p2ypDQR87V2yRL+0/leX9Vko7bgfgDUUZJNbXpHRzjmWgql8cc+pRkVhpAE9A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzQt/uO6Z7rhzCuVir+SPYaUQlAQ2pDcHQkvZ7wQ5323hI9BLGq
	jI6NJ3LnyAycTiCmrCoYajFA9q56jEystWUDPtGvJhcZ2EU03Y67vCi9u3Au31mAWWpotvqbJs8
	LU3Y1u7m4UNb2RzGnLI7zhmJLRL4=
X-Gm-Gg: ASbGncsQK6+i5oJMo0RN/ENQfMumjoVjzvWMGjCoMjISIWNZryARHR/DB+uVlkKzIIw
	vYPfhfglunp2CCwr0V4xPtfj8xq5RRH5kEIyR4DuD953wbJ1HlgSyTPls6FsLgLkm7349yMu0mC
	Hkp7VZvBr7Lm11+1zttL2pefbAcUO0VpGsofJWwQsD7oTX1+ttlSTTRtGu
X-Google-Smtp-Source: AGHT+IFUTjvcQhyG02lSvI/uMH7iQtfhdmqQv0ZEf042UAfn8TQzISMJYHTFLAeSuOIuIJy91O+facAv8Qml1i3xBVs=
X-Received: by 2002:a05:6214:1251:b0:6e4:4274:aaf8 with SMTP id
 6a1803df08f44-6f2c4539db7mr254891856d6.17.1745365234627; Tue, 22 Apr 2025
 16:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250417102130.800-1-leimaohui@fujitsu.com> <CANNYZj919ZzBoW6iDURx=aH2DRFyB0Yhy0V8TLwBv_5xH64cTg@mail.gmail.com>
 <41b65472c37b399e2d4c770819bf7868cd145665.camel@linuxfoundation.org> <8f5a866f-e11d-4619-b159-8d3db541af52@gmail.com>
In-Reply-To: <8f5a866f-e11d-4619-b159-8d3db541af52@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Apr 2025 01:40:22 +0200
X-Gm-Features: ATxdqUG8pwY6C51xvctXVQ_gd8rPeWvSeG-ykX7jFG786hTSXIsI6wTbH1HLkq0
Message-ID: <CANNYZj8yBO2o9BgTkzYCECVgX89-0C6tJthfvWhxoKA3SSAMiA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gzip: upgrade 1.13 -> 1.14
To: Khem Raj <raj.khem@gmail.com>
Cc: richard.purdie@linuxfoundation.org, leimaohui@fujitsu.com, 
	Denys Dmytriyenko <denis@denix.org>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 23:40:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215252

On Wed, 23 Apr 2025 at 00:51, Khem Raj <raj.khem@gmail.com> wrote:
> Consider other side of this as well.
> Many embedded systems do use busybox heavily, imposing dependencies for
> tests like this would mean ptests are less relevant for such usecases
> since bringing coreutils might also shunt other busybox utilities along
> the way.
>
> I would ask this patch to be proposed to gzip upstream first though.

Nearly all upstreams run these tests with a GNU userspace environment
on some classic binary distro. It's not that we impose GNU on ptests,
it's that we don't want to deviate from upstream expectations, as
doing that only results in upstream unknowingly introducing
regressions and us fixing them after the fact, with no guarantee that
upstreams will take the fixes. Version updates are hard enough as it
is.

I can kinda see the point in fixing ptests to work with musl, but
fixing them to work with busybox is a step too far. There's a lot of
ptests that already pull in various GNU pieces, so adding gzip to that
set will not make it any worse.

Alex

