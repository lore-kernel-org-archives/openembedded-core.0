Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA00DC48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 14:13:56 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.12503.1707488033893749724
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 06:13:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CoYgyzCX;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d0cd9871b3so19208541fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 06:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707488032; x=1708092832; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Okfkn8DejA9EhGOH4zNdqn6YawVwGWDnuMQ41qyWZO0=;
        b=CoYgyzCXy2OKcuUtDbpITipXI8sdpLhpAklTEZ5B7Y4A0mk4DP+6TpVfJm7ZKirC/G
         veRVtG5gI3gIwwSGSfwUPsqGVzf/w9jvAJ+Efjqlt1csmrkA4fQ2kYO6jdfF4N7thbs/
         X5NGxpL6S3sXboayihNKsSwkNwTWdIu8k8aHUTgZHVTOCllZqzR9wnCvfkHfoxjzVbXK
         Cf1c3Z8l9nerzodYdl358N2ss3mmWTrqp6YviSFjzR3OqDFBfwzRXKZD8pBwYAQ7Vllr
         PUdAb5Fk0P1P/G3Ui/5qqL+FaXAK2QgaAA2efRn3zik+fKMsJaRtJWEyikjUA17XfzBe
         TGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707488032; x=1708092832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Okfkn8DejA9EhGOH4zNdqn6YawVwGWDnuMQ41qyWZO0=;
        b=jmY287EkaIAw/NCKfEHZjNpOolZQ2La8bnI2mgvYE4GR4lZwyfoA6QJeyICTtbf8nf
         wc8rSGu/dmYJBzP27SRiy9jt1blRcRV4GSxlCbRojxb5yTg9Yxd4K2mNZDzyhbZTjkcP
         wwbIOQlkNerDIl2NSEHwHWilvYzIJW8yh2baqPjlnGqoIuBzp1aBrylz3a45MhPfu44R
         xDa9Y2uC1URX4O6xMxOKY/E32JtuoxAaLV+m3RhUjY95bHKXEQwyY5bAmxkR2Kfs3Y8i
         +j1u4p7uZQX/C1lmZPt+UTSiEqAogU0eXHNrR4ZmB774R9mrnT+6eCPmMXPzGpsb6RYl
         hinA==
X-Forwarded-Encrypted: i=1; AJvYcCUKH+pfk8xt8m106zxaGqJVF5b9eetIwqW+Hrd6050oECOSo5YqbkBZbzfuBgNRaPE0IJ/c7aoIKrrTqckTovpC8oxuZ/flqb3TaSuF6sFVPCzbHqXcoJJX
X-Gm-Message-State: AOJu0YxqERn1tS+lbcgIjb9fz4YUCNpEqG83Y/veCFFWDTJtondGmWGG
	Rx3sSHjsmPSoo5rXnM3FaRgryEmiPRxH6UNPpILh3ily1mJ9DjBHl44NeivqkKot817vISgverV
	TtryAHhnvHtwVYUVl79+vlqIKfn0=
X-Google-Smtp-Source: AGHT+IHItkipTx1mwceb7bsqlnMjWB1ZhEzJtj3MYFHmeUWKYNeo9JrZ6EpOVAxjUodM9+m47uVKNJyPtZDtxTbh/z8=
X-Received: by 2002:a05:651c:211d:b0:2cf:2c84:bcd7 with SMTP id
 a29-20020a05651c211d00b002cf2c84bcd7mr651558ljq.18.1707488031879; Fri, 09 Feb
 2024 06:13:51 -0800 (PST)
MIME-Version: 1.0
References: <20240208185641.2969396-1-alex@linutronix.de> <C6BC277B-9507-40DF-94BC-3B71E06CFEB6@arm.com>
 <CANNYZj9uH+0Uhj9GN6wxKHXuZzGvnkzjydUJ4eD1xu_mi4V_WA@mail.gmail.com> <QJDL8S.L5SFWUB1B9X8@t-online.de>
In-Reply-To: <QJDL8S.L5SFWUB1B9X8@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 9 Feb 2024 15:13:40 +0100
Message-ID: <CANNYZj_Ludt4Cr68KnVCDz-U51WvpyE1qLFwhM10ePAXR7zKkw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] shadow: add a packageconfig for logind support
To: f_l_k@t-online.de
Cc: Ross Burton <Ross.Burton@arm.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 14:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195217

On Fri, 9 Feb 2024 at 14:59, <f_l_k@t-online.de> wrote:
> It's a new feature in 4.14. If someone wants it, they should find out what it does and whether we want it enabled in systemd builds.
>
>
> configure.ac states, that it is needed for systemd session support:
> https://github.com/shadow-maint/shadow/blob/3e59e9613ec40c51c19c7bb5c28468e33a4529d5/configure.ac#L403

You also need to check how it worked in previous versions. Why would
we want to enable it, if it wasn't even available previously, and
things were still working well?

Alex

