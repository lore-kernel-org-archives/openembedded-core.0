Return-Path: <alban.moizan@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21E5D38FF1
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 17:05:26 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15292.1768410319770087148
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 09:05:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vj5tcmPO;
 spf=pass (domain: smile.fr, ip: 209.85.218.51, mailfrom: alban.moizan@smile.fr)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b876bf5277dso117404066b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 09:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768410318; x=1769015118; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jY8iqDxsW74Tg1rhYhTTQulJQNMlqr0hzVsXgpn2f8I=;
        b=vj5tcmPOgCLCrEEYdotN4YOlh17rdZUBpi+xho15sBk3ZBnGHLJU3Mmpx7zQZM7h65
         or97u1ICGhku6Q5TYoyGil3rMvBD8vWaQvObGvTt+GmteH35/G8KMnnB/+E+9y+o72ZB
         880JNtn9bbwNR8nU+QCsEpwIPbIMsFUQWxElo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768410318; x=1769015118;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jY8iqDxsW74Tg1rhYhTTQulJQNMlqr0hzVsXgpn2f8I=;
        b=NBLOPC6ijWRVo9FELDIwOnC1XwSVBGYssXS6jHajww5MOr+2Uwcm4LP1Jv7IVdp3GT
         rdOcN9SFeefiFLtEiyCRrjcKDbcZbH1Wj2XMkM+ldHkxKu5nFdoUHw38Zl3f0YG5Q37C
         8LRSEPW2mw1bZZLB3zMQBP+tA/p9qsPtI1+0BVXNM06OKAYOGsTnZtn9CVVNeDiqMWD5
         pxDuGdLdDfUZAy3yavy8htGRjITZKLesqGwHsLKg/YoD+E0LfZWgmLQdA70FW7/zLtHq
         XttSRS8SgL9ehf0UfXwhHGgXC0vNCQ1U5u3dACTiWYuIMQFOcWEBUfaObcybxolelSgU
         23EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD//rrhX8bNJ5dgAal3dzIWaLd2fKjppM+pt5xrZpe9YO51ueotnoMw9mOaBEfXRxQG5QuAJcfQL6sNkLc7W7e8g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YybzuXDT0Vd+j6JXCPFpf3GgqIga3K37mCcnYEpoHnkLrYw9D0/
	wFIWf226KxAOTcIbnwDNuPgiSyowovqC6gw63ymr33Ig1iserLFshTRNxsaC93mjdiZ8wMt+km3
	86qAQDHeGhMnUxeazF1nIRug6f1g7tfloMlSSiM3yyw==
X-Gm-Gg: AY/fxX4YzQuaOaaZnSInlGGRnmUqTwM6aYFbWpBbnB8aEtY+KfmRigV+LCxMoBKjEZ0
	w8hSP3p+oaAQy8p7e+qSxKoR2EabBfsKjReqgBbh1Jgm3LFbSVWPrpvZJDrDFqEAFH/B+IJKdhn
	8Bom2/9LOS6DFnIsAOsR1oM5jHiFE1OfX2EtrUnWdAENKPSzZZvFqifXFQlwy4/oFOwDyBqovjX
	23IoAwRkaLTUh4pKtCqJuCUNk8y1nJToNY1rXnfKShZtDan+Wwp/umpLtL/aaVLa9yRNRwHhw==
X-Received: by 2002:a17:907:7f93:b0:b87:6b9a:3011 with SMTP id
 a640c23a62f3a-b8777c3311amr8913566b.27.1768410318108; Wed, 14 Jan 2026
 09:05:18 -0800 (PST)
MIME-Version: 1.0
References: <CA+TGqK9Yd2WWKrhMkhofF-8N0cESCSefWD2DXr4sBO9fDQXyrg@mail.gmail.com>
 <CADkTA4P_8ScPBxuou2Jn7Jphk5ZCr9vWbsd7CPQHuGe8B=bd3w@mail.gmail.com>
In-Reply-To: <CADkTA4P_8ScPBxuou2Jn7Jphk5ZCr9vWbsd7CPQHuGe8B=bd3w@mail.gmail.com>
From: Alban MOIZAN <alban.moizan@smile.fr>
Date: Wed, 14 Jan 2026 18:05:07 +0100
X-Gm-Features: AZwV_QgKtRS2ekUVtTrAW2zO4pFI9_RHWJ_LU3w74vsMSkRxnKXlpP_93Zt8duQ
Message-ID: <CA+TGqK8PvL+Y9Paj2eQZKBLt7xhL2q+d_P39UByaxEmaPXFw2A@mail.gmail.com>
Subject: Re: [PATCH v2 08/15] kernel-yocto.bbclass: Disable ccache when
 rust-kernel is enabled
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: harish.sadineni@windriver.com, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, El mehdi YOUNES <elmehdi.younes@smile.fr>, 
	openembedded-core@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 17:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229354

Hi,

> No wrappers around the compilers. In my experience, wrapping an executable
> to manipulate the parameters just causes to many issues with observability
> and debug issues. So that rules out option #3 IMHO.

Understandable, I remove this one.

> Honestly, I just lean towards #5 while the handling is worked out upstream
> between the tools.  I don't use ccache, and don't have the impression that
> it is in widespread use .. but with the right amount of data, I could
> be convinced
> I'm wrong on that.

I mean, it is not only a ccache issue, it is for possible future (or
existing like `sccache`) other tools, the issue make any
`CC="<my-wrapper-tool> <my-compiler>"` incompatible with a kernel
built with rust for now.

> That being said, I'd also add:  Don't worry about enabling ALL kernels while
> working through the enablement. By that, I mean if there's a simple
> kernel patch,
> I could carry it on linux-yocto while upstream work is happening, and we could
> confirm no ccache issues there.  The patch could also be taken by other kernel
> maintainers that want it for their configuration, but we wouldn't have
> to do much
> else on that front.

Then I will try do give you a patch soon.

> I haven't gone and looked at any code, but isn't it just simpler to
> filter ccache
> out in the kernel Makefile's themselves before any rust invocations ? I assume
> that is inherent in your option 1/2, but the comment about needing to patch
> rustc as well has me wondering.

Filter out on the kernel is my proposed solution 4

> > 4. Kernel only: Patch the kernel Makefile to filter out `ccache` from CC (works in practice but not generic for a possible other wrapper in the future).

While technically working, it is still not compatible with
`CC="<my-wrapper-tool> <my-compiler>"` things more generically.

In fact, as I said on my Trial 1, since rustc `-Clinker` only accepts
Paths (or things in $PATH), you can only mitigate the ccache issue,
but not the overall issue, without patching rustc.

I can try to send a patch to rust with my proposed solution 1 and see
what append on their side.

> Bruce

Thank you for responding,

Alban

