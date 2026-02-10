Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5889EEA812F
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 15:25:05 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22049.1770737100743762969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 07:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=E1Nm/Trm;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-482f2599980so10735205e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 07:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770737099; x=1771341899; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSFQ0PjHwJlHoG+AzFOschwjzeOvpepGlXjSZFnhBs8=;
        b=E1Nm/Trm6EvnOGXTUUTq7imgTtFCfm5MMAQWD2/RF+W2eGMOedLEGhRuKO+2/JcYc7
         au+m/JUh1K9zP9gS3leIIhiNrNk8BlvSXkpLXbAnJbCz+1lhzurYGHVfBRNNh7UI3H4s
         LBWrU/8J9EwDo7azOmF0UBPszVC/4sZAyu3PI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770737099; x=1771341899;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BSFQ0PjHwJlHoG+AzFOschwjzeOvpepGlXjSZFnhBs8=;
        b=SjJtdyVRh0Qmr7uVUjxQAJtnzvkPyOLPefls9ir2MiYi7Ate16XHwOvWMN/zJd1SeO
         e2wSZ9vOZ2O9xlwQuoLdwUFaMTZTRToZgZ2xZL7Rhu/nE3wcFl/mjc7gKUTmMwyWXem2
         mnA8nocmrPnBxtT1n5H2L9DX+cleeomkIMeyCJrkr6wr99iF/MazayjPh+TPOuHXsJoO
         Sj5gyY9TaxipYjXkiNjGCfDShapilweZwHLYDJu3Pc+9iycKuCruhYZJN1fxpP0q5/Uf
         oFt+r285tjmnOlcxrODMl0RFJCxVngBHTGXa7NpL4Tf5MUCdeXsKiAsIcINt/ovQNIQO
         OorQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYDkEx2v8a+wjdtJ//Pnu8PcuEheTCzd7Th8HvUeUOruQHdHbiFYq6nc6sKlYPhVcDeAkRwutT3ws4ZQovNS8n9A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxzB7pIZdU2i3hbogy/hLMi7uXzqyKq6LrB1uuj1aDv68XCv9mu
	7JEtC5wHycBdwMaFxnuqXuRbLiYZNHqZNrPFQxrWFRfEGddcHI3BjCuu7gf7eOZ08jc=
X-Gm-Gg: AZuq6aLLHbYxo9VDxxav6GJEvq7+LxCzDrv3tvFr4IC3N0+5TOV8wc5fZFcF5hIdsqy
	e5nWIEE74B5CBtYq2ha4yw9KrsBF0e90hluIGXsTtseD491Zh7DbABcRjpHYhwQn7mfps4QdFpm
	3V7Ci24RkpEKdATxN+rrMzotd30ezAAruMW7qPDxWMs/MKFTJZHIOuIXQi5APbI0SEBkZZqlIKr
	dUtWf/27KQ0emzrIIucRdoRjjuKzYgH8zIw3J+RdZFxVs31tuuj2KpL85O9V5rXBK4+xBwqOdqk
	Yda+g9pIscs0Qv3YBYWIrybj4EC7CaFjDe0cy5Uff+6F2jvluRP3QLWPKzUQ3Z06eGGndaeBJEO
	Bd8ge3BA6RzbwYELqCAN6+Uqu0F4D5aEfLBPWfLFUmu+eYY49zMHEjHHfxiXigX1Sfh3TVlxi6+
	3t7OqumzRVpTTX0cvgBnZmkgSOq+2eMJR/clDvj1mJqf5J5rlx664qoITYp+DXrmspWoI8cha7H
	Ms0n4tvoCeukoGPKUeKQHkOOl4=
X-Received: by 2002:a05:600c:8719:b0:482:eec4:76d with SMTP id 5b1f17b1804b1-4832021b461mr241604685e9.17.1770737099063;
        Tue, 10 Feb 2026 07:24:59 -0800 (PST)
