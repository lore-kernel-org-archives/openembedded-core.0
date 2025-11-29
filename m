Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3627CFD2F6
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 09:59:35 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12281.1764410368288542790
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Nov 2025 01:59:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XUKIotQk;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4edb7c8232aso35290961cf.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 01:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764410367; x=1765015167; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z8d4F0Lssw67nUvXSELUbTwXdGdEPMd24c4irkAPLcI=;
        b=XUKIotQk+av/HmHWa/LWkhIUTGd+4z6guBlD9CIDWqsbvzyXN1kWcNFd0vXSi5Ht+W
         Gm8qJwwkYEfMmVjPJt5fSw8xPtyocTQ/VXlRnkEJg5yDE/aHwEMoyHNCSBSa74+uQowY
         xOGvXQYeBW5lXCoXg28OwJpvoku1q/mWuS0qDHczH0P25tosd0Yx4xzKNJH5C5cW2sQq
         a+pVFo+WHGmHZrsU7ieYrM6aEz8MrJLwmCrCkVkZH2XPif4L9qS+mIH++0Sq8IdpBoWt
         Vz4GeB4fSKCwLi/dYIFNw6s5yrEg4z4ldeAPM4bs/6d9v6oLDEceSp5n9adBjvcrnnZr
         B/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764410367; x=1765015167;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8d4F0Lssw67nUvXSELUbTwXdGdEPMd24c4irkAPLcI=;
        b=nMd2MDqMm6ul1s1RPlj87e3H13fYfazwI1xwnbH3E0HORhxc48Wi3w+uHZVEBPH99S
         LQnuuaCwLujPHiv+kjhBA++T4cjGHW4mArUv6EwF8ZvSKoG2dzVCs9Kya2pf5Yaly6CT
         jWLJT7+b+1W/3t4lsNIyz3UCmsN7P3BvFPr3ASU1NeUwRK74m68sOBS+SVU+c8Hvukvo
         PFm6cxvxrCUyXOAegtpF1uXsGnMYjhOiP/QUwoEb6RalWz/Ka5Kzx6PqCKMZR5yqgBmb
         jfkm4FY7TVILfzyEnfpqZvPZUGJk0HNZhsmf9ZYiWvTpWCM/7BYtWHb59uBLy2n6wkOQ
         WLzw==
X-Gm-Message-State: AOJu0YwuRVuMtkep3jkIyhwRV9R5Nt4g5W7tvqv+M/dFmh1nHh7vLqZc
	2pbi33XpU3Q5ruQ6UkXeNvHzoiDQP2wsL0GyQGYwtsmkpqAfHSmNJn/fNp9Ft5m73nT1FJaYRM7
	uNIcyd9edzkV1IyPr9SoGQQl8AI/MCkk=
X-Gm-Gg: ASbGncvUqbUWmP16l0OAw+WWH5tInVpplzP77SVpbXqEKKb1JfjPkJ1YOjhjOYqv7+V
	8vRlamw7EdQ9mWcQYqgmx7NcOWeDHA6fGGAjyt7+mSbdN/UFkPdLjmspFIAqyodT/tSlDBpISzn
	jhmpVmWh+dr01uFgKJrsGkrLT8pzvN8zXyV9fPjreVQ++3VJrSaswe7qzwbHYr8VwuImI6HXoqY
	PLmdQj5aNUfXWT+jXj/gMOP/Bzwc9GZQExJMITFASQxdDPolzMzQ4aRAkRm3FBlj53f6Yf1BYwy
	97p7mcvYIWKmZSqfwrMoIc7L9qw2Vw==
X-Google-Smtp-Source: AGHT+IHJtv9+FHeYvD/UqEbG8iSKN5qSDD+bgQeaKXjSTAnVMPAjWgpOdmK90rNyOCYDswwBeHarSSYOF/r+CWNTraw=
X-Received: by 2002:ac8:5e09:0:b0:4ee:2312:6059 with SMTP id
 d75a77b69052e-4ee58a7f60dmr460474701cf.19.1764410367270; Sat, 29 Nov 2025
 01:59:27 -0800 (PST)
MIME-Version: 1.0
References: <20251128182713.4148461-1-alex.kanavin@gmail.com> <247791bb-e71b-402a-b14c-0f51a0bc709f@gmail.com>
In-Reply-To: <247791bb-e71b-402a-b14c-0f51a0bc709f@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 29 Nov 2025 10:59:16 +0100
X-Gm-Features: AWmQ_bmucnT5lMH9GIuTkciL2WSziGNkyJDKDaDQnRkiJuE_q7fduJMAbWNmWjg
Message-ID: <CANNYZj_evzQWBTw1gH9GpuqH=wGwmTwg9HhbyWFz_vUq+Z34tQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lib/configfragments: match fragment prefixes
 rather than full fragment names when disabling fragments
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 09:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226931

On Sat, 29 Nov 2025 at 08:25, Gyorgy Sarvari <skandigraun@gmail.com> wrote:
> > This allows disabling classes of fragments without knowing their full names, e.g.
> > instead of
> >
> > $ bitbake-config-build disable-fragment machine/qemuarm
> >
> > one can issue
> >
> > $ bitbake-config-build disable-fragment machine
> >
> > to match and disable everything that starts with 'machine'.
> >
> > Add an --exact option to preserve exact maching (e.g. when
> > theres some/feature and some/feature-with-foobar both enabled
> > and only the first needs to be disabled).
>
> Why not add a --wildcard option instead, and keep the default behavior
> backwards compatible?

I considered this, but I tohught most people would prefer prefix
matching to be the default, it's just more convenient. Fragments are
still very new, and situations where --exact is necessary are rare.

This will be discussed in patch review. If preserving behaviour is the
outcome, I wouldn't add an option (that no one would know about), it
would be a separate command: disable-by-prefix.

Alex

