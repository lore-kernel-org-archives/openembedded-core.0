Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D576C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 15:54:28 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.21033.1707407662272159808
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 07:54:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IUkrOFnJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-511234430a4so4053302e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 07:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707407660; x=1708012460; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VvEz5AOfp1EknPqfOnWbRz+hcGj7VMbC7r3mZBcZU0M=;
        b=IUkrOFnJOFTUpn12qggfs1KR/J46BBg4qLIYiQqqkTj9yzhayfjrEAMe0hPUEgXFIc
         r2tYjItlwlqeFpzdKQehZgkcit3Qfhze/eRATfKATEkuASsmljzsBHmCO2p4rJDblil+
         +8PxKGD8CS4yzsT+K++GUr1CoCa77iYtK8dDGyI8wm1LKRAg/loIOKsSqcGN/X+XUp0h
         B4XgCDhH3VCXi/oBxOhqdgwDGWjBmTpwmmzyP33vrHXPQUcCfi5BvMMlLl+zITd8OX9b
         syaPsKXpOUO5X9Ds+Cg79tu4jUSSXFausM4kq4iQDqWa1Wdm+um2u6dZQ2A2sffx8k1B
         vdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707407660; x=1708012460;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvEz5AOfp1EknPqfOnWbRz+hcGj7VMbC7r3mZBcZU0M=;
        b=RlnUC22ibQ7OZ23t91qo64tQktyLJpLIWhCgUVJMj5kiKd1VUxKqCAvJfLVvnNYxhG
         r361Q2V36IBmdV/nVDfWpssWG03jn7d8ic94jRlE6cummk5HedJdYMB6Kl7E37mN1WfG
         Yde+wHD8Ti6MiQeQgwFub9mtQ9Ys+COv4OV13y/P+XW58nHBloV9QccnDQgkAnH1JLqk
         sY6XyvZuL0LhhBzD6ldIJ+yTD/a3DArCHfe2orjGwCBo17Ge4zPtkS4hVZONL31JKmSO
         85uR6UUi6qpUbdT+Q/ntzxYgpNgQMNKJEzJH9jynaeNVtL+nIHBcfOINhvUXjO3xs5+C
         wItg==
X-Gm-Message-State: AOJu0YwWMyfY6/0f0SmO2GE08XXBdQc5+mjkpQy+Dxf4Wte0uUGG5/TP
	UOmzLpMVFpLt34pm24jsgDLJFi/g1H9gCdTKDzrUCh3jOepofiHj4AmDXNJC4PRdY63rdOsHFJb
	OZv9OPN8xwGYyLhSjb1KrPXdDFv8=
X-Google-Smtp-Source: AGHT+IE+S0K1YDw51N5cZ1dAMPLzHaRIa7Q6xseYnbsofjdeFFMDV8VXZreMH2HoVyyF4ZQWDUkbdb/QbqiDG3Z79Tg=
X-Received: by 2002:a2e:9cd5:0:b0:2d0:d5d5:4f4b with SMTP id
 g21-20020a2e9cd5000000b002d0d5d54f4bmr1427659ljj.2.1707407659821; Thu, 08 Feb
 2024 07:54:19 -0800 (PST)
MIME-Version: 1.0
References: <20240131123908.1098544-5-alex@linutronix.de> <28123.1707399641733383554@lists.openembedded.org>
In-Reply-To: <28123.1707399641733383554@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 8 Feb 2024 16:54:08 +0100
Message-ID: <CANNYZj9qhPgj_ApCfX0KDfgsYPps=0s=2HC1903--ZsQ4MrhtA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] oe-setup-build: add a tool for discovering
 config templates and setting up builds
To: Jermain Horsman <jermain.horsman@nedap.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 15:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195159

On Thu, 8 Feb 2024 at 14:40, Jermain Horsman <jermain.horsman@nedap.com> wrote:
> >          # The revision-under-test may not necessarily be available on the
> > remote server,
> > -        # so replace it with a revision that has a yocto-4.0 tag.
> > +        # so replace it with a revision that has a yocto-4.1 tag.
> >          import json
> >          with open(jsonfile) as f:
> >              data = json.load(f)
> >          for s in data['sources']:
> > -            data['sources'][s]['git-remote']['rev'] =
> > '00cfdde791a0176c134f31e5a09eff725e75b905'
> > +            data['sources'][s]['git-remote']['rev'] =
> > '5200799866b92259e855051112520006e1aaaac0'
>
> First I got a failure here, as this is not a valid reference on oe-core, only on poky is this valid.

Yes, the test is poky-specific and was before the change too.
Something to address later on.


> 1. meta-default
> This configuration does not have a description.
>
> Re-run with 'list -v' to see additional information.
> Running: TEMPLATECONF=/home/builder/workdir/build-st/test-layer-checkout/openembedded-core-contrib/meta/conf/templates/default . /home/builder/workdir/openembedded-core-contrib/oe-init-build-env /home/builder/workdir/build-st/build-meta-default
> Traceback (most recent call last):
>   File "/home/builder/workdir/build-st/test-layer-checkout/setup-build", line 119, in <module>
>     args.func(args)
>   File "/home/builder/workdir/build-st/test-layer-checkout/setup-build", line 98, in setup_build_env
>     subprocess.run(cmd, shell=True, executable=os.environ['SHELL'])
>   File "/usr/lib/python3.9/os.py", line 679, in __getitem__
>     raise KeyError(key) from None
> KeyError: 'SHELL'
>
>
> I'm not entirely sure what was going on here, the SHELL variable was set in the shell environment, however it was not in os.environ.

I ran this on two different computers now to make sure something
didn't regress, and it passed on both. Can you try with a plain poky
checkout?

Alex