Received: from localhost (2a01cb001331aa00c483744cb4924df7.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:c483:744c:b492:4df7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320978108sm174508275e9.7.2026.02.10.07.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 07:24:58 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 16:24:58 +0100
Message-Id: <DGBDWWXW2P0E.29TSC8ICL6TPO@smile.fr>
Subject: Re: [OE-core] [PATCH v5 07/15] kernel-yocto.bbclass: Disable ccache
 when rust-kernel is enabled
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Paul Barker" <paul@pbarker.dev>, <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>, <Randy.MacLeod@windriver.com>,
 <Sundeep.Kokkonda@windriver.com>, <alistair.francis@wdc.com>,
 <bruce.ashfield@gmail.com>, <elmehdi.younes@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.20.0
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
 <20260129163910.2612040-8-Harish.Sadineni@windriver.com>
 <8a9cf281b36ede03135fb042e260d22785ed4f38.camel@pbarker.dev>
 <DG66GUA3GH4D.31PC9MVWLCK32@smile.fr>
 <1cd94533d438ad4e689da8636bae06859778ef29.camel@linuxfoundation.org>
 <CAMSfU+4dKa6adoEtKSWp7Q-ZhT9L4ohtbruSZZPeb1_SxkpHEA@mail.gmail.com>
In-Reply-To: <CAMSfU+4dKa6adoEtKSWp7Q-ZhT9L4ohtbruSZZPeb1_SxkpHEA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 15:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230910

On Wed Feb 4, 2026 at 2:07 PM CET, Yoann Congal wrote:
> Le mer. 4 f=C3=A9vr. 2026 =C3=A0 13:34, Richard Purdie <
> richard.purdie@linuxfoundation.org> a =C3=A9crit :
>
>> On Wed, 2026-02-04 at 13:31 +0100, Yoann Congal wrote:
>> > On Wed Feb 4, 2026 at 1:05 PM CET, Paul Barker wrote:
>> > > On Thu, 2026-01-29 at 08:39 -0800, Sadineni, Harish via
>> > > lists.openembedded.org wrote:
>> > > > From: Yoann Congal <yoann.congal@smile.fr>
>> > > >
>> > > > Currently, a ccache enabled build fails with:
>> > > >   |   HOSTRUSTC scripts/generate_rust_target
>> > > >   |   HOSTCC  scripts/kallsyms
>> > > >   |   HOSTCC  scripts/sorttable
>> > > >   |   HOSTCC  scripts/asn1_compiler
>> > > >   |   TOUCH   include/generated/gcc-plugins.h
>> > > >   |   DESCEND objtool
>> > > >   | error: multiple input filenames provided (first two filenames
>> are gcc and
>> > > >
>> .../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_targe=
t.rs)
>> > > >
>> > > > when using ccache, value of "HOSTCC=3Dcache gcc" when this value i=
s
>> passing
>> > > > to rustc, It is thinking gcc is a input file. when ccache is not
>> used "HOSTCC=3Dgcc" is passed.
>> > > >
>> > > > Disable ccache for kernel build if rust-kernel is enabled to
>> workaround
>> > > > this.
>> > > >
>> > > > Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
>> > > > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> > > > Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>> > >
>> > > This patch is good, but we should try to get the issue resolved
>> upstream
>> > > if we can so that ccache can be used.
>> > >
>> > > Has this been reported upstream yet? Could you also open a bug in ou=
r
>> > > bugzilla to track this?
>> >
>> > Hello,
>> >
>> > For context, a lengthy discussion happened on this patch here:
>> >
>> https://lore.kernel.org/openembedded-core/CA+TGqK9Yd2WWKrhMkhofF-8N0cESC=
SefWD2DXr4sBO9fDQXyrg@mail.gmail.com/t/#u
>> >
>> > And, sadly, we lack resources at the moment on our side to follow-up o=
n
>> this :-/
>>
>> Putting some links alongside this to more details would probably at
>> least help a bit, particularly if ccache upstream documents it is
>> imcompatible with rust...
>>
>
> Ok, I'll send a more documented patch to Harish for him to integrate in h=
is
> next iteration.

I pushed a branch on contrib (v5 + this commit modified)
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dycongal/ker=
nel-rust

The modified commit is:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dycongal/=
kernel-rust&id=3D794bdad82933ee112452c8c08c917cf235e07ada

Harish, are you OK taking this for your next iteration?

Regards,
--=20
Yoann Congal
Smile ECS


