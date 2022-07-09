Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB35C43334
	for <webhook@archiver.kernel.org>; Sat,  9 Jul 2022 13:14:36 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.6155.1657372467508843848
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Jul 2022 06:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hwaSg6ix;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f42.google.com with SMTP id u12so1864488eja.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Jul 2022 06:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=HFfm2dZQ2v0a8eAJImvSsaxDEFZudCbGv/QelWWj3ac=;
        b=hwaSg6ixuEEXmO1fpS0jUsZ5Zme6dqCCXHLPb2HksadOX3ih7Nlyauk5cjR5Ik/j8F
         qqixo389C5KZfTFY3YpYKIQgcza/qcU9EBkiZ96DP3SvkyyhFLVDoFM3sqelLyJCusRM
         XemzDg/yvI1kXrlj1i93t0X8PPxD6VSTppOX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=HFfm2dZQ2v0a8eAJImvSsaxDEFZudCbGv/QelWWj3ac=;
        b=ZyXUyJiK5cH+mSHgVXSro7GoZHOYQNI4ZMraci5wkhpUs2p9jQahwJHMVqacBFM+u1
         PgZ6yjjo1BhwQ4PrAmbWO2Awl7wFIbBuD3ik3WY222/F0AKhrewXe/YhhzKEe43GQGmy
         8OvB6LY1+yUssmmrw3zF9kbuZEGFCfTemEGyLQHZOinZVxyUqh10Im1+j2hg5fg+lUhC
         R/VZS3389fOr3KEbkLvoN2aSA7CAibRykzk1aVxyMPJwx80/ek9Cvhd7H9IOIfBWWGcD
         k1ldD/2l37Av6j+tm2iEeNbIYuAOar2iWhBmW7dJl4PkqhjPr6SFjCW0D/ebf+EAgflg
         VNQQ==
X-Gm-Message-State: AJIora/zdgP7LffQx+J+Q5WIXKcKH8NL/wlr7Y0u0M7qpCmEhrbODyZw
	7BYiyVncbYyGMbGRz/Kk9iaf6Q==
X-Google-Smtp-Source: 
 AGRyM1tkBBMMMg9kSiq3Av5dRtv9ygGfp0Iw7/KPjAUGFG70lqdzzw4ra+okFGIliQ7i8JMoRIi/EA==
X-Received: by 2002:a17:907:d16:b0:726:a3bf:121d with SMTP id
 gn22-20020a1709070d1600b00726a3bf121dmr8822241ejc.390.1657372465851;
        Sat, 09 Jul 2022 06:14:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a5a8:564c:c2df:f45c?
 ([2001:8b0:aba:5f3c:a5a8:564c:c2df:f45c])
        by smtp.gmail.com with ESMTPSA id
 la9-20020a170907780900b00727c6da57cesm597840ejc.147.2022.07.09.06.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jul 2022 06:14:24 -0700 (PDT)
Message-ID: 
 <c817c9f437c1003e63a2cd462b459bed21b39ace.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] rust-common: Fix use of target
 definitions for SDK generation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
Date: Sat, 09 Jul 2022 14:14:22 +0100
In-Reply-To: <20220707171904.338441-1-otavio@ossystems.com.br>
References: <20220707171904.338441-1-otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Jul 2022 13:14:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167838

On Thu, 2022-07-07 at 14:19 -0300, Otavio Salvador wrote:
> We need full target passed for build so we changed the
> rust-cross-canadian to use same code used in regular rust recipes and
> added support to use specific llvm-target for the building host.
>=20
> Fixes: ef566af964 ("rust: fix issue building cross-canadian tools for aar=
ch64 on x86_64")
> Fixes: bd36593ba3 ("rust-common: Drop LLVM_TARGET and simplify")
> Fixes: 8ed000debb ("rust-common: Fix for target definitions returning 'No=
neType' for arm")
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>=20
>  meta/recipes-devtools/rust/rust-common.inc    | 21 ++++++++++++------
>  .../rust/rust-cross-canadian-common.inc       | 22 ++++++++++++++++---
>  2 files changed, 33 insertions(+), 10 deletions(-)

I ran these through the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3809/step=
s/14/logs/stdio

seems there is some syntax that recent python doesn't like. I do need
to look at the patches in more detail but wanted to share the
autobuilder results.

Cheers,

Richard


