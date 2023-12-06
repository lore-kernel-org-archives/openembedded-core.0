Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F77C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 09:41:36 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.28057.1701855695246203891
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 01:41:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aJhvJ9K8;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50bf82f4409so722862e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 01:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701855693; x=1702460493; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E2CMAuNxzb7RWv+KkBI5TcoovPD0KOxZwoyT4+YoPhQ=;
        b=aJhvJ9K8PT/EC6zdP5MnHJyAvGBJP+rdGKBdHAWcmcp3jH7KMuYEvunv48T1T46HAB
         a+cbnDDA1Fy2cNiH26YAI9gUZ8Ai2TUqJVOf50qPfbY5o79QqkFOR0UImZASOYKQ78Cq
         gT8mhfEbSe5sJE/KrUly6bmQa2TfyhyMrDKS1hEB/EdeaNrnGajsCgguSyZj/sQ2mfrX
         7BOjA6emWbjrhO/aPXW+XYEUJilcymxAYGbVZSHN+mFuiT8+KrEHEhW8i5jj6aZAggoy
         lEabx74xypvOcLGW8Bx6NQiSSxdxBg5y5oLDfThEAPFTzYD664guUiAspYrcS4cQU3NM
         S+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701855693; x=1702460493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2CMAuNxzb7RWv+KkBI5TcoovPD0KOxZwoyT4+YoPhQ=;
        b=mVmimjBdXYU3k1FqxpWZAPsVN8AO1lqrNMREQUTDkK76MSlJ/OhNDjEFRpaojDYj6T
         yYljb5f/DDNghBP43CB+/V06qwQ1f6iTlT5Y1aeUUd0xw5I/htiv6M3tMVnLATmAJi6L
         x0VY7k4ILIgRWkny25gReFJDLKH8+4CrSJXGJCWO1Z27LI7AP8o90/6uMx70Rj8O4AqR
         4qGiLhaspGi4h4SFmxO0WScTAJvSvu3mOzO9Jz5WnSPWpIunNJNBpAxtmjZg2s1fU+fs
         rq7ByW/anme0n9ENE0oglQfjWRemtYZLoSTYoE/CxKpskwk2bpMmJ4WiLaBC08H/NHPy
         6bzA==
X-Gm-Message-State: AOJu0YxxiHGN+G3lccrMMF1UyF3z8JVZNnfjfk75J837qkTOl/CRIDCj
	C0JFrlw7ZjI6z07YGX1Au7WF8wDH6oLcPzqL+5c=
X-Google-Smtp-Source: AGHT+IEjRa+bWpxogMujh3lwCKn+U+zalg4HX6qpKz/OUss3eKSgd0/tt3+S+XJ/2LBfDZ0wmldeJdJ9a98qLoZZOuw=
X-Received: by 2002:a05:6512:2203:b0:50b:f88d:f848 with SMTP id
 h3-20020a056512220300b0050bf88df848mr2108104lfu.23.1701855693162; Wed, 06 Dec
 2023 01:41:33 -0800 (PST)
MIME-Version: 1.0
References: <20230630091451.3331563-1-changqing.li@windriver.com>
 <20230630091451.3331563-2-changqing.li@windriver.com> <CANNYZj-6GkQ-udC+Nd0zyQbwKtkfrr0hNKZ-AaMEUzgnTCNT1A@mail.gmail.com>
 <328B87A9-2B41-4B96-ACBE-C84E3575E1FC@arm.com> <9ef53c61-7238-f500-ba98-dab28b7fff12@windriver.com>
 <CANNYZj-jeX1Km0BYSS0HYDAeC+Fckmw0QA2u41iqA2PTmjuy6w@mail.gmail.com>
 <07dd26ce-3ffc-4799-9d6e-0d910477622e@windriver.com> <CANNYZj-L-fycO7KaV_zM9QXnkOwKpC_7-UEsioqbSuroA=CQ4Q@mail.gmail.com>
 <f997b989-a4f5-4691-a94b-625afdcf0936@windriver.com>
In-Reply-To: <f997b989-a4f5-4691-a94b-625afdcf0936@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Dec 2023 10:41:21 +0100
Message-ID: <CANNYZj9JjMv8jFvRzZD83KVvuS_bLchhSAb09A+MCNnerhYRxw@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH 2/2] rootfs-postcommands.bbclass: add
 post func remove_unused_dnf_log_lock
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 09:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191880

On Wed, 6 Dec 2023 at 03:39, Changqing Li
<changqing.li@eng.windriver.com> wrote:
> The review comments that led to the revert are still valid, and this
> message does not address them. The concern was that the removal via
> rootfs postprocess is too late. If dnf leaves lock files around, they
> should be removed just after the dnf execution.
> Thanks.  Agree that the lock file should be removed after dnf execution.   This is a bug of dnf. I had raise a bug upstream in Jul:
>
> https://github.com/rpm-software-management/dnf/issues/1963.

Looks like it's not something upstream is going to fix quickly - low
priority, no comments.

> This patch more like an workaround before dnf fix this issue, and this log_lock.pid in rootfs
>
> has no function impact, just a dirty file in rootfs.

If you can rework the patch so that the stale files are removed
immediately after running dnf, I think no one is going to object. The
location is somewhere in meta/lib/oe/package_manager/rpm/.

Alex

