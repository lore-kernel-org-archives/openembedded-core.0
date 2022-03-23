Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BB2C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 16:12:05 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web08.84.1648051924915451807
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 09:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Wt91jaGe;
 spf=pass (domain: linaro.org, ip: 209.85.222.46,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-ua1-f46.google.com with SMTP id 34so877354uao.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 09:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6bV1aYjDa5NnuLE30BIr+7H1S9aXNnxd49d2vceepgI=;
        b=Wt91jaGeQJ/3arVdfoXVgFFQ0ZB2QMM9CA7r2P1ALJ5GjiBsrZPS8F3iS5RMZzfMjq
         +cI6DpyrNWjPo4Ut5DdfDutAMwaa5HcQyTmQvG0CtO5CTRX4MSusIcWZotaNTgoUHOuJ
         8SEL1k5Fmrzrk2542E1VoiB4ICa5nlFAl4BJFD72SCxra/sHlZwTc083kGDS5RgNgpCr
         x423kV1zcehmFBcylcyG0iMqcbgYq3rlV3YwrhKoqQd7MI9o/j7zV8Cv9CxpWlWAL12h
         HxecDrkZy7g91pSqmRKCJs4qBKB/JtMJHpTlrrY9IiSEaXRaGIt6GvmyltqyCbAydwIW
         xqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6bV1aYjDa5NnuLE30BIr+7H1S9aXNnxd49d2vceepgI=;
        b=BmOf1QAms2XecISu2WXNL3hBJTQDDeHF6jRUZcGYVlVZ0FCEIX+miKUhQlim4tGPJp
         IfkaTHTN9/CbjSU00Ll3OjetNt+bF6KFwrAm2W7ivXi5Ywz68ztfNhRDqoF7J5m6qXOI
         T/ASfvvfxKG58ea8tKl+ZUYRAvOFbtn7FnbLLcMGkRvxDgFmwefE337tTvb98KQY5d6T
         RIdeH/BgdIhXD0ndLCf5fLHj7sNIu3qT6L4znQ7QHWQ+Mh/cYt/rNOW3KfdZDegdL47W
         Y6YZ//OumqjOImFxo00IUOF8Lr5GYfSS8Fx1i5FysE58Se6lCwJwycnRzbnPLJstX5Tw
         kZ4w==
X-Gm-Message-State: AOAM531sa/DA90tE1oqyuxkKo7YE27OKUH2cufl2+/LdUoC2jeGP1dtP
	aV6o9yVN54XYHnzbIe+DuDgYu/zpkDA/whqMzSXiEA==
X-Google-Smtp-Source: 
 ABdhPJxlcQ/R/A9d8QxeqNRL38gRf+JA8XCwTdaqiYWaYd5qLacHN4Q2F1r+3hmJKOc+EofyRl948+EVes+RapNKfvk=
X-Received: by 2002:ab0:14cb:0:b0:359:5f32:4b0e with SMTP id
 f11-20020ab014cb000000b003595f324b0emr288250uae.41.1648051923796; Wed, 23 Mar
 2022 09:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220319192555.1118739-1-richard.purdie@linuxfoundation.org>
 <CAApg2=Qf4dLOJtW4TEjScSNuEOYrB5Gvc+ooxBZ3vcLH27Ku=Q@mail.gmail.com>
In-Reply-To: 
 <CAApg2=Qf4dLOJtW4TEjScSNuEOYrB5Gvc+ooxBZ3vcLH27Ku=Q@mail.gmail.com>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Wed, 23 Mar 2022 12:11:52 -0400
Message-ID: 
 <CANp-EDbF=NrJSZC0+GTisxNNvaJOSRV8=gBKTt8QN3Bz-1uKfQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] kernel: Add kernel-cve-tool support to help
 monitor kernel CVEs
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 16:12:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163587

On Sat, Mar 19, 2022 at 8:26 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Posted as an RFC to see what people think of this. I make no claims
> on how useful it is/isn't but wanted to show integration isn't difficult
> and provide some inspiration for ideas.
>
> Details on the tool in question: https://github.com/madisongh/kernel-cve-tool
>
> I've ignored the NO-FIXES-AVILABLE and PATCHED-CVES files.

I was not aware of this particular tool, but it uses data from
https://github.com/nluedtke/linux_kernel_cves (which is also used for
www.linuxkernelcves.com).

I have been using this data source for several years. I find it
particularly useful for analysing the LTS kernel branches, because the
NVD database really does not capture [1] the efforts that go into
back-porting the fixes. It takes quite a bit of effort to figure out
which CVEs are addressed in which commit, and then to determine if the
commit is applicable to LTS branches, and whether it has been applied.
The ww.linuxkernelcves.com largely automates this problem, and I've
spot-checked quite a few of its results, and found them to be correct.
The project typically updates every week or so.

So, I for one would welcome a way to include this in the yocto build,
as I am currently doing this manually with post-processing.
As the others replies have indicated, the phrasing of "consider
cherry-pick" is probably not ideal.
Ideally, the output would be formatted the same as the existing
cve-check tool, although a simple list of applicable/unpatched CVEs
would also suffice.
I just got it working against my dunfell branch, so I will do a bit of
experimentation...

Regards,
Ralph

[1] This might change in the upcoming NVD JSON 5.0 format, which now
allows using git hashes to describe the status of multiple branches.
Though it remains to be seen if these new features will actually get
used.

