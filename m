Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EC8C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 12:03:37 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.20329.1702555415297090548
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 04:03:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aBuPYYwE;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ca0c36f5beso105100931fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 04:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702555413; x=1703160213; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qhfy9J/+kZnq5CFoSmeprSeUzufV/Ddo/d13bR8HsPs=;
        b=aBuPYYwEtOY4bFzvQYu8Z8zC2niYMMLR/8fOWLsPOhlCkmtymc+Kzsn9Rr3wURB/mr
         8gowqf01e9UhqpNXiAkO+/MBb4Ngc9mf+t4auKeU9gDZ5/VpRe/MGaEhb5HFK044IslP
         Yfa7zqruCKQ9N1nWoDWUFXJHw3g3xPsIEndLi8tZpMo2yyYl5H0vOQDnCYAAwK13v78O
         p0NB//zA+lrZJlKfvgjhVybUTcvsNJWM0L0mGVLBYRILt2mw56UXiJ0HkbbSl3u8zX1c
         5+xI2no6S4CBwSJCsxiT+IkCFqt7p6/4U7If2RxXRinFDbOtRcWx44a2tvF+HE8kdpBs
         Q13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702555413; x=1703160213;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhfy9J/+kZnq5CFoSmeprSeUzufV/Ddo/d13bR8HsPs=;
        b=RF+wjikRnb85HJt2/5TlzfcRlYlSOt3+vQU5R3gN66JPgWjT9Fvx5mBzby3LwwxrCV
         G6pQupAh3yN0HLor/sigiiM+GDKf4Lr0Z/I+HVHnlv+1qPJsSTbq/4jnfVsMQ3d0sGVq
         G+x0mrkRS+yiJXV2n4ul4MYx+rBJ14ql2EviZjawVs+trPmSLQZj8j03NdiP2bHsGVqM
         dnhXgyUZzLJI0jPdH7r+8Ux46IZOBZqyP5GI1oKvSpkDs0zdsTuLYc4Xpi14gJ9YKtOv
         T2kt3igaLzYrqTcsmydSk591cXbQZSgaQbpwwGyuJNJqpelqMgXDjphyX6Gmu9Zx/NEH
         +vxw==
X-Gm-Message-State: AOJu0Yw1mh1GOtQE8sGzxGthXiJ1ulmL3CF6i2TMOsyVLEuHzhAuj7Vx
	1EfnnWIc0Ou/fcrRUTcU3RWrSOwZPhTW0xf1b3I=
X-Google-Smtp-Source: AGHT+IGPkMrx+NDUTVHjuJus/+eIll20qGtt/qjp6MJEGtFVhBapxDH/hZAlCC1IN+NpDi3i0cwefG2mTHLL/GqYB14=
X-Received: by 2002:a2e:bd89:0:b0:2cc:1fa0:272a with SMTP id
 o9-20020a2ebd89000000b002cc1fa0272amr4768689ljq.81.1702555413051; Thu, 14 Dec
 2023 04:03:33 -0800 (PST)
MIME-Version: 1.0
References: <20231213085657.2552223-1-yoann.congal@smile.fr>
 <CANNYZj9mWiEZRf_snYJ0eRcirn746GbkZSekLV3-XVcHjaR6bw@mail.gmail.com> <6cfb111def75c0f1549e7f004deac4e8a44365cf.camel@linuxfoundation.org>
In-Reply-To: <6cfb111def75c0f1549e7f004deac4e8a44365cf.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Dec 2023 13:03:21 +0100
Message-ID: <CANNYZj8iD+LQRz8Sqb=QbYEXd6W_rnXz11pEVmzk9mGFKywfyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] strace: Disable bluetooth support by default
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org, 
	Tim Orling <ticotimo@gmail.com>, Martin Jansa <martin.jansa@gmail.com>, 
	Ross Burton <ross.burton@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 12:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192359

On Thu, 14 Dec 2023 at 10:50, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Once a given build has run through the system, things do run much
> faster but this is basically the performance issue I've been mentioning
> in the weekly status reports. Even the above packageconfig change in
> this patch would actually speed a lot of these up, but you're objecting
> to that.

I no longer object :) the above explanations are fine with me. I did
run the benchmarks though, so for the sake of having a fuller picture:

default poky, core-image-minimal:
5134 tasks
real    26m26.874s

poky with this patch, core-image-minimal
4051 tasks
real    25m53.513s

poky without ptests, core-image-minimal
2997 tasks
real    21m23.684s

> The tests themselves are actually quite valuable as we're way beyond
> the point I can work out which patch will break which features. Some of
> the tests could undoubtedly be improved. If we disable the ptests for
> the selftests, we run the risk of not reusing sstate so a better
> question might be, why are all the tests not reusing sstate more
> efficiently?

Looking at that a-full again, it was abelloni's master-next which had
something that triggered a mass rebuild, e.g. qemux86-64:

Sstate summary: Wanted 8139 Local 2083 Mirrors 0 Missed 6056 Current 0
(25% match, 0% complete)
(and that took over 5 hours to fulfil:
https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/8224
)

My theory is that when all of the builders start at the same time in
that situation, they will all rebuild the same things, and become very
slow and overloaded. Including image builds in selftest as well, as
it's parallelized in itself.

I have a proposal: splitting a-full into stages. First, run the build
steps from qemux86-64 and qemuarm64 (and arm64 on armhost), which
would serve two purposes:

- pre-populate sstate for all the the builders that will run in the
next stage, accelerating them. It's possible some of the builders
would still do full rebuilds, but then it becomes possible to look
separately at why they can't reuse the sstate from the first stage.

- do a quick, lightweight smoke check on the changes under test: if
something breaks the build really badly, it will be caught there and
then, the build will stop, and unneeded AB overload will be avoided.
Which will in turn speed up everything else that's running at the same
time.


Alex

