Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0815FC4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 22:39:15 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.3661.1667947149929842643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 14:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B9zqnJju;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id t1so9692323wmi.4
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 14:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g+1+RBc7drDIGadqdUOHv9p8/Kqb4b5mcirPxC3DPGs=;
        b=B9zqnJjua0buhrMbZr9aZ/RShE3o6TlOvNA3H8LrMyY4m9ASUMArRm+G7VB/oMNeTJ
         3Nll8tLpM+oozATp7DG+JD2lHlBJDykK3zBPuX/6V6DV2gLgBmhl+5Fpeb7e7D+HXoOs
         dYfgnPNnnN4nopdbosMfJnIedacid0Er2AIvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+1+RBc7drDIGadqdUOHv9p8/Kqb4b5mcirPxC3DPGs=;
        b=JuM2A7OXHXrYY52z5KG5LrAeKZOYvkslhLURfE/NDGlfnLSJhX1oncdemZbS9eG1kv
         3ktJ7BLh7+oQLXgaBVQLFkIBoVkB82vXiCXJHYpI1e9MekkzpA0gJhP4LGXnjIpGIFVf
         GsxwHsNww3/HtJNDbjs80WFQLpojrmRNnRoo4Y8p4Ge7JEQ5rmXwCJlPmHnAXbwfwIPe
         YtreCshBAr4aEC8fgFBT6ddVdLYJv3qP4S322iSMwAjnnxx5G3IKp5DBoXiYanqJMDxi
         s/JZOfPupR2ClAiqNQ0m+TJKWZOwzl3JUUg1bGfuHWekdcKUw/vYQB7iYlRtnLKPrm5m
         grQQ==
X-Gm-Message-State: ACrzQf2ups6CXgDFkNd3Hfzpw0iqOu7Ameu3s8BpPCnK949SnbBwAvQD
	XkTYv7fq9o6a5IjhNLdlXNb5yg==
X-Google-Smtp-Source: AMsMyM6p79Z2AAKXldpYlV/EgsRg0yP7WTXs6cxb1RbMk37AcJkz91PnExQZc0bP3Nx4Vu32reAfNA==
X-Received: by 2002:a05:600c:554b:b0:3cf:84ea:3097 with SMTP id iz11-20020a05600c554b00b003cf84ea3097mr24971074wmb.100.1667947148267;
        Tue, 08 Nov 2022 14:39:08 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e2d0:9d94:505c:5899? ([2001:8b0:aba:5f3c:e2d0:9d94:505c:5899])
        by smtp.gmail.com with ESMTPSA id j5-20020adfe505000000b0023c8026841csm11830582wrm.23.2022.11.08.14.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 14:39:07 -0800 (PST)
Message-ID: <628329b7511560a532a20a6b5e5edfccf613dc9f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] systemd: Fix 252 release build on musl
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Luca Boccassi <luca.boccassi@microsoft.com>
Date: Tue, 08 Nov 2022 22:39:05 +0000
In-Reply-To: <20221108215544.815033-1-raj.khem@gmail.com>
References: <20221108215544.815033-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 22:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173002

On Tue, 2022-11-08 at 13:55 -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v2: Replace the utmp patch with an upstream backport
>=20
>  .../0001-Adjust-for-musl-headers.patch        |  84 +---------
>  ....c-Use-net-if.h-for-getting-IFF_LOOP.patch |  27 +++
>  ...trerror-is-assumed-to-be-GNU-specifi.patch |  42 +++++
>  ...-test-utmp.c-only-if-UTMP-is-enabled.patch |  44 +++++
>  .../0002-Add-sys-stat.h-for-S_IFDIR.patch     |   4 +-
>  ...k-parse_printf_format-implementation.patch |  22 +--
>  ...missing.h-check-for-missing-strndupa.patch | 158 ++----------------
>  ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |  29 ++--
>  ...10-Use-uintmax_t-for-handling-rlim_t.patch |  14 +-
>  ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  14 +-
>  ...patible-basename-for-non-glibc-syste.patch |   8 +-
>  ...uffering-when-writing-to-oom_score_a.patch |   4 +-
>  ...compliant-strerror_r-from-GNU-specif.patch |  22 ++-
>  ...-not-disable-buffer-in-writing-files.patch | 100 ++++-------
>  .../systemd/0026-Handle-missing-gshadow.patch |  14 +-
>  meta/recipes-core/systemd/systemd_252.bb      |   5 +-
>  .../btrfs-tools/btrfs-tools_6.0.bb            |   3 +
>  .../recipes-multimedia/alsa/alsa-lib_1.2.8.bb |   2 +

Should a systemd fix be patching alsa-lib or btrfs-tools for large file
support? :)

Cheers,

Richard

