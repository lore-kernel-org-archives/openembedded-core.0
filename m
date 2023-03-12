Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7E7C6FD19
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 13:36:13 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.66573.1678628172648073233
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Mar 2023 06:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XXqTAt+x;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id j3so6265639wms.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 06:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678628171;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qwffIZarDWjaWv6+O6qxEPH1Gip9LyCEXQ8MjydKLpA=;
        b=XXqTAt+xL1p/BqySEl+799dI1NUnO/lCb3j21alfchvs9Pd/lAQdsqFtE8VBcwjT/x
         yaGsQ6poEzoob4Qyjrjte9s0+JyMAIK+x9zywIx5CFWCGa94r5SXDrC6fU+mfFkFaKrY
         Yuuib7Ggeqx5lotqVI6PLP/hzD25x2wsr0Vcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678628171;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qwffIZarDWjaWv6+O6qxEPH1Gip9LyCEXQ8MjydKLpA=;
        b=7kmQ8A5mWOtXks7oIzZD4bmEvayvxS8/Y7HI2mEfK4Ad229BE81DK2R4/7M5W+Kkx3
         86evdXTyy2YPvvnrQYYNQa8bvOzhy1oc3o2gkINy2+n9rgzxlruMS1xa0P31GvhcAgzr
         xoW4bHGv09CWuK2HepA26hS++Eo9jjoOHWrj+iP5EO2TC7Adf16Cy7+rjELQ32noWvnV
         QME6HrpKeBcA8N+iBl9qJPx9ovEiXH79WcYpfeXQFdx0R4uV+hktRdJ/gBNQigq2Kew6
         qQ7GYHLZxBKoBalbuht/J/3I/k527ChBoIqcNFMVydnHDSgVOV0dHxlABAqk7YJNpp6X
         GoLw==
X-Gm-Message-State: AO0yUKW0aFEzQb9MtymmV3iOglk4NFNf76QMhbeoUugNDmIYfEuwLWVq
	nnEtyCdNK/1Tkn5z7MFM4QMtUw==
X-Google-Smtp-Source: AK7set9vf81bs87Y4kq3yvAHffJjIixoN3b82OcpQG2uCEeW/P72QyRPQezXyNph52AebFy41YAm7A==
X-Received: by 2002:a05:600c:34c4:b0:3eb:3998:8bca with SMTP id d4-20020a05600c34c400b003eb39988bcamr5361029wmq.17.1678628171073;
        Sun, 12 Mar 2023 06:36:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ee:6264:1be3:a6af? ([2001:8b0:aba:5f3c:ee:6264:1be3:a6af])
        by smtp.gmail.com with ESMTPSA id q11-20020a05600c46cb00b003ebf73acf9asm7610021wmo.3.2023.03.12.06.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:36:10 -0700 (PDT)
Message-ID: <9a9b7f6a7c20720803b574c0b39957eed1e7019e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 7/8] core-image-ptest: Switch to BBCLASSEXTEND
 parallel execution
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 12 Mar 2023 13:36:09 +0000
In-Reply-To: <CANNYZj9iktYo1a=+0zZTwnW1PqucFE9FJMrZaLj4ktEz88VCzQ@mail.gmail.com>
References: <20230311224155.3442306-1-richard.purdie@linuxfoundation.org>
	 <20230311224155.3442306-7-richard.purdie@linuxfoundation.org>
	 <CANNYZj9iktYo1a=+0zZTwnW1PqucFE9FJMrZaLj4ktEz88VCzQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 13:36:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178387

On Sun, 2023-03-12 at 14:17 +0100, Alexander Kanavin wrote:
> Nice! Is there some other low(ish) hanging fruit for making a-full faster=
?
>=20
> (one thing that springs to mind is more arm hardware; the one
> available seems overloaded)

I suspect it isn't arm hardware that is the bottleneck. I have some
patches locally to split up the oe-selftest sstate tests which is one
easy improvement.

The next would be to have reproducible builds reuse rust-native from
sstate. We don't test reproducibility of native recipes anyway.

After that, it would be looking at the toolchain tests, i.e. this step
in qemu machine builds:

https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/6780/step=
s/19/logs/stdio

from the command:

oe-selftest -a -t machine -t toolchain-user -j 15

That step takes a couple of hours which is 2/3rds of the time of that
target. I was thinking it could be parallelised but I notice we already
did that! Maybe we should move it to a separate target so it is in
parallel with everything else?

Cheers,

Richard









