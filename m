Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA45DC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 09:08:44 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.8713.1738141715475573778
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 01:08:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k+YlVKyy;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6dd1b895541so131241426d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 01:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738141714; x=1738746514; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76NnsBX4AkjBf4FIYMjHtdDJKeduUimhtdkp7fEudi8=;
        b=k+YlVKyy6x6SIItWkvl5zQQRr+rcYZxNv3jx3chjUIPCd1Ddc+Bvc17sk9ncuu+zWy
         WbjMeURTsX92Ln7edwPbDmyjsdr2Q/Zvt2kmahUzws2XkhWDGZ5ojxUfxpOTZK7Sp7V5
         edO1VIrkP6+wAJgR88RkPtz6ybb5py7ZBjR/PUzmIscEaE79dBFNm06koJDxZ0GaFKFz
         TKWUpbCY4+cvmPVVS0wW0OJgWrpIIAcJoCaOpuBRvCntkdkwOt3OG36TzfWpALaYy3Jw
         MPL/i2epDOu6KoBKC4MWN6k/44scEvogUBqz/73EfzQRbpS1QlLjc9l7aLu5erSDBBgP
         TjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738141714; x=1738746514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76NnsBX4AkjBf4FIYMjHtdDJKeduUimhtdkp7fEudi8=;
        b=X3lpM2PGsX5eoOEIZ6y46E9FDc+GSSiMagkZOk2Xk7WAy6vz7+5sU624OhAHnsfhe0
         wNG9G+qYnAa5xGfXDH9J6ccQKaAqcu7UEUY9qTtzilj0UZajo+g7bto5hLuoJBTIm0eL
         YmHB1y3YUshYkXD3FMIfxpvkT36PBiNJ89dNq7fWyAghGQKd3az2BQay97ZNTJiopPL4
         vwlhG6XAS8TvUU9IaTNdhG/ppaZ18VG3z6wrbo3j5bu2gWShMW7N1cenQ+b+wEceB1L+
         I22AA1k7SyteKVBf2RE9ssTmpkpV7hxl0ZOSX6guz1dIZQqoDB+2FrS/+D4Cp2Q/Sa5D
         U0Ig==
X-Gm-Message-State: AOJu0YxpI/kyPsLqyQ9RoGynXQaZRjNgGvr3vYNO/cvA4SwuPrcBw932
	cMxv0vzOZJxnNBbHG+cHfyYxjgowNf4Ef/6rH3FXyYRQLb8QU/kOYPzSwA+3AaQxqESzxUxeOZN
	b7g9WXk59s0RDlISEcwW8N7UyEGwNiA==
X-Gm-Gg: ASbGnctxITtIjFWYaSsBSbVK7QEBvItnaISELsbjj229JYpbFpJpZjs8e3RPtWDDC22
	rHsLTExLNxAD4xm7seHejRBl5rXgQm19jjvSqxZo3pYFu6ul1m+NTj7FD90fZVFMzJTgqvJN40u
	0QO/lsnpYLAWNCkCCOsaMG/44DZms72Zs=
X-Google-Smtp-Source: AGHT+IEGrNjGD5lBt4R1tnkZ+2CJVVMjcguMrNvsN8SPiIYluC9gBgDzTH/7wZZ6FZ8jt/BGoI73u9vGyjA2VUsh+Ec=
X-Received: by 2002:a05:6214:4a8a:b0:6e1:85d5:9723 with SMTP id
 6a1803df08f44-6e243c65566mr43081076d6.31.1738141714413; Wed, 29 Jan 2025
 01:08:34 -0800 (PST)
MIME-Version: 1.0
References: <20250129080902.1863054-1-zboszor@gmail.com> <CANNYZj-kk=EZMRopOVDVpEVhwzWYSAabSCWWbF7fE7atMN6bNw@mail.gmail.com>
 <b5aef63b-bbab-4bb2-829d-913ffda1ab3c@gmail.com>
In-Reply-To: <b5aef63b-bbab-4bb2-829d-913ffda1ab3c@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Jan 2025 10:08:23 +0100
X-Gm-Features: AWEUYZlGonxxa37ourxiH5OyBe4T5srwIjaaSPrj4tuploNRd9c4xvELExAkgxI
Message-ID: <CANNYZj9yR7sS2y4BuncF0FGnL905huijD0oe7ZONK+v+FkAtRw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/3] cargo.bbclass: Allow using --offline instead
 of --frozen
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 09:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210355

On Wed, 29 Jan 2025 at 10:00, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
> But patch 2 in the rpm-sequoia recipe is what "cargo update" created
> in devshell after patch 1. "cargo build" still complained.

You did not patch any of the crates, just a couple of the top level
build files, so updating Cargo.lock should not be necessary at all. We
should be able to reuse upstream's supplied Cargo.lock.

Alex

